/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Comment;
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
public class CommentDAO extends DBContext {

    private Connection connection;

    public CommentDAO() {
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Comment> getComments() {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM [Comment]";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String id = set.getString("id");
                String uid = set.getString("uid");
                String postId = set.getString("post_id");
                String content = set.getString("content");
                Date time = set.getDate("time");
                comments.add(new Comment(id, uid, postId, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comments;
    }

    public List<Comment> getComments(String postId) {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM [Comment] WHERE [post_id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, postId);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String id = set.getString("id");
                String uid = set.getString("uid");
                String content = set.getString("content");
                Date time = set.getDate("time");
                comments.add(new Comment(id, uid, postId, content, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comments;
    }

    public int insertComment(Comment c) {
        String query = "INSERT INTO [Comment] VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, c.getId());
            statement.setString(2, c.getUid());
            statement.setString(3, c.getPostId());
            statement.setString(4, c.getContent());
            statement.setTimestamp(5, new Timestamp(c.getTime().getTime()));
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int updateComment(String id, Comment c) {
        return -1;
    }
}
