<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <%@ include file="../../static/topNav.jsp"%>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
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
                    <h3 class="block-title">客服聊天表管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
                                href="${pageContext.request.contextPath}/index.jsp"> <span
                                class="ti-home"></span>
                        </a></li>
                        <li class="breadcrumb-item">客服聊天表管理</li>
                        <li class="breadcrumb-item active">客服聊天表列表</li>
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
                        <h3 class="widget-title">客服聊天表列表</h3>
                        <div class="table-responsive mb-3">
                            <div class="col-sm-12">

                                <%--<div class="layui-inline" style="margin-bottom: 10px;">--%>
                                <%--问题时间--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input type="datetime-local" id="issueTimeStartSearch" style="width: 190px;" class="form-control form-control-sm"--%>
                                    <%--placeholder="开始" aria-controls="tableId">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="layui-inline" style="margin-bottom: 10px;">--%>
                                <%--&nbsp;--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input type="datetime-local" id="issueTimeEndSearch" style="width: 190px;" class="form-control form-control-sm"--%>
                                    <%--placeholder="结束" aria-controls="tableId">--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="layui-inline" style="margin-bottom: 10px;">--%>
                                <%--回复时间--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input type="datetime-local" id="replyTimeStartSearch" style="width: 190px;" class="form-control form-control-sm"--%>
                                    <%--placeholder="开始" aria-controls="tableId">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="layui-inline" style="margin-bottom: 10px;">--%>
                                <%--&nbsp;--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input type="datetime-local" id="replyTimeEndSearch" style="width: 190px;" class="form-control form-control-sm"--%>
                                    <%--placeholder="结束" aria-controls="tableId">--%>
                                    <%--</div>--%>
                                <%--</div>--%>


                                <div class="layui-inline" style="margin-bottom: 10px;">
                                    用户姓名
                                    <div class="layui-input-inline">
                                        <input type="text" id="yonghuNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                               placeholder="用户姓名" aria-controls="tableId">
                                    </div>
                                </div>


                                <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;margin-top: 20px">
                                    <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                    <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
                                    <button onclick="graph()" type="button" class="btn btn-success 报表">报表</button>
                                    <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                </div>
                            </div>
                            <table id="tableId" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th class="no-sort" style="min-width: 35px;">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox"
                                                   id="select-all" onclick="chooseAll()"> <label
                                                class="custom-control-label" for="select-all"></label>
                                        </div>
                                    </th>
                                    <th >用户姓名</th>
                                    <th >新消息</th>
                                    <th >发出时间</th>
                                    <th >回复</th>
                                    <th >回复时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="col-md-6 col-sm-3">
                                <div class="dataTables_length" id="tableId_length">

                                    <select name="tableId_length" aria-controls="tableId"
                                            id="selectPageSize" onchange="changePageSize()">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select> 条 每页

                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item" id="tableId_previous"
                                        onclick="pageNumChange('pre')"><a class="page-link"
                                                                          href="#" tabindex="-1">上一页</a></li>

                                    <li class="page-item" id="tableId_next"
                                        onclick="pageNumChange('next')"><a class="page-link"
                                                                           href="#">下一页</a></li>
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
<a id="back-to-top" href="#" class="back-to-top"> <span
        class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp"%>
<script language="javascript" type="text/javascript"
        src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>

<script>

    <%@ include file="../../utils/menu.jsp"%>

            <%@ include file="../../static/setMenu.js"%>

            <%@ include file="../../utils/baseUrl.jsp"%>

            <%@ include file="../../static/getRoleButtons.js"%>

            <%@ include file="../../static/crossBtnControl.js"%>
    var tableName = "chat";
    var pageType = "list";
    var searchForm = {
        key : ""
    };
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = '';
    var sortOrder = '';
    var ids = [];
    var checkAll = false;

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
    //排序
    function sort(columnName) {
        var iconId = '#' + columnName + 'Icon'
        $('th i').attr('class', 'fa fa-sort');
        if (sortColumn == '' || sortColumn != columnName) {
            sortColumn = columnName;
            sortOrder = 'asc';
            $(iconId).attr('class', 'fa fa-sort-asc');
        }
        if (sortColumn == columnName) {
            if (sortOrder == 'asc') {
                sortOrder = 'desc';
                $(iconId).attr('class', 'fa fa-sort-desc');
            } else {
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
        }
        pageIndex = 1;
        getDataList();
    }

    // 查询
    function search() {
        searchForm = {
            key : ""
        };
        //用户姓名
        var yonghuNameSearchInput = $('#yonghuNameSearch');
        if( yonghuNameSearchInput != null){
            if (yonghuNameSearchInput.val() != null && yonghuNameSearchInput.val() != '') {
                searchForm.yonghuName = $('#yonghuNameSearch').val();
            }
        }

        var memberTypesSelectSearchInput = document.getElementById("memberTypesSelectSearch");
        if(memberTypesSelectSearchInput != null){
            var memberTypesIndex = memberTypesSelectSearchInput.selectedIndex;
            if( memberTypesIndex  != 0){
                searchForm.memberTypes = document.getElementById("memberTypesSelectSearch").options[memberTypesIndex].value;
            }
        }
        <!-- 本表的查询条件 -->


        var issueTimeStartSearch = $('#issueTimeStartSearch');
        if( issueTimeStartSearch != null){
            if (issueTimeStartSearch.val() != null && issueTimeStartSearch.val() != '') {
                searchForm.issueTimeStart = $('#issueTimeStartSearch').val();
            }
        }
        var issueTimeEndSearch = $('#issueTimeEndSearch');
        if( issueTimeEndSearch != null){
            if (issueTimeEndSearch.val() != null && issueTimeEndSearch.val() != '') {
                searchForm.issueTimeEnd = $('#issueTimeEndSearch').val();
            }
        }

        var replyTimeStartSearch = $('#replyTimeStartSearch');
        if( replyTimeStartSearch != null){
            if (replyTimeStartSearch.val() != null && replyTimeStartSearch.val() != '') {
                searchForm.replyTimeStart = $('#replyTimeStartSearch').val();
            }
        }
        var replyTimeEndSearch = $('#replyTimeEndSearch');
        if( replyTimeEndSearch != null){
            if (replyTimeEndSearch.val() != null && replyTimeEndSearch.val() != '') {
                searchForm.replyTimeEnd = $('#replyTimeEndSearch').val();
            }
        }
        getDataList();
    }
    // 获取数据列表
    function getDataList() {
        $.ajax({
            type : "GET",
            url : baseUrl + "chat/page",
            data : {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                //本表的
                issueTimeStart: searchForm.issueTimeStart,
                issueTimeEnd: searchForm.issueTimeEnd,
                replyTimeStart: searchForm.replyTimeStart,
                replyTimeEnd: searchForm.replyTimeEnd,
                //级联表的
                yonghuName: searchForm.yonghuName,
                memberTypes: searchForm.memberTypes,

            },
            beforeSend : function(xhr) {
                xhr.setRequestHeader("token", window.sessionStorage
                        .getItem('token'));
            },
            success : function(res) {
                clear();
                if (res.code == 0) {
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    //var tbody = document.getElementById('tbMain');
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('tbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                } else if (res.code == 401) {
                <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg);
                    dataList = [];
                    totalPage = 0;
                }
            },
        });
    }
    // 渲染表格数据
    function setDataRow(item, number) {
        //创建行 
        var row = document.createElement('tr');
        row.setAttribute('class', 'useOnce');
        //创建勾选框
        var checkbox = document.createElement('td');
        var checkboxDiv = document.createElement('div');
        checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
        var checkboxInput = document.createElement('input');
        checkboxInput.setAttribute("class", "custom-control-input");
        checkboxInput.setAttribute("type", "checkbox");
        checkboxInput.setAttribute('name', 'chk');
        checkboxInput.setAttribute('value', item.id);
        checkboxInput.setAttribute("id", number);
        checkboxDiv.appendChild(checkboxInput);
        var checkboxLabel = document.createElement('label');
        checkboxLabel.setAttribute("class", "custom-control-label");
        checkboxLabel.setAttribute("for", number);
        checkboxDiv.appendChild(checkboxLabel);
        checkbox.appendChild(checkboxDiv);
        row.appendChild(checkbox)

        //用户姓名
        var yonghuNameCell = document.createElement('td');
        yonghuNameCell.innerHTML = item.yonghuName;
        row.appendChild(yonghuNameCell);


        //问题
        var chatIssueCell = document.createElement('td');
        if (item.chatIssue != null && item.chatIssue != "" && item.chatIssue.length >= 11) {
            chatIssueCell.innerHTML = item.chatIssue.substring(0, 10) + "...";
        } else {
            chatIssueCell.innerHTML = item.chatIssue;
        }
        row.appendChild(chatIssueCell);


        //问题时间
        var issueTimeCell = document.createElement('td');
        issueTimeCell.innerHTML = item.issueTime;
        row.appendChild(issueTimeCell);

        if(item.insertTime == "2021-10-15 09:57:57"){


            var b = 1;
        }

        //回复
        var chatReplyCell = document.createElement('td');
        if(item.chatReply != null && item.chatReply != ""){
            if (item.chatReply != null && item.chatReply != "" && item.chatReply.length >= 11) {
                chatReplyCell.innerHTML = item.chatReply.substring(0, 10) + "...";
            } else {
                chatReplyCell.innerHTML = item.chatReply;
            }
        }else{
            chatReplyCell.innerHTML = '未回复';
        }

        row.appendChild(chatReplyCell);


        //回复时间
        var replyTimeCell = document.createElement('td');
        if(item.replyTime != null && item.replyTime != ""){
            replyTimeCell.innerHTML = item.replyTime;
        }else{
            replyTimeCell.innerHTML = '未回复';
        }
        row.appendChild(replyTimeCell);


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

        if(item.chatReply == null || item.chatReply == ""){
            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 回复");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "回复"
            btnGroup.appendChild(editBtn)
        }



        //删除按钮
        var deleteBtn = document.createElement('button');
        var deleteAttr = 'remove(' + item.id + ')';
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick", deleteAttr);
        deleteBtn.innerHTML = "删除";
        btnGroup.appendChild(deleteBtn);
        row.appendChild(btnGroup);


        row.appendChild(btnGroup)
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
    function download(fileName) {
        var url = baseUrl + 'file/download?fileName=' + fileName;
        window.open(url);
    }
    // 打开新窗口播放媒体
    function mediaPlay(url) {
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
                pageNum.setAttribute('class',
                        'paginate_button page-item active useOnce');
            } else {
                pageNum.setAttribute('class',
                        'paginate_button page-item useOnce');
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
        if (index<0 || index>totalPage) {
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
            $.ajax({
                type : "POST",
                url : baseUrl + "chat/delete",
                contentType : "application/json",
                data : JSON.stringify(paramArray),
                beforeSend : function(xhr) {
                    xhr.setRequestHeader("token", window.sessionStorage
                            .getItem('token'));
                },
                success : function(res) {
                    if (res.code == 0) {
                        alert('删除成功');
                        getDataList();
                    } else if (res.code == 401) {
                    <%@ include file="../../static/toLogin.jsp"%>
                    } else {
                        alert(res.mes);
                    }
                },
            });
        } else {
            alert("已取消操作");
        }
    }
    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
            //修改
            function edit(id) {
                window.sessionStorage.setItem('id', id)
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
        window.location.href = "add-or-update.jsp"
    }
    //单列求和
    function getSum(colName) {
        $.ajax({
            type : "GET",
            url : baseUrl + "chat" + colName,
            data : {
                tableName : "chat",
                columnName : colName
            },
            beforeSend : function(xhr) {
                xhr.setRequestHeader("token", window.sessionStorage
                        .getItem('token'));
            },
            success : function(res) {
                if (res.code == 0) {
                    return res.data.sum;
                } else if (res.code == 401) {
                <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg);
                }
            },
        });
    }
    // 查看详情
    function detail(id) {
        window.sessionStorage.setItem("updateId", id);
        window.location.href = "info.jsp";
    }

    //跨表
    function crossTable(id, crossTableName) {
        window.sessionStorage.setItem('crossTableId', id);
        window.sessionStorage.setItem('crossTableName', "chat");
        var url = "../" + crossTableName + "/add-or-update.jsp";
        window.location.href = url;
    }
    $(document).ready(
            function() {
                //激活翻页按钮
                $('#tableId_previous').attr('class',
                        'paginate_button page-item previous')
                $('#tableId_next').attr('class',
                        'paginate_button page-item next')
                //隐藏原生搜索框
                $('#tableId_filter').hide()
                //设置右上角用户名
                $('.dropdown-menu h5').html(
                        window.sessionStorage.getItem('username'))
                //设置项目名
                $('.sidebar-header h3 a').html(projectName)
                setMenu();
                init();
                getDataList();
            <%@ include file="../../static/myInfo.js"%>
            });
</script>
</body>

</html>