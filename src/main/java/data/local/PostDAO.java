/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Comment;
import data.model.Favorite;
import data.model.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.WebUtils;

/**
 *
 * @author H2PhySicS
 */
public class PostDAO extends DBContext {

    private Connection connection;

    public PostDAO() {
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public List<Post> deletePost(String postId){
//         List<Post> post = new ArrayList<>();
//        String query = "DELETE FROM [Post] WHERE [id]=?";
//        try {
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setString(1, postId);
//            statement.executeUpdate();
//
//        } catch (SQLException ex) {
//            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return post;
//    }
    public List<Post> getPosts() {
        List<Post> posts = new ArrayList<>();
        String query = "SELECT * FROM [Post] ORDER BY [time] DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String id = set.getString("id");
                String uid = set.getString("uid");
                String image = set.getString("image");
                String content = set.getString("content");
                Date time = set.getTimestamp("time");
                posts.add(new Post(id, uid, image, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return WebUtils.orderPostByTime(posts);
    }

    public List<Post> getPosts(String uid) {
        List<Post> posts = new ArrayList<>();
        List<String> idList = getUserRelationship(uid);
        idList.add(uid);
        for (String friendId : idList) {
            String query = "SELECT * FROM [Post] WHERE [uid]=? ORDER BY [time] DESC";
            try {
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, friendId);
                ResultSet set = statement.executeQuery();
                while (set.next()) {
                    String id = set.getString("id");
                    String image = set.getString("image");
                    String content = set.getString("content");
                    Date time = set.getTimestamp("time");
                    posts.add(new Post(id, friendId, image, content, time));
                }
            } catch (SQLException ex) {
                Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return WebUtils.orderPostByTime(posts);
    }

    public List<Post> getCurrentUserPost(String uid) {
        List<Post> posts = new ArrayList<>();
        String query = "SELECT * FROM [Post] WHERE [uid]=? ORDER BY [time] DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String id = set.getString("id");
                String image = set.getString("image");
                String content = set.getString("content");
                Date time = set.getTimestamp("time");
                posts.add(new Post(id, uid, image, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return WebUtils.orderPostByTime(posts);
    }

    public int insertPost(Post p) {
        String query = "INSERT INTO [Post] VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setString(2, p.getUid());
            statement.setString(3, p.getImage());
            statement.setTimestamp(4, new Timestamp(p.getTime().getTime()));
            statement.setString(5, p.getContent());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    public int updatePost(String id, Post p) {
        return -1;
    }

    public List<String> getUserRelationship(String uid) {
        List<String> list = new ArrayList<>();
        String query = "SELECT [friend_id] FROM [Relationship] WHERE [uid]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String friendId = set.getString("friend_id");
                list.add(friendId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int likePost(String uid, String postId){
        String query = "INSERT INTO [Favorite] VALUES(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, postId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public int unlikePost(String uid, String postId){
        String query = "DELETE FROM [Favorite] WHERE [uid]=? AND [post_id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, postId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public boolean checkLikePost(String uid, String postId){
        String query = "SELECT * FROM [Favorite] WHERE [uid]=? AND [post_id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, postId);
            ResultSet set = statement.executeQuery();
            set.next();
            int row = set.getRow();
            if(row > 0){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public List<Favorite> getFavorite(){
        List<Favorite> favorites = new ArrayList<Favorite>();
        String query = "SELECT * FROM [Favorite]";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String uid = set.getString("uid");
                String postId = set.getString("post_id");
                favorites.add(new Favorite(uid, postId));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return favorites;
    }
}
