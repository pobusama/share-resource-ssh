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
    
    <title>课程管理</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <STYLE type="text/css">
 table{position:relative;top:20px;}
 h3{margin-left:480px;margin-top:40px;}
 #toolBar{position:absolute;top:250px;left:300px;}
 
 </STYLE>
  </head>
  
  <body>
   <h3>课程管理</h3>
   <s:form name="manageForm" id="manageForm" action="courseAction_list" method="post">
    <s:hidden id="pageSize" name="pageSize" value='6'/>
	<s:hidden id="totalCount" name="totalCount" value=''/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
    <table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr align="center"  bgcolor="#ccccff">
    <td width="11%">ID</td>
    <td width="40%">课程名称</td>
    <td width="10%">管理</td>
    <td width="15%">课程修改</td>
    <td width="10%">编辑</td>
    <td width="14%">查看章节</td>
    
  </tr>
  <s:iterator id="sr" value="courseList" status='st'>
  <tr  bgcolor="#ccccff" align="center">
    <td><s:property value="#st.index+1"/></td>
    <td>${sr.name}</td>
    <td><s:a action="courseAction_delete?courseId=%{id}">删除</s:a></td>
    <td><s:a action="courseAction_update?courseId=%{id}">修改</s:a></td>
    <td><s:a action="courseAction_edit?courseId=%{id}">编辑</s:a></td>
    <td><s:a action="courseAction_chapterManage?courseid=%{id}">查看章节</s:a></td>
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
						document.getElementById("manageForm").submit();
				   	}
			    </script>
			</div> 
</table>

</s:form>
  </body>
</html>
