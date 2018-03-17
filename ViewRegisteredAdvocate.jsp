<%-- 
    Document   : ViewAdvocate
    Created on : 11 Mar, 2018, 11:48:20 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::regadv</title>
    </head>
    <body>
    <h1><font color="brown"><center>ADVOCATE DETAILS</center></font></h1>
<%
    String a="";
             if(request.getParameter("did")!=null)
        {
            
             String SEL="SELECT * from tbl_advocate where adv_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
               
               
          String del4="delete from tbl_advocate where adv_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(del4);
          if(b)
          {
              response.sendRedirect("ViewRegisteredAdvocate.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
   
    %>
    
    <form name="frm_pending">
            
                   <table class="table table-hover" align="center">
                      
                     <% 
    String str="select * from tbl_advocate a inner join tbl_casecategory c inner join tbl_court t on a.case_id=c.case_id and a.court_id=t.court_id where a.adv_status=3";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr align="center">  <td align="center"><img src="../Advocate/Photo/<%=rs.getString("adv_photo")%>" height="150" width="150"></td></tr>

     <tr align="center"> <th align="left">Name:</th>     <td align="left"><%=rs.getString("adv_name")%></td></tr>
     <tr align="center"> <th align="left">Address:</th>  <td align="left"><%=rs.getString("adv_adrs")%></td> </tr>   
     <tr align="center"> <th align="left">E-mail:</th> <td align="left"><%=rs.getString("adv_email")%></td></tr>
     <tr align="center"> <th align="left">Contact Number:</th>  <td align="left"><%=rs.getString("adv_cno")%></td></tr>
     <tr align="center"> <th align="left">Age:</th> <td align="left"><%=rs.getString("adv_age")%></td></tr>
     <tr align="center"> <th align="left">Sitting Fee:</th> <td align="left"><%=rs.getString("adv_fee")%></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ApproveAdvocate.jsp?eid=<%=rs.getString("adv_id")%>&mail=<%=rs.getString("adv_email")%>">APPROVE</a></td></tr>
     <tr align="center"> <th align="left">Experience:</th> <td align="left"><%=rs.getString("adv_exp")%></td></tr>
     <tr align="center"> <th align="left">Qualification:</th> <td align="left"><%=rs.getString("adv_qua")%></td></tr>
   
        <tr align="center"> <th align="left">Proof:</th>   <td align="left"><a href="AdvAdharProofDownload.jsp?filename=<%=rs.getString("adv_proof")%>"><%=rs.getString("adv_proof")%></a></td></tr>

   <tr align="center"> <th align="left">Court Name:</th><td align="left"><%=rs.getString("court_name")%></td></tr>
   
   <tr align="center"> <th align="left">Court Address:</th><td align="left"><%=rs.getString("court_adrs")%></td></tr>
   <tr align="center"> <th align="left">Case Category:</th><td align="left"><%=rs.getString("case_name")%></td></tr>
   
   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
         
         </tr>
             
   
    <%
    
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>

    
    </body>
    
</html>
