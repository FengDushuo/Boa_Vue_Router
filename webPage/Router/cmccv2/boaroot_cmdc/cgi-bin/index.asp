<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>主页</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<LINK href="/JS/style_index.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<script>
    function doRefresh()
    {
        location.href='/cgi-bin/logout.cgi';
    }

    var rebootEnable = "<% tcWebApi_get("System_Entry","reboot_type","s") %>";
    if (rebootEnable == 1) {
        setTimeout(function () {
            showLoading(60, "upgrade", "设备正在重启，请耐心等待……");
        }, 1000);
        setTimeout(doRefresh, 61*1000);
    }
</script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<div class="header">
	<div class="logo_img"></div>
	<div class="in_line"></div>
	<div class="in_device">
		<span class="td_model">
			<SCRIPT language=javascript> 
				document.write(top.ModelName); 
			</SCRIPT>
		</span>
		<br>
		<span class="in_info">
			智能家庭路由器
		</span>
	</div>
    <FORM name=ConfigForm action="/cgi-bin/index.asp" method="post">
        <INPUT type="HIDDEN" name="rebootflag" value="0">
        <INPUT type="HIDDEN" name="restoreFlag" value="<% tcWebApi_get("System_Entry","reboot_type","s") %>">

        <script>
            function Reboot()
            {
                confirm("确认重启？", function(ret) {
                    if(ret)
                    {
                        clearInterval(timer1);
                        document.ConfigForm.rebootflag.value = "1";
                        document.ConfigForm.restoreFlag.value = "1";
                        setTimeout(function() {
                            document.ConfigForm.submit();
                        }, 1000);
                    }
                });
            }
            </script>
        <div class="in_welcom">
            <div class="fl" style="font-size: 0;" onclick="Reboot()">
                <img src="../img/icon_reboot.png">
                <span>重启设备</span>
            </div>
            <div class="fl" style="margin-left: 24px;font-size: 0;" onclick="location.href='/cgi-bin/logout.cgi'">
                <img src="../img/icon_drop_out.png">
                <a>退出</a>
            </div>
            <input id="Selected_Menu" type="hidden" value="主 页" name="Selected_Menu">
        </div>
    </FORM>
</div>
<br/>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
	<TBODY>
		<TR>
			<TD class="header" style="height: 50px;">
				<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
					<TBODY>
						<TR id="MenuArea_L0">
							<TD id=MenuArea_L1></TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>  
		<TR>
			<TD class="content" style="height: auto;">
				<SCRIPT language=JavaScript type=text/javascript>
		//when login the Home page,set the cookie of LOGFLAG to logged
		document.cookie =  "LOGFLAG=logged;path=/;";
		<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
		var Nametype = 0;
 		var para = 0;	  
		var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		//get all value
		// num 0
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanName = vArrayStr.split(',');
		// num 1
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanValue = vArrayStr.split(',');
		// num 2
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 3
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		Wan_Actives = vArrayStr.split(',');
		// num 4		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var WANEnNAT = vArrayStr.split(',');
		// num 5		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 6		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IPVERSION = vArrayStr.split(',');
		// num 7		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status4 = vArrayStr.split(',');
		// num 8		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP4 = vArrayStr.split(',');
		// num 9		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_ENCAP = vArrayStr.split(',');
		// num 10		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay4 = vArrayStr.split(',');
		// num 11		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS4 = vArrayStr.split(',');
		// num 12		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS4 = vArrayStr.split(',');
		// num 13		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status6 = vArrayStr.split(',');
		// num 14		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP6 = vArrayStr.split(',');
		// num 15		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay6 = vArrayStr.split(',');
		// num 16		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS6 = vArrayStr.split(',');
		// num 17		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS6 = vArrayStr.split(',');
		// num 18		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_PD6 = vArrayStr.split(',');
		// num 19		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_NetMask4 = vArrayStr.split(',');
		// num 20		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 21		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 22		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Connection = vArrayStr.split(',');
		// num 23		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_VidPRI = vArrayStr.split(',');
		// num 24		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_MAC = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","ConnectionError","s") %>";
		var Wan_ConnectionError = vArrayStr.split(',');

		SortUtil.SetReplaceStrflag(1);
		Wan_WanName = SortUtil.UpdateWanIFName( Wan_WanName, pvc_counts );

		Wan_Actives = SortUtil.SortMyArray( Wan_Actives );
		Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
		Wan_Status4 = SortUtil.SortMyArray( Wan_Status4 );
		Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
		Wan_ENCAP = SortUtil.SortMyArray( Wan_ENCAP );
		Wan_GateWay4 = SortUtil.SortMyArray( Wan_GateWay4 );
		Wan_DNS4 = SortUtil.SortMyArray( Wan_DNS4 );
		Wan_SecDNS4 = SortUtil.SortMyArray( Wan_SecDNS4 );
		Wan_Status6 = SortUtil.SortMyArray( Wan_Status6 );
		Wan_IP6 = SortUtil.SortMyArray( Wan_IP6 );
		Wan_GateWay6 = SortUtil.SortMyArray( Wan_GateWay6 );
		Wan_DNS6 = SortUtil.SortMyArray( Wan_DNS6 );
		Wan_SecDNS6 = SortUtil.SortMyArray( Wan_SecDNS6 );
		Wan_PD6 = SortUtil.SortMyArray( Wan_PD6 );
		Wan_NetMask4 = SortUtil.SortMyArray( Wan_NetMask4 );
		Wan_Connection = SortUtil.SortMyArray( Wan_Connection );
		Wan_VidPRI = SortUtil.SortMyArray( Wan_VidPRI );
		Wan_MAC = SortUtil.SortMyArray( Wan_MAC );
		Wan_ConnectionError = SortUtil.SortMyArray( Wan_ConnectionError );
<% end if%>

<% if tcWebApi_get("WebCustom_Entry", "isCTPONYNSupported", "h") = "Yes"  then %>
<% if tcWebApi_get("WebCustom_Entry", "isCT2PORTSSupported", "h") = "Yes"  then %>
    var portNumber = "2";
<% else %>
    var portNumber = "4";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isWLanSupported", "h") = "Yes"  then %>
    var isWifiSupported = "AP";
<% else %>
    var isWifiSupported = "NoAP";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %> 
		var deviceType = "E8C 1 "+isWifiSupported;
<% else %>   
    var deviceType = "E8C "+portNumber+"+1 "+isWifiSupported;
<% end if%>
<% end if%>

function stDeviceInfo(domain,ProductClass,SerialNumber,HardwareVersion,SoftwareVersion,ManufacturerOUI)
{
this.domain = domain;
this.ProductClass = ProductClass;
this.ManufacturerOUI = ManufacturerOUI;
this.SerialNumber = SerialNumber;
this.HardwareVersion = HardwareVersion;
this.SoftwareVersion = SoftwareVersion;
}
temp = new Array(new stDeviceInfo("InternetGatewayDevice.DeviceInfo",top.ModelName,"19191900AABB818180","HG530RRA.VER.C","V100R001C01B010","00AABB"),null);
var DeviceInfo = temp[0];

function RssirefreshSub()
{
	window.location.replace("index.asp");
}
function LoadFrame()
{
    // setTimeout("RssirefreshSub()", 2000);
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

// 时间格式转换
function formatSeconds2(secondTime) {
    var minuteTime = 0;
    var hourTime = 0;
    var dayTime = 0;
    if (secondTime > 60) {
        minuteTime = parseInt(secondTime / 60);
        secondTime = parseInt(secondTime % 60);
        if (minuteTime > 60) {
            hourTime = parseInt(minuteTime / 60);
            minuteTime = parseInt(minuteTime % 60);
        }
    }
    if (hourTime >= 24) {
        dayTime = parseInt(hourTime / 24);
        hourTime = parseInt(hourTime % 24);
    }

    return {
        day: dayTime,
        hour: hourTime,
        minute: minuteTime
    }
}

// 速率转换
function rateUnit(value) {
    value = (value * 8 / 1024).toFixed(1);
    value = parseInt(value);
    if (value <= 1024) {
        return value + " kbps";
    }
    else if (value > 1024 && value <= (1024 * 1024)) {
        return (value / 1024).toFixed(1) + " Mbps";
    }
    else if (value > 1024 * 1024){
        return (value / (1024 * 1024)).toFixed(1) + " Gbps";
    }
    else {
        return "0 kbps";
    }
}

var infoObj = {
    Connect_status: "0",
    Online_time: "0",
    Rxbytes: "0",
    Txbytes: "0",
    Uptime: "0",
    Wan_IP: ""
};
var Time1 = 0,
    Time2 = 0,
    Rxbytes1 = 0,
    Rxbytes2 = 0,
    Txbytes1 = 0, 
    Txbytes2 = 0;
var value = '<% tcWebApi_JsonHook("get_homepage_basic_info", "action", "area") %>';
var Obj = JSON.parse(value).data[0];
LoadInfo(Obj);
Time1 = parseInt(infoObj.Uptime);
Rxbytes1 = parseInt(infoObj.Rxbytes);
Txbytes1 = parseInt(infoObj.Txbytes);

function LoadInfo(Obj)
{
    for(var key in Obj) {
        if (Obj[key] && Obj.hasOwnProperty(key)) {
            infoObj[key] = Obj[key];
        }
    }
    var timeObj = formatSeconds2(parseInt(Obj.Uptime)),
        timeObj2 = formatSeconds2(parseInt(Obj.Online_time));
    infoObj.UptimeDay = timeObj.day;
    infoObj.UptimeHour = timeObj.hour;
    infoObj.UptimeMinute = timeObj.minute;
    infoObj.OnlinetimeDay = timeObj2.day;
    infoObj.OnlinetimeHour = timeObj2.hour;
    infoObj.OnlinetimeMinute = timeObj2.minute;
}

var timer1 = null;
timer1 = setInterval(function() {
    $.ajax({  
        type: "GET",   //提交的方法
        url: "/cgi-bin/indexTimer.asp", //提交的地址  
        async: true,
        dataType: 'text',
        success: function(data) {
            if(data.indexOf("value") != -1) {
                var indexStart = data.indexOf("<script>"),
                    indexEnd = data.indexOf("<\/script>");
                data = data.substring(indexStart + 8, indexEnd);
                eval(data);
                var dataObj = JSON.parse(value).data[0];
                LoadInfo(dataObj);
                Time2 = parseInt(infoObj.Uptime);
                Rxbytes2 = parseInt(infoObj.Rxbytes);
                Txbytes2 = parseInt(infoObj.Txbytes);
            }
        },
        error: function(error) {
            console.log(error);
        }
    });

    if(infoObj.Connect_status == '3') {
        setTimeout(function () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/indexTimer.asp", //提交的地址  
                async: true,
                dataType: 'text',
                success: function(data) {
                    if(data.indexOf("value") != -1) {
                        var indexStart = data.indexOf("<script>"),
                            indexEnd = data.indexOf("<\/script>");
                        data = data.substring(indexStart + 8, indexEnd);
                        eval(data);
                        var dataObj = JSON.parse(value).data[0];
                        LoadInfo(dataObj);
                        Time1 = parseInt(infoObj.Uptime);
                        Rxbytes1 = parseInt(infoObj.Rxbytes);
                        Txbytes1 = parseInt(infoObj.Txbytes);
                    }
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }, 1000);
    }
}, 2000);

function get_wan_connect() {
    let div = $(".speed.line"),
        div2 = $(".network-info"),
        htmlStr = "",
        htmlStr2 = "";
    // 已连接
    if(infoObj.Connect_status == '3') {
        var time = Time2 - Time1,
            rxrate = ((Rxbytes2 - Rxbytes1) / time).toFixed(1),
            txrate = ((Txbytes2 - Txbytes1) / time).toFixed(1);
        var Txbytes = rateUnit(txrate),
            Rxbytes = rateUnit(rxrate);
        var txRate = Txbytes.split(' ')[0],
            txUnit = Txbytes.split(' ')[1],
            rxRate = Rxbytes.split(' ')[0],
            rxUnit = Rxbytes.split(' ')[1];
        htmlStr = "<div class=\"up-speed\">"+
            "<div class=\"title\">"+
            "<img src=\"../img/home_page/icon_upload.png\">"+
            "<span>上传速度</span>"+"</div>"+"<div class=\"data\" style=\"color: #65E7AF;\">"+
            "<span>" + txRate + "</span><span style=\"font-size: 14px;\"> " + txUnit + "</span>"+
            "</div></div><div class=\"down-speed\">"+"<div class=\"title\">"+
            "<img src=\"../img/home_page/icon_download.png\">"+
            "<span>下载速度</span>"+"</div>"+"<div class=\"data\">"+
            "<span>" + rxRate + "</span><span style=\"font-size: 14px;\"> " + rxUnit + "</span></div></div>";
    }
    else {
        // 未连接
        if(infoObj.Connect_status == '1' || infoObj.Connect_status == '2') {
            htmlStr = "<div class=\"up-img\"><img src=\"../img/home_page/icon_discon.png\" width=\"24px\" height=\"24px\"></div><div class=\"down-speed\" style=\"top: 15px;left: 25px;\"><div class=\"title\" style=\"width: 116px;text-align: center;\"><span style=\"font-size: 12px;\">未连接互联网</span></div></div>";

            $(".wired").html("<div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div>");
        }
        // 未插网线
        else {
            htmlStr = "<div class=\"up-img\"><img src=\"../img/home_page/icon_discon.png\"></div><div class=\"down-speed\" style=\"top: 15px;left: -8px;\"><div class=\"title\" style=\"width: 190px;text-align: center;\"><span style=\"font-size: 12px;\">未检测到网线接入</span></div></div>";

            $(".wired").html("<div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div>");
        }
    }

    <% if tcWebApi_get("WLan_Common","APOn","h") = "0" then %>
            <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "0" then %> 
                htmlStr2 = "<div class=\"top-bot\" style=\"bottom: 29px;\"><div class=\"icon\" style=\"width: 96px;left: 27px;\" onclick=\"location.replace('net-wlan.asp')\"><img src=\"../img/home_page/icon_discon.png\"><span style=\"width: 58px;color: #787E7E;font-size: 12px;\">无线网络</span></div></div><div class=\"middle\" style=\"top: 0;\"><div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div></div>";
            <% else %>
                htmlStr2 = "<div class=\"top-bot\" style=\"bottom: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-wlan.asp')\"><img src=\"../img/home_page/icon_discon.png\"><span style=\"color: #787E7E;font-size: 12px;\">2.4G</span></div></div><div class=\"middle\" style=\"top: 0;\"><div class=\"icon\" onclick=\"location.replace('net-wlan11ac.asp')\"><img src=\"../img/home_page/icon_wifi.png\"><span>5G</span></div></div><div class=\"top-bot wired\" style=\"top: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div></div>";
            <% end if %>
        <% else %>
            <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "0" then %> 
                htmlStr2 = "<div class=\"top-bot\" style=\"bottom: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-wlan.asp')\"><img src=\"../img/home_page/icon_wifi_2.png\"><span style=\"color: #0CCFA8;\">2.4G</span></div></div><div class=\"middle\" style=\"top: 0;\"><div class=\"icon\" onclick=\"location.replace('net-wlan11ac.asp')\"><img src=\"../img/home_page/icon_discon.png\"><span style=\"color: #787E7E;font-size: 12px;\">5G</span></div></div> <div class=\"top-bot wired\" style=\"top: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div></div>";
            <% else %>
                htmlStr2 = "<div class=\"top-bot\" style=\"bottom: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-wlan.asp')\"><img src=\"../img/home_page/icon_wifi_2.png\"><span style=\"color: #0CCFA8;\">2.4G</span></div></div><div class=\"icon\" onclick=\"location.replace('net-wlan11ac.asp')\"><img src=\"../img/home_page/icon_wifi.png\"><span style=\"color: #787E7E;font-size: 12px;\">5G</span></div><div class=\"top-bot wired\" style=\"top: 29px;\"><div class=\"icon\" onclick=\"location.replace('net-dhcp.asp')\"><span style=\"width: 58px;\">有线网络</span></div></div>";
            <% end if %>
        <% end if %>
    
    div.html(htmlStr);
    div2.html(htmlStr2);
}

function get_uptime_info() {
    let div = $(".up-time"),
        htmlStr = "";
    if (infoObj.Connect_status == '3') {
        htmlStr = "<span> " + infoObj.OnlinetimeDay + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">天</span><span> " + infoObj.OnlinetimeHour + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">小时</span><span> " + infoObj.OnlinetimeMinute + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">分钟</span>";
    }
    else {
        htmlStr = "未连接互联网";
    }
    div.html(htmlStr);
}

function get_system_info() {
    let div = $(".run-time"),
        htmlStr = "";
        htmlStr = "<span> " + infoObj.UptimeDay + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">天</span><span> " + infoObj.UptimeHour + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">小时</span><span> " + infoObj.UptimeMinute + " </span><span style=\"font-size: 14px;font-family: MicrosoftYaHei;color: #5F6172;\">分钟</span>";
    div.html(htmlStr);
}

function get_wanip_info() {
    let div = $(".wanip"),
        htmlStr = "";
    if (infoObj.Connect_status == '3' || infoObj.Connect_status == '2') {
        htmlStr = "<span>" + infoObj.Wan_IP + "</span>";
    }
    else if (infoObj.Connect_status == '1') {
        htmlStr = "<span>未获取到WAN IP</span>"; 
    }
    else {
        htmlStr = "<span>未连接互联网</span>"; 
    }
    div.html(htmlStr);
}

var BatchNumber = "RWC30P0.010.84725";
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
function PonInfoClass()
{
	this.LinkSta				= '<% tcWebApi_get("XPON_LinkCfg","LinkSta","s") %>';
	this.trafficstate			= '<% tcWebApi_get("XPON_Common","trafficStatus","s") %>';
	this.fecState				= '<% tcWebApi_get("Info_PonPhy","FecStatus","s") %>';
	this.PonState				= 'down';
	this.FECEnable				= 'disabled';
	this.WarnInfo				= 'disconnect';
	this.PonSendPkt				= '<% tcWebApi_get("Info_PonWanStats","TxFrameCnt","s") %>';
	this.PonRecvPkt				= '<% tcWebApi_get("Info_PonWanStats","RxFrameCnt","s") %>';
	this.SendPower				= '-';
	this.RecvPower				= '-';
	this.WorkVoltage			= '-';
	this.WorkElectric			= '-';
	this.WorkTemperature		= '-';
			
	if ( 'up' == this.trafficstate )
	{
		this.PonState 			= 'up';
		this.WarnInfo 			= 'no info';
	}
			
	if( '0' != this.LinkSta)
	{
		this.SendPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
		this.RecvPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
	}

	if ( '1' == this.fecState )
	{
		this.FECEnable			= 'enabled';
	}
}
var PonInfo = new PonInfoClass();
<% end if%>
</SCRIPT>
				<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain" style="position: relative;">
					<TBODY>
						<TR>
							<SCRIPT language=javascript>
								MakeMenu(getElById ('Selected_Menu').value);
							</SCRIPT>			
							<TD valign="bottom">
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 100%;margin: 0 auto;margin-top: 79px;">
									<TBODY>
										<TR>
											<TD>
												<div class="home-info clearfix">
                                                    <div class="my-network fl">
                                                        <img src="../img/home_page/icon_wdwl_nor.png" onclick="location.replace('wan_page.asp')">
                                                        <div class="info-text" style="margin-top: 42px; margin-left:9px;" onclick="location.replace('wan_page.asp')">
                                                            我的网络</div>
                                                    </div>
                                                    <div class="speed line fl"></div>
                                                    <div class="device-img fl">
                                                        <img src="../img/device.png" onclick="location.replace('sta-device.asp')">
                                                        <div class="info-text" style="width: 100%;margin-top: 15px;text-align: center;cursor: pointer;" onclick="location.replace('sta-device.asp')"> <SCRIPT language=javascript>
                                                            <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                                                document.write(top.ModelName_dev);
                                                            <% else %>
                                                                document.write(top.ModelName);
                                                            <% end if %>   
                                                            </SCRIPT> 路由器</div>
                                                    </div>
                                                    <div class="network-info line fl"
                                                        style="-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;">
                                                    </div>
                                                    <script>
                                                        get_wan_connect();
                                                        setInterval(get_wan_connect, 2000);
                                                    </script>
                                                    <div class="devices fl">
                                                        <img src="../img/home_page/icon_wdsb_nor.png" style="cursor: pointer;" onclick="location.replace('terminal_page.asp')">
                                                        <div class="number">
                                                            <span style="font-size: 24px;">
                                                                <SCRIPT language=JavaScript type=text/javascript>
                                                                    var lanhost_value = '<% tcWebApi_JsonHook("get_lanhost_info", "action", "area") %>'
                                                                    var rsp = JSON.parse(lanhost_value);
                                                                    var lanhost_list = rsp.data;
                                                                    if(lanhost_list.length) {
                                                                        document.write(lanhost_list.length);
                                                                    }
                                                                    else {
                                                                        document.write(0);
                                                                    }
                                                                </SCRIPT></span>
                                                            <span style="font-size: 14px;">台</span>
                                                        </div>
                                                        <div class="info-text" style="margin: 7px 6px 0;width: 60px;" onclick="location.replace('terminal_page.asp')">
                                                            我的终端</div>
                                                    </div>
                                                </div>
											</TD>
										</TR>
                                        <TR>
                                            <TD>
                                                <div class="bottom-info">
                                                    <div class="info clearfix">
                                                        <div class="info-text fl">
                                                            <div class="system-time up-time"></div>
                                                            <script>
                                                                get_uptime_info();
                                                                setInterval(get_uptime_info, 2000);
                                                            </script>
                                                            <div class="info-title">上网时长</div>
                                                        </div>
                                                        <div class="line fl"></div>
                                                        <div class="info-text fl">
                                                            <div class="system-time run-time"></div>
                                                            <script>
                                                                get_system_info();
                                                                setInterval(get_system_info, 2000);
                                                            </script>
                                                            <div class="info-title">系统运行时长</div>
                                                        </div>
                                                        <div class="line fl"></div>
                                                        <div class="info-text fl">
                                                            <div class="system-time wanip" style="width: 214px;">
                                                                <script>
                                                                    if (infoObj.Connect_status == '2' || infoObj.Connect_status == '3') {
                                                                        document.write("<span>" + infoObj.Wan_IP + "</span>");
                                                                    }
                                                                    else if (infoObj.Connect_status == '1') {
                                                                        document.write("<span>未获取到WAN IP</span>"); 
                                                                    }
                                                                    else {
                                                                       document.write("<span>未连接互联网</span>"); 
                                                                    }
                                                                </script>
                                                                
                                                                <div class="ipv6-info" style="display: none;">
                                                                    <span class="cont">
                                                                        <span class="txt"></span>
                                                                        <span class="txt"></span>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <script>
                                                                get_wanip_info();
                                                                setInterval(get_wanip_info, 2000);
                                                            </script>
                                                            <div class="info-title">WAN IP</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </TD>
                                        </TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TBODY>

                    <!-- 二维码 -->
                    <!--div class="app-img" style="display: none;">
                        <img src="../img/image_qr_code.png">
                        <div class="app-img-text">扫描安装和家亲APP</div>
                    </div-->
				</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>			
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY>
</HTML>