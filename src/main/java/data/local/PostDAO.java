/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Post;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                Date time = set.getDate("time");
                posts.add(new Post(id, uid, image, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return posts;
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
                    Date time = set.getDate("time");
                    posts.add(new Post(id, friendId, image, content, time));
                }
            } catch (SQLException ex) {
                Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return posts;
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
                Date time = set.getDate("time");
                posts.add(new Post(id, uid, image, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return posts;
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
}
