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
    
    <title>修改题目</title>
   <style>
   #title{font-size:16px;font-weight: 600;font-family:"微软雅黑";}
   #tip{color:red;}
    #submit{font-weight:300;font-size:16px;font-family:"微软雅黑";color:white;background:#1B7EB8;border-radius: 3px 3px 3px 3px;border:0;}
   </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <s:form id="updateForm" name="updateForm" action="questionAction_updateQuestion?updateId=%{updateId}" method="post">
   <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#569BAA">
  <tr>
    <td colspan="2" id="title" align="center">题目修改</td>
  </tr>
  <tr>
    <td width="12%">题目：</td>
    <td width="88%"><input type="text" name="question.question" size="80" value="${question.question}"/></td>
  </tr>
  <tr>
    <td>选项A：</td>
    <td><input type="text" name="question.option_A" size="50" value="${question.option_A}"/></td>
  </tr>
  <tr>
    <td>选项B：</td>
    <td><input type="text" name="question.option_B" size="50" value="${question.option_B}"/></td>
  </tr>
  <tr>
    <td>选项C：</td>
    <td><input type="text" name="question.option_C" size="50" value="${question.option_C}"/></td>
  </tr>
  <tr>
    <td>选项D：</td>
    <td><input type="text" name="question.option_D" size="50" value="${question.option_D}"/></td>
  </tr>
  <tr>
    <td>题目类型：</td>
    <td colspan="4"><select name="question.questionType" id="questionType">
    <option value=1>1</option>
    <option value=2>2</option>
    <option value=3>3</option>
    </select></td>
  </tr>
  <tr>
    <td>正确答案：</td>
    <td><select name="question.answer" id="questionAnswer">
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
    <option value="是">是</option>
    <option value="否">否</option>
    </select></td>
  </tr>
  <tr>
    <td>执行修改：</td>
    <td><input type="submit" name="submit" id="submit" value="执行修改"/></td>
  </tr>
   <tr>
    <td colspan="5" id="tip">友情提示：一、判断题可不需要添选项。</br>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;  二、题目类型： 1、单选题，2、多选题，3、判断题</br>
                                                                            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;   三、判断题正确答案请用 1、是，2、否，的格式                                                  </td>
  </tr>
</table>
</s:form>
  </body>
  <script type="text/javascript">
   document.getElementById("questionType").value="${question.questionType}";
   	document.getElementById("questionType")[${question.questionType}-1].selected= true;
   	var oanswer=document.getElementById("questionAnswer");
   oanswer.value="${question.answer}";
  var doption= oanswer.getElementsByTagName('option');
   for(var i=0;i<doption.length;i++){
   if(doption[i].value==oanswer.value){
   	document.getElementById("questionAnswer")[i].selected= true;
   	}
   	}
  </script>
</html>
