/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.api.client.http.FileContent;
import com.google.api.client.util.IOUtils;
import com.google.api.services.drive.Drive;
import data.local.CommentDAO;
import data.local.PostDAO;
import data.local.UserDAO;
import data.model.Comment;
import data.model.Post;
import data.service.GoogleDriveService;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utils.Constant;
import utils.WebUtils;

/**
 *
 * @author H2PhySicS
 */
@WebServlet("/upload")
@MultipartConfig
public class HomeController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute(Constant.SESSION_ID);
        PostDAO dbPost = new PostDAO();
        List<Post> posts = dbPost.getPosts(uid);
        session.setAttribute(Constant.SESSION_POSTS, posts);
        if (request.getParameter("btnUpload") != null) {
            String path = "uploadFiles";
            Part part = request.getPart("fileupload");
            String fileName = WebUtils.extractFileName(part);
            OutputStream output = null;
            InputStream input = null;
            PrintWriter writer = response.getWriter();
            try {
                output = new FileOutputStream(new File(path + File.separator + fileName));
                input = part.getInputStream();
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = input.read(bytes)) != -1) {
                    output.write(bytes, 0, read);
                }

                File file = new File(path + File.separator + fileName);
                Drive drive = GoogleDriveService.getDriveService();
                com.google.api.services.drive.model.File fileMetadata = new com.google.api.services.drive.model.File();
                fileMetadata.setName(fileName);
                fileMetadata.setParents(Collections.singletonList(Constant.FOLDER_ID));
                FileContent fileContent = new FileContent("image/jpeg", file);
                com.google.api.services.drive.model.File uploadFile = drive.files().create(fileMetadata, fileContent)
                        .setFields("*")
                        .execute();
                GoogleDriveService.insertPermission(drive, uploadFile.getId());
                String actualLink = "https://docs.google.com/uc?id=" + uploadFile.getId();
                String postContent = request.getParameter("txtPostContent");
                Date time = new Date();
                int row = dbPost.insertPost(new Post(String.valueOf(time.getTime()), uid, actualLink, postContent, time));
                if (row != -1) {
                    posts = dbPost.getPosts(uid);
                    session.setAttribute(Constant.SESSION_POSTS, posts);
                    response.sendRedirect("user/home.jsp");
                }
            } catch (FileNotFoundException exception) {
                writer.println("Error upload <br/> " + exception.getMessage());
            } finally {
                if (output != null) {
                    output.close();
                }
                if (input != null) {
                    input.close();
                }
                if (writer != null) {
                    writer.close();
                }
            }

        } else if (request.getParameter("btnComment") != null) {
            String content = request.getParameter("txtComment");
            String postId = request.getParameter("txtPostId");
            Date time = new Date();
            Comment comment = new Comment(String.valueOf(time.getTime()), uid, postId, content, time);
            CommentDAO dbComment = new CommentDAO();
            dbComment.insertComment(comment);
            response.sendRedirect("user/home.jsp");
        } else if (request.getParameter("friend_id") != null) {
            String friendId = request.getParameter("friend_id");
            UserDAO dbUser = new UserDAO();
            if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_FOLLOW)) {
                dbUser.follow(uid, friendId);
            } else if (request.getParameter("action").equalsIgnoreCase(Constant.ACTION_UNFOLLOW)) {
                dbUser.unfollow(uid, friendId);
            }
            posts = dbPost.getPosts(uid);
            session.setAttribute(Constant.SESSION_POSTS, posts);
            response.sendRedirect("user/home.jsp");
        } else {
            response.sendRedirect("user/home.jsp");
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
