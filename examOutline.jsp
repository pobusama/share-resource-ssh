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
<title>教学档案</title>
<link type="text/css" rel="stylesheet" href="style/teaching_archives.css" />
<script type="text/javascript" src="js/common.js"></script>
<script>
window.onload=function()
{
		var oLeft=document.getElementsByClassName('left')[0];//左区域
		var aLists=oLeft.getElementsByTagName('a');//左区域的选项
		var oMain=document.getElementsByClassName('main')[0];//右主区域
		var aTextAreas=oMain.getElementsByClassName('text_area');//右区域的文档区
		aTextAreas[0].style.zIndex=1;//初始让0号文档区显示
		for(var i=0;i<aLists.length;i++)
		{
			aLists[i].index=i;
			aLists[i].onclick=function()
			{
				for(var i=0;i<aLists.length;i++)
				{
					aLists[i].className='';
					aTextAreas[i].style.zIndex=0;
				}
					
				this.className='active';
				aTextAreas[this.index].style.zIndex=1;
			}
		}
		
}
</script>
</head>

<body>
<header><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
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
<div class="content">
	<div class="left">
    	<ul>
    	<s:iterator id="gz" value="courseList">
        	<a class="active" href="javascript:void(0);">${gz.name}</a>
           </s:iterator>
        </ul>
    </div>
      <div class="main">
    	<s:iterator id="gz"  value="courseList">
        <div class="text_area"> <s:if test="#gz.examOutline==null"><s:fielderror name="Errors"/></s:if>
        
        <s:else><object width="700" height="600">  
            <param name="flashvars"></param>  
            <param name="allowFullScreen" value="true"></param>  
            <param name="allowscriptaccess" value="always"></param>  
            <embed src="outline/${gz.examOutline}"  menu="true" loop="true" play="true"    
                allowscriptaccess="always" allowfullscreen="true" width="700" height="600"> </embed>  
        </object> </s:else> </div>
        </s:iterator>
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
