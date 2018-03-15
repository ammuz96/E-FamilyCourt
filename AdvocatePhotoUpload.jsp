<%-- 
    Document   : AdvocatePhotoUpload
    Created on : 20 Feb, 2018, 11:18:01 PM
    Author     : acer
--%>




<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FamilyCourt::upload</title>
    </head>
    <body>
        <%
            
            String field_name="";
        FileItem f_item=null;
String file_name="";

File savedFile=null;
String fn="",pf="",fnn="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        System.out.println("ifff 1");
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          System.out.println("ifff 2");
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                System.out.println(k+" "+value[k]);
                k++;
        }
       else
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txt_pho"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Advocate\\Photo\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
            
            fn="Photo_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
          if(field_name.equals("txt_proof"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Advocate\\Proof\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
            
            fnn="AdvocateProof_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fnn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
          
           
       }
           
           }
    //Strinh str1="insert into tbl_use
    
   // if(value[12].equals(value[13]))
   // {
    String logid="";
    String insQry1="insert into tbl_login(username,password,type)values('"+value[12]+"','"+value[13]+"','Advocate')";
    out.println(insQry1);
                       boolean b2=obj.ExecuteCommand(insQry1);
                         if(b2)
                         {
                        String sel="select max(login_id) as login from tbl_login"; 
                        out.println(sel);ResultSet rs4=obj.selectData(sel);
                         if(rs4.next())
                         {
                             logid=rs4.getString("login");
                         }
  String str1="insert into tbl_advocate(adv_name,adv_adrs,dist_id,adv_email,adv_cno,adv_photo,adv_proof,adv_fee,adv_age,adv_exp,adv_qua,court_id,case_id,login_id,adv_status)values('"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+fn+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','"+fnn+"','"+logid+"',2)";
   System.out.println(str1);
   out.println(str1);
   
    boolean status=obj.ExecuteCommand(str1);
    
    if(status==true)
    {
      %> 
       <script type="text/javascript">
            alert("Registered Successfully..");
            setTimeout(function(){window.location.href='AdvocateRegistration.jsp'},100);
        </script>
     <%
    }
    }
}
//    else
//    {
//        %>
<!--//        <script>-->
<!--//            alert("Check the password entered");-->
<!--//        </script>-->
//        <%
//    }
    // }   


      

        %>
      
             
    </body>
</html>
