<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线测试题目管理</title>
 <style>
          #table_title{font-family:"微软雅黑";font-weight:600;text-align:center;}
 table, td, tr{border: 1px solid #7EC0E5;font-size:14px;}
 #content{ background: #f3f3f3;}
          table tr td{font-size:12px;}
 #sousuo{height:30px;line-height:30px;margin:20px 0 0 400px;}
 #toolBar{margin-left:300px;}
 body{position:relative;}
 #delete{position:absolute;top:10px;}
 </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
window.onload=function(){
document.getElementById("submit").onclick=function(){
  document.questionManageForm.submit();
}
}
</script>
  </head>
  
  <body>
  <form action="questionAction_questionbatchDelete" method="post">
   <div id="delete">
  <s:select name="courseid" id="resource_title" list="#courseNameList" 
													listKey="id" listValue="name" />
  <input type="submit" id="batch" value="批量删除">
  </div>
  </form>
  <s:form id="questionManageForm" name="questionManageForm" action="questionAction_questionManage" method="post">
    <s:hidden id="pageSize" name="pageSize" value='5'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
	
	<div id="sousuo">
	<s:select name="nameList" list="#courseNameList" listKey="name" listValue="name" headerKey="0" headerValue="----请选择课程----"/><input type="submit" id="button" value="搜索"/>
   </div>  
   <table width="100%" border="1" cellspacing="1" cellpadding="1"  id="table">
  <tr align="center" id="table_title" bgcolor="#4097D1">
    <td width="4%">id</td>
    <td width="23%">题目</td>
    <td width="17%">选项A</td>
    <td width="17%">选项B</td>
    <td width="18%">选项C</td>
    <td width="18%">选项D</td>
    <td width="5%">正确答案</td>
    <td width="7%">修改</td>
    <td width="7%">删除</td>
  </tr>
 <s:iterator  id="gz" value="questionsList">
  <tr id="content">
    <td>${gz.id}</td>
    <td>${gz.question}</td>
    <td>${gz.option_A}</td>
    <td>${gz.option_B}</td>
    <td>${gz.option_C}</td>
    <td>${gz.option_D}</td>
    <td>${gz.answer}</td>
    <td><s:a action="questionAction_questionEdit?updateId=%{id}">修改</s:a></td>
    <td><s:a action="questionAction_questionDelete?updateId=%{id}">删除</s:a></td>
  </tr>
  </s:iterator>
</table>

 <div id="toolBar">
					<s:if test="toolBar.pageCount > 0">
					<s:if test="toolBar.pageIndex > 1"><a href='javascript:jumping(1)'>首页</a></s:if><s:else><span class="span">首页</span></s:else>&nbsp;&nbsp;
					<s:if test="toolBar.pageIndex > 1"><a href='javascript:jumping(<s:property value='toolBar.previousPage'/>)'>上一页</a></s:if><s:else><span class="span">上一页</span></s:else>&nbsp;&nbsp;
					<s:if test="toolBar.pageIndex == toolBar.pageCount || toolBar.pageIndex == 0"><span class="span">下一页</span></s:if>
					<s:else><a href='javascript:jumping(<s:property value='toolBar.nextPage'/>)'>下一页</a></s:else>&nbsp;&nbsp;
					<s:if test="toolBar.pageIndex == toolBar.pageCount || toolBar.pageIndex == 0"><span class="span">末页</span></s:if>
					<s:else><a href='javascript:jumping(<s:property value='toolBar.pageCount'/>)'>末页</a></s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					 转到:
					<s:bean name="org.apache.struts2.util.Counter" id="counter">
					   	<s:param name="first" value="1" />
					   	<s:param name="last" value="toolBar.pageCount" />
					  	<select name="select" onchange="self.location.href=this.options[this.selectedIndex].value">
						   	<s:iterator>
						     	<option value="javascript:jumping(<s:property/>)" 
									<s:if test="toolBar.pageIndex == current-1">selected</s:if> >
									第  <s:property/> 页
								</option>
						   	</s:iterator>
						</select>
					</s:bean>
				</s:if>
				
				<script language="javascript">
					function jumping(pageIndex){
						document.getElementById("pageIndex1").value=pageIndex;
						document.getElementById("questionManageForm").submit();
					
						
				   	}
			    </script>
</div> 
			
			

</s:form>
  </body>
  <script type="text/javascript">
  var obatch=document.getElementById("batch");
  obatch.onclick=function(){
  var msg="删除不可恢复，你确认要删除吗？";
  if(confirm(msg)){
  return true;
  }else{
  return false;
  }
  
  }
  </script>
</html>
