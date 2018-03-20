<%-- 
    Document   : AdvocateViewCounseling
    Created on : 19 Mar, 2018, 11:27:02 PM
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
      
        <h1><font color="blue"><center>PETITIONER DETAILS</center></font></h1>
         <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Petitioner Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Petition Description</td><td>Respondent Name</td><td>Advocate Name</td>
                       </tr>
                   
                     <%
                         int i=1;
    String str="select * from tbl_petitioner p inner join tbl_petition e inner join tbl_advocate a inner join tbl_councillor u on p.pet_id=e.pet_id and e.adv_id=a.adv_id and u.court_id=a.court_id where e.petition_status=1 and a.adv_id='"+session.getAttribute("advid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
        
//      session.setAttribute("peti", rs.getString("pet_id"));
  
                 
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
         <td><%=rs.getString("petition_des")%></td>
         <td><%=rs.getString("respondent_name")%></td>
         <td><%=rs.getString("adv_name")%></td>
                
         <td><a href="AdvocateViewCounseling.jsp?id=<%=rs.getString("pet_id")%>">VIEW COUNSELING DETAILS</a></td></tr>
    
             
   
    <%
    i++;
    }
    
    
    if(request.getParameter("id")!=null)
    {
        session.setAttribute("peti",request.getParameter("id"));
        response.sendRedirect("AdvViewCounsellingDetails.jsp");
    }
    
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>
    
