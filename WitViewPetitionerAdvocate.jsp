<%-- 
    Document   : WitViewPetitioner
    Created on : 20 Mar, 2018, 12:25:46 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::viewpetitioners</title>
        </head>
        <body bgcolor="">


       



<h1><font color="brown"><center>EVIDENCE</center></font></h1>


        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr>
                           <td colspan="5" align="center"><b>PETITIONER DETAILS</b></td><td colspan="5" align="center"><b>ADVOCATE DETAILS</b></td></tr>
</tr>
                       <tr><td>Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Photo</td>
                           <td>Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Photo</td>
                       </tr>
                   
                     <% 
    String str="select * from tbl_petitioner p inner join tbl_witness w inner join tbl_advocate a on p.pet_id=w.pet_id and a.adv_id=w.adv_id and w.wit_id='"+session.getAttribute("witid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
        session.setAttribute("peti", rs.getString("pet_id"));
          session.setAttribute("advi", rs.getString("adv_id"));
     %>
     <tr>
         
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
        
         <td><img src="../Petitioner/Photo/<%=rs.getString("pet_photo")%>" height="150" width="150"></td>
         <td><%=rs.getString("adv_name")%></td>
         <td><%=rs.getString("adv_adrs")%></td>    
         <td><%=rs.getString("adv_email")%></td>
         <td><%=rs.getString("adv_cno")%></td>
        
         <td><img src="../Advocate/Photo/<%=rs.getString("adv_photo")%>" height="150" width="150"></td>
             
   
         
         
            
     <td><a href="AddEvidence.jsp"><font color="red"><b>Submit Evidence</b></font></a></td></tr>  
   
    <%
   
    }
    %>
                   </table>
                   <table align="center">
                       <tr><td></td></tr><tr><tr><td></td></tr><td></td></tr>
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                   
    <tr align="center"><td><input type="submit" formaction="witness_home.jsp" value="BACK"></td></tr>  
                   </table>
            
            
            
            
            
        </form></body></html>