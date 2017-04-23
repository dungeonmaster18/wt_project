/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author umesh
 */
public class DonorServlet extends HttpServlet {

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
            PasswordEncryption p= new PasswordEncryption();
            String name = request.getParameter("dname");
            String gender = request.getParameter("gender");
            String address = request.getParameter("addr");
            String zipcode = request.getParameter("zipcode");
            String phone_number = request.getParameter("pnum");
            String emailid = request.getParameter("email");
            String uname = request.getParameter("uname");
            String password = p.encryptPassword(request.getParameter("pass"));
            String age = request.getParameter("age");
            String bloodgroup = request.getParameter("bgroup");
            String lastdate = request.getParameter("ldo");
            
            RegisterDonorDAO rdao= new RegisterDonorDAO();
            DonorRF d = new DonorRF(name, gender, address, zipcode, phone_number, emailid, uname, password, age, bloodgroup, lastdate);
            int c=rdao.createDonorAccount(d);
            SendEmail s=new SendEmail();
            String message="Hi "+name+",You have been Successfully registered to our system";


            if (c>0) {
                s.sendEmail(emailid,message,"For Verification");
                RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
                view.forward(request, response);
            }
            else{
                response.sendRedirect("formd.jsp");
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
