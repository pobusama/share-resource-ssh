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
	<title>在线测试</title>
<link type="text/css" rel="stylesheet" href="style/coursepagecommen.css" />
<link type="text/css" rel="stylesheet" href="style/onlineTest.css"/>
<script type="text/javascript" src="js/common.js"></script>

<script>
window.onload=function()
{
	
	var oJumpPage=document.getElementById('jumppage');
	oJumpPage.onkeyup=function()
	{
		this.value=this.value.replace(/[^\d]/g,'') ;
	};
	oJumpPage.onbeforepast=function()
	{
		this.clipboardData.setData('text',this.clipboardData.getData('text').replace(/[^\d]/g,''))	;
	};
	  var validate=document.getElementById("testsubmit");
    validate.onclick=function(){
    document.getElementById("questionForm").action="questionAction_validateAnswer";
     document.getElementById("questionForm").submit();
     
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

<s:form id="questionForm" name="questionForm" action="questionAction_validateAnswer" method="post" enctype="multipart/form-data">
<s:hidden id="pageSize" name="pageSize" value='5'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>

	<h1>C语言在线测试题</h1>
    <div class="questionbox">
    <p>一、单项选择题（本题共15小题，为单项选择题，每题3分，选错或不选得0分。）</p>
    <s:iterator id="single" value="singleQuestionList" status="st">
    	<li>
    	<input type="hidden" name="questionid" value="${single.id}"/>
        	<p><strong>${st.index+1}</strong>.&nbsp;&nbsp;${single.question}</p>
            <div class="radiobox">
            
            	<input type="radio" id="nba"  name="question.answerS[${single.id}]" rel="${single.id}" value="A">
				<label name="nba" for="nba">A.${single.option_A}</label>
            </div>
            <div class="radiobox">
            	<input type="radio" id="cba" name="question.answerS[${single.id}]" rel="${single.id}" value="B">
				<label name="cba" for="cba">B.${single.option_B}</label>
            </div>
            <div class="radiobox"> 
            	<input type="radio" id="mba"  name="question.answerS[${single.id}]" rel="${single.id}" value="C">
				<label name="mba"  for="mba">C.${single.option_C}</label>
            </div>
            <div class="radiobox"> 
            	<input type="radio" id="bbc"  name="question.answerS[${single.id}]" rel="${single.id}" value="D">
				<label name="bbc"  for="bbc">D.${single.option_D}</label>
            </div>
		 </li>
         </s:iterator>
        
    	
    </div>
    
      <div class="questionbox">
    <p>二、多项项选择题（本题共10小题，为多项项选择题，每题4分，选错、漏选或不选得0分。）</p>
    <s:iterator id="multi" value="multiQuestionList" status="st1">
    	<li>
    	<input type="hidden" name="questionid" value="${multi.id}"/>
        	<p><strong>${st1.index+6}</strong>.&nbsp;&nbsp;${multi.question}</p>
            <div class="radiobox">
            
            	<input type="checkbox" id="nba"  name="question.answerS[${multi.id}]" rel="${multi.id}" value="A">
				<label name="nba" for="nba">A.${multi.option_A}</label>
            </div>
            <div class="radiobox">
            	<input type="checkbox" id="cba" name="question.answerS[${multi.id}]" rel="${multi.id}" value="B">
				<label name="cba" for="cba">B.${multi.option_B}</label>
            </div>
            <div class="radiobox"> 
            	<input type="checkbox" id="mba"  name="question.answerS[${multi.id}]" rel="${multi.id}" value="C">
				<label name="mba"  for="mba">C.${multi.option_C}</label>
            </div>
            <div class="radiobox"> 
            	<input type="checkbox" id="bbc"  name="question.answerS[${multi.id}]" rel="${multi.id}" value="D">
				<label name="bbc"  for="bbc">D.${multi.option_D}</label>
            </div>
		 </li>
         </s:iterator>
        
    	
    </div>
      <div class="questionbox">
    <p>三、判断题（本题共15小题，为判断题，每题1分，选错或不选得0分。）</p>
    <s:iterator id="judgments" value="trueOrFalseList" status="st2">
    	<li>
    	<input type="hidden" name="questionid" value="${judgments.id}"/>
        	<p><strong>${st2.index+11}</strong>.&nbsp;&nbsp;${judgments.question}</p>
            	<a>是：</a><input type="radio" id="nba"  name="question.answerS[${judgments.id}]" rel="${judgments.id}" value="是">
            	<a>否：</a><input type="radio" id="cba" name="question.answerS[${judgments.id}]" rel="${judgments.id}" value="否">
		 </li>
         </s:iterator>
        
    	
    </div>
   
   
    <div class="toolbar">
    	<input id="testsubmit" type="submit" value="提交答案"/>
    </div>
</s:form>
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
