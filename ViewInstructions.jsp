<%-- 
    Document   : ViewInstructions
    Created on : 19 Feb, 2018, 2:31:37 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::viewInstructions</title>
        </head>
        <body>


       



<h1><font color="red"><center>Few Instructions are here.........!!!!!!!!!!!!.......You should Read it..............**********..............</center></font></h1>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center">
                       <tr><td><u>Sl no</u></td>&nbsp;&nbsp;&nbsp;&nbsp;<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><u>Instructions</u></td>                </tr>
                   
                     <% int i=1;
    String str="select * from tbl_instructions";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
         <td><%=rs.getString("ins_des")%></td>
             
              </tr>
             
   
    <%
    i++;
    }
    
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>