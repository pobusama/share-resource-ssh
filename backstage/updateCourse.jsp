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
    
    <title>更新课程</title>
  <STYLE type="text/css">
     #img{float:left;}
    .div1 img{position:relative;float:left;width:120px;height:140px;border:2px solid #ccc;}
     .div2 a{position:absolute;top:560px;left:160px;font-family:font-family:YouYuan,"幼圆";font-size:12px;}
    .div3 a{position:absolute;top:560px;left:280px;font-family:font-family:YouYuan,"幼圆";font-size:12px;}
    .div4 a{position:absolute;top:560px;left:400px;font-family:font-family:YouYuan,"幼圆";font-size:12px;}
    .div5 a{position:absolute;top:560px;left:530px;font-family:font-family:YouYuan,"幼圆";font-size:12px;}
  </STYLE>
  <script type="text/javascript" src="js/common.js"></script>
  <script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="ueditor1/lang/zh-cn/zh-cn.js"></script>
	<link rel="stylesheet" type="text/css" href="ueditor1/themes/default/css/ueditor.min.css">
  <SCRIPT type="text/javascript">

  window.onload=function(){
  var update_submit=document.getElementById("update_submit");
  update_submit.onclick=function(){

   document.courseUpdateForm.submit();
  
  }
  
  }
  </SCRIPT>
  </head>
  
  <body style="background:#ccccff ">
  <s:form name="courseUpdateForm" id="courseUpdateForm" action="courseAction_toUpdate?courseId=%{course.id}" method="post"  enctype="multipart/form-data">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="white" >
  <tr  bgcolor="#ccccff" height="40px">
    <td colspan="5" align="center" class="newcourse"><strong>更新课程</strong></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td width="11%">课程名称</td>
    <td colspan="4"><input id="course_name" type="text" name="course.name" size="40" value="${course.name}"/><label style="color:red">*</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td height="104">课程介绍</td>
    <td colspan="4"><label for="textarea"></label>
    <textarea name="course.introductContent" id="course_introductContent" cols="80" rows="6" >${course.introductContent}</textarea><label style="color:red">*</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>修改课程学时</td>
  
    <td><input type="text" size="10" value="${course.time}" name="course.time" id="time"/><label style="color:red">*</label></td>
 </tr>
 <tr  bgcolor="#ccccff" >
    <td>修改课程属性</td>
  
    <td><input type="text" name="course.courseAttr" value="${course.courseAttr}" id="courseAttr"/><label style="color:red">*</label></td>
 </tr>
  <tr  bgcolor="#ccccff" >
    <td height="109">编辑推荐</td>
    <td colspan="4"><p>
      <label for="textarea2"></label>
      <textarea name="course.editRecommend" id="course_editRecommend" cols="80" rows="6" >${course.editRecommend}</textarea><label style="color:red">*</label>
  </p></td>
  </tr>
  <tr  bgcolor="#ccccff" >
  <td height="100">获奖情况</td>
 <td colspan="4"><p>
   <label for="textarea3"></label>
      <textarea name="course.winCondiction" id="course_winCondition" cols="80" rows="6" >${course.winCondiction}</textarea>
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
  <td>现有大纲</td>
    <td height="200" colspan="2" id="img"><div class="div1"><a href="javascript:jump('教学大纲','1',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/processres/cover/2013/8/27/ff808081-4071e2f6-0140-bf317b58-0c66.jpg" />
				</a>
		</div>
		<div class="div1">
					<a href="javascript:jump('教学日历','4',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/5/ff808081-3b65fb58-013b-69f9eb2a-1145.jpg" />
					</a>
		</div>
		<div class="div1">
						<a href="javascript:jump('实验大纲','3',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/6/ff808081-3b65fbac-013b-6b4b8314-1722.jpg" />
						</a>
		</div>
			<div class="div1">
					<a href="javascript:jump('考试大纲','2',${course.id},780,550);"><img src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/5/ff808081-3b68fd0f-013b-6ad3ab42-087a.jpg" />
					</a>
		</div>
		<div class="div2"><a class="outline">教学大纲</a></div>
		<div class="div3"><a class="outline">教学日历</a></div>
		<div class="div4"><a class="outline">实验大纲</a></div>
		<div class="div5"><a class="outline">考试大纲</a></div>
		
</td>
 <tr bgcolor="#ccccff">
    <td>修改教学大纲</td>
  
    <td><s:file name="teach" id="teach"/><label style="color:red">*</label></td>
 </tr>
<tr  bgcolor="#ccccff" >  
    <td>修改实验大纲</td>
    <td><input type="file" name="experiment" id="experiment"/><label style="color:red">*</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>修改考试大纲</td>
    <td><input type="file" name="exam" id="exam" /><label style="color:red">*</label></td>
   </tr>
    <tr  bgcolor="#ccccff" > 
    <td>修改成绩评定</td>
    <td><input type="file" name="grade" id="grade"/><label style="color:red">*</label></td>
  </tr>
  <tr  bgcolor="#ccccff" >
    <td>修改教学日历</td>
    <td><input type="file" name="calendar" id="calendar"/><label style="color:red">*</label></td>
  </tr>
  <tr bgcolor="#ccccff">
  <td height="40">执行修改</td>
 <td colspan="4"><p>
   <label for="textarea3"></label>
      <input type="button" id="update_submit" name="update_submit"  value="执行修改"/>
  </p></td>
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
