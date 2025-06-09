package model;


import java.sql.Date;

public class Student {
	
	String fullname;
	String  email;
	String phonenumber;
	String stdid;
	Date dob;
	int Semester;
	String fos;
	String username;
	String password;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String  getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getStdid() {
		return stdid;
	}
	public void setStdid(String stdid) {
		this.stdid = stdid;
	}
	public int getSemester() {
		return Semester;
	}
	public void setSemester(int semester) {
		Semester = semester;
	}
	public String getFos() {
		return fos;
	}
	public void setFos(String fos) {
		this.fos = fos;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDob() {
		// TODO Auto-generated method stub
		return this.dob;
	}
	
	
	

}

