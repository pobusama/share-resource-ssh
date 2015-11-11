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
		<title>热点新闻</title>
		<link type="text/css" rel="stylesheet"
			href="style/teaching_archives.css" />
		<script type="text/javascript" src="js/common.js">
</script>
		<STYLE type="text/css">
#title {
	padding-top: 24px;
	margin-left: 187px;
	height: 30px;
	width: 980px;
	background: white;
}

#title h2 {
	font-size: 18px;
	font-family: YouYuan, "幼圆";
	font-weight: bold;
	text-align: center;
}

#title .h5 {
	font-size: 12px;
	font-family: YouYuan, "幼圆";
	color: gray;
	float: right;
	margin-right: 80px;
	margin-top: 12px;
}

#title .h5 {
	font-size: 12px;
	font-family: YouYuan, "幼圆";
	color: gray;
	float: right;
	margin-right: 80px;
	margin-top: 12px;
}

#news {
	margin-left: 187px;
	padding-top: 40px;
	padding-bottom: 40px;;
	font-size: 12px;
	background: white;
	width: 980px;
}

#nextPage {
	width: 980px;
	height: 60px;
	background: #E3E3E3;
	margin-left: 187px;
	margin-top: 2px;
}

#nextPage span {
	font-size: 14px;
	margin-left: 20px;
}

#nextPage .innerPage {
	padding-top: 12px;
}
</STYLE>
		<script>

</script>
	</head>

	<body>
		<header>
		<img id="logo" src="images/logo_grey.png" alt="logo" width="350"
			height="80" />
		</header>
		<nav id="nav">
		<a href="index.jsp">平台主页</a>
		<a href="#">课程简介</a>
		<a href="#">师资队伍</a>
		<a href="#">教学评价</a>
		<a href="#">教学单元</a>
		<a href="#">实践项目</a>
		<a href="#">作业提交</a>
		<a href="#">在线互动</a>
		</nav>
		<div id="title">
			<h2 align="center">
				${news.title}
			</h2>
			<h5 class="h5">
				发表时间：
				<span class="span1">${news.createTime}</span>
			</h5>
			<h5 class="h5">
				来源/作者：
				<span class="span2">${news.author}</span>
			</h5>
		</div>
		<div id="news">
			<div style="width: 830px; margin-left: 80px;">
				${news.content}
			</div>
		</div>
		<div id="nextPage">

			<s:iterator id="gz" value="previousNews">
				<div class="innerPage">
					<span>上一篇：</span>
					<a href="newsAction_edit?id=${gz.id}">${gz.title}</a>
				</div>
			</s:iterator>
			<s:iterator id="gz" value="nextNews">
				<div class="innerPage">
					<span>下一篇：</span>
					<a href="newsAction_edit?id=${gz.id}">${gz.title}</a>
				</div>
			</s:iterator>
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
	</body>
</html>
