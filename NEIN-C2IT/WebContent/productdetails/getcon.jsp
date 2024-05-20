<%@ page import="java.sql.*" %>
<%@page import = "java.io.*" %>
<%@ page import = "java.util.ResourceBundle" %>
<%!Statement st=null,st1=null;
Connection cn=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
%>
<%

Class.forName(driver).newInstance();
cn= DriverManager.getConnection(url+dbName,userName,password);

st=cn.createStatement();
%>