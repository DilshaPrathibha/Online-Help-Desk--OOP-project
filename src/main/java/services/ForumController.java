package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ForumPostModel;
import model.ForumReply;
import utils.DBconnect;

public class ForumController {
    
    // Existing methods (keep these if you already have them)
    public static List<ForumPostModel> getAllPosts() throws ClassNotFoundException {
        List<ForumPostModel> posts = new ArrayList<>();
        String sql = "SELECT * FROM forum_posts ORDER BY post_date DESC";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                ForumPostModel post = new ForumPostModel();
                post.setPostId(rs.getInt("post_id"));
                post.setStudentId(rs.getString("student_id"));
                post.setFullname(rs.getString("fullname"));
                post.setDepartment(rs.getString("department"));
                post.setCourse(rs.getString("course"));
                post.setPostTitle(rs.getString("post_title"));
                post.setPostCategory(rs.getString("post_category"));
                post.setPostContent(rs.getString("post_content"));
                post.setPostDate(rs.getString("post_date"));
                post.setContactEmail(rs.getString("contact_email"));
                
                // Load replies for this post
                post.setReplies(getRepliesForPost(post.getPostId()));
                
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    public static List<ForumPostModel> searchPosts(String search, String category, String department) throws ClassNotFoundException {
        List<ForumPostModel> posts = new ArrayList<>();
        String sql = "SELECT * FROM forum_posts WHERE 1=1";
        
        if (search != null && !search.isEmpty()) {
            sql += " AND (post_title LIKE ? OR post_content LIKE ?)";
        }
        if (category != null && !category.isEmpty()) {
            sql += " AND post_category = ?";
        }
        if (department != null && !department.isEmpty()) {
            sql += " AND department = ?";
        }
        sql += " ORDER BY post_date DESC";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            int paramIndex = 1;
            if (search != null && !search.isEmpty()) {
                String searchTerm = "%" + search + "%";
                stmt.setString(paramIndex++, searchTerm);
                stmt.setString(paramIndex++, searchTerm);
            }
            if (category != null && !category.isEmpty()) {
                stmt.setString(paramIndex++, category);
            }
            if (department != null && !department.isEmpty()) {
                stmt.setString(paramIndex++, department);
            }
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ForumPostModel post = new ForumPostModel();
                    post.setPostId(rs.getInt("post_id"));
                    post.setStudentId(rs.getString("student_id"));
                    post.setFullname(rs.getString("fullname"));
                    post.setDepartment(rs.getString("department"));
                    post.setCourse(rs.getString("course"));
                    post.setPostTitle(rs.getString("post_title"));
                    post.setPostCategory(rs.getString("post_category"));
                    post.setPostContent(rs.getString("post_content"));
                    post.setPostDate(rs.getString("post_date"));
                    post.setContactEmail(rs.getString("contact_email"));
                    post.setReplies(getRepliesForPost(post.getPostId()));
                    
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    // New methods for post/reply management
    public static ForumPostModel getPostById(int postId) throws ClassNotFoundException {
        String sql = "SELECT * FROM forum_posts WHERE post_id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ForumPostModel post = new ForumPostModel();
                    post.setPostId(rs.getInt("post_id"));
                    post.setStudentId(rs.getString("student_id"));
                    post.setFullname(rs.getString("fullname"));
                    post.setDepartment(rs.getString("department"));
                    post.setCourse(rs.getString("course"));
                    post.setPostTitle(rs.getString("post_title"));
                    post.setPostCategory(rs.getString("post_category"));
                    post.setPostContent(rs.getString("post_content"));
                    post.setPostDate(rs.getString("post_date"));
                    post.setContactEmail(rs.getString("contact_email"));
                    post.setReplies(getRepliesForPost(postId));
                    
                    return post;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean deletePost(int postId) throws ClassNotFoundException {
        String sql = "DELETE FROM forum_posts WHERE post_id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static List<ForumReply> getRepliesForPost(int postId) throws ClassNotFoundException {
        List<ForumReply> replies = new ArrayList<>();
        String sql = "SELECT * FROM forum_replies WHERE post_id = ? ORDER BY reply_date";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, postId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ForumReply reply = new ForumReply();
                    reply.setReplyId(rs.getInt("reply_id"));
                    reply.setPostId(rs.getInt("post_id"));
                    reply.setStudentId(rs.getString("student_id"));
                    reply.setFullname(rs.getString("fullname"));
                    reply.setReplyContent(rs.getString("reply_content"));
                    reply.setReplyDate(rs.getString("reply_date"));
                    
                    replies.add(reply);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return replies;
    }
    
    public static boolean addReply(ForumReply reply) throws ClassNotFoundException {
        String sql = "INSERT INTO forum_replies (post_id, student_id, fullname, reply_content, reply_date) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, reply.getPostId());
            stmt.setString(2, reply.getStudentId());
            stmt.setString(3, reply.getFullname());
            stmt.setString(4, reply.getReplyContent());
            stmt.setString(5, reply.getReplyDate());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static ForumReply getReplyById(int replyId) throws ClassNotFoundException {
        String sql = "SELECT * FROM forum_replies WHERE reply_id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, replyId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ForumReply reply = new ForumReply();
                    reply.setReplyId(rs.getInt("reply_id"));
                    reply.setPostId(rs.getInt("post_id"));
                    reply.setStudentId(rs.getString("student_id"));
                    reply.setFullname(rs.getString("fullname"));
                    reply.setReplyContent(rs.getString("reply_content"));
                    reply.setReplyDate(rs.getString("reply_date"));
                    
                    return reply;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean deleteReply(int replyId) throws ClassNotFoundException {
        String sql = "DELETE FROM forum_replies WHERE reply_id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, replyId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Add this method if you need to create new posts
    public static boolean createPost(ForumPostModel post) throws ClassNotFoundException {
        String sql = "INSERT INTO forum_posts (student_id, fullname, department, course, " +
                     "post_title, post_category, post_content, post_date, contact_email) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, post.getStudentId());
            stmt.setString(2, post.getFullname());
            stmt.setString(3, post.getDepartment());
            stmt.setString(4, post.getCourse());
            stmt.setString(5, post.getPostTitle());
            stmt.setString(6, post.getPostCategory());
            stmt.setString(7, post.getPostContent());
            stmt.setString(8, post.getPostDate());
            stmt.setString(9, post.getContactEmail());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Add this method if you need to update posts
    public static boolean updatePost(ForumPostModel post) throws ClassNotFoundException {
        String sql = "UPDATE forum_posts SET post_title = ?, post_category = ?, " +
                     "post_content = ? WHERE post_id = ? AND student_id = ?";
        
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, post.getPostTitle());
            stmt.setString(2, post.getPostCategory());
            stmt.setString(3, post.getPostContent());
            stmt.setInt(4, post.getPostId());
            stmt.setString(5, post.getStudentId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}