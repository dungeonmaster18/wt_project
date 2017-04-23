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
public class DonorRF {

    private String name;
    private String gender;
    private String address;
    private String zipcode;
    private String phone_number;
    private String emailid;
    private String uname;
    private String password;
    private String age;
    private String bloodgroup;
    private String lastdate;

    public DonorRF(String name, String gender, String address, String zipcode, String phone_number, String emailid, String uname, String password, String age, String bloodgroup, String lastdate) {
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.zipcode = zipcode;
        this.phone_number = phone_number;
        this.emailid = emailid;
        this.uname = uname;
        this.password = password;
        this.age = age;
        this.bloodgroup = bloodgroup;
        this.lastdate = lastdate;
    }

    public DonorRF() {
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public String getLastdate() {
        return lastdate;
    }

    public void setLastdate(String lastdate) {
        this.lastdate = lastdate;
    }

}
