<%-- 
    Document   : JudProofDownload
    Created on : 20 Mar, 2018, 11:12:43 PM
    Author     : acer
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
     

<%
String file=request.getParameter("filename");
 File proj_path=new File(config.getServletContext().getRealPath("/"));
 String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Petitioner\\Petition\\"+file;
 File fdownload=new File(file_path);
 if(file.endsWith(".txt"))
 response.setContentType("applocation/txt");
 else if(file.endsWith(".pdf"))
     response.setContentType("applocation/pdf");
 response.setContentLength((int)fdownload.length());
 response.setHeader("Content-Disposition", "attachement;filename="+file);
 InputStream in=new FileInputStream(fdownload);
 ServletOutputStream outs=response.getOutputStream();
 int bit=256;
 byte[] b=new byte[in.available()];
 int i=0;
 while((i=in.read(b))!=-1)
     {
     outs.write(b);
     }
/* try{
     do{
         i=in.read();
         outs.write(i);
         }while(i!=0);
     }catch(IOException e){

         }*/
 outs.flush();
 outs.close();
in.close();

%>
