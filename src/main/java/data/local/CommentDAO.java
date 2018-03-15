/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Comment;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author H2PhySicS
 */
public class CommentDAO extends DBContext{
   private Connection connection;
    
    public CommentDAO(){
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Comment> getComments(String postId){
        return null;
    }
    
    public int insertComment(Comment c){
        return -1;
    }
    
    public int updateComment(String id, Comment c){
        return -1;
    } 
}
