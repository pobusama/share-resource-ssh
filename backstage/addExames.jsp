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
    
    <title>试题上传</title>
<style>

.label{font-family: '微软雅黑' font-size:12px;color:red;}

</style>
    	<script type="text/javascript">
    	window.onload=function(){
    	var btn=document.getElementById("button");
    	btn.onclick=function(){
    	if(document.getElementById("examUp").value===""){
    	document.getElementById("examUpError").textContent="请先上传文件再提交！";
    	return false;
    	
    	}else{
    	document.examForm.submit();
    	}
    	}
    	}
    	</script>
  </head>
  
  <body>
 
    <s:form action="resourceAction_addExercises?type=2" name="examForm" id="examForm" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
<s:fielderror></s:fielderror>
  <tr  bgcolor="#ccccff" >
    <td colspan="2" align="center"><strong>试题上传</strong></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="18%">选择课程</td>
    <td width="82%"><s:select name="resource1.title" id="resource_title" list="#CourseList" 
													listKey="name" listValue="name" /><label id="examError" class="label">${examError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>试题上传</td>
    <td><input type="file" id="examUp" name="exercise" multiple/><label id="examUpError" class="label">${examUpError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>确认上传</td>
    <td><input type="button" id="button" value="确认上传"/></td>
  </tr>
</table>
   
  
   </s:form>
  </body>
</html>
