<%-- 
    Document   : PetitionerRegistration
    Created on : 8 Feb, 2018, 11:17:10 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>familycourt::PetitionerDetails</title>
            
            
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


        <body bgcolor="pink">


     
           
            <form name="frm_adc"  action="PetitionerPhotoUpload.jsp" method="post" enctype="multipart/form-data">
            

            <table class="table table-hover" align="center">
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr> <h1><font color="brown"><i><center>PETITIONER REGISTRATION</center></i></font></h1></tr>
                <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name">

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
                                String sel = "select *from tbl_district";
                                ResultSet rs = obj.selectData(sel);
                                while (rs.next()) {
                                    String id = rs.getString("dist_id");
                            %>
                            <option value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>




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
                    <td>Age :
                    <td>
                        <input type="text" name="aname">

                    </td>
                    </td>
                </tr>

                <tr>
                    <td>Location :
                    <td>
                        <input type="text" name="qname">

                    </td>
                    </td>
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
               


                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT">
                        <input type="submit" name="btn_reset" value="CANCEL" formaction="GuestHome.jsp">
                    </td></tr>
            </table>
        </form>

    </body>
</html>






