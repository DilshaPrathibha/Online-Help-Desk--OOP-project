package model;

public class Admin {

	private int adminId;
    private String username;
    private String password;
    private String email;
    private String fullName;
    
	public Admin() {
		super();
		this.adminId = 0;
		this.username = "";
		this.password = "";
		this.email = "";
		this.fullName = "";
	}
	
    
	public Admin(int adminId, String username, String password, String email, String fullName) {
		super();
		this.adminId = adminId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.fullName = fullName;
	}


	public int getAdminId() {
		return adminId;
	}


	public void setAdminId(int adminId) {
		this.adminId = adminId;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
    
    
	
}
