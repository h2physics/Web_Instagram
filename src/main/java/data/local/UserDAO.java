/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.User;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author H2PhySicS
 */
public class UserDAO extends DBContext{
    private Connection connection;
    
    public UserDAO(){
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public User getUser(String email, String password){
        return null;
    }
    
    public int insertUser(User u){
        return -1;
    }
    
    public int updateUser(String id, User u){
        return -1;
    }
}
