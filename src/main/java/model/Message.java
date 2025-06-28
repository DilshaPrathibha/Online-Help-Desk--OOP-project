package model;

public class Message {
    private String type; // "success", "error", etc.
    private String content;
    
    // Constructor
    public Message(String type, String content) {
        this.type = type;
        this.content = content;
    }
    
    // Getters
    public String getType() { return type; }
    public String getContent() { return content; }
}