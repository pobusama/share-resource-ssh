<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>报名成功</title>
   
<link type="text/css" rel="stylesheet" href="style/pagecommen.css" />
<link type="text/css" rel="stylesheet" href="style/successful.css" />
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
			startMove(oSearchBox,{opacity:100});
		else
			startMove(oSearchBox,{opacity:0});
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
	
}
</script>

</head>

<body>
<header id="header"><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="nav">
	<a href="index.html">平台主页</a>
    <a href="javascript:void(0);">教学评价</a>
    <a href="javascript:void(0);">教学教改</a>
    <a href="javascript:void(0);">作业提交</a>
    <a class="act" href="#">竞赛报名</a>
    <a href="javascript:void(0);">教研活动</a>
    <a href="javascript:void(0);">下载入口</a>
    <a href="javascript:void(0);" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<div class="content">
	<ul>
    	<img src="images/ok.png" alt="ok" width="90" height="80"/>
        <li>您已报名成功</li>
    </ul>
	<div class="tips">
    	请您务必加入竞赛QQ群：<strong>6868668</strong>，以便通知相关事项，谢谢合作！
    </div>
    
</div>

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

