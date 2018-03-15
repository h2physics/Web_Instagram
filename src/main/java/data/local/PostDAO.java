/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Post;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author H2PhySicS
 */
public class PostDAO extends DBContext{
    private Connection connection;
    
    public PostDAO(){
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Post> getPosts(String uid){
        return null;
    }
    
    public int insertPost(Post p){
        return -1;
    }
    
    public int updatePost(String id, Post p){
        return -1;
    }
}
