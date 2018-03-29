<%-- 
    Document   : ViewCaseSittingDetails
    Created on : 13 Feb, 2018, 7:51:00 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::court</title>
    </head>
    <body bgcolor="pink">
        
        <h1><font color="blue"><center>Case Sitting Details</center></font></h1>
        
        
        
           
        
                
        
        <table  align="center" border="1">
            <tr>
                <th>sl no</th> <th>Sitting Date</th><th>Sitting Time</th>
                <th>Sitting Round</th>
                <th>Petitioner Arguments</th>
                <th>Respondent Arguments</th>
                <th>Judge Remarks</th>
                      

            </tr>
    
        <%
            
           String CID="";
           int i=1;
            String selQry="select * from tbl_casesittingdetails c inner join tbl_casesitting co inner join tbl_advocate a inner join tbl_petitioner p on c.caseSitting_id=co.caseSitting_id and co.adv_id=a.adv_id and co.pet_id=p.pet_id where  p.pet_id='"+session.getAttribute("petid")+"' ";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("sitting_id");
                
        %>
             <tr>
                   <td><%=i%></td>
               
                       <td><%=rs1.getString("caseSitting_date")%></td>
                       <td><%=rs1.getString("caseSitting_time")%></td>
                       <td><%=rs1.getString("sit_round")%></td>
 <td><%=rs1.getString("pet_remark")%></td>
 <td><%=rs1.getString("res_remark")%></td>
 <td><%=rs1.getString("jud_remark")%></td>
 
                       
                      
  </tr>
   

               

              
         
              
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
