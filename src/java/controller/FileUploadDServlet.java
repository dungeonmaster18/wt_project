package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadDServlet extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "C:\\Users\\umesh\\Desktop\\profile_pic\\donor";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        System.out.println(uname);
        RegisterDonorDAO r = new RegisterDonorDAO();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                        System.out.println(name);
                        String img ="profile_pic/donor/"+name;
                        r.insertImg(img, "Umesh");
                        Login l =new Login();
                        l.setUname(uname);
                        l.setImg(img);
                    } 
                    
                }
                response.sendRedirect("profile_donor.jsp");
            } catch (Exception ex) {
            }

        } else {
            response.sendRedirect("uploadd.jsp");
        }

    }

}
