<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源管理</title>
    <style>
    #nav{height:30px;margin-left:50px;}
    #nav a{display:block;margin-left:10px; text-decoration:none; color:#fff; height:34px;line-height:34px; width:auto; padding:2px 6px; border-radius:3px; text-align:center;background:#2195c9; float:left;  font-size:16px; font-family:"微软雅黑"; }
   
    </style>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <nav id="nav">
	<a href="resourceAction_resourceManage?type=1" target="mainFrame">习题管理</a>
    <a href="resourceAction_resourceManage?type=2"  target="mainFrame">试题管理</a>
    <a href="resourceAction_resourceManage?type=3"  target="mainFrame">案例管理</a>
    <a href="resourceAction_resourceManage?type=4"  target="mainFrame">实验管理</a>
    <a href="resourceAction_videoManage"  target="mainFrame">视频管理</a>   
    <a href="downloadResourceAction_downloadManage?grade=1"  target="mainFrame">教学教改管理</a>   
    <a href="downloadResourceAction_downloadManage?grade=2"  target="mainFrame">教学课件管理</a>   
    <a href="downloadResourceAction_downloadManage?grade=3"  target="mainFrame">重点难点管理</a>   
    <a href="toolsAction_otherManage"  target="mainFrame">其他资源管理</a>   
    <a href="knowledgeAction_knowledgeManage"  target="mainFrame">微知识管理</a>   
    </nav>
    <div>
       <iframe  src="resourceAction_resourceManage?type=1" name="mainFrame" id="mainFrame" style="height:800px;width:100%;z-index:1000;" frameborder="0"  marginwidth="0" marginheight="0" scrolling="no"></iframe> 
    </div>
  </body>
</html>
