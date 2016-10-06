


/**
 * 详细页跳转路径
 */
function detail(targetUrl) {
    // showDialog(basePath+targetUrl,"查看详细信息");
    // var winSetStr =
    // "status:no;dialogWidth:810px;dialogHeight:600px,resizable:yes,scroll:yes,help:no,unadorned:yes";
    var width = 800; // 弹出窗口的宽度;
    if (targetUrl.indexOf("className=com.topsec.tss.core.web.resource.module.ResCorporation") > -1) {
        width = 1000;
    }
    var heigth = 600; // 弹出窗口的高度;
    var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
    var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
    var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no";

    window.open(basePath + targetUrl, '_target', windowParam);

    //
    // showModalDialog(basePath + targetUrl, null, winSetStr);
}

/**
 * 弹出子页面，进行选择资源
 *
 * @param ppName
 * @param disPpName
 * @param clazz
 * @param selectOperation
 *            more多选，其它单选
 */
function selectSubPageViewDialog(ppName, disPpName, clazz, selectOperation, url) {
    try {
        var subParemeter = new Array();
        subParemeter[0] = window;
        subParemeter[1] = document;
        subParemeter[2] = document.getElementById(ppName);
        subParemeter[3] = document.getElementById(disPpName);
        subParemeter[4] = selectOperation;
        var winSetStr = "status:no;dialogWidth:810px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes";
        //
        var pageurl;
        if (url != "") {
            if (url.indexOf('?') != -1) {
                pageurl = basePath + url + "&className=" + clazz;
            } else {
                pageurl = basePath + url + "?className=" + clazz;
            }

        } else {
            pageurl = basePath + "resource/resourceView.subPageListView.action?className=" + clazz;
        }
        // CHRMOE不支持showModalDialog
        var browserUserAgent = navigator.userAgent.toLowerCase();
        if (browserUserAgent.indexOf("chrome") == -1) {
            // 非CHROME
            showModalDialog(pageurl, subParemeter, winSetStr);
        } else {
            var width = 800; // 弹出窗口的宽度;
            var heigth = 600; // 弹出窗口的高度;
            var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
            var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
            var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no";

            // 如果是CHROME就弹出页面
            // "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
            var model = window.open(pageurl, "选择" + disPpName, windowParam, true);
            model.dialogArguments = subParemeter;
        }
    } catch (e) {
        alert(e);
    }
}

/**
 * 弹出子页面，进行选择资源
 *
 * @param ppName
 * @param disPpName
 * @param clazz
 * @param selectOperation
 *            more多选，其它单选
 */
function showFixableSelectorDialog(ppName, refField, clazz, selectOperation, url) {
    try {
        var subParemeter = new Array();
        subParemeter[0] = window;
        subParemeter[1] = document;
        subParemeter[2] = document.getElementById(ppName);
        subParemeter[3] = refField;
        subParemeter[4] = selectOperation;
        var winSetStr = "status:no;dialogWidth:810px;dialogHeight:600px,resizable:no,scroll:no,help:no,unadorned:yes";
        //
        var pageurl;
        if (url != "") {
            if (url.indexOf('?') != -1) {
                pageurl = basePath + url + "&" + refField + "=" + document.getElementById(refField).value + "&className=" + clazz;
            } else {
                pageurl = basePath + url + "?" + refField + "=" + document.getElementById(refField).value + "&className=" + clazz;
            }


        } else {
            alert("无效的URL");
            return;
        }

        // CHRMOE不支持showModalDialog
        var browserUserAgent = navigator.userAgent.toLowerCase();
        if (browserUserAgent.indexOf("chrome") == -1) {
            // 非CHROME
            showModalDialog(pageurl, subParemeter, winSetStr);
        } else {
            var width = 800; // 弹出窗口的宽度;
            var heigth = 600; // 弹出窗口的高度;
            var top = (window.screen.availHeight - 30 - heigth) / 2; // 获得窗口的垂直位置;
            var left = (window.screen.availWidth - 10 - width) / 2; // 获得窗口的水平位置;
            var windowParam = "height=" + heigth + ", width=" + width + ", top=" + top + ",left=" + left + ", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no";

            // 如果是CHROME就弹出页面
            // "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
            var model = window.open(pageurl, "选择", windowParam, true);
            model.dialogArguments = subParemeter;
        }
    } catch (e) {
        alert(e);
    }
}

// 设置子元素选择值范围
function setSubElementSelectValue(fatherElementId, dimType, subElementId) {
    if (fatherElementId == null || fatherElementId == "") {
        return;
    }
    if (subElementId == null || subElementId == "") {
        return;
    }
    try {
        var fatherElement = document.getElementById(fatherElementId);
        var subElement = document.getElementById(subElementId);
        //
        subElement.options.length = 0;

        $.ajax({
            type: "post",
            url: basePath + "resource/resource.bulidDictionaryCombobox.action",
            cache: false,
            data: {
                "fatherElement": fatherElement.value,
                "dimType": dimType

            },
            dataType: "json",
            success: function (data) {
                subElement.options.add(new Option("---请选择---", ""));
                for (var i = 0; i < data.length; i++) {
                    subElement.options.add(new Option(data[i][0], data[i][1]));
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                subElement.options.add(new Option("---请选择---", ""));
            }
        });
    } catch (e) {
        alert(e);
    }
}
