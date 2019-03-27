/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Saiyan
 */
public class UDM {
String fname,lname,gender,dob,interest,state,email,password,about;
String mobile;

    public UDM() {
    }

    public UDM(String fname,String lname,String gender,String dob,String interest,String state,String email,String password,String mobile,String about) {
    this.fname=fname;
    this.lname=lname;
    this.gender=gender;
    this.dob=dob;
    this.interest=interest;
    this.state=state;
    this.email=email;
    this.password=password;
    this.mobile=mobile;
    this.about=about;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getGender() {
        return gender;
    }

    public String getDob() {
        return dob;
    }

    public String getInterest() {
        return interest;
    }

    public String getState() {
        return state;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getMobile() {
        return mobile;
    }

    public String getAbout() {
        return about;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
}
