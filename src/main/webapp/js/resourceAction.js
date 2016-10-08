var otherHeight = null;
//设置提示框Button
$.messager.model = {
    ok: {
        text: "确认",
        classed: 'btn btn-primary'
    },
    cancel: {
        text: "取消",
        classed: 'btn btn-default'
    }
};

/**
 * 刷新表格
 */
function reloadDataGrid() {
    try {
        // 刷新
        resetSearchForm();
        // 查询
        searchResource();
        // 刷新页面 ，保持当前参数
        // $('#tssDataTableDivTable').DataTable().ajax.reload(null, false);
    } catch (e) {
        alert(e);
    }
}
/**
 * 刷新查询条件
 */
function resetSearchForm() {
    document.getElementById("searchForm").reset();
}
/**
 * 查询方法,查询后刷新表格
 */
function searchResource(isOnclik) {
    try {
        var searchFormObj = document.getElementById("searchForm");
        var dataTableSearchConidition = jQuery.parseJSON(searchFormObj.getAttribute("optData"));
        for (var i = 0; i < searchFormObj.length; i++) {
            dataTableSearchConidition[searchFormObj[i].name] = searchFormObj[i].value;
        }
        var cancelArray = $("li[class='col-li-selector-callout col-li-selector-cancel'] a");
        var isShowCulomns = new Array();
        for (var i = 0; i < cancelArray.length; i++) {
            var html = cancelArray[i].innerHTML;
            isShowCulomns.push(html);
        }
        var myRefernt = getCurrentTableReferent();
        var pageCount = $('#' + myRefernt.tableId).DataTable().page.len();
        myRefernt.ajaxParameters = dataTableSearchConidition;
        createDataTable(myRefernt, otherHeight, isShowCulomns, pageCount);

        if (isOnclik == true) {
            eventCountDealDefault = false;
        }
        // 关闭查询层
        // $('#tableSearchModalDiv').modal("hide");
    } catch (e) {
        alert(e);
    }
}


function showAjaxResultDialog(targetUrl) {
    try {
        $('#ajaxOperationResourceModalDiv').modal("show");
        document.getElementById("ajaxOperationResourceModalDivFrame").src = targetUrl;
    } catch (e) {
        alert(e);
    }
}

/**
 * 文件下载
 */
function downResource(uuid) {
    try {
        if (uuid == "") {
            alert("文件下载ID不能为null!");
            return;
        }
        var targetUrl = basePath + "/application/download.downloadAttachmentByUuid.action?uuid=" + encodeURIComponent(uuid);
        window.location.href = targetUrl;
    } catch (e) {
        alert(e);
    }
}

/**
 * 删除留言
 */
function removeMessage() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要删除的留言记录!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "删除 :" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var postData = {};
                //postData["className"] = className;
                postData["ids"] = ids.join(',');
                $.ajax({
                    type: "POST",
                    url: "/message/message.remove.action",
                    cache: false,
                    data: postData,
                    dataType: "json",
                    success: function (data, textStatus) {
                        reloadDataGrid();
                        $.messager.alert('提示信息', data.message);
                    }
                });
            });
        }
    } catch (e) {
        alert(e);
    }
}


/**
 * 反馈留言
 */
function resMessageFeedback() {
    try {
        var rows = getSelectedRowData();

        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('提示信息', '请选择一条消息!', 'warning');
            return;
        } else {
            showModalDialog("/message/messageView.detail.action?id=" + rows[0].id, "反馈留言");
        }
    } catch (e) {
        alert(e);
    }
}

/**
 * 删除新闻
 */
function removeResNews() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要删除的新闻记录!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "删除 :" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var postData = {};
                //postData["className"] = className;
                postData["ids"] = ids.join(',');
                $.ajax({
                    type: "POST",
                    url: "/news/news.removeNews.action",
                    cache: false,
                    data: postData,
                    dataType: "json",
                    success: function (data, textStatus) {
                        reloadDataGrid();
                        $.messager.alert('提示信息', data.message);
                    }
                });
            });
        }
    } catch (e) {
        alert(e);
    }
}
/**
 * 发布新闻
 */
function resNewsPublish() {
    showModalDialog("/news/newsView.publishResNews.action", "发布新闻");
}

/**
 * 新闻预览
 */
function resNewsDetail() {
    try {
        var rows = getSelectedRowData();

        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('提示信息', '请选择一条新闻预览!', 'warning');
            return;
        } else {
            showModalDialog("/news/newsView.detail.action?id=" + rows[0].id, "新闻预览");
        }
    } catch (e) {
        alert(e);
    }
}

////
////
////
/**
 * 申请股票账户
 */
function fn_applyStockAccountUSA() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条申请开户的客户信息');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "客户信息 :" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var postData = {};
                postData["className"] = className;
                postData["ids"] = ids.join(',');
                $.ajax({
                    type: "POST",
                    url: basePath + "stock/openAccount.stockUSA.action",
                    cache: false,
                    data: postData,
                    dataType: "json",
                    success: function (data, textStatus) {
                        reloadDataGrid();
                        $.messager.alert('提示信息', data.message);
                    }
                });
            });
        }
    } catch (e) {
        alert(e);
    }
}

//////////////////
/**
 * 废除客户信息
 */
function fn_terminateCustInfo() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('废除客户信息', '请选择一条需要废除的客户信息');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "客户信息 :" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('废除客户信息', selectDate, function () {
                var postData = {};
                postData["className"] = className;
                postData["ids"] = ids.join(',');
                $.ajax({
                    type: "POST",
                    url: basePath + "stock/customer.terminateCustInfo.action",
                    cache: false,
                    data: postData,
                    dataType: "json",
                    success: function (data, textStatus) {
                        reloadDataGrid();
                        $.messager.alert('废除客户信息', data.message);
                    }
                });
            });
        }
    } catch (e) {
        alert(e);
    }
}
function fn_drawMoney_confirm() {
    try {
        var rows = getSelectedRowData();
        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('出账确认', '请选择一条需要确认的出账信息');
            return;
        } else {
            var url = basePath + "customer/drawMoneyNotifyView.confirmNotifyView.action?id=" + rows[0].id;
            showDialog(url, "出账确认");
        }
    } catch (e) {
        alert(e);
    }
}
function fn_drawMoney_terminate() {
    try {
        var rows = getSelectedRowData();
        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('出账确认', '请选择一条需要作废的信息');
            return;
        } else {
            var url = basePath + "customer/drawMoneyNotifyView.confirmNotifyView.action?id=" + rows[0].id;
            showDialog(url, "出账确认");
        }
    } catch (e) {
        alert(e);
    }
}
function fn_remittance_confirm() {
    try {
        var rows = getSelectedRowData();
        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('入账确认', '请选择一条需要确认的入账信息');
            return;
        } else {
            var url = basePath + "customer/remittanceNotifyView.confirmNotifyView.action?id=" + rows[0].id;
            showDialog(url, "入账确认");
        }
    } catch (e) {
        alert(e);
    }
}
function fn_remittance_terminate() {
    try {
        var rows = getSelectedRowData();
        if (rows.length == 0 || rows.length > 1) {
            $.messager.alert('出账确认', '请选择一条需要作废的信息');
            return;
        } else {
            var url = basePath + "customer/remittanceNotifyView.terminateNotifyView.action?id=" + rows[0].id;
            showDialog(url, "出账确认");
        }
    } catch (e) {
        alert(e);
    }
}
////////////////////////////////////////////////////////////////////////////
/**
 * 域名资源导入
 */
/*function TSSF0104_JS_importDomainData() {
 try {
 var url = basePath + "resource/resourceView.importResourceUploadView.action?className=" + className + "&actionTarget=resource/importResource.importDomainResourceFormFile.action";
 window.open(url, '导入域名资源')
 } catch (e) {
 alert(e);
 }
 }*/
/**
 * 流量资源导入
 */
function TSSM050110_in_JS_importData() {
    try {
        var url = basePath + "resource/resourceView.importResourceUploadView.action?levaType=" + levaType + "&className=" + className + "&actionTarget=resource/importResource.importCSVResourceFormFile.action" + encodeURI("?") + "className=" + className;
        window.open(url, levaType)
    } catch (e) {
        alert(e);
    }
}
/**
 * 单位导入
 */
function TSSF0104_JS_corporatImportData() {
    try {
        var rows = getSelectedRowData();

        if (rows.length > 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            if (rows.length == 1) {
                var id = rows[0].id;
                var referentClassName = "belongCorporationId";
                var url = basePath + "resource/resourceView.importResourceUploadView.action?className=" + className + "&referentId=" + id + "&referentClassName=" + referentClassName;
                window.open(url, '导入资源');
            } else {
                var url = basePath + "resource/resourceView.importResourceUploadView.action?className=" + className;
                window.open(url, '导入资源');
            }

        }
    } catch (e) {
        alert(e);
    }
}


/**
 * 单位导出.
 */
function TSSF0105_JS_ResCorporactionExportData() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要导出的记录!');
            return;
        } else {
            var data = {};
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            // data["className"] = className;
            // data["ids"] = ids.join(',');
            window.location.href = basePath + "resource/resource.exportRescorporationResource.action?className=" + className + "&ids=" + ids.join(",");
            // JSendAjax(basePath + "resource/resource.exportResource.action",
            // data, "json", "导出数据");
        }
    } catch (e) {
        alert(e);
    }
}

/** 资源类 JS APPJOB运行结果* */
function TSSF0407_JS_LookRunDetail() {
    try {
        var ids = "";
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            ids = rows[0].id;
            var url = basePath + "resource/resourceView.listView.action?className=com.topsec.tss.core.web.resource.module.AppJobRunningDetail&jobId=" + ids;
            // window.open(url, 'JOB运行状况',
            // 'top=150,left=200,status:no;dialogWidth:700px;dialogHeight:550px,resizable:yes,scroll:0,help:no')\
            showModalDialog(url, null, "'top=150,left=200,status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:0,help:no'");
        }
    } catch (e) {
        alert(e);
    }
}

/** 资源类 JS APPJOB停止* */
function TSSF0406_JS_Stop() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var jobName = rows[0][columns[2]["data"]];
            if (rows[0].status != "运行中") {
                $.messager.alert('提示信息', jobName + ' 未运行,不需要停止!');
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            $.messager.confirm('提示信息', "是否将选择的任务进行停止?", function () {
                var data = {};
                data["id"] = ids.join(',');
                JSendAjax(basePath + "application/appJob.stopJob.action", data, "json", "停止任务");
            });
        }
    } catch (e) {
        alert(e);
    }
}

/** 资源类 JS APPJOB启动* */
function TSSF0405_JS_Start() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var jobName = rows[0][columns[2]["data"]];
            if (rows[0].status == "运行中") {
                $.messager.alert('提示信息', jobName + ' 任务已经在运行!');
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            $.messager.confirm('提示信息', "是否将选择的任务进行启动?", function () {
                var data = {};
                data["id"] = ids.join(',');
                JSendAjax(basePath + "application/appJob.startJob.action", data, "json", "启动任务");
            });
        }
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS通报任务添加** */
function TSSF0401_JS_Add() {
    try {
        var url = basePath + "/resource/resourceView.appJobSaveView.action";
        showDialog(url, "通报任务添加");
    } catch (e) {
        alert(e);
    }
}
/*
 * function TSSF0101_JS_Add_OpenWindow() { // 判断 此变量是否定义，如果没有定义则走普通的创建 if (typeof (corporationId) == 'undefined') { TSSF0101_JS_Add(); return; } try { var assignNames =
 * "belongCorporationId"; var assignValues = corporationId; var url = basePath + "/resource/resourceView.createView.action?className=" + className + "&assignNames=" +
 * encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues); var winSetStr =
 * "status:no;dialogWidth:800px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes"; showModalDialog(url, null, winSetStr); reloadDataGrid(); } catch (e) { alert(e); } }
 */
function TSSF0102_JS_Edit_OpenWindow() {
    try {
        var ids = [];
        var rows = getSelectedRowData();
        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据进行编辑');
            return;
        } else if (rows.length == 1) {
            var url = basePath + "/resource/resourceView.updateView.action?className=" + className + "&id=" + rows[0].id;
            var winSetStr = "status:no;dialogWidth:800px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes";
            showModalDialog(url, null, winSetStr);
            reloadDataGrid();
        } else {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            var url = basePath + "/resource/resourceView.batchUpdateFieldView.action?className=" + className + "&ids=" + ids.join(',');
            var winSetStr = "status:no;dialogWidth:800px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes";
            showModalDialog(url, null, winSetStr);
            reloadDataGrid();
        }
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS设置关系* */
function TSSF0101_JS_Authorize() {
    try {
        var url = basePath + "/resource/resourceView.createView.action?className=" + className + "&actionTarget=resource/relation.saveRelation.action";
        showDialog(url, "设置关系");
    } catch (e) {
        alert(e);
    }

}
/** 资源类 JS单位设置签约合同** */
function TSSF0702_JS_SignContract() {
    try {
        var ids = [];
        var names = [];
        var rows = getSelectedRowData();
        var columns = getCurrentTableColumns();
        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一家单位进行设置签约合同操作');
            return;
        } else {
            // for ( var i = 0; i < rows.length; i++) {
            if (rows[0].isSign.indexOf("否") > -1) {
                $.messager.alert('提示信息', rows[0].name + '不是一家可以签约的单位,请选择一家可签约的单位进行签订合同!');
                return;
            }
            ids.push(rows[0].id);
            names.push(rows[0][columns[2]["data"]]);
            // }
        }

        var assignNames = "belongCorporationId,belongCorporationId_display";
        var assignValues = ids.join(',') + "*" + names.join(',');
        var url = basePath + "/resource/resourceView.createView.action?className=com.topsec.tss.core.web.resource.module.ResContract" + "&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues);
        showDialog(url, "单位设置签约合同");
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS联系组设置联系人* */
function TSSF0501_JS_Authorize() {
    try {
        var ids = [];
        var names = [];
        var rows = getSelectedRowData();
        var columns = getCurrentTableColumns();
        if (rows.length > 0) {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                names.push(rows[i][columns[2]["data"]]);
            }
        }
        var assignNames = "groupId,groupId_display";
        var assignValues = ids.join(',') + "*" + names.join(',');
        var url = basePath + "/resource/resourceView.createView.action?className=com.topsec.tss.core.web.resource.module.RelResContactGroup" + "&actionTarget=resource/relation.saveRelation.action&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues);
        showDialog(url, "联系组设置联系人");
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS单位设置联系人* */
function TSSF0701_JS_Authorize() {
    try {
        var ids = [];
        var names = [];
        var rows = getSelectedRowData();
        var columns = getCurrentTableColumns();
        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一个单位增加!');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                names.push(rows[i][columns[2]["data"]]);
            }
        }
        var assignNames = "belongCorporationId,belongCorporationId_display";
        var assignValues = ids.join(',') + "*" + names.join(',');
        var url = basePath + "/resource/resourceView.createView.action?className=com.topsec.tss.core.web.resource.module.ResContact" + "&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues);
        showDialog(url, "单位设置联系人");
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS联系组删除联系人* */
function TSSF0502_JS_Delete() {
    try {
        var ids = "";
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            ids = rows[0].id;
            var url = basePath + "/resource/resourceView.listView.action?className=com.topsec.tss.core.web.resource.module.RelResContactGroup&showManyToolBar=TSSF0502&groupId=" + ids;
            var winSetStr = "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            showModalDialog(url, null, winSetStr);
            // showDetailDialog(url);
        }
    } catch (e) {
        alert(e);
    }
}

/** 资源类 JS单位组删除单位* */
function TSSF0602_JS_Delete() {
    try {
        var ids = "";
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            ids = rows[0].id;
            var url = basePath + "/resource/resourceView.listView.action?className=com.topsec.tss.core.web.resource.module.RelResCorporationGroup&showManyToolBar=TSSF0602&corporationGroupId=" + ids;
            var winSetStr = "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            showModalDialog(url, null, winSetStr);
            // showDetailDialog(url);
        }
    } catch (e) {
        alert(e);
    }
}

/** 资源类 JS单位组设置单位* */
function TSSF0601_JS_Authorize() {
    try {
        var ids = [];
        var names = [];
        var rows = getSelectedRowData();
        var columns = getCurrentTableColumns();
        if (rows.length > 0) {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                names.push(rows[i][columns[2]["data"]]);
            }
        }
        var assignNames = "corporationGroupId,corporationGroupId_display";
        var assignValues = ids.join(',') + "*" + names.join(',');
        var url = basePath + "/resource/resourceView.createView.action?className=com.topsec.tss.core.web.resource.module.RelResCorporationGroup" + "&actionTarget=resource/relation.saveRelation.action&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues);
        showDialog(url, "单位组设置单位");
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS逻辑删除单位组和单位的关系* */
function TSSF0103_JS_LogicDelete() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "将要删除的资源:" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var data = {};
                data["className"] = className;
                data["ids"] = ids.join(',');
                data["isDelete"] = 1;
                JSendAjax(basePath + "resource/relation.batchLogicDeleteRelation.action", data, "json", "逻辑删除");
            });
        }
    } catch (e) {
        alert(e);
    }

}

/** 资源类 JS删除方法* */
function TSSF0103_JS_Delete() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据进行删除!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                selectDate += "将要删除的资源:" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var data = {};
                data["className"] = className;
                data["ids"] = ids.join(',');
                JSendAjax(basePath + "resource/resource.batchDeleteResource.action", data, "json", "删除资源");
            });
            $("#jquery-bootstrap-min-messager-alert").css("max-height", "300px").css("overflow-y", "auto");
        }
    } catch (e) {
        alert(e);
    }
}
/** 资源类 JS删除方法,按照文件名称* */
function TSSF0103_JS_Delete_ByFileName() {
    try {
        var fileNames = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据进行删除!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            var selectDate = "";
            for (var i = 0; i < rows.length; i++) {
                fileNames.push(rows[i].fileName);
                selectDate += "将要删除的资源:" + rows[i][columns[2]["data"]] + "<br>";
            }
            $.messager.confirm('提示信息', selectDate, function () {
                var data = {};
                data["className"] = className;
                data["fileNames"] = fileNames.join(',');
                JSendAjax(basePath + "resource/resource.batchDeleteResourceByFileName.action", data, "json", "删除资源");
            });
            $("#jquery-bootstrap-min-messager-alert").css("max-height", "300px").css("overflow-y", "auto");
        }
    } catch (e) {
        alert(e);
    }
}


/**
 * 信息外发
 */
function TSSF0801_JS_Send() {

    try {
        var ids = [];
        var names = [];
        var rows = getSelectedRowData();
        var columns = getCurrentTableColumns();
        if (rows.length > 0) {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
                names.push(rows[i][columns[2]["data"]]);
            }
        }
        var assignNames = "resShareInfoId,resShareInfoId_display";
        var assignValues = ids.join(',') + "*" + names.join(',');
        var url = basePath + "/resource/resourceView.createView.action?className=com.topsec.tss.core.web.resource.module.RelAutUserResShareInfo&actionTarget=resource/relation.saveRelation.action&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues);
        showDialog(url, "信息外发");
    } catch (e) {
        alert(e);
    }
}

/***********************************************************************************************************************************************************************************
 * 事件确认
 **********************************************************************************************************************************************************************************/
function eventConfirm() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        // 数据没选中进行提示
        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要确认的安全事件!', 'warning');
            return;
        }
        var isBackDoorEvent = false;
        var isLoopholeEvent = false;
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
            if (rows[i].eventType == "网站后门") {
                isBackDoorEvent = true;
            } else if (rows[i].eventType == "漏洞事件") {
                isLoopholeEvent = true;
            }
        }
        // var pageurl = basePath +
        // "/event/dealEventView.eventConfirmView.action?eventIds=" +
        // ids.join(',') + "&corporationId=" + $("#dealCorporationId").val() +
        // "&corporationName="
        // + encodeURI(encodeURI($("#corporationName").val()));
        var pageurl = "";
        if (isBackDoorEvent == true) {
            pageurl = basePath + "/event/dealEventView.backDoorEventConfirmView.action?eventIds=" + ids.join(',') + "&domainName=" + $("#occurDomainName").val();
        } else if (isLoopholeEvent == true) {
            pageurl = basePath + "/event/dealEventView.loopholeEventConfirmView.action?eventIds=" + ids.join(',') + "&sendTo=" + $("#sendTo").val();
        } else {
            pageurl = basePath + "/event/dealEventView.eventConfirmView.action?eventIds=" + ids.join(',') + "&corporationId=" + $("#dealCorporationId").val() + "&corporationName=" + encodeURIComponent($("#corporationName").val());
        }
        showDialog(pageurl);
        eventCountDealDefault = true;
        eventCountColorHasChange = false;
        // showModalDialog(pageurl, subParemeter, winSetStr);
        // reloadDataGrid();
    } catch (e) {
        alert(e);
    }
}
/**
 * 事件忽略
 */
function eventIgnore() {
    try {
        var ids = [];
        var rows = getSelectedRowData();
        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        }
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
        }
        $.messager.confirm('提示信息', "是否将所选的事件忽略?", function () {
            /*
             * var subParemeter = new Array(); var winSetStr = "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes"; var
             * pageurl = basePath + "event/dealEvent.dealEvent.action?id="+ids.join(',')+"&dealAction="+encodeURI(encodeURI("忽略")); showModalDialog(pageurl, subParemeter,
             * winSetStr);
             */
            // $.messager.alert("This is message!");
            var pageurl = basePath + "event/dealEvent.dealEvent.action?id=" + ids.join(',') + "&dealAction=" + encodeURIComponent("忽略");
            // showDialog(pageurl);
            eventCountDealDefault = true;
            eventCountColorHasChange = false;
            showAjaxResultDialog(pageurl);
            // reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }
}
/**
 * 事件回退
 */
function singleEventBack() {
    try {
        var ids = [];
        var rows = getSelectedRowData();
        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        }
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
        }
        $.messager.confirm('提示信息', "是否要将事件进行回退?", function () {
            var pageurl = basePath + "event/dealEvent.dealEvent.action?id=" + ids + "&dealAction=" + encodeURIComponent("回退");
            eventCountDealDefault = true;
            eventCountColorHasChange = false;
            showAjaxResultDialog(pageurl);
            // reloadDataGrid();
        });

    } catch (e) {
        alert(e);
    }
}

/**
 * 事件处置
 */
function deal() {
    try {
        var ids = [];
        var rows = getSelectedRowData();
        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        }
        var isBackDoorEvent = false;
        var isloopHoleEvent = false;
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
            if (rows[i].eventType == "网站后门") {
                isBackDoorEvent = true;
            }
            if (rows[i].eventType == "漏洞事件") {
                isloopHoleEvent = true;
            }
        }
        // var subParemeter = new Array();
        // var winSetStr =
        // "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
        var params1 = "&corporationId=" + $("#dealCorporationId").val() + "&corporationName=" + encodeURIComponent($("#corporationName").val());
        if (isBackDoorEvent == true) {
            params1 = params1 + "&isShowTemplate=true&type=0";
        }
        if (isloopHoleEvent == true) {
            params1 = params1 + "&isShowTemplate=true&type=1";
        }
        if ($("#dealMonitorType").val() == 0) {
            params1 = params1 + "&isShowTemplate=true";
        }
        var pageurl = basePath + "/event/dealEventView.dealView.action?formType=" + $("#dealMonitorType").val() + "&eventIds=" + ids + params1;
        // showModalDialog(pageurl, subParemeter, winSetStr);
        eventCountDealDefault = true;
        //isOnclickEventDealMenu = true;
        eventCountColorHasChange = false;
        showDialog(pageurl);
        // reloadDataGrid();
    } catch (e) {
        alert(e);
    }
}
/**
 * 更改公函号打开页面.
 */
function changeDealDocSn() {
    try {
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        }
        if (rows[0].dealDocSn == "") {
            $.messager.alert('提示信息', '该数据不能进行更换函号!', 'warning');
            return;
        }
        $("#dealDocSnValue").val('');
        document.getElementById("dealEventSN").style.display = "block";
        $("#dealEventSN").dialog({
            title: "更改公函号",
            'class': "mydialog" /* add custom class for this dialog */
            ,
            onClose: function () {
                $(this).dialog("close");
            },
            buttons: [{
                text: "确定",
                'class': "btn-primary",
                click: function () {
                    dealDocSn();
                }
            }, {
                text: "取消",
                'class': "btn-success",
                click: function () {
                    /* your login handler */

                    $(this).dialog("close");
                }
            }]
        });
    } catch (e) {
        alert(e);
    }
}

/**
 * 改变公函号
 */
function dealDocSn() {
    try {
        var dealDocSnValue = $("#dealDocSnValue").val();
        if (validateRequired(dealDocSnValue) == false) {
            $.messager.alert('提示信息', '公函号不能为空!', 'warning');
            return;
        }
        if (validateInteger(dealDocSnValue) == false) {
            $.messager.alert('提示信息', '公函号需要一个整数!', 'warning');
            return;
        }

        var dealPath = [];
        var oldDealDocSn = [];
        var dealFormId = [];
        var rows = getSelectedRowData();
        for (var i = 0; i < rows.length; i++) {
            dealPath.push(rows[i].dealDocPath);
            oldDealDocSn.push(rows[i].dealDocSn);
            dealFormId.push(rows[i].id);
        }
        $("#dealEventSN").dialog("close");
        // var subParemeter = new Array();
        // var winSetStr =
        // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
        var pageurl = basePath + "event/dealEvent.changeDealDocSn.action?dealFormId=" + dealFormId.join(",") + "&dealDocSn=" + dealDocSnValue + "&dealDocPath=" + dealPath.join(',') + "&oldDealDocSn=" + encodeURIComponent(oldDealDocSn.join(','));
        // showModalDialog(pageurl, subParemeter, winSetStr);
        showAjaxResultDialog(pageurl);
        reloadDataGrid();
    } catch (e) {
        alert(e);
    }

}

/**
 * 下载公函文档.
 */
function downloadDealDoc() {
    try {
        var dealDocPath = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            if (rows[0].dealDocPath == "") {
                $.messager.alert('提示信息', '该处置单没有公函文档可以下载!', 'warning');
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                dealDocPath.push(rows[i].dealDocPath);
            }
        }
        var url = basePath + "/application/download.downloadAttachmentByUuid.action?uuid=" + dealDocPath;
        window.location.href = url;
    } catch (e) {
        alert(e);
    }

}
/**
 * 上传公函文档
 */
function uploadDealDoc() {
    try {
        var dealDocPath = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            if (rows[0].dealDocPath == "") {
                $.messager.alert('提示信息', '该处置单不能进行公函文档上传!', 'warning');
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                dealDocPath.push(rows[i].dealDocPath);
            }
        }
        // var winSetStr =
        // "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
        var pageurl = basePath + "resource/resourceView.uploadResourceView.action?actionTarget=event/dealEvent.uploadDealDocResource.action?uuid=" + dealDocPath;
        // showModalDialog(pageurl, null, winSetStr);
        showDialog(pageurl);
    } catch (e) {
        alert(e);
    }

}
/**
 * 处置单回退.
 */
function sendBackForm() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "是否要将处置单进行回退?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var pageurl = basePath + "event/dealEvent.dealEventForm.action?dealFormIds=" + dealformId + "&dealAction=" + encodeURIComponent("处置单回退");
            // showModalDialog(pageurl, subParemeter,
            // winSetStr);
            eventCountDealDefault = true;
            showAjaxResultDialog(pageurl);
            // reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }

}

/**
 * 处置单发布
 */
function formPublish() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "是否要将选中的处置单进行发布?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var pageurl = basePath + "event/dealEvent.dealEventForm.action?dealFormIds=" + dealformId + "&dealAction=" + encodeURIComponent("处置单发布");
            // showModalDialog(pageurl, subParemeter,
            // winSetStr);
            eventCountDealDefault = true;
            showAjaxResultDialog(pageurl);
            // reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }

}
/**
 * 查看安全事件
 */
function lookupFormEvents() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }

        var width = 800; // 弹出窗口的宽度;
        var heigth = 600; // 弹出窗口的高度;
        var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
        var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
        var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no";

        // var winSetStr =
        // "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
        var pageurl = basePath + "event/dealEventView.lookupFormEventView.action?dealformId=" + dealformId;
        // showModalDialog(pageurl, null, winSetStr);
        window.open(pageurl, null, windowParam);
    } catch (e) {
        alert(e);
    }

}
/**
 * 处置单安全事件下载
 */
function downloadFormEvent() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }
        window.location.href = basePath + "/event/dealEvent.downloadFormEvent.action?dealFormId=" + dealformId;
    } catch (e) {
        alert(e);
    }
}
/**
 * 导出事件
 */
function exportFormEvent() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }
        window.location.href = basePath + "/event/dealEvent.exportFormEvent.action?dealFormId=" + dealformId;
    } catch (e) {
        alert(e);
    }
}

/**
 * 反馈
 */
function feedbackForm() {
    try {
        var dealformId = [];
        var rows = getSelectedRowData();

        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                dealformId.push(rows[i].id);
            }
        }

        var winSetStr = "status:no;dialogWidth:800px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes";
        var pageurl = basePath + "event/dealEventView.reBackView.action?dealFormId=" + dealformId;
        // CHRMOE不支持showModalDialog
        var browserUserAgent = navigator.userAgent.toLowerCase();
        if (browserUserAgent.indexOf("chrome") == -1) {
            // 非CHROME
            showModalDialog(pageurl, null, winSetStr);
        } else {
            var width = 800; // 弹出窗口的宽度;
            var heigth = 600; // 弹出窗口的高度;
            var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
            var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
            var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left
                + ", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no";

            // 如果是CHROME就弹出页面
            // "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
            window.open(pageurl, "选择", windowParam, true);
        }
        // window.open(pageurl);
        eventCountDealDefault = true;
        reloadDataGrid();
    } catch (e) {
        alert(e);
    }
}

/**
 * 上传附件.
 */
/*
 * function uploadFeedBackFile() { try { var dealformId = []; var rows = getSelectedRowData();
 * 
 * if (rows.length != 1) { $.messager.alert('提示信息', '请选择一条数据!', 'warning'); return; } else { for ( var i = 0; i < rows.length; i++) { dealformId.push(rows[i].id); } } // var
 * winSetStr = // "status:no;dialogWidth:800px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes"; var pageurl = basePath +
 * "resource/resourceView.uploadResourceView.action?dealFormId=" + dealformId + "&actionTarget=event/dealEventView.parseUploadResource.action&isEventUpload=1"; //
 * showModalDialog(pageurl, null, winSetStr); showDialog(pageurl); reloadDataGrid(); } catch (e) { alert(e); } }
 */

/** 下载通报文档* */
function TSSF0105_JS_exportRptDoc() {
    var rows = getSelectedRowData();
    var ids = [];
    if (rows.length == 0) {
        $.messager.alert('提示信息', '请选择数据!');
        return;
    } else {
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
        }

        var url = basePath + "/report/documentCtrl.downloadDocRpt.action?id=" + ids;
        window.location.href = url;
    }
    /*******************************************************************************************************************************************************************************
     * if (rows.length != 1) { $.messager.alert('提示信息', '请选择一条数据!', 'warning'); return; } else { var docId = ""; if (rows[0].docId) { docId = rows[0].docId; } else { docId =
	 * rows[0].id; } var url = basePath + "/report/documentCtrl.downloadDocRpt.action?id=" + docId; window.location.href = url; }
     ******************************************************************************************************************************************************************************/
}

/** 上传通报文档* */
function TSSF0105_JS_uploadRptDoc() {
    var ids = [];
    var rows = getSelectedRowData();

    if (rows.length != 1) {
        $.messager.alert('提示信息', '请选择一条数据!', 'warning');
        return;
    } else {
        var columns = getCurrentTableColumns();
        var selectDate = "";
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
            selectDate += rows[i][columns[2]["data"]] + "：上传通报文档?<br>";
        }
        $.messager.confirm('提示信息', selectDate, function () {
            var url = basePath + "/resource/resourceView.uploadResourceView.action?className=" + className + "&dealFormId=" + ids.join(',') + "&actionTarget=report/documentCtrl.uploadDocRpt.action";
            showDialog(url);
        });
    }
}
// 审阅
function TSSF1101_JS_REVIEW() {
    var rows = getSelectedRowData();

    if (rows.length != 1) {
        $.messager.alert('提示信息', '请选择一条需要审阅的数据!', 'warning');
        return;
    } else {
        var url = basePath + "/report/documentView.reviewDocView.action?id=" + rows[0].id;
        showDialog(url);
    }
}

function TSSF1102_JS_PUBLISH() {
    var rows = getSelectedRowData();

    if (rows.length != 1) {
        $.messager.alert('提示信息', '请选择一条需要发布的数据!', 'warning');
        return;
    } else {
        var url = basePath + "/report/documentCtrl.publishAndSendSave.action?methodType=publish&id=" + rows[0].id;
        showDialog(url);
    }
}
function TSSF1103_JS_SEND() {
    var rows = getSelectedRowData();

    if (rows.length != 1) {
        $.messager.alert('提示信息', '请选择一条需要派送的数据!', 'warning');
        return;
    } else {
        var url = basePath + "/report/documentView.publishAndSendView.action?methodType=send&id=" + rows[0].id;
        showDialog(url);
    }
}
/**
 * 批量更新.
 */
function TSSF0102_JS_Batch_Edit() {

    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择数据!');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }

            var url = basePath + "/resource/resourceView.batchUpdateFieldView.action?className=" + className + "&ids=" + ids.join(',');
            showDialog(url, "修改资源");
            /*
             * $.messager.confirm('提示信息', selectDate, function() { var data = {}; data["className"] = className; data["ids"] = ids.join(','); JSendAjax(basePath +
             * "resource/resource.batchDeleteResource.action", data, "json", "删除资源"); });
             */
        }
    } catch (e) {
        alert(e);
    }
}

/**
 * 专项添加.
 */
function TSSF0101_JS_SseTopicAdd() {
    try {
        var url = basePath + "/resource/resourceView.sseSpecialTopicSaveView.action?type=0&className=" + className;
        showDialog(url, "添加资源");
    } catch (e) {
        alert(e);
    }
}
/**
 * 专项更新.
 */
function TSSF0102_JS_SseTopicUpdate() {
    try {
        var rows = getSelectedRowData();
        if (rows.length != 1) {
            $.messager.alert('提示信息', '请选择一条数据进行编辑');
            return;
        } else {
            var url = basePath + "/resource/resourceView.sseSpecialTopicSaveView.action?className=" + className + "&id=" + rows[0].id;
            showDialog(url, "修改资源");
        }
    } catch (e) {
        alert(e);
    }
}
/**
 * 专项启动
 */
function TSSF0901_JS_Start() {
    try {
        var topicId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                topicId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "启动选中的专项?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var url = basePath + "/resource/resource.saveResource.action?className=" + className + "&id=" + topicId + "&_pageSaveOperation=batchUpdate" + "&status=1";
            // showModalDialog(pageurl, subParemeter, winSetStr);
            showAjaxResultDialog(url);
            reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }
}
/**
 * 专项停止
 */
function TSSF0902_JS_Stop() {
    try {
        var topicId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                topicId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "停止选中的专项?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var url = basePath + "/resource/resource.saveResource.action?className=" + className + "&id=" + topicId + "&_pageSaveOperation=batchUpdate" + "&status=0";
            // showModalDialog(pageurl, subParemeter, winSetStr);
            showAjaxResultDialog(url);
            reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }
}
/**
 * 改变左侧徽章的值.
 *
 * @param value
 */
function changeLeftBadgeValue(value) {
    $('#sidebarNavListNode li').each(function () {
        var className = $(this).attr("class");
        if (className == "bs-callout bs-callout-selected") {
            if ($(this).find("span").length > 0) {
                if (eventCountDealDefault == true) {
                    if (value == 0) {
                        if ($(this).html().indexOf("待发布工单") > 0 || $(this).html().indexOf("待反馈工单") > 0) {
                            $(this).find("span").html(0);
                            return;
                        }
                        $(this).remove();
                    } else {
                        $(this).find("span").html(value);
                        //事件处置点击按钮标示
                        //if(isOnclickEventDealMenu) {
                        if (eventCountColorHasChange) {
                            $(this).find("span").css("color", "#a94442");
                        } else {
                            $(this).find("span").css("color", "");
                        }
                        //}
                        //		$(this).find("span").css("color","#a94442");
                    }
                }
            }
        }
    });
    if ($('#sidebarNavListNode li').length <= 0 && $('#sidebarNavListNode').html() == '') {
        $("#sidebarNavListNode").append("<li><a href='javascript:void(0)'>无数据显示!</a></li>");
    }
}
/**
 * 信息采用.
 */
function TSSF1001_JS_Use() {
    try {
        var mesId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                mesId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "采用所选信息?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var url = basePath + "/resource/resource.saveResource.action?className=" + className + "&id=" + mesId + "&_pageSaveOperation=batchUpdate" + "&status=2";
            // showModalDialog(pageurl, subParemeter, winSetStr);
            showAjaxResultDialog(url);
            reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }
}
/**
 * 信息废弃.
 */
function TSSF1002_JS_NotUse() {
    try {
        var mesId = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据!', 'warning');
            return;
        } else {
            for (var i = 0; i < rows.length; i++) {
                mesId.push(rows[i].id);
            }
        }
        $.messager.confirm('提示信息', "废弃所选信息?", function () {
            // var subParemeter = new Array();
            // var winSetStr =
            // "top=550,left=550,status:no;dialogWidth:500px;dialogHeight:300px,resizable:yes,scroll:yes,help:no,unadorned:yes";
            var url = basePath + "/resource/resource.saveResource.action?className=" + className + "&id=" + mesId + "&_pageSaveOperation=batchUpdate" + "&status=1";
            // showModalDialog(pageurl, subParemeter, winSetStr);
            showAjaxResultDialog(url);
            reloadDataGrid();
        });
    } catch (e) {
        alert(e);
    }
}

/**
 * 专项排序.
 */
function TSSF0101_JS_Sort() {
    try {
        var url = basePath + "/resource/resourceView.sseSpecialSortView.action?className=" + className;
        showDialog(url, "专项排序");
    } catch (e) {
        alert(e);
    }
}
function TSSF0101_JS_typeSseDataMonthly() {
    //
    popWindowOnCenter(basePath + "/assessment/assessmentView.monthDataView.action?className=" + className, "blank", 1000, 600);
}
function TSSF0101_JS_typeSseDataWeekly() {
    //
    popWindowOnCenter(basePath + "/assessment/assessmentView.weekDataView.action?className=" + className, "blank", 1000, 600);
}

function popWindowOnCenter(targetUrl, openTarget, width, heigth) {

    var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
    var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
    var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no";

    window.open(targetUrl, openTarget, windowParam);

}
/**
 * 导入外部文档.
 */
function TSSF0105_JS_ImportOutRptDocument() {
    try {
        var url = basePath + "resource/resourceView.importResourceUploadView.action?className=" + className + "&actionTarget=resource/resource.importOutRptDocumentResource.action";
        window.open(url, '导入IP资源');
    } catch (e) {
        alert(e);
    }
}
/**
 * 导入处置单.
 */
function TSSF0104_JS_ImportOutDealForm() {
    try {
        var url = basePath + "resource/resourceView.importResourceUploadView.action?className=" + className + "&actionTarget=resource/resource.importDealFormResource.action";
        window.open(url, '导入处置单资源');
    } catch (e) {
        alert(e);
    }
}
/**
 * 资源IP创建.
 */
function TSSF0101_JS_ResIp_Add() {
    try {
        var url = "";
        if (typeof (corporationId) == 'undefined') {
            url = basePath + "/resource/resourceView.createView.action?className=" + className + "&actionTarget=resource/resource.saveIPResource.action";
        } else {
            var assignNames = "belongCorporationId,belongCorporationId_display";
            var assignValues = corporationId + "*" + corporationName;
            url = basePath + "/resource/resourceView.createView.action?className=" + className + "&assignNames=" + encodeURIComponent(assignNames) + "&assignValues=" + encodeURIComponent(assignValues) + "&actionTarget=resource/resource.saveIPResource.action";
        }
        showDialog(url, "添加资源");
    } catch (e) {
        alert(e);
    }
    /**
     * try { var url = basePath + "/resource/resourceView.createView.action?className=" + className; var winSetStr =
	 * "status:no;dialogWidth:800px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes"; showModalDialog(url, null, winSetStr); reloadDataGrid(); } catch (e) {
	 * alert(e); }
     */
}
/**
 * 下载历史事件.
 */
function TSSF0105_JS_DownHistoryEvent() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要导出的记录!');
            return;
        } else {
            var data = {};
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            // data["className"] = className;
            // data["ids"] = ids.join(',');
            window.location.href = basePath + "event/dealEvent.downHistoryEventResource.action?className=" + className + "&ids=" + ids.join(",");
            // JSendAjax(basePath + "resource/resource.exportResource.action",
            // data, "json", "导出数据");
        }
    } catch (e) {
        alert(e);
    }
}
/**
 * 下载历史处置单.
 */
function TSSF0105_JS_DownHistoryDealForm() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择需要导出的记录!');
            return;
        } else {
            var data = {};
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            // data["className"] = className;
            // data["ids"] = ids.join(',');
            window.location.href = basePath + "event/dealEvent.downHistoryEventDealFormResource.action?className=" + className + "&ids=" + ids.join(",");
            // JSendAjax(basePath + "resource/resource.exportResource.action",
            // data, "json", "导出数据");
        }
    } catch (e) {
        alert(e);
    }
}
/**
 * 历史处置单查看反馈.
 */
function TSSF0101_JS_LookFeedBack() {
    var rows = getSelectedRowData();
    if (rows.length != 1) {
        $.messager.alert('提示信息', '请选择一条数据!');
        return;
    } else {
        var width = 800; // 弹出窗口的宽度;
        var heigth = 600; // 弹出窗口的高度;
        var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
        var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
        var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no";
        var tableDataAjaxUrl = "resource/resource.listResourceByCondition.action?dealFormId=" + rows[0].id;
        var url = basePath + "resource/resourceView.listView.action?tableDataAjaxUrl=" + tableDataAjaxUrl + "&className=com.topsec.tss.core.web.resource.module.HDelFormFeedback";
        window.open(url, 'null', windowParam);
    }
}

/** 资源类 JS删除方法* */
function DELETE_SELECT_DATA() {
    try {
        var ids = [];
        var rows = getSelectedRowData();

        if (rows.length == 0) {
            $.messager.alert('提示信息', '请选择一条数据进行删除!');
            return;
        } else {
            var columns = getCurrentTableColumns();
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].id);
            }
            var iWidth = 800;                          //弹出窗口的宽度;
            var iHeight = 600;
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;       //获得窗口的垂直位置;
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;           //获得窗口的水平位置;
            var openParam = "height=" + iHeight + ",width=" + iWidth + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,menubar=no,status=no,hotkeys=yes";
            window.open(basePath + 'plugins/resource/resourceDelete.jsp', 'openPage', openParam);
            postSubmit(basePath + 'plugins/resource/resourceDelete.jsp', className, ids.join(","));
        }
    } catch (e) {
        alert(e);
    }
}
/**
 * window.open POST 提交
 * @param url
 * @param postData
 */
function postSubmit(url, className, ids) {
    var ExportForm = document.createElement("FORM");
    document.body.appendChild(ExportForm);
    ExportForm.method = "POST";
    ExportForm.target = "openPage";
    var newElement1 = document.createElement("input");
    newElement1.setAttribute("name", "ids");
    newElement1.setAttribute("type", "hidden");

    var newElement2 = document.createElement("input");
    newElement2.setAttribute("name", "className");
    newElement2.setAttribute("type", "hidden");

    ExportForm.appendChild(newElement1);
    ExportForm.appendChild(newElement2);
    newElement1.value = ids;
    newElement2.value = className;
    ExportForm.action = url;
    ExportForm.submit();
};  