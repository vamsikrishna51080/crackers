<html>
    <head>
        <title>
            bill display
        </title>
        <style>
            body
              {
                 background-image:url("https://image.shutterstock.com/image-illustration/abstract-smooth-dark-blue-black-260nw-556465648.jpg");
                 background-size:cover;
                 color:white;
              }
            td,th{
                width:250px;
                text-align: center;
                height:45px;
                font-size:23px;
                 border:1px solid white;
            }
            table{
                margin-left:170px;
                margin-top:25px;
                border:4px solid white;
                border-collapse:collapse;
            }
            h1{
                margin-top:25px;
                
            }
            button{
                width:200px;
                height:35px;
                margin-left:1050px;
                background-color:white;
                border:2px solid white;
                border-radius:10px;
                font-size:20px;
                outline: none;
            }
        </style>
    </head>
    <body>
    <center><h1>B&nbsp;&nbsp; I&nbsp;&nbsp; L&nbsp;&nbsp; L</h1></center>
    <a href="stories.html"><button>visit fun page</button></a>    
    <table>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Amount</th>
            <%@page language="java" import="java.sql.*" %>
        <%
            int amount=0,tquan=0,price=0;
            String str="";
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st=con.createStatement();
            PreparedStatement ps= con.prepareStatement("select price from menu where item=?");
            PreparedStatement ps1= con.prepareStatement("update tables set table_order = ?,description = ? where table_no = ?");
            PreparedStatement ps3= con.prepareStatement("update tables set priority = ? where table_no = ?");
            PreparedStatement ps2= con.prepareStatement("insert into total_order_history values(?,?)");
            
           String table=request.getParameter("table");
          
           String menutake[]=request.getParameterValues("food");
        for(int i=0;i<menutake.length;i++)
        {%>
        <tr>
            <td><%str=str+menutake[i]+" - ";
                out.println(menutake[i]);%></td>
            <%
                
              int quan=Integer.parseInt(request.getParameter(menutake[i]));
              str=str+quan+"</br>";
              tquan=tquan+quan;
              ps.setString(1,menutake[i]);
              ResultSet rs= ps.executeQuery();
              while(rs.next())
              price=rs.getInt(1);
            %>
            <td><%out.println(quan);%></td>                   
            <td><%out.println(price);%></td>
            <td><%out.println(quan*price);%></td>
            
        </tr>
           <% amount=amount+quan*price;  
           
           String desc=request.getParameter("desc");
           
           if(table.equals("table-1"))
           {
               ps1.setString(1,str);
               ps1.setString(2,desc);
               ps1.setString(3,"table-1");
               ps1.executeUpdate();
           }
           else if(table.equals("table-2"))
           {
               ps1.setString(1,str);
               ps1.setString(2,desc);
               
               ps1.setString(3,"table-2");
               ps1.executeUpdate();
           }
           else if(table.equals("table-3"))
           {
               ps1.setString(1,str);
               ps1.setString(2,desc);
               
               ps1.setString(3,"table-3");
               ps1.executeUpdate();
           }
           else if(table.equals("table-4"))
           {
               ps1.setString(1,str);
                ps1.setString(2,desc);
              
               ps1.setString(3,"table-4");
               ps1.executeUpdate();
           }
           else if(table.equals("table-5"))
           {
               ps1.setString(1,str);
                ps1.setString(2,desc);
               ps1.setString(3,"table-5");
               ps1.executeUpdate();
           }
        }
            %>
            <tr>
            <td> Total </td>
            <td colspan="2"><%out.println(tquan);%></td>
            <td><%out.println(amount); %></td>
            
        </tr>
        </table>
            <%
                  
            ps2.setString(1, str);
            ps2.setInt(2, amount);
            ps2.executeUpdate();
      
            }catch(Exception e){
                            
            out.println(e.getMessage());                      }
        %>
        
    </body>
</html>