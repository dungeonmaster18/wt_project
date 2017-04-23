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
public class RegisterDonorDAO extends BaseDAO {

    Connection con;
    PreparedStatement ps = null;
    Statement s = null;
    ResultSet rs = null;
    int count = 0;

    public int createDonorAccount(DonorRF d) {
        con = getConnection();
        String sql1 = "insert into public.donor values(?,?,?,?,?,?,?,?,?,?,?,?)";
        String sql2 = "insert into public.donorlogin values(?,?)";
        String name = d.getName();
        String gender = d.getGender();
        String address = d.getAddress();
        String zipcode = d.getZipcode();
        String phone_number = d.getPhone_number();
        String emailid = d.getEmailid();
        String uname = d.getUname();
        String password = d.getPassword();
        String age = d.getAge();
        String bloodgroup = d.getBloodgroup();
        String lastdate = d.getLastdate();
        String img="img/img_avatar2.png";
        try {
            ps = con.prepareStatement(sql1);

            ps.setString(1, name);
            ps.setString(2, gender);
            ps.setString(3, address);
            ps.setString(4, zipcode);
            ps.setString(5, phone_number);
            ps.setString(6, emailid);
            ps.setString(7, uname);
            ps.setString(8, password);
            ps.setString(9, age);
            ps.setString(10, bloodgroup);
            ps.setString(11, lastdate);
            ps.setString(12, img);
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
            Logger.getLogger(RegisterDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return count;

    }
    
    public String getEmail(String uname){
        con = getConnection();
        String email = "";
        String sql = "Select email from public.donor where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                email = rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }
    
    public String getName(String uname){
        con = getConnection();
        String name = "";
        String sql = "Select name from public.donor where username ='"+uname+"'";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                name = rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
    
    public void insertImg(String image, String uname) {
        con = getConnection();
        String sql = "Update public.donor set img='" + image + "' where username='" + uname + "'";
         try {
            s = con.createStatement();
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public boolean sendRequest(String uname,String bgroup,String O1,String O2){
        con = getConnection();
        RegisterHospitalDAO r= new RegisterHospitalDAO();
        String phone_number=r.getPhone(uname);
        String email = "";
        String sql = "Select email from public.donor where blood_group ='"+bgroup+"' ";
        try{
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while(rs.next()){
                email = rs.getString("email");
                System.out.println(email);
                String msg="Hi,We have an emergency.If you are intrested please contact:"+phone_number;
                SendEmail s= new SendEmail();
                s.sendEmail(email, msg,"For Emergency");
                //return true;
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
