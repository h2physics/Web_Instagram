/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.api.client.http.FileContent;
import com.google.api.services.drive.Drive;
import data.local.UserDAO;
import data.model.User;
import data.service.GoogleDriveService;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.Constant;
import utils.WebUtils;

/**
 *
 * @author H2PhySicS
 */
@WebServlet("/uploadAvatar")
@MultipartConfig
public class UpdateProfileController extends HttpServlet {

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

        UserDAO dbUser = new UserDAO();
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute(Constant.SESSION_ID);

        if (request.getParameter("btnUpdate") != null) {
            String avatarLink = null;
            if (request.getPart("avatar") != null) {
                Part avatarPart = request.getPart("avatar");
                String path = "uploadFiles";
                String fileName = WebUtils.extractFileName(avatarPart);
                OutputStream output = null;
                InputStream input = null;
                PrintWriter writer = response.getWriter();
                try {
                    output = new FileOutputStream(new File(path + File.separator + fileName));
                    input = avatarPart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = input.read(bytes)) != -1) {
                        output.write(bytes, 0, read);
                    }

                    File file = new File(path + File.separator + fileName);
                    Drive drive = GoogleDriveService.getDriveService();
                    com.google.api.services.drive.model.File fileMetadata = new com.google.api.services.drive.model.File();
                    fileMetadata.setName(fileName);
                    fileMetadata.setParents(Collections.singletonList(Constant.FOLDER_AVATAR_ID));
                    FileContent fileContent = new FileContent("image/jpeg", file);
                    com.google.api.services.drive.model.File uploadFile = drive.files().create(fileMetadata, fileContent)
                            .setFields("*")
                            .execute();
                    GoogleDriveService.insertPermission(drive, uploadFile.getId());
                    avatarLink = "https://docs.google.com/uc?id=" + uploadFile.getId();
                } catch (FileNotFoundException exception) {
                    writer.println("Error upload <br/> " + exception.getMessage());
                } finally {
                    if (output != null) {
                        output.close();
                    }
                    if (input != null) {
                        input.close();
                    }
//                    if (writer != null) {
//                        writer.close();
//                    }
                }
            }
            String name = request.getParameter("txtName");
            String username = request.getParameter("txtUsername");
            String website = request.getParameter("txtWebsite");
            String biography = request.getParameter("txtBiography");
            String email = request.getParameter("txtEmail");
            String phoneNumber = request.getParameter("txtPhone");
            String genderStr = request.getParameter("txtGender");
            int gender = 0;
            if (genderStr.equalsIgnoreCase("female")) {
                gender = 1;
            }
            User user = new User();
            user.setFullname(name);
            user.setUsername(username);
            user.setWebsite(website);
            user.setBiography(biography);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setGender(gender);
            String oldAvatar = dbUser.getUser(id).getAvatar();
            if(avatarLink != null){
                user.setAvatar(avatarLink);
            } else {
                user.setAvatar(oldAvatar);
            }
            dbUser.updateUser(id, user);
            response.sendRedirect("user/update_profile.jsp");
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
