package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Student;
import utils.DBconnect;

public class Studentservice {
    
    public void regstudent(Student st) {
        String query = "INSERT INTO student (stid, fullname, email, phone, semester, field, DOB, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, st.getStdid());
            ps.setString(2, st.getFullname());
            ps.setString(3, st.getEmail());
            ps.setString(4, st.getPhonenumber());
            ps.setInt(5, st.getSemester());
            ps.setString(6, st.getFos());
            ps.setDate(7, st.getDob());
            ps.setString(8, st.getUsername());
            ps.setString(9, st.getPassword());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean authenticate(String username, String password) {
        String query = "SELECT username FROM student WHERE username = ? AND password = ?";
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Student getStudentByUsername(String username) {
        String query = "SELECT * FROM student WHERE username = ?";
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Student student = new Student();
                student.setStdid(rs.getString("stid"));
                student.setFullname(rs.getString("fullname"));
                student.setEmail(rs.getString("email"));
                student.setPhonenumber(rs.getString("phone"));
                student.setSemester(rs.getInt("semester"));
                student.setFos(rs.getString("field"));
                student.setDob(rs.getDate("DOB"));
                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));
                return student;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean updateStudent(Student student) {
        String query = "UPDATE student SET fullname=?, email=?, phone=?, semester=?, field=?, DOB=? WHERE stid=?";
        
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, student.getFullname());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getPhonenumber());
            ps.setInt(4, student.getSemester());
            ps.setString(5, student.getFos());
            ps.setDate(6, student.getDob());
            ps.setString(7, student.getStdid());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT stid, fullname, email, phone, semester, field, DOB, username FROM student";
        
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Student student = new Student();
                student.setStdid(rs.getString("stid"));
                student.setFullname(rs.getString("fullname"));
                student.setEmail(rs.getString("email"));
                student.setPhonenumber(rs.getString("phone"));
                student.setSemester(rs.getInt("semester"));
                student.setFos(rs.getString("field"));
                student.setDob(rs.getDate("DOB"));
                student.setUsername(rs.getString("username"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }
    
    public boolean deleteStudentById(String stid) {
        Connection con = null;
        try {
            con = DBconnect.getConnection();
            con.setAutoCommit(false); // Start transaction

            // 1. First delete transactions (has ON DELETE CASCADE for credit_cards)
            String deleteTransactionsQuery = "DELETE FROM transaction WHERE student_stid = ?";
            try (PreparedStatement ps = con.prepareStatement(deleteTransactionsQuery)) {
                ps.setString(1, stid);
                ps.executeUpdate();
            }

            // 2. Delete credit cards (foreign key to student)
            String deleteCreditCardsQuery = "DELETE FROM credit_cards WHERE student_stid = ?";
            try (PreparedStatement ps = con.prepareStatement(deleteCreditCardsQuery)) {
                ps.setString(1, stid);
                ps.executeUpdate();
            }

            // 3. Delete appointments (foreign key to student)
            String deleteAppointmentsQuery = "DELETE FROM appointment WHERE stid = ?";
            try (PreparedStatement ps = con.prepareStatement(deleteAppointmentsQuery)) {
                ps.setString(1, stid);
                ps.executeUpdate();
            }

            // 4. Delete forum replies (if any, though not in your current schema)
            // String deleteForumRepliesQuery = "DELETE FROM forum_replies WHERE student_id = ?";
            // try (PreparedStatement ps = con.prepareStatement(deleteForumRepliesQuery)) {
            //     ps.setString(1, stid);
            //     ps.executeUpdate();
            // }

            // 5. Delete forum posts (if any, though not in your current schema)
            // String deleteForumPostsQuery = "DELETE FROM forum_posts WHERE student_id = ?";
            // try (PreparedStatement ps = con.prepareStatement(deleteForumPostsQuery)) {
            //     ps.setString(1, stid);
            //     ps.executeUpdate();
            // }

            // 6. Finally delete the student
            String deleteStudentQuery = "DELETE FROM student WHERE stid = ?";
            try (PreparedStatement ps = con.prepareStatement(deleteStudentQuery)) {
                ps.setString(1, stid);
                int rows = ps.executeUpdate();
                
                if (rows > 0) {
                    con.commit(); // Commit transaction if all deletions succeeded
                    return true;
                }
                return false;
            }
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback(); // Rollback if any error occurs
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true); // Reset auto-commit
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}