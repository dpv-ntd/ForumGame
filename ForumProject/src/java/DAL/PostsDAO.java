/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.posts;

/**
 *
 * @author DPV
 */
public class PostsDAO extends BaseDAO<posts> {

    public ArrayList<posts> getListposts() {
        ArrayList<posts> listposts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM posts where uid_posts IS NULL and status = 0 ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                posts s = new posts();
                s.setId(rs.getInt("id"));
                s.setUid_posts(rs.getInt("uid_posts"));
                s.setTitle(rs.getString("title"));
                s.setContent(rs.getString("content"));
                s.setLike(rs.getInt("like"));
                s.setLock(rs.getInt("lock"));
                s.setTime(rs.getString("time"));
                s.setTime_cmt(rs.getString("time_cmt"));
                s.setView(rs.getInt("view"));
                s.setStatus(rs.getInt("status"));
                s.setUser_id(rs.getInt("user_id"));
                listposts.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listposts;
    }

    public ArrayList<posts> getListpostsNotification() {
        ArrayList<posts> listpostsNotification = new ArrayList<>();
        try {
            String sql = "SELECT * FROM posts where uid_posts IS NULL and status > 1 ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                posts s = new posts();
                s.setId(rs.getInt("id"));
                s.setUid_posts(rs.getInt("uid_posts"));
                s.setTitle(rs.getString("title"));
                s.setContent(rs.getString("content"));
                s.setLike(rs.getInt("like"));
                s.setLock(rs.getInt("lock"));
                s.setTime(rs.getString("time"));
                s.setTime_cmt(rs.getString("time_cmt"));
                s.setView(rs.getInt("view"));
                s.setStatus(rs.getInt("status"));
                s.setUser_id(rs.getInt("user_id"));
                listpostsNotification.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listpostsNotification;
    }

    public ArrayList<posts> getComment(String id) {
        ArrayList<posts> listComment = new ArrayList<>();
        try {
            String sql = "SELECT * FROM posts where uid_posts = ? ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                posts s = new posts();
                s.setId(rs.getInt("id"));
                s.setUid_posts(rs.getInt("uid_posts"));
                s.setTitle(rs.getString("title"));
                s.setContent(rs.getString("content"));
                s.setLike(rs.getInt("like"));
                s.setLock(rs.getInt("lock"));
                s.setTime(rs.getString("time"));
                s.setTime_cmt(rs.getString("time_cmt"));
                s.setView(rs.getInt("view"));
                s.setStatus(rs.getInt("status"));
                s.setUser_id(rs.getInt("user_id"));
                listComment.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listComment;
    }

    public posts getposts(String id) {
        try {
            String sql = "SELECT * FROM posts where id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                posts s = new posts();
                s.setId(rs.getInt("id"));
                s.setUid_posts(rs.getInt("uid_posts"));
                s.setTitle(rs.getString("title"));
                s.setContent(rs.getString("content"));
                s.setLike(rs.getInt("like"));
                s.setLock(rs.getInt("lock"));
                s.setTime(rs.getString("time"));
                s.setTime_cmt(rs.getString("time_cmt"));
                s.setView(rs.getInt("view"));
                s.setStatus(rs.getInt("status"));
                s.setUser_id(rs.getInt("user_id"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createComment(String topicID, String userID, String content, String timeCmt) {
        try {
            String sql = "INSERT INTO posts (uid_posts, user_id, content, time_cmt) VALUES(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, topicID);
            statement.setString(2, userID);
            statement.setString(3, content);
            statement.setString(4, timeCmt);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createPosts(String userID, String title, String content, String time) {
        try {
            String sql = "INSERT INTO posts (user_id, title, content, time, status) VALUES(?,?,?,?,0)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userID);
            statement.setString(2, title);
            statement.setString(3, content);
            statement.setString(4, time);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccount(String AccountId) {
        try {
            String sql = "DELETE Account WHERE AccountId= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, AccountId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editAccount(String username, String password, String name, String role, String dob, String address, String phonenumber, String email, String AccountID) {
        try {
            String sql = "UPDATE Account SET Username = ?, Password = ?, Name = ?, Role = ?, DOB = ?, Address = ?, PhoneNumber = ?, Email = ? WHERE AccountID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, role);
            statement.setString(5, dob);
            statement.setString(6, address);
            statement.setString(7, phonenumber);
            statement.setString(8, email);
            statement.setString(9, AccountID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        PostsDAO dao = new PostsDAO();
        dao.createPosts("1", "title", "content", "time");

    }

}
