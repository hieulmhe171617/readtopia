/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Author;

/**
 *
 * @author 84338
 */
public class AuthorDAO extends DBContext {

    public List<Author> getAllAuthor() {
        List<Author> list = new ArrayList();
        String sql = "select * from Author";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author(rs.getInt("id"), rs.getString("name"), rs.getInt("birthYear"),
                        rs.getString("descript"), rs.getString("award"), rs.getString("image"), rs.getString("country"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String AuthorhasMostFollow() {

        String sql = "select a.id, a.[name], count(fa.username) as [numfollow] from FollowAuthor fa, Author a\n"
                + "where fa.authorId = a.id\n"
                + "group by a.id, a.[name]\n"
                + "order by numfollow desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id") + ": " + rs.getString("name") +
                        " - " + rs.getInt("numfollow") + " follower";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Author> getAllAuthorByAlphabet() {
        List<Author> list = new ArrayList();
        String sql = "select * from Author order by [name] asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author(rs.getInt("id"), rs.getString("name"), rs.getInt("birthYear"),
                        rs.getString("descript"), rs.getString("award"), rs.getString("image"), rs.getString("country"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Author getAuthorById(int id) {
        String sql = "select * from Author where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Author> getAuthorByOrder(String order) {
        String sql = "select * from Author ";
        List<Author> list = new ArrayList<>();
        if (order.equals("1")) {
            sql += " order by name asc";
        } else if (order.equals("2")) {
            sql += " order by birthYear desc";
        } else {
            sql += " order by country asc";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                list.add(a);

            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Author> getAuthorBySearchWords(String word) {
        String sql = "select * from Author where name like '%" + word + "%' or "
                + " descript like '%" + word + "%' "
                + " or award like '%" + word + "%' or country like '%" + word + "%'";
        List<Author> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<String> gettAllCountry() {
        String sql = "select distinct country from Author order by country asc";
        List<String> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("country"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    private void addFollow(String username, int aid) {
        String sql = "INSERT INTO [dbo].[FollowAuthor]\n"
                + "           ([username]\n"
                + "           ,[authorId])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setInt(2, aid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void unFollow(String username, int aid) {
        String sql = "DELETE FROM [dbo].[FollowAuthor]\n"
                + "      WHERE username = ? and authorId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setInt(2, aid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean isExistFollow(String username, int aid) { //true la co ton tai
        String sql = "select * from FollowAuthor"; //false la khong

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("username").equalsIgnoreCase(username) && rs.getInt("authorId") == aid) {
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public void addOrUnFollow(String username, int aid) {
        boolean check = isExistFollow(username, aid);
        if (check) {
            unFollow(username, aid);
        } else {
            addFollow(username, aid);
        }
    }

    public List<Author> getAuthorByFilter034(String order, String key, String[] country) {
        String sql = "select * from Author where 1 = 1 ";
        List<Author> list = new ArrayList();
        if (key != null && !key.isEmpty()) {
            sql += " and ([name] like '%" + key + "%' "
                    + " or [descript] like '%" + key + "%' "
                    + " or [award] like '%" + key + "%' "
                    + " or country like '%" + key + "%') ";
        }
        if (country != null && country.length != 0 && !country[0].equals("all")) {
            sql += " and country in ('a',";
            for (int i = 0; i < country.length; i++) {
                sql += "'" + country[i] + "'" + ",";
            }
            sql += "'a') ";
        }
        switch (order) {
            case "0":
                sql += " order by [name] asc";
                break;
            case "3":
                sql += " order by birthYear asc";
                break;
            case "4":
                sql += " order by birthYear desc";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Author> getAuthorByFilter1(String order, String key, String[] country) {
        String sql = "select a.id,a.[name],a.birthYear,a.descript,\n"
                + "a.award,a.[image],a.country, count(b.id) as [numbook] \n"
                + "from Author a left join Book b\n"
                + "on a.id = b.authorId\n"
                + "group by a.id,a.[name],a.birthYear,a.descript,\n"
                + "a.award,a.[image],a.country \n"
                + "having 1 = 1 ";
        List<Author> list = new ArrayList();
        if (key != null && !key.isEmpty()) {
            sql += " and (a.[name] like '%" + key + "%' "
                    + " or a.[descript] like '%" + key + "%' "
                    + " or a.[award] like '%" + key + "%' "
                    + " or a.country like '%" + key + "%') ";
        }
        if (country != null && country.length != 0 && !country[0].equals("all")) {
            sql += " and a.country in ('a',";
            for (int i = 0; i < country.length; i++) {
                sql += "'" + country[i] + "'" + ",";
            }
            sql += "'a') ";
        }
        sql += " order by numbook desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Author> getAuthorByFilter2(String order, String key, String[] country) {
        String sql = "select a.id, a.name, a.birthYear,a.descript,\n"
                + "a.award,a.[image],a.country\n"
                + ",count(fa.username) as [numfollow]\n"
                + "from Author a left join FollowAuthor fa\n"
                + "on a.id = fa.authorId\n"
                + "group by a.id, a.name, a.birthYear,a.descript,\n"
                + "a.award,a.[image],a.country\n"
                + "having 1 = 1 ";
        List<Author> list = new ArrayList();
        if (key != null && !key.isEmpty()) {
            sql += " and (a.[name] like '%" + key + "%' "
                    + " or a.[descript] like '%" + key + "%' "
                    + " or a.[award] like '%" + key + "%' "
                    + " or a.country like '%" + key + "%') ";
        }
        if (country != null && country.length != 0 && !country[0].equals("all")) {
            sql += " and a.country in ('a',";
            for (int i = 0; i < country.length; i++) {
                sql += "'" + country[i] + "'" + ",";
            }
            sql += "'a') ";
        }
        sql += " order by numfollow desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author a = new Author();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setBirthYear(rs.getInt(3));
                a.setDescript(rs.getString(4));
                a.setAward(rs.getString(5));
                a.setImage(rs.getString(6));
                a.setCountry(rs.getString(7));
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addAnAuthor(String name, int year, String descript, String award, String image, String country) {
        String sql = "INSERT INTO [dbo].[Author]\n"
                + "           ([name]\n"
                + "           ,[birthYear]\n"
                + "           ,[descript]\n"
                + "           ,[award]\n"
                + "           ,[image]\n"
                + "           ,[country])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, year);
            st.setString(3, descript);
            st.setString(4, award);
            st.setString(5, image);
            st.setString(6, country);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteAnAuthor(String id) {
        int auId = Integer.parseInt(id);
        String sql = "DELETE FROM [dbo].[Author]\n"
                + "      WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, auId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateAnAuthor(String id, String name, int year, String descript, String award, String image, String country) {
        String sql = "UPDATE [dbo].[Author]\n"
                + "   SET [name] = ?\n"
                + "      ,[birthYear] = ?\n"
                + "      ,[descript] = ?\n"
                + "      ,[award] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[country] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, year);
            st.setString(3, descript);
            st.setString(4, award);
            st.setString(5, image);
            st.setString(6, country);
            st.setInt(7, Integer.parseInt(id));
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteAuthorInFollowAuthor(int authorId) {
        String sql = "delete from [FollowAuthor] where authorId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorInBookGenre(int authorId) {
        String sql = "delete from BookGenre where bookId in \n"
                + "(select id from Book where authorId = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorInRating(int authorId) {
        String sql = "delete from Rating where bookId in \n"
                + "(select id from Book where authorId = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorInSubcomment(int authorId) {
        String sql = "delete from Subcomment where bookID in \n"
                + "(select id from Book where authorId = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorInComment(int authorId) {
        String sql = "delete from [Comment] where bookID in \n"
                + "(select id from Book where authorId = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorInBook(int authorId) {
        String sql = "delete from Book where authorId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    private void deleteAuthorinAuthor(int authorId) {
        String sql = "delete from [Author] where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, authorId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void deleteAnAuthorCRUD(int authorId) {
        //xoa o bang FolowAuthor
        deleteAuthorInFollowAuthor(authorId);
        //xoa o bang Book
        //muon xoa o bang book thi lai phai xoa cac bang lien quan den bang book
        // xoa o bang bookGenre
        deleteAuthorInBookGenre(authorId);
        //xoa o Rating
        deleteAuthorInRating(authorId);
        //xoa o subcomment
        deleteAuthorInSubcomment(authorId);
        //xoa o comment
        deleteAuthorInComment(authorId);
        //xoa book cua author do 
        deleteAuthorInBook(authorId);
        //cuoi cung la xoa o bang author
        deleteAuthorinAuthor(authorId);

    }
}
