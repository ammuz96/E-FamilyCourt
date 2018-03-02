<%-- 
    Document   : AddCounsellingMatters
    Created on : 10 Feb, 2018, 10:33:29 PM
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
        
        <h1><font color="blue"><center>Counselling Date and Time</center></font></h1>
        
        
        
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
//
//            if (request.getParameter("did") != null) {
//                String del = "delete from tbl_counselling where couns_id='" + request.getParameter("did") + "'";
//                boolean b = obj.ExecuteCommand(del);
//                if (b==true)
//                {
//                    response.sendRedirect("AddCounsellingMatters.jsp");
//                } else {
//                    out.print(del);
//                }
//
//            }
//
            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 Date=request.getParameter("name");
                 Time=request.getParameter("dname");
                 
                       
                            

                        String insQry="insert into tbl_counselling(couns_date,couns_time,cou_id,adv_id,pet_id)values('"+Date+"','"+Time+"','"+session.getAttribute("couid")+"','"+session.getAttribute("advi")+"','"+session.getAttribute("peti")+"')";
                        out.println(insQry);
                       boolean b= obj.ExecuteCommand(insQry);
                       
                       
                   
                
            

            }     
            
            
        %>
        
        
       
        
        
        <form name="frm_dis">
              
            <table class="table table-hover" align="center">
                <tr>
                    <td>Date:
                    <td>
                        <input type="Date" name="name">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Time:
                    <td>
                        <input type="time" name="dname">
                        
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
                <th>Date</th>
           <th>Time</th>
           <th>Petitioner Name</th>
           <th>Respondent Name</th>
    
                      

            </tr>
    
        <%
            
           String CID="";
           int i=1;
            String selQry="select * from tbl_counselling c inner join tbl_petitioner p inner join tbl_petition a inner join tbl_councillor r on p.pet_id=c.pet_id and p.pet_id=a.pet_id and r.cou_id=c.cou_id where c.cou_id='"+session.getAttribute("couid")+"'";
            ResultSet rs1=obj.selectData(selQry);
            while(rs1.next())
            {
               CID=rs1.getString("couns_id");
                
        %>
             <tr>
                   <td><%=i%></td>
                   <td><%=rs1.getString("couns_date")%></td>
                   <td><%=rs1.getString("couns_time")%></td>
                    <td><%=rs1.getString("pet_name")%></td>

                   <td><%=rs1.getString("respondent_name")%></td>

              
         
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
