<%-- 
    Document   : AddLocation
    Created on : 21 Feb, 2018, 3:13:49 AM
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
    <body bgcolor="pink">
        
        <h1><font color="blue"><center>Location Details</center></font></h1>
        
        
        
       <%
            String cname="",cnam="";
            
            String cid="";
            String disid="", dsname="";
            String editID="";
            
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_district c inner join tbl_location d on c.dist_id=d.dist_id where loc_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("loc_id");
                    cnam= rs.getString("loc_name");
                    disid=rs.getString("dist_id");
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_location where loc_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("AddLocation.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 cname=request.getParameter("sname");
                 dsname=request.getParameter("dsnam");
                          String hh=request.getParameter("hid");
                       
                    if (!hh.equals("")) 
                         {
                    String up = "update tbl_location set loc_name='"+cname+"',dist_id='"+dsname+"' where loc_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                        
                  
                } else {

           
                     
                       

                        String insQry="insert into tbl_location(loc_name,dist_id)values('"+cname+"','"+dsname+"')";
                        
                       boolean b= obj.ExecuteCommand(insQry);
                       
                   
                
            }

            }     
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
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
                    <td>Location:
                    <td>
                        <input type="text" name="sname"value="<%=cnam%>">
                        
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
                
           <th> Location</th>
                                <th>District</th>

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_district c inner join tbl_location d on c.dist_id=d.dist_id";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("loc_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs1.getString("loc_name")%></td>
                   <td><%=rs1.getString("dist_name")%></td>
                 <td><a href="AddLocation.jsp?did=<%=CID%>">Delete</a></td>
                 <td><a href="AddLocation.jsp?eid=<%=CID%>">Edit</a></td>
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
