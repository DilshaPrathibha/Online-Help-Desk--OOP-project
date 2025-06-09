package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CreditCard;
import utils.DBconnect;

public class Cardservice {
    
    // Save new card
    public boolean saveCard(CreditCard card) {
        String sql = "INSERT INTO credit_cards (card_number, card_name, expiry_date, cvv, card_type, "
                   + "billing_address, zip_code, save_card, student_stid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, card.getCardNumber());
            ps.setString(2, card.getCardName());
            ps.setString(3, card.getExpiryDate());
            ps.setString(4, card.getCvv());
            ps.setString(5, card.getCardType());
            ps.setString(6, card.getBillingAddress());
            ps.setString(7, card.getZipCode());
            ps.setBoolean(8, card.isSaveCard());
            ps.setString(9, card.getStudentStid());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all cards for a student
    public List<CreditCard> getCardsByStudentId(String studentStid) throws ClassNotFoundException {
        List<CreditCard> cards = new ArrayList<>();
        String sql = "SELECT * FROM credit_cards WHERE student_stid = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, studentStid);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                CreditCard card = new CreditCard();
                card.setId(rs.getInt("id"));
                card.setCardNumber(rs.getString("card_number"));
                card.setCardName(rs.getString("card_name"));
                card.setExpiryDate(rs.getString("expiry_date"));
                card.setCvv(rs.getString("cvv"));
                card.setCardType(rs.getString("card_type"));
                card.setBillingAddress(rs.getString("billing_address"));
                card.setZipCode(rs.getString("zip_code"));
                card.setSaveCard(rs.getBoolean("save_card"));
                card.setStudentStid(rs.getString("student_stid"));
                cards.add(card);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cards;
    }
    
    // Get single card by ID
    public CreditCard getCardById(int cardId) throws ClassNotFoundException {
        String sql = "SELECT * FROM credit_cards WHERE id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, cardId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                CreditCard card = new CreditCard();
                card.setId(rs.getInt("id"));
                card.setCardNumber(rs.getString("card_number"));
                card.setCardName(rs.getString("card_name"));
                card.setExpiryDate(rs.getString("expiry_date"));
                card.setCvv(rs.getString("cvv"));
                card.setCardType(rs.getString("card_type"));
                card.setBillingAddress(rs.getString("billing_address"));
                card.setZipCode(rs.getString("zip_code"));
                card.setSaveCard(rs.getBoolean("save_card"));
                card.setStudentStid(rs.getString("student_stid"));
                return card;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Update existing card
    public boolean updateCard(CreditCard card) throws ClassNotFoundException {
        String sql = "UPDATE credit_cards SET card_number = ?, card_name = ?, expiry_date = ?, "
                   + "cvv = ?, card_type = ?, billing_address = ?, zip_code = ?, save_card = ? "
                   + "WHERE id = ? AND student_stid = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, card.getCardNumber());
            ps.setString(2, card.getCardName());
            ps.setString(3, card.getExpiryDate());
            ps.setString(4, card.getCvv());
            ps.setString(5, card.getCardType());
            ps.setString(6, card.getBillingAddress());
            ps.setString(7, card.getZipCode());
            ps.setBoolean(8, card.isSaveCard());
            ps.setInt(9, card.getId());
            ps.setString(10, card.getStudentStid());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete card
    public boolean deleteCard(int cardId, String studentStid) throws ClassNotFoundException {
        String sql = "DELETE FROM credit_cards WHERE id = ? AND student_stid = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {   
            
            ps.setInt(1, cardId);
            ps.setString(2, studentStid);
            return ps.executeUpdate() > 0;   
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
   // ....................
    
   
  
}