<%-- 
    Document   : JudgeViewPetition
    Created on : 4 Apr, 2018, 12:46:36 AM
    Author     : acer
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt</title>
    </head>
    <body bgcolor="azure">
        <% 
            
            String fid="";
            String disid="",casid="";
//        if(request.getParameter("fid")!=null)
//            {
//                session.setAttribute("pet", request.getParameter("fid"));
//                response.sendRedirect("CourtPetition.jsp");
//            }
//            
        %>
        
        
       <form name="frm_studentpro">
            <input type="hidden" name="hid">
            <table class="table table-hover" align="center"><tr><th><h1 align="center"><font color="blue"><i>COURT PETITIONS</i></font></h1></th></tr>
               
               
          
                   <tr>
            <td><b>Select The Case Category:....
            <select name="casnam" >
                <option value="selec" hidden="dd">--Select--</option>
                    <%
                        String selec="select *from tbl_casecategory";
                         ResultSet rs2=obj.selectData(selec);
                        while(rs2.next())
                        {
                        String id=rs2.getString("case_id");   
                    %>
                    <option <% if(casid.equals(id)){%> selected=""<%}%> value="<%=rs2.getString("case_id")%>"><%=rs2.getString("case_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                        </select></td>
                        
                        
                        
                               </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
      </tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
      
      
      
      
      
                  <tr><td colspan="2" align="center">
                         <input type="submit" name="btn_submit" value="SEARCH PETITIONERS">
                        
                         &nbsp;&nbsp;&nbsp;&nbsp;
                          <input name="btn_reset" type="submit"  formaction="petitioner_home.jsp"value="CANCEL">
                    </td></tr>
            </table>
                    
                    <table><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr></table>
                
                    
                    
                    <%
                        String dist="";
                        String ctype="";
                        if(request.getParameter("btn_submit")!=null)
                        {
                         
                            ctype=request.getParameter("casnam");
                            String CID="";
            int i=1;
            String selQry="select * from tbl_petition s , tbl_petitioner c , tbl_advocate a ,tbl_judge j, tbl_district d where a.adv_id=s.adv_id and s.pet_id=c.pet_id and a.court_id=j.court_id and d.dist_id=c.dist_id and s.court_sub_status=1 and s.jud_approve_status=1 and s.case_id='"+ctype+"' and j.jud_id='"+session.getAttribute("judid")+"'";
                              ResultSet rs3=obj.selectData(selQry);
                            %>
                            <table  align="center" bgcolor="azure" >
                         <tr><b><font color="red">
                
                
           
           </font>    </b>
            </tr>
                            <%
                             
            while(rs3.next())
            {
           CID=rs3.getString("pet_id");
                  
   
                
        %>
        
        
        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                   
               
               <tr>     
                   
                   
                   
                   <td><img src="../Petitioner/Photo/<%=rs3.getString("pet_photo")%>" height="150" width="150">
                   </td> 
                   <td>                      <a href="CourtPetition.jsp?did=<%=CID%>">
                           <font color=azure>................</font><b>View Petition</a></td></tr>
                            
               <tr><th align="left">Name:</th>   <td><%=rs3.getString("pet_name")%></td></tr>
                   
               <tr><th align="left">E-mail:</th>    <td><%=rs3.getString("pet_email")%></td></tr>
               <tr><th align="left">Contact Number:</th>     <td><%=rs3.getString("pet_cno")%></td></tr>
                   
                                    
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>                    
                
                 
         
               </tr>
               <%
               
               i++;
                
            }
        
                        }
                %>
            
    
       
            
           
        </table>
 
                
                </form> 
    </body>
</html>
