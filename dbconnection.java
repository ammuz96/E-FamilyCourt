/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mydb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Computer
 */
public class dbconnection {
       
          Connection cn=null;
ResultSet rs=null;
Statement st=null;
public dbconnection()
{
try
{
Class.forName("com.mysql.jdbc.Driver");
cn=DriverManager.getConnection("jdbc:mysql://localhost/db_familycourt","root","root");
}
catch(Exception ex)
{
    System.out.println(ex);
}
}
public boolean  ExecuteCommand(String str)
{
    System.out.println(str);
    boolean b = false;
try
{
 st=cn.createStatement();
st.executeUpdate(str);
b = true;
}
catch(Exception e)
{

}
    return b;
}
public ResultSet selectData(String selQry)
{ System.out.println(selQry);
try
{
 st=cn.createStatement();
 rs=st.executeQuery(selQry);
}
catch (Exception e)
{
}
return rs;
}


    
}
