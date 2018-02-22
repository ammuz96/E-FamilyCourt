<%-- 
    Document   : ViewPetitioners
    Created on : 10 Feb, 2018, 10:35:52 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::viewpetitioners</title>
        </head>
        <body bgcolor="pink">


       



<h1><font color="brown"><center>PETITIONER DETAILS</center></font></h1>
<%
    String a="";
             if(request.getParameter("did")!=null)
        {
            
             String SEL="SELECT * from tbl_petitioner where pet_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
               
               
          String del4="delete from tbl_petitioner where pet_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(del4);
          if(b)
          {
              response.sendRedirect("ViewPetitioners.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
   
    %>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>age</td><td>Location</td><td>Photo</td><td>Adhar Proof</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_petitioner";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("pet_name")%></td>
         <td><%=rs.getString("pet_adrs")%></td>    
         <td><%=rs.getString("pet_email")%></td>
         <td><%=rs.getString("pet_cno")%></td>
         <td><%=rs.getString("pet_age")%></td>
         <td><%=rs.getString("pet_location")%></td>
          <td><%=rs.getString("pet_photo")%></td>
         <td><%=rs.getString("pet_proof")%></td>
         
         
              <td><a href="ViewPetitioners.jsp?did=<%=rs.getString("pet_id")%>">DELETE</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>