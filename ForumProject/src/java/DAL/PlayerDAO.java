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
import Model.player;

/**
 *
 * @author DPV
 */
public class PlayerDAO extends BaseDAO<player> {

    public player getplayer(String username, String password) {
        try {
            String sql = "SELECT * FROM player where username = ? and password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                player s = new player();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setAvatar(rs.getInt("avatar"));
                s.setAdmin(rs.getInt("admin"));
                s.setPosts(rs.getInt("posts"));
                s.setTime(rs.getInt("time"));
                s.setOnline(rs.getInt("online"));
                s.setDisplayname(rs.getString("displayname"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public player CheckUsername(String username) {
        try {
            String sql = "SELECT * FROM player where username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                player s = new player();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setAvatar(rs.getInt("avatar"));
                s.setAdmin(rs.getInt("admin"));
                s.setPosts(rs.getInt("posts"));
                s.setTime(rs.getInt("time"));
                s.setOnline(rs.getInt("online"));
                s.setDisplayname(rs.getString("displayname"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<player> getListplayer() {
        ArrayList<player> listplayer = new ArrayList<>();
        try {
            String sql = "SELECT * FROM player ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                player s = new player();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setAvatar(rs.getInt("avatar"));
                s.setAdmin(rs.getInt("admin"));
                s.setPosts(rs.getInt("posts"));
                s.setTime(rs.getInt("time"));
                s.setOnline(rs.getInt("online"));
                s.setDisplayname(rs.getString("displayname"));
                listplayer.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listplayer;
    }

    public void createAccount(String username, String password, String time) {
        try {
            String sql = "INSERT INTO player (username, password, posts, avatar, admin, time) VALUES(?,?,0,1,0,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, time);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePosts(String userID) {
        try {
            String sql = "UPDATE player SET posts = posts + 1 WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOnline(int userID) {
        try {
            String sql = "UPDATE player SET online = 1 WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOffline(int userID) {
        try {
            String sql = "UPDATE player SET online = 0 WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccount(String AccountId) {
        try {
            String sql = "DELETE Account WHERE AccountId= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, AccountId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        PlayerDAO dao = new PlayerDAO();
        System.out.println(dao.getplayer("oke", "oke"));
    }

}
