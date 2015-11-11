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
      
    <title>videoUpload</title>  
      
      
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->  
    <style>
    .label{font-family:"微软雅黑"; font-size:12px;color:red;}
    
    
    </style>
 <script type='text/javascript'src="<s:url value='/dwr/util.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/engine.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/interface/CourseAction.js'/>"></script>  
 <script>  
 function getList(){  
   var course=document.getElementById("course_title").value;  
     if(course==0){
      var chapter=document.getElementById("course_chapter");  
  chapter.options.length=0; 
     }
CourseAction.getChapterList(course,getChapter_callback)  
     
      
      
 }  
 function getChapter_callback(data){  
  var chapter=document.getElementById("course_chapter");  
  chapter.options.length=0;  
  for(var i=0;i<data.length;i++)  
  {  
  
 var opt=document.createElement("option")  
 opt.value=data[i].title;  
 opt.innerText=data[i].title;  
   //var opt=new option(data[i].title,data[i]);  
   chapter.appendChild(opt);  
  }   
    
 }  
   window.onload=function(){
   var oForm=document.getElementById("videoForm");
   oForm.onsubmit=function(){
   if(document.getElementById("course_title").value==0){
     document.getElementById("videoError").textContent="请选择课程！！";
     return false;
   }else if(document.getElementById("videoUp").value==""){
    document.getElementById("videoUpError").textContent="请先上传视频再提交！！";
    return false;
   }else if(document.getElementById("video_title").value==""||(/^\s+$/gi.test(document.getElementById('video_title').value))){
     document.getElementById("videoNameError").textContent="视频名称不可为空！！";
     return false;
   }else{
   oForm.submit();
   }
   }
   
   }
 </script>  
  </head>  
    
  <body>  
  <s:form name="videoForm" id="videoForm" action="resourceAction_addVideo" method="post" enctype="multipart/form-data">  
  <table width="100%" border="0" cellpadding="1" cellspacing="1">  
  <tr  bgcolor="#ccccff" >  
    <td colspan="2" align="center"><strong>本地添加视频</strong></td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td width="18%">选择课程</td>  
    <td width="82%"><s:select onchange="getList();" name="resource1.title" id="course_title" list="#CourseList"   
                                     headerKey="0" headerValue="-请选择课程-"                listKey="name" listValue="name" />
                                     <label id="videoError"  class="label">${videoError}</label></td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td>选择章节名称：</td>  
    <td><s:select name="videos.chapter" id="course_chapter" list="#{}"   
                                                    listKey="title" /></td>  
  </tr>  
  <tr  bgcolor="#ccccff">
  <td>上传视频：</td>
  <td><input type="file" id="videoUp" name="exercise"/><label id="videoUpError"  class="label">${videoUpError}</label></td>
  </tr>
  <tr bgcolor="#ccccff">
  <td>视频名称：</td>
  <td><input type="text" name="videos.name" id="video_title" size="30"/><label id="videoNameError"  class="label">${videoNameError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >  
    <td>确认添加</td>  
    <td><input type="submit" id="button" value="确认添加"/></td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td></td>  
    <td style="font-family:'微软雅黑';font-size:12px;color:red;">温馨提示：
                  视频名称为你希望的视频名称，例如：c语言简介
    </td>  
</table>  
</s:form>  
  </body>  
</html>  