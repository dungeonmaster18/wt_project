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
public class HospitalRF {

    private String name;
    private String address;
    private String zipcode;
    private String phone_number;
    private String emailid;
    private String uname;
    private String password;
    private String hcode;
    private String date;
    private String htype;

    public HospitalRF(String name, String address, String zipcode, String phone_number, String emailid, String uname, String password, String hcode, String date,String htype) {
        this.name = name;
        this.address = address;
        this.zipcode = zipcode;
        this.phone_number = phone_number;
        this.emailid = emailid;
        this.uname = uname;
        this.password = password;
        this.hcode = hcode;
        this.date = date;
        this.htype = htype;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHcode() {
        return hcode;
    }

    public void setHcode(String hcode) {
        this.hcode = hcode;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHtype() {
        return htype;
    }

    public void setHtype(String htype) {
        this.htype = htype;
    }

}
