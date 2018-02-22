<%-- 
    Document   : casecategory
    Created on : 6 Feb, 2018, 11:20:07 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::casecategory</title>
    </head>
    <body bgcolor="pink">
        
        <h1><font color="blue"><center>Case Categories</center></font></h1>
        
        
        
       <%
            String cname="",cnam="";
            String cdes="",cde="";
            String csec="",cse="";
            String cpun="",cpu="";
            String CID="",cid="";
             if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_casecategory where case_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
                if (rs.next()) {
                    cid= rs.getString("case_id");
                    cnam= rs.getString("case_name");
                    cde= rs.getString("case_des");
                    cse= rs.getString("case_section");
                    cpu= rs.getString("case_punishment");
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_casecategory where case_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b) {
                    response.sendRedirect("casecategory.jsp");
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
                         if (request.getParameter("hid")!= "" ) {
                    String up = "update tbl_casecategory set case_name='"+cname+"',case_des='"+cdes+"',case_section='"+csec+"',case_punishment='"+cpun+"' where case_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                    if (b) {
                        response.sendRedirect("casecategory.jsp");
                    } else {
                        out.println(up);
                    }

                } else {


                        String insQry="insert into tbl_casecategory(case_name,case_des,case_section,case_punishment)values('"+cname+"','"+cdes+"','"+csec+"','"+cpun+"')";
                        
                       boolean b= obj.ExecuteCommand(insQry);
                         
                         if (b) {
                        response.sendRedirect("casecategory.jsp");
                    } else {
                        out.println(insQry);
                    }
                }
            }

               
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              <input type="hidden" name="hid" value="<%=cid%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Case Name:
                    <td>
                        <input type="text" name="name"value="<%=cnam%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Case Description:
                    <td>
                        <input type="text" name="dname"value="<%=cde%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Case Section:
                    <td>
                        <input type="text" name="sname"value="<%=cse%>">
                        
                    </td>
                    </td>
                </tr><tr>
                    <td>Case Punishment:
                    <td>
                        <input type="text" name="pname"value="<%=cpu%>">
                        
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
                <th>Case Name</th>
           <th>Case Description</th>
           <th>Case Section</th>
           <th>Case Punishment</th>
            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_casecategory";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               CID=rs.getString("case_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("case_name")%></td>
                   <td><%=rs.getString("case_des")%></td>
                   <td><%=rs.getString("case_section")%></td>
                   <td><%=rs.getString("case_punishment")%></td>
                 <td><a href="casecategory.jsp?did=<%=CID%>">Delete</a></td>
                 <td><a href="casecategory.jsp?eid=<%=CID%>">Edit</a></td>
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
