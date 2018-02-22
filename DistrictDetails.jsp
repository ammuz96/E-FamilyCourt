<%-- 
    Document   : district
    Created on : 6 Feb, 2018, 10:31:01 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FamilyCourt::District</title>
    </head>
    <body bgcolor="pink">
        
          
        
        
       <%
            String staName="",stname="";
            String staID="",stid="";
             if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_district where dist_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
                if (rs.next()) {
                    stid = rs.getString("dist_id");
                    stname= rs.getString("dist_name");
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_district where dist_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b) {
                    response.sendRedirect("DistrictDetails.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
            {
                        staName=request.getParameter("txt_state");
                         if (request.getParameter("hid")!= "" ) {
                    String up = "update tbl_district set dist_name='"+staName+"' where dist_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                    if (b) {
                        response.sendRedirect("DistrictDetails.jsp");
                    } else {
                        out.println(up);
                    }

                } else {


                        String insQry="insert into tbl_district(dist_name)values('"+staName+"')";
                        
                       boolean b= obj.ExecuteCommand(insQry);
                         
                         if (b) {
                        response.sendRedirect("DistrictDetails.jsp");
                    } else {
                        out.println(insQry);
                    }
                }
            }

               
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              <input type="hidden" name="hid" value="<%=stid%>">
            
            <table class="table table-hover" align="center">
                <tr> <h1><font color="brown"><center>District Details</center></font></h1></tr>
  
                <tr>
                    <td>District Name:
                    <td>
                        <input type="text" name="txt_state"value="<%=stname%>">
                        
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
                <th>District Name</th>
           
            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_district";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               staID=rs.getString("dist_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("dist_name")%></td>
                 <td><a href="DistrictDetails.jsp?did=<%=staID%>">Delete</a></td>
                 <td><a href="DistrictDetails.jsp?eid=<%=staID%>">Edit</a></td>
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
