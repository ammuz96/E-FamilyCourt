<%-- 
    Document   : judge
    Created on : 16 Apr, 2018, 12:29:25 AM
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
       <table>
           <h1 align="center"><font color="red"> Existing Details</font></h1></table><br><br><br>
                    <table border="2">
                         <tr style="background-color: lavenderblush">
                <td>sl.no</td>
                <td> Name</td>
           
        <td>E-mail</td>

           <td>Contact</td>

          <td> Court <br>Name</td>

              <td>Remove Details</td>

           
                      

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
                                    <td><a href="AddJudge.jsp?did=<%=CID%>">REMOVE</a></td>
                
               </tr>
               <%
               
               i++;
                
            }
        %>
                    </table>
                    
                    
                    
                    <br><br>
                    
                    
                     <table align="center"><tr><td style="background-color: mediumturquoise">
            
                                 <a  href="AddJudge.jsp"> <font color=white>PREVIOUS </font></td></tr>  
            
        </table>  
        
                     
                     
                                         
                     
       </form>
 <br><br><br><br>
 
    </body>
</html>
<%@include  file="adfoot.jsp" %>