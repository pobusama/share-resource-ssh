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
    
    <title>课程资源管理</title>
    <STYLE type="text/css">
    table{position:relative;margin-top:10px;}
    strong{position:absolute;left:480px;top:30px;}
  
    #toolBar{position:absolute;top:240px;left:280px;}
    #title_div{text-align: center;}
    #title_select{margin-top:80px;}
    #batch{position:absolute;top:90px;margin-left:150px;}
    #resource_title{position:absolute;top:90px;}
    </STYLE>
		
<script type="text/javascript" src="js/common.js"></script>

  </head>
  
  <body>
  <s:if test="#request.grade==1">
  <strong>教学教改管理</strong>
  </s:if><s:elseif test="#request.grade==2">
   <strong>教学课件管理</strong>
  </s:elseif><s:else>
  <strong>重点难点管理</strong>
  </s:else>
  
  <form action="downloadResourceAction_resourcebatchDelete?grade=${grade}" method="post">
  <s:select name="cid" id="resource_title" list="#CourseList" 
													listKey="id" listValue="name" />
  <input type="submit" id="batch" value="批量删除">
	</form>
  <s:form name="resourceForm" id="resourceForm" action="downloadResourceAction_downloadManage?grade=%{grade}" method="post">
    <s:hidden id="pageSize" name="pageSize" value='3'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
	<div id="title_div">
	<select name="downloadSelect" id="title_select">
	<option value="resourceName">按资源名查找</option>
	<option value="courseName">按课程查找</option>
	</select>
  <s:textfield name="downloadResource.input_search" id="title_research" />
   <input type="submit" name="research_button" id="research_button" value="搜索"/>
   </div>
   <table width="100%" border="0" cellpadding="1" cellspacing="1" align="center">
  <tr bgcolor="#ccccff" align="center">
    <td width="13%">ID</td>
    <td width="23%">资源名</td>
    <td width="20%">所属课程</td>
    <td width="14%">上传时间</td>
    <td width="15%">操作</td>
    <td width="15%">编辑</td>
  </tr>
  <s:iterator id="sr" value="downloadList">
  <tr bgcolor="#ccccff" align="center">
    <td>${sr.id}</td>
    <td>${sr.resourceName}</td>
    <td>${sr.courseName}</td>
    <td>${sr.uploadDate}</td>
    <td><s:a action="downloadResourceAction_deleteResoure?resourceId=%{id}">删除</s:a></td>
    <td><a href="javascript:expand('${sr.resourceURL}','${sr.id}','downloadResourceAction_downloadEdit?resourceId=',780,550)">编辑</a></td>
  </tr>
  </s:iterator>
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
						document.getElementById("resourceForm").submit();
				   	}
			    </script>
			</div> 
</table>
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
