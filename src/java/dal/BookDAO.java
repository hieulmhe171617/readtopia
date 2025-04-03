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
import model.Book;
import model.Book2;
import model.NumberOfStatus;
import model.TopRatingBook;

/**
 *
 * @author 84338
 */
public class BookDAO extends DBContext {

    public List<Book> getAllBook() {
        String sql = "select * from Book";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getAllBookByAlphabet() {
        String sql = "select * from Book order by [name] asc";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<TopRatingBook> getTop5RatingBook() {
        String sql = "select b.id, b.[name], round( avg(r.rating), 2) \n"
                + "as [rate] from Rating r, Book b\n"
                + "where r.bookID = b.id\n"
                + "group by b.id, b.[name]\n"
                + "order by rate desc";
        List<TopRatingBook> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
                list.add(new TopRatingBook(rs.getInt("id"),
                        rs.getString("name"), rs.getDouble("rate")));
                if (count == 5) {
                    break;
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<NumberOfStatus> getNumberOfStatus() {
        String sql = "select [status] ,count(id) as [numcate] from Book\n"
                + "group by [status] order by [status] asc";
        List<NumberOfStatus> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new NumberOfStatus(rs.getString("status"), rs.getInt("numcate")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book2> getAllBookWithAuthornameByAlphabet() {
        String sql = "select b.*, a.[name] as [auname] from Book b, Author a\n"
                + "where b.authorId = a.id";
        List<Book2> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book2 b = new Book2();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                b.setAuthorname(rs.getString(9));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByStatus(String status) {
        String sql = "select * from Book where status = ?";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByGenreAndStatus(String genre, String status) {
        String sql = "";
        if ((genre.equalsIgnoreCase("all")) && status == null) {
            sql = "select distinct b.* from Book b , BookGenre bg \n"
                    + "                 where b.id = bg.bookId";
        } else if (genre.equalsIgnoreCase("all") && status != null) {
            sql = "select distinct b.* from Book b , BookGenre bg \n"
                    + "                 where b.id = bg.bookId  and b.status ='" + status + "'";
        } else if (!(genre.equalsIgnoreCase("all")) && status == null) {
            sql = "select b.* from Book b , BookGenre bg \n"
                    + "                 where b.id = bg.bookId and bg.genre = '" + genre + "'";
        } else {
            sql = "select b.* from Book b , BookGenre bg \n"
                    + "                 where b.id = bg.bookId and bg.genre ="
                    + "'" + genre + "'" + "and b.status = '" + status + "'";
        }

        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Book getBookById(int id) {
        String sql = "select * from Book where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                return b;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Book> getBooksByAuthorId(int id) {
        String sql = "select b.* from Book b, Author a \n"
                + "where b.authorId = a.id and a.id = ?";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksBySearchWords(String word) {
        String sql = "select * from Book where name like '%" + word + "%' "
                + " or descript like '%" + word + "%' ";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addOrUpdateRatingBook(int userID, int bookID, double rate) {
        String sql1 = "INSERT INTO [dbo].[Rating]\n" // for insert
                + "           ([userID]\n"
                + "           ,[bookID]\n"
                + "           ,[rating])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        String sql2 = "UPDATE [dbo].[Rating]\n" //for update
                + "   SET [rating] = ? \n"
                + " WHERE [userID] = ? and [bookID] = ?";

        try {
            PreparedStatement st;
            if (isExistRating(userID, bookID)) {
                //true == co ton tai -> update
                st = connection.prepareStatement(sql2);
                st.setDouble(1, rate);
                st.setInt(2, userID);
                st.setInt(3, bookID);
                st.executeUpdate();
            } else {
                //false -> chua ton tai -> insert
                st = connection.prepareStatement(sql1);
                st.setInt(1, userID);
                st.setInt(2, bookID);
                st.setDouble(3, rate);
                st.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

    private boolean isExistRating(int userID, int bookID) {
        String sql = "select * from Rating where userID = ? and bookID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, bookID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true; // co exist
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public Double getAverageRatingBook(int bookID) {
        String sql = "SELECT ROUND(avg(rating), 2) AS averate\n"
                + "FROM Rating where bookID = ?";
        Double ave = null;
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, bookID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ave = rs.getDouble("averate");
            }
        } catch (SQLException e) {
        }
        return ave;
    }

    public int getNumberOfRating(int bookID) {
        String sql = "select count(*) as numberrate from Rating where bookID = ?";
        Integer count = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("numberrate");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public int findRatingByUserIDAndBookID(int userID, int bookID) {
        String sql = "select rating from Rating \n"
                + "where userID = ? and bookID = ?";
        Integer rating = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, bookID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                rating = (int) rs.getDouble("rating");
            }
        } catch (SQLException e) {
        }
        return rating;
    }

    public List<Book> getBooksByFilterAndKeyword(String filter, String bookname, List<Integer> listID) {
        String sql = "select * from Book \n"
                + "where 1 = 1 ";
        if (listID.size() > 0) {
            sql += " and id in (-1";
            for (int i = 0; i < listID.size(); i++) {
                sql += "," + listID.get(i);
            }
            sql += ",-1) ";
        }
        List<Book> list = new ArrayList();
        try {
            if (bookname != null && !bookname.isEmpty()) {
                sql += " and [name] like '%" + bookname + "%' ";
            }
            if (filter.equals("0")) {
                sql += " order by [name] asc";
            } else if (filter.equals("1")) {
                sql += " order by [authorId] asc";
            } else if (filter.equals("2")) {
                sql += " order by releaseDate desc";
            } else if (filter.equals("3")) {
                sql += " order by releaseDate asc";
            }

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByFilterAndKeywordAdvanced(String filter, String bookname, List<Integer> listID) {
        String sql = "select b.* from Book b left join \n"
                + "(\n"
                + "select count(bookID) as [numberrate], bookID from Rating \n"
                + "group by bookID) r \n"
                + " on b.id = r.bookID where 1 = 1 ";
        if (listID.size() > 0) {
            sql += " and b.id in (-1";
            for (int i = 0; i < listID.size(); i++) {
                sql += "," + listID.get(i);
            }
            sql += ",-1) ";
        }
        List<Book> list = new ArrayList();
        try {
            if (bookname != null && !bookname.isEmpty()) {
                sql += " and b.[name] like '%" + bookname + "%' ";
            }
            if (filter.equals("4")) {
                sql += " order by numberrate desc ";
            } else if (filter.equals("5")) {
                sql += " order by numberrate asc ";
            }

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setAuthorId(rs.getInt("authorId"));
                b.setPublisher(rs.getString("publisher"));
                b.setReleaseDate(rs.getString("releaseDate"));
                b.setImage(rs.getString("image"));
                b.setDescript(rs.getString("descript"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByFilterSortAndSearch0123(String choice, String namebook, String genre, String status) {
        String sql = "select distinct b.* from Book b, BookGenre bg\n"
                + "where b.id = bg.bookId ";
        List<Book> list = new ArrayList();
        if (genre != null && !genre.isEmpty() && !genre.equalsIgnoreCase("all")) {
            sql += " and bg.genre = '" + genre + "' ";
        }
        if (status != null && !status.isEmpty()) {
            sql += " and b.status = '" + status + "' ";
        }
        if (namebook != null && !namebook.isEmpty()) {
            sql += " and b.[name] like '%" + namebook + "%' ";
        }

        switch (choice) {
            case "0":
                sql += " order by b.[name] asc";
                break;
            case "1":
                sql += " order by b.authorID asc";
                break;
            case "2":
                sql += " order by b.releaseDate desc";
                break;
            case "3":
                sql += " order by b.releaseDate asc";
                break;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByFilterSortAndSearch4(String choice, String namebook, String genre, String status) {
        String sql = "select b.id, b.[name],b.authorId,b.publisher,\n"
                + "b.releaseDate,b.image,b.descript,b.[status], \n"
                + "avg(r.rating) as [averate]\n"
                + "from \n"
                + "(select distinct bo.*\n"
                + "from Book bo, BookGenre bg \n"
                + "where bo.id = bg.bookId";
        List<Book> list = new ArrayList();
        if (genre != null && !genre.isEmpty() && !genre.equalsIgnoreCase("all")) {
            sql += " and bg.genre = '" + genre + "' ";
        }

        sql += " ) b left join Rating r\n"
                + "on b.id = r.bookID\n"
                + "group by b.id, b.[name],b.authorId,b.publisher,\n"
                + "b.releaseDate,b.image,b.descript,b.[status]\n"
                + "having 1 = 1 ";
        if (status != null && !status.isEmpty()) {
            sql += " and b.[status] = '" + status + "' ";
        }
        sql += " order by averate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setAuthorId(rs.getInt("authorID"));
                b.setPublisher(rs.getString("publisher"));
                b.setReleaseDate(rs.getString("releaseDate"));
                b.setImage(rs.getString("image"));
                b.setDescript(rs.getString("descript"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getRandomOrderOfBook(int id) {
        String sql = "select * from Book\n"
                + "where id <> ?\n"
                + "ORDER BY NEWID()";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getRandomBookByStatus(String status) {
        String sql = "select * from Book\n"
                + "where [status] = ?\n"
                + "ORDER BY NEWID()";
        List<Book> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setAuthorId(rs.getInt(3));
                b.setPublisher(rs.getString(4));
                b.setReleaseDate(rs.getString(5));
                b.setImage(rs.getString(6));
                b.setDescript(rs.getString(7));
                b.setStatus(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBooksByFilterSortAndSearch5(String choice, String namebook, String genre, String status) {
        String sql = "select b.id, b.[name],b.authorId,b.publisher,\n"
                + "b.releaseDate,b.image,b.descript,b.[status], \n"
                + "count(r.rating) as [numrate]\n"
                + "from \n"
                + "(select distinct bo.*\n"
                + "from Book bo, BookGenre bg \n"
                + "where bo.id = bg.bookId";
        List<Book> list = new ArrayList();
        if (genre != null && !genre.isEmpty() && !genre.equalsIgnoreCase("all")) {
            sql += " and bg.genre = '" + genre + "' ";
        }

        sql += " ) b left join Rating r\n"
                + "on b.id = r.bookID\n"
                + "group by b.id, b.[name],b.authorId,b.publisher,\n"
                + "b.releaseDate,b.image,b.descript,b.[status]\n"
                + "having 1 = 1 ";
        if (status != null && !status.isEmpty()) {
            sql += " and b.[status] = '" + status + "' ";
        }
        sql += " order by numrate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setAuthorId(rs.getInt("authorID"));
                b.setPublisher(rs.getString("publisher"));
                b.setReleaseDate(rs.getString("releaseDate"));
                b.setImage(rs.getString("image"));
                b.setDescript(rs.getString("descript"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addABook(String name, int authorId, String publisher, String releaseDate, String image, String descript, String status) {
        String sql = "INSERT INTO [dbo].[Book]\n"
                + "           ([name]\n"
                + "           ,[authorId]\n"
                + "           ,[publisher]\n"
                + "           ,[releaseDate]\n"
                + "           ,[image]\n"
                + "           ,[descript]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, authorId);
            st.setString(3, publisher);
            st.setString(4, releaseDate);
            st.setString(5, image);
            st.setString(6, descript);
            st.setString(7, status);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int takeIdABook(String name, int authorId, String publisher, String releaseDate, String image, String descript, String status) {
        String sql = "select * from Book \n"
                + "where [name] = ?\n"
                + "and authorId = ?\n"
                + "and publisher = ?\n"
                + "and releaseDate = ?\n"
                + "and [image] = ?\n"
                + "and descript = ?\n"
                + "and [status] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, authorId);
            st.setString(3, publisher);
            st.setString(4, releaseDate);
            st.setString(5, image);
            st.setString(6, descript);
            st.setString(7, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public void updateABook(int id, String name, int authorId, String publisher, String releaseDate, String image, String descript, String status) {
        String sql = "UPDATE [dbo].[Book]\n"
                + "   SET [name] = ?\n"
                + "      ,[authorId] = ?\n"
                + "      ,[publisher] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[descript] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, authorId);
            st.setString(3, publisher);
            st.setString(4, releaseDate);
            st.setString(5, image);
            st.setString(6, descript);
            st.setString(7, status);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteAABookbyId(int id) {
        String sql = "DELETE FROM [dbo].[Book]\n"
                + "      WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addGenresForBookbyID(int id, String[] genre) {
        for (int i = 0; i < genre.length; i++) {
            addAGenreForBookByID(id, genre[i]);
        }
    }

    private void addAGenreForBookByID(int id, String genre) {
        String sql = "INSERT INTO [dbo].[BookGenre]\n"
                + "           ([bookId]\n"
                + "           ,[genre])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, genre);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteBookGenreByBookID(int bookid) {
        String sql = "DELETE FROM [dbo].[BookGenre]\n"
                + "      WHERE bookId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteBookInRating(int bookid) {
        String sql = "delete from Rating where bookID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteBookInSubcomment(int bookid) {
        String sql = "delete from Subcomment where bookID  = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteBookInComment(int bookid) {
        String sql = "delete from [Comment] where bookid  = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteABookCRUD(int bookid) {
        //de xoa book trong CRUD
        //dau tien xoa o bookgenre
        deleteBookGenreByBookID(bookid);
        //xoa o rating
        deleteBookInRating(bookid);
        //xoa o subcomment
        deleteBookInSubcomment(bookid);
        //xoa o comment
        deleteBookInComment(bookid);
        //sau cung la delete trong table book
        deleteAABookbyId(bookid);
    }
}
