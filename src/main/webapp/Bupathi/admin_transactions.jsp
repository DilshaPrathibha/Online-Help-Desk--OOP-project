<%@ page import="java.sql.*" %>
<%
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "123456");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT t.*, s.fullname, c.card_number FROM transaction t JOIN student s ON t.student_stid = s.stid JOIN credit_cards c ON t.card_id = c.id");
%>

<h2>All Transactions</h2>
<table border="1">
    <tr>
        <th>Student</th>
        <th>Material</th>
        <th>Price</th>
        <th>Card Used</th>
        <th>Date</th>
    </tr>
    <% while(rs.next()) { %>
    <tr>
        <td><%= rs.getString("fullname") %></td>
        <td><%= rs.getString("material_name") %></td>
        <td>$<%= rs.getString("price") %></td>
        <td><%= rs.getString("card_number") %></td>
        <td><%= rs.getTimestamp("transaction_date") %></td>
    </tr>
    <% } %>
</table>
