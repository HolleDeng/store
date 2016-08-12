<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editForumType.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
   <body>
  <center>
  <BR>
  <h1>修改论坛类型</h1>
  <br><br>
    <form action="editForumType" method="post" namespace="/">
    	<input type="hidden" name="forumType.forumType_id"  value="${forumType_id}"/>
		<table border="1" style="text-align:center;" cellspacing="0"
			cellpadding="0" >
		<tr><td> 修改论坛的编号<s:property value="forumType.forumType_id"/></td></td>
    	<tr><td>论坛的名字: <input type="text" name="forumType.forumname" value="${forumType.forumname}"><br></td></td>
    	<tr><td>论坛的管理者: <input type="text" name="forumType.manager" value="${forumType.manager}"><br></td></td>
     	<tr><td><input type="submit" value="修改"></td></td>
     </table>
	</form>
</center>
  </body>
</html>
