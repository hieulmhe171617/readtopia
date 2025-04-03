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
import model.Genre;
import model.NumberOfGenre;

/**
 *
 * @author 84338
 */
public class GenreDAO extends DBContext {

    public List<Genre> getAll() {
        List<Genre> list = new ArrayList();
        String sql = "select * from Genre";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre();
                g.setGenre(rs.getString("genre"));
                list.add(g);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    public static void main(String[] args) {
        List<NumberOfGenre> list = new ArrayList();
        GenreDAO gdao = new GenreDAO();
        list = gdao.top5GenreHaveMostBook();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getGenre() + " " + list.get(i).getNumbook());
        }
    }
    public List<NumberOfGenre> top5GenreHaveMostBook() {
        List<NumberOfGenre> list = new ArrayList();
        String sql = "select genre, count(bookId) as [numbook] from BookGenre \n"
                + " group by genre order by numbook desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
                list.add(new NumberOfGenre(rs.getString("genre"), rs.getInt("numbook")));
                if (count == 5)
                    break;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Genre> getAllOrderAlphabet() {
        List<Genre> list = new ArrayList();
        String sql = "select * from Genre order by genre asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre();
                g.setGenre(rs.getString("genre"));
                list.add(g);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public boolean isExistGender(String genre) {

        String sql = "select * from Genre where genre = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genre);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public List<Genre> getGenreByBookId(int id) { //id here is bookid
        List<Genre> list = new ArrayList();
        String sql = "select g.* from Genre g , BookGenre bg \n"
                + "where g.genre = bg.genre and bg.bookId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre();
                g.setGenre(rs.getString(1));
                list.add(g);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public void addNewGenre(String genre) {

        String sql = "INSERT INTO [dbo].[Genre]\n"
                + "           ([genre])\n"
                + "     VALUES (?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genre);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAGenre(String genre) {

        String sql = "DELETE FROM [dbo].[Genre]\n"
                + "      WHERE genre = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genre);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void deleteGenreInBookGenre(String genre) {
        String sql = "delete from BookGenre where [genre] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genre);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteGenreInGenre(String genre) {
        String sql = "delete from [Genre] where [genre] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genre);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteGenreCRUD(String genre) {
        //muon delete genre can delete cac bang lien quan truoc
        //delete trong bang BookGenre
        deleteGenreInBookGenre(genre);
        //delete trong bang genre
        deleteGenreInGenre(genre);

    }
}
