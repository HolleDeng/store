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

<title>My JSP 'security.jsp' starting page</title>

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
	background-repeat: no-repeat;
	background-image:url("image/20.jpg");
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
	font-size: 26px;
	font-style: oblique;
}

.right{
	position:absolute;
	top:30px;
	right:80px;
}

</style>
<script language="JavaScript">
		function validate(){
			var tel=document.getElementById("tel").value;
			if(tel == ""){
				alert("不能什么都不输入！");
				return false;
			}
			//alert("输入的最后一个是" + tel.charAt(tel.length - 1));
			if(tel.charAt(tel.length - 1) == "-") {
				alert("输入错误！输入的最后一个不能是-！");
				return false;
			}
			var n=(tel.split('-')).length-1;
			//alert("输入的-的个数为：" + n);
			if(n != 1){
				alert("输入错误！输入的-的个数只能是一个！");
				return false;
			}
			return true;
		}
</script>
</head>

<body>
	<h3>设置密保(手机的区号和号码之间必须用'-'来隔开)</h3>
	<s:form action="manager_set_security" method="post"
		onSubmit="return validate()">
		<s:textfield name="tel" label="请输入您的密保手机号"></s:textfield>
		<s:submit value="提交"></s:submit>
		<s:reset value="重置" />
	</s:form>
	<a href="manager_goods_action">返回本店</a>
		<br />
		<div class="right">
	<a href="logout_action">注销</a>
	</div>
</body>
</html>
