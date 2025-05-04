package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            // Construct the URL for the connection
            String url = "jdbc:mysql://localhost:3306/" + ConnectionData.DATABASE;
            
            // Get the username and password from ConnectionData class
            String username = ConnectionData.USERNAME;
            String password = ConnectionData.PASSWORD;

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish and return the connection
            return DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            // Print any exceptions to help with debugging
            e.printStackTrace();
            return null;
        }
    }
}
