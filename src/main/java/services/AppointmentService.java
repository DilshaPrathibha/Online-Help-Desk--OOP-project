package services;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Appointment;
import utils.DBconnect;

public class AppointmentService {

    

    // READ by ID
    public Appointment getAppointmentById(int id) {
        Appointment appoin = null;
        try {
            Connection con = DBconnect.getConnection();
            String query = "SELECT * FROM appointment WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                appoin = new Appointment();
                appoin.setId(rs.getInt("id"));
                appoin.setName(rs.getString("name"));
                appoin.setEmail(rs.getString("email"));
                appoin.setTel(rs.getString("tel"));
                appoin.setReason(rs.getString("reason"));
                appoin.setDate(rs.getString("date"));
                appoin.setMode(rs.getString("mode"));
                appoin.setCounselor(rs.getString("counselor"));
                appoin.setConcern(rs.getString("concern"));
                appoin.setStatus(rs.getString("status"));
                appoin.setStid(rs.getString("stid"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appoin;
    }

    public boolean updateAppointment(Appointment appoin) {
        try (Connection con = DBconnect.getConnection()) {
            String query = "UPDATE appointment SET name=?, email=?, tel=?, reason=?, date=?, mode=?, " +
                         "counselor=?, concern=?, status=? WHERE id=?";
            
            try (PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setString(1, appoin.getName());
                pstmt.setString(2, appoin.getEmail());
                pstmt.setString(3, appoin.getTel());
                pstmt.setString(4, appoin.getReason());
                pstmt.setString(5, appoin.getDate());
                pstmt.setString(6, appoin.getMode());
                pstmt.setString(7, appoin.getCounselor());
                pstmt.setString(8, appoin.getConcern());
                pstmt.setString(9, appoin.getStatus() != null ? appoin.getStatus() : "PENDING");
                pstmt.setInt(10, appoin.getId());
                
                int result = pstmt.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            System.out.println("Error while updating appointment:");
            e.printStackTrace();
            return false;
        }
    }
 
    
    public boolean deleteAppointment(int id) {
        try (Connection con = DBconnect.getConnection()) {
            String sql = "DELETE FROM appointment WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, id);
                int rows = ps.executeUpdate();
                return rows > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean createAppointment(Appointment appoin) {
        boolean success = false;
        try (Connection con = DBconnect.getConnection()) {
            String query = "INSERT INTO appointment (name, email, tel, reason, date, mode, counselor, concern, status, stid) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
                pstmt.setString(1, appoin.getName());
                pstmt.setString(2, appoin.getEmail());
                pstmt.setString(3, appoin.getTel());
                pstmt.setString(4, appoin.getReason());
                pstmt.setString(5, appoin.getDate());
                pstmt.setString(6, appoin.getMode());
                pstmt.setString(7, appoin.getCounselor());
                pstmt.setString(8, appoin.getConcern());
                pstmt.setString(9, appoin.getStatus() != null ? appoin.getStatus() : "PENDING");
                pstmt.setString(10, (appoin.getStid())); // Changed to parseInt

                int result = pstmt.executeUpdate();

                if (result > 0) {
                    try (ResultSet rs = pstmt.getGeneratedKeys()) {
                        if (rs.next()) {
                            appoin.setId(rs.getInt(1));
                        }
                    }
                    success = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error while inserting appointment:");
            e.printStackTrace();
        }
        return success;
    }
    
 // In AppointmentService.java
    public List<Appointment> getAppointmentsByStudentId(String stid) {
        List<Appointment> appointments = new ArrayList<>();
        
        try (Connection con = DBconnect.getConnection()) {
            String query = "SELECT * FROM appointment WHERE stid = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, stid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Appointment appoin = new Appointment();
                appoin.setId(rs.getInt("id"));
                appoin.setName(rs.getString("name"));
                appoin.setEmail(rs.getString("email"));
                appoin.setTel(rs.getString("tel"));
                appoin.setReason(rs.getString("reason"));
                appoin.setDate(rs.getString("date"));
                appoin.setMode(rs.getString("mode"));
                appoin.setCounselor(rs.getString("counselor"));
                appoin.setConcern(rs.getString("concern"));
                appoin.setStatus(rs.getString("status"));
                appoin.setStid(rs.getString("stid"));
                appointments.add(appoin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }
    
    /*public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        
        try (Connection con = DBconnect.getConnection()) {
            String query = "SELECT a.*, s.fullname as student_name FROM appointment a " +
                         "LEFT JOIN student s ON a.stid = s.stdid " +
                         "ORDER BY a.date DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Appointment app = new Appointment();
                app.setId(rs.getInt("id"));
                app.setName(rs.getString("student_name")); // Student's name instead of appointment name
                app.setEmail(rs.getString("email"));
                app.setTel(rs.getString("tel"));
                app.setReason(rs.getString("reason"));
                app.setDate(rs.getString("date"));
                app.setMode(rs.getString("mode"));
                app.setCounselor(rs.getString("counselor"));
                app.setConcern(rs.getString("concern"));
                app.setStatus(rs.getString("status"));
                app.setStid(rs.getString("stid"));
                appointments.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }*/
    
  
    
        
        public List<Appointment> getAllAppointments() {
            List<Appointment> appointments = new ArrayList<>();
            Connection connection = null;
            
            try {
                connection = DBconnect.getConnection();
                String sql = "SELECT * FROM appointment ORDER BY date DESC";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
                
                while (resultSet.next()) {
                    Appointment appointment = new Appointment();
                    appointment.setId(resultSet.getInt("id"));
                    appointment.setName(resultSet.getString("name"));
                    appointment.setEmail(resultSet.getString("email"));
                    appointment.setTel(resultSet.getString("tel"));
                    appointment.setReason(resultSet.getString("reason"));
                    appointment.setDate(resultSet.getString("date"));
                    appointment.setMode(resultSet.getString("mode"));
                    appointment.setCounselor(resultSet.getString("counselor"));
                    appointment.setConcern(resultSet.getString("concern"));
                    appointment.setStatus(resultSet.getString("status"));
                    appointment.setStid(resultSet.getString("stid"));
                    
                    appointments.add(appointment);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            
            return appointments;
        }
        
        public boolean updateAppointmentStatus(int appointmentId, String newStatus) {
            Connection connection = null;
            boolean success = false;
            
            try {
                connection = DBconnect.getConnection();
                String sql = "UPDATE appointment SET status = ? WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, newStatus);
                statement.setInt(2, appointmentId);
                
                int rowsAffected = statement.executeUpdate();
                success = rowsAffected > 0;
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            
            return success;
        }
    }
    

