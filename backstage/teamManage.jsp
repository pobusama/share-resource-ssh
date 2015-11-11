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
    
    <title>师资队伍管理</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style>
   #title{text-align:center;}
   #title_input{margin-right:30px;}
   table, td, tr{border: 1px solid #7EC0E5; font-size:13px;}
        #tr_title{font-size:14px;font-weight:bold;font-family:"微软雅黑";}
        body{position:relative;}
         #delete{position:absolute;top:40px;}
   </style>
   
  
  </head>
  
  <body>
   <form action="teachTeamAction_teambatchDelete" method="post">
   <div id="delete">
  <s:select name="courseid" id="resource_title" list="#courseList" 
													listKey="id" listValue="name" />
  <input type="submit" id="batch" value="批量删除">
  </div>
  </form>
  <s:form id="teamForm" name="teamForm" action="teachTeamAction_getTeam" method="post">
  <div id="title">
  <h3 id="title_input">师资队伍管理</h3>
  <span>请选择课程:</span><s:select name="teachCourse" list="#courseList" listKey="name" listValue="name" />
  <input type="submit" name="submit" value="搜索" />
  </div>
  <table width="100%" border="1">
  <tr bgcolor="#4097D1" align="center" id="tr_title">
    <td>姓名</td>
    <td>性别</td>
    <td>出生年月</td>
    <td>专业技能职务</td>
    <td>学科专业</td>
    <td>本课程中承担的工作</td>
    <td>出国情况</td>
    <td>编辑</td>
    <td>删除</td>
  </tr>
  <s:iterator id="gz" value="teachersList">
  <tr bgcolor="#f3f3f3">
    <td>${gz.teacherName}</td>
    <td>${gz.sex}</td>
    <td>${gz.birthday }</td>
    <td>${gz.diploma}</td>
    <td>${gz.courseMajor}</td>
    <td>${gz.job}</td>
    <td>${gz.foreignMeeting}</td>
    <td><a href="teachTeamAction_Edit?id=${id}">编辑</a></td>
    <td><a href="teachTeamAction_teamDelete?id=${id}">删除</a></td>
  </tr>
</s:iterator>
</table>
 </s:form>
</body>
  <script type="text/javascript">
  var obatch=document.getElementById("batch");
  obatch.onclick=function(){
  var msg="删除不可恢复，你确认要删除吗？";
  if(confirm(msg)){
  return true;
  }else{
  return false;
  }
  
  }
  </script>
</html>
