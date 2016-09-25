<%@ page import="com.bellwin.brokers.modules.center.module.SysDictionary" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%
    List<SysDictionary> netAssetsList = (List<SysDictionary>) request.getAttribute("open.b.netAssets");
    List<SysDictionary> netCurrentAssetsList = (List<SysDictionary>) request.getAttribute("open.b.netCurrentAssets");
    List<SysDictionary> netAnnualIncomeList = (List<SysDictionary>) request.getAttribute("open.b.netAnnualIncome");
    List<SysDictionary> totalAssetsList = (List<SysDictionary>) request.getAttribute("open.b.totalAssets");
    List<SysDictionary> transactionsNumberList = (List<SysDictionary>) request.getAttribute("open.b.transactionsNumber");
    List<SysDictionary> transactionsNumPerYearList = (List<SysDictionary>) request.getAttribute("open.b.transactionsNumPerYear");

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

    <title>第三步 投资信息填写</title>
    <link href="/plugins/gsdk/bootstrap3/css/bootstrap.css" rel="stylesheet"/>
    <link href="/plugins/gsdk/assets/css/get-done.css" rel="stylesheet"/>

    <!--     Font Awesome     -->
    <link href="/plugins/gsdk/bootstrap3/css/font-awesome.css" rel="stylesheet">
    <link href="/plugins/gsdk/assets/css/googleapi-fonts.css" rel='stylesheet' type='text/css'>
    <!-- form and register step-->
    <link href="/theme/defaut/css/main.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/form.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/open-step.css" rel='stylesheet' type='text/css'>
</head>

<body>
<!-- Begin page content -->
<div class="container">
    <section id="openAccountStepBars">
        <div class="row">
            <div class="col-md-12 text-center">
                <ul class="nav nav-pills step-bar-ul">
                    <li><img src="/theme/defaut/images/logo1-4.png"></li>
                    <li class="step-bar-active">
                        <div></div>
                        #1注册账号<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #2填写资料<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-active">
                        <div></div>
                        #3投资信息<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #4阅读协议</span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #5上传资料</span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #6完成开户
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <div class="page-header">
        <h3>投资信息
            <small>第三步</small>
        </h3>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <section id="companyImportSection">
                <form class="form-horizontal" id="openStepForm" action="/account/openStepB.saveStepCustomerInfo.action" method="post" enctype="multipart/form-data">
                    <div class="page-header">
                        <h4>净资产与净收入
                        </h4>
                    </div>
                    <div class="form-group">
                        <label for="netAssets" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>净资产:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="netAssets" name="netAssets" placeholder="请选择净资产">
                                <option value="">请选择净资产</option>
                                <%
                                    if (netAssetsList != null && netAssetsList.isEmpty() == false) {
                                        for (SysDictionary sysDictionary : netAssetsList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                            <span>去除您的负债、贷款以及房屋贷款后的资产总和</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="netCurrentAssets" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>净流动资产:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="netCurrentAssets" name="netCurrentAssets" placeholder="请选择净流动资产">
                                <option value="">请选择净流动资产</option>
                                <%
                                    if (netCurrentAssetsList != null) {
                                        for (SysDictionary sysDictionary : netCurrentAssetsList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                            <span>您手上持有的现金、能变现的股票和理财产品的资产总和</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="netAnnualIncome" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>净年收入:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="netAnnualIncome" name="netAnnualIncome" placeholder="请选择净年收入">
                                <option value="">请选择净年收入</option>
                                <%
                                    if (netAnnualIncomeList != null) {
                                        for (SysDictionary sysDictionary : netAnnualIncomeList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                            <span>税后的年收入</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="totalAssets" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>总资产:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="totalAssets" name="totalAssets" placeholder="请选择行业总资产">
                                <option value="">请选择行业总资产</option>
                                <%
                                    if (totalAssetsList != null) {
                                        for (SysDictionary sysDictionary : totalAssetsList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                            <span>包含您负债和贷款的资产总和</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="investmentObjective1" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>投资目标:</label>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="checkbox" name="investmentObjective" id="investmentObjective1" value="资本增长">资本增长
                            </label>
                            <label class="radio-inline">
                                <input type="checkbox" name="investmentObjective" id="investmentObjective2" value="交易利润">交易利润
                            </label>
                            <label class="radio-inline">
                                <input type="checkbox" name="investmentObjective" id="investmentObjective3" value="投机">投机
                            </label>
                            <label class="radio-inline">
                                <input type="checkbox" name="investmentObjective" id="investmentObjective" value="对冲">对冲
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="transactionsNumber" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>交易年数:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="transactionsNumber" name="transactionsNumber" placeholder="请选择交易年数">
                                <option value="">请选择交易年数</option>
                                <%
                                    if (transactionsNumberList != null) {
                                        for (SysDictionary sysDictionary : transactionsNumberList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="transactionsNumPerYear" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>每年交易次数:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="transactionsNumPerYear" name="transactionsNumPerYear" placeholder="请选择每年交易次数">
                                <option value="">请选择每年交易次数</option>
                                <%
                                    if (transactionsNumPerYearList != null) {
                                        for (SysDictionary sysDictionary : transactionsNumPerYearList) {
                                            out.println("<option value=\"" + sysDictionary.getValue() + "\">" + sysDictionary.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="educationLevel" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>知识水平:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="educationLevel" name="educationLevel" placeholder="请选择知识水平">
                                <option value="">请选择知识水平</option>
                                <option value="丰富">丰富</option>
                                <option value="良好">良好</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="usStockExperience" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>美股经验：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="usStockExperience" name="usStockExperience" placeholder="请选择美股经验">
                                <option value="">请选择美股经验</option>
                                <option value="具有美股经验">具有美股经验</option>
                                <option value="没有美股经验">没有美股经验</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <div class="checkbox">
                                <label><span class="requiredInputLabel">*</span>号项为必填内容</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(openStepForm)">下一步</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <div class="col-xs-4">
            <section>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    为什么需要我的个人信息？
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <ol>
                                    <li>申请注册，填写个人资料</li>
                                    <li>上传证件，创建交易账户</li>
                                    <li>网银购汇，选择境外汇款</li>
                                    <li>下载软件，开始美股交易</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    我的邮件会收广告码？
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <p>梧桐证券技术系统采用非对称加密算法来加密存储您的密码。
                                    虽然算法强度复杂，但如果您设置的密码和其他网站的密码相同，您的密码还是有被泄露的风险。 为了安全，请不要在任何情况下在多个网站使用相同的帐号密码组合，否则一旦你在一个网站的帐号密码被泄露，这些信息会威胁到到你在梧桐证券的密码安全。</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    我的手机会收到广告码？
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <ol>
                                    <li>申请注册，填写个人资料</li>
                                    <li>上传证件，创建交易账户</li>
                                    <li>网银购汇，选择境外汇款</li>
                                    <li>下载软件，开始美股交易</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <div class="space-30"></div>
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="credits">
                    &copy; 2016 梧桐证券|京ICP备88888888号|梧桐证券客服电话：0571-66666666
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/gsdk/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>

<script src="/plugins/gsdk/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/get-done.js"></script>
<script src="/js/form-validate.js"></script>
<script type="text/javascript">
    //
    function submitOpenStepForm(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
//
            isSubmit = verifyRequiredElement(document.getElementById("netAssets"));
            isSubmit = verifyRequiredElement(document.getElementById("netCurrentAssets"));
            isSubmit = verifyRequiredElement(document.getElementById("netAnnualIncome"));
            isSubmit = verifyRequiredElement(document.getElementById("totalAssets"));
            isSubmit = verifyRequiredElement(document.getElementById("transactionsNumber"));
            isSubmit = verifyRequiredElement(document.getElementById("transactionsNumPerYear"));
            isSubmit = verifyRequiredElement(document.getElementById("educationLevel"));
            isSubmit = verifyRequiredElement(document.getElementById("usStockExperience"));
            var investmentObjective = document.getElementsByName("investmentObjective");
            //
            var k = 0;
            for (var i = 0; i < investmentObjective.length; i++) {
                if (investmentObjective[i].checked) {
                    k = 1;
                    break;
                }
            }
            if (k == 0) {
                isSubmit = false;

                if ($("#investmentObjective").parent().next()) {
                    $("#investmentObjective").parent().next().html("");
                }
                if ($("#investmentObjective").parent().parent().parent()) {
                    $("#investmentObjective").parent().parent().parent().removeClass("has-error");
                }
                if ($("#investmentObjective").parent().next()) {
                    $("#investmentObjective").parent().next().html("请选择 投资目标");
                }
                if ($("#investmentObjective").parent().parent().parent()) {
                    $("#investmentObjective").parent().parent().parent().addClass("has-error");
                }
            }
            //
            if (isSubmit == true) {
                targetForm.submit();
            }

        } catch (e) {
            alert(e);
        }

    }
    function verifyRequiredElement(element) {
//
        clearErrorOnFormElement(element);
//is empty or not
        if (validateRequired(element.value) == false) {
//empty
            showErrorOnFormElement(element, "不能为空");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
