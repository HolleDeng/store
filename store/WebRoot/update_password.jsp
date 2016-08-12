<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_password.jsp' starting page</title>
    
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

h3{
	color: red;
	margin:10px;
	font-family: Microsoft Yahei;
	line-height: 2em;
	font-weight: bold;
	font-size: 33px;
	font-style: oblique;
}
.right{
	position:absolute;
	top:30px;
	right:100px;
}

</style>
  </head>
  
  <body>
   <h3>修改密码</h3>
	<s:form action="update_password"  method="post">
		<!-- showPassword=true 表示校验不通过后，输入的密码不会丢失 -->
		<s:textfield name="password" label="请输入您的新密码" showPassword="true"/>
		<s:textfield name="rePassword" label="请再输入一次您的新密码" showPassword="true"/>
		<s:submit value="提交" />
		<s:reset value="重置" />
	</s:form>
	<a href = "login.jsp">返回登录页面</a>
  </body>
</html>
