<%-- 
    Document   : witness_home
    Created on : 13 Feb, 2018, 8:23:13 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::WITNESShome</title>
    </head>
    <body bgcolor="pink">
        <h1 align="center"><font  color="brown">WITNESS HOME</font></h1>
        <form name="frm_pending">
            <%   
                       String sel="select wit_name from tbl_witness where wit_id='"+session.getAttribute("witid")+"'";
                       ResultSet rs=obj.selectData(sel);
                       if (rs.next()){
                           %>
                           <h1 align="center"><font color="red"><i>Welcome....<%=rs.getString("wit_name")%></i></font></h1><%
                       }
                       
                       %>
           
                   <table class="table table-hover" align="center">
                       <tr><td><a href="AddEvidence.jsp">EVIDENCE</a>||</td>
                           <td><a href="ViewCaseSittingMatters.jsp">SITTING MATTERS</a>||</td>
                           <td><a href="WitnessEditProfile.jsp">EDIT PROFILE</a>||</td>
                             </tr>
                   
                   </table></form>
        
    </body>
</html>
