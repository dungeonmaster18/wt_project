/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author umesh
 */
public class ChangePasswordDServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            PasswordEncryption p = new PasswordEncryption();
            ForgetPassword f = new ForgetPassword();
            String uname = request.getParameter("uname");
            //System.out.print(uname);
            String opass = p.encryptPassword(request.getParameter("opass"));
            //System.out.print(opass);
            String npass = p.encryptPassword(request.getParameter("npass"));
            //System.out.print(npass);
            f.setUname(uname);
            f.setOpass(opass);
            f.setNpass(npass);
            LoginDonorDAO ldao = new LoginDonorDAO();
            boolean b = ldao.checkDPassword(f);
            RegisterDonorDAO r = new RegisterDonorDAO();
            String name = r.getName(uname);
            String email = r.getEmail(uname);
            SendEmail s = new SendEmail();
            String message = "Hi "+name+", Your password has been changed recently";

            if (b) {
                ldao.changeDPassword(f);
                s.sendEmail(email, message,"For Verification");
                response.sendRedirect("profile_donor.jsp");
            } else {
                response.sendRedirect("resetdpassword.jsp");
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
