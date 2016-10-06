<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.utils.AppPathHelp" %>
<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/5
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%
    AppPathHelp pathHelp = new AppPathHelp(request);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">
    <title>梧桐证券-个人中心-我的邀请</title>
    <!-- Bootstrap core CSS     -->
    <link rel="stylesheet" type="text/css" href="/plugins/datatable/resources/bootstrap/3/dataTables.bootstrap.css">
    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/plugins/lbd/css/content.css" rel="stylesheet"/>
    <script type="text/javascript">
        var basePath = "<%=pathHelp.getBasePath()%>";
        var jsPath = "<%=pathHelp.getJsPath()%>";
    </script>
</head>
<body>
<div id="resourceTableDiv" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="btn-toolbar" role="toolbar">
        <div class="btn-group" id="dataTableToolbarNode"></div>
        <div class="btn-group hide" id="dataTableToolbarNodeMoreDiv">
            <button id="dataTableToolbarNodeMoreNodeBut" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                更多 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" id="dataTableToolbarNodeMoreNode" aria-labelledby="dataTableToolbarNodeMoreNodeBut"></ul>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-default btn-primary" onclick="reloadDataGrid()">
                <span class="glyphicon glyphicon-refresh"></span> 刷新
            </button>
            <button type="button" class="btn btn-default btn-primary" data-toggle="modal" data-target="#tableSearchModalDiv">
                <span class="glyphicon glyphicon-search"></span> 查询
            </button>
        </div>
        <div class="btn-group">
            <button id="showTableColumns" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-eye-open"></span>显示 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" id="dataTabColumnShowNode" aria-labelledby="showTableColumns"></ul>
        </div>
        <!-- /btn-group -->
        <!-- /input-group -->
    </div>
    <div class="table-responsive" id="tssDataTableDiv"></div>
</div>
<!-- Modal search div -->
<div class="modal fade" id="tableSearchModalDiv" tabindex="-1" role="dialog" aria-labelledby="tableSearchLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="tableSearchLabel">查询</h4>
            </div>
            <div class="modal-body">
                <form name="searchForm" id="searchForm" class="form-horizontal" method="POST" onsubmit="return false;"
                      onKeyDown="javascript:if(event.keyCode==13)searchResource();">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="mobile" class="col-sm-3 control-label">手机号码:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="手机号码">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>姓名:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group input-group-lg">
                            <label for="email" class="col-sm-3 control-label">邮箱:</label>
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="searchResource()">查询</button>
                <button type="reset" class="btn btn-primary" onclick="resetSearchForm()">重置</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="resourceOperationModalDiv" tabindex="-1" role="dialog" aria-labelledby="resourceOperationLabel" aria-hidden="true">
    <div class="modal-dialogOpr">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="reloadDataGrid()">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="resourceOperationLabel">操作</h4>
            </div>
            <div class="modal-body">
                <iframe id="resourceOperationModalDivFrame" scrolling="auto" frameborder="0" src="#" style="width:100%;height:100%;"></iframe>
            </div>
        </div>
    </div>
</div>
<!--   Core JS Files   -->
<script src="/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/plugins/jquery/jquery.bootstrap.min.js" type="text/javascript"></script>
<script src="/plugins/datatable/js/jquery.dataTables.js"></script>
<script src="/plugins/datatable/resources/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="/plugins/json/json_parse.js"></script>
<script src="/plugins/json/json2.js"></script>
<script src="/js/datatables.driver.js" type="text/javascript"></script>
<script src="/js/appUtil.js" type="text/javascript"></script>
<script src="/js/resourceAction.js" type="text/javascript"></script>
<!--  Notifications Plugin    -->
<script type="text/javascript">
    $(document).ready(
            function () {
                var optData = {};
                optData.tableHeaderName = 'ResMessage';
                document.getElementById("searchForm").setAttribute("optData", JSON.stringify(optData));
                $.ajax({
                    type: "post",
                    url: "/application/table.tableHeader.action",
                    dataType: "json",
                    cache: false,
                    data: optData,
                    success: function (data) {
                        var tssDataTableDiv = "tssDataTableDiv";
                        var tssDataTableDivTable = "tssDataTableDivTable";
                        var isTableSelectable = true;
                        var isShowLineNumber = true;
                        var isTableSortable = true;
                        var tableDataAjaxUrl = "/message/message.listTableData.action";
                        var targetDataTablesReferent = buildDataTableReferent(tssDataTableDiv, tssDataTableDivTable, data.content, isTableSortable, tableDataAjaxUrl, "POST", optData, isShowLineNumber, isTableSelectable, "more");

                        createDataTable(targetDataTablesReferent, 260, 20);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("ajax error:" + textStatus + " 请求表格搜索数据错误");
                    }
                });
            });
</script>
</body>
</html>