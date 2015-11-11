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
    
    <title>添加团队获奖情况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
<style>
    
     table, td, tr{border: 1px solid #7EC0E5;}
          table tr td{ background: #f3f3f3;}
          #table_title{font-family:"微软雅黑";font-size:14px;font-weight:600;text-align:center;}
     .label{font-family:"微软雅黑";font-size:12px;font-weight:300;color:red;}
    </style>
	
	
  </head>
  
  <body>
  <s:form name="honorForm" id="honorForm" action="teachTeamAction_uploadHonor" method="post">
<table width="100%" border="1" cellspacing="1" cellpadding="1">
  <tr>
    <td colspan="2" id="table_title">添加获奖情况</td>
  </tr>
  <tr>
    <td width="24%">获奖项目</td>
    <td width="76%"><input type="text" name="honor.project" id="project" size="80"/><label class="label" id="projectError">*${projectError}</label></td>
  </tr>
  <tr>
    <td>获奖等级</td>
    <td><input type="text" name="honor.level" id="level" size="30"/><label class="label" id="levelError">${levelError}</label></td>
  </tr>
  <tr>
    <td>奖金数额（元）</td>
    <td><input type="text" name="honor.money" id="money"/><label class="label" id="moneyError">${moneyError}</label></td>
  </tr>
  <tr>
    <td>选择课程</td>
    <td><s:select name="honor.courseId" id="topic" list="#courseList"   headerKey="0" headerValue="-请选择课程-"    listKey="id" listValue="name"/><label class="label" id="topicError">*${courseError}</label></td>
  </tr>

  <tr>
    <td>授奖部门</td>
    <td> <input type="text" name="honor.department" id="department"/><label class="label" id="departmentError">*${departmentError}</label></td>
  </tr>
  <tr>
    <td>获奖时间</td>
    <td> <input type="text" name="honor.time" id="time"/><label class="label" id="timeError">*${timeError}</label></td>
  </tr>
  
  <tr>
    <td>保存</td>
    <td><input type="submit" name="submit" id="submit" value="保存"/></td>
  </tr>
  
</table>
</s:form>
</body>
<script>


  var oForm=document.getElementById("honorForm");
oForm.onsubmit=function(){
 if(document.getElementById("project").value==""||(/^\s+$/gi.test(document.getElementById('project').value))){
         document.getElementById("projectError").textContent="获奖项目不可为空！";
         return false;
 }else if(document.getElementById("time").value==""||(/^\s+$/gi.test(document.getElementById('time').value))){
  document.getElementById("timeError").textContent="获奖时间不可为空！";
         return false;  
 }else if(document.getElementById("topic").value==0){
   document.getElementById("topicError").textContent="请选择课程！";
         return false;
 }
 else if(document.getElementById("department").value==""||(/^\s+$/gi.test(document.getElementById('department').value))){
  document.getElementById("departmentError").textContent="授奖部门不可为空！";
         return false;
         }
        else{
        document.honorForm.submit();
        } 
}
 var msg='${honormsg}';
 if(msg!=''&&!(/^\s+$/gi.test(msg))){
 alert(msg);
 }
</script>
</html>

