<%-- 
    Document   : consult_matters_pet
    Created on : 31 Mar, 2018, 10:56:01 AM
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
      
        <h1><font color="blue"><center>Consultation Matters</center></font></h1>
         <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Petitioner Name</td><td>Address</td>
                           <td>E-mail</td><td>Contact Number</td>
                       </tr>
                   
                     <%
                         if(request.getParameter("pid")!=null)
                         {
                             session.setAttribute("petID", request.getParameter("pid"));
                       
                             
                             response.sendRedirect("AddConsultationMatters.jsp");
                             
                         }
                         
                         
                         int i=1;
    String str="select * from tbl_petitioner p inner join tbl_petition e inner join tbl_advocate a on p.pet_id=e.pet_id and e.adv_id=a.adv_id where e.petition_status=1 and a.adv_id='"+session.getAttribute("advid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
        
        
       
                
                 
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
              
         
         <td><a href="consult_matters_pet.jsp?pid=<%=rs.getString("pet_id")%>">Set Date and Time</a></td>
        </tr>
    
             
   
    <%
    i++;
    }
    
//    if(request.getParameter("id")!=null)
//    {
//        session.setAttribute("peti",request.getParameter("id"));
//        response.sendRedirect("AddCounsellingMatters.jsp");
//    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>
    
