<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

</style>
<body>


    <div class="modal fade" id="forumReplyDialogVisible" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 1000px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">帖子回复详情</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="superIds" >
                    <div class="demo-input-suffix">
                        <span style="width: 20%">帖子标题:</span><span id="forumTitle" style="width: 400px"></span>
                    </div>
                    <div class="demo-input-suffix">
                        <span style="width: 20%">帖子内容:</span><span id="forumContent" style="width: 400px"></span>
                    </div>
                    <table class="layui-table" lay-skin="line">
                        <thead>
                        <tr>
                            <th>身份</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>回复内容</th>
                            <th>回帖时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="forumReplyTbody">
                        </tbody>
                    </table>
                    <div class="demo-input-suffix">
                        <span style="width: 20%">回帖内容:</span><textarea  id="forumReplyContent" style="width: 400px;" class="form-control form-control-sm" placeholder="回帖内容" style="width: 80%"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关 闭</button>
                    <button type="button" id="receive" onclick="forumReply()" class="btn btn-primary">回 帖</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pre Loader -->
    <div class="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
<!--/Pre Loader -->
    <div class="wrapper">
        <!-- Page Content -->
        <div id="content">
            <!-- Top Navigation -->
            <%@ include file="../../static/topNav.jsp" %>
            <!-- Menu -->
            <div class="container menu-nav">
                <nav class="navbar navbar-expand-lg lochana-bg text-white">
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="ti-menu text-white"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">论坛管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">论坛管理</li>
                            <li class="breadcrumb-item active">论坛列表</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /Page Title -->

            <!-- /Breadcrumb -->
            <!-- Main Content -->
            <div class="container">
                <div class="row">
                    <!-- Widget Item -->
                    <div class="col-md-12">
                        <div class="widget-area-2 lochana-box-shadow">
                            <h3 class="widget-title">论坛列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        帖子标题
                                        <div class="layui-input-inline">
                                            <input type="text" id="forumNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="帖子标题" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        咨询师姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="xinlizixunshiNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="咨询师姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        用户姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="yonghuNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="用户姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>

                                        <th>身份</th>
                                        <th>姓名</th>
                                        <th>手机号</th>
                                        <th>帖子类型</th>
                                        <th>帖子标题</th>
                                        <th>帖子内容</th>
                                        <th>发帖时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- /Widget Item -->
                </div>
            </div>
            <!-- /Main Content -->

        </div>
        <!-- /Page Content -->
    </div>
    <!-- Back to Top -->
    <a id="back-to-top" href="#" class="back-to-top">
        <span class="ti-angle-up"></span>
    </a>
    <!-- /Back to Top -->
    <%@ include file="../../static/foot.jsp" %>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "forum";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //咨询师姓名
            var xinlizixunshiNameSearchInput = $('#xinlizixunshiNameSearch');
            if( xinlizixunshiNameSearchInput != null){
                if (xinlizixunshiNameSearchInput.val() != null && xinlizixunshiNameSearchInput.val() != '') {
                    searchForm.xinlizixunshiName = $('#xinlizixunshiNameSearch').val();
                }
            }
                                                                                                                                                                 
                            //用户姓名
            var yonghuNameSearchInput = $('#yonghuNameSearch');
            if( yonghuNameSearchInput != null){
                if (yonghuNameSearchInput.val() != null && yonghuNameSearchInput.val() != '') {
                    searchForm.yonghuName = $('#yonghuNameSearch').val();
                }
            }
                                                                                                                                                                                                            <!-- 本表的查询条件 -->

         
            //帖子标题
            var forumNameSearchInput = $('#forumNameSearch');
            if( forumNameSearchInput != null){
                if (forumNameSearchInput.val() != null && forumNameSearchInput.val() != '') {
                    searchForm.forumName = $('#forumNameSearch').val();
                }
            }
                                                    getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("forum/list", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                forumDelete: 1,
                //本表的
                forumStateTypes: 1,
            //级联表的
                xinlizixunshiName: searchForm.xinlizixunshiName,

                yonghuName: searchForm.yonghuName,



            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');

            //身份
            var shenfenCell = document.createElement('td');
            if(false){}
            else if(item.yonghuId != null){
                shenfenCell.innerHTML = '用户';
            }
            else if(item.xinlizixunshiId != null){
                shenfenCell.innerHTML = '心里咨询师';
            }
            else if(item.usersId != null){
                shenfenCell.innerHTML = '管理员';
            }
            row.appendChild(shenfenCell);

            //姓名
            var xingmingCell = document.createElement('td');
            if(false){}
                else if(item.yonghuId != null){
                xingmingCell.innerHTML = item.yonghuName;
            }
                else if(item.xinlizixunshiId != null){
                xingmingCell.innerHTML = item.xinlizixunshiName;
            }
                else if(item.usersId != null){
                xingmingCell.innerHTML = '管理员';
            }
            row.appendChild(xingmingCell);

            //手机号
            var phoneCell = document.createElement('td');
            if(false){}
            else if(item.yonghuId != null){
                phoneCell.innerHTML = item.yonghuPhone;
            }
            else if(item.xinlizixunshiId != null){
                phoneCell.innerHTML = item.xinlizixunshiPhone;
            }
            else if(item.usersId != null){
                phoneCell.innerHTML = '管理员';
            }
            row.appendChild(phoneCell);

            //帖子类型
            var forumValueCell = document.createElement('td');
            forumValueCell.innerHTML = item.forumValue;
            row.appendChild(forumValueCell);

            //帖子标题
            var forumNameCell = document.createElement('td');
            forumNameCell.innerHTML = item.forumName;
            row.appendChild(forumNameCell);

            //帖子内容
            var forumContentCell = document.createElement('td');
            if(item.forumContent.length>20){
                forumContentCell.innerHTML = item.forumContent.substring(0,20)+'...';
            }else{
                forumContentCell.innerHTML = item.forumContent;
            }
            row.appendChild(forumContentCell);

            //发帖时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);


            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            //查看列表详情
            var forumReplyBtn = document.createElement('button');
            var forumReplyAttr = 'openReplyForum(' + item.id + ')';
            forumReplyBtn.setAttribute("type", "button");
            forumReplyBtn.setAttribute("class", "btn btn-warning btn-sm 查看");
            forumReplyBtn.setAttribute("onclick", forumReplyAttr);
            forumReplyBtn.innerHTML = "查看帖子回复";
            btnGroup.appendChild(forumReplyBtn);

            if(
                true && (
                false
                    || (window.sessionStorage.getItem('role') == "用户" && item.yonghuId == window.sessionStorage.getItem('userId'))
                    || (window.sessionStorage.getItem('role') == "心里咨询师" && item.xinlizixunshiId == window.sessionStorage.getItem('userId'))
                    || (window.sessionStorage.getItem('role') == "管理员")
                    )
            ){
                //查看列表详情
                var forumdeleteBtn = document.createElement('button');
                var forumdeleteAttr = 'remove(' + item.id + ')';
                forumdeleteBtn.setAttribute("type", "button");
                forumdeleteBtn.setAttribute("class", "btn btn-danger btn-sm");
                forumdeleteBtn.setAttribute("onclick", forumdeleteAttr);
                forumdeleteBtn.innerHTML = "删除帖子";
                btnGroup.appendChild(forumdeleteBtn);
            }

            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("forum/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addforum", "addforum");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                                                                                                 
                                                                                                                                                                                                        
    //填充本表搜索下拉框
         
                                        
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表











            // 打开回帖模态框
            function openReplyForum(id) {
                 $.ajax({
                    type: "GET",
                    url: baseUrl + "forum/info/" + id,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function (res) {
                        if (res.code == 0) {
                            // 当前帖子相关 start
                                $("#superIds").val(res.data.id)//当前发帖id
                                $("#forumTitle").html(res.data.forumName)//当前帖子题目
                                $("#forumContent").html(res.data.forumContent)//当前帖子内容
                                $("#forumReplyContent").val("")//帖子回复
                            // 当前帖子相关 end
                                // 查看当前帖子的回复列表
                                http("forum/page", "GET", {
                                    page: 1,
                                    limit: 10000,
                                    sort: 'id',
                                    forumStateTypes:2,
                                    superIds:id
                                }, (res) => {
                                    $("#forumReplyTbody").html("");
                                    if (res.code == 0) {
                                        if(res.data.total >0){
                                            for (var i = 0; i < res.data.list.length; i++) { //遍历一下表格数据  
                                                var trow = setReplyForumDataRow(res.data.list[i], i); //定义一个方法,返回tr数据 
                                                $('#forumReplyTbody').append(trow);
                                            }
                                            getRoleButtons();// 权限按钮控制
                                        }
                                    }
                                });
                                $('#forumReplyDialogVisible').modal('show');//打开模态框

                        } else {
                            alert(res.msg);
                        }
                    },
                });

            }

            // 渲染表格数据
            function setReplyForumDataRow(item, number) {
                //创建行 
                var row = document.createElement('tr');

                //身份
                var shenfenCell = document.createElement('td');
                if(false){}
                else if(item.yonghuId != null){
                    shenfenCell.innerHTML = '用户';
                }
                else if(item.xinlizixunshiId != null){
                    shenfenCell.innerHTML = '心里咨询师';
                }
                else if(item.usersId != null){
                    shenfenCell.innerHTML = '管理员';
                }
                row.appendChild(shenfenCell);

                //姓名
                var xingmingCell = document.createElement('td');
                if(false){}
                else if(item.yonghuId != null){
                    xingmingCell.innerHTML = item.yonghuName;
                }
                else if(item.xinlizixunshiId != null){
                    xingmingCell.innerHTML = item.xinlizixunshiName;
                }
                else if(item.usersId != null){
                    xingmingCell.innerHTML = '管理员';
                }
                row.appendChild(xingmingCell);

                //手机号
                var phoneCell = document.createElement('td');
                if(false){

                }
                else if(item.yonghuId != null){
                    phoneCell.innerHTML = item.yonghuPhone;
                }
                else if(item.xinlizixunshiId != null){
                    phoneCell.innerHTML = item.xinlizixunshiPhone;
                }
                else if(item.usersId != null){
                    phoneCell.innerHTML = '管理员';
                }
                row.appendChild(phoneCell);

                //回复内容
                var forumContentCell = document.createElement('td');
                if(item.forumContent.length>20){
                    forumContentCell.innerHTML = item.forumContent.substring(0,20)+'...';
                }else{
                    forumContentCell.innerHTML = item.forumContent;
                }
                row.appendChild(forumContentCell);

                //回帖时间
                var insertTimeCell = document.createElement('td');
                insertTimeCell.innerHTML = item.insertTime;
                row.appendChild(insertTimeCell);

                 //每行按钮
                var btnGroup = document.createElement('td');
                    //详情按钮
                    var detailBtn = document.createElement('button');
                    var detailAttr = "seeForumContent(" +'"'+ item.forumContent +'"'+')';
                    detailBtn.setAttribute("type", "button");
                    detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
                    detailBtn.setAttribute("onclick", detailAttr);
                    detailBtn.innerHTML = "查看回帖详情";
                btnGroup.appendChild(detailBtn);

                if(
                    true && (
                    false
                        || (window.sessionStorage.getItem('role') == "用户" && item.yonghuId == window.sessionStorage.getItem('userId'))
                        || (window.sessionStorage.getItem('role') == "心里咨询师" && item.xinlizixunshiId == window.sessionStorage.getItem('userId'))
                        || (window.sessionStorage.getItem('role') == "管理员")
                        )
                ){
                        //删除回帖
                        var deleteBtn = document.createElement('button');
                        var deleteAttr = "deleteForumData(" + item.id + ')';
                        deleteBtn.setAttribute("type", "button");
                        deleteBtn.setAttribute("class", "btn btn-danger btn-sm");
                        deleteBtn.setAttribute("onclick", deleteAttr);
                        deleteBtn.innerHTML = "删除回帖";
                    btnGroup.appendChild(deleteBtn);

                    row.appendChild(btnGroup);
                }

                return row;
            }

            // 查看某个回复帖子的帖子内容全部
            function seeForumContent(forumContent) {
                alert(forumContent);
            }

            // 删除数据
            function deleteForumData(id){
                var ids = [];
                ids.push(Number(id));
                httpJson("forum/delete", "POST", ids, (res) => {
                    if(res.code == 0){
                        var superIds = $("#superIds").val();
                        openReplyForum(superIds);
                    }else{
                        alert("删除失败，请联系管理员");
                    }
                });
            }

            // 回帖
            function forumReply() {
                var forumReplyContent = $("#forumReplyContent").val()//帖子回复
                var superIds = $("#superIds").val(); //父id
                if(forumReplyContent == ""){
                    alert("请输入回帖内容");
                    return false;
                }

                var data = {"superIds":superIds,"forumStateTypes":2,"forumContent":forumReplyContent};
                httpJson("forum/save", "POST", data, (res) => {
                    if(res.code == 0){
                        openReplyForum(superIds);
                    }else{
                        alert("回帖失败，请联系管理员");
                    }
                });
            }
        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框

            //查询当前表的搜索下拉框
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                                                                                                                 
                                                                                                                                                                                                                                                
        //当前表的下拉框赋值
                         
                                                                                                                        
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
