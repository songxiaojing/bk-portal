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
    <title>MPE-新闻发布</title>
    <!-- Bootstrap core CSS     -->

    <link href="/plugins/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/plugins/datatable/resources/bootstrap/3/dataTables.bootstrap.css">
    <link href="/plugins/lbd/css/content.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <script type="text/javascript">
        var basePath = "<%=pathHelp.getBasePath()%>";
        var jsPath = "<%=pathHelp.getJsPath()%>";
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group" id="dataTableToolbarNode">
                    <button type="button" class="btn btn-default btn-primary" onclick="resNewsPublish()">
                        <span class="glyphicon glyphicon-pencil"></span> 发布
                    </button>
                    <button type="button" class="btn btn-default btn-primary" onclick="resNewsDetail()">
                        <span class="glyphicon glyphicon-link"></span> 预览
                    </button>
                    <button type="button" class="btn btn-default btn-primary" onclick="removeResNews()">
                        <span class="glyphicon glyphicon-minus"></span> 删除
                    </button>
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
    </div>
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
                    <div class="form-group">
                        <label for="newTitle" class="col-sm-3 control-label">标题:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="newTitle" name="newTitle" placeholder="标题">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newCatagory" class="col-sm-3 control-label">行业:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="newCatagory" name="newCatagory" placeholder="行业">
                            <span class="help-block"></span>
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
                <div class="modal-body">
                    <iframe id="ajaxOperationResourceModalDivFrame" scrolling="auto" frameborder="0" src="#" style="width:100%;height:100%;"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<!--   Core JS Files   -->
<script src="/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/plugins/jquery/jquery.bootstrap.min.js" type="text/javascript"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
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
                optData.tableHeaderName = 'ResNews';
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
                        var tableDataAjaxUrl = "/news/news.listTableData.action";
                        var targetDataTablesReferent = buildDataTableReferent(tssDataTableDiv, tssDataTableDivTable, data.content, isTableSortable, tableDataAjaxUrl, "POST", optData, isShowLineNumber, isTableSelectable, "more", 140, 20);

                        createDataTable(targetDataTablesReferent);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("ajax error:" + textStatus + " 请求表格搜索数据错误");
                    }
                });
            });
</script>
</body>
</html>