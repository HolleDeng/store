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

<title>My JSP 'normal_login_success.jsp' starting page</title>

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
	margin: 0;
	padding: 0;
	color: blue;
	text-align:center; 
	text-decoration: none;
	background-color: CCFFFF;
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
	color: green;
	margin:10px;
	font-family: Microsoft Yahei;
	line-height: 2em;
	font-weight: bold;
	font-size: 33px;
	font-style: oblique;
}

.left{
	font-size:18px;
	position:absolute;
	top:270px;
	left:45px;
}

.right{
	position:absolute;
	top:30px;
	right:10px;
}

</style>
</head>

<body>
	<font color="red"><marquee direction="left">${sessionScope.loginmsg}</marquee></font>
	<br/>
	<h1>欢迎来到电子商城系统</h1>
	<br /> <font color="red">本商城中共有${sessionScope.count}种商品,商品的总量为${sessionScope.amount}。</font>
	<br />
	<div class="left">
	<a href="normal_set_security.jsp">设置密保？</a><br />
	<br />
	<a href="normal_select_allgoods.jsp">查询商品信息</a><br />
	<br />
	<a href="normal_page_allgoods.jsp">分页显示商品信息</a><br />
	<br />
	<a href="normal_buycar">查看购物车</a><br />
	</div>
	<br />
	<table border="1" cellspacing="10px">
    <s:iterator value="list" status="st">
    	<s:if test="#st.index % 3 == 0">
		<tr>
		</s:if>
		<td>
		<a href="<s:url action="normal_find_action">
					<s:param name="number" value="number"></s:param> 
			     </s:url>">
				 	<img src='<s:property value="savePath"/>' width="200" height="100" border="0"/>
		</a>
		<br/><s:property value="name"></s:property>
		<br/><s:property value="introduction"></s:property>
		<br/>店主ID：<s:property value="userid"></s:property>
		<br/>
		</td>
		<s:if test="#st.index % 4 == 3 || #st.last">
		</s:if>
	</s:iterator>
	</table>
	<br />
	
	<div class="right">
	<a href="logout_action">注销</a><br/>
	<%
		String userid = (String) session.getAttribute("userid");
		String password = (String) session.getAttribute("password");
		String savetime = (String) session.getAttribute("cookiesavetime");
		Cookie id = new Cookie("userid", userid);
		Cookie pass = new Cookie("password", password);
		out.println("用户名和密码保存的时间均为" + savetime + "秒");
		id.setMaxAge(Integer.parseInt(savetime));
		pass.setMaxAge(Integer.parseInt(savetime));
		response.addCookie(id);
		response.addCookie(pass);
	%>
	<br /> ${sessionScope.lastdate}
	</div>
</body>
</html>
