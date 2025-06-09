package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        
        String username = "root";
        String password = "123456";
        
        // Load the MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish the connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/helpdesk?characterEncoding=utf8", username, password);
        
        return con;
    } 
}

