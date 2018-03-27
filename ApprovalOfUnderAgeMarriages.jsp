<%-- 
    Document   : ApprovalOfUnderAgeMarriages
    Created on : 24 Mar, 2018, 12:44:46 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Algorithm.EncryptUtils"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt</title>
    </head>
    <body bgcolor="">
<h1><font color="blue"><center>Petitioner Details</center></font></h1>
        <form name="frm_pending">
           
                   <table class="table table-hover" align="center" border="2">
                      <tr><td>Sl no</td>
                           <td>Petitioner Name</td>
                           <td>Address</td>
                           <td>E-mail</td>
                           <td>Contact Number</td>
                           <td>Petition Description</td>
                           <td>Respondent Name</td>
                           <td>Advocate Name</td>
                       </tr>
                       
                       
                     <%
                         
                          if(request.getParameter("pid")!=null&&request.getParameter("advid")!=null)
                         {
                             session.setAttribute("petID", request.getParameter("pid"));
                             session.setAttribute("advID", request.getParameter("advid"));
                             
                             response.sendRedirect("AddCaseSittingMatters.jsp");
                             
                         }
                         
                         int i=1;
    String str="select * from tbl_petitioner p inner join tbl_petition e inner join tbl_advocate a inner join tbl_judge u on p.pet_id=e.pet_id and e.adv_id=a.adv_id and u.court_id=a.court_id where e.jud_approve_status=1 and e.case_id=8 and u.jud_id='"+session.getAttribute("judid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {String pet=rs.getString("petition_des");
        String key=rs.getString("key_value");
        String des=EncryptUtils.xorMessage(pet, key);
        
        session.setAttribute("peti", rs.getString("pet_id"));
                session.setAttribute("advi",rs.getString("adv_id") );
            
        
//      session.setAttribute("peti", rs.getString("pet_id"));
  
                 
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
        <td><%=des%></td>
         <td><%=rs.getString("respondent_name")%></td>
         <td><%=rs.getString("adv_name")%></td>
                
         <td><a href="ApprovalOfUnderAgeMarriages.jsp?pid=<%=rs.getString("pet_id")%>&&advid=<%=rs.getString("adv_id")%>">Set Date And Time</a></td>
     <td><a href="AddCounsellingMatters.jsp"><font color="red"><b>DELETE</b></font></a></td></tr>
             
   
    <%
    i++;
    }
    
    
    if(request.getParameter("id")!=null)
    {
        session.setAttribute("peti",request.getParameter("id"));
        response.sendRedirect("AddCaseSittingMatters.jsp");
    }
    
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>
    
  
                       
                       
                       
                       
                   
