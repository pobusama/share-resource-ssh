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
    
    <title>其他资源</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	table{margin-top:50px;}
	#title{text-align: center;margin-top:40px;}
	</style>
  </head>
  <div id="title">
  <STRONG>其他资源管理</STRONG>
  </div>
   <table width="100%" border="0" cellpadding="1" cellspacing="1" >
  <tr align="center"  bgcolor="#ccccff">
    <td>ID</td>
    <td>资源名称</td>
    <td>删除</td>
    
  </tr>
  <s:iterator id="gz" value="toolList" status="st">
  <tr align="center"  bgcolor="#ccccff">
  
    <td>${st.index+1}</td>
    <td>${gz.otherName}</td>
    <td><a href="toolsAction_delete?id=${gz.id}">删除</a></td>
  </tr>
  </s:iterator>
  </table>
  <body>
   
  </body>
</html>
