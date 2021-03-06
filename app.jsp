<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>APP下载中心</title>
    <link href="style/bootstrap.css" rel="stylesheet">

   
    <style>

        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }

        /* 轮播广告 */

        .carousel {
            height: 500px;
            margin-bottom: 60px;
        }

        .carousel .item {
            height: 500px;
            background-color: #000;
        }

        .carousel .item img {
            width: 100%;
        }

        .carousel-caption {
            z-index: 10;
        }

        .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }

        /* 简介 */

        .summary {
            padding-right: 15px;
            padding-left: 15px;
        }

        .summary .col-md-4 {
            margin-bottom: 20px;
            text-align: center;
        }

        /* 特性 */

        .feature-divider {
            margin: 40px 0;
        }

        .feature {
            padding: 30px 0;
        }

        .feature-heading {
            font-size: 50px;
            color: #2a6496;
        }

        .feature-heading .text-muted {
            font-size: 28px;
        }
        .feature .col-md-5 img{
            margin: auto auto;
        }

        /* 响应式布局 */

        @media (max-width: 768px) {

            .summary {
                padding-right: 3px;
                padding-left: 3px;
            }

            .carousel {
                height: 300px;
                margin-bottom: 30px;
            }

            .carousel .item {
                height: 300px;
            }

            .carousel img {
                min-height: 300px;
            }

            .carousel-caption p {
                font-size: 16px;
                line-height: 1.4;
            }

            .feature-heading {
                font-size: 34px;
            }

            .feature-heading .text-muted {
                font-size: 22px;
            }
        }

        @media (min-width: 992px) {
            .feature-heading {
                margin-top: 120px;
            }
        }
    </style>

</head>

<body>
<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">APP下载中心</a>
        </div>
        <div class="navbar-collapse collapse">
          <input type="hidden" id="downlodError" value="${error}"/>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#ad-carousel">综述</a></li>
                <li><a href="#summary-container">简述</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">特点 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-tengyun">腾云优课</a></li>
                      
                        <li><a href="#feature-tab" data-tab="tab-firefox">Firefox</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">Safari</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">Opera</a></li>
                        <li><a href="#feature-tab" data-tab="tab-ie">IE</a></li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
        </div>
    </div>
</div>


<!-- 广告轮播 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
        <li data-target="#ad-carousel" data-slide-to="3"></li>
        <li data-target="#ad-carousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="images/appadd/add-bg01.jpg" alt="1 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>腾云优课</h1>

                    <p>腾云优课，一款优秀的移动端学习APP，内有海量学习资源</p>

                    <p><a class="btn btn-lg btn-primary" href="courseAction_uClassDownload"
                          >点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="images/appadd/firefox-big.jpg" alt="2 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Firefox</h1>

                    <p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.firefox.com.cn/download/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="images/appadd/safari-big.jpg" alt="3 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Safari</h1>

                    <p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.apple.com/cn/safari/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="images/appadd/opera-big.jpg" alt="4 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Opera</h1>

                    <p>Opera浏览器，是一款挪威Opera Software ASA公司制作的支持多页面标签式浏览的网络浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.opera.com/zh-cn" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="images/appadd/ie-big.jpg" alt="5 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>IE</h1>

                    <p>Internet Explorer，简称 IE，是微软公司推出的一款网页浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://ie.microsoft.com/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
</div>


<!-- 主要内容 -->
<div class="container summary">

    <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-md-4">
            <img class="img-circle" src="images/appadd/tengyunLOGO.png" width="140" height="140" alt="tengyun">

            <h2>腾云优课</h2>

            <p>腾云优课，一款优秀的移动端学习APP，内有海量学习资源</p>

            <p><a class="btn btn-default" href="courseAction_uClassDownload" >点我下载</a></p>
        </div>
        <div class="col-md-4">
            <img class="img-circle" src="images/appadd/firefox-logo-small.jpg" alt="firefox">

            <h2>Firefox</h2>

            <p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>

            <p><a class="btn btn-default" href="#" role="button">点我下载</a></p>
        </div>
        <div class="col-md-4">
            <img class="img-circle" src="images/appadd/safari-logo-small.jpg" alt="safari">

            <h2>Safari</h2>

            <p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>

            <p><a class="btn btn-default" href="#" role="button">点我下载</a></p>
        </div>
    </div>

    <!-- 特性 -->

    <hr class="feature-divider">

    <ul class="nav nav-tabs" role="tablist" id="feature-tab">
        <li class="active"><a href="#tab-tengyun" role="tab" data-toggle="tab">UClass</a></li>
        <li><a href="#tab-firefox" role="tab" data-toggle="tab">Firefox</a></li>
        <li><a href="#tab-safari" role="tab" data-toggle="tab">Safari</a></li>
        <li><a href="#tab-opera" role="tab" data-toggle="tab">Opera</a></li>
        <li><a href="#tab-ie" role="tab" data-toggle="tab">IE</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="tab-tengyun">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">腾云优课UClass <span
                            class="text-muted">优秀的学习APP</span></h2>

                    <p class="lead">腾云优课UClass，是一个由Delta - Android小组开发的移动端学习APP。
                        该APP是基于Android操作系统开发，未来会上线IOS版本，目标是让爱学习的同学们消化理解课堂知识，完成更多的自主学习。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="images/appadd/tengyunLOGO.png"
                         alt="uclass" width="400" height="400">
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-firefox">
            <div class="row feature">
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="images/appadd/firefox-logo.jpg"
                         alt="Firefox">
                </div>
                <div class="col-md-7">

                    <h2 class="feature-heading">Mozilla Firefox <span class="text-muted">美丽的狐狸</span>
                    </h2>

                    <p class="lead">Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器，
                        使用Gecko引擎（非ie内核），支持多种操作系统如Windows、Mac和linux。</p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-safari">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">Safari <span class="text-muted">Mac用户首选</span></h2>

                    <p class="lead">Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器，使用了KDE的KHTML作为浏览器的运算核心。
                        Safari在2003年1月7日首度发行测试版，并成为Mac OS X v10.3与之后的默认浏览器，也是iPhone与IPAD和iPod touch的指定浏览器。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="images/appadd/safari-logo.jpg"
                         alt="Safari">
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-opera">
            <div class="row feature">
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="images/appadd/opera-logo.jpg"
                         alt="Opera">
                </div>
                <div class="col-md-7">

                    <h2 class="feature-heading">Opera <span class="text-muted">小众但易用</span>
                    </h2>

                    <p class="lead">Opera浏览器，是一款挪威Opera Software ASA公司制作的支持多页面标签式浏览的网络浏览器。
                        是跨平台浏览器可以在Windows、Mac和Linux三个操作系统平台上运行。.</p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab-ie">
            <div class="row feature">
                <div class="col-md-7">

                    <h2 class="feature-heading">IE <span class="text-muted">你懂的</span></h2>

                    <p class="lead">Internet Explorer，原称Microsoft Internet Explorer(6版本以前)和Windows Internet
                        Explorer(7，8，9，10版本)，
                        简称IE，是美国微软公司推出的一款网页浏览器。它采用的排版引擎(俗称内核)为Trident。</p>
                </div>
                <div class="col-md-5">
                    <img class="feature-image img-responsive" src="images/appadd/ie-logo.jpg"
                         alt="IE">
                </div>
            </div>
        </div>
    </div>

    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <p>公共课程平台-APP下载中心</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2015 Delta工作室</p>
    </footer>

</div>
 <script type="text/javascript" src='<s:url value="js/jquery-1.9.1.min.js"/>'></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script>
var con=document.getElementById("downlodError").value;
if(con!=""){
alert(con);
}
    $(function () {
        $('#ad-carousel').carousel();
        $('#menu-nav .navbar-collapse a').click(function (e) {
            var href = $(this).attr('href');
            var tabId = $(this).attr('data-tab');
            if ('#' !== href) {
                e.preventDefault();
                $(document).scrollTop($(href).offset().top - 70);
                if (tabId) {
                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
                }
            }
        });
    });
    
   
</script>
</body>
</html>