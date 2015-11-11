<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>C语言程序设计</title>
		<link type="text/css" href="style/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="style/course_page.css" />
		<script type="text/javascript" src="js/common.js">
		<script type='text/javascript'src="<s:url value='/dwr/util.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/engine.js'/>"></script>  
 <script type='text/javascript' src="<s:url value='/dwr/interface/preCourseAction.js'/>"></script>  
</script>
	<style type="text/css">
      /*导航部分*/
    nav {
        height: 54px;
        background: #fff;
        width: 980px;
        margin: 2px auto;
        z-index: 1;
    }


    nav a {
        display: block;
        height: 54px;
        line-height: 54px;
        width: 122.5px;
        text-align: center;
        float: left;
        border-right: 1px solid #dfdfdf;
        color: #a1a1a1;
        font-size: 16px;
        font-family: "微软雅黑";
    }

    nav a:hover, .active {
        text-decoration: none;
        background: #01c675;
        border-bottom: 4px #00a05e solid;
        height: 54px;
        color: #fff;
    }
    button{font-family: "微软雅黑";}
    .glyphicon{margin-right: 5px;}
    /*模态框样式*/
    .modal .modal-dialog {

        margin: 175px auto;
        margin-left: 400px;
        width: 500px;
    }

    .modal-title {
        font-size: 20px;
        font-family: "微软雅黑";
    }
    .modal-title {
        color: #01c675;
        font-size: 20px;
        font-family: "微软雅黑";
    }
    .modal-body{padding:20px 60px;}
    .modal-body ul li a {
        color: #666;
        text-decoration: none;
        font-size: 16px;
        font-family: "微软雅黑";
        margin-bottom: 10px;
    }

    .modal-body ul li a:hover {
        color: #01c675;
    }


</style>

	</head>

	<body>
		<header>
		<img id="logo" src="images/logo_grey.png" alt="logo" width="350"
			height="80" />
		</header>
		<nav id="cnav">
		<a href="index.jsp">平台主页</a>
		<a href="#">课程简介</a>
		<a href="teachTeamAction_addUI?courseid=${course.id}">师资队伍</a>
		<a href="#">教学评价</a>
		<a href="courseAction_enterCourse?courseid=${course.id}">教学单元</a>
		<a href="#">实践项目</a>
		<a href="homeworkUploadAction_addTeacherList">作业提交</a>
		<a href="forumAction_list">在线互动</a>
		</nav>
		<div class="content">
			<div class="course_introduce">
				<div class="img">
					<img src="images/course_img/c_img_big.png" width="310" height="230" />
				</div>
				<h1>
				${course.name}
				</h1>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;${course.introductContent}
				</p>
				<a href="courseAction_enterCourse?courseid=${course.id}">在线学习</a>
				<a href="forumAction_list">进入互动</a>
			</div>

			<s:form name="chapterForm" id="chapterForm"
				action="courseAction_ChapterList?courseid=%{course.id}" method="post">
				<s:hidden id="pageSize" name="pageSize" value='6' />
				<s:hidden id="totalCount" name="totalCount" value='' />
				<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1" />

				<div class="course_point">
					<h1>
						反转课堂
					</h1>
					<ul id="course_point_select">
						<s:iterator id="gz" value="ChapterVector">
							<a   onclick="getPre(${gz.id})" data-toggle="modal" data-target="#text-inputer"><span></span>${gz.title}</a>
							
						</s:iterator>
					</ul>


					<div class="toolbar">
						<s:if test="toolBar.pageCount > 0">
						 <s:if test="toolBar.pageIndex > 1">
								<a class="pre" href='javascript:jumping(<s:property value='toolBar.previousPage'/>)'></a>
							</s:if>
							<s:else>
								<span class="span"><a class="pre"></a>
								</span>
							</s:else>
							<s:bean name="org.apache.struts2.util.Counter" id="counter">
								<s:param name="first" value="1" />
								<s:param name="last" value="toolBar.pageCount" />
								<s:iterator>
									<a href="javascript:jumping(<s:property/>)" class="active"><s:property />
									</a>
								</s:iterator>
							</s:bean>
					<s:if test="toolBar.pageIndex == toolBar.pageCount || toolBar.pageIndex == 0">
								<span class="span"><a class="next"></a>
								</span>
							</s:if>
							<s:else>
								<a class="next"
									href='javascript:jumping(<s:property value='toolBar.nextPage'/>)'>
								</a>
					</s:else>
       	</s:if>
					</div><!--

					<div class="item1">
						<span></span>
						<ul>
							<a href="javascript:void(0)">C语言的历史</a>
							<a href="javascript:void(0)">C语言的地位</a>
							<a href="javascript:void(0)">C语言的趋势</a>
							<a href="javascript:void(0)">C语言的未来</a>
						</ul>
					</div>
				--></div>
				
					<script language="javascript">
function jumping(pageIndex) {
	document.getElementById("pageIndex1").value = pageIndex;
	document.getElementById("chapterForm").submit();
}
</script>
				
			</s:form>
			<div class="course_source">
				<div class="course_source_items">
					<h2>
						教学档案
					</h2>
					<span><strong class="teaching_archives"></strong>
					</span>
					<ul>
						<a href="javascript:jump('教学大纲','1',${course.id},780,550);">教学大纲</a>
						<a href="javascript:jump('教学日历','4',${course.id},780,550);">教学日历</a>
						<a href="javascript:void(0);">教学计划</a>
						<a href="javascript:jump('教学日历','2',${course.id},780,550);">考试大纲</a>
						<a href="javascript:jump('成绩评定','',${course.id},780,550);">成绩评定</a>
						<a href="javascript:void(0);">考试安排</a>
					
						<a href="javascript:jump('教学日历','3',${course.id},780,550);">实验大纲</a>
					
					</ul>
				</div>

				<div class="course_source_items">
					<h2>
						在线学习
					</h2>
					<span><strong class="online_study"></strong>
					</span>
					<ul>
						<a href="downloadResourceAction_addUI?downloadId=1&&courseid=${course.id}">教学教案</a>
						<a href="downloadResourceAction_addUI?downloadId=2&&courseid=${course.id}">电子课件</a>
						<a href="downloadResourceAction_addUI?downloadId=3&&courseid=${course.id}">重点难点</a>
						<a href="courseAction_enterVideoPage?courseid=${course.id}">课程视频</a>
						<a href="javascript:void(0);">电子教材</a>
						<a href="resourceAction_courseResource?courseid=${course.id}&&grade=4">实验指导</a>
						<a href="resourceAction_courseResource?courseid=${course.id}&&grade=3">案例学习</a>
	                    <a href="resourceAction_courseResource?courseid=${course.id}&&grade=1">习题库</a>
						<a href="resourceAction_courseResource?courseid=${course.id}&&grade=2">试题库</a>
					</ul>
				</div>

				<div class="course_source_items">
					<h2>
						碎片学习
					</h2>
					<span><strong class="fragment_study"></strong>
					</span>
					<ul>
						<a href="knowledgeAction_list?courseid=${course.id}">微知识</a>
						<a href="javascript:void(0);">微视频</a>
					
						<a href="javascript:void(0);">错误分析</a>
                       
					</ul>
				</div>

				<div class="course_source_items">
					<h2>
						实践园地
					</h2>
					<span><strong class="practice_study"></strong>
					</span>
					<ul>
						<a href="javascript:void(0);">实训项目</a>
						<a href="http://www.jxustoj.tk/">OJ系统</a>
						<a href="http://acm.hdu.edu.cn/">ACM竞赛</a>
						<a href="javascript:void(0);">程序互评</a>

					</ul>
				</div>

				<div class="course_source_items">
					<h2>
						辅助系统
					</h2>
					<span><strong class="auxiliary_system"></strong>
					</span>
					<ul>
						<a href="questionAction_addList?courseid=${course.id}">在线测试</a>
						 <a href="userAction_academyList">竞赛报名</a>
						<a href="javascript:void(0);">腾云优课</a>
						  <a href="forumAction_list">互动平台</a>
					</ul>
				</div>

			</div>
		</div>
		<footer>
		<div class="footer_link">
			<a href="javascript:void(0);">加入收藏</a><a href="javascript:void(0);">进入后台</a>
		</div>
		<p>
			Copyright© 2011 江西理工大学.All Rights Reserved.
			<br />
			学校地址：江西省赣州市红旗大道86号 邮编：341000
			<br />
			制作维护： 江西理工大学信息学院333工作室 Email：517821485@qq.com
			<br />


		</p>
		</footer>
<!-- 点击弹出Modal -->
<div class="modal fade" id="text-inputer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">本章要点</h4>
            </div>
            <form class="text-form">
                <div class="modal-body">
                    <ul id="ui"><!--
                        <li><a href="#">第一节 C语言的历史</a></li>
                        <li><a href="#">第一节 C语言的历史</a></li>
                        <li><a href="#">第一节 C语言的历史</a></li>
                        <li><a href="#">第一节 C语言的历史</a></li>
                        <li><a href="#">第一节 C语言的历史</a></li>

                    --></ul>
                </div>
                <div class="modal-footer">

                    <button id="text-form-reset" type="reset" data-dismiss="modal" aria-label="Close" class="btn btn-default pull-right"><span class="glyphicon glyphicon-repeat"></span>返回</button>

                </div>
            </form>
        </div>
    </div>
</div>
	</body>
	<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script>

	function getPre(id){
		alert(id);
			preCourseAction.prelist(id,getChapter_callback);  
	}
		function getChapter_callback(data){
		$("li").remove(); 
		 for(var i=0;i<data.length;i++)  
  {  
	$("#ui").append("<li>"+(i+1)+"  "+data[i].preknowledge+"</li>")
  }
		}
	
		

</script>
</html>
