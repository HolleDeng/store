<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE s:if PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
共<s:property value="lastpage" />页, 第<s:property value="p" />页
<a
	href=' <s:url action="userSelect" namespace="/">
            								<s:param name="p" value="1"></s:param> </s:url> '>
	首页 </a>
<a
	href='<s:url action="userSelect" namespace="/">
            								<s:param name="p" value="%{p-1}"></s:param> </s:url> '>
	上一页 </a>
<a
	href=' <s:url action="userSelect" namespace="/"> 
										   <s:param name="p" value="%{p+1}"></s:param> </s:url> '>
	下一页 </a>
<a
	href='<s:url action="userSelect" namespace="/">
            								<s:param name="p" value="lastpage"></s:param> </s:url> '>
	尾页 </a>
<!--这里用来显示分页显示  结束的位置-->
</html>