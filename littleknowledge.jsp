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
    
    <title>微知识</title>
    
	 <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    
    <link type="text/css" rel="stylesheet" href="style/coursepagecommen.css" />
    <script type="text/javascript" src="js/common.js"></script>
    <style>
        /*导航部分*/
        nav{height:54px; background:#fff; width:980px;margin:2px auto; z-index:1; }
        nav >a{ display:block; height:54px;line-height:54px; width:121.5px; text-align:center; float:left; border-right:1px solid #dfdfdf; color:#a1a1a1; font-size:16px; font-family:"微软雅黑"; }
        nav >.active{ background:#01c675; border-bottom:4px #00a05e solid; height:52px;color:#fff;}
        nav a:hover{ background:#01c675; border-bottom:4px #00a05e solid; height:50px;color:#fff;}


        .content{ height: auto;background-color: #f3f3f3; padding-bottom: 40px; position: relative;}
        .wrap {
            width: 100%;
        }

        .little-knowledge-list {
            width: 90%;
            margin: 0px auto;
            padding-top: 20px;
        }

        .little-knowledge-items {
            width: 95%;
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px 20px;
            border-radius: 5px;
            box-shadow: #333 2px 2px 2px;
            font-family:"微软雅黑";

        }
        .little-knowledge-items h3{
            font-size: 16px;
            margin-bottom: 10px;
        }
        .item-body{
            text-indent: 2em;
        }

        /*翻页*/

        .toolbar{position:absolute; bottom:0; width:100%; height:38px; background:#f3f3f3; margin:0 auto; line-height:35px; }
        .toolbar > a{display:block;float:left;margin-top:2px; width:80px; height:20px; line-height:20px; text-align:center;margin-right:10px;font-size:14px; font-family:Verdana; color:#fff;}
        .toolbar > a:hover{ background:#01c675; color:#fff;}
        .toolbar .active{ background:#01c675; color:#fff;}
        .toolbar .pre{ position:absolute; top:5px; display:block;  background:#01c675; width:80px; height:26px; line-height:26px; left:400px;font-family:"微软雅黑";font-size:14px;}
        .toolbar .next{ position:absolute; top:5px; display:block; background:#01c675; width:80px; height:26px;line-height:26px;  left:500px;font-family:"微软雅黑";font-size:14px;}
        .toolbar .pre:hover{ border:2px solid #9F0; width:76px; height:22px; line-height:22px; }
        .toolbar .next:hover{  border:2px solid #9F0; width:76px; height:22px; line-height:22px;}

        .jumpbox{ position:absolute; height:32px; line-height:32px; font-family:"微软雅黑";font-size:14px; color:#01c675; left:600px; top:5px;}
        .jumpbox input{ border:1px solid #ccc; width:18px; height:10px; line-height:10px; padding:4px 4px;font-family:"微软雅黑";font-size:12px;border-radius:5px; -moz-border-radius:5px;}
        .jumpbox a{ color:#ccc;}
        .jumpbox a:hover{ color:#01c675;}



    </style>

    <script src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">

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
<div class="content" id="content">
    <div class="toolbar">
 <s:if test="toolBar.pageCount > 0">
						 <s:if test="toolBar.pageIndex > 1">
        <a class="pre" href='javascript:jumping(<s:property value='toolBar.previousPage'/>)'>上一页</a>   	
							</s:if>
							<s:else>
								 <a href="javascript:void(0);" class="pre">上一页</a>   	
							</s:else>
 <s:if test="toolBar.pageIndex == toolBar.pageCount || toolBar.pageIndex == 0">
								 <a href="javascript:void(0);" class="next">下一页</a>                 
							</s:if>
							<s:else>
							  <a href='javascript:jumping(<s:property value='toolBar.nextPage'/>)' class="next">下一页</a>      
					</s:else>
      
        <div class="jumpbox">
       
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
        </div>
				</s:if>
			<script language="javascript">
					function jumping(pageIndex){
						document.getElementById("pageIndex1").value=pageIndex;
						//document.getElementById("projectForm").action="teachTeamAction_teachTopicManage";
						document.getElementById("knowledgeForm").submit();
				   	}
			    </script>	
    </div>
    <h1>微知识点</h1>
    <form id="knowledgeForm" name="knowledgeForm" action="knowledgeAction_list?courseid=${courseid}" method="post">
  <s:hidden id="pageSize" name="pageSize" value='8'/>
	<s:hidden name="toolBar.pageIndex" id="pageIndex1" value="1"/>
    <div class="wrap">
        <div class="little-knowledge-list">
        <s:iterator value="knowledageList">
            <div class="little-knowledge-items">
                <h3>知识点&minus;<span class="little-knowledge-num">${title}</span></h3>
                <div class="item-body">
                    <p>
                      ${anwser}
                    </p>
                </div>

            </div>
	</s:iterator>
            
        </div>
    </div>
</form>
</div>



<footer>
    <div class="footer_link">
        <a href="javascript:void(0);">加入收藏</a><a href="javascript:void(0);">进入后台</a>
    </div>
    <p>
        Copyright© 2011 江西理工大学.All Rights Reserved.<br />
        学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
        制作维护：  江西理工大学信息学院Delta工作室  Email：517821485@qq.com <br />


    </p>
</footer>
<script>

</script>
</body>
</html>
