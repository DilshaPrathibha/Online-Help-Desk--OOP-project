package model;

import java.sql.Timestamp;

public class Ticket {
    private int ticketId;
    private String name;
    private String studentId;       
    private String faculty;         
    private String email;
    private String phone;           
    private String issueType;
    private String subject;
    private String description;
    private String attachment;
    private String status;
    private Timestamp createdAt;

    // Getters
    public int getTicketId() {
        return ticketId;
    }

    public String getName() {
        return name;
    }

    public String getStudentId() {   
        return studentId;
    }

    public String getFaculty() {     
        return faculty;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {       
        return phone;
    }

    public String getIssueType() {
        return issueType;
    }

    public String getSubject() {
        return subject;
    }

    public String getDescription() {
        return description;
    }

    public String getAttachment() {
        return attachment;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    // Setters
    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStudentId(String studentId) {   
        this.studentId = studentId;
    }

    public void setFaculty(String faculty) {       
        this.faculty = faculty;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {           
        this.phone = phone;
    }

    public void setIssueType(String issueType) {
        this.issueType = issueType;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
