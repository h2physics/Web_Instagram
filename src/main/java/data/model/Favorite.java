/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.model;

/**
 *
 * @author Loc Nguyen
 */
public class Favorite {
    private String uid;
    private String postId;

    public Favorite(String uid, String postId) {
        this.uid = uid;
        this.postId = postId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }
    
}
