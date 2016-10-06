<%--
  Created by IntelliJ IDEA.
  User: byw-m
  Date: 2016/7/4
  Time: 15:01
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

    <title>梧桐证券-个人中心-存入资金</title>

    <!-- Bootstrap core CSS     -->
    <link href="/plugins/lbd/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Animation library for notifications   -->
    <link href="/plugins/lbd/css/animate.min.css" rel="stylesheet"/>
    <!--  Light Bootstrap Table core CSS    -->
    <link href="/plugins/lbd/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <!--     Fonts and icons     -->
    <link href="/plugins/lbd/css/pe-icon-7-stroke.css" rel="stylesheet"/>

    <!-- form and register step-->
    <link href="/theme/defaut/css/main.css" rel='stylesheet' type='text/css'>
    <link href="/theme/defaut/css/form.css" rel='stylesheet' type='text/css'>
</head>

<body>
<!-- Begin page content -->
<div class="container">
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="card">
                    <div class="header">汇款通知</div>
                    <hr>
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <form class="form-horizontal" id="dataForm" action="/center/custRemittanceNotify.saveRemittanceNotify.action" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="currencyType" class="col-sm-3 control-label"><span class="requiredInputLabel">*</span>存入币种:</label>
                                        <div class="col-sm-7">
                                            <label class="radio-inline">
                                                <input type="radio" name="currencyType" id="currencyType" value="美元" checked="checked">美元
                                            </label>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="amount" class="col-sm-3 control-label">存入金额:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="amount" name="amount" placeholder="请输入存入金额">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="comment" class="col-sm-3 control-label">留言备注:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="comment" name="comment" placeholder="请输入留言备注">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-7">
                                            <span> 使用和证券账户同名的银行账户汇款后请务必填写此表格，方便您资金顺利到账；不填写此表格，或填写金额与实际入金金额相差过大会造成资金到账时间变长</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-7">
                                            <button type="button" class="btn btn-success btn-block btn-fill" onclick="submitOpenStepForm(dataForm)">通知梧桐查看款项</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div class="card">
                    <div class="header"><h4 class="title">网银转账入金指引</h4></div>
                    <hr>
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                *推荐网银转账入金，银行线下营业网点柜台有可能不受理美元汇款入金业务
                                <ul class="list-unstyled">

                                    <li>汇款人信息：</li>
                                    <li>汇款人姓名：GENG QIUJU</li>
                                    <li>汇款人地址：您的家庭住址，需具体到门牌号，可使用英文或拼音</li>


                                    <li>收款人信息：</li>
                                    <li>收款人姓名：Inter Br</li>
                                    <li>收款人账户：40806826U9091957（此账户是耿秋菊专有的美元入金银行账号）</li>
                                    <li>收款人国家/地区：United States</li>
                                    <li>收款人所在城市：Greenwich</li>
                                    <li>收款人地址：One Pickwick Plaza, Greenwich, CT 06830, United States</li>


                                    <li>收款人开户银行：</li>
                                    <li>收款行所在国家/地区：United States</li>
                                    <li>收款行所在城市：NEW YORK</li>
                                    <li>收款行SWIFT代码：CITIUS33 （如必须填写11位代码，后面全部用大写字母XXX补充）</li>
                                    <li>收款行ABA清算号码(Routing Number)：021000089</li>
                                    <li>收款行全称：Citibank, N.A(New York Branch)</li>
                                    <li>收款行地址：111 Wall St, New York, NY, United States</li>


                                    <li>汇款信息：</li>
                                    <li>汇款币种：美元现汇</li>
                                    <li>费用承担方：共同SHA，费用按承担人区分有两种方式： 1.“共同SHA”方式：我行所有费用由汇出人承担，扣款账户均为汇出人（我行客户）的人民币账户
                                        2.“收款人BEN”方式：我行所有费用由收款人承担，按当天汇率折算成相应外币从汇款本金中扣收
                                    </li>


                                    <li>*请使用和证券账户同名的银行账户入金，国内银行国际汇款具体收费请参考该银行实际标准</li>

                                    <li>*通常实际到账金额，银行会扣除一定的跨境手续费（ 10 - 45 美元）</li>

                                    <li>主要银行入金指引及费用：</li>

                                    <li>香港银行入金指引：（建议您使用香港银行卡入金，出入金更便捷、到账速度更快）</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <ul class="list-unstyled">
                                    <li class="text-left"><h5>香港银行入金指引：（建议您使用香港银行卡入金，出入金更便捷、到账速度更快）</h5></li>
                                    <li>
                                        <ul class="list-inline">
                                            <li>
                                                <ul class="list-unstyled">
                                                    <li><img class="img-rounded bank_img" src="/theme/defaut/images/bank_cmb_hk.jpg"/></li>
                                                    <li>查看费用及指引</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul class="list-unstyled">
                                                    <li><img class="img-rounded bank_img" src="/theme/defaut/images/bank_icbc_asia.png"/></li>
                                                    <li>查看费用及指引</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <ul class="list-unstyled">
                                    <li class="text-left"><h5>大陆银行卡入金指引:</h5></li>
                                    <li>
                                        <ul class="list-inline">
                                            <li>
                                                <ul class="list-unstyled">
                                                    <li><img class="img-rounded bank_img" src="/theme/defaut/images/bank_abc.png"/></li>
                                                    <li>查看费用及指引</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul class="list-unstyled">
                                                    <li><img class="img-rounded bank_img" src="/theme/defaut/images/bank_ccb.png"/></li>
                                                    <li>查看费用及指引</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul class="list-unstyled">
                                                    <li><img class="img-rounded bank_img" src="/theme/defaut/images/bank_ceb.png"/></li>
                                                    <li>查看费用及指引</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!--   Core JS Files   -->
<script src="/plugins/lbd/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/plugins/lbd/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/form-validate.js"></script>
<script type="text/javascript">
    function submitOpenStepForm(targetForm) {
        try {
            if (targetForm == null) {
                showAlertMessage("无效的表单");
                return;
            }
            var isSubmit = true;
//
            isSubmit = verifyRequiredElement(document.getElementById("amount"));
            if(validateInteger(document.getElementById("amount").value)==false){
                   isSubmit=false;
                clearErrorOnFormElement(document.getElementById("amount"));
                showErrorOnFormElement(document.getElementById("amount"), "请输入正确的金额");
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
