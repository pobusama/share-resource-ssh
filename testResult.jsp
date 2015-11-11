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
    
    <title>测试结果</title>
   
<link type="text/css" rel="stylesheet" href="style/coursepagecommen.css" />
<link type="text/css" rel="stylesheet" href="style/testresult.css" />
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
<header><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="cnav">
	<a href="index.jsp">平台主页</a>
    <a href="#">课程简介</a>
    <a href="#">师资队伍</a>
    <a href="#">教学评价</a>
    <a href="#">教学单元</a>
    <a href="#">实践项目</a>
    <a href="#">作业提交</a>
   <a href="#">在线互动</a>
</nav>

<div class="content">
	<ul class="pointdisplay">
    	
        <li>您的考试得分为：<strong>${result}</strong>分</li>
    </ul>
	<div class="tips">
    	错题为:
    	
    </div>
    <div id="errorQuestion" class="errorquestion">
     <s:iterator id="single" value="ErrorSingleQuestion" status="st">
    	<li>
        	<p><strong>${single.id}</strong>.&nbsp;&nbsp;${single.question}</p>
            <div class="radiobox">
            
            
				<label name="nba" for="nba">A.${single.option_A}</label>
            </div>
            <div class="radiobox">
          
				<label name="cba" for="cba">B.${single.option_B}</label>
            </div>
            <div class="radiobox"> 
         
				<label name="mba"  for="mba">C.${single.option_C}</label>
            </div>
            <div class="radiobox"> 
         
				<label name="bbc"  for="bbc">D.${single.option_D}</label>
				</br>
            </div>
            <span class="errortips">your answer：${single.errorAnswer} correct answer：${single.answer}</span>
		 </li>
         </s:iterator>
         <s:iterator id="multi" value="ErrorMultiQuestion" status="st1">
    	<li>
    	
        	<p><strong>${multi.id}</strong>.&nbsp;&nbsp;${multi.question}</p>
            <div class="radiobox">
            
            
				<label name="nba" for="nba">A.${multi.option_A}</label>
            </div>
            <div class="radiobox">
           
				<label name="cba" for="cba">B.${multi.option_B}</label>
            </div>
            <div class="radiobox"> 
         
				<label name="mba"  for="mba">C.${multi.option_C}</label>
            </div>
            <div class="radiobox"> 
  
				<label name="bbc"  for="bbc">D.${multi.option_D}</label>
				</br>
            </div>
            <span class="errortips">your answer：${multi.errorAnswer} correct answer：${multi.answer}</span>
		 </li>
         </s:iterator>
         <s:iterator id="judegment" value="ErrorJudegmentQuestion" status="st1">
    	<li>
    	
        	<p><strong>${judegment.id}</strong>.&nbsp;&nbsp;${judegment.question}</p>
            <div class="radiobox">   
            <span class="errortips">your answer：${judegment.errorAnswer} correct answer：${judegment.answer}</span>
		 </li>
         </s:iterator>
         
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

