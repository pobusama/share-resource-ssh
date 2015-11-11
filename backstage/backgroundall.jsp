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
<title>后台管理</title>
<link type="text/css" rel="stylesheet" href="style/backgroundall.css" />



</head>

<body>
<header>
	<div class="logo"><img src="images/background_stage_img/logo.png" /></div>
    <ul class=" top_bar">
    <a href="userAction_backLoginout" class="goback">退出</a>
    <a href="#" class="help">帮助</a>
    </ul>
</header>
<input type="hidden" name="dupe" value="true">
<div class="content">
	<div class="left">
    	<div class="root">	
        	<a class="root-link" href="javascript:void(0)" ><span class="bs_manage_ico"></span>后台管理</a>
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)">新闻管理</a>
                <div class="children">
        			<a href="backstage/uploadNews.jsp" target="mainIframe">上传新闻</a>
        			
                    <s:a action="newsAction_list" target="mainIframe" >新闻列表</s:a>
                </div>
        	</div>
            
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >课程管理</a>
                <div class="children">
        			<a href="courseAction_list" target="mainIframe">课程列表</a>
                    <a href="backstage/addCourse.jsp" target="mainIframe">新增课程</a>
                    <a href="backstage/resource_header.jsp" target="mainIframe" >资源上传</a>
                    <a href="backstage/resource_main.jsp" target="mainIframe">资源管理</a>
                    <a href="preCourseAction_addpreUI" target="mainIframe">添加反转课堂知识</a>
                    
                </div>
        	</div>
            
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >在线测试管理</a>
                <div class="children">
        			<a href="questionAction_enterAddQuestion" target="mainIframe">添加题目</a>
                    <a href="questionAction_questionManage" target="mainIframe">题目管理</a>
                </div>
        	</div>
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >团队管理</a>
                <div class="children">
        			<a href="teachTeamAction_addList" target="mainIframe">添加团队成员</a>
                    <a href="teachTeamAction_teamManage" target="mainIframe">师资队伍管理</a>
                    <a href="teachTeamAction_addTeachTopic" target="mainIframe">添加课改课题</a>
                    <a href="teachTeamAction_teachTopicManager" target="mainIframe">课改课题管理</a>
                    <a href="teachTeamAction_addThesisUI" target="mainIframe">添加研究论文</a>
                    <a href="teachTeamAction_thesisManage" target="mainIframe">研究论文管理</a>
                    <a href="teachTeamAction_addMaterialUI" target="mainIframe">添加发表教材</a>
                    <a href="teachTeamAction_materialManage" target="mainIframe">发表教材管理</a>
                    <a href="teachTeamAction_addHonorUI" target="mainIframe">添加获奖情况</a>
                    <a href="teachTeamAction_honorManage" target="mainIframe">获奖情况管理</a>
                </div>
        	</div>
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >学生作业管理</a>
                <div class="children">
                    <a href="homeworkUploadAction_backAddHomework" target="mainIframe">作业管理</a>
                </div>
        	</div>
        	 <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >论坛管理</a>
                <div class="children">
                    <a href="forumAction_forumManage" target="mainIframe">论坛主题管理</a>
                </div>
        	</div>
            <div class="parents">
        		<a class="parents-link" href="javascript:void(0)" >竞赛管理</a>
                <div class="children">
        			<a href="javascript:void(0)" target="mainIframe">竞赛发布</a>
                    <a href="userAction_competitionManage" target="mainIframe">竞赛列表</a>
                    <a href="javascript:void(0)" target="mainIframe">报名数据</a>

                </div>
        	</div>
            
        </div>
        <div class="root">
        	<a class="root-link"  href="javascript:void(0)" ><span class="usr_manage_ico"></span>用户管理</a>
            <ul class="parents">
                <li> <a href="userAction_userManage" target="mainIframe">用户管理</a></li>
            </ul>
        </div>
        <div class="root">
        	<a class="root-link"  href="javascript:void(0)" ><span class="infomation_ico"></span>版权信息</a>
            <div class="parents"></div>
        </div>
    	
    </div>
    <div class="main">
    	<iframe  name="mainIframe" id="mainIframe" src="backstage/backgroundmain.jsp"  style="height: 100%;width:100%;z-index:1000;" frameborder="0" border="0" marginwidth="0" marginheight="0" ></iframe> 
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
$(function(){
	var rootLinks = $(".root-link");
	//控制是否显示的方法	
	function displayChange(div){
		if(div.css("display")==="none")
		{
			div.css("display","block");
		}
		else if(div.css("display")==="block")
		{
			div.css("display","none");
		}
	}
	
	
	rootLinks.each(function(){
		var ths = $(this);
		var parent = ths.parent();
		var otherRootLinks = rootLinks.not(ths);
		var menu = parent.find(".parents");
		var parentLinks=parent.find(".parents-link");
		ths.click(function(){
			displayChange(menu);//点击打开或关闭菜单
			
			//关闭其他未点击菜单
			otherRootLinks.each(function(){
			 var thisParent=$(this).parent();
			 var thisMenu=thisParent.find(".parents");
			 
			 thisMenu.css("display","none");
			 
			});
			
			
			
		
		});
		
		parentLinks.each(function(){
				var thspl = $(this);
				var innerParent = thspl.parent();
				var innerMenu = innerParent.find(".children");
				var otherParentsLinks = parentLinks.not(thspl);
				
				thspl.click(function(){
					displayChange(innerMenu);//点击打开或关闭菜单
					
					//关闭其他未点击菜单
					 otherParentsLinks.each(function(){
					
					 var innerThisParent=$(this).parent();
					 var innerThisMenu=innerThisParent.find(".children");
					 
					 innerThisMenu.css("display","none");
					 
					});
				});
		});
	});
	
});
/*
window.onload=function()
{
	var aLeftSelectRoots=document.getElementsByClassName('root');//左侧列表
	//后台管理模块
	var oBackStageManageBtn=aLeftSelectRoots[0].getElementsByTagName('a')[0];//后台管理按钮
	var aLeftSelectParents=aLeftSelectRoots[0].getElementsByClassName('parents');//后台管理子目录
	var aBackStageManageParentBtns=new Array();//后台管理子目录按钮
	var aLeftSelectChildren=new Array();//后台管理孙子目录
	var aBackStageManageChildrenBtns=new Array();//后台管理孙子目录按钮
	
	
	for(var i=0;i<aLeftSelectParents.length;i++)
	{	
		aBackStageManageParentBtns[i]=aLeftSelectParents[i].getElementsByTagName('a')[0];//后台管理按钮子目录按钮赋值
		aLeftSelectParents[i].style.display='none';//给后台管理按钮子目录按钮赋隐藏值
		
		
	}
	for(var i=0;i<aLeftSelectParents.length;i++)
	{
		aLeftSelectChildren[i]=aLeftSelectParents[i].getElementsByClassName('children')[0];
		aLeftSelectChildren[i].style.display='none';
		
	}
	
	
	oBackStageManageBtn.onclick=function()//后台管理按钮的点击事件
	{
		for( var i=0;i<aLeftSelectParents.length;i++)
		{
			if(aLeftSelectParents[i].style.display=='none')
				aLeftSelectParents[i].style.display='block';
			else
				aLeftSelectParents[i].style.display='none';
		}
		
	}
	
	for(var i=0;i<aBackStageManageParentBtns.length;i++)
	{
			aBackStageManageParentBtns[i].className='';
			
			
			aBackStageManageParentBtns[i].index=i;
			
			aBackStageManageParentBtns[i].onclick=function()//后台管理按钮子目录按钮的点击事件
			{
				
				if(this.className=='active')
				{
					this.className='';
					aLeftSelectChildren[this.index].style.display='none';
				}
				else
				{
					this.className='active';
					aLeftSelectChildren[this.index].style.display='block';
				}
					
				
			}
	}
	//后台管理模块
	//用户管理模块
	var oBackStageManageBtn=aLeftSelectRoots[1].getElementsByTagName('a')[0];//用户管理按钮
	var oLeftSelectUl=aLeftSelectRoots[1].getElementsByTagName('ul')[0];//用户管理按钮子目录
	var aLeftSelectUlLiAs=oLeftSelectUl.getElementsByTagName('a');//用户管理按钮子目录按钮
	oLeftSelectUl.style.display='none';	
	
	oBackStageManageBtn.onclick=function()
	{
		if(oLeftSelectUl.style.display=='block')
		{
			oLeftSelectUl.style.display='none';	
		}
		else
		{
			oLeftSelectUl.style.display='block';
		}
				
	}
	for(var i=0;i<aLeftSelectUlLiAs.length;i++)
	{
		aLeftSelectUlLiAs[i].className='';
		aLeftSelectUlLiAs[i].onclick=function()
		{
			for(var i=0;i<aLeftSelectUlLiAs.length;i++)
				aLeftSelectUlLiAs[i].className='';
			if(this.className=='')
			{
				
				this.className='active';
			}
			else
			{
				this.className='';
			}
			
		}
	}
	var resource_upload=document.getElementById("resource_upload");
	resource_upload.onclick=function(){
	 var resource_up=document.getElementById("resource_up");
	 resource_up.style.display='none';
	 if(resource_up.style.display=='none'){
	    resource_up.style.display='block';
	alert(1);
	 }else{
	    resource_up.style.display='none';
	 }
	
	}
	//用户管理模块
	
	
	
}

*/

</script>
</body>
</html>
