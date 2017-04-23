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
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author umesh
 */
public class OtpDonorDAO extends BaseDAO {

    Connection con;
    PreparedStatement ps = null;
    Statement s = null;
    ResultSet rs = null;
    int count = 0;

    public boolean checkUsername(String uname) {

        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.donor where username='" + uname + "' ");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OtpDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public String getPhoneNumber(String uname) {
        String ToNumber = "";
        con = getConnection();
        String sql = "Select phone_number From public.donor where username='" + uname + "'";
        try {
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while (rs.next()) {
                ToNumber = rs.getString("phone_number");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OtpDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ToNumber;
    }

    public void insertOTP(String uname, String otp) {

        con = getConnection();
        String sql = "Update public.donor set otp='" + otp + "' where username='" + uname + "'";
        try {
            s = con.createStatement();
            s.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(OtpDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean checkOtp(String uname, String otp) {
        con = getConnection();
        try {
            s = con.createStatement();
            rs = s.executeQuery("select * from public.donor where username='" + uname + "' and otp='" + otp + "'");
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OtpDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void deleteOtp(String uname) {
        con = getConnection();
        try {
            String sql = "Update public.donor Set otp=? where username=?";
            ps = con.prepareStatement(sql);
            ps.setNull(1, Types.VARCHAR);
            ps.setString(2, uname);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OtpDonorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
