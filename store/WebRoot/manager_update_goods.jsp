<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 使用sx:datetimepicker标签来显示日期，必须引入 dojo 插件，将struts2-dojo-plugin.jar 加入 -->
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
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

<title>My JSP 'update.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 必须设置 sx:head dojo 标签才能生效-->
<sx:head />
<script language="JavaScript">
		function validate(){
			var obj1=document.getElementById("goods.amount").value;
			var obj2=document.getElementById("goods.price").value;
			if(parseInt(obj1) != obj1) {
				alert("输入的商品数量不是整数！请重新输入！");
				return false;
			}
			if(parseFloat(obj2) != obj2){
				alert("输入的商品价格不是双精度浮点数！请重新输入！");
				return false;
			}
			return true;
		}
</script>
<script language="JavaScript">
		function validate(){
			var obj1=document.getElementById("goods.amount").value;
			var obj2=document.getElementById("goods.price").value;
			if(parseInt(obj1) != obj1) {
				alert("输入的商品数量不是整数！请重新输入！");
				return false;
			}
			if(parseFloat(obj2) != obj2){
				alert("输入的商品价格不是双精度浮点数！请重新输入！");
				return false;
			}
			return true;
		}
</script>
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
.right{
	position:absolute;
	top:30px;
	right:100px;
}

</style>
</head>

<body>
	<center>
		<h1>
			<font color="red">修改商品信息</font>
		</h1>
		<s:form action="manager_update_goods_action" method="post" enctype="multipart/form-data" onSubmit="return validate()">
			<s:hidden name="goods.number" />
			<s:textfield name="goods.name" label="商品名字" />
			<s:textfield name="goods.price" label="商品价格" />
			<s:textfield name="goods.amount" label="商品数量" />
			<sx:datetimepicker name="goods.publishDate" label="发布日期"
				displayFormat="yyyy-MM-dd" />
			<s:file name="upload" label="商品封面" />
			<s:textfield name="goods.introduction" label="内容简介" />
			<s:submit value="修改" />
			<s:reset value="重置" />
		</s:form>
		
		<a href="manager_goods_action">返回本店</a>
		<br />
		
		<div class="right">
	<a href="logout_action">注销</a>
	</div>
	</center>
</body>
</html>
