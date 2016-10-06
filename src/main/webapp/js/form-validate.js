/**
 * 验证手机号
 * @param inputElement
 */
function validateMobile(inputValue) {
    var regMobile = /^1\d{10}$/;
    if (!regMobile.test(inputValue)) {
        return false;
    }
    return true;
}

/**
 * 验证密码
 * @param inputValue
 * @returns {boolean}
 */
function validatePassword(inputValue) {
    if (inputValue != "") {
        var regs = /^[a-zA-Z0-9_-]{6,25}$/;
        if (regs.test(inputValue)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

/**
 * 正整数
 * @param inputValue
 * @returns {boolean}
 */
function validatePositiveInteger(inputValue) {
    var reg1 = /^\d+$/;
    return reg1.test(inputValue);
}

/**
 * 邮政编码
 * @param inputValue
 * @returns {boolean}
 */
function validateZipCode(inputValue) {
    if (inputValue != "") {
        // /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-]+)+$/
        if (/^[0-9]{6}$/.test(inputValue)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

// 长度验证
String.prototype.len = function () {
    return this.replace(/[^\x00-\xff]/g, 'xx').length;
};
/**
 * 长度验证 中文占两个字节
 * @param inputValue
 * @param maxLength
 * @returns {boolean}
 */
function validateLength(inputValue, maxLength) {
    var length = inputValue.len();

    if (length > maxLength) {
        return false;
    }
    return true;
}

/**
 * 验证两个字段是否相等
 * @param inputValueA
 * @param inputValueB
 * @returns {boolean}
 */
function validateTheSame(inputValueA, inputValueB) {
    if (inputValueA != "") {
        if (inputValueA != inputValueB) {
            return false;
        }
        return true;
    }
    return true;
}

/**
 * 检查是否为数值型数据
 * @param inputValue
 * @returns {boolean}
 */
function validateDigital(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
    }
    return true;
}

/**
 * 检查是否是Int型
 * @param inputValue
 * @returns {boolean}
 */
function validateInteger(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
        if (inputValue.indexOf(".") >= 0) {
            return false;
        }
    }
    return true;
}

/**
 * 检查是否是Long型
 * @param inputValue
 * @returns {boolean}
 */
function validateLong(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
        if (inputValue.indexOf(".") >= 0) {
            return false;
        }
    }
    return true;
}

/**
 * 检查是否为端口
 * @param inputValue
 * @returns {boolean}
 */
function validatePortNumber(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
        if (inputValue.indexOf(".") >= 0) {
            return false;
        }
        if (inputValue < 0 || inputValue > 65535) {
            return false;
        }
        if (inputValue.indexOf("0") == 0) {
            return false;
        }
    }
    return true;
}

/**
 * 检查isFloat
 * @param inputValue
 * @returns {boolean}
 */
function validateFloat(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
        // 不判断是否代点
        // if (inputval.indexOf(".") < 0) {
        // return false;
        // }
    }
    return true;
}

/**
 * 检查isMaskBit
 * @param inputValue
 * @returns {boolean}
 */
function validateIPv4MaskBit(inputValue) {
    if (inputValue != "") {
        if (isNaN(inputValue)) {
            return false;
        }
        if (inputValue.indexOf(".") >= 0) {
            return false;
        }
        if (inputValue < 1 || inputValue > 32) {
            return false;
        }
    }
    return true;
}

/**
 * 检查日期
 * @param inputValue
 * @returns {boolean}
 */
function validateDate(inputValue) {
    if (inputValue != "") {
        var reg = /^(\d+)-(\d{1,2})-(\d{1,2})\s(\d{1,2}):(\d{1,2}):(\d{1,2})$/;
        var r = inputValue.match(reg);
        if (r == null) {
            return false;
        }
        r[2] = r[2] - 1;
        var d = new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
        if (d.getFullYear() != r[1]) {
            return false;
        }
        if (d.getMonth() != r[2]) {
            return false;
        }
        if (d.getDate() != r[3]) {
            return false;
        }
        if (d.getHours() != r[4]) {
            return false;
        }
        if (d.getMinutes() != r[5]) {
            return false;
        }
        if (d.getSeconds() != r[6]) {
            return false;
        }
    }
    return true;
}

/**
 * 检查isIp v4
 * @param inputValue
 * @returns {boolean}
 */
function validateIpV4(inputValue) {
    if (inputValue != "") {
        var pattern = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
        flag_ip = pattern.test(inputValue);
        if (flag_ip) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

/**
 * 检查MAIL
 * @param inputValue
 * @returns {boolean}
 */
function validateEMail(inputValue) {
    if (inputValue != "") {
        // /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-]+)+$/
        if (/^[\w_-]+(\.?[\w_-]+)+@[\w_-]+(\.[\w_-]+)+$/.test(inputValue)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

// 检查文档长度
/**
 *
 * @param ttarea
 * @returns {boolean}
 */
function validateTextlen(ttarea) {
    if (ttarea.value.length > 100) {
        alert("长度需要在100之内");
        ttarea.value = ttarea.value.substring(0, 100);
    }
    return true;
}


/**
 * 检查是否是域名
 * @param inputValue
 * @returns {boolean}
 */
function validateDomainName(inputValue) {
    if (inputValue != "") {
        var regs = /^[a-z0-9A-Z]*([A-Za-z0-9-]+\.){1,}[a-zA-Z]{2,4}\.{0,1}$/;
        var pattern = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
        if (regs.test(inputValue)) {
            return true;
        } else if (pattern.test(inputValue)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

/**
 * 检查是否为空
 * @param inputValue
 * @returns {boolean}
 */
function validateRequired(inputValue) {
    // 如果值为空，验证不通过 为false,通过为true
    if (inputValue == null || inputValue == "") {
        return false;
    }
    var regs = /^\s+$/;
    return !(regs.test(inputValue));
}
/**
 * 检查短信码
 * @param inputValue
 */
function validateSmsCode(inputValue) {
    if ($("#smsResponseCode").val() == inputValue) {
        return true;
    }
    return false;
}
/**
 * 验证拼音
 * @param inputValue
 * @returns {boolean}
 */
function validatePinYin(inputValue) {
    // 如果值为空，验证不通过 为false,通过为true
    if (inputValue == null || inputValue == "") {
        return false;
    }
    var regs = /^[a-zA-Z]+$/;
    return regs.test(inputValue);
}

/**
 * 显示错误提示在表单中
 * @param inputElement
 * @param message
 */
function showErrorOnFormElement(inputElement, message) {
    if ($(inputElement).next()) {
        $(inputElement).next().html(message);
    }
    if ($(inputElement).parent().parent()) {
        $(inputElement).parent().parent().addClass("has-error");
    }
}

function clearErrorOnFormElement(inputElement) {
    if ($(inputElement).next()) {
        $(inputElement).next().html("");
    }
    if ($(inputElement).parent().parent()) {
        $(inputElement).parent().parent().removeClass("has-error");
    }
}
/**
 * 弹出提示信息
 * @param message
 */
function showAlertMessage(message) {
    alert(message);
}

/*
 根据〖中华人民共和国国家标准 GB 11643-1999〗中有关公民身份号码的规定，公民身份号码是特征组合码，由十七位数字本体码和一位数字校验码组成。排列顺序从左至右依次为：六位数字地址码，八位数字出生日期码，三位数字顺序码和一位数字校验码。
 地址码表示编码对象常住户口所在县(市、旗、区)的行政区划代码。
 出生日期码表示编码对象出生的年、月、日，其中年份用四位数字表示，年、月、日之间不用分隔符。
 顺序码表示同一地址码所标识的区域范围内，对同年、月、日出生的人员编定的顺序号。顺序码的奇数分给男性，偶数分给女性。
 校验码是根据前面十七位数字码，按照ISO 7064:1983.MOD 11-2校验码计算出来的检验码。

 出生日期计算方法。
 位的身份证编码首先把出生年扩展为4位，简单的就是增加一个19或18,这样就包含了所有1800-1999年出生的人;
 年后出生的肯定都是18位的了没有这个烦恼，至于1800年前出生的,那啥那时应该还没身份证号这个东东，⊙﹏⊙b汗...
 下面是正则表达式:
 出生日期1800-2099 (18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])
 身份证正则表达式 /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i
 位校验规则 6位地址编码+6位出生日期+3位顺序号
 位校验规则 6位地址编码+8位出生日期+3位顺序号+1位校验位

 校验位规则 公式:∑(ai×Wi)(mod 11)……………………………………(1)
 公式(1)中：
 i----表示号码字符从由至左包括校验码在内的位置序号；
 ai----表示第i位置上的号码字符值；
 Wi----示第i位置上的加权因子，其数值依据公式Wi=2^(n-1）(mod 11)计算得出。
 i 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
 Wi 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 1

 */
//身份证号合法性验证
//支持15位和18位身份证号
//支持地址编码、出生日期、校验位验证
function validateIdentityNumber(code) {
    var city = {
        11: "北京",
        12: "天津",
        13: "河北",
        14: "山西",
        15: "内蒙古",
        21: "辽宁",
        22: "吉林",
        23: "黑龙江 ",
        31: "上海",
        32: "江苏",
        33: "浙江",
        34: "安徽",
        35: "福建",
        36: "江西",
        37: "山东",
        41: "河南",
        42: "湖北 ",
        43: "湖南",
        44: "广东",
        45: "广西",
        46: "海南",
        50: "重庆",
        51: "四川",
        52: "贵州",
        53: "云南",
        54: "西藏 ",
        61: "陕西",
        62: "甘肃",
        63: "青海",
        64: "宁夏",
        65: "新疆",
        71: "台湾",
        81: "香港",
        82: "澳门",
        91: "国外 "
    };
    var pass = true;
    if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)) {
        pass = false;
    }
    else if (!city[code.substr(0, 2)]) {
        pass = false;
    }
    else {
        //18位身份证需要验证最后一位校验位
        if (code.length == 18) {
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
            //校验位
            var parity = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++) {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if (parity[sum % 11] != code[17]) {
                pass = false;
            }
        }
    }
    return pass;
}
/**
 * 简化页面对非空检验的判断
 * @param element
 * @returns {boolean}
 */
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