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
   <title>视频课程</title>
<link rel="stylesheet" type="text/css"  href="style/vediopage.css" />
 <link href="video-js/video-js.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
 <script src="video-js/video.js"></script>
<script>
/*$(function(){
   alert();
   $(".preview_container a").click(function switchVideo(url){
  
    alert(url);
    $("#resource").attr({
    src:"images/"+url;
    });
   });
   
   });*/
  
    videojs.options.flash.swf = "video-js/video-js.swf";
    
  </script>
<script>
   function switchVideo(VideoId,courseid){
   window.location.href="courseAction_switchVideo?videoId="+VideoId+"&&courseid="+courseid;
  
   
   
   }
window.onload=function()
{
	var oPre_btn=document.getElementsByClassName('pre')[0];
	var oNext_btn=document.getElementsByClassName('next')[0];
	var oPreviewContainer=document.getElementsByClassName('preview_container')[0];
	 
	var aPieviewLis=oPreviewContainer.getElementsByTagName('li');
	oPreviewContainer.style.width=aPieviewLis.length*200+'px';
	oNext_btn.onclick=function()//视频预览菜单下一页
	{
		var left1=oPreviewContainer.offsetLeft;
		var width1=aPieviewLis.length*200;
		//var maxLength= aPieviewLis.length;
		var maxLeft=width1-800;
		
		
		if(left1!=-maxLeft&&left1%200==0)
		{
			left1-=200; 
			
			startMove(oPreviewContainer,{left:left1});
		}
		
		
		
	}

	oPre_btn.onclick=function()
	{
		var left1=oPreviewContainer.offsetLeft;
		var width1=oPreviewContainer.offsetWidth;
		if(left1!=0&&left1%200==0)
		{
			left1+=200;
			
			startMove(oPreviewContainer,{left:left1});
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
	<h1>${course.name} ${videot.name}</h1>
	<div class="player">
      <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="768" height="584"
      data-setup="{}">
    <source src="images/${videot.title}" type='video/mp4' id="resource"/>
    <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
    <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <p class="vjs-no-js">要浏览此视频请勿禁用javascript,或者升级您的浏览器<a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
  </video>
  </div>
     <div class="prewview_surround">
     	<div class="pre_view">
            <div class="pre"><a href="javascript:void(0);"><img src="images/pre.png" /></a></div>
                <div class="preview_container">
                <s:iterator id="gz_video" value="videoList">
                    <li><a  href="javascript:switchVideo('${gz_video.id}',${courseid});" title="${gz_video.name}"><img src="images/vedio_preview/sample1.jpg"  width="140" height="90" /></a><a href="#">${gz_video.name}</a></li>
                </s:iterator>   
                </div>
            <div class="next"><a href="javascript:void(0);"><img src="images/next.png" /></a></div>
     	</div>
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
