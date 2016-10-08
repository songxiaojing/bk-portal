<%--
  Created by IntelliJ IDEA.
  User: baiyanwei
  Date: 10/6/16
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.utils.WebText" %>
<html>
<head>
    <title><%=WebText.WEB_TITLE%>
    </title>
    <link href="/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="page-header">
            <h3>反馈消息</h3>
        </div>
        <form class="form-horizontal" name="resourceForm" id="resourceForm" enctype="multipart/form-data" action="/news/news.publishNews.action"
              method="post" role="form">
            <div class="col-md-12">
                <section id="companyImportSection">
                    <div class="form-group">
                        <label for="newCatagory" class="col-sm-3 control-label">新闻类型:</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="newCatagory" name="newCatagory">
                                <option value="公司" selected>公司</option>
                                <option value="行业">行业</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newTitle" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>标题:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="newTitle" name="newTitle" placeholder="请输入新闻标题">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label for="newSource" class="col-sm-3 control-label">来源:</label>
                        <div class="col-sm-7 ">
                            <input type="text" class="form-control" id="newSource" name="newSource" placeholder="请输入来源">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label for="newPicture" class="col-sm-3 control-label">新闻图片:</label>
                        <div class="col-sm-7 ">
                            <input type="file" id="newPicture" name="newPicture">
                            <span class="help-block"></span>
                            <span>图片格式：.jpg,.png；图片大小不大于2M</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newBody" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>新闻内容:</label>
                        <div class="col-sm-7">
                            <textarea class="form-control" id="newBody" name="newBody" placeholder="输入新闻内容"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </div>
</div>
<div class="modal-footer" id="tss-operation-div">
    <input class="btn btn-primary" type="button" name="Submit" value="发布" onclick="myFormSubmit(resourceForm)"/>
</div>
<!-- BOOTSTRAP AND JQUERY -->
<script src="/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/plugins/jquery/jquery.bootstrap.min.js" type="text/javascript"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/form-validate.js"></script>
<script type="text/javascript">
    function myFormSubmit(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
            //
            var newTitle = document.getElementById("newTitle");
            clearErrorOnFormElement(newTitle);
            if (validateRequired(newTitle.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(newTitle, "不能为空");
            }
            //
            var newBody = document.getElementById("newBody");
            clearErrorOnFormElement(newTitle);
            if (validateRequired(newTitle.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(newBody, "不能为空");
            }

            var newPicture = document.getElementById("newPicture");
            clearErrorOnFormElement(newPicture);
            if (validateRequired(newPicture.value) == true && verifyＵploadfile(newPicture, ".jpg,.png") == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(newBody, "只可以上传 .jpg,.png 类型的图片");
            }

            if (isSubmit == true) {
                targetForm.submit();
            }

        } catch (e) {
            alert(e);
        }
    }
</script>
</body>
</html>