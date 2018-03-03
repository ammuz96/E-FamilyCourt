<%-- 
    Document   : AddCounsellingDetails
    Created on : 10 Feb, 2018, 10:33:51 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::court</title>
    </head>
    <body bgcolor="pink">
        
        <h1><font color="blue"><center>Counselling Details</center></font></h1>
        
        
        
       <%
           String date="",time="";
         String Date="",Time="";
            String csec="",cse="";
            String cpun="",cpu="";
            String cid="";
            String disid="", dsname="";
            String locid="", locname="";
            String editID="";
            
//             if (request.getParameter("eid") != null) 
//             {
//                String sel = "select * from tbl_counselling c inner join tbl_petitioner p inner join tbl_advocate a inner join tbl_councillor r on p.pet_id=c.pet_id and c.adv_id=a.adv_id and r.cou_id=c.cou_id where c.couns_id='" + request.getParameter("eid") + "' and r.cou_id='"+session.getAttribute("couid")+"'";
//                ResultSet rs = obj.selectData(sel);
//               while (rs.next())
//                {
//                    cid= rs.getString("couns_id");
//                    date= rs.getString("couns_date");
//                    time= rs.getString("couns_time");
//                     disid=rs.getString("adv_id");
//                    locid=rs.getString("pet_id");
//                    editID=request.getParameter("eid");
//                    out.print(editID);
//                    
//                }
//
//            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_counsellingdetails where counselling_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("AddCounsellingDetails.jsp");
                } else {
                    out.print(del);
                }

            }
            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 Date=request.getParameter("date");
                 Time=request.getParameter("name");
                 date=request.getParameter("dname");
                 time=request.getParameter("cname");
                 
                       
                            

                        String insQry="insert into tbl_counsellingdetails(pet_arg,res_arg,cou_remark,cou_id,pet_id,c_date,adv_id)values('"+Time+"','"+date+"','"+time+"','"+session.getAttribute("couid")+"','"+session.getAttribute("peti")+"','"+Date+"','"+session.getAttribute("advi")+"')";
                   
                       boolean b= obj.ExecuteCommand(insQry);
                       
                       
                   
                
            

            }     
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              
            <table class="table table-hover" align="center">
                 <tr>
                    <td>Counselling Date:
                    <td>
                        <input type="date" name="date">
                        
                    </td>
                    </td>
                </tr>
               
                
                <tr>
                    <td>Petitioner Arguments:
                    <td>
                        <input type="text" name="name">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Respondent Arguments:
                    <td>
                        <input type="text" name="dname">
                        
                    </td>
                    </td>
                </tr>
                  <tr>
                    <td>Councillor Remarks:
                    <td>
                        <input type="text" name="cname">
                        
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
                
          
           <th>Petitioner Name</th>
     
           <th>Respondent Name</th><th>Counselling Date</th><th>Petitioner Arguments</th><th>Respondent Arguments</th><th>Councillor Remarks</th>
                      

            </tr>
    
        <%
            
           String CID="";
           int i=1;
            String selQry="select * from tbl_counsellingdetails c inner join tbl_petitioner p inner join tbl_petition z inner join tbl_councillor r on p.pet_id=c.pet_id and r.cou_id=c.cou_id and z.pet_id=p.pet_id where c.cou_id='"+session.getAttribute("couid")+"'";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("counselling_id");
                
        %>
             <tr>
                   <td><%=i%></td>
                       <td><%=rs1.getString("pet_name")%></td>
                       <td><%=rs1.getString("respondent_name")%></td>
 <td><%=rs1.getString("c_date")%></td>
 <td><%=rs1.getString("pet_arg")%></td>
 <td><%=rs1.getString("res_arg")%></td>
 <td><%=rs1.getString("cou_remark")%></td>
 
                       
                         <td><a href="AddCounsellingDetails.jsp?did=<%=CID%>">DELETE DETAILS</a></td>
   <td><a href="AddCounsellingDetails.jsp?eid=<%=CID%>">UPDATE DETAILS</a></td></tr>
   

               

              
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
