<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <!--通用-->
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <title>论坛列表页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/aos.css" />
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../xznstatic/css/idangerous.swiper.css" />
    <link rel="stylesheet" href="../../xznstatic/css/lightbox.css">
    <link rel="stylesheet" href="../../xznstatic/css/app.css" />
    <link rel="stylesheet" href="../../xznstatic/css/apmin.css"/>
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css" />
    <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "../../../resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var CATID = "0",
                BCID = "0",
                NAVCHILDER = "",
                ONCONTEXT = 0,
                ONCOPY = 0,
                ONSELECT = 0;
    </script>
    <style>
        .ng-djn-txt {
            text-align: justify;
            text-justify: inter-ideograph;
            word-wrap: break-word;
            word-break: break-all;
        }
        .ng-inpusbox {
            text-indent:0px;
        }
        .am-inside-adv{
            height:auto;
        }
        .am-inside-adv img {
            width:100%;
        }
        .ng-oa a .small {
            display:none;
        }
        .ng-oa a:hover .small {
            display:block;
        }
        .ng-oa a:hover .image {
            display:none;
        }
        .pos-a {
            height:30px;
            line-height:30px;
            margin:0 5px;
        }
        .pos-a a {
            margin:0 5px;
        }
        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: var(--publicMainColor,orange);
        }
        .jishuzichis a {
            font-size: 12px;
            color: #878787;
        }
        .ng-siotext {
            line-height: 50px;
        }

        @media screen and (max-width: 992px) {
            .ng-zein-iten-link li {
                width: 50%;
                text-align: center;
            }
            .ng-zein-iten-link li.li {
                width: 100%;
            }
            .bdshare-button-style2-16 a, .bdshare-button-style2-16 .bds_more {
                float: initial;
            }
            .ng-zein-code {
                width: 100%;
            }
            .ng-zein-code-tit {
                width: 100%;
                text-align: center;
            }
        }

        /* 前台模态框使用集成tinymce富文本框会导致页面做下角出现上传图片和添加表格功能，由于处理不了，把它z-index属性设置为负的，不能让页面上可以点*/
        .tox-pop{
            z-index: -99999;
        }
    </style>
</head>
<body >
<div id="app">

    <div class="am-add">
        <div class="swiper-container ng-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="(item,index) in swiperList" v-bind:key="index">
                    <a href="#">
                        <div class="swiper-slide"><img :src="item.img" style="width: 100%;height:400px "></div>
                    </a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev ng-swiper-ovleft"><img src="../../xznstatic/img/snne1.png"/></div>
            <div class="swiper-button-next ng-swiper-ovright"><img src="../../xznstatic/img/snne2.png"/></div>
        </div>
    </div>
    <!-- 新增修改模态框 -->
    <div class="modal fade" id="addForumModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="z-index: 3000">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title">发布帖子</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
            <form class="layui-form layui-form-pane" lay-filter="myForm" id ="myForm">
                <div class="modal-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="forumName" id="forumName" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">帖子类型：</label>
                        <div class="layui-input-block">
                            <select name="forumTypes" id="forumTypes" lay-filter="forumTypes">
                                <option v-for="item in forumTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea name="forumContent" id="forumContent" placeholder="请输入内容...">
                            </textarea>
                        </div>
                    </div>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-theme btn-submit" lay-submit lay-filter="addForum">发布</button>
                </div>
            </form>
            </div>
        </div>
    </div>

    <!-- 标题 -->
    <h2 class="index-title">FORUM / INFORMATION</h2>
    <div class="line-container">
        <p class="line"> 论坛中心 </p>
    </div>
    <!-- 标题 -->

    <!-- banner -->
        <!-- banner -->

    <div class="forum-container">
        <div  style="margin-top: 20px;text-align: left;margin-bottom: 60px;border: 2px dotted #EEEEEE;padding: 20px;">
            <ul class="layui-tab-title">
                <li class="layui-this" @click="pageList(0)">全部帖子</li>
                <li v-for="item in forumTypesList" :value="item.codeIndex"  @click="pageList(item.codeIndex)">{{item.indexName}}</li>
            </ul>
            <button @click="addForum()" type="button" class="layui-btn layui-btn-lg btn-theme">
                <i class="layui-icon">&#xe654;</i> 发布帖子
            </button>
        </div>
        <div class="forum-list">
            <div v-for="(item,index) in dataList" v-bind:key="index" href="javascript:void(0);" @click="jump('../forum/detail.jsp?id='+item.id);" class="forum-item">
                <h2 v-if="item.yonghuId" class="h2">{{item.forumName}}（发布人：{{item.yonghuName}}）（发布人权限：用户）</h2>
                <h2 v-if="item.xinlizixunshiId" class="h2">{{item.forumName}}（发布人：{{item.xinlizixunshiName}}）（发布人权限：心里咨询师）</h2>
                <h2 v-if="item.usersId" class="h2">{{item.forumName}}（发布人：管理员）（发布人权限：管理员）</h2>
                <div class="create-time">
                    {{item.insertTime}}
                </div>
            </div>
        </div>
        <div class="pager" id="pager"></div>
    </div>
</div>

</div>


<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            id:null,
            detail: {},
            swiperList: [],//轮播图
            dataList: [],//数据
        // 当前表字典表数据
            forumTypesList : [],
            forumStateTypesList : [],
            forumTypes: 0,//类型
            limit: 8,
            projectName: projectName,//项目名
            centerMenu: centerMenu

        },
        updated: function() {
            layui.form.render(null, 'myForm');
        },
        filters: {
            //把字符串去除无用字符 如果字段长度大于60  就截取到60
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }

                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            jump(url) {
                jump(url);
            }
            ,jumpCheck(url,check1,check2) {
                if(check1 == "2" || check1 == 2){//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if(check2 == "2"  || check2 == 2){//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            }
			,addForum() {
				$("#myForm")[0].reset();
				layui.form.render(null, 'myForm');
				$('#addForumModal').modal('show');//打开模态框
			}
			,pageList(forumTypes) {
                this.forumTypes = forumTypes;
                // 获取列表数据
                layui.http.request('forum/list', 'get', {
                    page: 1,
                    limit: this.limit,
					forumTypes: (vue.forumTypes == 0)?null:vue.forumTypes,
					forumStateTypes:1
                }, function(res) {
                    vue.dataList = res.data.list;
                    // 分页
                    layui.laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: this.limit,
                        jump: function(obj, first) {
                            //首次不执行
                            if (!first) {
                                layui.http.request('forum/list', 'get', {
                                    page: obj.curr,
                                    limit: obj.limit,
									forumTypes: (this.forumTypes == 0)?null:this.forumTypes,
									forumStateTypes:1
                                }, function(res) {
                                    this.dataList = res.data.list
                                });
                            }
                        }
                    });
                });
            }

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage','form', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var form = layui.form;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;

        var limit = 8;

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                });
                vue.swiperList = swiperList;
                vue.$nextTick(()=>{
                    var mySwiper = new Swiper('.ng-swiper', {
                        speed: 400,
                        spaceBetween: 100,
                        pagination: '.ng-swiper .swiper-pagination',
                        autoplay : 5000,
                        loop : true,
                        autoplayDisableOnInteraction : false,
                        calculateHeight : true
                    });
                    $(".ng-swiper-ovleft").bind("click",function (){ mySwiper.swipePrev();});
                    $(".ng-swiper-ovright").bind("click",function (){ mySwiper.swipeNext();});
                });
            }
        });
        // 查询当前字典表相关
            // 帖子类型的查询和初始化
        forumTypesSelect();
            // 帖子状态的查询和初始化
        forumStateTypesSelect();
    // 当前表的字典表
        // 帖子类型的查询
        function forumTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=forum_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.forumTypesList = res.data.list;
                }
            });
        }
        // 帖子状态的查询
        function forumStateTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=forum_state_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.forumStateTypesList = res.data.list;
                }
            });
        }




		// 获取列表数据
		http.request('forum/list', 'get', {
			page: 1,
			limit: limit,
			forumStateTypes:1
		}, function(res) {
			vue.dataList = res.data.list
			// 分页
			laypage.render({
				elem: 'pager',
				count: res.data.total,
				limit: limit,
				jump: function(obj, first) {
					//首次不执行
					if (!first) {
						http.request('forum/list', 'get', {
							page: obj.curr,
							limit: obj.limit,
							forumStateTypes:1
						}, function(res) {
							vue.dataList = res.data.list
						})
					}
				}
			});
		})

		// 初始化编辑器
		var edit = tinymce.render({
			elem: "#forumContent",
			height: 400,
			// width: 600,
			images_upload_handler: function(blobInfo, succFun, failFun) {
				var xhr, formData;
				var file = blobInfo.blob(); //转化为易于理解的file对象
				xhr = new XMLHttpRequest();
				xhr.withCredentials = false;
				xhr.open('POST', http.baseurl + 'file/upload');
				xhr.setRequestHeader("Token", localStorage.getItem('Token')); //设置请求头
				xhr.onload = function() {
					var json;
					if (xhr.status != 200) {
						failFun('HTTP Error: ' + xhr.status);
						return;
					}
					json = JSON.parse(xhr.responseText);
					// if (!json || typeof json.location != 'string') {
					// 	failFun('Invalid JSON: ' + xhr.responseText);
					// 	return;
					// }
					if (!json || typeof json.file != 'string') {
						failFun('Invalid JSON: ' + xhr.responseText);
						return;
					}
					succFun(http.baseurl + '/upload/' + json.file);
				};
				formData = new FormData();
				formData.append('file', file, file.name); //此处与源文档不一样
				xhr.send(formData);
			}
		}, (opt) => {

		});

		// 提交
        form.on('submit(addForum)', function (data) {

			// 获取富文本的内容
			var forumContent = tinymce.get('#forumContent').getContent()
			data = data.field;
			data.forumContent = forumContent;
			data.forumStateTypes = 1;
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

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

<script>
    window.xznResize = function() {
        var mySwiper2 = new Swiper('.ng-inzep',{
            calculateHeight : true,
            loop : true,
            paginationClickable :true,
            pagination: ".ng-inzep .swiper-pagination"
        });

        $(document).bind("scroll",function (){
            if($(".ng-swip-porlist").length > 0){
                if($(window).width() > 769){
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                }else if($(window).width() < 769){
                    if($(window).width() < 480){
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    }else{
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }
        });

        $(window).bind("resize", function () {
            // 强制关闭导航
            if ($(window).width() > 992) { $(".ipad-nav").slideUp(); };

            if ($(".ng-swip-porlist").length > 0) {
                if ($(window).width() > 769) {
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                } else if ($(window).width() < 769) {
                    if ($(window).width() < 480) {
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    } else {
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }

            Spirit_dynamicBG($(".ng-inswbg"), 1600, 616, $(".ng-inswbg"));
            Spirit_CallBack($(".ng-porlist-doc>a"), 280, 200);
            Spirit_CallBack($(".ng-incontlst-img"), 368, 240);
            Spirit_CallBack($(".ng-inzep-ims"), 400, 270);
            Spirit_CallBack($(".ng-isenst-img"), 368, 240);
            Spirit_CallBack($(".ng-prslist-img"), 100, 100);
            Spirit_CallBack($(".ng-vrslist-img"), 260, 170);
            Spirit_CallBack($(".ng-newbve-img-ikk"), 368, 240);

            $(".ng-subc-swiper").css({ "height": $(".ng-subc-swiper").width() });

            if ($(window).width() < 640) {
                $(".am-inside-swf").css({
                    "min-height": $(window).height() - 60
                });
            } else {
                $(".am-inside-swf").css({
                    "min-height": "auto"
                });
            }
        }).resize();
    }
</script>
</body>
</html>
