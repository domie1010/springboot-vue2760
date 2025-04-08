<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<style>
    /*.data-detail .title {
        font-size:35px;
        line-height:100%;
        font-weight:700;
        color:#4b4b46;
        margin-top:-4px;
        margin-bottom:24px;
        border:none;
    }
    .data-detail .detail-item {
        font-size:16px;
        line-height:50px;
        color:#4b4b46;
        background:#f3f3f9;
        border:1px solid rgba(75,75,70,.07);
        border-radius:7px;
        padding:0 35px;
        margin-bottom:15px;
        width: auto;
    }
    div .detail-item span:nth-child(1) {
        font-size:18px;
        font-weight:700;
        width:40%
    }*/</style>
<body>

    <div id="app">
        <div class="data-detail">
            <div class="data-detail-breadcrumb">
                <span class="layui-breadcrumb">
                    <a href="../home/home.jsp">首页</a>
                    <a><cite>{{detail.huodongName}}</cite></a>
                </span>

                <!-- 收藏 -->
                <a v-if='storeupFlag' onclick="addHuodongCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67a;</i>取消收藏
                </a>
                <a v-if='!storeupFlag' onclick="addHuodongCollection()" href="javascript:void(0)">
                    <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67b;</i>点我收藏
                </a>

            </div>
            <div class="layui-row">
                <div class="layui-col-md5">
                    <div class="layui-carousel" id="swiper">
                        <div carousel-item id="swiper-item">
                            <div v-for="(item,index) in swiperList" v-bind:key="index">
                                <img class="swiper-item" :src="item.img">
                            </div>
                        </div>
                    </div>

                    <div class="tool-container">
                            <!-- 判断是否有评分 -->
                    </div>
                </div>
                <div class="layui-col-md7" style="padding-left: 20px;">
                        <div v-if="detail.huodongUuidNumber" class="detail-item">
                            <span>活动编号：</span>
                            <span class="desc">
                                        {{detail.huodongUuidNumber}}
                            </span>
                        </div>

                        <h1 class="title">{{detail.huodongName}}</h1>

                        <div v-if="detail.huodongTypes" class="detail-item">
                            <span>活动类型：</span>
                            <span class="desc">
                                {{detail.huodongValue}}
                            </span>
                        </div>

                        <div v-if="detail.kaishiTime" class="detail-item">
                            <span>活动开始日期：</span>
                            <span class="desc">
                                        {{detail.kaishiTime}}
                            </span>
                        </div>

                        <div v-if="detail.jieshuTime" class="detail-item">
                            <span>活动结束日期：</span>
                            <span class="desc">
                                        {{detail.jieshuTime}}
                            </span>
                        </div>

                        <div v-if="detail.huodongClicknum" class="detail-item">
                            <span>热度：</span>
                            <span class="desc">
                                {{detail.huodongClicknum}}
                            </span>
                        </div>

                    <div class="detail-item">

                        <!--<button onclick="addHuodongqqqqqqqq()" type="button" class="layui-btn layui-btn-warm">
                                添加到购物车
                            </button>-->
                           <%-- <div class="num-picker">
                                <button type="button" onclick="reduceBuynumber()" class="layui-btn layui-btn-primary">
                                    -
                                </button>
                                <input type="text" id="buyNumber" name="buyNumber" class="layui-input" disabled="disabled" />
                                <button type="button" onclick="plusBuynumber()" class="layui-btn layui-btn-primary">
                                    +
                                </button>
                            </div>--%>
                            <button onclick="addHuodongOrder()" type="button" class="layui-btn btn-submit">
                                立即参与
                            </button>
                    </div>

                    <div class="detail-item" style="text-align: right;">
                    </div>
                </div>
            </div>

            <div class="layui-row">
                <div class="layui-tab layui-tab-card">

                    <ul class="layui-tab-title">
                            <li class="layui-this">详情</li>
                            <li>留言</li>
                    </ul>

                    <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div v-html="myFilters(detail.huodongContent)"></div>
                            </div>

                            <div class="layui-tab-item">
                                <div class="message-container">
                                    <form class="layui-form message-form" style="padding-right: 20px;border-bottom: 0;">
                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">
                                                留言
                                            </label>
                                            <div class="layui-input-block">
                                                <textarea name="huodongLiuyanText" id="huodongLiuyanText" required lay-verify="required" placeholder="留言内容" class="layui-textarea"></textarea>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button class="layui-btn btn-submit" lay-submit lay-filter="huodongLiuyanText">
                                                    立即提交
                                                </button>
                                                <button type="reset" class="layui-btn layui-btn-primary">
                                                    重置
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="message-list">
                                        <div class="message-item" v-for="(item,index) in huodongLiuyanDataList" v-bind:key="index">
                                            <div class="username-container">
                                                <img class="avator" :src="item.yonghuPhoto">
                                                <span class="username">
                                                    {{item.yonghuName}}
                                                </span>
                                            </div>
                                            <div class="content">
                                                    <span style="color: rgb(175, 135, 77)">
                                                        留言:<div v-html="item.huodongLiuyanText"></div>
                                                    </span>
                                            </div>
                                            <div class="content">
                                                    <span style="color: rgb(175, 135, 77)">
                                                        回复:<div v-html="item.replyText"></div>
                                                    </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pager" id="huodongLiuyanPager"></div>
                                </div>
                            </div>


                    </div>
                </div>
            </div>
        </div>    </div>

<script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>

<script>
    Vue.prototype.myFilters= function (msg) {
        if(msg != null){
            return msg.replace(/\n/g, "<br>");
        }else{
            return "";
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 商品标题
            title: '',

            storeupFlag: 0,//收藏 [0为收藏 1已收藏]
            //系统推荐
            huodongRecommendList: [],
            dataList: [],
            // 加入购物车数量
            buyNumber: 1,
            // 当前详情页表
            detailTable: 'huodong',
            // 留言列表
            huodongLiuyanDataList: [],
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            jump(url) {
                jump(url)
            }
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage', 'rate'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;
        var rate = layui.rate;//评分

        var limit = 10;

        // 设置数量
        jquery('#buyNumber').val(vue.buyNumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;
        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
            vue.title = vue.detail.huodongName;
           // 轮播图片
            vue.swiperList = vue.detail.huodongPhoto ? vue.detail.huodongPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '" style="margin-top: 50px;" >' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });

        // 系统推荐
        http.request(`huodong/list`, 'get', {
            page: 1,
            limit: 5,
            huodongTypes: vue.detail.huodongTypes,
            huodongDelete: 1,




        }, function (res) {
            vue.huodongRecommendList = res.data.list;
        });

        // 获取留言
        http.request(`${vue.detailTable}Liuyan/list`, 'get', {
            page: 1,
            limit: limit,
            huodongId: vue.detail.id
        }, function (res) {
            vue.huodongLiuyanDataList = res.data.list;
            // 分页
            laypage.render({
                elem: 'huodongLiuyanPager',
                count: res.data.total,
                limit: limit,
                jump: function (obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request(`${vue.detailTable}Liuyan/list`, 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            huodongId: vue.detail.id
                        }, function (res) {
                            vue.huodongLiuyanDataList = res.data.list
                        })
                    }
                }
            });
        });

        // 提交留言
        form.on('submit(huodongLiuyanText)', function (data) {
            data.yonghuId = localStorage.getItem('userid');
            data.tableName = localStorage.getItem('userTable');
            data.huodongLiuyanText =jquery("#huodongLiuyanText").val();
            if(data.huodongLiuyanText == null || data.huodongLiuyanText == ''){
                layer.msg("留言不能为空", {
                    time: 2000,
                    icon: 2
                });
                return false;
            }
            data.huodongId = vue.detail.id;
            http.requestJson(`${vue.detailTable}Liuyan/add`, 'post', data, function (res) {
                layer.msg('留言成功', {
                    time: 2000,
                    icon: 6
                }, function () {
                    window.location.reload();
                });
                return false
            });
            return false
        });


        if (localStorage.getItem('userid')) {
            http.request('huodongCollection/list', 'get', {
                page: 1,
                limit: 1,
                huodongId: vue.detail.id,
                yonghuId: localStorage.getItem('userid'),
            }, function (res) {
                if(res.data.total >0){
                    res.data.list.forEach(element => {
                        if (element.huodongCollectionTypes == 1) {
                            vue.storeupFlag = 1;
                        }
                        if (element.huodongCollectionTypes == 2) {
                            vue.zanFlag = 1;
                        }
                        if (element.huodongCollectionTypes == 3) {
                            vue.caiFlag = 1;
                        }
                    });

                }
            });
        }

    });



    // 收藏
    function addHuodongCollection(){
        layui.http.request('huodongCollection/list', 'get', {
            page: 1,
            limit: 1,
            huodongId: vue.detail.id,
            huodongCollectionTypes: 1,
            yonghuId: localStorage.getItem('userid'),
        }, (res) => {
            if (res.data.list.length == 1) {
                layui.http.requestJson('huodongCollection/delete', 'post', [res.data.list[0].id], function (res) {
                    layui.layer.msg('取消成功', {
                        time: 1000,
                        icon: 5
                    }, function () {
                        window.location.reload();
                    });
                });
                return false;
            }
            layui.http.requestJson('huodongCollection/add', 'post', {
                yonghuId: localStorage.getItem('userid'),
                huodongId: vue.detail.id,
                huodongCollectionTypes: 1,
            }, function (res) {
                layui.layer.msg('收藏成功', {
                    time: 1000,
                    icon: 6
                }, function () {
                    window.location.reload();
                });
            });
        });
    }

    // 添加数量
    function plusBuynumber() {
        vue.buyNumber++;
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }
    // 减少数量
    function reduceBuynumber() {
        if(vue.buyNumber>1){
            vue.buyNumber--;
        }
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }

    // 立即购买
    function addHuodongOrder(){
        // localStorage.setItem("huodongId",vue.detail.id);
        // localStorage.setItem("buyNumber",vue.buyNumber);
        // window.location.href='../huodongOrder/add.jsp';

        let data ={
            yonghuId : localStorage.getItem("userid"),
            huodongId : vue.detail.id,
        };
        layui.http.requestJson('huodongOrder' + '/add', 'post', data, function (res) {
            if(res.code == 0){
                layui.layer.msg('报名成功', {
                    time: 2000,
                    icon: 6
                }, function () {
                    window.location.href='../huodongOrder/list.jsp';
                });
            }else{
                layui.layer.msg(res.msg, {
                    time: 5000,
                    icon: 5
                }, function () {
                    // window.location.href='../huodongOrder/list.jsp';
                });
            }
        });
    }



</script>
</body>
</html>
