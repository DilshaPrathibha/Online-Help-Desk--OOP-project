package services;

import model.Ticket;
import utils.DBconnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketService {


	public boolean createTicket(Ticket ticket) {
        String query = "INSERT INTO tickets (name, student_id, faculty, email, phone, issue_type, subject, description, attachment, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBconnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, ticket.getName());
            stmt.setString(2, ticket.getStudentId());
            stmt.setString(3, ticket.getFaculty());
            stmt.setString(4, ticket.getEmail());
            stmt.setString(5, ticket.getPhone());
            stmt.setString(6, ticket.getIssueType());
            stmt.setString(7, ticket.getSubject());
            stmt.setString(8, ticket.getDescription());
            stmt.setString(9, ticket.getAttachment());
            stmt.setString(10, ticket.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public Ticket getTicket(int ticketId) {
        String query = "SELECT * FROM tickets WHERE ticket_id = ?";
        try (Connection connection = DBconnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticketId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setName(rs.getString("name"));
                ticket.setStudentId(rs.getString("student_id"));
                ticket.setFaculty(rs.getString("faculty"));
                ticket.setEmail(rs.getString("email"));
                ticket.setPhone(rs.getString("phone"));
                ticket.setIssueType(rs.getString("issue_type"));
                ticket.setSubject(rs.getString("subject"));
                ticket.setDescription(rs.getString("description"));
                ticket.setAttachment(rs.getString("attachment"));
                ticket.setStatus(rs.getString("status"));
                ticket.setReply(rs.getString("reply"));
                ticket.setCreatedAt(rs.getTimestamp("created_at"));
                return ticket;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT * FROM tickets";
        try (Connection connection = DBconnect.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setName(rs.getString("name"));
                ticket.setStudentId(rs.getString("student_id"));
                ticket.setFaculty(rs.getString("faculty"));
                ticket.setEmail(rs.getString("email"));
                ticket.setPhone(rs.getString("phone"));
                ticket.setIssueType(rs.getString("issue_type"));
                ticket.setSubject(rs.getString("subject"));
                ticket.setDescription(rs.getString("description"));
                ticket.setAttachment(rs.getString("attachment"));
                ticket.setStatus(rs.getString("status"));
                ticket.setReply(rs.getString("reply"));
                ticket.setCreatedAt(rs.getTimestamp("created_at"));
                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }


    public boolean updateTicket(int id, String subject, String description, String status, String reply) {
        String query = "UPDATE tickets SET subject = ?, description = ?, status = ?, reply = ? WHERE ticket_id = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, subject);
            stmt.setString(2, description);
            stmt.setString(3, status);
            stmt.setString(4, reply);   
            stmt.setInt(5, id);        
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }



    public boolean deleteTicket(int ticketId) {
        String query = "DELETE FROM tickets WHERE ticket_id = ?";
        try (Connection connection = DBconnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticketId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean updateTicketStatus(int ticketId, String status) {
        String query = "UPDATE tickets SET status = ? WHERE ticket_id = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, ticketId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve tickets by student ID 
    public List<Ticket> getTicketsByStudentId(String studentId) {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT * FROM tickets WHERE student_id = ? ORDER BY created_at DESC";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setTicketId(rs.getInt("ticket_id"));
                t.setName(rs.getString("name"));
                t.setStudentId(rs.getString("student_id"));
                t.setFaculty(rs.getString("faculty"));
                t.setSubject(rs.getString("subject"));
                t.setEmail(rs.getString("email"));
                t.setPhone(rs.getString("phone"));
                t.setIssueType(rs.getString("issue_type"));
                t.setDescription(rs.getString("description"));
                t.setAttachment(rs.getString("attachment"));
                t.setStatus(rs.getString("status"));
                t.setReply(rs.getString("reply"));
                t.setCreatedAt(rs.getTimestamp("created_at"));
                tickets.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tickets;
    }


    public List<Ticket> searchTickets(String name, String faculty, String status, String issueType) {
        List<Ticket> tickets = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM tickets WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (name != null && !name.isEmpty()) {
            query.append(" AND name LIKE ?");
            params.add("%" + name + "%");
        }
        if (faculty != null && !faculty.isEmpty()) {
            query.append(" AND faculty = ?");
            params.add(faculty);
        }
        if (status != null && !status.isEmpty()) {
            query.append(" AND status = ?");
            params.add(status);
        }
        if (issueType != null && !issueType.isEmpty()) {
            query.append(" AND issue_type = ?");
            params.add(issueType);
        }

        query.append(" ORDER BY created_at DESC");

        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setTicketId(rs.getInt("ticket_id"));
                t.setName(rs.getString("name"));
                t.setStudentId(rs.getString("student_id"));
                t.setFaculty(rs.getString("faculty"));
                t.setSubject(rs.getString("subject"));
                t.setEmail(rs.getString("email"));
                t.setPhone(rs.getString("phone"));
                t.setIssueType(rs.getString("issue_type"));
                t.setDescription(rs.getString("description"));
                t.setAttachment(rs.getString("attachment"));
                t.setStatus(rs.getString("status"));
                t.setReply(rs.getString("reply"));
                t.setCreatedAt(rs.getTimestamp("created_at"));
                tickets.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tickets;
    }
    
    public List<Ticket> getTicketsByStudentEmail(String email) {
        List<Ticket> tickets = new ArrayList<>();
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tickets WHERE email = ?")) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticketId"));
                ticket.setName(rs.getString("name"));
                ticket.setEmail(rs.getString("email"));
                ticket.setStudentId(rs.getString("studentId"));
                ticket.setSubject(rs.getString("subject"));
                ticket.setDescription(rs.getString("description"));
                ticket.setIssueType(rs.getString("issueType"));
                ticket.setFaculty(rs.getString("faculty"));
                ticket.setAttachment(rs.getString("attachment"));
                ticket.setReply(rs.getString("reply"));
                ticket.setStatus(rs.getString("status"));
                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }

}
