<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'manager_register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	margin: 100px;
	padding: 0;
	color: blue;
	text-align:center; 
	text-decoration: none;
	background-image:url("image/20.jpg");
	background-repeat: no-repeat;
}

a{
text-decoration:none;
}

a:link{
	color:bule;
}

a:visited {
	color:black;
} 

a:hover {
	color:yellow;
}

a:active{
	color:red;
}

h1{
	color: red;
	margin:10px;
	font-family: Microsoft Yahei;
	line-height: 2em;
	font-weight: bold;
	font-size: 33px;
	font-style: oblique;
}

</style>
</head>

<body>

	<h1><font color="red">开店用户注册</font></h1>
	<s:form action="manager_register" method="post">
		<s:textfield name="user.userid" label="用户ID" />
		<s:textfield name="user.username" label="用户姓名" />
		<!-- showPassword=true 表示校验不通过后，输入的密码不会丢失 -->
		<s:password name="user.password" label="用户密码" showPassword="true"/>
		<s:password name="user.rePassword" label="再输一次密码" showPassword="true"/>
		<s:submit value="注册" />
		<s:reset value="重置" />
	</s:form>

</body>
</html>
