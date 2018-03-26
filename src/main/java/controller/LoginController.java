/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import data.local.UserDAO;
import data.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class LoginController extends HttpServlet {

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

        UserDAO dbUser = new UserDAO();

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("btnLogin") != null) {
                String email = request.getParameter("emailLogin");
                String password = request.getParameter("passwordLogin");
                User user = dbUser.getUser(email, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute(Constant.SESSION_ID, user.getId());
                    if (user.getRole().equalsIgnoreCase(Constant.ROLE_USER)) {
                        RequestDispatcher dispatcher = request.getRequestDispatcher("HomeController");
                        dispatcher.forward(request, response);
                    } else if (user.getRole().equalsIgnoreCase(Constant.ROLE_ADMIN)) {
                        response.sendRedirect("admin/index.jsp");
                    }
                }
            } else if (request.getParameter("btnRegister") != null) {
                String email = request.getParameter("emailRegister");
                String password = request.getParameter("passwordRegister");
                String fullname = request.getParameter("fullname");
                String username = request.getParameter("username");
                String id = String.valueOf(new Date().getTime());

                User user = new User(id, fullname, username, email, password);
                int row = dbUser.insertUser(user);
                int rowRole = dbUser.insertRole(id);
                if (row >= 0 && rowRole >= 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute(Constant.SESSION_ID, id);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("HomeController");
                    dispatcher.forward(request, response);
                }

            }
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
