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
    
    <title>视频管理</title>
    <STYLE type="text/css">
    table{position:relative;margin-top:100px;}
    strong{position:absolute;left:460px;top:30px;}
    #title_research{position:absolute;left:400px;top:60px;}
    #research_button{position:absolute;left:560px;top:60px;}
    #toolBar{position:absolute;top:290px;left:310px;}
    #sousuo{position:absolute;top:60px;	left:400px;}
    #delete{position:absolute;top:70px;	}
    </STYLE>
  
	
<script type="text/javascript" src="js/common.js"></script>
  </head>
  
  <body>
  <strong>视频管理</strong>
   <form action="resourceAction_videobatchDelete" method="post">
   <div id="delete">
  <s:select name="cid" id="resource_title" list="#CourseList" 
													listKey="id" listValue="name" />
  <input type="submit" id="batch" value="批量删除">
  </div>
	</form>
  <s:form name="videoForm" id="videoForm" action="resourceAction_videoManage" method="post">
    <s:hidden id="pageSize" name="pageSize" value='8'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
	<div id="sousuo">
  <s:select list="#CourseList" listKey="id" listValue="name" name="cid"></s:select>
  <input type="submit" value="查询"/>
  </div>
   <table width="100%" border="0" cellpadding="1" cellspacing="1" align="center">
  <tr bgcolor="#ccccff" align="center">
    <td width="13%">ID</td>
    <td width="43%">视频名称</td>
    <td width="23%">操作</td>
  </tr>
  <s:iterator id="ex" value="videoList">
  <tr bgcolor="#ccccff" align="center">
    <td>${ex.id}</td>
    <td>${ex.name}</td>
    <td><s:a action="resourceAction_deletevideo?videoId=%{id}">删除</s:a></td>
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
						document.getElementById("videoForm").submit();
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
