<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <title>第一步 用户注册</title>
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
                        #1注册账号<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #2填写资料
                    </li>
                    <li class="step-bar-undone">
                        <div></div>
                        #3投资信息
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
        <h3>开始注册
            <small>第一步</small>
        </h3>
    </div>
    <div class="row">
        <div class="col-md-8">
            <section id="companyImportSection">
                <form class="form-horizontal" id="registerWebUserForm" action="/register/user.register.action" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="mobile" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>手机号码:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="手机号码" onblur="onblurMobile(this)">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-warning btn-block" id="mobileConfirmCode_but">发送验证码</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobileConfirmCode" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>短信验证码:</label>
                        <div class="col-sm-7">
                            <input name="sysSmsRecordId" id="sysSmsRecordId" type="hidden" value="">
                            <input name="smsResponseCode" id="smsResponseCode" type="hidden" value="">
                            <input type="text" class="form-control" id="mobileConfirmCode" name="mobileConfirmCode" placeholder="请输入短信验证码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label for="password" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>密码:</label>
                        <div class="col-sm-7 ">
                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                            <span class="help-block"></span>
                            <span>密码规则：6到25位，可以由“A-Z”或“a-z”或“-”或“_”组成,</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwordConfirm" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>确认密码:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm" placeholder="请再次输入密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inviterCode" class="col-sm-3 control-label">邀请码:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="inviterCode" name="inviterCode" placeholder="邀请码（没有可以不填写）">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="knowSource1" class="col-sm-3 control-label">了解来源:</label>
                        <div class="col-sm-7">
                            <label class="radio-inline">
                                <input type="radio" name="knowSource" id="knowSource1" value="朋友推荐">朋友推荐
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="knowSource" id="knowSource2" value="搜索引擎"> 搜索引擎
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="knowSource" id="knowSource3" value="网站广告"> 网站广告
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="knowSource" id="knowSource4" value="不太清楚" checked> 不太清楚
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-5">
                            <div class="checkbox">
                                <label><span class="requiredInputLabel">*</span>号项为必填内容</label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="button" class="btn btn-success btn-block btn-fill" onclick="registerUserSubmit(registerWebUserForm)">立即注册</button>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-md-4">
            <div>点击“立即注册”即表示您同意 <a>用户协议</a></div>
            <hr>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h7 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                开户流程有哪些？
                            </a>
                        </h7>
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
                                我的密码安全如何得到保障？
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
                                需要帮助？
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <ul class="list-inline">
                                <li><h4>0571-66666666</h4></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <section>
        <hr>
        <div class="row">
            <div class="col-md-12 text-center risk-warning">
                所有投资都存在风险。任何一支证券或金融产品的历史数据都不能保证其未来的表现及回报。虽然投资多样化可以帮助分散风险，但是并不能在市场低迷时确保您获益或防止您损失。投资证券或金融产品总会存在潜在的亏损可能。投资者在进行投资前需考虑自身的投资目标及风险承受能力。

                进行交易之前，客户敬请阅读在我们警告和声明网页上的相关风险透露声明。
                梧桐证券的底层交易通道：IB（Interacitve Brokers，NASDAQ:
                IBKR），是美国最大的互联网证券底层通道提供商，1977年创建，纳斯达克上市公司。致力于提供最快最稳定最安全的电子进场交易技术，直连交易所，而非其他券商通过流动性提供商间接交易。相同时间下单，直连交易所订单成交价格最优。盈透证券集团及其分支机构拥有超过50亿美元的总股本资产，日平均63万3千单的营收交易。

                盈透证券是美国注册的经纪商-经销商、期货佣金商及外汇交易商会员，受美国证券交易委员会SEC、商品期货交易委员会CFTC、及国家期货业协会NFA监管，并且是美国金融业管理局
                FINRA及其他规管自律组织的会员。美国盈透证券不被隶属于、也不背书或推荐任何金融顾问或经纪商，包括梧桐证券。盈透证券为梧桐证券介绍的客户提供执行和清算服务。以上的任何信息均不构成推荐、建议，或盈透招揽买入、卖出或持有任何证券、金融产品或工具或参与任何具体投资策略的要约。美国盈透不参与并且对于此网站提供的信息准确度及完成度不作任何陈述及不承担任何责任。
                想获得更多的关于盈透证券的信息，敬请访问下面网址 www.xxx.com 或 www.xxxx.com.cn
            </div>
        </div>
        <div class="space-30"></div>
    </section>
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
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/gsdk/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/gsdk/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>

<script src="/plugins/gsdk/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="/js/form-validate.js"></script>

<script type="text/javascript">
    function onblurMobile(mobileElement) {
        clearErrorOnFormElement(mobileElement);
        if (validateRequired(mobileElement.value) == true && validateMobile(mobileElement.value) == false) {
            //empty
            showErrorOnFormElement(mobileElement, "请输入一个正确的手机号");
        }
    }
    function registerUserSubmit(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
            //
            var mobileElement = document.getElementById("mobile");
            clearErrorOnFormElement(mobileElement);
            //is empty or not
            if (validateRequired(mobileElement.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(mobileElement, "不能为空");
            } else if (validateMobile(mobileElement.value) == false) {
                //is not empty
                isSubmit = false;
                showErrorOnFormElement(mobileElement, "请输入一个正确的手机号");
            }
            //
            var smsCodeElement = document.getElementById("mobileConfirmCode");
            clearErrorOnFormElement(smsCodeElement);
            if (validateRequired(smsCodeElement.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(smsCodeElement, "不能为空");
            } else if (validateSmsCode(smsCodeElement.value) == false) {
                //is not empty
                isSubmit = false;
                showErrorOnFormElement(smsCodeElement, "短信验证码错误");
            }
            //
            var passwordElement = document.getElementById("password");
            clearErrorOnFormElement(passwordElement);
            if (validateRequired(passwordElement.value) == false) {
                //empty
                isSubmit = false;
                showErrorOnFormElement(passwordElement, "不能为空");
            } else {
                //is not empty
                if (validatePassword(passwordElement.value) == false) {
                    isSubmit = false;
                    showErrorOnFormElement(passwordElement, "无效的密码");
                } else {
                    var confrimPasswordElement = document.getElementById("passwordConfirm");
                    clearErrorOnFormElement(confrimPasswordElement);
                    if (validateRequired(confrimPasswordElement.value) == false) {
                        isSubmit = false;
                        showErrorOnFormElement(confrimPasswordElement, "不能为空");
                    } else if (validateTheSame(passwordElement.value, confrimPasswordElement.value) == false) {
                        isSubmit = false;
                        showErrorOnFormElement(confrimPasswordElement, "您输入的确认密码内容与密码不一致");
                    }
                }
            }

            //var inviterCodeElement = document.getElementById("inviterCode");

            if (isSubmit == true) {
                targetForm.submit();
            }

        } catch (e) {
            alert(e);
        }

    }
    var countDownTimer;
    $(document)
            .ready(
                    function () {

                        //my define
                        $("#mobileConfirmCode_but").click(function () {
                            //
                            var mobileValue = $("#mobile").val();
                            if (validateRequired(mobileValue) == false || validateMobile(mobileValue) == false) {
                                //empty
                                alert("请输入一个正确的手机号");
                                return;
                            }
                            //
                            var btn = $(this);
                            btn.attr("disabled", "disabled");
                            btn.html("发送中...");
                            countDownTimer = setInterval(countDown60s, 1000);

                            $.ajax({
                                type: "post",
                                url: "/application/sms.sendRegisterSMSCode.action",
                                cache: false,
                                data: {
                                    mobile: $("#mobile").val()
                                },
                                dataType: "json",
                                success: function (data) {
                                    $("#smsResponseCode").val(data.message);
                                    $("#sysSmsRecordId").val(data.id);
                                    countDown60s();
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    $("#smsResponseCode").val("");
                                    $("#sysSmsRecordId").val("");
                                    countDown60s();
                                }
                            });
                        });
                    });
    var timerIndex = 60;
    function countDown60s() {
        var btn = $("#mobileConfirmCode_but");
        timerIndex = timerIndex - 1;
        if (timerIndex <= 0) {
            clearInterval(countDownTimer);
            timerIndex = 60;
            btn.html("发送验证码");
            btn.removeAttr("disabled");
        } else {
            btn.html(timerIndex + " 秒");
        }
    }
</script>
</body>
</html>