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
import model.CommentPost;
import model.News;
import model.NumberOfPost;

/**
 *
 * @author 84338
 */
public class NewFeedDAO extends DBContext {

    public void addNewPost(String username, String content, String dayCreate) {
        String sql = "INSERT INTO [dbo].[News]\n"
                + "           ([username]\n"
                + "           ,[content]\n"
                + "           ,[dayCreate])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, content);
            st.setString(3, dayCreate);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<News> getNewsPost() {
        List<News> list = new ArrayList<>();
        String sql = "select n.*, u.fullname from News n, [User] u\n"
                + "where n.username = u.username order by n.dayCreate desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getString("dayCreate"), rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addNewCommentToPost(int newsId, String username, String reply) {
        String sql = "INSERT INTO [dbo].[CommentPost]\n"
                + "           ([newsId]\n"
                + "           ,[username]\n"
                + "           ,[reply])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newsId);
            st.setString(2, username);
            st.setString(3, reply);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void main(String[] args) {
        NewFeedDAO nfdao = new NewFeedDAO();
        List<NumberOfPost> list = nfdao.getNumberofPostbyYear();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getYear() + "-" + list.get(i).getNumber());
        }
    }
    public List<NumberOfPost> getNumberofPostbyYear() {
        String sql = "select year(dayCreate) as [year], count(id) as [number] from News\n"
                + "group by year(dayCreate)\n"
                + "order by year(dayCreate) asc";
        List<NumberOfPost> list = new ArrayList();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                list.add(new NumberOfPost(rs.getString("year"), rs.getInt("number")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<CommentPost> getCommentsPost() {
        String sql = "select cp.*, u.fullname from CommentPost cp , [User] u\n"
                + "where cp.username = u.username";
        List<CommentPost> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new CommentPost(rs.getInt("id"),
                        rs.getInt("newsId"),
                        rs.getString("username"), rs.getString("reply"),
                        rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<News> getNewsByFilter01(String yearFrom, String yearTo, int category) {
        List<News> list = new ArrayList<>();
        String sql = "select * from (\n"
                + "select n.*, u.fullname from News n, [User] u\n"
                + "where n.username = u.username ) tb where 1 = 1 ";

        if (yearFrom != null && yearTo != null && !yearFrom.isEmpty() && !yearTo.isEmpty()) {
            int from = Integer.parseInt(yearFrom);
            int to = Integer.parseInt(yearTo);
            if (from <= to) {
                sql += " and year(dayCreate) between " + from + " and " + to + " ";

            }
        } else if (yearFrom != null && yearTo == null && !yearFrom.isEmpty()) {
            int from = Integer.parseInt(yearFrom);
            sql += " and year(dayCreate) > " + from + " ";
        } else if (yearFrom == null && yearTo != null && !yearTo.isEmpty()) {
            int to = Integer.parseInt(yearTo);
            sql += " and year(dayCreate) < " + to + " ";
        }

        if (category == 0) {
            sql += " order by dayCreate desc";
        } else if (category == 1) {
            sql += " order by dayCreate asc";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getString("dayCreate"), rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<News> getNewsByFilter23(String yearFrom, String yearTo, int category) {
        List<News> list = new ArrayList<>();
        String sql = "select * , len(content) as [leng] from (\n"
                + "select n.*, u.fullname from News n, [User] u\n"
                + "where n.username = u.username ) tb ";

        if (yearFrom != null && yearTo != null && !yearFrom.isEmpty() && !yearTo.isEmpty()) {
            int from = Integer.parseInt(yearFrom);
            int to = Integer.parseInt(yearTo);
            if (from <= to) {
                sql += " and year(dayCreate) between " + from + " and " + to + " ";
            }
        } else if (yearFrom != null && yearTo == null && !yearFrom.isEmpty()) {
            int from = Integer.parseInt(yearFrom);
            sql += " and year(dayCreate) > " + from + " ";
        } else if (yearFrom == null && yearTo != null && !yearTo.isEmpty()) {
            int to = Integer.parseInt(yearTo);
            sql += " and year(dayCreate) < " + to + " ";
        }

        if (category == 2) {
            sql += " order by leng desc";
        } else if (category == 3) {
            sql += "order by leng asc";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getString("dayCreate"), rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<News> getNewsByFilter4(String yearFrom, String yearTo, int category) {
        List<News> list = new ArrayList<>();
        String sql = "select bang1.*, u.fullname from (\n"
                + "select n.id,n.username,n.content, n.dayCreate , count(reply) as [number] \n"
                + "from News n , CommentPost cp\n"
                + "where n.id = cp.newsId\n"
                + "group by n.id,n.username,n.content, n.dayCreate ) bang1, [User] u\n"
                + "where u.username = bang1.username ";

        try {
            if (yearFrom != null && yearTo != null && !yearFrom.isEmpty() && !yearTo.isEmpty()) {
                int from = Integer.parseInt(yearFrom);
                int to = Integer.parseInt(yearTo);
                if (from <= to) {
                    sql += " and year(bang1.dayCreate) between " + from + " and " + to + " ";
                }
            } else if (yearFrom != null && yearTo == null && !yearFrom.isEmpty()) {
                int from = Integer.parseInt(yearFrom);
                sql += " and year(bang1.dayCreate) > " + from + " ";
            } else if (yearFrom == null && yearTo != null && !yearTo.isEmpty()) {
                int to = Integer.parseInt(yearTo);
                sql += " and year(bang1.dayCreate) < " + to + " ";
            }

            sql += " order by bang1.number desc";
        } catch (NumberFormatException e) {
            return getNewsPost();
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getString("dayCreate"), rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<News> getNewsByKeyWord(String keyword) {
        String sql = "select n.*, u.fullname from News n, [User] u \n"
                + " where n.username = u.username and content like '%";
        List<News> list = new ArrayList();
        sql += keyword + "%' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("content"),
                        rs.getString("dayCreate"), rs.getString("fullname")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    private void deleteNewsInCommentPost(int id) {
        String sql = "delete from CommentPost where newsId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private void deleteNewsInNews(int id) {
        String sql = "delete from [News] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteANewsCRUD(int id) {
        //muon xoa truoc tien xoa commentpost truoc,
        //tuc la xoa het binh luan cua bai viet do truoc
        deleteNewsInCommentPost(id);
        //xoa trong News
        deleteNewsInNews(id);
    }
}
