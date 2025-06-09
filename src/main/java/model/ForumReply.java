package model;

public class ForumReply {

	private int replyId;
    private int postId;
    private String studentId;
    private String fullname;
    private String replyContent;
    private String replyDate;
    
    public ForumReply(){
    	
    }
    
    public ForumReply(int replyId, int postId, String studentId, String fullname, String replyContent,
			String replyDate) {
		super();
		this.replyId = replyId;
		this.postId = postId;
		this.studentId = studentId;
		this.fullname = fullname;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

    // Getters and Setters
    public int getReplyId() 
    { 
    	return replyId; 
    }
    
    public void setReplyId(int replyId)
    { 
    	this.replyId = replyId;
    }
    
    public int getPostId() 
    { 
    	return postId; 
    }
    
    public void setPostId(int postId)
    {
    	this.postId = postId;
    }
    
    public String getStudentId() 
    { 
    	return studentId; 
    }
    
    public void setStudentId(String studentId) 
    { 
    	this.studentId = studentId; 
    }
    
    public String getFullname() 
    {
    	return fullname; 
    }
    
    public void setFullname(String fullname) 
    { 
    	this.fullname = fullname;
    }
    
    public String getReplyContent() 
    { 
    	return replyContent;
    }
    
    public void setReplyContent(String replyContent) 
    { 
    	this.replyContent = replyContent;
    }
    
    public String getReplyDate() 
    { 
    	return replyDate; 
    }
    
    public void setReplyDate(String replyDate) 
    { 
    	this.replyDate = replyDate;
    }
}