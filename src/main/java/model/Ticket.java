
package model;
import java.sql.Timestamp; //

public class Ticket {
    private int ticketId;
    private String name;
    private String email;
    private String issueType;
    private String description;
    private String attachment;
    private String status; 
    private Timestamp createdAt;
    
	public int getTicketId() {
		return ticketId;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getIssueType() {
		return issueType;
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
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
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
