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
     <title>反转课堂管理</title>
    <style>
    table, td, tr{border: 1px solid #7EC0E5;}
        
          #table_title{font-family:"微软雅黑";font-size:14px;font-weight:600;text-align:center;}
    		#title{text-align: center;margin-top:20px;margin-left:20px;}
           #spanDiv{text-align: center;}
           #span{font-family:"微软雅黑";font-size:14px;font-weight:600;}
           body{position:relative;}
           #delete{position:absolute;top:0px;}
           #content{font-family:"微软雅黑";font-size:12px; background: #f3f3f3;}
    </style>


  </head>
  
  <body>
 
  <a href="preCourseAction_prebatchDelete?pre.chapterId=${ChapterId}" id="batch">批量删除</a>
 
  <div id="spanDiv"><span id="span">反转课堂管理</span></div>
 <table width="100%" border="1" cellspacing="1" cellpadding="1">
  <tr bgcolor="#4097D1" id="table_title">
  	<td>ID</td>
    <td>反转课堂知识</td>
    <td>删除</td>
    
  </tr>
  <s:iterator  value="preList" status="st">
  <tr id="content">
  	<td>${((toolBar.pageIndex)-1)*(toolBar.pageSize)+st.index+1}</td>
    <td>${preknowledge}</td>
    <td><a href="preCourseAction_predelete?pre.id=${id}&&pre.chapterId=${ChapterId}">删除</a></td>
  </tr>
 </s:iterator>
</table>

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
