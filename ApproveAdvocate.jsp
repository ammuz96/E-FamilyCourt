<%-- 
    Document   : ApprovePetitioner
    Created on : 8 Feb, 2018, 11:19:11 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<jsp:useBean class="mydb.mailconnection" id="obj1"></jsp:useBean>


<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::approval</title>
        </head>
        <body bgcolor="">


       



<h1><font color="off white"><center>ADVOCATE APPROVAL</center></font></h1>
<%
    String a="";
   
         if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_advocate set adv_status=3 where adv_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          
        
         
           if(b){
                String mail=request.getParameter("mail");
                      String to[]={mail};
               String subject="Registration Aproved";
               String text="";
               try{
                                     System.out.println("try to mail");
                                    boolean b1=obj1.sendMail(to, subject, text);
                                    if(b1)
                                    {
                                        out.print("Succesfull");
                                    }
                                    else
                                    {
                                        out.print("unsuccess");
                                    }
                                }
                                catch(Exception e){
                                        System.out.println("Exxx "+e);
                                }
               
              
              
              
          
              response.sendRedirect("ApproveAdvocate.jsp");
          }
          else
          {
              out.print(upd);
          }
        }
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
             
          String delk="delete from tbl_advocate where adv_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(delk);
          if(b)
          {
              response.sendRedirect("ApproveAdvocate.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form name="frm_pending">
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>E-mail</td><td>Contact Number</td><td>Age</td><td>Fee</td><td>Experience</td><td>Qualification</td><td>Photo</td><td>Adhar Proof</td><td>Court Name</td><td>Court Address</td><td>Case Category</td>
                       </tr>
                   
                     <% 
    String str="select * from tbl_advocate a inner join tbl_casecategory c inner join tbl_court t on a.case_id=c.case_id and a.court_id=t.court_id where a.adv_status=2";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr align="center"> <th>Name:</th>     <td><%=rs.getString("adv_name")%></td>
         <td><%=rs.getString("adv_adrs")%></td>    
         <td><%=rs.getString("adv_email")%></td>
         <td><%=rs.getString("adv_cno")%></td>
         <td><%=rs.getString("adv_age")%></td>
         <td><%=rs.getString("adv_fee")%></td>
         <td><%=rs.getString("adv_exp")%></td>
   <td><%=rs.getString("adv_qua")%></td>
   
        <td><img src="../Advocate/Photo/<%=rs.getString("adv_photo")%>" height="150" width="150"></td>
         <td><a href="AdvAdharProofDownload.jsp?filename=<%=rs.getString("adv_proof")%>"><%=rs.getString("adv_proof")%></a></td>

   <td><%=rs.getString("court_name")%></td>
   
      <td><%=rs.getString("court_adrs")%></td>
      <td><%=rs.getString("case_name")%></td>
   
      
         
         <td><a href="ApproveAdvocate.jsp?eid=<%=rs.getString("adv_id")%>&mail=<%=rs.getString("adv_email")%>">APPROVE</a></td>
     <td><a href="ApproveAdvocate.jsp?did=<%=rs.getString("adv_id")%>">REJECT</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form></body></html>