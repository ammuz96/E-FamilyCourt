<%-- 
    Document   : ViewCounsellingDetails
    Created on : 10 Feb, 2018, 10:26:03 PM
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
    <body bgcolor="white">
        
        <h1><font color="blue"><center>Counselling Details</center></font></h1>
        
        
        
                    
        
        <table  align="center" border="1">
            <tr>
                <th>sl no</th> <th>Counselling Date</th><th>Time</th>
                <th>Petitioner Arguments</th><th>Respondent Arguments</th><th>Councillor Remarks</th>
                      

            </tr>
    
        <%
            
           String CID="";
           int i=1;
            String selQry="select * from tbl_counsellingdetails c inner join tbl_counselling co inner join tbl_councillor r inner join tbl_advocate a inner join tbl_petitioner p on c.couns_id=co.couns_id and co.cou_id=r.cou_id and co.adv_id=a.adv_id and co.pet_id=p.pet_id where  p.pet_id='"+session.getAttribute("petid")+"' ";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("counselling_id");
                
        %>
             <tr>
                   <td><%=i%></td>
               
                       <td><%=rs1.getString("couns_date")%></td><td><%=rs1.getString("couns_time")%></td>
 <td><%=rs1.getString("pet_arg")%></td>
 <td><%=rs1.getString("res_arg")%></td>
 <td><%=rs1.getString("cou_remark")%></td>
 
                       
                        
  </tr>
   

               

              
         
              
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
