<%-- 
    Document   : AddFeedBack
    Created on : 13 Feb, 2018, 7:55:33 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FamilyCourt::feedback</title>
    </head>
    <body bgcolor="pink">
        
          
        
        
       <%
            String staName="",stname="";
            String staID="",stid="";
             

            if(request.getParameter("btn_submit")!=null)
            {
                        staName=request.getParameter("txt_state");
                         

                        String insQry="insert into tbl_feedback(feedback_des,pet_id)values('"+staName+"','" +session.getAttribute("petid") + "')";
                        
                       boolean b= obj.ExecuteCommand(insQry);
                         
                         if (b) {
                        response.sendRedirect("AddFeedBack.jsp");
                    } else {
                        out.println(insQry);
                    }
                }
            

               
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              <input type="hidden" name="hid">
            
            <table class="table table-hover" align="center">
                <tr> <h1><font color="brown"><center>Feed Back</center></font></h1></tr>
  
                <tr>
                    <td>Please Mention Your Suggestions Here:
                    <td>
                        <input type="text" name="txt_state">
                        
                    </td>
                    </td>
                </tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT FEED BACK">
                          <input type="submit" name="btn_reset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
        
        
        
        
        
        
    </body>
</html>
