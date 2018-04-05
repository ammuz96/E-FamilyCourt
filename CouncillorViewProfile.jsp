<%-- 
    Document   : CouncillorViewProfile
    Created on : 22 Feb, 2018, 2:37:39 AM
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
    <body bgcolor="white">
         <%
    
    String seid="",spid="";
     String sname="",spname="";
     String sadrs="",spadrs="";
     
     String snum="",spnum="";
     String semail="",spemail="";
     String co="",spco="";
     String exp="",sexp="",fee="",age="",couid="",sfee="",sage="",counamm="",pho="",spnam="",qua="",disid="",name="";
    
   

 String selQry = "select * from tbl_councillor where cou_id='" +session.getAttribute("couid") + "'";
                ResultSet rs = obj.selectData(selQry);
                while(rs.next())
{
  sname=rs.getString("cou_adrs");
  
  snum=rs.getString("cou_cno");
  semail=rs.getString("cou_email");
 
  age=rs.getString("cou_age");
   exp=rs.getString("cou_exp");
    couid=rs.getString("court_id");
     
  name=rs.getString("cou_name");
    qua=rs.getString("cou_qua");
    disid=rs.getString("dist_id");
}


   %>
        
   <h1><font color="green"><center><b><i>My Profile</i></b></center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=seid%>">
            
            <table class="table table-hover" align="center">
                <tr><td></td></tr>
                 <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td> Address:
                    <td>
                        <input type="text" name="txt_s" value="<%=sname%>">
                        
                    </td>
                    </td>
                </tr>
               <tr>
            <td> District :</td>
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
                    <td>Contact Number
                    <td>
                        <input type="text" name="txt_c" value="<%=snum%>" >
                        
                    </td>
                    </td>
                </tr>
                 <tr>
                    <td>Email:
                    <td>
                        <input type="email" name="txt_l"value="<%=semail%>" >
                        
                    </td>
                    </td>
                </tr>
                
       
                <tr>
                    <td>Age :
                    <td>
                        <input type="text" name="txt_age" value="<%=age%>">
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td>Experience :
                    <td>
                        <input type="text" name="txt_exp" value="<%=exp%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Qualification :
                    <td>
                        <input type="text" name="qname" value="<%=qua%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                   <td>Court Name :</td>
                    <td><select name="counam">
                    <option value="sele">--Select--</option>
                    <%
                        String sele="select *from tbl_court";
                         ResultSet rs1=obj.selectData(sele);
                        while(rs1.next())
                        {
                        String id=rs1.getString("court_id");   
                    %>
                    <option <% if(couid.equals(id)){%> selected=""<%}%> value="<%=rs1.getString("court_id")%>"><%=rs1.getString("court_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                </td>
                </tr><tr><td></td></tr><tr><td></td></tr>
 <tr><td></td></tr>
 <tr><td></td></tr>
 <tr><td></td></tr>
 
                <tr><td colspan="2" align="center">
                        <a href="CouncillorEditProfile.jsp">EDIT PROFILE</a>
                                           </td></tr>
               
                        </table>
        </form>
                       
   
        
     </body></html>