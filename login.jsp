<%-- 
    Document   : login
    Created on : 8 Feb, 2018, 1:47:05 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

        <title>FamilyCourt::Login</title>
    </head>
    <body bgcolor="pink">
        
        <%
            
       String uname=request.getParameter("txt_user");
          String  upass=request.getParameter("txt_pass");
     if(request.getParameter("btn_submit")!=null)
     {
             String sel="select * from tbl_advocate a inner join tbl_login l on a.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"'";
             String sel1="select * from tbl_judge j inner join tbl_login l on j.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"'";
             String sel2="select * from tbl_councillor c inner join tbl_login l on c.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"'";
             String sel3="select * from tbl_petitioner p inner join tbl_login l on p.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"' and p.pet_status=1";
             String sel4="select * from tbl_witness w inner join tbl_login l on w.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"' and w.wit_status=1";
             String sel5="select * from tbl_admin o inner join tbl_login l on o.login_id=l.login_id where l.username='"+uname+"' and l.password='"+upass+"'";
         
             ResultSet rs=obj.selectData(sel);
             ResultSet rs1=obj.selectData(sel1);
             ResultSet rs2=obj.selectData(sel2);
             ResultSet rs3=obj.selectData(sel3);
             ResultSet rs4=obj.selectData(sel4);
             ResultSet rs5=obj.selectData(sel5);
              if(rs.next())
   
                       {
            
                            session.setAttribute("advid", rs.getString("adv_id"));
                            response.sendRedirect("../Advocate/Advocate_home.jsp");
                         } 
    
     else if(rs1.next())
     {
           session.setAttribute("judid", rs1.getString("jud_id"));
          response.sendRedirect("../Judge/judge_home.jsp");
       } 
      else if(rs2.next())
      {
           session.setAttribute("couid", rs2.getString("cou_id"));
           response.sendRedirect("../Councillor/councillor_home.jsp");        } 
    else if(rs3.next())
       {
           session.setAttribute("petid", rs3.getString("pet_id"));
            response.sendRedirect("../Petitioner/petitioner_home.jsp");
       } 
       else if(rs4.next())
      {
           session.setAttribute("witid", rs4.getString("wit_id"));            
           response.sendRedirect("../Witness/witness_home.jsp");
        } 
       
        
         else if(rs5.next())
        {
           session.setAttribute("adid", rs5.getString("admin_id"));
           response.sendRedirect("../Admin/admin_home.jsp");
       } 
     
       
    else         {
                out.println("Login Failed");
                
        }
     }
    %>
        
            
            
   

        
        <h1><font color="blue"><center>LOGIN</center></font></h1>
         <form name="frm_login">
            
                   <table class="table table-hover" align="center">
                <tr>
                    <td>User Name:
                    <td>
                        <input type="text"  name="txt_user" placeholder="Enter username" autocomplete="off" >

                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Password:
                    <td>
                        <input type="password"  name="txt_pass" placeholder="Enter password" required/>

                    </td>
                    </td>
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="LOGIN">
                        <input type="submit" name="btn_reset" formaction="GuestHome.jsp" value="CANCEL">
                    </td>
                </tr>
             
                <tr><td>New User.....<a href="PetitionerRegistration.jsp">Sign Up..?</a></td></tr>
                 <tr><td>Forget Password.....<a href="forget.jsp">Forget..?</a></td></tr>
            </table>
        </form>





        
        </table>

    </body>
</html>
