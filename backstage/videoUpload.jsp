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
    document.getElementById("courseTitle").textContent="请选择要添加视频的课程！";
    return false;
    }else if(document.getElementById("video_name").value==""||(/^\s+$/gi.test(document.getElementById('video_name').value))){
    document.getElementById("videoName").textContent="视频名称不能为空！";
    return false;
    }else if(document.getElementById("video_title").value==""||(/^\s+$/gi.test(document.getElementById('video_title').value))){
    document.getElementById("video_url").textContent="视频URL不能为空！";
    return false;
   }else{
     oForm.submit();
    }
   
    }
    }
  
   
 </script>  
 
  </head>  
    
  <body>  
  <s:form name="videoForm" id="videoForm" action="courseAction_addVideo" method="post">  
  <table width="100%" border="0" cellpadding="1" cellspacing="1">  
  <tr  bgcolor="#ccccff" >  
    <td colspan="2" align="center"><strong>简易添加视频</strong></td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td width="18%">选择课程</td>  
    <td width="82%"><s:select onchange="getList();" name="course.name" id="course_title" list="#CourseList"   
                                     headerKey="0" headerValue="-请选择课程-"                listKey="name" listValue="name" />
                                     <label id="courseTitle" class="label">${course_title}</label>
                                     </td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td>选择章节名称：</td>  
    <td><s:select name="video.chapter" id="course_chapter" list="#{}"   
                                                    listKey="title" /></td>  
  </tr>  
  <tr bgcolor="#ccccff">
  <td>视频名称：</td>
  <td><input type="text" name="video.name" class="inputClass" id="video_name" size="30"/><label id="videoName" class="label">${video_name}</label></td>
  </tr>
  <tr bgcolor="#ccccff">
  <td>视频URL：</td>
  <td><input type="text" name="video.title" class="inputClass" id="video_title" size="30"/><label id="video_url" class="label">${video_url}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >  
    <td>确认添加</td>  
    <td><input type="submit" id="button" value="确认添加"/></td>  
  </tr>  
  <tr  bgcolor="#ccccff" >  
    <td></td>  
    <td style="font-family:'微软雅黑';font-size:12px;color:red;">温馨提示：视频URL为视频原始名加上后缀名，例如：XXXX.mp4</br>
                  视频名称为你希望的视频名称，例如：c语言简介
    </td>  
  </tr>  
</table>  
</s:form>  
  </body>  
</html>  