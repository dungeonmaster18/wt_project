/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author umesh
 */
public class LoginDonorDAO extends BaseDAO {

    Connection con;
    PreparedStatement ps = null;
    Statement s = null;
    ResultSet rs = null;
    int count = 0;

    public boolean checkDLogin(Login l) {

        String uname = l.getUname();
        String password = l.getPassword();

        con = getConnection();
        try {
            String sql = "select * from public.donorlogin where username=? and password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean checkDPassword(ForgetPassword f) {
        
        String uname=f.getUname();
        //System.out.print(uname);
        String opass=f.getOpass();
        //System.out.print(opass);
        con = getConnection();
        try {
             s = con.createStatement();
            rs = s.executeQuery("select * from public.donorlogin where username='" + uname + "' and password='" + opass + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void changeDPassword(ForgetPassword f) {
        
        String uname=f.getUname();
        String npass=f.getNpass();
        con = getConnection();
        try {
            s = con.createStatement();
            String sql1= "Update public.donorlogin Set password='" + npass + "' Where username='" + uname + "'";
            String sql2="Update public.donor Set password='" + npass + "' Where username='" + uname + "'";
            s.executeUpdate(sql1);
            s.executeUpdate(sql2);
        } catch (SQLException ex) {
            Logger.getLogger(LoginDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getImg(String uname){
        con = getConnection();
        String img = "";
        String sql = "Select img from public.donor where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                img = rs.getString("img");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return img;
    }

}
