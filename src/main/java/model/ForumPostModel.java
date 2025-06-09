package model;

import java.util.List;

public class ForumPostModel {
    
    private int post_id;
    private String student_id;
    private String fullname;
    private String department;
    private String course;
    private String post_title;
    private String post_category;
    private String post_content;
    private String post_date;
    private String contact_email;
    private List<ForumReply> replies;

    
    // Constructors
    public ForumPostModel() {
    }
    
    public ForumPostModel(String student_id, String fullname, String department, String course, 
                        String post_title, String post_category, String post_content, 
                        String post_date, String contact_email) {
    	
        this.student_id = student_id;
        this.fullname = fullname;
        this.department = department;
        this.course = course;
        this.post_title = post_title;
        this.post_category = post_category;
        this.post_content = post_content;
        this.post_date = post_date;
        this.contact_email = contact_email;
    }
    
    // Getters and Setters
    public int getPostId() { 
        return post_id; 
    }
    
    public void setPostId(int post_id) { 
        this.post_id = post_id; 
    }
    
    public String getStudentId() { 
        return student_id; 
    }
    
    public void setStudentId(String student_id) { 
        this.student_id = student_id; 
    }
    
    public String getFullname() { 
        return fullname; 
    }
    
    public void setFullname(String fullname) { 
        this.fullname = fullname; 
    }
    
    public String getDepartment() {
        return department; 
    }
    
    public void setDepartment(String department) { 
        this.department = department; 
    }
    
    public String getCourse() { 
        return course; 
    }
    
    public void setCourse(String course) {
        this.course = course; 
    }
    
    public String getPostTitle() {
        return post_title; 
    }
    
    public void setPostTitle(String post_title) {
        this.post_title = post_title; 
    }
    
    public String getPostCategory() {
        return post_category; 
    }
    
    public void setPostCategory(String post_category) {
        this.post_category = post_category; 
    }
    
    public String getPostContent() { 
        return post_content; 
    }
    
    public void setPostContent(String post_content) {
        this.post_content = post_content; 
    }
    
    public String getPostDate() {
        return post_date;
    }
    
    public void setPostDate(String post_date) {
        this.post_date = post_date; 
    }
    
    public String getContactEmail() {
        return contact_email; 
    }
    
    public void setContactEmail(String contact_email) {
        this.contact_email = contact_email; 
    }
    
    public List<ForumReply> getReplies() 
    { 
    	return replies;
    }
    
    public void setReplies(List<ForumReply> replies) 
    { 
    	this.replies = replies;
    }
    
}