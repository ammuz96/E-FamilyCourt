<%-- 
    Document   : ApproveCounsellingMatters
    Created on : 10 Feb, 2018, 10:32:26 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::approvalcounsellingmatters</title>
        </head>
        <body bgcolor="pink">


       



<h1><font color="brown"><center>COUNSELLING MATTERS APPROVAL</center></font></h1>
<%
         if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_counselling set couns_status=1 where couns_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          
        
         
           if(b)
          {
              response.sendRedirect("ApproveCounsellingMatters.jsp");
          }
          else
          {
              out.print(upd);
          }
        }
         if(request.getParameter("did")!=null)
        {
          String del="update tbl_counselling set couns_status=2 where couns_id='"+request.getParameter("did")+"'";
          boolean b=obj.ExecuteCommand(del);
          if(b)
          {
              response.sendRedirect("ApproveCounsellingMatters.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Counselling Date</td><td>Counselling Time</td>                      </tr>
                     
 
                   
                     <% int i=1;
    String str="select * from tbl_counselling where couns_status=0";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("caseSitting_date")%></td>
         <td><%=rs.getString("caseSitting_time")%></td>    
         
         
         <td><a href="ApproveCounsellingMatters.jsp?eid=<%=rs.getString("couns_id")%>">APPROVE</a></td>
     <td><a href="ApproveCounsellingMatters.jsp?did=<%=rs.getString("couns_id")%>">DELETE</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>