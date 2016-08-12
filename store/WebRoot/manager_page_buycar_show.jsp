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
    
    <title>My JSP 'buycar_page.jsp' starting page</title>
    
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
	color: red;
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
	top:200px;
	left:45px;
}

.right{
	position:absolute;
	top:10px;
	right:50px;
}

</style>
  </head>
  
  <body>
 <center>
 		<h1>购物车</h1>
 		<font color="red">${sessionScope.buycarpricesum}</font><br/><br/>
 		<div class="left">
 		<a href="manager_buycar">返回购物车页面</a>
	<br/>
	<a href="manager_all_goods">返回电子商城系统</a>
    <br/>
    <a href="manager_goods_action">返回本店</a>
    <br />
    </div>
 	<table border="1" width="60%">
		<tr>
			<th>商品封面</th>
			<th>购买数量</th>
			<th>操作</th>
		</tr>
		<!-- 迭代输出ValueStack中的books对象，其中status是迭代的序号 -->
		<s:iterator value="list" status="index">
			<tr>
				<td align="center"><a href="<s:url action="manager_find_action">
					<s:param name="number" value="number"></s:param> 
			     </s:url>">
				 	<img src='<s:property value="savePath"/>' width="200" height="100" border="0"/>
		</a>
				</td>
				<th><s:property value="buyAmount"></s:property>
				</th>
				<th><a href="<s:url action="manager_delete_buycar"><s:param name="number" value="number"></s:param> </s:url>">移出购物车</a>
				</th>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="3" align="center">共<s:property value="lastpage" />页,第<s:property value="p" />页
				<a
				href='
         <s:url action="manager_page_buycar">
            <s:param name="p" value="1"></s:param>
             <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>首页</a>
				<a
				href='
         <s:url action="manager_page_buycar">
            <s:param name="p" value="%{p-1}"></s:param>
             <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>上一页</a>
				<a
				href='
         <s:url action="manager_page_buycar">
            <s:param name="p" value="%{p+1}"></s:param>
             <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>下一页</a>
				<a
				href='
         <s:url action="manager_page_buycar">
            <s:param name="p" value="lastpage"></s:param>
             <s:param name="pageSize" value="pageSize"></s:param>
         </s:url>
         '>尾页</a>
			</td>
		</tr>
	</table>
	
	<br/>
	<div class="right">
	<a href="logout_action">注销</a>
	</div>
	</center>
  </body>
</html>
