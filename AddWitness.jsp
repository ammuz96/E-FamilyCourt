<%-- 
    Document   : AddWitness
    Created on : 8 Feb, 2018, 11:20:26 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::WitnessDetails</title>
    </head>
    
   
     <body bgcolor="pink">
        
        <h1><font color="brown"><center>Witness Details</center></font></h1>
         <%
             String a="";
            String name="",nam="";
            String adrs="",adr="";
            String disid="", dsname="";
            String email="",emai="";
            String cno="",cn="";
             
            String scon="";
            
            
            String editID="";
            String cid="";
            String usern="",passw="";
            String logid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_witness a inner join tbl_district d on a.dist_id=d.dist_id where wit_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("wit_id");
                    name= rs.getString("wit_name");
                   adrs= rs.getString("wit_adrs");
                   disid=rs.getString("dist_id");
                    email= rs.getString("wit_email");
                    cno= rs.getString("wit_cno");
                  
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String SEL="SELECT * from tbl_witness where wit_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
                String dell = "delete from tbl_witness where wit_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(dell);
                if (b==true)
                {
                    response.sendRedirect("AddWitness.jsp");
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
                                                usern=request.getParameter("user");
                        passw=request.getParameter("pass");
                  String hh=request.getParameter("hid");
                       
                    scon=request.getParameter("txt_scon");
                        
                      if(scon.equals(passw))
                { 
     
                        String insQry1="insert into tbl_login(username,password,type)values('"+usern+"','"+passw+"','Witness')";
                         boolean b2=obj.ExecuteCommand(insQry1);
                         
                         String sel="select max(login_id) as login from tbl_login";
                         ResultSet rs4=obj.selectData(sel);
                         if(rs4.next())
                         {
                              logid=rs4.getString("login");
                         }

                        String insQry="insert into tbl_witness(wit_name,wit_adrs,dist_id,wit_email,wit_cno,login_id)values('"+nam+"','"+adr+"','"+dsname+"','"+emai+"','"+cn+"','"+logid+"')";
                        
            

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
                  
                 
                  
                }}
        
 
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
           <th>Address</th>
        <th>District</th>
        <th>E-mail</th>
           <th>Contact Number</th>
                                 

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_witness a inner join tbl_district d on a.dist_id=d.dist_id ";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("wit_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("wit_name")%></td>
                   <td><%=rs3.getString("wit_adrs")%></td>
                   <td><%=rs3.getString("dist_name")%></td>
                   <td><%=rs3.getString("wit_email")%></td>
                   <td><%=rs3.getString("wit_cno")%></td>
                     
                 <td><a href="AddWitness.jsp?did=<%=CID%>">Delete</a></td>
                 
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>

        
        
        
        
        
