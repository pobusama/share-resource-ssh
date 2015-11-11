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
    
   <title>师资队伍</title>
    <link type="text/css" rel="stylesheet" href="style/course_page.css" />
    <script type="text/javascript" src="js/common.js"></script>
    <style>
        .content{ height: auto; }
        .info_card{background-color: #fff;width: 100%; overflow: hidden; position: relative;margin-bottom: 10px;}
        .info_card >h1{position:relative;margin-bottom: 10px; margin-top:10px;width: 200px; background-color: #01c675;color: #fff; font-family: "微软雅黑";font-weight:normal;font-size: 16px;height:30px; line-height: 30px;padding-left: 20px;}
        .info_card >h1 span{position:absolute;top:1px;right: -5px; width: 30px; height: 30px;background: url(../images/bigger_icons.png) no-repeat 0 -1204px;display: block;}

        /*课程负责人*/
        .teacher_team{ margin: 0px auto; border-top: 1px solid #ccc; width:100%;  background:#fff; position:relative; overflow:hidden;}
        .face_window{display: none; position:absolute; z-index:1;left:30px;}
        .face_photo{ position:absolute; top:20px; left:38px;}
        .teacher_team >h2{ position:absolute; display:block; z-index:2; color:#999999; font-size:16px; font-family:"微软雅黑"; top:25px; left:230px; }
        .teacher_team >p{position:absolute; z-index:2; top:54px; width: 600px; right:150px; font-size:14px;font-family:"微软雅黑"; top:70px; color:#464545; line-height:22px; }
        .social_link{ float:right; width:50px; height:42px; background:#fff; margin-top:183px; margin-left:10px; border-bottom:#01c675 3px solid; }
        .social_link:hover{ background:#01c675; border-bottom:#009e5d 3px solid;}
        .xinlang_wb{ display:block; background:url(../images/bigger_icons.png) no-repeat 0 -104px; height:40px; height:42px; }
        .tencent_wb{ display:block; background:url(../images/bigger_icons.png) no-repeat 0 -148px; height:40px; height:40px;}

        /*师资队伍*/
        .teacher_card{ border-bottom:1px solid #CCCCCC;width: 488px; height:200px; float: left; position: relative;}
        .tec_photo{float: left; margin-left: 40px; margin-top: 20px;}
        .teacher_card h1{margin-top:16px; margin-left:80px;float: left; display:block; color:#999999; font-size:16px; font-family:"微软雅黑"; }
        .teacher_card p{float: left; margin-top:0px; margin-left:80px; width: 252px;height: 150px;overflow: hidden; right:150px; font-size:14px;font-family:"微软雅黑";  color:#464545; line-height:21px;}
        .teacher_card a{position:absolute; top: 18px; right:  5px; color: #01c675;font-size:14px;font-family:"微软雅黑";}

        /*团队介绍*/
        .teacher_team_info{width: 510px; margin:20px auto;}
        .info_content{width: 510px; float: left;  font-size:14px;font-family:"微软雅黑";  color:#464545; line-height:21px;margin-bottom: 40px;}
        .info_content span{font-size:15px;font-family:"微软雅黑";font-weight: bold; color: #009e5d;}
        .info_content table{width:100%;margin-bottom: 20px;}
        .info_content table,.info_content td,.info_content tr{border: 1px solid #01c675; text-align: center;}
        .info_content table tr td{ background: #f3f3f3; max-width: 100px;}
        .info_content img{ margin-top: 5px auto;}
        .info_content b{display:block;width: 100%; text-align: center;}
        .img_content{width:510px; text-align: center; padding-bottom: 10px;}
        /*成果展示*/
        .workout_info{overflow: hidden; width: 510px; margin:20px auto;}
        /*内导航*/
        .team_nav{position: fixed; background-color: #01c675;width: 24px; height: 276px; margin: 0px auto;left:50%;margin-left: 490px; z-index: 1;}
        .team_nav li{border-bottom: 1px dashed #ccc; }
        .team_nav li a{display:block;width: 10px; height: 54px; color: #fff; font-size: 12px; padding: 7px 7px; font-family: "youyuan";}

        .team_nav li .selected{color:#01c675; background-color: #fff;width: 12px;}
        .team_nav li a:hover{color:#01c675; background-color: #fff;width: 12px; }
    </style>
    <script src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(window).scroll(function(){
                var top = $(document).scrollTop();
                var menu = $("#menu");
                var cards = $("#content").find(".info_card");

                var currentId = "";
                cards.each(function(){
                    var ths = $(this);
                    if(ths.offset().top-200 < top)
                    {
                        currentId = "#"+ths.attr("id");
                    }
                    else
                        return false;

                });
                //console.log(currentId);
                var currentLink = menu.find(".selected");
                if(currentId&&currentId != currentLink.attr("href"))
                {
                    currentLink.removeClass();
                    menu.find("[href="+currentId+"]").addClass("selected");
                }


            });
        });
    </script>

</head>

<body>
<header><img id="logo" src="images/logo_grey.png" alt="logo" width="350" height="80" /></header>
<nav id="cnav">
    <a href="index.jsp">平台主页</a>
    <a href="#">课程简介</a>
    <a href="#" class="active">师资队伍</a>
    <a href="#">教学评价</a>
    <a href="#">教学单元</a>
    <a href="#">实践项目</a>
    <a href="#">作业提交</a>
    <a href="#">在线互动</a>
</nav>
<div class="content" id="content">
    <div class="team_nav" id="menu">
        <ul>
            <li><a href="teachTeamAction_addUI?courseid=${course.id}#info_card1" class="selected">课程负责</a></li>
            <li><a href="teachTeamAction_addUI?courseid=${course.id}#info_card2">师资队伍</a></li>
            <li><a href="teachTeamAction_addUI?courseid=${course.id}#info_card3">团队介绍</a></li>
            <li><a href="teachTeamAction_addUI?courseid=${course.id}#info_card4">团队成果</a></li>
        </ul>
    </div>
    <div id="info_card1" class="info_card">
        <h1>课程负责人<span></span></h1>
        <div class="teacher_team">
            <img class="face_window"  src="images/face_window.png" width="150" height="228" />
            <s:if test="#request.TeamManager.self_photo==null">
            
            <img class="face_photo"  alt="教师照片" src="images/teachers/default.jpg"  width="114"  height="160"/>
            </s:if>
            <s:else>
            <img class="face_photo"  alt="教师照片" src="images/teachers/${TeamManager.self_photo}"  width="114"  height="160"/>
            </s:else>
            <h2>${TeamManager.teacherName}</h2>
            <p>${TeamManager.evaluate}</p>
            <a class="social_link" href="javascript:void(0)"><span class="xinlang_wb"></span></a>
            <a class="social_link" href="javascript:void(0)"><span class="tencent_wb"></span></a>

        </div>

    </div>
    <div id="info_card2" class="info_card">
        <h1>师资队伍<span></span></h1>
        <div class="teacher_team">
        <s:iterator id="gz" value="teacherList">
            <div class="teacher_card">
                <div class="tec_photo">
                <s:if test="#gz.self_photo==null">
                
                    <img src="images/teachers/default.jpg" width="114"  height="160">
                </s:if>
                <s:else>
                    <img src="images/teachers/${gz.self_photo}" width="114"  height="160">
               </s:else>
                </div>
                <h1>负责人</h1>
                <p>
                    姓名：<span>${gz.teacherName}</span><br />
                    性别：<span>${gz.sex}</span><br />
                    出生年月：<span>${gz.birthday}</span><br />
                    专业技术职务：<span>${gz.diploma}</span><br />
                    学科专业：<span>${gz.courseMajor}</span><br />
                    在本课程中承担的工作：<span>${gz.job}</span><br />
                </p>
                <a href="javascript:void(0);">个人详情</a>
            </div>
          
  
        </s:iterator>
        </div>
    </div>
    <div id="info_card3" class="info_card">
        <h1>团队介绍<span></span></h1>
        <div class="teacher_team_info">

            <div class="info_content">
            ${course.teamIntroduct}
 </div>

        </div>

    </div>
    <div id="info_card4" class="info_card">
        <h1>团队成果<span></span></h1>
        <div class="workout_info">

            <div class="info_content">

                <b>课程组成员主持的教改课题</b><br/>
                <table title="表1 出国访问教师名单" >
                    <tr><td>序号</td><td>项目名称</td><td>项目来源</td><td>起止时间</td><td>主持人</td></tr>
                   <s:iterator id="st" value="topicList" status="us">
                    <tr><td>${us.index+1}</td><td>${projectName}</td><td>${projectSource}</td><td>${StartTime}</td><td>${author}</td></tr>
                   </s:iterator>
                </table>
                <b>课程组成员发表的教学研究论文</b><br/>
                <table title="表2 课程组成员发表的教学研究论文" >
                    <tr><td>序号</td><td>论文名称</td><td>期刊</td><td>时间</td><td>作者</td><td>名次</td></tr>
                  <s:iterator value="thesisList" status="sa">
                    <tr><td>${sa.index+1}</td><td>${thesisName}</td><td>${issue}</td><td>${studyTime}</td><td>${author}</td><td>${position}</td></tr>
                   </s:iterator></table>
                <b>课程组成员出版的教材</b><br/>
                <table title="表3 课程组成员出版的教材" >
                    <tr><td>序号</td><td>教材名称</td><td>出版社</td><td>出版时间</td><td>使用人数</td></tr>
                  <s:iterator value="maList" status="st">
                    <tr><td>${st.index+1}</td><td>${materialName}</td><td>${product}</td><td>${productTime}</td><td>${usingCount}</td></tr>
                   </s:iterator></table>
                <b>课程组成员获得的荣誉</b><br/>
                <table title="表4 课程组成员获得的荣誉" >
                    <tr><td>序号</td><td>获奖项目</td><td>获奖等级</td><td>获奖时间</td><td>奖金额度（元）</td><td>授奖部门</td></tr>
                  <s:iterator value="hoList" status="s">
                    <tr><td>${s.index+1}</td><td>${project}</td><td>${level}</td><td>${time}</td><td>${money}</td><td>${department}</td></tr>
                   </s:iterator></table>
           
               

            </div>

        </div>

    </div>


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
