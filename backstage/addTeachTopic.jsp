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
    
    <title>添加课程组成员主持的教改课题</title>
    <style>
    
     table, td, tr{border: 1px solid #7EC0E5;}
          table tr td{ background: #f3f3f3;}
          #table_title{font-family:"微软雅黑";font-size:14px;font-weight:600;text-align:center;}
     .label{font-family:"微软雅黑";font-size:12px;font-weight:300;color:red;}
    </style>
	
	<script type='text/javascript'src="<s:url value='/dwr/util.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/engine.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/interface/TeachTeamAction.js'/>"></script>
<script type="text/javascript">
 function getList(){ 
      var other=document.getElementById("topic").value;
if(other==0){
   var othermajor=document.getElementById("teach_author");  
   othermajor.options.length=0;  
} 
   var course=document.getElementById("topic").value;  
TeachTeamAction.getTeachTeamList(course,getMajor_callback)  
     
      
      
 }  
 //回调函数
 function getMajor_callback(data){  
  
  var author1=document.getElementById("teach_author");  
   author1.options.length=0;  
  for(var i=0;i<data.length;i++)  
  {  
 var opt=document.createElement("option");  
 opt.value=data[i].teacherName; 
 opt.innerText=data[i].teacherName;  
   //var opt=new option(data[i].title,data[i]);  
   author1.appendChild(opt);  
  }   
   }
  
</script>

  </head>
  
  <body>
  <s:form name="topicForm" id="topicForm" action="teachTeamAction_uploadTopic" method="post">
<table width="100%" border="1" cellspacing="1" cellpadding="1">
  <tr>
    <td colspan="2" id="table_title">添加课程组成员主持的教改课题</td>
  </tr>
  <tr>
    <td width="24%">项目名称</td>
    <td width="76%"><input type="text" name="teachTopic.projectName" id="projectName" size="80"/><label class="label" id="nameError">*${nameError}</label></td>
  </tr>
  <tr>
    <td>项目来源</td>
    <td><input type="text" name="teachTopic.projectSource" id="projectSource" size="30"/><label class="label" id="sourceError">*${sourceError}</label></td>
  </tr>
  <tr>
    <td>起止时间</td>
    <td><input type="text" name="teachTopic.StartTime" id="startTime"/><label class="label" id="timeError">*${timeError}</label></td>
  </tr>
  <tr>
    <td>选择课程</td>
    <td><s:select name="courseOfTopic" id="topic" list="#courseList" onchange="getList();"  headerKey="0" headerValue="-请选择课程-"    listKey="name" listValue="name"/><label class="label" id="topicError">*</label></td>
  </tr>
  <tr>
    <td>主持人</td>
    <td>  <s:select name="teachTopic.author" id="teach_author"  list="#{}" listKey="teacherName" /><label class="label" id="authorError">*${authorError}</label></td>
  </tr>
  
  <tr>
    <td>保存</td>
    <td><input type="submit" name="submit" id="submit" value="保存"/></td>
  </tr>
  
</table>
</s:form>
</body>
<script>


   var oForm=document.getElementById("topicForm");
oForm.onsubmit=function(){
 if(document.getElementById("projectName").value==""||(/^\s+$/gi.test(document.getElementById('projectName').value))){
         document.getElementById("nameError").textContent="课题名不可为空！";
         return false;
 }else if(document.getElementById("projectSource").value==""||(/^\s+$/gi.test(document.getElementById('projectSource').value))){
  document.getElementById("sourceError").textContent="项目来源不可为空！";
         return false;
 }else if(document.getElementById("startTime").value==""||(/^\s+$/gi.test(document.getElementById('startTime').value))){
  document.getElementById("timeError").textContent="起止时间不可为空！";
         return false;  
 }else if(document.getElementById("topic").value==0){
   document.getElementById("topicError").textContent="请选择课程！";
         return false;
 }
 else if(document.getElementById("teach_author").value==""){
  document.getElementById("authorError").textContent="作者不可为空！";
         return false;
         }
 
        else{
        document.topicForm.submit();
        } 
}
 
</script>
</html>

