<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源上传</title>
    <style>
    #nav{height:30px;margin-left:0px;}
    #nav a{display:block;margin-left:5px; text-decoration:none; color:#fff; height:34px;line-height:34px; width:auto; padding:2px 6px; border-radius:3px; text-align:center;background:#2195c9; float:left;  font-size:16px; font-family:"微软雅黑"; }
   
    </style>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <nav id="nav">
	<a href="resourceAction_list" target="mainFrame">习题上传</a>
    <a href="resourceAction_examList"  target="mainFrame">试题上传</a>
    <a href="resourceAction_caseList"  target="mainFrame">案例上传</a>
    <a href="resourceAction_experimentList"  target="mainFrame">实验上传</a>
    <a href="downloadResourceAction_resourceAddUI"  target="mainFrame">课程资源上传</a>
    <a href="courseAction_addList"  target="mainFrame">添加章节</a>
    <a href="courseAction_addChapterList"  target="mainFrame">视频上传(简)</a>
    <a href="courseAction_localAddChapterList"  target="mainFrame">视频上传(繁)</a>
        <a href="backstage/otherUpload.jsp"  target="mainFrame">其他资源上传</a>
        <a href="backstage/uClassUpload.jsp"  target="mainFrame">腾云优课上传</a>
        <a href="knowledgeAction_addUI"  target="mainFrame">微知识上传</a>
    </nav>
    <div>
       <iframe scrolling="no" src="resourceAction_list" name="mainFrame" id="mainFrame" style="height:800px;width:100%;z-index:1000;" frameborder="0" border="0" marginwidth="0" marginheight="0" ></iframe> 
    </div>
  </body>
</html>
