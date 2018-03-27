/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import data.local.PostDAO;
import data.local.UserDAO;
import data.model.Post;
import data.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constant;
import utils.WebUtils;

/**
 *
 * @author H2PhySicS
 */
public class ProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute(Constant.SESSION_ID);
        UserDAO dbUser = new UserDAO();

        if (request.getParameter("uid") != null) {
            String uid = request.getParameter("uid");

            if (uid.equals(id)) {
                navigateProfile(request, response, uid, true);
            } else {
                navigateProfile(request, response, uid, false);
            }
        } else if(request.getParameter("friend_id") != null){
            String action = request.getParameter("action");
            String friendId = request.getParameter("friend_id");
            
            if(action.equalsIgnoreCase(Constant.ACTION_FOLLOW)){
                dbUser.follow(id, friendId);
            } else if(action.equalsIgnoreCase(Constant.ACTION_UNFOLLOW)){
                dbUser.unfollow(id, friendId);
            }
            navigateProfile(request, response, friendId, false);
            
        } else if(request.getParameter("action") != null){
            dbUser.logout(session);
            response.sendRedirect("login.jsp");
        } else {
            navigateProfile(request, response, id, true);
        }
    }

    private void navigateProfile(HttpServletRequest request, HttpServletResponse response, String currentUserId, boolean isMe) {
        UserDAO dbUser = new UserDAO();
        User user = dbUser.getUser(currentUserId);
        PostDAO dbPost = new PostDAO();
        List<Post> posts = dbPost.getCurrentUserPost(currentUserId);
        System.out.println("Post size: " + posts.size());
        HttpSession session = request.getSession();
        session.setAttribute(Constant.SESSION_USER, user);
        session.setAttribute(Constant.SESSION_CURRENT_USER_POSTS, posts);
        session.setAttribute(Constant.SESSION_IS_ME, isMe);
        try {
            response.sendRedirect("user/profile.jsp");
        } catch (IOException ex) {
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
