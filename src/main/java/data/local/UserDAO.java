/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public User getUser(String id){
        String query = "SELECT * FROM [Users] WHERE [id] = " + id;
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while(set.next()){
                String fullname = set.getString("fullname");
                String username = set.getString("username");
                String email = set.getString("email");
                return new User(id, fullname, username, email);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getUser(String email, String password){
        String query = "SELECT * FROM [Users] WHERE [email]=? AND [password]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet set = statement.executeQuery();
            set.last();
            int size = set.getRow();
            
            System.out.println("Size: " + size);
//            while(set.next()){
//                String fullname = set.getString("fullname");
//                String username = set.getString("username");
//                String email = set.getString("email");
//                return new User(id, fullname, username, email);
//            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int insertUser(User u){
        String query = "INSERT INTO [Users] VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, u.getId());
            statement.setString(2, u.getFullname());
            statement.setString(3, u.getUsername());
            statement.setString(4, u.getEmail());
            statement.setString(5, u.getPassword());
            statement.setInt(6, u.getGender());
            statement.setString(7, u.getPhoneNumber());
            statement.setString(8, u.getWebsite());
            statement.setString(9, u.getBiography());
            statement.setString(10, u.getAvatar());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return -1;
    }
    
    public int updateUser(String id, User u){
        return -1;
    }
}
