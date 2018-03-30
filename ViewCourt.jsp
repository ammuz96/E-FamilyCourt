<%-- 
    Document   : ViewCourt
    Created on : 10 Feb, 2018, 11:32:47 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

        <title>familyCourt::petition</title>
    </head>
    <body>
      
        <h1><font color="blue"><center>FAMILY COURTS IN KERALA</center></font></h1>
         <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Court Name</td>
                           <td>Court Address</td><td>District</td><td>Contact Number</td>
                       </tr>
                   
                     <%
                         int i=1;
    String str="select * from tbl_court c inner join tbl_district d on c.dist_id=d.dist_id";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
      
  
                 
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("court_name")%></td>
         <td><%=rs.getString("court_adrs")%></td>    
         <td><%=rs.getString("dist_name")%></td>
         <td><%=rs.getString("court_cno")%></td>
         
         </tr>
    
             
   
    <%
    i++;
    }
    
    
    
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>
    
