/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.api.client.http.FileContent;
import com.google.api.client.util.IOUtils;
import com.google.api.services.drive.Drive;
import data.local.PostDAO;
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
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute(Constant.SESSION_ID);
        PostDAO dbPost = new PostDAO();
        List<Post> posts = dbPost.getPosts(uid);
        for(Post p: posts){
            System.out.println(p);
        }
        request.setAttribute(Constant.HOME_LIST_POST, posts);
        if (request.getParameter("btnUpload") != null) {
            String path = request.getServletContext().getRealPath("") + File.separator + "uploadFiles";
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
                dbPost.insertPost(new Post(String.valueOf(time.getTime()), uid, actualLink, postContent, time));

                RequestDispatcher dispatcher = request.getRequestDispatcher("user/home.jsp");
                dispatcher.forward(request, response);
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

        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/home.jsp");
            dispatcher.forward(request, response);
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user/home.jsp");
//        dispatcher.forward(request, response);
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
