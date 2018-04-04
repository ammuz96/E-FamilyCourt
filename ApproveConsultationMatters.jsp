<%-- 
    Document   : ApproveConsultationMatters
    Created on : 31 Mar, 2018, 12:47:10 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::approvalsittingmatters</title>
        </head>
        <body bgcolor="pink">


       



            <h1><font color="purple" face="algerian"><center><i>CONSULTATION DATE AND TIME APPROVAL</i></center></font></h1>
<%
         if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_consultation set consult_status=1 where consult_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          
        
         
           if(b)
          {
              response.sendRedirect("ApproveConsultationMatters.jsp");
          }
          else
          {
              out.print(upd);
          }
        }
         if(request.getParameter("did")!=null)
        {
          String del="update tbl_consultation set consult_status=2 where consult_id='"+request.getParameter("did")+"'";
          boolean b=obj.ExecuteCommand(del);
          if(b)
          {
              response.sendRedirect("ApproveConsultationMatters.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" bgcolor="white">
                       
                   
                     <% 
    String str="select * from tbl_consultation c inner join tbl_petitioner p inner join tbl_advocate a on c.pet_id=p.pet_id and c.adv_id=a.adv_id where consult_status=0";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
       
     <tr align="center"> <th align="left">Petitioner Name:</th> <td align="left"><%=rs.getString("pet_name")%></td></tr>
         <tr align="center"> <th align="left">Address:</th> <td align='left'>  <%=rs.getString("pet_adrs")%></td></tr>
        <tr align="center"> <th align="left">Advocate Name:</th> <td align='left'> <%=rs.getString("adv_name")%></td>
    
      <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>
          <a href="ApproveConsultationMatters.jsp?eid=<%=rs.getString("consult_id")%>">APPROVE</a></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td>   <td>
            <a href="ApproveConsultationMatters.jsp?did=<%=rs.getString("consult_id")%>">DELETE</a></td></tr>
        
       <tr align="center"> <th align="left"> Date:</th> <td align='left'>  <%=rs.getString("consult_date")%></td></tr>
       <tr align="center"> <th align="left">Time:</th> <td align='left'> <%=rs.getString("consult_time")%></td></tr>    
     
         <tr><td></td></tr>
         <tr><td><br><br><font color="white">-----------------------------</font></td></tr>
        
        <tr> </tr><tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
             
   
    <%
    
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>