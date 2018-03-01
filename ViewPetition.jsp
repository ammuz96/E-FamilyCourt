<%-- 
    Document   : ViewPetition
    Created on : 12 Feb, 2018, 4:07:04 AM
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
      
        <h1><font color="blue"><center>APPROVED PETITIONS</center></font></h1>
         <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Petitioner Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Petition Description</td><td>Advocate Name</td>
                       </tr>
                   
                     <%
                         int i=1;
    String str="select * from tbl_petitioner p inner join tbl_petition e inner join tbl_advocate a inner join tbl_councillor u on p.pet_id=e.pet_id and e.adv_id=a.adv_id and u.court_id=a.court_id where e.petition_status=1 and u.cou_id='"+session.getAttribute("couid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
       session.setAttribute("peti", rs.getString("pet_id"));
                session.setAttribute("advi",rs.getString("adv_id") );
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
         <td><%=rs.getString("petition_des")%></td>
         <td><%=rs.getString("adv_name")%></td>
          
         
         <td><a href="AddCounsellingMatters.jsp">Set Date and Time</a></td></tr>
    
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>
    
