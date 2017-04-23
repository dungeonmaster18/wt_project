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
public class RegisterHospitalDAO extends BaseDAO {

    Connection con;
    PreparedStatement ps = null;
    Statement s = null;
    ResultSet rs = null;
    int count = 0;

    public int createHospitalAccount(HospitalRF h) {
        con = getConnection();
        String sql1 = "insert into public.hospital values(?,?,?,?,?,?,?,?,?,?,?)";
        String sql2 = "insert into public.hospitallogin values(?,?)";
        String name = h.getName();
        String address = h.getAddress();
        String zipcode = h.getZipcode();
        String phone_number = h.getPhone_number();
        String emailid = h.getEmailid();
        String uname = h.getUname();
        String password = h.getPassword();
        String hcode = h.getHcode();
        String date = h.getDate();
        String htype = h.getHtype();
        String img="img/img_avatar2.png";

        try {
            ps = con.prepareStatement(sql1);

            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, zipcode);
            ps.setString(4, phone_number);
            ps.setString(5, emailid);
            ps.setString(6, uname);
            ps.setString(7, password);
            ps.setString(8, hcode);
            ps.setString(9, date);
            ps.setString(10, htype);
            ps.setString(11, img);
            count = ps.executeUpdate();

            if (count > 0) {
                System.out.println("Successfully Inserted");
            } else {
                System.out.println("insertion failed");
            }

            ps = con.prepareStatement(sql2);

            ps.setString(1, uname);
            ps.setString(2, password);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;

    }
    
    
    public String getEmail(String uname){
        con = getConnection();
        String email = "";
        String sql = "Select email from public.hospital where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                email = rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return email;
    }
    
    public String getName(String uname){
        con = getConnection();
        String name = "";
        String sql = "Select name from public.hospital where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                name = rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return name;
    }
    
    public void insertImg(String img, String uname) {
        con = getConnection();
        String sql = "Update public.hospital set img='" + img + "' where username='" + uname + "'";
         try {
            s = con.createStatement();
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getPhone(String uname){
        con = getConnection();
        String phone = "";
        String sql = "Select phone_number from public.hospital where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                phone = rs.getString("phone_number");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterHospitalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return phone;
    }

}
