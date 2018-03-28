/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.local;

import com.context.DBContext;
import data.model.Relationship;
import data.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import utils.Constant;

/**
 *
 * @author H2PhySicS
 */
public class UserDAO extends DBContext {

    private Connection connection;

    public UserDAO() {
        try {
            connection = getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUser(String id) {
        String query = "SELECT * FROM [Users] WHERE [id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                String fullname = set.getString("fullname");
                String username = set.getString("username");
                String email = set.getString("email");
                int gender = set.getInt("gender");
                String phoneNumber = set.getString("phone_number");
                String website = set.getString("website");
                String biography = set.getString("biography");
                String avatar = set.getString("avatar");
                return new User(id, fullname, username, email, gender, phoneNumber, website, biography, avatar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUser(String email, String password) {
        String query = "SELECT * FROM [Users] AS a JOIN [Role] as b on [a].id=[b].uid WHERE [email]=? AND [password]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet set = statement.executeQuery();
            set.next();
            int size = set.getRow();
            if (size >= 1) {
                String id = set.getString("id");
                String fullname = set.getString("fullname");
                String username = set.getString("username");
                int gender = set.getInt("gender");
                String phoneNumber = set.getString("phone_number");
                String website = set.getString("website");
                String biography = set.getString("biography");
                String avatar = set.getString("avatar");
                String role = set.getString("role");
                User user = new User(id, fullname, username, email, gender, phoneNumber, website, biography, avatar);
                user.setRole(role);
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<User> getUsers(){
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM [Users] AS a JOIN [Role] AS b on [a].id=[b].uid WHERE [b].[role]='user'";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while(set.next()){
                String id = set.getString("id");
                String fullname = set.getString("fullname");
                String username = set.getString("username");
                String email = set.getString("email");
                int gender = set.getInt("gender");
                String phoneNumber = set.getString("phone_number");
                String website = set.getString("website");
                String biography = set.getString("biography");
                String avatar = set.getString("avatar");
                users.add(new User(id, fullname, username, email, gender, phoneNumber, website, biography, avatar));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
    
    public List<User> getUsersIncludeRole(){
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM [Users] AS a JOIN [Role] AS b on [a].id=[b].uid";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while(set.next()){
                String id = set.getString("id");
                String fullname = set.getString("fullname");
                String username = set.getString("username");
                String email = set.getString("email");
                String password = set.getString("password");
                int gender = set.getInt("gender");
                String phoneNumber = set.getString("phone_number");
                String website = set.getString("website");
                String biography = set.getString("biography");
                String avatar = set.getString("avatar");
                String role = set.getString("role");
                User user = new User(id, fullname, username, email, gender, phoneNumber, website, biography, avatar);
                user.setRole(role);
                user.setPassword(password);
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public int insertUser(User u) {
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
    
    public List<Relationship> getRelationships(){
        List<Relationship> relationships = new ArrayList<Relationship>();
        String query = "SELECT * FROM [Relationship]";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            while(set.next()){
                String uid = set.getString("uid");
                String friendId = set.getString("friend_id");
                relationships.add(new Relationship(uid, friendId));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return relationships;
    }

    public int insertRole(String uid) {
        String role = "user";
        String query = "INSERT INTO [Role] VALUES(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, role);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int updateUser(String id, User u) {
        String query = "UPDATE [Users] "
                + "SET [fullname]=?, [username]=?, [gender]=?, [phone_number]=?, [website]=?, [biography]=?, [avatar]=? "
                + "WHERE [id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, u.getFullname());
            statement.setString(2, u.getUsername());
            statement.setInt(3, u.getGender());
            statement.setString(4, u.getPhoneNumber());
            statement.setString(5, u.getWebsite());
            statement.setString(6, u.getBiography());
            statement.setString(7, u.getAvatar());
            statement.setString(8, id);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public int updateAvatar(String id, String avatar){
        String query = "UPDATE [Users] "
                + "SET [avatar]=? "
                + "WHERE [id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, avatar);
            statement.setString(2, id);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public boolean checkRelationship(String uid, String friendId){
        String query = "SELECT * FROM [Relationship] WHERE [uid]=? AND [friend_id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, friendId);
            ResultSet set = statement.executeQuery();
            set.next();
            int row = set.getRow();
            if(row > 0){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public int follow(String uid, String friendId){
        System.out.println("Follow");
        String query = "INSERT INTO [Relationship] VALUES(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, friendId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return -1;
    }
    
    public int unfollow(String uid, String friendId){
        System.out.println("Unfollow");
        System.out.println("ID: " + uid + " - " + friendId);
        String query = "DELETE FROM [Relationship] WHERE [uid]=? AND [friend_id]=?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.setString(2, friendId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return -1;
    }
    
    public void followAction(String uid, String friendId){
        if (checkRelationship(uid, friendId)) {
            unfollow(uid, friendId);
        } else {
            follow(uid, friendId);
        }
    }
    
    public int insertFavoritePost(String uid, String postId){
        return -1;
    }
    
    public int removeFavoritePost(String uid, String postId){
        return -1;
    }
    
    public void logout(HttpSession session){
        session.removeAttribute(Constant.SESSION_ID);
        session.removeAttribute(Constant.SESSION_POSTS);
        session.removeAttribute(Constant.SESSION_USER);
        session.removeAttribute(Constant.SESSION_CURRENT_USER_POSTS);
        session.removeAttribute(Constant.SESSION_IS_ME);
    }
}
