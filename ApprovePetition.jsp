<%-- 
    Document   : ApprovePetition
    Created on : 10 Feb, 2018, 10:18:20 PM
    Author     : acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

    <!DOCTYPE html>
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::approval</title>
        </head>
        <body bgcolor="pink">


       



<h1><font color="blue"><center>Petition Approval</center></font></h1>
<%
         if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_petition set petition_status=1 where petition_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          if(b)
          {
                       out.print("Succesfull");
                                    }
                                    else
                                    {
                                        out.print("unsuccess");
                                    }
                                
               
              
              
              
              
              response.sendRedirect("ApprovePetition.jsp");
         
        }      
        
        
         
           if(request.getParameter("did")!=null)
        {
          String del="update tbl_petition set petition_status=2 where petition_id='"+request.getParameter("did")+"'";
          boolean b=obj.ExecuteCommand(del);
          if(b)
          {
              response.sendRedirect("ApprovePetition.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Photo</td><td>Petitioner Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Petition Description</td><td>Respondent Name</td><td>Respondent Details</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_petition s inner join tbl_petitioner c  where s.pet_id=c.pet_id and s.petition_status=0";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><img src="../Petitioner/Photo/<%=rs.getString("pet_photo")%>" height="150" width="150"></td>  
         <td><%=rs.getString("pet_name")%></td>
        
         <td><%=rs.getString("pet_adrs")%></td>
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
         <td><%=rs.getString("petition_des")%></td>
          <td><%=rs.getString("respondent_name")%></td>
        <td><%=rs.getString("resp_details")%></td>

         
         
         <td><a href="ApprovePetition.jsp?eid=<%=rs.getString("petition_id")%>">APPROVE</a></td>
     <td><a href="ApprovePetition.jsp?did=<%=rs.getString("petition_id")%>">REJECT</a></td></tr>
             
   
    <%i++;}
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>