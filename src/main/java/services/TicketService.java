package services;

import model.Ticket;
import utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketService {

    // Create a new ticket
    public boolean createTicket(Ticket ticket) {
    	String query = "INSERT INTO tickets (name, email, issue_type, description, attachment, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = utils.DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, ticket.getName());
            stmt.setString(2, ticket.getEmail());
            stmt.setString(3, ticket.getIssueType());
            stmt.setString(4, ticket.getDescription());
            stmt.setString(5, ticket.getAttachment());
            stmt.setString(6, ticket.getStatus());
            //stmt.setTimestamp(7, ticket.getCreatedAt()); remove this
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve a ticket by ID
    public Ticket getTicket(int ticketId) {
        String query = "SELECT * FROM tickets WHERE ticket_id = ?";
        try (Connection connection = utils.DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticketId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setName(rs.getString("name"));
                ticket.setEmail(rs.getString("email"));
                ticket.setIssueType(rs.getString("issue_type"));
                ticket.setDescription(rs.getString("description"));
                ticket.setAttachment(rs.getString("attachment"));
                ticket.setStatus(rs.getString("status"));
                ticket.setCreatedAt(rs.getTimestamp("created_at"));
                return ticket;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieve all tickets
    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT * FROM tickets";
        try (Connection connection = utils.DBConnection.getConnection();  // try catch
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setName(rs.getString("name"));
                ticket.setEmail(rs.getString("email"));
                ticket.setIssueType(rs.getString("issue_type"));
                ticket.setDescription(rs.getString("description"));
                ticket.setAttachment(rs.getString("attachment"));
                ticket.setStatus(rs.getString("status"));
                ticket.setCreatedAt(rs.getTimestamp("created_at"));
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }

    public boolean updateTicket(int id, String subject, String description, String status) {
        String query = "UPDATE tickets SET subject = ?, description = ?, status = ? WHERE ticket_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, subject);
            stmt.setString(2, description);
            stmt.setString(3, status);
            stmt.setInt(4, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Delete a ticket
    public boolean deleteTicket(int ticketId) {
        String query = "DELETE FROM tickets WHERE ticket_id = ?";
        try (Connection connection = utils.DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticketId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

	public boolean updateTicketStatus(int ticketId, String status) { // need for servlet
		// TODO Auto-generated method stub
		return false;
	}

	public Ticket getTicketId(int ticketId) { // need for servlet
		// TODO Auto-generated method stub
		return null;
	}
}
