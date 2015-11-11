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
    
    <title>习题上传</title>
    <style>
    .label{font-family: '微软雅黑' font-size:12px;color:red;}
    
    </style>
    	<script type="text/javascript">
    	window.onload=function(){
    	var btn=document.getElementById("button");
    	btn.onclick=function(){
    	if(document.getElementById("exerciseUp").value===""){
    	document.getElementById("resourceUpError").textContent="请先上传习题再提交！！";
    	return false;
    	}else{
    	document.exerciseForm.submit();
    	}
    	}
    	}
    	</script>
  </head>
  
  <body>
 
    <s:form action="resourceAction_addExercises?type=1" name="exerciseForm" id="exerciseForm" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr  bgcolor="#ccccff" >
    <td colspan="2" align="center"><strong>习题上传</strong></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="18%">选择课程</td>
    <td width="82%"><s:select name="resource1.title" id="resource_title" list="#CourseList" 
													listKey="name" listValue="name" /><label id="resourceError" class="label">${resourceError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>习题上传</td>
    <td><input type="file" id="exerciseUp" name="exercise" multiple/><label id="resourceUpError" class="label">${resourceUpError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>确认上传</td>
    <td><input type="button" id="button" value="确认上传"/></td>
  </tr>
</table>
   
  
   </s:form>
  </body>
</html>
