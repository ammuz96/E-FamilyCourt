<%-- 
    Document   : WitnessViewProfile
    Created on : 22 Feb, 2018, 2:39:22 AM
    Author     : acer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::profile editing</title>
    </head>
    <body bgcolor="">
         <%
    
    String seid="",spid="";
     String sname="",spname="";
     String sadrs="",spadrs="";
     
     String snum="",spnum="";
     String semail="",spemail="";
     String co="",spco="";
     String exp="",sexp="",fee="",age="",couid="",sfee="",sage="",counamm="",pho="",spnam="",qua="",disid="",name="",casid="";
    
   

 String selQry = "select * from tbl_witness where wit_id='" +session.getAttribute("witid") + "'";
                ResultSet rs = obj.selectData(selQry);
                while(rs.next())
{
  sname=rs.getString("wit_adrs");
  
  snum=rs.getString("wit_cno");
  semail=rs.getString("wit_email");
 
     
  name=rs.getString("wit_name");
   
    disid=rs.getString("dist_id");
   
}


   %>
        
   <h1><font color="violet"><center><b><i>My Profile</i></b></center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=seid%>">
            
            <table class="table table-hover" align="center">
                <tr><td></td></tr>
                 <tr>
                    <td><b>Name:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td><b> Address:
                    <td>
                        <input type="text" name="txt_s" value="<%=sname%>">
                        
                    </td>
                    </td>
                </tr>
               <tr>
            <td><b> District :</td>
            <td><select name="dsnam">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs8=obj.selectData(sel);
                        while(rs8.next())
                        {
                        String id=rs8.getString("dist_id");   
                    %>
                    <option <% if(disid.equals(id)){%> selected=""<%}%> value="<%=rs8.getString("dist_id")%>"><%=rs8.getString("dist_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                
                
            </td>
        </tr>
        
      
                
                <tr>
                    <td><b>Contact Number
                    <td>
                        <input type="number" name="txt_c"value="<%=snum%>" >
                        
                    </td>
                    </td>
                </tr>
                 <tr>
                    <td><b>Email:
                    <td>
                        <input type="email" name="txt_l"value="<%=semail%>" >
                        
                    </td>
                    </td>
                </tr>
                
                
                
                
                
                <tr><td></td></tr><tr><td></td></tr>
 <tr><td></td></tr>
 <tr><td></td></tr>
 <tr><td></td></tr>
 
                <tr><td colspan="2" align="center">
                        <input type="submit" formaction="WitnessEditProfile.jsp" value="EDIT PROFILE">
                        <input type="submit" formaction="witness_home.jsp" value="BACK">
                                           </td></tr>
               
                        </table>
        </form>
                       
   
        
     </body></html>