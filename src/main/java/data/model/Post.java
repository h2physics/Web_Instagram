/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.model;

import java.util.Date;

/**
 *
 * @author H2PhySicS
 */
public class Post implements Comparable<Post>{
    private String id;
    private String uid;
    private String image;
    private String content;
    private Date time;

    public Post(String id, String uid, String image, String content, Date time) {
        this.id = id;
        this.uid = uid;
        this.image = image;
        this.content = content;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Post{" + "id=" + id + ", uid=" + uid + ", image=" + image + ", time=" + time.toString() + '}';
    }

    @Override
    public int compareTo(Post o) {
        if(this.time.after(o.time)){
            return -1;
        } else if(this.time.before(o.time)){
            return 1;
        } else {
            return 0;
        }
    }
    
}
