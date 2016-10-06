<%--
  Created by IntelliJ IDEA.
  User: baiyanwei
  Date: 10/6/16
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mpe.portal.web.resources.modules.ResMessage" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    ResMessage resMessage = (ResMessage) request.getAttribute("resMessage");
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<html>
<head>
    <title>反馈消息</title>
    <link href="/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="page-header">
            <h3>反馈消息</h3>
        </div>
        <form class="form-horizontal" name="resourceForm" id="resourceForm" enctype="multipart/form-data" action="/message/message.feedbackMessage.action"
              method="post" role="form">
            <input type="hidden" name="id" value="<%=resMessage.getId()%>">
            <div class="col-md-12">
                <section id="companyImportSection">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机号码:</label>
                        <div class="col-sm-7">
                            <span><%=resMessage.getMobile()%></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>姓名:</label>
                        <div class="col-sm-7">
                            <span><%=resMessage.getName()%></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label class="col-sm-3 control-label">邮箱:</label>
                        <div class="col-sm-7 ">
                            <span><%=resMessage.getEmail()%></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label class="col-sm-3 control-label">留言时间:</label>
                        <div class="col-sm-7 ">
                            <span><%=(resMessage.getMessageAt() == null ? "" : simpleDateFormat.format(resMessage.getMessageAt()))%></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="message" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>留言:</label>
                        <div class="col-sm-7">
                            <textarea class="form-control" id="message" name="message" placeholder="输入留言"
                                      readonly="true"><%=resMessage.getMessage()%></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label class="col-sm-3 control-label">反馈人员:</label>
                        <div class="col-sm-7 ">
                            <span><%=(resMessage.getFeedbackBy() == null ? "" : resMessage.getFeedbackBy())%></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label class="col-sm-3 control-label">反馈时间:</label>
                        <div class="col-sm-7 ">
                            <span><%=(resMessage.getFeedbackAt() == null ? "" : simpleDateFormat.format(resMessage.getFeedbackAt()))%></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="feedback" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>反馈内容:</label>
                        <div class="col-sm-7">
                            <textarea class="form-control" id="feedback" name="feedback"
                                      placeholder="输入反馈内容"><%=(resMessage.getFeedback() == null ? "" : resMessage.getFeedback())%></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </div>
</div>
<div class="modal-footer" id="tss-operation-div">
    <input class="btn btn-primary" type="button" name="Submit" value="反馈" onclick="myFormSubmit(resourceForm)"/>
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
            var feedbackElement = document.getElementById("feedback");
            clearErrorOnFormElement(feedbackElement);
            if (validateRequired(feedbackElement.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(feedbackElement, "不能为空");
            }
            //


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