<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>It编程技术学习交流系统的管理后台登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/main.js" type="text/javascript">
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no">

<form action="Adminlogin" method="post">
<s:fielderror />
 <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="100%" align="center" bgcolor="#e3efff">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="images/loginBg.png">
      <tr>
        <td>
           <table border="0" align="center" cellpadding="0" cellspacing="7">
          <tr>
            <td>用户名：</td>
            <td>
               <input name="admin.adminName" type="text" class="inputbox" style="width:160px;hight:20px"></td>
            </tr>
          <tr>
            <td>密　码：</td>
            <td>
               <input name="admin.password" type="text" class="inputbox" style="width:160px;hight:20px"></td>
            </tr>
          <tr>
            <td height="100" colspan="2" valign="top">
               <table border="0" align="center" cellpadding="0" cellspacing="5">
              <tr>
                <td align="center">
                <BUTTON style="HEIGHT:25px" onClick="javascript:location.href='Adminlogin'">
                   <img src="images/login_enter.gif" width="16" height="16" align="absmiddle"> 登录</BUTTON></td>
                <td align="center">
                <BUTTON style="HEIGHT:25px">
                    <img src="images/login_cancel.gif" width="16" height="16" align="absmiddle"> 重置</BUTTON></td>
                </tr>
            </table></td>
            </tr>
          </table></td>
        </tr>
    </table>
   </td>
  </tr>
</table>
</form>
</body>
</html>