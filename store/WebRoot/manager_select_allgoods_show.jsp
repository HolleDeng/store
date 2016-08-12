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
    
    <title>My JSP 'manager_select_allgoods_show.jsp' starting page</title>
    
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
	font-size: 23px;
	font-style: oblique;
}

.left{
	font-size:18px;
	position:absolute;
	top:250px;
	left:45px;
}

.right{
	position:absolute;
	top:25px;
	right:50px;
}

</style>
  </head>
  
  <body>
  <br/><br/><br/>
    	<h1>本商城中共有${sessionScope.count}种商品,商品的总量为${sessionScope.amount}。</h1>
    	<br/>
    	<table border="1" cellspacing="10px">
    <s:iterator value="list" status="st">
    	<s:if test="#st.index % 3 == 0">
		<tr>
		</s:if>
		<td>
		<a href="<s:url action="manager_find_action">
					<s:param name="number" value="number"></s:param> 
			     </s:url>">
				 	<img src='<s:property value="savePath"/>' width="260" height="150" border="0" />
		</a>
		<br/><s:property value="name"></s:property>
		<br/><s:property value="introduction"></s:property>
		<br/>店主ID：<s:property value="userid"></s:property>
		</td>
		<s:if test="#st.index % 4 == 3 || #st.last">
		</s:if>
	</s:iterator>
	</table>
	<br /><br/>
	<a href="manager_all_goods">返回电子商城系统</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="manager_goods_action">返回本店</a>
    <br /><br /><br/>
    <div class="right">
	<a href="logout_action">注销</a>
	</div>
  </body>
</html>
