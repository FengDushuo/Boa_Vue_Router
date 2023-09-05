<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Login</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<!-- <SCRIPT language=javascript src="/JS/util.js"></SCRIPT> -->
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/popup.js"></script>
<style>
* {
    box-sizing: border-box;
    outline: none;
    border: none;
}
html,
body {
    height: 100%;
    padding: 0;
    margin: 0;
}
body {
    font-family: "MicrosoftYaHei", "Microsoft YaHei";
    background: url(../img/bg.png) no-repeat;
    background-size: cover;
    margin: 0;
    padding: 0;
    position: relative;
}
.header {
    width: 100%;
    height: 120px;
    position: relative;
    margin: 0 auto;
}
.header .logo_img {
    background: url(../img/logo.png) no-repeat;
    width: 186px;
    height: 60px;
    position: relative;
    top: 60px;
    left: 23%;
}
.app-img-text {
    width: 131px;
    height: 24px;
    font-size: 12px;
    font-family: MicrosoftYaHei;
    color: #787e7e;
    line-height: 24px;
    letter-spacing: 1px;
    padding-bottom: 14px;
}
.footer {
    width: 600px;
    height: 42px;
    line-height: 21px;
    color: #fff;
    text-align: center;
    font-size: 10px;
    letter-spacing: 0.42px;
    margin: 0 auto;
    margin-top: 95px;
}
#div_visite {
    font-size: 14px;
    margin-top: 55px;
    color: #5F6172;
    font-family: "MicrosoftYaHei", "Microsoft YaHei";
}
#div_visite .lmain {
    width: 525px;
    height: 449px;
    background: #ffffff;
    position: relative;
    -webkit-border-radius: 24px;
    -moz-border-radius: 24px;
    border-radius: 24px;
    margin: 0 auto;
    overflow: hidden;
}
#div_visite .lmain .lmain-inner {
    width: 497px;
    margin: 24px auto;
}
.lmain-inner .text-center {
    width: 100%;
    height: 63px;
    line-height: 63px;
    color: #5f6172;
    line-height: 63px;
    font-size: 24px;
}
.lmain-inner .text-center .welcome {
  font-size: 24px;
  text-align: center;
}
.lmain-inner .text-center span {
  display: block;
  font-size: 14px;
  text-align: center;
}
.lmain-inner .app-img {
    width: 120px;
    height: 144px;
    font-size: 0;
    margin: 0 auto;
}
/* 登录信息 */
.lmain-inner .form {
  margin: 0 auto;
  width: 246px;
  font-size: 0;
}
.lmain-inner .forget-form {
    font-size: 16px;
    color: #5f6172;
    margin-top: 52px;
    width: 300px;
    margin: 44px auto;
}
.lmain-inner .form .form-group {
  height: 30px;
  margin-top: 12px;
}
.lmain-inner .form .form-group .form-title {
  display: inline-block;
  margin-top: 4px;
  width: 84px;
  height: 21px;
  font-size: 14px;
  font-family: MicrosoftYaHei;
  color: #5f6172;
  line-height: 21px;
}
.lmain-inner .form .form-group .input {
  display: inline-block;
  width: 160px;
  height: 30px;
}
.lmain-inner .form .form-group .input input {
    outline: none;
    width: 100%;
    height: 100%;
    font-size: 12px;
    font-family: MicrosoftYaHei;
    color: #787e7e;
    line-height: 30px;
    letter-spacing: 1px;
    text-indent: 0;
    -webkit-text-fill-color: #787e7e;
    padding: 5px 67px 4px 16px;
    border: 1px solid #BDC4C3;
    border-radius: 15px;
}
.lmain-inner .form .form-group .input input:focus {
    border: 1px solid #2e7bff;
}
input[type="text"],
input[type="password"] {
    padding-left: 2px;
}

.input_eye {
    right: 6px;
    top: 0;
}
/* 记住密码/忘记密码 */
.lmain-inner .form .remember {
  margin-left: -1px;
}
.lmain-inner .form .remember img {
  width: 24px;
  height: 24px;
  float: left;
  vertical-align: middle;
}
.forget-form label {
    display: inline-block;
}
.font-pwd {
  font-size: 12px;
  font-family: MicrosoftYaHei;
  color: #787e7e;
  line-height: 24px;
  letter-spacing: 1px;
}
.remember .rem-pwd {
  display: inline-block;
  width: 116px;
  height: 24px;
  vertical-align: middle;
}
.forget .forget-pwd {
  display: inline-block;
  width: 65px;
  height: 24px;
  cursor: pointer;
}
.pwd-tips {
    font-size: 10px;
    font-family: MicrosoftYaHei;
    color: #f03e4f;
    letter-spacing: 0.5px;
    line-height: 24px;
}
#div_visite input[type="button"] {
    margin: 0 auto;
    width: 245px;
    height: 40px;
    background: #2e7bff;
    border-radius: 20px;
    cursor: pointer;
    font-size: 16px;
    font-family: MicrosoftYaHei;
    color: #ffffff;
    line-height: 40px;
    letter-spacing: 2px;
    text-align: center;
}
</style>

<script LANGUAGE="JavaScript">
    function getElById(sId) {
        return getElement(sId);
    }

    function getElementById(sId) {
        if (document.getElementById) {
            return document.getElementById(sId);
        }
        else if (document.all) {
            // old IE
            return document.all(sId);
        }
        else if (document.layers) {
            // Netscape 4
            return document.layers[sId];
        }
        else {
            return null;
        }
    }

    /*getElByName*/
    function getElementByName(sId) {    // standard
        if (document.getElementsByName) {
            var element = document.getElementsByName(sId);

            if (element.length == 0) {
                return null;
            }
            else if (element.length == 1) {
                return element[0];
            }

            return element;
        }
    }

    function getElement(sId) {
        var ele = getElementByName(sId);
        if (ele == null) {
            return getElementById(sId);
        }
        return ele;
    }

    var Logged = 0;
    var isIPv4 = "<% tcWebApi_get("WebCurSet_Entry","IsIPv4","s") %>";
    var ServerLanIP;
    if('0' == isIPv4)
        ServerLanIP = "http://[" + "<% tcWebApi_get("Lan_Entry0","IP6","s") %>" + "]";
    else ServerLanIP = "http://" + "<% tcWebApi_get("Lan_Entry0","IP","s") %>";
    function getCookie(Name)
    {
        var search = Name + "=";
        if(document.cookie.length > 0) 
        {
            offset = document.cookie.indexOf(search);
            if(offset != -1) 
            {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if(end == -1) end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
            else 
                return "";
        }
        else
            return "";
    }
    
    function rmCookie(name)
    {  
        var exp = new Date();  
        exp.setTime(exp.getTime() - 10000);  
        document.cookie = name + "=del;expires=" + exp.toGMTString();  
        document.cookie = name + "=del;expires=" + exp.toGMTString()+";path=/;";  
    }
    
    function gotoSimCardMsg()
    {
        rmCookie("UID");rmCookie("PSW");rmCookie("LoginTimes");
        top.window.location.href='/cgi-bin/InsertSimcardMsg.cgi';
    }
    
    var Logged = 0;
    var pswST = 0;
    var gotoMainSet = 0;
    function userlogin( login )
    {
        Logged = login;
    }
    function userPSWST( st)
    {
        pswST = st;
    }
    
    function gotomain_set()
    {
        gotoMainSet = 1;
    }
    
    function gotomain()
    {
        var logflag = getCookie('LOGFLAG');
        
        if ( 1 != gotoMainSet )
            return -1;
    
        if ( 2 == pswST )
            return -2 ;
        else if ( 1 == pswST )
        {
            if ( 0 == Logged )
            {
                rmCookie("LoginTimes");
                top.window.location.href = '/cgi-bin/content.asp';
                return 1;
            }
            else
            {
                if ( logflag.indexOf('logged') < 0 )
                {
                    rmCookie("UID");
                    rmCookie("PSW");
                    rmCookie("LoginTimes");
                }
                
                if ( 1 == Logged ){
                    document.write('配置账户已经处于登录状态！');
                    setTimeout(function(){ top.window.location.href = '/cgi-bin/content.asp'; }, 3000);
                }else if ( 2 == Logged ){
                    document.write('用户账号已经处于登录状态！');
                    setTimeout(function(){ top.window.location.href = '/cgi-bin/content.asp'; }, 3000);
                }
            }
        }
        return 0;
    }
    
    function refreshself()
    {
        top.window.location.href ='/cgi-bin/index2.asp';
    }
    <%
    if Request_Form("Username") <> "" then
    if tcWebApi_get("WebCurSet_Entry","isLockState","h") <> "1" then
            tcWebApi_set("WebCurSet_Entry","WebPSW","Password")
            if tcWebApi_get("Account_Entry0","Logged","h") = "1" then
                asp_write("userlogin(1);")
            elseif tcWebApi_get("Account_Entry1","Logged","h") = "1" then
                asp_write("userlogin(2);")
            end if
    
            if tcWebApi_get("SimCard_Entry", "cpeFlag", "h") = "1"  then
                if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "0"  then
                    asp_write("gotoSimCardMsg();")
                    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "2")
                    asp_write("userPSWST(2);")
                elseif tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                    if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                        tcWebApi_set("Account_Entry1","Logoff","Logoff")
                        tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                        asp_write("userPSWST(1);")
                    elseif tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "1"  then
                            if tcWebApi_get("Info_SIMWebAuth","webAuthRet","h") = "1" then
                                tcWebApi_set("Account_Entry0","Logoff","Logoff")
                                tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                asp_write("userPSWST(1);")
                            end if
                    elseif Request_Form("Password2") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                            tcWebApi_set("Account_Entry0","Logoff","Logoff")
                            tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                            asp_write("userPSWST(1);")
                    end if
                end if
            else
                    if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then
                            if Request_Form("logintype") = "adm" then
                                    if Request_Form("Password1") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                                            tcWebApi_set("Account_Entry0", "Logoff", "Logoff")
                                            tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                            asp_write("userPSWST(1);")
                                    end if
                            else
                                    if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                                            tcWebApi_set("Account_Entry1", "Logoff", "Logoff")
                                            tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                            asp_write("userPSWST(1);")
                                    end if
                            end if
                    elseif tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then
                            if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                                    if Request_Form("Username1") = tcWebApi_get("Account_Entry1","username","h") then
                                            tcWebApi_set("Account_Entry1","Logoff","Logoff")
                                            tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                            asp_write("userPSWST(1);")
                                    end if
                            elseif Request_Form("Password2") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                                    if Request_Form("Username2") = tcWebApi_get("Account_Entry0","username","h") then
                                            tcWebApi_set("Account_Entry0","Logoff","Logoff")
                                            tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                            asp_write("userPSWST(1);")
                                    end if
                            end if
                    else
                            if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                                tcWebApi_set("Account_Entry1","Logoff","Logoff")
                                tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                asp_write("userPSWST(1);")
                            elseif Request_Form("Password2") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                                    tcWebApi_set("Account_Entry0","Logoff","Logoff")
                                    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                                    asp_write("userPSWST(1);")
                            end if
                    end if
            end if
            
            if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") = "1" then
                tcWebApi_constSet("WebCurSet_Entry", "LoginCondition", "1")
                asp_write("gotomain_set();")
            else
                tcWebApi_constSet("WebCurSet_Entry", "LoginCondition", "0")
            end if
    else
        asp_write("refreshself();")
    end if
    end if
    
    if Request_Form("hLoginTimes") = "3" then
        if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") <> "1" then
            if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") <> "2" then
                tcWebApi_set("Account_Entry0","LoginTimes","hLoginTimes")
                tcWebApi_commit("Account_Entry0")
                tcWebApi_set("Account_Entry0","LoginTimes","hLoginTimes_Zero")
                tcWebApi_set("WebCurSet_Entry","isLockState","value_one")
                asp_write("refreshself();")
            end if
        end if
    end if
    tcWebApi_constSet("WebCurSet_Entry", "WebPSW", "")
    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "")
    
    if Request_Form("hLoginFailTime") = "1" then
        tcWebApi_set("DeviceAlarm_Common","LoginFailTime","LoginFailTime")
        tcWebApi_commit("DeviceAlarm_Common")
    end if
    %>
    
</script>
<SCRIPT language=JavaScript type=text/javascript>

var rstatus = "<%tcWebApi_get("deviceAccount_Entry","registerStatus","s") %>";
var rresult = "<%tcWebApi_get("deviceAccount_Entry","registerResult","s") %>";	

function getsec(str)
{  
	var str1=str.substring(1,str.length)*1;    
	var str2=str.substring(0,1);  
	if (str2=="s")
	{  
		return str1*1000; 
	}
	else if (str2=="h")
	{  
		return str1*60*60*1000; 
    	}
	else if (str2=="d")
	{  
		return str1*24*60*60*1000; 
    	}  
}
	
function setCookie(name,value,time)
{  
	var strsec = getsec(time); 
	var exp = new Date();  
	exp.setTime(exp.getTime() + strsec*1);  
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
} 
	
var LoginTimes = 0;
var LoginFailTime = "<% tcWebApi_get("DeviceAlarm_Common","LoginFailTime","s") %>";
if((getCookie("LoginTimes") != "") && (typeof(getCookie("LoginTimes")) != "undefined"))
{
	LoginTimes = parseInt(getCookie("LoginTimes"));
}

var lock_timer = null;
var cur_time = 0;
if((getCookie("cur_time") != "") && (typeof(getCookie("cur_time")) != "undefined"))
{
	cur_time = parseInt(getCookie("cur_time"));
}

function do_lock_timer() {
    lock_timer = setInterval(function () {
        cur_time = parseInt(cur_time) + 1;
        setCookie("cur_time", cur_time, "s60");
        if (parseInt(getCookie("cur_time")) >= 60) {
            clearInterval(lock_timer);
            rmCookie("cur_time");
            location.reload();
        }
    }, 1000);
}

/* create session ID */
function PrefixInteger(num, length)
{
	return (Array(length).join('0') + num).slice(-length);
}

function createNewSessionID()
{
	var t_time = new Date();
	var seed = t_time.getTime();
	var t_rand = Math.random(seed);
	var t_rand_i = parseInt(t_rand*seed);
	var t_rand_i_str = t_rand_i.toString(16);
	
	if ( t_rand_i_str.length > 8 )
		t_rand_i_str = t_rand_i_str.substr(0, 8);
	else if ( t_rand_i_str.length < 8 )
	{
		t_rand_i_str = PrefixInteger(0, 8 - t_rand_i_str.length) + t_rand_i_str;
	}
	
	/* ex. boasid3e0e965b */
	t_rand_i_str = 'boasid' + t_rand_i_str;

	var cookie = 'SESSIONID=' + t_rand_i_str + ';path=/;';
	document.cookie = cookie;
}

function forgetPass() {
    alert("依照图示方法，可以将路由器恢复出厂设置，恢复出厂设置后您可以使用设备默认账号密码登入，但同时您的数据会被清除，请谨慎操作。", "我知道了", "forget", "../img/forget.png");
	return false;
}

function SubmitForm()
{
	var Username = document.getElementById('Username');
	var Password = document.getElementById('Password');
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then%>
	var Username1 = document.getElementById('Username1');
	var Username2 = document.getElementById('Username2');
<% end if %>
	var Password1 = document.getElementById('Password1');
	var Password2 = document.getElementById('Password2');
	var hLoginTimes = document.getElementById('hLoginTimes');
	var sessionID = getCookie('SESSIONID');
	
	if (Username.value == "")
	{
		alert("账号不能为空，请重新输入！");
		return false;
	}
	if (Password.value == "")
	{
		alert("密码不能为空，请重新输入！");
		return false;
	}

// 	if ( sessionID.indexOf('boasid') < 0 )
// 	{
// 		createNewSessionID();
// 	}

<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then%>
	Username1.value = Username.value;
	Username2.value = Username.value;
<% end if %>
	Password1.value = Password.value;
	Password2.value = Password.value;
	var cookie = "UID=" + Username.value + ";path=/;";
	document.cookie = cookie;
	var cookie = "PSW=" + Password.value + ";path=/;";
	document.cookie = cookie;
	LoginTimes = parseInt(LoginTimes) + 1;
	LoginFailTime = parseInt(LoginFailTime) + 1;
	document.ConfigForm.hLoginFailTime.value = 1;
	document.ConfigForm.LoginFailTime.value = LoginFailTime;
	setCookie("LoginTimes", LoginTimes, "s60");
	hLoginTimes.value = LoginTimes;
	// document.ConfigForm.submit();

    //2022/3/1: KK Use /api/usersessio to login
    console.log("user1:"+Username1.value);
    console.log("user2:"+Username2.value);
    console.log("pass1:"+Password1.value);
    console.log("pass2:"+Password2.value);

    var params ='{"login":"'+Username1.value+'","password":"'+Password1.value+'","logout":false,"isRememberPwd":false}';
    console.log("params:"+ params);
                        $.ajax({
                            type: "PUT",   //提交的方法
                            url: "/api/usersession"  , //提交的地址  
                            async: true,
                            data: params,
							contentType: "application/json",
                            dataType: "json",
                            success: function(data) {
                                    setCookie("LOGFLAG", "logged", "d1");
									top.window.location.href="/";
                            },
                            error: function(error) {
		top.window.location.href="/";
                            }
                        });

	return true;
}

function btnbandReg()
{
<% if tcWebApi_get("WebCustom_Entry", "isCTGDSupported", "h") = "Yes" then%>
	if((0==rstatus) && (1==rresult))
	{
		alert("已注册成功，无需再注册");
		return false;
	}
<% end if%>
	document.cookie = "RegPageStatus=0";
	document.cookie = "RegPagetimeoutcount=0";
	location.replace(ServerLanIP + "/cgi-bin/register.asp");

	return true;
}

<% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then%>
var sLoginType = 'usr';
if( (getCookie("logintype") != "") && (typeof(getCookie("logintype")) != "undefined") )
{
	sLoginType = getCookie("logintype");
}
<% end if%>

<%if tcWebApi_get("WebCurSet_Entry","isLockState","h") <> "1" then %>
function onHandleKeyDown(e)
{
	var key = 0;
	if (window.event)
	{
		key = window.event.keyCode;
	}
	else if (e)
	{
		key = e.which;
	}
	if (key == 13 && document.activeElement.id != 'btnSubmit' && document.activeElement.id != 'bandReg')
	{
		SubmitForm();
	}
}
if ( !(0 != Logged && pswST) )
	document.onkeypress = onHandleKeyDown;
<% end if %>

// 判断IE浏览器版本，低于10提示更换浏览器
function BrowserType() {
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串 
    var isIE = window.ActiveXObject || "ActiveXObject" in window;

    if (isIE) {
        var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
        reIE.test(userAgent);
        var fIEVersion = parseFloat(RegExp["$1"]);
        if (userAgent.indexOf('MSIE 6.0') != -1) {  //IE6
            return -1;
        }
        else if (fIEVersion == 7) { return -1; }  //IE7
        else if (fIEVersion == 8) { return -1; }  //IE8
        else if (fIEVersion == 9) { return -1; }  //IE9
        else if (fIEVersion == 10) { return -1; }  //IE10
        else if (userAgent.toLowerCase().match(/rv:([\d.]+)\) like gecko/)) {
            return 1;  //IE11
        }
    else { return -1 }  //IE版本过低
    }
}

function LoadFrame()
{
    var browserType = 255;
    browserType = BrowserType();
    if(browserType < 0) {
        bodyShow.style.display = "none";
        changeBrower.style.display = "block";
        return;
    }
    else {
        changeBrower.style.display = "none";
        bodyShow.style.display = "block";
    }

	if ( 1 == gotomain() )
		return;
<% if tcWebApi_get("WebCustom_Entry", "isCTPONJSSupported", "h") = "Yes" then%>
	<%if tcWebApi_get("LogicID_Entry","isRegistered","h") = "1" then%>
		<%if tcWebApi_get("XPON_Common","trafficStatus","h") = "up" then%>
			document.getElementById('bandReg').disabled = true;
		<%else%>
			document.getElementById('bandReg').disabled = false;
		<%end if%>
	<%else%>
		document.getElementById('bandReg').disabled = false;
	<%end if%>
<%else%>
<% if tcWebApi_get("WebCustom_Entry", "isCTPONBIND2Supported", "h") = "Yes" then%>
	<%if tcWebApi_get("LogicID_Entry","isRegistered","h") = "1" then%>
		document.getElementById('bandReg').disabled = true;
	<%else%>
		document.getElementById('bandReg').disabled = false;
	<%end if%>
<% end if %>
<% end if %>

<% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then%>
	var logintypeObj = document.getElementById('logintype');

	if ( logintypeObj )
		logintypeObj.value = sLoginType;
<% end if %>
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
</SCRIPT>

<META content="Microsoft FrontPage 5.0" name="GENERATOR">

<style>
    #changeBrower {
        width: 100%;
        font-size: 18px;
        margin-top: 100px;
        text-align: center;
    }
</style>

</HEAD>
<BODY onload="LoadFrame()">
<div id="changeBrower" style="display: none;">
    <h2>当前使用的浏览器版本过低，请使用更高版本的浏览器登录！推荐使用Edge浏览器和谷歌浏览器。</h2>
</div>
<div id="bodyShow" style="display: block;">
    <div class="header"><div class="logo_img"></div></div>
    <DIV id=div_visite>
    <FORM id="ConfigForm" name="ConfigForm" action="/cgi-bin/index2.asp" method="post">		
    <DIV class="lmain">
    <DIV class="lmain-inner">
        <!--div class="text-center">欢迎使用中国移动路由 RAX3000A</div-->
        <div class="text-center">欢迎使用 
            <script language="JavaScript" type="text/javascript">
                var ModelName = "<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%>";
                document.write(ModelName); 
            </script>
        </div>
        <!--div class="app-img" style="display: none;">
            <img src="../img/image_qr_code.png" alt="">
            <div class="app-img-text">扫描安装和家亲APP</div>
        </div-->
    <% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") <> "Yes" then%>
    <div id="loginForm" class="form">
        <div class="form-group" style="margin-top: 25px;">
            <div class="form-title">
                <script language="JavaScript" type="text/JavaScript">
                    <%if tcWebApi_get("Sys_Entry","IsAdmin","h") = "1" then %>
                        document.writeln("管理员账号：");
                    <% else %>
                        document.writeln("配置账户");
                    <% end if %>
                    </script>
            </div>
            <div class="input">
                <input id="Username" name="Username" autocomplete="on" type="text" size="20">
            </div>
        </div>
        <div class="form-group">
            <div class="form-title">
                <% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then%>
                <script language="JavaScript" type="text/JavaScript">
                    if ( 'adm' == sLoginType )
                        document.writeln("维护密码：");
                    else
                        document.writeln("用户密码：");
                    </script>
                    <% else %>
                            配置密码
                    <% end if %>
            </div>
            <div class="input" style="position: relative;">
                <input id="Logoff" type="hidden" name="Logoff" value="0">    
                <input id="hLoginTimes" type="hidden" name="hLoginTimes" value="0">
                <input id="hLoginTimes_Zero" type="hidden" name="hLoginTimes_Zero" value="0">
                <input id="value_one" type="hidden" name="value_one" value="1"> 
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then%>
                <input id="Username1" type="hidden" name="Username1" value="">
                <input id="Username2" type="hidden" name="Username2" value=""> 
            <% end if %>
                <input id="Password1" type="hidden" name="Password1" value="">
                <input id="Password2" type="hidden" name="Password2" value=""> 
                <input id="logintype" type="hidden" name="logintype" value="usr">
                <input id="LoginFailTime" type="hidden" name="LoginFailTime" value="0">
                <input id="hLoginFailTime" type="hidden" name="hLoginFailTime" value="0">
                <div style="position: relative;">
                    <INPUT id="Password" type="password" name="Password" size="20" 
                        autocomplete="off" oncopy="return false;" oncut="return false;" 
                        oncontextmenu="return false;">
                    <div class="input_eye eye-pwd" id="cb_enablshowpsw" data-flag=0 onclick="doshowpswChange()"></div>
                </div>
            </div>
            <script language="JavaScript" type="text/JavaScript">								
                function doshowpswChange() {
                    with (getElById('ConfigForm')){
                        var flag = getElById('cb_enablshowpsw').getAttribute('data-flag');
                        if (flag==0) {
                            Password.type = "text";
                            getElById('cb_enablshowpsw').setAttribute('data-flag', 1);
                            getElById('cb_enablshowpsw').setAttribute('class', 'input_eye eye-text');
                        }
                        else {
                            Password.type = "password";
                            getElById('cb_enablshowpsw').setAttribute('data-flag', 0);
                            getElById('cb_enablshowpsw').setAttribute('class', 'input_eye eye-pwd');
                        }
                    }
                
                }
            </script>
        </div>
        <div class="form-group clearfix" style="height: 24px;">
            <div class="remember font-pwd fl">
                <span class="pwd-tips" style="display: inline-block;">
                    <SCRIPT language=javascript>    
                        if (LoginTimes > 0 && LoginTimes < 3 && !(1==gotoMainSet&&1==pswST&&0==Logged))
                        {
                            var str = '密码错3次系统将锁定，剩余: ' +  (3- LoginTimes);
                            document.write(str);
                            <% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then%>
                                rmCookie("UID");rmCookie("PSW");
                            <% end if %>
                        }			
                </SCRIPT>
                </span>
            </div>
            <div class="forget font-pwd fr">
                <span class="forget-pwd" onclick="forgetPass()">忘记密码？</span>
            </div>
        </div>
        <div class="form-group" style="height: 40px;">
                <input id="btnSubmit" onclick="SubmitForm()" type="button" value="登 录" name="btnSubmit" class="btn-text"></input>
                    &nbsp;
        <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
            <%if tcwebApi_get("WebCustom_Entry","isCTSFUC9Supported","h")="Yes" then %>
            <INPUT id="bandReg" onclick="btnbandReg()" type="button" value="设备注册" name="bandReg">
                    &nbsp; 
            <%else%>
            <%if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h")="Yes" then %>
            <%elseif tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") = "Yes" then %>
            <%else%>
                    <INPUT id="bandReg" onclick="btnbandReg()" type="button" value="设备注册" name="bandReg">
                    &nbsp; 
            <% end if %> 
            <% end if %> 
        <% end if %>
        </div>
    </div>
    <% end if %>
    <div class="forget-form">
        <SCRIPT language=JavaScript type=text/javascript>
            <%if tcWebApi_get("WebCurSet_Entry","isLockState","h") = "1" then %>
            LoginTimes = 3
            <% end if %>
            if (LoginTimes >= 3 && !(1==gotoMainSet&&1==pswST&&0==Logged) )
            {
                document.write("<label>登录密码错误次数超过限制，系统锁定1分钟，请稍后再试。</label><div class='forget font-pwd fr'><span class='forget-pwd' onclick=\"forgetPass()\">忘记密码？</span></div>");
            }
        </SCRIPT>
    </div>
    </DIV>
    </DIV>
    </FORM>
    </DIV>
            <SCRIPT language=JavaScript type=text/javascript>
            if (LoginTimes >= 3)
            {
                getElById('loginForm').style.display = 'none';
                do_lock_timer();
            }
            else if ((Logged&&pswST) || (1==gotoMainSet&&1==pswST&&0==Logged))
            {
                // getElById('loginForm').style.display = 'none';
            }
            else
            {
                <% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") <> "Yes" then%>
                getElById('Username').focus();
                <% end if %>
            }
            </SCRIPT>
    <div class="footer">
        软件版本：<%tcWebApi_get("DeviceInfo_devParaStatic", "CustomerSWVersion","s")%> MAC地址：<%tcWebApi_get("Info_Ether", "mac","s")%><br>
    </div>
</div>
</BODY></html>
