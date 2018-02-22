<%-- 
    Document   : AddBench
    Created on : 13 Feb, 2018, 7:58:30 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::BenchDetails</title>
    </head>
    
   
     <body bgcolor="pink">
        
        <h1><font color="brown"><center>Bench Details</center></font></h1>
         <%
            String name="",nam="";
                      String couid="", couname="";
            String jid="", juname="";
            String editID="";
            String cid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_bench a inner join tbl_court d inner join tbl_judge j  on a.ben_id=d.court_id and a.jud_id=j.jud_id  where cou_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("ben_id");
                    name= rs.getString("ben_name");
                                  
                  couid=rs.getString("court_id");
                  jid=rs.getString("jud_id");
 
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_bench where ben_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("AddBench.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                        
                       
                        couname=request.getParameter("counam");
                        juname=request.getParameter("junam");
                                  String hh=request.getParameter("hid");
                       
                    if (!hh.equals("")) 
                         {
                    String up = "update tbl_bench set ben_name='"+nam+"',court_name='"+couname+"',jud_name='"+juname+"' where ben_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                        
                  
                } else {

                        
                        
                        String insQry="insert into tbl_bench(ben_name,court_id,jud_id)values('"+nam+"','"+couname+"','"+juname+"')";
                        
            

                       boolean b= obj.ExecuteCommand(insQry);
                       
                      
       if(b ){response.sendRedirect("AddBench.jsp");
                          
                }
            else
            {  out.println(insQry);   
            }
                  
                     
                    }}
 
    %>

                   
                
            

                 
            
            
     
        
        
       <form name="frm_adc">
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Bench Name:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
                    </td>
                    </td>
                </tr>
                
               <tr>
                   <td>Court Name :</td>
                    <td><select name="counam" onchange="filljudge(this.value)">
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
                   <td>Judge Name :</td>
                   <td><select name="junam" id="judg">
                    <option value="sele">--Select--</option>
                    <%
                        String selee="select *from tbl_judge";
                         ResultSet rs2=obj.selectData(selee);
                        while(rs2.next())
                        {
                        String id=rs2.getString("jud_id");   
                    %>
                    <option <% if(jid.equals(id)){%> selected=""<%}%> value="<%=rs2.getString("jud_id")%>"><%=rs2.getString("jud_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
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
                <th>Bench Name</th>
            <th>Court Name</th>
             <th>Judge Name</th>
                     

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_bench a inner join tbl_court d inner join tbl_judge j on a.court_id=d.court_id and a.jud_id=j.jud_id";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("ben_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("ben_name")%></td>
                                    
                                    <td><%=rs3.getString("court_name")%></td>
                     <td><%=rs3.getString("jud_name")%></td>
 
                 <td><a href="AddBench.jsp?did=<%=CID%>">Delete</a></td>
                 
         <td><a href="AddBench.jsp?eid=<%=CID%>">Edit</a></td>
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>

 <script>
function filljudge(stId)
	  {
     	
    
     $.ajax({url: "Ajaxfilljudge.jsp?stID="+stId, success: function(result){
        $("#judg").html(result);
    }});

	  }       
        
      </script>  
        
        
