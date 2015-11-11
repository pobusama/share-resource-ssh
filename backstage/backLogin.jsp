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
<title>公共课程教学资源共享平台后台登录</title>
<link type="text/css" rel="stylesheet" href="style/backstagelogin.css" />
 <script type="text/javascript" src='<s:url value="js/jquery-1.9.1.min.js"/>'></script>
<script type="text/javascript" src="js/common.js"></script>
<style>
label{font-family: '微软雅黑';font-size: 12px;color:red;}
</style>
</head>

<body>
<div class="login_bg">
	<h1>公共课程教学资源共享平台后台管理系统</h1>
    <div class="login_content">
    <form id="backLoginForm" name="backLoginForm" action="userAction_backStageLogin" method="post">
    	<div class="logo"><img src="images/background_stage_img/jxustlogo.png" width=156 height=156 /></div>
    	<span class="middle_line"></span>
        <h2></h2>
       
        <ul class="input_ul">
         <label>${backError}</label>
        	<div class="input_li">用户名:<input type="text" class="inputClass" id="userName" name="user.userName"/></div>
            <div class="input_li">密&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" id="password" class="inputClass" name="user.password"/></div>
            <div class="input_li no_margin_bottom">验证码:<img alt="验证码" src="/ShareResource/VerifyCodeServlet" id="imgVerifyCode"><label><a href="javascript:change_photo();">换一张</a></label><input class="verification_code inputClass" id="code" type="text" size="3" name="verCode"/></div>
    
        </ul>
        <input type="submit" id="submit" class="login_submit" value="确定登录" />
    </form>
       
    </div>
    <div class="login_bottom">江西理工大学Delta工作室 联系QQ670796228</div>
</div>
</body>
<script type="text/javascript">


	
	
	
	/*
	 * 5. 表单提交时进行校验
	 */
	$("#backLoginForm").submit(function() {
	
		var bool = true;//表示校验通过		
		if(!validateUsername()) {
			bool = false;
		}
		if(!validateUserpassword()) {
			bool = false;
		}
		if(!validateCode()) {
			bool = false;
		}
		
	
		return bool;
	});


/*
 * 登录名校验方法
 */
function validateUsername() {
	var id = "userName";
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
		alert("账号不能为空！");
		return false;	
	}
	return true;
}
/*
 * 校验密码方法
 */
function validateUserpassword() {
	var id = "password";
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
		alert("密码不可为空！");
		return false;
		
		
	}
	
	

	return true;
}
function validateCode(){
	
	var id="code";
	var value=$("#"+id).val();
	if(!value){
		alert("验证码不可为空");
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length != 4) {
		
		alert("错误的验证码！");
		return false;
	}
	var bool=true;
	$.ajax({
		url:"userAction_validateCode",//要请求的actiont		
		data:{verCode:value},//给服务器的参数	
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。	
	    cache:false,
		success:function(result) {
			if(!result) {		
			 alert("错误的验证码！");
			bool=false;
			}
		}
	});
	if(!bool){return false;}
	return true;
}
//换一张
function change_photo(){

$("#imgVerifyCode").attr("src", "/ShareResource/VerifyCodeServlet?a=" + new Date().getTime());
}
</script>
</html>
