<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="user.User"%>
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

<title>My JSP 'css.jsp' starting page</title>

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
	margin: 0;
	padding: 0;
	color: blue;
	text-align: center;
	text-decoration: none;
	background-image: url("image/2.jpg");
	background-repeat: no-repeat;
}

a {
	text-decoration: none;
}

a:link {
	color: bule;
}

a:visited {
	color: black;
}

a:hover {
	color: yellow;
}

a:active {
	color: red;
}

.welcome {
	color: red;
	margin: 10px;
	font-family: Microsoft Yahei;
	line-height: 2em;
	font-weight: bold;
	font-size: 33px;
	font-style: oblique;
}

.loginPage {
	margin: 0 auto;
	font-size: 20px;
	color: black;
	line-height: 2em;
}

.language {
	position: absolute;
	left: 720px;
	top: 100px;
	font-size: 15px;
	color: 00FF33;
}

.href {
	font-size: 18px;
}
</style>
<script language="JavaScript">
	function doLogin() {
		var role = document.getElementById("user.role").value;
		var loginForm = document.getElementById("loginForm").value;
		if (role == "普通消费用户") {
			document.loginForm.action = "normal_login";
			document.loginForm.sumbit();
		}
		document.loginForm.action = "manager_login";
		return true;
	}
</script>
</head>

<body>
	<%
		Cookie cc[] = request.getCookies();
		if (cc != null) {
			for (int x = 0; x < cc.length; x++) {
				if (cc[x].getName().equals("userid")) {
					//在cookie值保存时如果编码了，取cookie时就需要进行解码。
					//将cookie值取出来后，赋值给变量，用以之后的显示
					session.setAttribute("userid", cc[x].getValue());
				} else if (cc[x].getName().equals("password")) {
					//将cookie值取出来后，赋值给request，用以之后的显示
					session.setAttribute("password", cc[x].getValue());
				}
			}
		}
	%>
	<div class="welcome">
		<s:text name="Welcome to the electronic mall system"></s:text>
	</div>
	<div>
		<div class="loginPage">
			<s:text name="loginPage"></s:text>
			<div class="language">
				(
				<s:text name="Select Language:"></s:text>
				<a href="loginPre?request_locale=zh_CN"><s:text name="Chinese"></s:text>
				</a> <a href="loginPre?request_locale=en_US"><s:text name="English"></s:text>
				</a> )
			</div>
		</div>
	</div>

	<div class="form">
		<s:form action="manager_login" name="loginForm" method="post"
			onSubmit="doLogin()">
			<s:textfield name="user.userid" key="userid"
				value="%{#session.userid}" />
			<s:password name="user.password" key="password"
				value="%{#session.password}" showPassword="true" />
			<s:select list="#{'开店用户':'开店用户','普通消费用户':'普通消费用户'}" name="user.role"
				key="role" />
			<s:select list="#{'0':'不保存','60':'一分钟','3600':'一小时','86400':'一天'}"
				name="savetime" key="remember the password" />
			<s:textfield name="code" key="please enter the verification code"
				maxlength="8" size="8" />
			<s:submit key="login" />
			<s:reset key="reset" />
		</s:form>
		<s:text name="Verification code as shown in figure:"></s:text>
		<img src="image.jsp" />
		<s:text name="invisibility"></s:text>
		？<a href="javascript:window.location.reload()"><s:text
				name="Click here to refresh"></s:text> </a><br /> <br />
		<div class="href">
			<a href="javascript:window.location.href='register.jsp'"><s:text
					name="register"></s:text> </a> &nbsp;&nbsp; &nbsp; <a
				href="javascript:window.location.href='find_password.jsp'"><s:text
					name="Forget the password?"></s:text> </a>&nbsp;&nbsp; <a
				href="all_goods"><s:text name="Browse the electronic mall"></s:text>
			</a><br />
			<br /> <a
				href="down?inputPath=/download/电子商城系统使用方法.txt&contentType=text/plain&downFileName=电子商城系统使用方法.txt"><s:text
					name="Electronic mall system using the method"></s:text> </a><br>
		</div>
	</div>
	
</body>
</html>
