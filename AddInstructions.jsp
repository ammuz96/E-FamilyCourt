<%-- 
    Document   : AddInstructions
    Created on : 19 Feb, 2018, 2:30:43 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::Instructions</title>
    </head>
    
   
     <body bgcolor="pink">
        
        <h1><font color="brown"><center>Instructions</center></font></h1>
         <%
            String name="",nam="";
                      String couid="", couname="";
            String jid="", juname="";
            String editID="";
            String cid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_instructions where ins_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("ins_id");
                    name= rs.getString("ins_des");
                                  
                  
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_instructions where ins_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("AddInstructions.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                        
                       
                                  String hh=request.getParameter("hid");
                       
                    if (!hh.equals("")) 
                         {
                    String up = "update tbl_instructions set ins_des='"+nam+"' where ins_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                        
                  
                } else {

                        
                        
                        String insQry="insert into tbl_instructions(ins_des)values('"+nam+"')";
                        
            

                       boolean b= obj.ExecuteCommand(insQry);
                       
                      
       if(b ){response.sendRedirect("AddInstructions.jsp");
                          
                }
            else
            {  out.println(insQry);   
            }
                  
                     
                    }}
 
    %>

                   
                
            

                 
            
            
     
        
        
       <form name="frm_adc">
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Instruction:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
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
                <th>Instructions</th>
                     

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_instructions";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("ins_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("ins_des")%></td>
                                    
                                          <td><a href="AddInstructions.jsp?did=<%=CID%>">Delete</a></td>
                 
         <td><a href="AddInstructions.jsp?eid=<%=CID%>">Edit</a></td>
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>

 