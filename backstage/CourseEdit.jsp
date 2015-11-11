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
    
    <title>编辑查看</title>
    <style type="text/css">
    
    .div1{width:120px;float:left;height:140px;border:2px solid #ccc;}
  	img{width:120px;height:140px;}
   #imgtitile a{margin-left:20px;}
    </style>
	
<script type="text/javascript" src="js/common.js"></script>
  </head>
  
  <body>
  
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center">
  <tr bgcolor="#ccccff">
    <td colspan="2" align="center"><strong>编辑查看</strong></td>
  </tr>
  <tr bgcolor="#ccccff">
    <td width="10%">课程名称</td>
    <td><label for="textfield3"></label>
    <input name="textfield" type="text" id="textfield3" size="30" value="${course.name}"/></td>
  </tr>
  <tr bgcolor="#ccccff">
    <td height="98">课程介绍</td>
    <td>&nbsp;&nbsp;${course.introductContent}</td>
  </tr>
  <tr bgcolor="#ccccff">
    <td height="200" colspan="2" id="img"><div class="div1"><a href="javascript:jump('教学大纲','1',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/processres/cover/2013/8/27/ff808081-4071e2f6-0140-bf317b58-0c66.jpg" />
				</a>
				<div id="imgtitile"><a>教学大纲</a></div>
		</div>
		<div class="div1">
					<a href="javascript:jump('实验大纲','3',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/5/ff808081-3b65fb58-013b-69f9eb2a-1145.jpg" />
					</a>
					<div id="imgtitile"><a>实验大纲</a></div>
		</div>
		<div class="div1">
						<a href="javascript:jump('考试大纲','2',${course.id},780,550);"><img  src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/6/ff808081-3b65fbac-013b-6b4b8314-1722.jpg" />
						</a>
						<div id="imgtitile" ><a>考试大纲</a></div>
		</div>
			<div class="div1">
					<a href="javascript:jump('成绩评定','5',${course.id},780,550);"><img src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/5/ff808081-3b68fd0f-013b-6ad3ab42-087a.jpg" />
					</a>
					<div id="imgtitile" ><a>成绩评定</a></div>
					</div>
			<div class="div1">
					<a href="javascript:jump('教学日历','4',${course.id},780,550);"><img src="http://file1.icourses.cn/process4/campus/doc2swf//cover/2012/12/5/ff808081-3b68fd0f-013b-6ad3ab42-087a.jpg" />
					</a>
					<div id="imgtitile" ><a>教学日历</a></div>
		</div>
		</td>
  </tr>
  <tr bgcolor="#ccccff">
    <td height="99">编辑推荐</td>
    <td>&nbsp;&nbsp;${course.editRecommend}</td>
  </tr>
  <tr bgcolor="#ccccff">
    <td height="88">获奖情况</td>
    <td>${course.winCondiction}</td>
  </tr>
  <tr bgcolor="#ccccff">
    <td height="88">团队介绍</td>
    <td>${course.teamIntroduct}</td>
  </tr>
 
</table>
  </body>
</html>
