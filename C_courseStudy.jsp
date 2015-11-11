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
    
  <title>课程学习</title>
<link type="text/css" rel="stylesheet" href="style/coursestudy.css" />
<script type="text/javascript" src="js/common.js"></script>
<script>
function switchVideo(videoId,courseid)
{
  
  window.location.href="courseAction_switchVideo?videoId="+videoId+"&&courseid="+courseid;
  
}
window.onload=function()
{
	var oList1=document.getElementById('list_1');
	var aList1Lis=oList1.getElementsByTagName('li');//定义课程列表
	
	var aList1LiHoverPages=new Array();//定义课程列表所包含的鼠标悬浮框
	
	for(var i=0;i<aList1Lis.length;i++)
	{
		aList1LiHoverPages[i]=aList1Lis[i].getElementsByClassName('hover_div')[0];
	}
	
	for(var i=0;i<aList1Lis.length;i++)
	{
		aList1LiHoverPages[i].style.display='none';
		aList1Lis[i].index=i;
		aList1Lis[i].onmouseover=function()
		{
			aList1LiHoverPages[this.index].style.display='block';
		}
		aList1Lis[i].onmouseout=function()
		{
			aList1LiHoverPages[this.index].style.display='none';
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
    <a href="#">实践项目</a>
    <a href="#">作业提交</a>
   <a href="#">在线互动</a>
</nav>
<div class="content">
	<div class="course_introduce">
    	<div class="boutique"><img src="images/jingping.png" width="55" height="50" /></div>
    	<div class="img"><img src="images/course_img/c_img_big.png"  width="310" height="230" /></div>
        <div class="middle_content">
        	<h1>${course.name}</h1>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             ${course.introductContent}
            </p>
            
        
        </div>
        <ul class="right_content">
        	<li><strong>课程学时：</strong>${course.time}</li>
            <li><strong>学科门类：</strong>工学</li>
            <li><strong>专业门类：</strong>计算机类</li>
            <li><strong>主负责人：</strong>胡春安</li>
            <li><strong>课程类型：</strong>理论课</li>	
            <li><strong>课程属性：</strong>${course.courseAttr}</li>
            <li><strong>所属学校：</strong>江西理工大学</li>	
            <div class="link_btn">
                <a href="courseAction_enterVideoPage?courseid=${courseid}" class="no_margin_left">视频学习</a>
                <a href="javascript:void(0)">互动讨论</a>
            </div>
            
        </ul>
    	
    </div>
    
    <div class="course_introduce_detail">
    	<h1>课程介绍</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        ${course.editRecommend}
        <a href="javascript:void(0);">查看全部介绍</a> 
        </p>
        <div class="document_link">
        	<li><a href="javascript:jump('教学大纲','1',${courseid},780,550);" class="doc_img"><img src="images/course_img/doc_sample.jpg" width="110" height="80" /></a><a href="#">课程大纲</a></li>
            <li><a href="javascript:jump('教学日历','4',${courseid},780,550);" class="doc_img"><img src="images/course_img/doc_sample.jpg" width="110" height="80" /></a><a href="#">教学日历</a></li>
            <li><a href="javascript:jump('成绩评定','5',${courseid},780,550);" class="doc_img"><img src="images/course_img/doc_sample.jpg" width="110" height="80" /></a><a href="#">考评方式与标准</a></li>
            <li><a href="javascript:jump('教学大纲','1',${courseid},780,550);" class="doc_img"><img src="images/course_img/doc_sample.jpg" width="110" height="80" /></a><a href="#">学习指南</a></li>
        </div>
    	
    </div>
    <div class="course_unit">
    	<div class="left">
            <h1>教学单元</h1>
            <ul>
                <div class="list_1" id="list_1">
                <s:iterator id="gz" value="chapterList" status="st">
                    <li id="chapterList_${st.index}">${gz.title}
                    <div class="hover_div">
                    <s:iterator id="sr" value="videoList">
                    <s:if test="#sr.chapter==#gz.title">
                   <a href="javascript:switchVideo(${sr.id},${courseid});">${sr.name}</a>
                    </s:if>
                    </s:iterator>
                    </div>
                    </li>
                </s:iterator>   
                </div>
            </ul>
        </div>
        <div class="right">
        	<a href="#">教学团队>></a>
        	<h1>课程负责人</h1>
            <img src="images/teachers/${TeamManager.self_photo}" alt="教师照片" width="140" height="200"  />
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	<strong>姓</strong>名：${TeamManager.teacherName}
               ${TeamManager.evaluate}
			</p>
         </div>
         <ul class="text_book">
            	<li>
                	<img src="images/book/book1.jpg" /><h1>主教材</h1>
                	<p>
                    C语言程序设计（第2版）<br />
					ISBN：978-7-04-037704-0<br />
					主编：苏小红，王宇颖，孙志岗高等教育出版社
                    </p>
                </li>
                <li>
                	<img src="images/book/book2.jpg" /><h1>主教材</h1>
                	<p>
                    C语言大学实用教程（第3版）<br />
					ISBN：978-7-121-16514-6<br />
					主编：苏小红，孙志岗，陈惠鹏电子工业出版社
                    </p>
                </li>
                <li>
                	<img src="../images/book/book1.jpg" /><h1>主教材</h1>
                	<p>
                    C语言程序设计（第2版）<br />
					ISBN：978-7-04-037704-0<br />
					主编：苏小红，王宇颖，孙志岗高等教育出版社
                    </p>
                </li>
               
                
          </ul>
     </div>
    	
        
        	
        
    	
    


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
</html>
