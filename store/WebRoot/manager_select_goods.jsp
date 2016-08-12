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
    
    <title>My JSP 'manager_select.jsp' starting page</title>
    
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
  </head>
  
  <body>
    <h3>查询本店中的商品</h3>
	<s:form action="manager_select_goods_action" method="post">
		<s:textfield name="select" label="请输入要搜索的商品名称" />
		<s:submit value="查询" />
		<s:reset value="重置" />
	</s:form>
    <a href="manager_goods_action">返回本店</a>
    <br />
    <div class="right">
	<a href="logout_action">注销</a>
	</div>
  </body>
</html>
