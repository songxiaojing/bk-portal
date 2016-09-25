<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bellwin.brokers.modules.center.module.SysDimHatProvince" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/6/2
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>

<%
    List<SysDimHatProvince> sysDimHatProvinceList = (List<SysDimHatProvince>) request.getAttribute("sysDimHatProvinceItem");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>第二步 客户信息填写</title>
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
                        #2填写资料<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
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
        <h3>客户信息填写
            <small>第二步</small>
        </h3>
    </div>
    <div class="row">
        <div class="col-md-8">
            <section id="webUserRegiterSection">
                <form class="form-horizontal" id="openStepForm" action="/account/openStepA.saveStepCustomerInfo.action" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>真实姓名:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入真实姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastName" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>姓名拼音:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="请输入姓的拼音">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="请输入名的拼音">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="identityNumber" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>身份证号码:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="identityNumber" name="identityNumber" placeholder="请输入身份证号码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group input-group-lg">
                        <label for="email" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>电子邮箱:</label>
                        <div class="col-sm-7 ">
                            <input type="email" class="form-control" id="email" name="email" placeholder="请输入电子邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="familyNumber" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>家庭成员个数:</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="familyNumber" name="familyNumber" placeholder="请选择家庭成员个数">
                                <option value="">请选择家庭成员个数(不包括自己)</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="maritalStatus" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>婚姻状况:</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="maritalStatus" name="maritalStatus" placeholder="请选择婚姻状况">
                                <option value="">请选择婚姻状况</option>
                                <option value="未婚">未婚</option>
                                <option value="已婚">已婚</option>
                                <option value="离异">离异</option>
                                <option value="丧偶">丧偶</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="career" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>职业:</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="career" name="career" placeholder="请选择职业">
                                <option value="">请选择职业</option>
                                <option value="受雇">受雇</option>
                                <option value="自行创业">自行创业</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="industry" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>行业:</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="industry" name="industry" placeholder="请选择行业">
                                <option value="">请选择行业</option>
                                <option value="金融/银行/保险">金融/银行/保险</option>
                                <option value="政府/事业机构">政府/事业机构</option>
                                <option value="广告公关/媒体/艺术文化">广告公关/媒体/艺术文化</option>
                                <option value="销售/贸易">销售/贸易</option>
                                <option value="计算机/互联网/通信/电子技术">计算机/互联网/通信/电子技术</option>
                                <option value="生产制造/物流运输">生产制造/物流运输</option>
                                <option value="医药/化工">医药/化工</option>
                                <option value="建筑/房地产">建筑/房地产</option>
                                <option value="教育/法律">教育/法律</option>
                                <option value="餐饮/娱乐/美容">餐饮/娱乐/美容</option>
                                <option value="其它">其它</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="companyName" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>单位名称:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="companyName" name="companyName" placeholder="请输入单位名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="compnayAddressProvince" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>地区:</label>
                        <div class="col-sm-2">
                            <select class="form-control" id="compnayAddressProvince" name="compnayAddressProvince" placeholder="请选择省">
                                <option value="">选择省</option>
                                <%
                                    if (sysDimHatProvinceList != null && sysDimHatProvinceList.isEmpty() == false) {
                                        for (SysDimHatProvince sysDimHatProvince : sysDimHatProvinceList) {
                                            out.println("<option code=\"" + sysDimHatProvince.getCode() + "\" value=\"" + sysDimHatProvince.getName() + "\">" + sysDimHatProvince.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control" id="compnayAddressCity" name="compnayAddressCity" placeholder="请选择市">
                                <option value="">城市</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-3">
                            <select class="form-control" id="compnayAddressArea" name="compnayAddressArea" placeholder="请选择地区">
                                <option value="">选择地区</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="compnayAddress" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>详细地址:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="compnayAddress" name="compnayAddress" placeholder="邀请码（没有可以不填写）">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-7">
                            <div class="checkbox">
                                <label><span class="requiredInputLabel">*</span>号项为必填内容</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-7">
                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(openStepForm)">下一步</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <div class="col-md-4">
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
    <div class="space-30"></div>
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
    //
    function submitOpenStepForm(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
            //
            isSubmit = verifyRequiredElement(document.getElementById("name"));
            isSubmit = verifyRequiredElement(document.getElementById("lastName"));
            isSubmit = verifyRequiredElement(document.getElementById("firstName"));
            isSubmit = verifyRequiredElement(document.getElementById("identityNumber"));
            isSubmit = verifyRequiredElement(document.getElementById("familyNumber"));
            isSubmit = verifyRequiredElement(document.getElementById("maritalStatus"));
            isSubmit = verifyRequiredElement(document.getElementById("career"));
            isSubmit = verifyRequiredElement(document.getElementById("industry"));
            isSubmit = verifyRequiredElement(document.getElementById("companyName"));
            isSubmit = verifyRequiredElement(document.getElementById("compnayAddressProvince"));
            isSubmit = verifyRequiredElement(document.getElementById("compnayAddressCity"));
            isSubmit = verifyRequiredElement(document.getElementById("compnayAddressArea"));
            isSubmit = verifyRequiredElement(document.getElementById("compnayAddress"));
            //判断拼音
            //判断身份证号
            if (validatePinYin(document.getElementById("firstName").value) == false) {
                isSubmit = false;
                //
                clearErrorOnFormElement(document.getElementById("firstName"));
                showErrorOnFormElement(document.getElementById("firstName"), "请输入正确的拼音字母");
            }
            //判断身份证号
            if (validatePinYin(document.getElementById("lastName").value) == false) {
                isSubmit = false;
                //
                clearErrorOnFormElement(document.getElementById("lastName"));
                showErrorOnFormElement(document.getElementById("lastName"), "请输入正确的拼音字母");
            }

            //判断身份证号
            if (validateIdentityNumber(document.getElementById("identityNumber").value) == false) {
                isSubmit = false;
                //
                clearErrorOnFormElement(document.getElementById("identityNumber"));
                showErrorOnFormElement(document.getElementById("identityNumber"), "请输入正确的身份证件号");
            }
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
    //
    $(document).ready(function () {
        $('#compnayAddressProvince').change(function () {
            var changeSelectItem = $(this).children('option:selected');
            var provinceCode = changeSelectItem.attr("code");
            $.ajax({
                type: "post",
                url: "/dim/dim.getDimHatCityItemByFatherCode.action",
                cache: false,
                data: {
                    fatherCode: provinceCode
                },
                dataType: "json",
                success: function (data) {
                    $("#compnayAddressCity").empty();
                    $("#compnayAddressArea").empty();
                    $('#compnayAddressCity').append("<option value=''>选择城市</option>");
                    $('#compnayAddressArea').append("<option value=''>选择地区</option>");
                    for (var i = 0; i < data.length; i++) {
                        $('#compnayAddressCity').append("<option value='" + data[i].name + "' code='" + data[i].code + "'>" + data[i].name + "</option>");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //do nothing
                }
            });
        });
        $('#compnayAddressCity').change(function () {
            var changeSelectItem = $(this).children('option:selected');
            var fatherCode = changeSelectItem.attr("code");
            $.ajax({
                type: "post",
                url: "/dim/dim.getDimHatAreaItemByFatherCode.action",
                cache: false,
                data: {
                    fatherCode: fatherCode
                },
                dataType: "json",
                success: function (data) {
                    $("#compnayAddressArea").empty();
                    $('#compnayAddressArea').append("<option value=''>选择地区</option>");
                    for (var i = 0; i < data.length; i++) {
                        $('#compnayAddressArea').append("<option value='" + data[i].name + "'>" + data[i].name + "</option>");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //do nothing
                }
            });
        });
    });
</script>
</body>
</html>
