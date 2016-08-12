<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="goods.Goods"%>
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

<title>My JSP 'find_success.jsp' starting page</title>

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
	color: red;
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
	top:180px;
	left:45px;
}

.right{
	position:absolute;
	top:10px;
	right:50px;
}

</style>
	
<script language="JavaScript">
		function validate(){
			var evaluate=document.getElementById("evaluate").value;
			if(evaluate == ""){
				alert("不能什么都不输入！");
				return false;
			}
			return true;
		}
</script>
</head>

<body>
<br/><br/>
	<h2>商品的信息</h2>
<br/>
	<div class="left">
	<br />
	<a href="manager_all_goods">返回电子商城系统</a>
    <br/>
    <a href="manager_goods_action">返回本店</a>
    <br />
    <a href="manager_buycar">查看购物车</a>
</div>
	<table border="1" width="60%">
		<tr>
			<th>商品编号</th>
			<th>商品名字</th>
			<th>管理员ID</th>
			<th>商品价格</th>
			<th>商品库存数量</th>
			<th>发布日期</th>
			<th>商品封面</th>
			<th>保存路径</th>
			<th>内容简介</th>
			<th>商品销售数量</th>
			<th>操作</th>
		</tr>
		<tr>
			<th><s:property value="goods.number"></s:property>
			</th>
			<th><s:property value="goods.name"></s:property>
			</th>
			<th><s:property value="goods.userid"></s:property></th>
			<th><s:property value="goods.price"></s:property>
			</th>
			<th><s:property value="goods.amount"></s:property>
			</th>
			<th><s:property value="goods.publishDate"></s:property>
			</th>
			<td align="center"><img src='<s:property value="goods.savePath"/>' width="200"
				height="100" />
			</td>
			<th><s:property value="goods.savePath"></s:property>
			</th>
			<th><s:property value="goods.introduction"></s:property>
			</th>
			<th><s:property value="goods.sellAmount"></s:property></th>
			<th><a
				href="<s:url action="manager_insert_buycar"><s:param name="number" value="goods.number"></s:param> </s:url>">添加到购物车</a>
			</th>
		</tr>
	</table>
	<br />
	
	<s:iterator value="list" status="index">
		评价者ID：<s:property value="userid"></s:property>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评价内容：<s:property value="evaluate"></s:property><br/>
	</s:iterator>
	
	<s:form action="manager_comment" method="post" onSubmit="return validate()">
		<s:textarea name="evaluate" label="请对该商品及其管理员做出评价" rows="5" cols="35"/>
		<s:submit value="提交"></s:submit>
		<s:reset value="重置" />
	</s:form>
	<div class="right">
	<br/>
	<a href="logout_action">注销</a>
	</div>
</body>
</html>
