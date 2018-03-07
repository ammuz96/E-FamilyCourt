<%-- 
    Document   : AddCaseDetails
    Created on : 19 Feb, 2018, 11:29:07 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::selectiondetails</title>
    </head>
    <body>
        <h1 align="center"><font color="brown"><i>CASE DIARY</i></font></h1>
         <form name="frm_pending">
    
        <table  align="center">
                        
                 
           
    
   <% 
    String str="select * from tbl_petitioner p inner join tbl_petition e inner join tbl_casecategory c inner join tbl_advocate a on p.pet_id=e.pet_id and e.case_id=c.case_id and e.adv_id=a.adv_id where a.adv_id='"+session.getAttribute("advid")+"'";
    ResultSet rs3=obj.selectData(str);
    while(rs3.next())
    {
     %>
    
    

                <tr >
                    <th colspan="2" align="center"><img src="../Petitioner/Photo/<%=rs3.getString("pet_photo")%>" height="150" width="150">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  <th>Petitioner Name:</th><td><%=rs3.getString("pet_name")%></td>
  
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs3.getString("pet_adrs")%></td>
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                     <th>E-mail:</th>
                    <td><%=rs3.getString("pet_email")%></td>
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left"><th>Contact Number:</th><td><%=rs3.getString("pet_cno")%></td></tr>  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
                <tr align="left">
                    
                 <th>Petition Details:</th>   
                    
                    <td><%=rs3.getString("petition_des")%></td>
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                     <th>Respondent Name:</th>
                  <td><%=rs3.getString("respondent_name")%></td>  
                    
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    
                 <th>Respondent Details:</th>
     
                     <td><%=rs3.getString("resp_details")%></td>
                </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    <th>Petition Date:</th>
 
                   <td><%=rs3.getString("petition_date")%></td>  
                </tr> <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    
                    <th>Case Category:</th>
                    
                   <td><%=rs3.getString("case_name")%></td>
   
                </tr>  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>            
                   
                  
                  
        <%
    
    }
    
    %>
  
        </table></form>
    </body>
</html>

        
        
        
        
       
