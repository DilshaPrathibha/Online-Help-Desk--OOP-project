package services;




	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import model.Admin;
	import utils.DBconnect;

	public class AdminService {
	    public boolean authenticate(String username, String password) throws ClassNotFoundException {
	        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
	        
	        try (Connection conn = DBconnect.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            
	            ps.setString(1, username);
	            ps.setString(2, password);
	            
	            try (ResultSet rs = ps.executeQuery()) {
	                return rs.next(); // Returns true if admin exists with these credentials
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    public Admin getAdminByUsername(String username) throws ClassNotFoundException {
	        String sql = "SELECT * FROM admin WHERE username = ?";
	        
	        try (Connection conn = DBconnect.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            
	            ps.setString(1, username);
	            
	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    Admin admin = new Admin();
	                    admin.setAdminId(rs.getInt("admin_id"));
	                    admin.setUsername(rs.getString("username"));
	                    admin.setPassword(rs.getString("password"));
	                    admin.setEmail(rs.getString("email"));
	                    admin.setFullName(rs.getString("full_name"));
	                    return admin;
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	}


