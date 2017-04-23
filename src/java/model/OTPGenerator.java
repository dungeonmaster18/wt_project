/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
/**
 *
 * @author umesh
 */
public class OTPGenerator {
    
    public static String generateOTP()
    {
        int randomPIN = (int)(Math.random()*9000)+1000;
        String otp = ""+randomPIN;
        
        System.out.println(otp);
        return otp;
    }
    
    public static void main(String args[])
    {
        generateOTP();
    }
}

