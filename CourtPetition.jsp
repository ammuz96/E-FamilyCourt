<%-- 
    Document   : ViewAdvocateSelectionDetails
    Created on : 21 Feb, 2018, 11:34:13 PM
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
    <body> <table  align="center">
                        
        <tr><td>
                <h1 align="center"><font color="red"><i>Petition Details</i></font></h1></td></tr></table>
        <table  align="center">
                        
        <tr><td></td></tr>              
           
    
        <%
            if(request.getParameter("pid")!=null)
            {
                session.setAttribute("pet", request.getParameter("pid"));
                response.sendRedirect("JudgeViewExcuse.jsp");
            }
            
           
      
            String selQry="select * from tbl_petition s inner join tbl_petitioner c inner join tbl_district d inner join tbl_judge j on s.pet_id=c.pet_id and d.dist_id=c.dist_id where j.jud_id='"+session.getAttribute("judid")+"' and p.pet_id='"+request.getParameter("fid")+"'";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               
                
        %>
<!--                <tr><b><font color="red">-->
                <tr >
                    <th colspan="2" align="center"><img src="../Petitioner/Photo/<%=rs3.getString("pet_photo")%>" height="150" width="150">
                </tr>
                <tr><td></td></tr>
                <tr align="left">
                  <th> Name:</th><td><%=rs3.getString("pet_name")%></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs3.getString("pet_adrs")%></td>
                </tr>
                <tr align="left">
                     <th>E-mail:</th>
                    <td><%=rs3.getString("pet_email")%></td>
                </tr>
                <tr align="left"><th>Contact Number:</th><td><%=rs3.getString("pet_cno")%></td></tr>
                <tr align="left">
                    
                 <th>Age:</th>   
                    
                    <td><%=rs3.getString("pet_age")%></td>
                </tr>
        
                <tr align="left">
                    
                 <th>District:</th>   
                    
                    <td><%=rs3.getString("dist_name")%></td>
                </tr>
                <tr align="left">
                     <th>Location:</th>
                  <td><%=rs3.getString("pet_location")%></td>  
                    
                </tr>
                <tr align="left">
                    
                 <th>Petition Description:</th>
     
                     <td><%=rs3.getString("petition_des")%></td>
                </tr>
                <tr align="left">
                    <th>Respondent Name:</th>
 
                   <td><%=rs3.getString("respondent_name")%></td>  
                </tr> 
                <tr align="left">
                    
                    <th>Respondent Address:</th>
                    
                   <td><%=rs3.getString("resp_details")%></td>
   
                </tr>              
                   <%
               
             
                
            }
        %>
        
        
                  
                  <tr><td></td></tr>
        </table>
                                                     
   <table  align="center">
                        
        <tr><td bgcolor="green">
                <a href="JudgeViewExcuse.jsp"><font color=white>VIEW EXCUSE</font></a></td></tr><tr><td></td></tr><tr><td></td></tr></table>
                 
         
               </tr>
               
        
        
    </body>
</html>

        
        
        
        
       
