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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link type="text/css" rel="stylesheet" href="style/jingsai.css" />
 <script type="text/javascript" src='<s:url value="js/jquery-1.9.1.min.js"/>'></script>
<script type="text/javascript" src="js/common.js"></script>


</head>

<body>
<br><header id="header"><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="nav">
	<a href="index.jsp">平台主页</a>
    <a href="javascript:void(0);">教学评价</a>
    <a href="javascript:void(0);">教学教改</a>
    <a href="javascript:void(0);">作业提交</a>
    <a href="#">竞赛报名</a>
    <a href="javascript:void(0);">教研活动</a>
    <a href="javascript:void(0);">下载入口</a>
    <a href="javascript:void(0);" id="search_btn" class="active"><span></span></a>
    
    
</nav>
<div class="search_box" id="search_box">
<input type="text" id="search_input" value="请输入需搜索的内容" />
<input type="button" id="search_submit" value="GO" />
</div>
<div class="content">
	<h1>用户注册信息</h1>
	
  <div class="sign_up_info">
  <s:form id="registForm" name="registForm" action="userAction_userRigest" method="post">
    	<li><label class="errorUser" id="usernameError">${userNameError}</label>账号:<input id="username" name="user.userName" class="inputClass" placeholder="请输入中文汉字"  type="text"  /></li>
    	<li><label class="errorUser" id="userpasswordError">${passwordError}</label>密码:<input id="userpassword" name="user.password" placeholder="请输入密码" class="inputClass" type="password"  /></li>
    	<li><label class="errorUser" id="repasswordError"></label>确认密码:<input id="repassword" name="user.confirm_password" placeholder="请再次输入密码" class="inputClass" type="password"  /></li><!--
    	<li>所属学院:
        	<div class="reset_select">
            	<select>
                    <option value="1">信息工程学院</option>
                    <option value="2">理学院</option>
                    <option value="3">机电学院</option>
           		</select>
            </div>
        	
        </li>
        <li>所属专业:
        	<div class="reset_select">
                <select>
                    <option value="1">网络121</option>
                    <option value="2">网络122</option>
                    
                </select>
            </div>
      	</li>
        <li  class="sclass">所属班级:<label >所属班级不能为空！</label><span>班</span><input id="classnumber" type="text" value="请输入班级序号如'122'"/></li>
       --> <li>E-Mail:<label class="errorUser" id="emailError">${emailError}</label><input id="email" placeholder="请输入邮箱地址" name="user.email" class="inputClass" type="text"/></li>
        
        <input id="info_submit" class="info_submit" type="submit" value="提交信息" />
        </s:form>
   </div>
    
</div>

<footer>
	<div class="footer_link">
    	<a href="javascript:void(0);">加入收藏</a><a href="backstage/backstagelogin.html">进入后台</a>
    </div>
	<p>
    	Copyright© 2011 江西理工大学.All Rights Reserved.<br />
  		学校地址：江西省赣州市红旗大道86号 邮编：341000<br />
  		制作维护：  江西理工大学信息学院333工作室  Email：517821485@qq.com <br />


    </p>
</footer>
</body>
<SCRIPT type="text/javascript">


// JavaScript Document

	
$(function() {
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".errorUser").each(function() {
		showError($(this));//遍历每个元素，使用每个元素来调用showError方法
	});
	
	
	/*
	 * 3. 输入框得到焦点隐藏错误信息
	 */
	$(".inputClass").focus(function() {
		var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
		$("#" + labelId).text("");//把label的内容清空！
		showError($("#" + labelId));//隐藏没有信息的label
	});
	
	/*
	 * 4. 输入框失去焦点进行校验
	 */
	$(".inputClass").blur(function() {
		var id = $(this).attr("id");//获取当前输入框的id
		var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
		eval(funName);//执行函数调用
		//validateLoginname();
	});
	
	/*
	 * 5. 表单提交时进行校验
	 */
	$("#registForm").submit(function() {
		var bool = true;//表示校验通过		
		if(!validateUsername()) {
			bool = false;
		}
		if(!validateUserpassword()) {
			bool = false;
		}
		if(!validateRepassword()) {
			bool = false;
		}
		if(!validateEmail()) {
			bool = false;
		}
		
		
		return bool;
	});
});

/*
 * 登录名校验方法
 */
function validateUsername() {
	var id = "username";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */	
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("账号不能为空！");
		showError($("#" + id + "Error"));
		return false;
		
		
	}
	

	return true;
}
/*
 * 校验密码方法
 */
function validateUserpassword() {
	var id = "userpassword";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */	
	
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码不可为空！");
		showError($("#" + id + "Error"));
		return false;
		
		
	}
	if(value.length<6){
	$("#" + id + "Error").text("密码长度必须大于6！");
		showError($("#" + id + "Error"));
		return false;
	}
	

	return true;
}
/*
两次密码是否相同校验
*/
function validateRepassword(){
	var id="repassword";
	var password=$("#"+"userpassword").val();
	var value=$("#"+id).val();
	if(!value){
		$("#"+id+"Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}else if(value!=password){
		$("#"+id+"Error").text("两次输入密码不一致");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}
/*
校验email
*/
function validateEmail(){
	var id="email";
	var value=$("#"+id).val();
	if(!value){
		$("#"+id+"Error").text("Email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}/*
	 * 2. Email格式校验
	 */
	if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("错误的Email格式！");
		showError($("#" + id + "Error"));
		false;
	}
	$.ajax({
		url:"userAction_validateUser",//要请求的actiont		
		data:{email:value},//给服务器的参数	
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。	
	    cache:false,
		success:function(result) {
			if(!result) {//如果校验失败			
			 $("#" + id + "Error").text("Email已被注册！");
				showError($("#" + id + "Error"));
				return false;
			}
		}
	});
	return true;
}

/*
 * 判断当前元素是否存在内容，如果存在显示，不页面不显示！
 */
function showError(ele) {
	var text = ele.text();//获取元素的内容
	if(!text) {//如果没有内容
		ele.css("display", "none");//隐藏元素
	} else {//如果有内容
		ele.css("display", "");//显示元素
	}
}
</SCRIPT>
</html>

