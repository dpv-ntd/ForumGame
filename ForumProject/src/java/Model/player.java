/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DPV
 */
public class player {

    private int id;
    private String username;
    private String password;
    private int posts;
    private int avatar;
    private int admin;
    private int time;

    public player() {
    }

    public player(int id, String username, String password, int posts, int avatar, int admin, int time) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.posts = posts;
        this.avatar = avatar;
        this.admin = admin;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPosts() {
        return posts;
    }

    public void setPosts(int posts) {
        this.posts = posts;
    }

    public int getAvatar() {
        return avatar;
    }

    public void setAvatar(int avatar) {
        this.avatar = avatar;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "player{" + "id=" + id + ", username=" + username + ", password=" + password + ", posts=" + posts + ", avatar=" + avatar + ", admin=" + admin + ", time=" + time + '}';
    }

}
