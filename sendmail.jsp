<%-- 
    Document   : sendmail
    Created on : 1 Mar, 2017, 2:55:27 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="mydb.mailconnection" id="obj1"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String to[]={"anjalyks9681@gmail.com"};
               String subject="HIII";
               String text="hello";
               try{
                                     System.out.println("try to mail");
                                    boolean b=obj1.sendMail(to, subject, text);
                                    if(b)
                                    {
                                        out.print("Succesfull");
                                    }
                                    else
                                    {
                                        out.print("unsuccess");
                                    }
                                }
                                catch(Exception e){
                                        System.out.println("Exxx "+e);
                                }
               
       %>
    </body>
</html>
