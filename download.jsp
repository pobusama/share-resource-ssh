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
    
  <title>资源下载</title>
<link rel="stylesheet" type="text/css" href="style/pagecommen.css" />
<link rel="stylesheet" type="text/css" href="style/downloadpage.css" />
<script type="text/jscript" src="js/common.js"></script>
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
	
	//全选、不选、反选JS
	var oCheckAll=document.getElementById('checkAll');
	var oFileAreaContent=document.getElementsByClassName('file_area_content')[0];
	var oCheckAll=document.getElementById('checkAll');//全选按钮
	var oCancelAllCheck=document.getElementById('cancelAllCheck');//全不选按钮
	var oSelectOthers=document.getElementById('select_others');//反选按钮
	var oDownLoadIt=document.getElementById('downloadit');//下载按钮
	
	var aFileCheckBoxLis=oFileAreaContent.getElementsByTagName('li');//所有下载文件所属的LI
	var aFileCheckBoxs=new Array();//所有下载文件的复选框集合
	
	for(var i=0; i<aFileCheckBoxLis.length;i++)//赋值
	{
		aFileCheckBoxs[i]=aFileCheckBoxLis[i].getElementsByTagName('input')[0];
		
	}
	for(var i=0; i<aFileCheckBoxs.length;i++)
	{
		aFileCheckBoxs[i].checked=false;
	}
	
	for(var i=0; i<aFileCheckBoxs.length;i++)//给每个复选框赋点击事件
	{
		aFileCheckBoxs[i].onclick=function()
		{
			if(this.checked==false)
			{
				this.checked=true;
			}
			else
			{
				this.checked=false;
			}
		}
	}
	
	
	for(var i=0; i<aFileCheckBoxLis.length;i++)//给每个LI赋与复选框相同的点击事件
	{
		aFileCheckBoxLis[i].index=i;
		aFileCheckBoxLis[i].onclick=function()
		{
		
			if(aFileCheckBoxs[this.index].checked==false)
			{
				aFileCheckBoxs[this.index].checked=true;
			}
			else
			{
				aFileCheckBoxs[this.index].checked=false;
			}
		}
	}
	
	oCheckAll.onclick=function()//全选
	{
		
		
			for(var i=0; i<aFileCheckBoxs.length;i++)
			{
				aFileCheckBoxs[i].checked=true;
			}
			
		
	}
	oCancelAllCheck.onclick=function()
	{
		for(var i=0; i<aFileCheckBoxs.length;i++)
			{
				aFileCheckBoxs[i].checked=false;
			}
			
	}
	oSelectOthers.onclick=function()//反选
	{
		for(var i=0; i<aFileCheckBoxs.length;i++)
		{
			
			if(aFileCheckBoxs[i].checked==true)
			{
				aFileCheckBoxs[i].checked=false;
			}
			else
			{
				aFileCheckBoxs[i].checked=true;	
			}
		}
	}
	var download=document.getElementById("downloadit");
	download.onclick=function(){
	document.downloadForm.submit();
	}
	
	var error=document.getElementById("error").value;
	 if(error==""||error==null){
	       
	 }else{
	  alert(error);
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
    <a href="userAction_academyList">竞赛报名</a>
    <a href="#">教研活动</a>
    <a href="courseAction_addDownload">下载入口</a>
    <a href="#" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<div class="content">
	<h1><a class="active" href="courseAction_addDownload_homework">课后作业</a>
        <a  href="courseAction_addDownload_ppt">电子课件</a>
    </h1>
	<div class="download_top_bar">
    	<div  class="basic_info">
      
       	全部文件（共100个）
      	
        </div>
       
        <div class="tool_bar">
        	<div class="left_bar">
            	<input type="button" class="check_all" id="checkAll" value="全选"  />
             	<input type="button" id="cancelAllCheck" value="取消选择" />
                <input type="button" id="select_others" value="反选"/>
                <input type="button" id="downloadit" value="下载"/>
            </div>
            <div class="mid_bar">
            	文件大小
            </div>
            <div class="right_bar">
            	上传日期
            </div>
        </div>
    </div>
     <s:form name="downloadForm" id="downloadForm" action="courseAction_download" method="post">
     <input type="hidden" id="error" value="${error}"/>
    <div class="file_area">
    	<div class="file_area_content">
    	<s:iterator id="gz" value="videoesList"> 
    		<li>
            	<div class="file_left"><input type="checkbox" name="fileName" value="${gz.otherName}"/> ${gz.otherName}</div>
                <div class="file_mid">${gz.length}</div>
                <div class="file_right">${gz.time}</div>
            </li>
         </s:iterator>
        </div>
    </div>
    </s:form>
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
