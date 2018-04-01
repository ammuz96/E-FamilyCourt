<%-- 
    Document   : AddExcuse
    Created on : 13 Feb, 2018, 7:48:03 AM
    Author     : acer
--%>


<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::Details</title>
    </head>
    
   
     <body bgcolor="azure">
        
         <h1><font color="brown"><center><b><i>EXCUSE DETAILS</i></b></center></font></h1>
         <%
            String name="",nam="";
            String adrs="",adr="";
            String disid="", dsname="";
            String email="",emai="";
            String cno="",cn="";
             String caseid="",casid="";
                     String petitionid="";
            

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                 
                                         adr=request.getParameter("sname");
                         dsname=request.getParameter("dsnam");
                       
               
                       
                               String insQry="insert into tbl_escuse(exc_des,pet_id,adv_id,exc_reason,exc_date)values('"+nam+"','"+session.getAttribute("petid")+"','"+session.getAttribute("advID")+"','"+adr+"','"+dsname+"')";
                        
            

                       boolean b= obj.ExecuteCommand(insQry);
                       
                  if(b)
                      {%>
                         <script type="text/javascript">
            alert(" Successfully Submitted..");
           
        </script>
                          
                     <%  }
                      
                      else
                          out.println(insQry);
                }
          
            
            
           
                
                
            
 
    %>

                   
                
            

                 
            
            
     
        
        
       <form name="frm_adc">
        
            
            <table class="table table-hover" align="center">
                
                <tr>
                    <td>Excuse Date:
                    <td>
                        <input type="date" name="dsnam">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Excuse Description:
                    <td>
                    <textarea name="name"></textarea>
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Excuse Reason:
                    <td>
                    
                        <textarea name="sname"></textarea>
                    </td>
                    </td>
                </tr>
                <tr><td></td></tr> <tr><td></td></tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SEND TO ADVOCATE">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" name="btn_reset" formaction="viewpetition.jsp" value="CANCEL">
                    </td></tr>
            </table>
      
            
                   <table class="table table-hover" align="center" border="">
                       <tr><td>Sl no</td>
                          
                           <td>Excuse Description</td>
                           <td>Excuse Reason</td>
                           <td>Excuse Date</td>
                    
                           <td>Approval Status</td>




                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_petition s inner join tbl_petitioner c inner join tbl_advocate a inner join tbl_escuse e on a.adv_id=s.adv_id and s.pet_id=c.pet_id and e.adv_id=a.adv_id and e.pet_id=c.pet_id where e.pet_id='"+session.getAttribute("petid")+"'";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
        
     %>
     <tr>
         <td><%=i%></td>
                  <td><%=rs.getString("exc_des")%></td>
         <td><%=rs.getString("exc_reason")%></td>
        
         <td><%=rs.getString("exc_date")%></td>
          
         
         
       
  
             <%
            if(rs.getString("jud_approve_status").equals("0"))
            {
          %>
         
          <td><a href="AddExcuse.jsp?eid=<%=rs.getString("exc_id")%>"></a><font color="red">Approval Pending</td>
         <%}
            else if(rs.getString("jud_approve_status").equals("1"))
            {
                %>
                <td style="color: green">Excuse Approved</td>
                <%
            }
            else if(rs.getString("jud_approve_status").equals("2"))
            {
                %>
                <td style="color: red">Excuse Rejected</td>
                <%
            }
            
            %>

        
   </tr>
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
        </form>
                    
    </body>
</html>

        
        
        
        
        
