/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.PostsDAO;
import java.util.Date;

/**
 *
 * @author DPV
 */
public class posts {

    private int id;
    private int uid_posts;
    private int user_id;
    private String title;
    private String content;
    private String time;
    private int like;
    private int lock;
    private int view;
    private int status;
    private String time_cmt;
    private String thoigian;
    private int reply;

    public posts() {
    }

    public posts(int id, int uid_posts, int user_id, String title, String content, String time, int like, int lock, int view, int status, String time_cmt, String thoigian) {
        this.id = id;
        this.uid_posts = uid_posts;
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.like = like;
        this.lock = lock;
        this.view = view;
        this.status = status;
        this.time_cmt = time_cmt;
        this.thoigian = thoigian;
    }

    public int getReply() {
        PostsDAO daoPosts = new PostsDAO();
        reply = daoPosts.getReply(getId());
        return reply;
    }

    public String getThoigian() {
        long minute = Math.round((new Date().getTime() - Long.parseLong(getTime_cmt())) / 60000);
        if (minute < 1) {
            thoigian = "Vài giây trước";
        }
        if (minute >= 1 && minute < 60) {
            thoigian = minute + " phút trước";
        }
        if (minute >= 60 && minute <= 1440) {
            thoigian = Math.round(minute / 60) + " giờ trước";
        }
        if (minute >= 1440 && minute <= 43200) {
            thoigian = Math.round(minute / 60 / 24) + " ngày trước";
        }
        if (minute >= 43200 && minute <= 518400) {
            thoigian = Math.round(minute / 60 / 24 / 30) + " tháng trước";
        }
        if (minute > 518400) {
            thoigian = Math.round(minute / 60 / 24 / 30 / 12) + " năm trước";
        }
        return thoigian;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid_posts() {
        return uid_posts;
    }

    public void setUid_posts(int uid_posts) {
        this.uid_posts = uid_posts;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getLock() {
        return lock;
    }

    public void setLock(int lock) {
        this.lock = lock;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTime_cmt() {
        return time_cmt;
    }

    public void setTime_cmt(String time_cmt) {
        this.time_cmt = time_cmt;
    }

    @Override
    public String toString() {
        return "posts{" + "id=" + id + ", uid_posts=" + uid_posts + ", user_id=" + user_id + ", title=" + title + ", content=" + content + ", time=" + time + ", like=" + like + ", lock=" + lock + ", view=" + view + ", status=" + status + ", time_cmt=" + time_cmt + ", thoigian=" + thoigian + '}';
    }

}
