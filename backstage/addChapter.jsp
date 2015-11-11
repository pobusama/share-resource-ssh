<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>章节上传</title>
    	<style type="text/css">
   .label{font-family:"微软雅黑";font-size:14px;color:red;}
    	</style>
    	<script>
    	window.onload=function(){
    	
    	var oform=document.getElementById("chapterForm");
    	oform.onsubmit=function(){
    	if(document.getElementById("chapterUp").value==""||(/^\s+$/gi.test(document.getElementById('chapterUp').value))){
    
    	document.getElementById("chaperUpError").textContent="新增章节名不可为空！！";
    	return false;
    	}else{
    	
    	oform.submit();
    	}
    	}
    	}
    	
    	</script>
  </head>
  
  <body>
 
    <s:form action="courseAction_addChapter" name="chapterForm" id="chapterForm" method="post">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr  bgcolor="#ccccff" >
    <td colspan="2" align="center"><strong>添加章节</strong></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="18%">选择课程</td>
    <td width="82%"><s:select name="course.name" id="resource_title" list="#CourseList" 
													listKey="name" listValue="name" /></td>
  </tr>
  <tr  bgcolor="#ccccff">
    <td>章节名称</td>
    <td><input type="text" id="chapterUp" name="chapter.title" size="30"/><label id="chaperUpError" class="label">${chaperUpError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>确认添加</td>
    <td><input type="submit" id="button" value="添加"/></td>
  </tr>
</table>
   
  
   </s:form>
  </body>
</html>
