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
    
    <title>My JSP 'find_password.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 
	<link rel="stylesheet" type="text/css" href="css/login.css">
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
	
<script language="JavaScript">
		function validate(){
			var userid = document.getElementById("userid").value;
			var security = document.getElementById("security").value;
			if(userid == ""){
				alert("用户ID是必填项！");
				return false;
			}
			if(security == "") {
				alert("密保手机号是必填项！");
				return false;
			}
			return true;
		}
</script>
  </head>
  
  <body>
  <center>
	<h1>找回密码</h1>
	<s:form action="find_password"  method="post" onSubmit="validate()">
		<s:textfield name="userid" label="请输入您的用户ID" />
		<s:textfield name="security" label="请输入您的密保手机号" />
		<s:submit value="提交" />
		<s:reset value="重置" />
	</s:form>
	<a href = "login.jsp">返回登录页面</a>
	</center>
  </body>
</html>
