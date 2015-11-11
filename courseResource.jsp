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
    
  <title>资源浏览</title>
<script type="text/jscript" src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="style/pagecommen.css" />
<script type="text/jscript" src="js/common.js"></script>
<style type="text/css">
    /* 教学教案 */
    .content{ background:#fff; height:auto;position:relative;}

    .content h1 a{ cursor:pointer; float:left; height:30px; width:490px;color:#fff; z-index:1; }
    .content h1 .active{cursor:pointer; background:#fff; width:488px;color:#01c675;}
    .download_top_bar{ width:980px; height:77px; padding:0 10px; }
    .basic_info{ width:960px; height:30px; line-height:30px; color:#01c675; font-family:"微软雅黑"; font-size:12px; text-align:right;}
    .tool_bar{ width:938px; height:45px; background:#f7f7f7;color:#666; border:1px solid #ccc; position:relative; padding: 0 30px; line-height:45px; border-radius:5px 0px 0px 5px;  -moz-border-radius:5px; font-family:"微软雅黑"; padding-right:0; }
    .tool_bar .left_bar{ float:left; border-right:1px solid #E5E5E5; width:524px;}
    .tool_bar .right_bar{float:left;padding:0 10px; border-left:1px solid #fff;}

    .file_area{ width:980px; height:450px;overflow-y:auto; overflow-x:hidden; }
    .file_area .file_area_content{ width:940px; height:auto; background:#fff; padding:0 10px;}
    .file_area .file_area_content li{ cursor:pointer;width:960px; height:40px; border-bottom:1px solid #ccc; line-height:40px;}

    .file_area .file_area_content li a{color: #01c675;font-family:"微软雅黑"; font-size:12px; text-decoration: underline;}
    .file_left{ float:left; width:374px; padding-left:11px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis; }
    .file_left input[type="checkbox"]{cursor:pointer; margin-right:4px;}
    .file_right{float:left;margin-left:180px; width: 390px;}
    #download {float:right; margin-top: 5px; border: 1px solid #009e5d; height:30px; background-color:#01c675;  color:#fff; padding:0 10px;font-family:"微软雅黑"; font-size:12px; margin-right:5px;  cursor:pointer;text-decoration: none;}
    #download:hover{ background:#009e5d; }
     #fileView{width:650px;height:450px;border:1px solid #01c675;z-index:5;position:absolute;top:50px;left:150px;background:#ccc;display:none;border-radius:10px;}
     #exit{width:40px;height:20px;brder:1px solid #ccc;position:absolute;top:0px;left:610px;z-index:7;border-radius:10px;background:#BE2D2D;font-family:"微软雅黑";font-size:14px;font-weight:300;color:white;}
     #dialogTitle{width:650px;height:20px;background:#01c675;position:absolute;top:0px;left:0px;z-index:6;border-top-right-radius:10px;border-top-left-radius:10px;}
     #dialogTitle a{margin-left:20px;font-weight:600;font-family: "微软雅黑";font-size:14px;}
     
</style>
<script type="text/javascript">
 
 
 function teachDialog(path,nameId){
  
	alert(path);
	if(nameId==1){
	name='习题库';
	}else if(nameId==2){
	name='试题库';
	}else if(nameId=3){name='案例学习';}
	else{
	name='实验指导';}
 	  $("#fileView").css({
 	  display:"block",
 	  
 	  });
 	  $("#fileView").html("<div id='dialogTitle'><a>"+name+"_"+path+"</a></div><input id='exit' type='button' value='关闭' onclick='test()'/></br></br><object width='650' height='420'>  <param name='flashvars'></param>  <param name='allowFullScreen' value='true'></param>  <param name='allowscriptaccess' value='always'></param>   <embed src='images/"+path+"'  menu='true' loop='true' play='true'     allowscriptaccess='always' allowfullscreen='true' width='650' height='420'> </embed>  </object>");
 	  };
 	  function test(){
  $("#fileView").css({
 	  display:"none",
 	  
 	  });
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
				oSearchBox.style.display='block';
				startMove(oSearchBox,{opacity:100});
			}
			
		else{
				oSearchBox.style.display='none';
				startMove(oSearchBox,{opacity:0});
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
	
	 var ovalue=document.getElementById("error").value;
	 if(ovalue!=""){
	 alert(ovalue);
	 }
	/*
	oCheckAll.onclick=function()
	{
		if(1)
		{}	
	}
	
	
	*/
	
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
    <a href="jingsai.html">竞赛报名</a>
    <a href="#">教研活动</a>
    <a href="#">下载入口</a>
    <a href="#" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<div class="content">
	<h1>
	
  <s:if test="#request.grade==1">习题库</s:if>
  <s:if test="#request.grade==2">试题库</s:if>
  <s:if test="#request.grade==4">实验指导</s:if>
  <s:if test="#request.grade==3">案例学习</s:if>
    </h1>
	<div class="download_top_bar">
    	<div  class="basic_info">
         全部文件（共${count}个）
        </div>
        <div class="tool_bar">
        	<div class="left_bar">
            	文件名称
            </div>

            <div class="right_bar">
            	上传日期
            </div>
        </div>
    </div>
    <div class="file_area">
    	<div class="file_area_content">
    	<input type="hidden" name="error" id="error" value="${error}"/>
    	<s:iterator id="gz" value="reList">
        		<li>
            	<div class="file_left"><a href="javascript:teachDialog('${gz.exercises}',${gz.grade});" class="fileTest">${gz.title}</a></div>
               
                <div class="file_right">${gz.uploadTime}
   
                </div>
               
            </li>
            
           </s:iterator>
        </div>


    </div>
    <div id="fileView">
    
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
