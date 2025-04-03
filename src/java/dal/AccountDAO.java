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
import model.Admin;
import model.News;

import model.User;
import model.ViewRating;

/**
 *
 * @author 84338
 */
public class AccountDAO extends DBContext {

    //xu ly lien quan van de tai khoan : admin, user,....
    public User getUserByUsernameNPassword(String user, String pass) {
        String sql = "select * from [User] where username = ? and password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("fullname"), rs.getBoolean("gender"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean addNewUser(String user, String pass, String email) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[fullname]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "           (?,?,?,\n"
                + "		   'Fullname', 1)";
        if (isExistUsername(user)) {
            return false;
        } else {
            try {
                PreparedStatement st = connection.prepareCall(sql);
                st.setString(1, user);
                st.setString(2, pass);
                st.setString(3, email);

                st.executeUpdate();
                return true;
            } catch (SQLException e) {
            }
        }
        return true;
    }

    private boolean isExistUsername(String user) {
        String sql = "select username from [User]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("username").equals(user)) {
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public void updateProfileUser(String username, String email, String fullname, boolean gender) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET "
                + "   [email] = ?\n"
                + "   ,[fullname] = ?\n"
                + "   ,[gender] = ?\n"
                + "\n"
                + " WHERE username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, fullname);
            st.setBoolean(3, gender);
            st.setString(4, username);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changePasswordUser(String username, String newpass) {
        String sql = "update [dbo].[User] "
                + " set [password] = ? "
                + " where [username] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User getUserInfo(String user) {
        String sql = "select * from [User] where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("fullname"), rs.getBoolean("gender"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<ViewRating> getRatingOfUser(String username) {
        String sql = "select a.*, b.[name] from (\n"
                + "select u.id, r.bookID, r.rating from [User] u, Rating r\n"
                + "where u.id = r.userID\n"
                + "and u.username = ? ) a, Book b\n"
                + "where a.bookID = b.id";
        List<ViewRating> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ViewRating(rs.getInt("id"), rs.getInt("bookID"), rs.getDouble("rating"), rs.getString("name")));
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<News> getNewsByUsername(String username) {
        String sql = "select * from News n, [User] u\n"
                + "where n.username = u.username and u.username = ?"
                + " order by n.dayCreate desc";
        List<News> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        username, rs.getString("content"), rs.getString("dayCreate"),
                        rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteANews(String username, int newid) {
        String sql = "DELETE FROM [dbo].[News]\n"
                + "      WHERE id = ? and username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newid);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList();

        String sql = "select * from [User]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("fullname"), rs.getBoolean("gender"));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Admin getAdminByUserPass(String user, String pass) {
        String sql = "select * from [Admin] where username = ? "
                + "and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getInt("id"),
                        user, pass, rs.getString("email"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Admin getAdminByUsername(String user) {
        String sql = "select * from [Admin] where username = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getInt("id"),
                        user, rs.getString("password"), rs.getString("email"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addAdmin(String user, String pass, String email) {
        String sql = "INSERT INTO [dbo].[Admin]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, email);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public void updateAdminInfo(String user, String pass, String email) {
        String sql = "UPDATE [dbo].[Admin]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      ,[email] = ?\n"
                + " WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.setString(3, user);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public void deleteAUser(String user) {
        String sql = "DELETE FROM [dbo].[User]\n"
                + "      WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public List<Admin> getAllAdmins() {
        String sql = "select * from [Admin]";
        List<Admin> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Admin(rs.getInt("id"),
                        rs.getString("username"), rs.getString("password"),
                        rs.getString("email")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<User> getAllUsers() {
        String sql = "select * from [User] ";
        List<User> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("fullname"), rs.getBoolean("gender"));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    private void deleteUserinCommentPost(String username) {
        String sql = "delete from CommentPost where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteinCommentPostWhoCommentInNewsOfUserWantDelete(String username) {
        String sql = "delete from CommentPost where newsId in (\n"
                + "select id from News where username = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinNews(String username) {
        String sql = "delete from [News] where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinRating(String username) {
        String sql = "delete from Rating where userID = \n"
                + "(select id from [User] where username = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinFollowAuthor(String username) {
        String sql = "delete from FollowAuthor where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinSubcomment(String username) {
        String sql = "delete from Subcomment where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinComment(String username) {
        String sql = "delete from Comment where id = \n"
                + "(select id from [User] where username = ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteUserinUnser(String username) {
        String sql = "delete from [User] where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteUserCRUD(String username) {
        //muon xoa user can xoa cac bang lien quan truoc
        //xoa bang commentpost
        deleteUserinCommentPost(username);
        //xoa tat ca cac comment co trong news cua thang user do
        deleteinCommentPostWhoCommentInNewsOfUserWantDelete(username);
        //xoa cac news cua user do
        deleteUserinNews(username);
        //xoa o bang rating
        deleteUserinRating(username);
        //xoa o bang followAuthor
        deleteUserinFollowAuthor(username);
        //xoa o subcomment
        deleteUserinSubcomment(username);
        //xoa o Comment
        deleteUserinComment(username);
        //xoa o bang user
        deleteUserinUnser(username);

    }
}
