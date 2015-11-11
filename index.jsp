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
   
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公共课程平台主页</title>
<link type="text/css" rel="stylesheet" href="style/home_page.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type='text/javascript'src="<s:url value='/dwr/util.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/engine.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/interface/CourseAction.js'/>"></script>
 <style type="text/css">
 	/*登录面板*/
    .panel{float:right;margin-top:10px;background-color: #fff;width: 270px; height: 300px; text-align: center;}
    .panel input[type="button"]{margin-top:10px;height:40px;border-radius: 5px; cursor: pointer; width: 116px; background-color: #01c675;font-family: "微软雅黑"; font-size: 14px; color: #fff; border: 1px solid #ccc; }
    .panel input[type="button"]:hover{background-color: #009e5d;}
    .panel input[type="submit"]{margin-top:10px;height:40px;border-radius: 5px; cursor: pointer; width: 116px; background-color: #01c675;font-family: "微软雅黑"; font-size: 14px; color: #fff; border: 1px solid #ccc; }
    .panel input[type="submit"]:hover{background-color: #009e5d;}

    .panel-heading{width: 100%;margin-bottom: 30px;}
    .panel-heading h3{margin-bottom:10px;width: 100%;font-family: "微软雅黑"; font-size: 16px; height: 60px;line-height: 60px; text-align: center;color: #fff; background-color: #01c675;}
    .panel-body{}

    .input-group{width: 270px;  height: 30px;margin-bottom: 10px; }
    .input-group >input,h5{display: block; float: left;  }
    .input-group h5{height: 30px; width: 30%; line-height: 40px; text-align: center;font-family: "微软雅黑"; font-size: 14px;}
    .input-group >input{border-radius: 5px;border: 1px solid #999; height: 30px;width: 55%; padding: 0 10px; margin: 0 auto; }
    .barcode{ margin-top: 10px;padding:0 20px;width: 230px;}
    .barcode .barcode-img{line-height:28px;margin-right:20px;float:right;width: 50px; height: 28px;border: 1px solid #999;border-radius: 5px; margin-left: 8px;}
    .barcode .barcode-input{float:right;height: 30px;width: 88px;}
    .barcode h4{ height: 28px; width: 80px;font-family: "微软雅黑"; font-size: 12px; font-weight: normal;}

    .remember-passwd{width: 100%; height: 20px;font-family: "微软雅黑"; font-size: 12px; }
    .remember-passwd label{width:80px; height:20px;float: right; margin-right: 40px;}
    .remember-passwd label input{float: right; top: 0;}
    
    
 </style>
 <script>
 
 CourseAction.findCourse(getList_callback);
function getList_callback(data){
var courseLen=0;
var testList=document.getElementById("testList");


  var List=testList.getElementsByTagName("li");
  if(data.length<=List.length){
   courseLen=data.length;
  }else{
  courseLen=List.length;
  }
for(var i=0;i<courseLen;i++){

  var url="courseAction_ChapterList?courseid="+data[i].id;
   List[i].innerHTML="<a href='"+url+"'>"+data[i].name+"</a>";
  
  }
}

 </script>
<script>

window.onload=function()
{
	//导航JS

	var oNav= document.getElementById('nav');
	var aNavBtns=oNav.getElementsByTagName('a');
	var oSearchBtn=document.getElementById('search_btn');
	var iSearchIndex=0;
	var iIntroduceMoerIndex=0;
	
	var oSearchBox=document.getElementById('search_box');
	var oSearchInput=document.getElementById('search_input');
	
	
	
	
	//导航搜索按钮
	oSearchBtn.onmousemove=function()
	{
		oSearchBtn.style.height=10+'px';
		oSearchBtn.style.background='#01c675';
		oSearchBtn.style.borderBottom='4px #00a05e solid';
		oSearchBtn.getElementsByTagName('span')[0].className='active';
		
	}
	oSearchBtn.onmouseout=function()
	{
		oSearchBtn.style.height=14+'px';
		oSearchBtn.style.background='#fff';
		oSearchBtn.style.borderBottom='none';
		oSearchBtn.getElementsByTagName('span')[0].className='';
	}
	oSearchBtn.onclick=function()
	{
		if(iSearchIndex%2==0)
			{
				oSearchBox.style.display="block";
				startMove(oSearchBox,{opacity:100});
			}
			
		else
			{
				
				startMove(oSearchBox,{opacity:0});
				oSearchBox.style.display="none";
			}
			
		iSearchIndex++;
	}
	
	//搜索输入框提示js
	oSearchInput.onfocus=function()
	{
		if(this.value==this.defaultValue)
		{
			
			this.value='';
			this.style.color='#a1a1a1'
		}
		
	}
	oSearchInput.onblur=function()
	{
		if(!this.value)
		{
			this.value=this.defaultValue;
			this.style.color='#ccc';
		}
	}
	//课程介绍查看更多
	oCourseIntroduceMore.onclick=function()
	{
		
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
    <a href="homeworkUploadAction_addTeacherList">作业提交</a>
    <a href="userAction_academyList">竞赛报名</a>
    <a href="#">教研活动</a>
    <a href="courseAction_addDownload_homework">下载入口</a>
    <a href="javascript:void(0);" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<div class="content">
	<div class="teacher_team">
    	<img class="face_window"  src="images/face_window.png" width="150" height="228" />
    	<img class="face_photo"  alt="教师照片" src="images/teachers/photo.jpg"  width="114"  height="160"/>
        <h1>课程负责人</h1>
        <h2>胡春安</h2>
        <p>副教授,计算机基础教研室主任。2011年评为江西省第七批中青年骨干教师,2012年评为校优秀教研室主任</p>
        <a class="social_link" href="javascript:void(0)"><span class="xinlang_wb"></span></a>
        <a class="social_link" href="javascript:void(0)"><span class="tencent_wb"></span></a>
    	
    </div>
  
  
	<ul class="course_list" id="testList">
    	<h1>课程列表</h1><a href="javascript:void(0)">More</a>

    	<li></li>
    	<li></li>
    	<li></li>

       </ul>
    <div class="teach_announce">
    <form id="announceForm" name="announceForm" action="newsAction_indexList?announce=1&&login=${loginError}" method="post">
     <s:hidden id="pageSize" name="pageSize" value='5'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
    	<h4>	<s:if test="toolBar.pageCount > 0">

					<s:if test="toolBar.pageIndex > 1"><a class="pre_announce" href='javascript:jumping(<s:property value='toolBar.previousPage'/>)'></a></s:if><s:else><a class="pre_announce"></a></s:else>&nbsp;&nbsp;
					教学公告
					<s:if test="toolBar.pageIndex == toolBar.pageCount || toolBar.pageIndex == 0"><a class="next_announce"></a></s:if>
					<s:else><a class="next_announce" href='javascript:jumping(<s:property value='toolBar.nextPage'/>)'></a></s:else>&nbsp;&nbsp;

				</s:if></h4>
        
        <ul class="announce_info">
        <s:iterator id="sr" value="newsList">
        	<a href="newsAction_edit?id=${id}"> <s:property value="#sr.title" escape="false"/>  </a>
									 
        </s:iterator>
        </ul>
        <s:if test="#request.announce==null"><script>document.announceForm.submit();</script></s:if>
         
				
				
				<script language="javascript">
					function jumping(pageIndex){
						document.getElementById("pageIndex1").value=pageIndex;
						document.getElementById("announceForm").submit();
				   	}
			    </script>
			
    	</form>
    </div>
    <div class="about_teaching">
    <input type="hidden" name="LoginError" id="LoginError" value="${Sessionerror}"/>
    	<h1>教学相关</h1>
        <div class="about_teaching_items">
        	<h2>教学档案</h2>
        	<span><strong class="teaching_archives"></strong></span>
            <ul>
            	<s:a action="homeAction_outline?type=1">教学大纲</s:a>
               <s:a action="homeAction_outline?type=2">教学日历</s:a>
                <s:a action="homeAction_outline?type=2">学习指南</s:a>
                <s:a action="homeAction_outline?type=3">考试大纲</s:a>
                <s:a action="homeAction_outline?type=5">实验大纲</s:a>
               
               <s:a action="homeAction_outline?type=4">成绩评定</s:a>
            </ul>
        </div>
        <div class="about_teaching_items aux">
        	<h2>辅助系统</h2>
        	<span><strong class="auxiliary_system"></strong></span>
            <ul>
            	 <a href="homeworkUploadAction_addTeacherList">作业提交</a>
                <a href="userAction_academyList">竞赛报名</a>
                <a href="www.jxustoj.tk">OJ自测系统</a>
                <a href="app.jsp">腾云优课</a>
               <a href="forumAction_list">互动平台</a>
                <a href="http://acm.hdu.edu.cn/">C语言竞赛系统</a>
            </ul>
        </div>

    </div>
 	<s:if test="#session.user==null">
	  <div id="login-panel" class="panel">
	       <div class="panel-heading">
	           <h3>请登录您的账户</h3>
	       </div>
	      <form action="userAction_userLogin" method="post">
	           <div class="panel-body">
	                   <div class="input-group">
	                       <h5>帐号：</h5>
	                       <input type="text" class="form-control" name="user.userName" id="username"  placeholder="请输入用户名" aria-describedby="basic-addon1">
	
	                   </div>
	                   <div class="input-group">
	                       <h5>密码：</h5>
	                       <input type="password" class="form-control"  name="user.password" id="password"  placeholder="请输入密码" aria-describedby="basic-addon1">
	
	                   </div>
	                   <input type="button" id="regist" name="regist"class="btn btn-default pull-left" value="注册账户"/>
	                   <input type="submit" id="user-login" onClick="login()" name="submit"  class="btn btn-primary pull-right" value="登录账户"/>
	
	           </div>
	       
	</form>
	   </div>
	   </s:if>
	   <s:else>
	   <div id="logined-panel" class="panel">
	       <div class="panel-heading">
	           <h3>账户已登录-ID:<span>${session.user.userName}</span></h3>
	       </div>
	       <form role="form">
	           <div class="panel-body">
	               <div class="user-info">
	                   <a href="#" class="user-img"><img src="images/user/1.png" ></a>
	
	               </div>
	               <input type="button" id="out" onClick="loginOut()" class="btn btn-primary pull-right" value="登出账户"/>
	
	           </div>
	       </form>
	
	   </div>
   </s:else>
</div>

<footer>
	<div class="footer_link">
    	<a href="javascript:void(0);">加入收藏</a>
    	<a href="backstage/backLogin.jsp">进入后台</a>
    </div>
	<p>
    	Copyright© 2011 江西理工大学.All Rights Reserved.<br />
  		学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
  		制作维护：  江西理工大学信息学院333工作室  Email：517821485@qq.com <br />


    </p>
</footer>

<script type="text/javascript">

var oregist=document.getElementById("regist");

oregist.onclick=function(){
window.location.href="userRegist.jsp";

}


function login(){

if(!validateUsername()){
return false;
}
if(!validatePassword()){
return false;
}

}

/*
 * 登录名校验方法
 */
function validateUsername() {
	var id = "username";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */	
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		alert("账号不能为空！");
		return false;
		
		
	}
	return true;
}

/*
 *密码校验方法
 */
function validatePassword() {
	var id = "password";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */	
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		alert("密码不能为空！");
		return false;	
	}
	if(value.length<6){
	alert("密码不可小于六位！");
	return false;
	}
	return true;
}
function loginOut(){

window.location.href="userAction_Loginout";

}
var oError=$("#LoginError").val();
if(oError!=''){
alert(oError);
}
</script>
</body>

</html>
