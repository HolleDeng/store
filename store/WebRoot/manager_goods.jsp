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

<title>My JSP 'manager_login_success.jsp' starting page</title>

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

h2{
	color: green;
	margin:10px;
	font-family: Microsoft Yahei;
	line-height: 2em;
	font-weight: bold;
	font-size: 28px;
	font-style: oblique;
}

.left{
	font-size:18px;
	position:absolute;
	top:280px;
	left:20px;
	width:200px;
}

.right{
	position:absolute;
	top:20px;
	right:25px;
}

</style>
</head>

<body>
	<font color="red"><marquee direction="left">${sessionScope.loginmsg}</marquee></font>
	<br/>
	<h2>本店商品的信息</h2>
	<br /> 
	<font color="red">您的店中共有${sessionScope.count}种商品,商品的总量为${sessionScope.amount}。</font>
	<br /><br /><br />
	<div class="left">
	<a href="manager_set_security.jsp">设置密保？</a>
	<br /><br/>
	<a href="manager_buycar">查看购物车</a>
	<br/><br/>
	<a href="manager_insert_goods.jsp">给本店添加商品</a>
	<br /><br/>
	<a href="manager_all_goods">进入电子商城系统</a>
	<br /><br/>
	
	<a href="manager_select_goods.jsp">查询本店商品信息</a>
	<br /><br/>
	<a href="manager_page_goods.jsp">分页显示本店商品信息</a>
	<br /><br/>
	<a href="manager_all_evaluate">显示本店所有商品的评价信息</a>
	<br /><br/>
	
	
	</div>
	<table border="1" width="60%">
		<tr>
			<th>商品编号</th>
			<th>商品名字</th>
			<th>商品价格</th>
			<th>商品库存数量</th>
			<th>发布日期</th>
			<th>商品封面</th>
			<th>保存路径</th>
			<th>内容简介</th>
			<th>商品销售数量</th>
			<th colspan="2">操作</th>
		</tr>
		<s:iterator value="list" status="index">
			<tr>
				<th><s:property value="number"></s:property></th>
				<th><s:property value="name"></s:property></th>
				<th><s:property value="price"></s:property></th>
				<th><s:property value="amount"></s:property></th>
				<th><s:date name="publishDate" format="yyyy/MM/dd"></s:date></th>
				<td align="center"><img src='<s:property value="savePath"/>' width="200" height="100"/></td>
				<th><s:property value="savePath"></s:property></th>
				<th><s:property value="introduction"></s:property></th>
				<th><s:property value="sellAmount"></s:property></th>
				<th><a
					href="<s:url action="update"><s:param name="number" value="number"></s:param> </s:url>">修改</a>
				</th>
				<th><a
					href="<s:url action="manager_delete_goods_action"><s:param name="number" value="number"></s:param> </s:url>">删除</a>
				</th>
			</tr>
		</s:iterator>
	</table>
	<br/>
	<div class="right">
	<a href="logout_action">注销</a><br/><br/>
	<%
		String userid = (String)session.getAttribute("userid");
		String password = (String)session.getAttribute("password");
		String savetime = (String)session.getAttribute("cookiesavetime");
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
