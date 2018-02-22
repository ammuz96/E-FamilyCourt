<%-- 
    Document   : AddCouncillor
    Created on : 8 Feb, 2018, 10:27:08 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::CouncillorDetails</title>
    </head>
    
   
     <body bgcolor="pink">
        
        <h1><font color="brown"><center>Councillor Details</center></font></h1>
         <%
             String a="";
            String name="",nam="";
            String adrs="",adr="";
            String disid="", dsname="";
            String email="",emai="";
            String cno="",cn="";
             String age="",ag="";
             String exp="",ex="";
              String qua="",qu="";
            
             String scon="";
            String couid="", couname="";
            
            String editID="";
            String cid="";
            String usern="",passw="";
            String logid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_councillor a inner join tbl_district d inner join tbl_court c  on a.dist_id=d.dist_id and a.court_id=c.court_id where cou_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("cou_id");
                    name= rs.getString("cou_name");
                   adrs= rs.getString("cou_adrs");
                   disid=rs.getString("dist_id");
                    email= rs.getString("cou_email");
                    cno= rs.getString("cou_cno");
                    age= rs.getString("cou_age");
                    exp= rs.getString("cou_exp");
                    qua= rs.getString("cou_qua");
        
                    
                  
                  
                  couid=rs.getString("court_id");
                  
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String SEL="SELECT * from tbl_councillor where cou_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
                String delf = "delete from tbl_councillor where cou_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(delf);
                if (b==true)
                {
                    response.sendRedirect("AddCouncillor.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                        adr=request.getParameter("dname");
                         dsname=request.getParameter("dsnam");
                        emai=request.getParameter("sname");
                        cn=request.getParameter("pname");
                        ag=request.getParameter("aname");
                        ex=request.getParameter("enameee");
                       qu=request.getParameter("qname");
                       
                        couname=request.getParameter("counam");
                        
                        usern=request.getParameter("user");
                        passw=request.getParameter("pass");
                  String hh=request.getParameter("hid");
                       
                    scon=request.getParameter("txt_scon");
                        
                         if(scon.equals(passw)){
                        String insQry1="insert into tbl_login(username,password,type)values('"+usern+"','"+passw+"','Councillor')";
                         boolean b2=obj.ExecuteCommand(insQry1);
                         
                         String sel="select max(login_id) as login from tbl_login";
                         ResultSet rs4=obj.selectData(sel);
                         if(rs4.next())
                         {
                              logid=rs4.getString("login");
                         }

                        String insQry="insert into tbl_councillor(cou_name,cou_adrs,dist_id,cou_email,cou_cno,cou_age,cou_exp,cou_qua,court_id,login_id)values('"+nam+"','"+adr+"','"+dsname+"','"+emai+"','"+cn+"','"+ag+"','"+ex+"','"+qu+"','"+couname+"','"+logid+"')";
                        
            

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
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Address:
                    <td>
                        <input type="text" name="dname" value="<%=adrs%>">
                        
                    </td>
                    </td>
                </tr><tr>
            <td> District :</td>
            <td><select name="dsnam">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                        String id=rs.getString("dist_id");   
                    %>
                    <option <% if(disid.equals(id)){%> selected=""<%}%> value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                
                
            </td>
        </tr>
        
      
                
                <tr>
                    <td>E-Mail:
                    <td>
                        <input type="text" name="sname"value="<%=email%>" >
                        
                    </td>
                    </td>
                </tr><tr>
                    <td>Contact Number :
                    <td>
                        <input type="text" name="pname" value="<%=cno%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Age :
                    <td>
                        <input type="text" name="aname" value="<%=age%>">
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td>Experience :
                    <td>
                        <input type="text" name="enameee" value="<%=exp%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Qualification :
                    <td>
                        <input type="text" name="qname" value="<%=qua%>">
                        
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
                </tr><tr>
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
           <th>Address</th>
        <th>District</th>
        <th>E-mail</th>
           <th>Contact Number</th>
           <th>Age</th>
           <th>Experience</th>
           <th>Qualification</th>
           <th>Court Name</th>
                                 

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_councillor a inner join tbl_district d inner join tbl_court c  on a.dist_id=d.dist_id and a.court_id=c.court_id ";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("cou_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("cou_name")%></td>
                   <td><%=rs3.getString("cou_adrs")%></td>
                   <td><%=rs3.getString("dist_name")%></td>
                   <td><%=rs3.getString("cou_email")%></td>
                   <td><%=rs3.getString("cou_cno")%></td>
                   <td><%=rs3.getString("cou_age")%></td>
                   <td><%=rs3.getString("cou_exp")%></td>
                   <td><%=rs3.getString("cou_qua")%></td>
                                    
                                    <td><%=rs3.getString("court_name")%></td>
                     
                 <td><a href="AddCouncillor.jsp?did=<%=CID%>">Delete</a></td>
                 
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>

        
        
        
        
        
