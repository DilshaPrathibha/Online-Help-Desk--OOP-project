package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;
import utils.DBconnect;

public class TransactionService {
    
	public boolean createTransaction(String studentId, int cardId, String materialName, 
            double price, String remarks) throws SQLException, ClassNotFoundException {

      String sql = "INSERT INTO transaction (student_stid, card_id, material_name, price, remarks) " +
         "VALUES (?, ?, ?, ?, ?)";

     try (Connection conn = DBconnect.getConnection();
     PreparedStatement stmt = conn.prepareStatement(sql)) {

     conn.setAutoCommit(false);

     try {
     stmt.setString(1, studentId);
     stmt.setInt(2, cardId);
     stmt.setString(3, materialName);
     stmt.setDouble(4, price);
     stmt.setString(5, remarks);

   int rowsAffected = stmt.executeUpdate();

 if (rowsAffected == 1) {
  conn.commit();
 return true;
 } else {
 conn.rollback();
 return false;
 }
} catch (SQLException e) {
conn.rollback();
throw e;
}
}
}
    
    public List<Transaction> getTransactionsByStudentId(String studentStid) throws ClassNotFoundException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT t.id, t.transaction_date, t.material_name, t.price, t.remarks, " +
                     "c.card_name, c.card_number " +  // Add card details
                     "FROM transaction t " +
                     "LEFT JOIN credit_cards c ON t.card_id = c.id " +
                     "WHERE t.student_stid = ? " +
                     "ORDER BY t.transaction_date DESC";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, studentStid);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                // Set basic transaction info
                transaction.setId(rs.getInt("id"));
                transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                transaction.setMaterialName(rs.getString("material_name"));
                transaction.setPrice(rs.getDouble("price"));
                transaction.setremarks(rs.getString("remarks"));
                
                // Set card display info
                transaction.setDisplayCardName(rs.getString("card_name"));
                transaction.setDisplayCardNumber(rs.getString("card_number"));
                
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
    
    
    public List<Transaction> getAllTransactions() throws ClassNotFoundException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT t.*, c.card_name, c.card_number " +
                     "FROM transaction t " +
                     "LEFT JOIN credit_cards c ON t.card_id = c.id " +
                     "ORDER BY t.transaction_date DESC";
        
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(rs.getInt("id"));
                transaction.setStudentStid(rs.getString("student_stid"));
                transaction.setCardId(rs.getInt("card_id"));
                transaction.setMaterialName(rs.getString("material_name"));
                transaction.setPrice(rs.getDouble("price"));
                transaction.setremarks(rs.getString("remarks"));
                transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                
                // Set card details
                transaction.setDisplayCardName(rs.getString("card_name"));
                transaction.setDisplayCardNumber(rs.getString("card_number"));
                
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all transactions: " + e.getMessage());
            e.printStackTrace();
        }
        return transactions;
    }
    
}
