<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
      <%
          String stId=request.getParameter("stID");
      %>
     
                    <%
                        String sell="select *from tbl_judge where court_id='"+stId+"'";
                         ResultSet rss=obj.selectData(sell);
                        while(rss.next())
                        {
                    %>
                    <option value="<%=rss.getString("jud_id")%>"> 
                            
                    
                      <%=rss.getString("jud_name")%>      
                           
                    </option>
                    <%
                       }
                    %>
               
 
