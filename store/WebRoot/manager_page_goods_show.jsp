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

<title>My JSP 'manager_book_page.jsp' starting page</title>

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

.right{
	position:absolute;
	top:26px;
	right:50px;
}

</style>
</head>

<body>
	<font color="red"><marquee direction="left">${sessionScope.loginmsg}</marquee>
	</font>
	<h1>分页显示商品的信息</h1>
	<br /> <font color="red">共有${sessionScope.count}种商品,商品的总量为${sessionScope.amount}。</font>
	<br/><br/>
	<table border="1" width="80%">
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
				<th><s:property value="sellAmount"></s:property>
				</th>
				<th><a
					href="<s:url action="update"><s:param name="number" value="number"></s:param> </s:url>">修改</a>
				</th>
				<th><a
					href="<s:url action="manager_delete_goods_action"><s:param name="number" value="number"></s:param> </s:url>">删除</a>
				</th>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="3" align="center">共<s:property value="lastpage" />页,第<s:property
					value="p" />页 <a
				href='
         <s:url action="manager_page_goods_action">
            <s:param name="p" value="1"></s:param>
            <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>首页</a>
				<a
				href='
         <s:url action="manager_page_goods_action">
            <s:param name="p" value="%{p-1}"></s:param>
            <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>上一页</a>
				<a
				href='
         <s:url action="manager_page_goods_action">
            <s:param name="p" value="%{p+1}"></s:param>
            <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>下一页</a>
				<a
				href='
         <s:url action="manager_page_goods_action">
            <s:param name="p" value="lastpage"></s:param>
            <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>尾页</a>
			</td>
		</tr>
	</table>
	<br/>
	<a href="manager_goods_action">返回本店</a><br /><br />
	<div class="right">
	<a href="logout_action">注销</a>
	<br /> ${sessionScope.lastdate}
	
	<br />
	<br />
	</div>
</body>
</html>
