<%-- 
    Document   : AddJudge
    Created on : 8 Feb, 2018, 9:19:01 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::JudgeDetails</title>
    </head>
    <body bgcolor="pink">
        <h1><font color="brown"><center>Judge Details</center></font></h1>
         <%
             String a="";
            String name="",nam="";
             String email="",emai="";
            String cno="",cn="";
             
             String scon="";
            
            String couid="", couname="";
            
            String editID="";
            String cid="";
            String usern="",passw="";
            String logid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_judge a  inner join tbl_court c  a.court_id=c.court_id  where jud_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("adv_id");
                    name= rs.getString("adv_name");
                   
                    email= rs.getString("adv_email");
                    cno= rs.getString("adv_cno");
                    
                    
                  
                  
                  couid=rs.getString("court_id");
                  
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String SEL="SELECT * from tbl_judge where jud_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
                String deld = "delete from tbl_judge where jud_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(deld);
                if (b==true)
                {
                    response.sendRedirect("AddJudge.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                                                
                        emai=request.getParameter("sname");
                        cn=request.getParameter("pname");
                        
                        couname=request.getParameter("counam");
                        
                        usern=request.getParameter("user");
                        passw=request.getParameter("pass");
                  String hh=request.getParameter("hid");
                       scon=request.getParameter("txt_scon");
                         if(scon.equals(passw)){
                        String insQry1="insert into tbl_login(username,password,type)values('"+usern+"','"+passw+"','Judge')";
                         boolean b2=obj.ExecuteCommand(insQry1);
                         
                         String sel="select max(login_id) as login from tbl_login";
                         ResultSet rs4=obj.selectData(sel);
                         if(rs4.next())
                         {
                              logid=rs4.getString("login");
                         }

                        String insQry="insert into tbl_judge(jud_name,jud_email,jud_cno,court_id,login_id)values('"+nam+"','"+emai+"','"+cn+"','"+couname+"','"+logid+"')";
                        
            

                       boolean b= obj.ExecuteCommand(insQry);
                       if(b)
                      {
         %>
                         <script type="text/javascript">
            alert(" Successfully Registered..");
           
        </script>
                          
                     <% }
                      
                      else
                          out.println(insQry);
                }
            else
            {%>
                
            <script>
                alert('Password Missmatch...!');
                </script>
            
            
            
           <%
                  
            }
                 
                  
                }
        
 
    %>

     
        
        
       <form name="frm_adc">
              <input type="hidden" name="hid" >
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name" >
                        
                    </td>
                    </td>
                </tr>
               
                <tr>
                    <td>E-Mail:
                    <td>
                        <input type="text" name="sname" >
                        
                    </td>
                    </td>
                </tr><tr>
                    <td>Contact Number :
                    <td>
                        <input type="text" name="pname" >
                        
                    </td>
                    </td>
                </tr>
                <tr>
                   <td>Court Name :</td>
                    <td><select name="counam">
                    <option value="sele">--Select--</option>
                    <%
                        String sele="select *from tbl_court";
                         ResultSet rs1=obj.selectData(sele);
                        while(rs1.next())
                        {
                        String id=rs1.getString("court_id");   
                    %>
                    <option <% if(couid.equals(id)){%> selected=""<%}%> value="<%=rs1.getString("court_id")%>"><%=rs1.getString("court_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                </td>
                </tr>
                                <tr>
                    <td>User Name :
                    <td>
                        <input type="text" name="user">
                        
                    </td>
                    </td>
                </tr>
                 <tr>
                    <td>Password :
                    <td>
                        <input type="password" name="pass">
                        
                    </td>
                    </td>
                </tr>
                
               <tr>
                    <td>Confirm Password :
                    <td>
                        <input type="password" name="txt_scon">
                        
                    </td>
                    </td>
                </tr>
                
               
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT">
                          <input type="submit" name="btn_reset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
                     <table  align="center" border="1">
            <tr>
                <th>sl no</th>
                <th> Name</th>
           
        <th>E-mail</th>
           <th>Contact Number</th>
           <th>Court Name</th>
           
                      

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_judge a inner join  tbl_court c on a.court_id=c.court_id ";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("jud_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("jud_name")%></td>
                   <td><%=rs3.getString("jud_email")%></td>
                   <td><%=rs3.getString("jud_cno")%></td>
                                    
                                    <td><%=rs3.getString("court_name")%></td>
                                    <td><a href="AddJudge.jsp?did=<%=CID%>">Delete</a></td>
                
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>

    </body>
</html>
