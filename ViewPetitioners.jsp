<%-- 
    Document   : ViewPetitioners
    Created on : 10 Feb, 2018, 10:24:46 PM
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
        <body bgcolor="pink">


       



<h1><font color="brown"><center>REGISTERED PETITIONERS</center></font></h1>


        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>age</td><td>Location</td><td>Photo</td><td>Adhar Proof</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_petitioner p inner join tbl_advocate a inner join tbl_petition t on t.pet_id=p.pet_id and t.adv_id=a.adv_id where a.adv_id='"+session.getAttribute("advid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
        session.setAttribute("peti", rs.getString("pet_id"));
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
         <td><%=rs.getString("pet_age")%></td>
         <td><%=rs.getString("pet_location")%></td>
         <td><img src="../Petitioner/Photo/<%=rs.getString("pet_photo")%>" height="150" width="150"></td>
             <td><img src="../Petitioner/Proof/<%=rs.getString("pet_proof")%>" height="150" width="150"></td>
   
         
         
           <td><a href="AddWitness.jsp">Add Witness</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>