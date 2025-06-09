package model;


	public class Transaction {
	    private int id;
	    private String studentStid;
	    private int cardId;
	    private String materialName;
	    private double price;
	    private java.sql.Timestamp transactionDate;
        private  String remarks;
        private String displayCardName;
        private String displayCardNumber;
        
	    // Constructors
	    public Transaction() {
	    	
	    	
	    	
	    }

	    public Transaction(String studentStid, int cardId, String materialName, double price,String remarks,String cname,String cnum) {
	        this.studentStid = studentStid;
	        this.cardId = cardId;
	        this.materialName = materialName;
	        this.price = price;
	        this.remarks=remarks;	
	        this.displayCardName=cname;
	        this.displayCardNumber=cnum;}

	    // Getters and Setters
	    public int getId() {
	        return id;
	    }
	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getStudentStid() {
	        return studentStid;
	    }
	    public void setStudentStid(String studentStid) {
	        this.studentStid = studentStid;
	    }

	    public int getCardId() {
	        return cardId;
	    }
	    public void setCardId(int cardId) {
	        this.cardId = cardId;
	    }

	    public String getMaterialName() {
	        return materialName;
	    }
	    public void setMaterialName(String materialName) {
	        this.materialName = materialName;
	    }

	    public double getPrice() {
	        return price;
	    }
	    public void setPrice(double price) {
	        this.price = price;
	    }

	    public java.sql.Timestamp getTransactionDate() {
	        return transactionDate;
	    }
	    public void setTransactionDate(java.sql.Timestamp transactionDate) {
	        this.transactionDate = transactionDate;
	    }
	    
	    public String getremarks()
	    {
	    	return this.remarks;
	    }
	    
	    public void setremarks(String remarks)
	    {
	    	this.remarks = remarks;
	    }
	    public String getDisplayCardName() {
	        return displayCardName;
	    }

	    public void setDisplayCardName(String displayCardName) {
	        this.displayCardName = displayCardName;
	    }

	    public String getDisplayCardNumber() {
	        return displayCardNumber;
	    }

	    public void setDisplayCardNumber(String displayCardNumber) {
	        this.displayCardNumber = displayCardNumber;
	    }
	    
	    
	    
	}



