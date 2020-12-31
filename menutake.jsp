<%-- 
    Document   : menuintake
    Created on : Dec 13, 2020, 9:00:22 PM
    Author     : siddhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px">
            <th>OrderId</th>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Amount</th>
        <%@page language="java" import="java.sql.*"%>
        <%
            int tquan=0,price=0,id=1,total=0;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/cart","root","");
            Statement st=conn.createStatement();
            PreparedStatement ps=conn.prepareStatement("select price from rates where item=?");
            String menutake[]=request.getParameterValues("cracker");
            
            for(int i=0;i<menutake.length;i++){
                int quan=Integer.parseInt(request.getParameter(menutake[i]));
                ps.setString(1,menutake[i]);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    price=rs.getInt(1);
                }%>
            <tr>
                <td><% out.println(id);%></td>
                <% id=id+1; %>
                <td><% out.println(menutake[i]);%></td>
                <td><% out.println(quan);%></td>
                <td><% out.println(price);%></td>
                <td><% out.println(quan*price);
                    total=total+quan*price;%></td>
            </tr>
            <%}
        
}
        catch(Exception e){
            out.println(e.getMessage());
        }%>
        <tr colspan="2">
                <td><% out.println("Total Price");%></td>
                <td><% out.println(total);%></td>
            </tr>
        
        </table>
    </body>
</html>
