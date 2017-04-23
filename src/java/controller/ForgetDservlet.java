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
public class ForgetDservlet extends HttpServlet {

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
           PasswordEncryption p=new PasswordEncryption();
           String uname = request.getParameter("uname");
           String otp = request.getParameter("otp");
           String pass = p.encryptPassword(request.getParameter("pass"));
           OtpDonorDAO o = new OtpDonorDAO();
           boolean b= o.checkOtp(uname, otp);
           ForgetPassword f = new ForgetPassword();
           LoginDonorDAO l = new LoginDonorDAO();
           f.setUname(uname);
           f.setNpass(pass);
           RegisterDonorDAO r =new RegisterDonorDAO();
           String name = r.getName(uname);
           String email = r.getEmail(uname);
           SendEmail s = new SendEmail();
           String message = "Hi "+name+", Your password has been changed recently";
           
           if(b){
               l.changeDPassword(f);
               o.deleteOtp(uname);
               s.sendEmail(email, message,"For Verifiaction");
               response.sendRedirect("passwordchanged.jsp");
           }
           else{
               response.sendRedirect("changeDpassword.jsp");
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
