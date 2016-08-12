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
		      	keyseach.action="showUserAll";
            }
            else {
                alert("内容是：" + keyseach.keyWord.value);
            }
        }
    </script>
	</script>
</head>

<body background="1.jpg">

		 <div class="search-area-wrapper" style="margin-left:890px;margin-top:20px;">
			<div class="search-area container">
			<s:fielderror/>
				<form  name="keyseach"  id="search-form" class="search-form clearfix" method="get"
					action="searchUser" autocomplete="off" onsubmit="check()">
					<input class="search-term required" type="text" id="s" cols="20"
						name="keyWord" placeholder="在这里输入搜索的内容" title="* 在这里输入搜索的内容!" /> 
						<input class="search-btn" type="submit" value="搜索" "/>
					<div id="search-error-container"></div>
				</form>
			</div>
		</div>
	<center>
		
		<!-- End of 搜索  Wrapper -->
		<table border="1" width="90%" style="text-align:center;" >
			<tr>
				<th colspan="8"><center>用户信息</center>
					</h1>
				</th>
			</tr>
			<tr>
				<td>用户姓名</td>
				<td>用户密码</td>
				<td>用户邮箱</td>
				<td>用户专业</td>
				<td>个性签名</td>
				<td>用户头像</td>
				<td colspan="1">操&nbsp;&nbsp;&nbsp;&nbsp;作</td>
			</tr>
			<s:iterator value="userList" status="st">
				<tr <s:if test="#st.odd"> style="background-color:pink"</s:if>>
					<td><s:property value="username" /></td>
					<td><s:property value="password" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="profession" /></td>
					<td><s:property value="signature" /></td>
					<td><img src="<s:property value="picture"/>" width="60"
						height="80" />
					 
					<td><a
						href='<s:url action="delUserInfo"><s:param name="username" value="username"></s:param></s:url>'>删除</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		共 <s:property value="lastpage" /> 页, 
		第 <s:property value="p" /> 页 
			<a href=' <s:url action="showUserAll" namespace="/">
           		<s:param name="p" value="1"></s:param> </s:url> '>
				首页 
			</a> 
			<a href='<s:url action="showUserAll" namespace="/">
            	<s:param name="p" value="%{p-1}"></s:param> </s:url> '>
			上一页
			</a> 
		 <a href=' <s:url action="showUserAll" namespace="/"> 
			<s:param name="p" value="%{p+1}"></s:param> </s:url> '>
		          下一页 
		 </a> 
		  <a href='<s:url action="showUserAll" namespace="/"> <s:param name="p" value="lastpage"></s:param> </s:url> '>
			尾页 
		  </a>
		  
		<!--这里用来显示分页显示  结束的位置-->
	</center>
</body>
</html>
