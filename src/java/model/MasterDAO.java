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
public class MasterDAO extends BaseDAO {

    Connection con;
    PreparedStatement ps = null;
    Statement s = null;
    ResultSet rs = null;
    int count = 0;

    public int createDonorAccount(DonorRF d) {
        con = getConnection();
        String sql1 = "insert into public.donor values(?,?,?,?,?,?,?,?,?,?,?)";
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
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }//finally
        return count;

    }

    public int createHospitalAccount(HospitalRF h) {
        con = getConnection();
        String sql1 = "insert into public.hospital values(?,?,?,?,?,?,?,?,?,?)";
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
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }//finally
        return count;

    }

    public boolean checkDLogin(Login l) {

        String uname = l.getUname();
        String password = l.getPassword();

        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.donorlogin where username='" + uname + "' and password='" + password + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean checkHLogin(Login l) {

        String uname = l.getUname();
        String password = l.getPassword();

        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.hospitallogin where username='" + uname + "' and password='" + password + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean checkDPassword(String uname, String opass) {

        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.donorlogin where username='" + uname + "' and password='" + opass + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void changeDPassword(String uname, String npass) {
        con = getConnection();
        try {
            s = con.createStatement();
            String sql1= "Update public.donorlogin Set password='" + npass + "' Where username='" + uname + "'";
            String sql2="Update public.donor Set password='" + npass + "' Where username='" + uname + "'";
            s.executeUpdate(sql1);
            s.executeUpdate(sql2);
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
    public boolean checkHPassword(String uname, String opass) {

        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.hospitallogin where username='" + uname + "' and password='" + opass + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void changeHPassword(String uname, String npass) {
        con = getConnection();
        try {
            s = con.createStatement();
            String sql1= "Update public.hospitallogin Set password='" + npass + "' Where username='" + uname + "'";
            String sql2="Update public.hospital Set password='" + npass + "' Where username='" + uname + "'";
            s.executeUpdate(sql1);
            s.executeUpdate(sql2);
        } catch (SQLException ex) {
            Logger.getLogger(MasterDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
