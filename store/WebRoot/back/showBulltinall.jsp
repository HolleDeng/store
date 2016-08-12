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
					action="searchBulltin" autocomplete="off" onsubmit="check()">
					<input class="search-term required" type="text" id="s" cols="20"
						name="keyWord" placeholder="在这里输入搜索的内容" title="* 在这里输入搜索的内容!" /> 
						<input class="search-btn" type="submit" value="搜索" "/>
					<div id="search-error-container"></div>
				</form>
			</div>
		</div>
		
	<center>
		
		
		<!-- End of 搜索  Wrapper -->
		<table border="1" style="text-align:center;" cellspacing="0" cellpadding="0" width=""> 
			<tr>
				<th colspan="8" ><center>帖子信息</center>
					</h1>
				</th>
			</tr>
			<tr>
				<td ><nobr>帖子的编号 </nobr></td>
				<td width="50px"><nobr>帖子的标题   </nobr> </td>
				<td ><nobr>帖子的内容 </nobr></td>
				<td><nobr>帖子的作者 </nobr></td>
				<td><nobr>帖子提交的时间  </nobr></td>
				<td><nobr>帖子所属的论坛 </nobr></td>
				<td><nobr>帖子的状态 </nobr></td>
				<td colspan="2">操&nbsp;&nbsp;&nbsp;&nbsp;作</td>
			</tr>
			<s:iterator value="bulletinList" status="st">
				<tr <s:if test="#st.odd"> style="background-color:pink"</s:if>>
					<td><s:property value="bulletin_id" /></td>
					<td><s:property value="title" /></td>
					<td width="500px"><s:property value="content" /></td>
					<td><s:property value="author" /></td>
					<td><s:property value="submittime" /></td>
					<td><s:property value="forumType_id" /></td>
					<td><s:property value="permitstate" /></td>
					<td><a
						href='<s:url action="delBulltin"><s:param name="bulletinid" value="bulletin_id"></s:param></s:url>'>删除</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		共 <s:property value="lastpage" /> 页, 
		第 <s:property value="p" /> 页 
			<a href=' <s:url action="showBulltinAll" namespace="/">
           		<s:param name="p" value="1"></s:param> </s:url> '>
				首页 
			</a> 
			<a href='<s:url action="showBulltinAll" namespace="/">
            	<s:param name="p" value="%{p-1}"></s:param> </s:url> '>
			上一页
			</a> 
		 <a href=' <s:url action="showBulltinAll" namespace="/"> 
			<s:param name="p" value="%{p+1}"></s:param> </s:url> '>
		          下一页 
		 </a> 
		  <a href='<s:url action="showBulltinAll" namespace="/"> <s:param name="p" value="lastpage"></s:param> </s:url> '>
			尾页 
		  </a>
		  
		<!--这里用来显示分页显示  结束的位置-->
	</center>
</body>
</html>
