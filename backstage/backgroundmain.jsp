<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>backgroundmain</title>
<link type="text/css" rel="stylesheet" href="style/backstagemain.css" />
<script type="text/javascript" src="js/common.js"></script>
</head>

<body>
<h1>欢迎登录Delta后台管理系统</h1>
</body>
</html>
