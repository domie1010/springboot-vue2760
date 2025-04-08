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
</style>
<body>

    <div id="app">
        <!-- 新增修改模态框 -->
        <div class="modal fade" id="addForumModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="z-index: 3000">
                <div class="modal-content">
                    <%-- 模态框标题--%>
                    <div class="modal-header">
                        <h5 class="modal-title">回复帖子</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%-- 模态框内容 --%>
                    <form class="layui-form layui-form-pane" lay-filter="myForm" id ="myForm">
                        <div class="modal-body">
                            <div class="layui-form-item">
                                <label class="layui-form-label">评论内容</label>
                                <div class="layui-input-block">
                                <textarea name="forumContent" id="forumContent" placeholder="评论内容..." style="width: 400px;height: 250px">
                                </textarea>
                                </div>
                            </div>
                        </div>
                        <%-- 模态框按钮 --%>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button class="btn btn-theme btn-submit" lay-submit lay-filter="addForum">评论</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 轮播图 -->
        <div class="layui-carousel" id="swiper">
            <div carousel-item id="swiper-item">
                <div v-for="(item,index) in swiperList" v-bind:key="index">
                    <img class="swiper-item" :src="item.img">
                </div>
            </div>
        </div>
        <!-- 轮播图 -->

        <!-- 标题 -->
        <h2 class="index-title">FORUM / INFORMATION</h2>
        <div class="line-container">
            <p class="line"> 论坛中心 </p>
        </div>
        <!-- 标题 -->

        <!-- banner -->
                <!-- banner -->

        <div class="forum-container">
            <h1 class="title">{{detail.forumName}}</h1>
        <div v-if="detail.yonghuId" class="auth-container">
            发布人{{detail.yonghuName}}&nbsp;&nbsp;&nbsp;发布人权限：用户&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
        <div v-if="detail.xinlizixunshiId" class="auth-container">
            发布人{{detail.xinlizixunshiName}}&nbsp;&nbsp;&nbsp;发布人权限：心里咨询师&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
        <div v-if="detail.usersId" class="auth-container">
            发布人：管理员&nbsp;&nbsp;&nbsp;发布人权限：管理员&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
            <div class="content" v-html="detail.forumContent">
            </div>

            <div class="bottom-container">
                <div class="title">
                    评论列表
                </div>
                <div id="btn-add-win" class="btn"  @click="addForum">
                    点击评论
                </div>
            </div>

            <div class="message-list">
                <div class="message-item" v-for="(item,index) in dataList" v-bind:key="index">

                    <div v-if="item.yonghuId" class="username-container">
                        <img class="avator" :src="item.yonghuPhoto">
                        <span class="username">用户：{{item.yonghuName}}</span>
                    </div>
                    <div v-if="item.xinlizixunshiId" class="username-container">
                        <img class="avator" :src="item.xinlizixunshiPhoto">
                        <span class="username">心里咨询师：{{item.xinlizixunshiName}}</span>
                    </div>
                    <div v-if="item.usersId" class="username-container">
                        <img class="avator" src="../../img/avator.png">
                        <span class="username">管理员</span>
                    </div>
                    <div class="content">
                        <span class="message">
                            {{item.forumContent}}
                        </span>
                    </div>
                </div>
            </div>
            <div class="pager" id="pager"></div>
        </div>

    </div>

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
            forumRecommendList: [],
            dataList: [],
            // 当前详情页表
            detailTable: 'forum',
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
        ,addForum() {
            $("#myForm")[0].reset();
            layui.form.render(null, 'myForm');
            $('#addForumModal').modal('show');//打开模态框
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

		// 获取轮播图 数据
		http.request('config/list', 'get', {
			page: 1,
			limit: 5
		}, function(res) {
			if (res.data.list.length > 0) {
				var swiperItemHtml = '';
				for (let item of res.data.list) {
					if (item.value != "" && item.value != null) {
						swiperItemHtml +=
							'<div>' +
'<img class="swiper-item" src="' + item.value + '">' +
'</div>';
					}
				}
				jquery('#swiper-item').html(swiperItemHtml);
				// 轮播图
				carousel.render({
					elem: '#swiper',
					width: swiper.width,height:swiper.height,
					arrow: swiper.arrow,
					anim: swiper.anim,
					interval: swiper.interval,
					indicator: swiper.indicator
				});
			}
		});

		// 详情信息
		http.request('forum/info/' + id, 'get', {}, function(res) {
			vue.detail = res.data

			var data = {
				superIds : vue.detail.id,
				forumStateTypes:2
			}
			//评论信息
			http.request('forum/list', 'get', data, function(res) {
				vue.dataList = res.data.list
			});
		});

		// 提交
        form.on('submit(addForum)', function (data) {
			data = data.field;
			data.superIds = vue.detail.id;
			data.forumStateTypes = 2;
			http.requestJson('forum/save', 'post', data, function(res) {
				layer.msg('发表成功', {
					time: 2000,
					icon: 6
				}, function() {
					window.location.reload();
				});
			});
			return false;
        });


    });





</script>
</body>
</html>
