<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <title>入口页</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="./xznstatic/css/aos.css" />
    <link rel="stylesheet" href="./xznstatic/css/app.css" />
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/theme.css" />
</head>

<body scrolling="no" style="overflow-y: hidden;overflow-x: hidden;width: 100%">
    <header id="header" class="navbar  ng-head ng-bg-fff" style="height: 70px;width: 100%">
        <div class="am-headerv"style=" width: 100%">
            <div class="navbar-header col-md-2">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <span  style="margin-left: 50px;margin-top:11px;font-size: 25px;width: 300px;" class="ng-hotline-text"  v-text="projectName"></span>
                <%--<a  style="margin-left: 50px" href="#" class="am-logo-link ng-pull-left" ><img src="./xznstatic/img/logo.png" style="width: auto;height: 70px" /></a>--%>

            </div>
            <div class="am-pc-nav am-ipad-hide" aos="fade-left" style="margin-top: -18px;position:relative;/* left:-700px;*/">
                <ul>
                    <li class='ng-nav-activate'>
                        <a href="javascript:navPage('./pages/home/home.jsp')" class="am-pclink" style="font-size: 25px">首页</a>
                        <span class="am-pclink-borv"><span></span></span>
                    </li>
                    <li class='' v-for="(item,index) in indexNav" v-bind:key="index">
                        <a :href="'javascript:navPage(\''+item.url+'\')'" class="am-pclink" style="font-size: 25px">{{item.name}}</a>
                        <span class="am-pclink-borv"><span></span></span>
                    </li>
                    <li class=''>
                        <a href="javascript:centerPage();" class="am-pclink" style="font-size: 25px">我的</a>
                        <span class="am-pclink-borv"><span></span></span>
                    </li>
                    <li class=''>
                        <a target="_blank" :href="adminurl" class="am-pclink" style="font-size: 25px">跳转到后台</a>
                        <span class="am-pclink-borv"><span></span></span>
                    </li>
                    <li class=''>
                        <a href="javascript:chatTap()" class="am-pclink" style="font-size: 25px">
                            <i class="layui-icon" style="font-size: 30px;">&#xe677;</i> 客服
                        </a>
                        <span class="am-pclink-borv"><span></span></span>
                    </li>
                </ul>
            </div>
        </div>
    </header>

<iframe src="./pages/home/home.jsp" id="iframe" frameborder="0" scrolling="auto" onload="changeFrameHeight()"></iframe>

<script src="./xznstatic/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>

<script src="./layui/layui.js"></script>
<script src="./js/vue.js"></script>
<script src="./js/config.js"></script>

<script>
    projectName = projectName;
    var vue = new Vue({
        el: '#header',
        data: {
            indexNav: indexNav,
            // cartFlag: cartFlag,
            adminurl: adminurl,
            // chatFlag: chatFlag,
            projectName: projectName
        },
        mounted: function() {
            this.bindClickOnLi();
        },
        methods: {
            jump(url) {
                jump(url)
            },
            bindClickOnLi() {
                let list = document.getElementsByTagName("li");
                for(var i = 0;i<list.length;i++){
                    list[i].onclick = function(){
                        $(this).addClass("ng-nav-activate").siblings().removeClass("ng-nav-activate");
                    }
                }
            }
        }
    });

    layui.use(['element','layer'], function() {
        var element = layui.element;
        var layer = layui.layer;
    });

    function chatTap(){
        var userTable = localStorage.getItem('userTable');
        if (userTable) {
            layui.layer.open({
                type: 2,
                title: '客服聊天',
                area: ['600px', '600px'],
                content: './pages/chat/list.jsp'
            });
        } else {
            window.location.href = './pages/login/login.jsp'
        }
    }

    // 导航栏跳转
    function navPage(url) {
        localStorage.setItem('iframeUrl', url);
        document.getElementById('iframe').src = url;
    }

    // 跳转到个人中心也
    function centerPage() {
        var userTable = localStorage.getItem('userTable');
        if (userTable) {
            localStorage.setItem('iframeUrl', './pages/' + userTable + '/center.jsp');
            document.getElementById('iframe').src = './pages/' + userTable + '/center.jsp';
        } else {
            window.location.href = './pages/login/login.jsp'
        }
    }

    var iframeUrl = localStorage.getItem('iframeUrl');
    document.getElementById('iframe').src = iframeUrl;

    changeFrameHeight();

    //  窗口变化时候iframe自适应
    function changeFrameHeight() {
        var header = document.getElementById('header').scrollHeight;
        // var swiper = document.getElementById('swiper').scrollHeight;
        var ifm = document.getElementById("iframe");
        ifm.height = document.documentElement.clientHeight - header;
        ifm.width = document.documentElement.clientWidth;
    }

    // reasize 事件 窗口大小变化后执行的方法
    window.onresize = function() {
        changeFrameHeight();
    }
</script>

<script src="./xznstatic/js/idangerous.swiper.min.js"></script>
<script src="./xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="./xznstatic/js/app.js"></script>
</body>

</html>
