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
import model.Comment;
import model.Subcomment;

/**
 *
 * @author 84338
 */
public class CommentDAO extends DBContext {

    public List<Comment> getCommentsByBookID(int bookID) {
        String sql = "select c.id, c.bookID, u.username, c.comment \n"
                + "from Comment c, [User] u \n"
                + "where c.id = u.id and bookID = ?";
        List<Comment> list = new ArrayList();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt("id"), rs.getInt("bookID"),
                        rs.getString("username"), rs.getString("comment")));
            }

        } catch (SQLException e) {
        }
        return list;
    }

    private Comment isExistComment(int userID, int bookID) {
        String sql = "select * from Comment";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (userID == rs.getInt("id") && bookID == rs.getInt("bookID")) {
                    return new Comment(userID, bookID, "", "");
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addComment(int userID, int bookID, String comment) {
        String sql1 = "INSERT INTO [dbo].[Comment]\n"
                + "           ([id]\n"
                + "           ,[bookID]\n"
                + "           ,[comment])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        String sql2 = "UPDATE [dbo].[Comment]\n"
                + "   SET \n"
                + "      [comment] = ?\n"
                + " WHERE \n"
                + " [id] = ?\n"
                + "      and [bookID] = ?";

        try {
            if (isExistComment(userID, bookID) == null) { //chua co thi add
                PreparedStatement st = connection.prepareStatement(sql1);
                st.setInt(1, userID);
                st.setInt(2, bookID);
                st.setString(3, comment);
                st.executeUpdate();
            } else {
                // co roi thi update
                PreparedStatement st = connection.prepareStatement(sql2);
                st.setInt(2, userID);
                st.setInt(3, bookID);
                st.setString(1, comment);
                st.executeUpdate();
            }

        } catch (SQLException e) {
        }
    }

    public List<Subcomment> getSubcomments(int userID, int bookID) {
        List<Subcomment> list = new ArrayList();
        String sql = "select * from Subcomment where\n"
                + "userID = ? and bookID = ?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, userID);
            st.setInt(2, bookID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Subcomment(rs.getInt("id"),
                        rs.getInt("userID"),
                        rs.getInt("bookID"),
                        rs.getString("username"),
                        rs.getString("subcomment")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addSubComment(int userID, int bookID, String username, String subcomment) {
        String sql = "INSERT INTO [dbo].[Subcomment]\n"
                + "           ([userID]\n"
                + "           ,[bookID]\n"
                + "           ,[username]\n"
                + "           ,[subcomment])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, bookID);
            st.setString(3, username);
            st.setString(4, subcomment);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
