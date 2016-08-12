<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'showUserInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function check() {
		if (keyseach.keyWord.value == "") {
			alert("内容为空");
			keyseach.keyWord.focus();
			keyseach.keyWord.select();
			keyseach.action = "showUserAll";
		} else {
			alert("内容是：" + keyseach.keyWord.value);
		}
	}
</script>
</script>
</head>

<body background="1.jpg">

	<div class="search-area-wrapper"
		style="margin-left:780px;margin-top:20px;">
		<div class="search-area container">
			<s:fielderror />
			<form name="keyseach" id="search-form" class="search-form clearfix"
				method="get" action="searchFrum" autocomplete="off"
				onsubmit="check()">
				<input class="search-term required" type="text" id="s" size="30"
					name="keyWord" placeholder="在这里输入搜索的内容" title="* 在这里输入搜索的关键字!" /> <input
					class="search-btn" type="submit" value="搜索" "/>
				<div id="search-error-container"></div>
			</form>
		</div>
	</div>
	<!-- End of 搜索  Wrapper -->


	<center>
		<table border="1" style="text-align:center;" cellspacing="0"
			cellpadding="0" width="900px">
			<tr>
				<td>论坛编号</td>
				<td>论坛类型</td>
				<td>论坛博主</td>
				<td>操作</td>
			</tr>
			<s:iterator value="forumType1" status="st">
				<tr <s:if test="#st.odd"> style="background-color:red"</s:if>>
					<td><s:property value="forumType_id" />
					</td>
					<td><s:property value="forumname" />
					</td>
					<td><s:property value="manager" />
					</td>
					<td><a
						href='<s:url action="getForumType"><s:param name="forumType_id" value="forumType_id"></s:param></s:url>'>编辑</a>&nbsp;&nbsp;<a
						href='<s:url action="delForumType"><s:param name="forumType_id" value="forumType_id"></s:param></s:url>'>删除</a>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="3" align="center">共<s:property value="lastpage" />页
					<a
					href='<s:url action="showFrumAll"><s:param name="p" value="1"></s:param></s:url>'>首页</a>
					<a
					href='<s:url action="showFrumAll"><s:param name="p" value="%{p-1}"></s:param></s:url>'>上一页</a>
					<a
					href='<s:url action="showFrumAll"><s:param name="p" value="%{p+1}"></s:param></s:url>'>
						下一页</a> <a
					href='<s:url action="showFrumAll"><s:param name="p" value="lastpage"></s:param></s:url>'>尾页</a>


					<td>
    
			</tr>
	<!--这里用来显示分页显示  结束的位置--></c
				enter>
</body>
</html>
