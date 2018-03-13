<%-- 
    Document   : newjsp
    Created on : 7 Feb, 2018, 1:43:35 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::AdvocateDetails</title>
        <script>
            function pwdcheck(p1,p2)
            {
                
                if(p1.value!=p2.value)
                {
                    alert("Password Missmatch");
                    return false;
                }
                else
                {
                    return true;
                    
                }
            }
        </script>
    </head>
    
   
     <body bgcolor="white">
         <% String disid="",casid="",couid="";
         
         
         %>
        
         <h1><font color="violet"><center><b><i>Advocate Registration</i></b></center></font></h1>
         
        
    <form name="frm_adc" action="AdvocatePhotoUpload.jsp" method="post" enctype="multipart/form-data">
              <input type="hidden" name="hid">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name"  >
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Address:
                    <td>
                        <input type="text" name="dname">
                        
                    </td>
                    </td>
                </tr><tr>
            <td> District :</td>
            <td><select name="dsnam">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                        String id=rs.getString("dist_id");   
                    %>
                    <option <% if(disid.equals(id)){%> selected=""<%}%> value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                
                
            </td>
        </tr>
        
      
                
                <tr>
                    <td>E-Mail:
                    <td>
                        <input type="text" name="sname" >
                        
                    </td>
                    </td>
                </tr><tr>
                    <td>Contact Number :
                    <td>
                        <input type="text" name="pname">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Upload Photo :
                    <td>
                        <input type="file" name="txt_pho">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Upload Proof :
                    <td>
                        <input type="file" name="txt_proof">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Sitting Fees :
                    <td>
                        <input type="text" name="txt_fee">
                        
                    </td>
                    </td>
                </tr>
       
                <tr>
                    <td>Age :
                    <td>
                        <input type="text" name="aname">
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td>Experience :
                    <td>
                        <input type="text" name="enameee">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Qualification :
                    <td>
                        <input type="text" name="qname">
                        
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
                </tr>
                 <tr>
                     <td>Case Category :</td>
                    <td><select name="casnam">
                    <option value="selec">--Select--</option>
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
                                <tr>
                    <td>User Name :
                    <td>
                        <input type="text" name="user">
                        
                    </td>
                    </td>
                </tr>
                 <tr>
                    <td>Password :
                    <td>
                        <input type="password" name="pass">
                        
                    </td>
                    </td>
                </tr>
                
               <tr>
                    <td>Confirm Password :
                    <td>
                        <input type="password" name="txt_scon" onblur="pwdcheck(this,pass)">
                        
                    </td>
                    </td>
                </tr>

                
               
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT">
                          <input type="submit" name="btn_reset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
       
    </body>
</html>

        
        
        
        
        
   