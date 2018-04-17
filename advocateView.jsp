<%-- 
    Document   : advocateView
    Created on : 16 Apr, 2018, 12:56:19 AM
    Author     : acer
--%>
<%@include  file="adhead.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <% String disid="",casid="";
        
        %>
         
        
        
        
        
        <form>
            
            
            
            
            <input type="hidden" name="hid">
            <table  align="center">
                <tr><th><h1 align="center"><font color="red"><i><markquee>Search Advocate....</markquee></i></font></h1></th></tr>
                <tr><td></td></tr> </table>        
  <table  align="center">      <tr>
            <td><b>Select the Court :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="dsnam">
                <option value="sel" hidden="uu">--Select--</option>
                    <%
                        String sel="select *from tbl_court";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                        String id=rs.getString("court_id");   
                    %>
                    <option <% if(disid.equals(id)){%> selected=""<%}%> value="<%=rs.getString("court_id")%>"><%=rs.getString("court_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
                </select>
                
                
            </td>
        </tr>
        
      
               
                
               
          
                   <tr>
                       <td><b>Select the Case Category :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select name="casnam" >
                <option value="selec" hidden="bb">--Select--</option>
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
                               </tr>
                               
                               
                            <tr><td></td></tr>
      
                  <tr><td colspan="2" align="center">
                          <input type="submit" name="btn_submit" value="SEARCH" style="background-color: mediumturquoise">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        
                          <input name="btn_reset" type="reset"value="CANCEL" style="background-color: mediumturquoise">
                      </td></tr><tr><td></td></tr>
            
  </table>
            
            
            
            
            
            
            <table align="center"> <h2><font color="red"><center>Existing Details</center></font></h2></table><br><br>
                     <table  align="center">
                         
    
        <%
                        String dist="";
                        String ctype="";
                        if(request.getParameter("btn_submit")!=null)
                        {
                            dist=request.getParameter("dsnam");
                            ctype=request.getParameter("casnam");
                            String CID="";
            
      
            int i=1;
            String selQry="select * from tbl_advocate a inner join tbl_district d inner join tbl_court c inner join tbl_casecategory e on a.dist_id=d.dist_id and a.court_id=c.court_id and a.case_id=e.case_id where a.adv_status=1 and a.court_id='"+dist+"' and a.case_id='"+ctype+"'";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("adv_id");
                
        %>
              
        <tr><td><%=i%>:</td>   <td><img src="../Advocate/Photo/<%=rs3.getString("adv_photo")%>" height="150" width="150"></td>
        
            <td><a href="AddAdvocate.jsp?did=<%=CID%>"><font color=white>......</font>REMOVE THIS ADVOCATE</a></td>
        
        </tr>     
        <tr>    <td></td>  <th align="left">Name:</th>    <td><%=rs3.getString("adv_name")%></td></tr>
         <tr>    <td></td>  <th align="left">Address:</th>           <td><%=rs3.getString("adv_adrs")%></td></tr>
   <tr>    <td></td>  <th align="left">District:</th>                <td><%=rs3.getString("dist_name")%></td></tr>
           <tr>    <td></td>  <th align="left">E-mail:</th>        <td><%=rs3.getString("adv_email")%></td></tr>
                 <tr>    <td></td>  <th align="left">Contact Number:</th>  <td><%=rs3.getString("adv_cno")%></td></tr>
                   
          <tr>    <td></td>  <th align="left">Sitting Fee:</th>         <td><%=rs3.getString("adv_fee")%></td></tr>
                <tr>    <td></td>  <th align="left">Consultation Fee:</th>   <td><%=rs3.getString("adv_consult_fee")%></td></tr>
  
              <tr>    <td></td>  <th align="left">Age:</th>     <td><%=rs3.getString("adv_age")%></td></tr>
              <tr>    <td></td>  <th align="left">Experience:</th>     <td><%=rs3.getString("adv_exp")%></td></tr>
              <tr>    <td></td>  <th align="left">Qualification:</th>     <td><%=rs3.getString("adv_qua")%></td></tr>
                                    
                             <tr>    <td></td>  <th align="left">Court Name:</th>       <td><%=rs3.getString("court_name")%></td></tr>
              <tr>    <td></td>  <th align="left">Case Category:</th>     <td><%=rs3.getString("case_name")%></td></tr>
  
              <tr><td></td></tr>   
               <tr><td></td></tr>   
         
           
               <%
               
               i++;
                
               
            }}
        %>
                     </table>
        <table align="center"><tr><td>
            
                    <input type="submit" style="background-color: mediumturquoise" formaction="AddAdvocate.jsp" value="PREVIOUS">  </td></tr>  
            
        </table>  
        
        
        
        </form><br><br><br><br>
    </body>
</html><%@include  file="adfoot.jsp" %>

