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
    
    <title>作业提交</title>
<link type="text/css" rel="stylesheet" href="style/coursepagecommen.css" />
<link type="text/css" rel="stylesheet" href="style/handuphomework.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor1/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="ueditor1/lang/zh-cn/zh-cn.js"></script>
<link rel="stylesheet" type="text/css" href="ueditor1/themes/default/css/ueditor.min.css">
	 

<script>
window.onload=function()
{
	var error=document.getElementById("homeworkError");
	if(error.value===""||error.value===null){
	
	}else{
	alert(error.value);
	}
}
</script>
</head>

<body>&nbsp; 
<header><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="cnav">
	<a href="index.jsp">平台主页</a>
    <a href="#">课程简介</a>
    <a href="#">师资队伍</a>
    <a href="#">教学评价</a>
    <a href="#">教学单元</a>
    <a href="#">实践项目</a>
    <a href="#" class="active">作业提交</a>
   <a href="#">在线互动</a>
</nav>
<div class="content clearfix">
	<h1>作业提交系统</h1>
	<s:form id="homeworkForm" name="homeworkForm" action="homeworkUploadAction_uploadHomework" method="post" enctype="multipart/form-data">
	<input type="hidden" id="homeworkError" name="error" value="${error}"/>
    <div class="inputarea">
    <li>收件老师:
        	<div class="reset_select">
            	<s:select id="teachterName" name="homework.teacherName" list="#teacherList" listKey="major" listValue="major"/>
            </div>
    </li>
    <li>作业主题:<input type="text" id="topic" name="homework.topic"/> <input class="inputfile" type="file" name="attach" multiple/></li>
    <li class="text_area">
    详细内容:<!--<s:hidden id="mailContent" cssStyle="display:none" name="homework.description"/>
													<s:hidden id="mailContent___Config"
														value="ToolbarStartExpanded=true&amp;LinkBrowser=true&amp;ImageBrowser=true&amp;FlashBrowser=true&amp;LinkUpload=true&amp;ImageUpload=true&amp;FlashUpload=true"
														style="display:none" />
													<iframe id="mailContent___Frame"
														src="fckeditor/editor/fckeditor.html?InstanceName=mailContent&amp;ToolbarSet=default"
														width="750" height="300" frameborder="no" scrolling="no"
														style="border: 0pt none; margin: 0pt; padding: 0pt; background-color: transparent;  background-image: none; width: 100%; height: 400px;">
													</iframe>
    -->
     <script id="editor" type="text/plain" name="homework.description"></script>
  
    </li>
    <li>
    	<input type="submit" class="homeworksubmit" value="确认提交" />
    </li>
    
    </div>
    </s:form>
</div>

<footer>
	<div class="footer_link">
    	<a href="javascript:void(0);">加入收藏</a><a href="javascript:void(0);">进入后台</a>
    </div>
	<p>
    	Copyright© 2011 江西理工大学.All Rights Reserved.<br />
  		学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
  		制作维护：  江西理工大学信息学院333工作室  Email：517821485@qq.com <br />


    </p>
</footer>

</body>
<script>
  var ue = UE.getEditor('editor', {
    initialFrameWidth:750,
    initialFrameHeight:300,
    autoHeightEnabled: false,
    
});

</script>
</html>
