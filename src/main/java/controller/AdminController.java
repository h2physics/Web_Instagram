/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import data.local.CommentDAO;
import data.local.PostDAO;
import data.local.UserDAO;
import data.model.Comment;
import data.model.Favorite;
import data.model.Post;
import data.model.Relationship;
import data.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constant;

/**
 *
 * @author H2PhySicS
 */
public class AdminController extends HttpServlet {

    private void clearSession(HttpSession session) {
        session.removeAttribute(Constant.SESSION_ADMIN_USER);
        session.removeAttribute(Constant.SESSION_ADMIN_POST);
        session.removeAttribute(Constant.SESSION_ADMIN_COMMENT);
        session.removeAttribute(Constant.SESSION_ADMIN_RELATIONSHIP);
        session.removeAttribute(Constant.SESSION_ADMIN_FAVORITE);
    }

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
        clearSession(session);
        if (!request.getParameter("action").equalsIgnoreCase(Constant.ACTION_LOGOUT)) {
            if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_USER)) {
                UserDAO dbUser = new UserDAO();
                List<User> users = dbUser.getUsersIncludeRole();
                session.setAttribute(Constant.SESSION_ADMIN_USER, users);
            } else if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_POST)) {
                System.out.println("Action post");
                PostDAO dbPost = new PostDAO();
                List<Post> posts = dbPost.getPosts();
                session.setAttribute(Constant.SESSION_ADMIN_POST, posts);
            } else if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_COMMENT)) {
                CommentDAO dbComment = new CommentDAO();
                List<Comment> comments = dbComment.getComments();
                session.setAttribute(Constant.SESSION_ADMIN_COMMENT, comments);
            } else if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_RELATIONSHIP)) {
                UserDAO dbUser = new UserDAO();
                List<Relationship> relationships = dbUser.getRelationships();
                session.setAttribute(Constant.SESSION_ADMIN_RELATIONSHIP, relationships);
            } else if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_FAVORITE)) {
                PostDAO dbPost = new PostDAO();
                List<Favorite> favorites = dbPost.getFavorite();
                session.setAttribute(Constant.SESSION_ADMIN_FAVORITE, favorites);
            } else if (request.getParameter("action").equalsIgnoreCase("delete")) {
                if (request.getParameter("commentId") != null) {
                    CommentDAO dbComment = new CommentDAO();
                    String commentId = request.getParameter("commentId");
                    dbComment.deleteComment(commentId);
                    List<Comment> comments = dbComment.getComments();
                    session.setAttribute(Constant.SESSION_ADMIN_COMMENT, comments);
                }
            } else if (request.getParameter("action").equalsIgnoreCase("unlike")) {
                if (request.getParameter("postId") != null && request.getParameter("uid") != null) {
                    PostDAO dbPost = new PostDAO();
                    String postId = request.getParameter("postId");
                    String uid = request.getParameter("uid");
                 //   dbPost.likePost(uid, postId);
                    dbPost.unlikePost(uid, postId);
                    List<Favorite> favorites = dbPost.getFavorite();
                    System.out.println("favorite : " + favorites.size());
                    session.setAttribute(Constant.SESSION_ADMIN_FAVORITE, favorites);
                }
            } else if (request.getParameter("action").equalsIgnoreCase("unfollow")) {
                if (request.getParameter("friendId") != null && request.getParameter("uid") != null) {
                    UserDAO dbUser = new UserDAO();
                    String friendId = request.getParameter("friendId");
                    String uid = request.getParameter("uid");
                    dbUser.unfollow(uid, friendId);
                    List<Relationship> relationships = dbUser.getRelationships();
                    session.setAttribute(Constant.SESSION_ADMIN_RELATIONSHIP, relationships);
                }
            }

            response.sendRedirect("admin/index.jsp");
        } else {
            session.removeAttribute(Constant.SESSION_ID);
            response.sendRedirect("login.jsp");
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
