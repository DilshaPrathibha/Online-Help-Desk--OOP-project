<%@ include file="../partials/header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Debug initialization
    System.out.println("[DEBUG] ====== STARTING PAYMENT PROCESSING ======");
    
    // Declare variables at the start
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean hasCards = false;
    
    try {
        // Verify session and stid
        String stid = (String) session.getAttribute("stid");
        System.out.println("[DEBUG] Session stid: " + stid);
        
        if (stid == null || stid.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }
        
        String materialName = request.getParameter("course");
        String price = request.getParameter("price");
        
        System.out.println("[DEBUG] Received parameters:");
        System.out.println("  - course: " + materialName);
        System.out.println("  - price: " + price);
        
        // Establish database connection
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/helpdesk?useSSL=false", 
            "root", 
            "123456");
        
        // Get saved cards with scrollable ResultSet
        ps = conn.prepareStatement(
            "SELECT id, card_name, card_number, expiry_date FROM credit_cards WHERE student_stid = ?",
            ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_READ_ONLY);
        
        ps.setString(1, stid);
        rs = ps.executeQuery();
        
        hasCards = rs.next();
        System.out.println("[DEBUG] Cards found: " + hasCards);
        
        if (hasCards) {
            rs.beforeFirst(); // Reset cursor for processing
            System.out.println("[DEBUG] Card details:");
            while(rs.next()) {
                System.out.println("  - ID: " + rs.getInt("id"));
                System.out.println("    Name: " + rs.getString("card_name"));
                System.out.println("    Number: " + rs.getString("card_number"));
                System.out.println("    Expiry: " + rs.getString("expiry_date"));
            }
            rs.beforeFirst(); // Reset again for display
        }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .payment-container {
            max-width: 600px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-top: 4px solid #3498db;
        }
        h2 {
            color: #2c3e50;
            margin-top: 0;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .price-display {
            font-size: 28px;
            color: #3498db;
            font-weight: bold;
            margin: 20px 0;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        select, input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        .card-preview {
            margin-top: 20px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            border-left: 3px solid #3498db;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 14px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s;
            font-weight: 600;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <h2>Payment for: <%= materialName %></h2>
        <div class="price-display">$<%= price %></div>
        
        <form method="post" action="${pageContext.request.contextPath}/CreateTransaction">
            <input type="hidden" name="material_name" value="<%= materialName %>">
            <input type="hidden" name="price" value="<%= price %>">
            <input type="hidden" name="stid" value="<%= stid %>">

            <div class="form-group">
                <label>Select Saved Card:</label>
                <select name="card_id" id="cardSelect" onchange="fillCardDetails(this.value)">
                    <option value="">-- Select Card --</option>
                    <% 
                    if (hasCards) {
                        while(rs.next()) { 
                            String cardNumber = rs.getString("card_number");
                            String displayNumber = "XXXXXXXX XXXXXXXX XXXXXXXX" + cardNumber.substring(cardNumber.length() - 4);
                    %>
                        <option value="<%= rs.getInt("id") %>"
                            data-name="<%= rs.getString("card_name") %>"
                            data-number="<%= rs.getString("card_number") %>"
                            data-expiry="<%= rs.getString("expiry_date") %>">
                            <%= displayNumber %> - <%= rs.getString("card_name") %>
                        </option>
                    <% 
                        }
                    } 
                    %>
                </select>
            </div>

            <% if (hasCards) { %>
            <div class="card-preview">
                <div class="form-group">
                    <label>Card Name:</label>
                    <input type="text" id="card_name" name="card_name" readonly>
                </div>
                <div class="form-group">
                    <label>Card Number:</label>
                    <input type="text" id="card_number" name="card_number" readonly>
                </div>
                <div class="form-group">
                    <label>Expiry Date:</label>
                    <input type="text" id="expiry_date" name="expiry_date" readonly>
                </div>
            </div>
            <% } %>

            <div class="form-group">
                <label for="remarks">Remarks (Optional):</label>
                <textarea id="remarks" name="remarks" rows="3"></textarea>
            </div>

            <button type="submit" class="btn">Confirm Payment</button>
        </form>
    </div>

    <script>
        function fillCardDetails(cardId) {
            console.log("[DEBUG] Selected card ID:", cardId);
            
            if (!cardId) {
                // Clear fields if no card selected
                document.getElementById('card_name').value = '';
                document.getElementById('card_number').value = '';
                document.getElementById('expiry_date').value = '';
                return;
            }
            
            const selectedOption = document.querySelector('#cardSelect option[value="' + cardId + '"]');
            console.log("[DEBUG] Selected option:", selectedOption);
            
            if (selectedOption) {
                const cardName = selectedOption.getAttribute('data-name');
                const cardNumber = selectedOption.getAttribute('data-number');
                const expiryDate = selectedOption.getAttribute('data-expiry');
                
                console.log("[DEBUG] Card details:", {
                    name: cardName,
                    number: cardNumber,
                    expiry: expiryDate
                });
                
                // Format card number for display
                const formattedNumber = cardNumber.replace(/(\d{4})(?=\d)/g, '$1 ');
                
                document.getElementById('card_name').value = cardName;
                document.getElementById('card_number').value = formattedNumber;
                document.getElementById('expiry_date').value = expiryDate;
            }
        }
        
        // Initialize form if a card is selected by default
        document.addEventListener('DOMContentLoaded', function() {
            const initialCard = document.getElementById('cardSelect').value;
            if (initialCard) {
                fillCardDetails(initialCard);
            }
        });
    </script>
</body>
</html>
<%
    } catch (SQLException e) {
        System.err.println("[ERROR] Database error: " + e.getMessage());
        e.printStackTrace();
%>
    <div class="payment-container">
        <h2>Payment Error</h2>
        <div style="color: #e74c3c; padding: 20px; background-color: #fdecea; border-radius: 5px;">
            <p>We encountered an error processing your payment information.</p>
            <p>Please try again later or contact support.</p>
        </div>
    </div>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (ps != null) ps.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>