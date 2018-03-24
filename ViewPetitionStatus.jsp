<%-- 
    Document   : ViewPetitionStatus
    Created on : 22 Feb, 2018, 3:16:12 AM
    Author     : acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::status</title>
    </head>
    <body> <body bgcolor="white" >
        <h1 align="center"><font color="blue">Petition Status</font></h1>
        <form name="frm_placements">
            
                   <table class="table table-hover" align="center" border="2" >
                       <tr><td>Petition Description</td><td>Respondent Name</td><td>Respondent Details</td><td>Status</td>
                       </tr>
         
         <%
             if(request.getParameter("petid")!=null)
             {
                 session.setAttribute("petid", request.getParameter("petid"));
                 response.sendRedirect("PetitionFileSubmit.jsp");
             }
                           String sell= "select * from tbl_petition s inner join tbl_petitioner c  on s.pet_id=c.pet_id where c.pet_id='"+session.getAttribute("petid")+"'";
                           ResultSet rs =  obj.selectData(sell);
    
     String salary="";
     String vac="";
     String date="";
     String jname="";
     String cutof="";
     String rdate="";
     String cname="";
while(rs.next())
{
    String label="";
  String color="";
  String status="0";
  cutof=rs.getString("petition_des");
  rdate=rs.getString("respondent_name");
  cname=rs.getString("resp_details");
  if((rs.getString("petition_status").equals("0")))
  {
      label="Pending";
      color="#FFC107";
  }
        if(rs.getString("petition_status").equals("1"))
  {
      label="Petition Approved..please submit petition in detail";
      color="green";
  } 
   if(rs.getString("petition_status").equals("2"))
  {
      label="Petition Rejected";
      color="red";
  } 
  
  
  %>
                       <tr>
                           <td><%=cutof%></td>
                           <td><%=rdate%></td>
                           <td><%=cname%></td>
                                            
                           <td ><div style="color: <%=color%>"><%=label%></div></td>
                           <td><a href="ViewPetitionStatus.jsp?petid=<%=rs.getString("petition_id")%>">Upload Petition File</a></td></tr>
  
  
  <%
}
  %> 
  </table>
    </body>
</html>
