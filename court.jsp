<%-- 
    Document   : court
    Created on : 7 Feb, 2018, 12:08:56 AM
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
        <script src="jquery.js" type="text/javascript"></script>
    </head>
    
             <body bgcolor="pink">
        
        <h1><font color="blue"><center>Court Details</center></font></h1>
        
        
        
       <%
          
            String cname="",cnam="";
            String cdes="",cde="";
            String csec="",cse="";
            String cpun="",cpu="";
            String cid="";
            String disid="", dsname="";
            String locid="", locname="";
            String editID="";
            
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_court c inner join tbl_district l on c.dist_id=l.dist_id where c.court_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("court_id");
                    cnam= rs.getString("court_name");
                    cde= rs.getString("court_adrs");
              
                    cpu= rs.getString("court_cno");
              
                    locid=rs.getString("dist_id");
                    editID=request.getParameter("eid");
                    
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_court where court_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("court.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 cname=request.getParameter("name");
                        cdes=request.getParameter("dname");
                        csec=request.getParameter("sname");
                        cpun=request.getParameter("pname");
                    
                        locname=request.getParameter("lnam");
                  String hh=request.getParameter("hid");
                       
                    if (!hh.equals("")) 
                         {
                    String up = "update tbl_court set court_name='"+cname+"',court_adrs='"+cdes+"',court_cno='"+csec+"',dist_id='"+locname+"' where court_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                        
                  
                } else {

           
                     
                       

                        String insQry="insert into tbl_court(court_name,court_adrs,court_cno,dist_id)values('"+cname+"','"+cdes+"','"+csec+"','"+locname+"')";
                        
                       boolean b= obj.ExecuteCommand(insQry);
                       if (b) {
                        response.sendRedirect("court.jsp");
                    } else {
                        out.println(insQry);
                    }
           
                   
                
            }

            }     
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Court Name:
                    <td>
                        <input type="text" name="name"value="<%=cnam%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Court Address:
                    <td>
                        <input type="text" name="dname"value="<%=cde%>">
                        
                    </td>
                    </td>
                </tr>
               
               
      
                <tr>
                    <td>Court District:
                    <td><select name="lnam">
                    <option value="sel">--Select--</option>
                    <%
                        String sels="select *from tbl_district";
                         ResultSet rsd=obj.selectData(sels);
                        while(rsd.next())
                        {
                        String id=rsd.getString("dist_id");   
                    %>
                    <option <% if(locid.equals(id)){%> selected=""<%}%> value="<%=rsd.getString("dist_id")%>"><%=rsd.getString("dist_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
                </select>
                
                
            </td>
        </tr>
        
      
               
      <tr>
                    <td>Contact Number :
                    <td>
                        <input type="text" name="sname"value="<%=cpu%>">
                        
                    </td>
                    </td>
                </tr>
                          
               
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT">
                          <input type="submit" name="btn_reset" value="CANCEL">
                    </td></tr>
            </table>
        
        
        
        
        
        
        <table  align="center" border="1">
            <tr>
                <th>sl no</th>
                <th>Court Name</th>
           <th>Court Address</th>
           <th>District</th>
        
           <th>Contact Number</th>
                      

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_court c inner join tbl_district d on c.dist_id=d.dist_id";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("court_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs1.getString("court_name")%></td>
                   <td><%=rs1.getString("court_adrs")%></td>
                    <td><%=rs1.getString("dist_name")%></td>

             
                   <td><%=rs1.getString("court_cno")%></td>
                                   <td><a href="court.jsp?did=<%=CID%>">Delete</a></td>
                 <td><a href="court.jsp?eid=<%=CID%>">Edit</a></td>
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
</form>
    </body>
</html>
