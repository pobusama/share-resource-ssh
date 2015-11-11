<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
、<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>竞赛报名</title>
<link type="text/css" rel="stylesheet" href="style/jingsai.css" />
<script type="text/jscript" src="js/common.js"></script>
<script type='text/javascript'src="<s:url value='/dwr/util.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/engine.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/interface/UserAction.js'/>"></script>
 <script type="text/javascript" src='<s:url value="js/jquery-1.9.1.min.js"/>'></script>
 <script type="text/jscript" src="js/jingsairegist.js"></script>
 <script type="text/jscript" src="js/validate.js"></script>
 <script>
 //dwr
 function getList(){ 
      var other=document.getElementById("acdemy").value;
if(other==0){
   var othermajor=document.getElementById("major_class");  
   othermajor.options.length=0;  
} 
   var course=document.getElementById("acdemy").value;  
UserAction.getMajorList(course,getMajor_callback)  
     
      
      
 }  
 //回调函数
 function getMajor_callback(data){  
  
  var major=document.getElementById("major_class");  
   major.options.length=0;  
  for(var i=0;i<data.length;i++)  
  {  
  
 var opt=document.createElement("option")  
 opt.value=data[i].major;  
 opt.innerText=data[i].major;  
   //var opt=new option(data[i].title,data[i]);  
   major.appendChild(opt);  
  }   
   
 }



 
 </script>
 
</head>

<body>
<header id="header"><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="nav">
	<a href="index.jsp">平台主页</a>
    <a href="#">教学评价</a>
    <a href="#">教学教改</a>
    <a href="#">作业提交</a>
    <a class="" href="userAction_academyList">竞赛报名</a>
    <a href="#">教研活动</a>
    <a href="#">下载入口</a>
    <a href="#" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<s:form id="registForm" name="registForm" action="userAction_studentLogin" method="post">
<div class="content">
	<h1>报名信息填写</h1>
  <div class="sign_up_info">
    	<li><label class="errorClass" id="studentsnameError">${studentName}</label>学生姓名:<input id="studentsname" class="inputClass" placeholder="请输入中文汉字"  type="text"  name="acmUser.userName"/></li>

    	<li>所属学院:
        	<div class="reset_select">
            	<s:select id="acdemy" name="acmUser.academy" onchange="getList();" list="#academyList"     headerKey="0" headerValue="--------请选择学院--------"  listKey="academy" listValue="academy"/>
  
            </div>
            <label class="errorClass" id="acdemyError">${userAcademy}</label>
        	
        </li>
        <li>所属专业:
        	<div class="reset_select">
                <s:select id="major_class" name="acmUser.major" list="#{}" listKey="major"/>
                   
               
            </div>
            <label class="errorClass" id="major_classError">${usermajor}</label>
      	</li>
       <li  class="sclass">所属班级:<label class="errorClass" id="classnumberError">${studentClass}</label><span>班</span><input id="classnumber" class="inputClass" name="acmUser.userClass" type="text" placeholder="请输入班级序号如'122'"/></li>
            	<li><label class="errorClass" id="eCardError">${e_card}</label>一卡通号:<input id="eCard" class="inputClass" placeholder="请输入一卡通号如'1520123442'"  type="text"  name="acmUser.cardnumber"/></li>
        <li>电话号码:<label class="errorClass" id="telnumberError">${userphone}</label><input id="telnumber" class="inputClass" placeholder="请输入数字号码" type="text" name="acmUser.phone"/></li>
        
        <input id="info_submit" class="info_submit" type="submit" value="提交信息" />
   </div>
    
</div>
</s:form>
<footer>
	<div class="footer_link">
    	<a href="javascript:void(0);">加入收藏</a><a href="backstage/backstagelogin.html">进入后台</a>
    </div>
	<p>
    	Copyright© 2011 江西理工大学.All Rights Reserved.<br />
  		学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
  		制作维护：  江西理工大学信息学院333工作室  Email：517821485@qq.com <br />


    </p>
</footer>
</body>
</html>

