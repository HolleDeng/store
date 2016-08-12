<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addForumType.jsp' starting page</title>
    
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
  <br>
  <h1>添加论坛类别</h1><br>
  <s:fielderror></s:fielderror>
    <s:form action="addForumType" method="post">
     <s:textfield name="forumType.forumType_id" key="forumType_id"></s:textfield>
     <s:textfield name="forumType.forumname" key="forumname"></s:textfield>
     <s:textfield name="forumType.manager" key="manager"></s:textfield>     
     <center><s:submit value="添加"></s:submit></center>
    </s:form>
    
    </center>
  </body>
</html>
