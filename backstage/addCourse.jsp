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
    
    <title>新增课程</title>
    
	<STYLE type="text/css">
	table{position:relative;}
	#course_submit{margin-left:20px;width:90px;background:#1B7EB8;color:white;font-size:18px;font-family:YouYuan,"幼圆"; border:0; border-radius: 3px 3px 3px 3px;}
	.newcourse{font-size:18px;font-weight:bold;}
	.Outline_submit{margin-left:0px;}
	#fielderror{font-size:12px;}
	</STYLE>
	<script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="ueditor1/lang/zh-cn/zh-cn.js"></script>
	<link rel="stylesheet" type="text/css" href="ueditor1/themes/default/css/ueditor.min.css">
  <script type="text/javascript">
  window.onload=function(){
  
  var course_submit=document.getElementById("course_submit");
  course_submit.onclick=function(){
  if(document.getElementById("course_name").value==''){
    alert("请填写课程名称");
      return false;
    }else if(document.getElementById("teach").value==''){
    alert("请上传教学大纲");
      return false;
      }else if(document.getElementById("experiment").value==''){
    alert("请上传实验大纲");
      return false;
      }else if(document.getElementById("exam").value==''){
    alert("请上传考试大纲");
      return false;
      }else if(document.getElementById("grade").value==''){
    alert("请上传成绩评定办法");
      return false;
      }else if(document.getElementById("calendar").value==''){
    alert("请上传教学日历");
      return false;
      }else if(document.getElementById("time").value==''){
      alert("请填写课程学时")
      return false;
      }else if(document.getElementById("courseAttr").value==''){
      alert("请填写课程属性")
      }
      else if(document.getElementById("course_introductContent").value==''){
    alert("请填写课程介绍");
      return false;
      }else if(document.getElementById("course_editRecommend").value==''){
    alert("请填写编辑推荐");
      return false;
      }else if(!UE.getEditor('editor').hasContents()){
      alert("请填写团队介绍");
      return false;}
      else{
      
   
     document.addCourseForm.submit();
   
   }
   }
  }
  </script>
  </head>
  
  <body>
  <s:form id="addCourseForm" name="addCourseForm" action="courseAction_addCourse" method="post" enctype="multipart/form-data">
   <table width="100%" border="0" cellpadding="1" cellspacing="1" >
  <tr  bgcolor="#ccccff" height="40px">
    <td colspan="5" align="center" class="newcourse">新增课程</td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="11%">课程名称</td>
    <td colspan="4"><s:textfield id="course_name" name="course.name" size="40"/>&nbsp;<label style="color:red;">* ${nameError}</label> </td>
  
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>教学大纲</td>
  
    <td width="35%"><s:file name="teach" id="teach"/><label style="color:red;">* ${teachError}</label></td>
  
    <td colspan="2">实验大纲</td>
    <td width="23%"><input type="file" name="experiment" id="experiment"/><label style="color:red;">* ${experimentError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>考试大纲</td>
    <td><input type="file" name="exam" id="exam" /><label style="color:red;">* ${examError}</label></td>
    <td colspan="2">成绩评定</td>
    <td><input type="file" name="grade" id="grade"/><label style="color:red;">* ${scoreError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="11%">教学日历</td>
    <td colspan="4"><input type="file" name="calendar" id="calendar"/><label style="color:red;">* ${calendarError}</label></td>
  </tr>
   <tr  bgcolor="#ccccff" >
    <td>课程学时</td>
    <td><input type="text" name="course.time" id="time" size="10" value="${course.time}"/><label style="color:red;">* ${timeError}</label></td>
    <td colspan="2">课程属性</td>
    <td><input type="text" name="course.courseAttr" id="courseAttr" value="${course.courseAttr}"/><label style="color:red;">* ${attrError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td height="104">课程介绍</td>
    <td colspan="4"><label for="textarea"></label>
    <textarea name="course.introductContent" id="course_introductContent" cols="80" rows="6">${course.introductContent}</textarea>&nbsp;<label style="color:red; margin-top:-20px;">* ${contentError}</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td height="109">编辑推荐</td>
    <td colspan="4"><p>
      <label for="textarea2"></label>
      <textarea name="course.editRecommend" id="course_editRecommend" cols="80" rows="6">${course.editRecommend}</textarea>&nbsp;<label style="color:red;">* ${editError}</label>
  </p></td>
  </tr>
  <tr  bgcolor="#ccccff" >
  <td height="100">获奖情况</td>
 <td colspan="4"><p>
   <label for="textarea3"></label>
      <textarea name="course.winCondiction" id="course_winCondition" cols="80" rows="6">${course.winCondiction}</textarea>
  </p></td>
  </tr>
  <tr  bgcolor="#ccccff" >
  <td height="100">团队介绍</td>
 <td colspan="4"><p>
   <label for="textarea3"></label>
     <script id="editor" type="text/plain" name="course.teamIntroduct">${course.teamIntroduct}</script>
  </p></td>
  </tr>
  <tr bgcolor="#ccccff">
  <td height="40">执行新增</td>
 <td colspan="4"><p>
   <label for="textarea3"></label>
      <input type="button" id="course_submit" name="course_submit"  value="执行新增"/>	<s:fielderror name="loginError" id="error"/>
  </p></td>
  </tr>
  <tr  bgcolor="#ccccff" height="40px">
    <td colspan="5" >&nbsp;</td>
  </tr>
</table>
</s:form>
  </body>
   <script>
   var ue = UE.getEditor('editor', {
    initialFrameWidth:850,
    initialFrameHeight:350,
    autoHeightEnabled: false,
    
});
  </script>
</html>
