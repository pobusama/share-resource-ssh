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
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教学档案</title>
<link type="text/css" rel="stylesheet" href="style/teaching_archives.css" />
<script type="text/javascript" src="js/common.js"></script>
<script>

</script>
</head>

<body>
<header><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="nav">
	<a href="../index.html">平台主页</a>
    <a href="#">课程简介</a>
    <a href="#">师资队伍</a>
    <a href="#">教学评价</a>
    <a href="#">教学单元</a>
    <a href="#">实践项目</a>
    <a href="#">作业提交</a>
   <a href="#">在线互动</a>
</nav>

 <footer>
	<div class="footer_link">
    	<a href="javascript:void(0);">加入收藏</a><a href="javascript:void(0);">进入后台</a>
    </div>
	<p>
    	Copyright© 2011 江西理工大学.All Rights Reserved.<br />
  		学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
  		制作维护：  江西理工大学信息学院333工作室  Email：517821485@qq.com <br />


    </p>
</footer>
</body>
</html>
