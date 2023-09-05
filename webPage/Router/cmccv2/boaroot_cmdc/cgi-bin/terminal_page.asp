<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if

if Request_Form("Save_Flag") = "1" then
    TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
    TCWebApi_set("IpMacFilter_Common","ActiveMac","EnMacFilter_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Entry","Active","EnableMac_Flag")
	TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
	TCWebApi_set("IpMacFilter_Entry","MacAddr","SourceMACAddress")
	TCWebAPI_set("IpMacFilter_Entry","Interface","Interface_Flag")
	TCWebAPI_set("IpMacFilter_Entry","Direction","Direction_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "2" then
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Entry","Active","EnableMac_Flag")
	TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
	TCWebApi_set("IpMacFilter_Entry","MacAddr","SourceMACAddress")
	TCWebAPI_set("IpMacFilter_Entry","Interface","Interface_Flag")
	TCWebAPI_set("IpMacFilter_Entry","Direction","Direction_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "3" then
    if Request_Form("NameIndex") = "0" then
        TCWebApi_set("LANHost2_Entry0", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "1" then
        TCWebApi_set("LANHost2_Entry1", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "2" then
        TCWebApi_set("LANHost2_Entry2", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "3" then
        TCWebApi_set("LANHost2_Entry3", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "4" then
        TCWebApi_set("LANHost2_Entry4", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "5" then
        TCWebApi_set("LANHost2_Entry5", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "6" then
        TCWebApi_set("LANHost2_Entry6", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "7" then
        TCWebApi_set("LANHost2_Entry7", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "8" then
        TCWebApi_set("LANHost2_Entry8", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "9" then
        TCWebApi_set("LANHost2_Entry9", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "10" then
        TCWebApi_set("LANHost2_Entry10", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "11" then
        TCWebApi_set("LANHost2_Entry11", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "12" then
        TCWebApi_set("LANHost2_Entry12", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "13" then
        TCWebApi_set("LANHost2_Entry13", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "14" then
        TCWebApi_set("LANHost2_Entry14", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "15" then
        TCWebApi_set("LANHost2_Entry15", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "16" then
        TCWebApi_set("LANHost2_Entry16", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "17" then
        TCWebApi_set("LANHost2_Entry17", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "18" then
        TCWebApi_set("LANHost2_Entry18", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "19" then
        TCWebApi_set("LANHost2_Entry19", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "20" then
        TCWebApi_set("LANHost2_Entry20", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "21" then
        TCWebApi_set("LANHost2_Entry21", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "22" then
        TCWebApi_set("LANHost2_Entry22", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "23" then
        TCWebApi_set("LANHost2_Entry23", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "24" then
        TCWebApi_set("LANHost2_Entry24", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "25" then
        TCWebApi_set("LANHost2_Entry25", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "26" then
        TCWebApi_set("LANHost2_Entry26", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "27" then
        TCWebApi_set("LANHost2_Entry27", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "28" then
        TCWebApi_set("LANHost2_Entry28", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "29" then
        TCWebApi_set("LANHost2_Entry29", "NickName","Hostname")
    elseif Request_Form("NameIndex") = "30" then
        TCWebApi_set("LANHost2_Entry30", "NickName","Hostname")
    end if
    TCWebApi_commit("LANHost2")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "4" then
    if Request_Form("NameIndex") = "0" then
        TCWebApi_set("LANHost2_Entry0", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "1" then
        TCWebApi_set("LANHost2_Entry1", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "2" then
        TCWebApi_set("LANHost2_Entry2", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "3" then
        TCWebApi_set("LANHost2_Entry3", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "4" then
        TCWebApi_set("LANHost2_Entry4", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "5" then
        TCWebApi_set("LANHost2_Entry5", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "6" then
        TCWebApi_set("LANHost2_Entry6", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "7" then
        TCWebApi_set("LANHost2_Entry7", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "8" then
        TCWebApi_set("LANHost2_Entry8", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "9" then
        TCWebApi_set("LANHost2_Entry9", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "10" then
        TCWebApi_set("LANHost2_Entry10", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "11" then
        TCWebApi_set("LANHost2_Entry11", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "12" then
        TCWebApi_set("LANHost2_Entry12", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "13" then
        TCWebApi_set("LANHost2_Entry13", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "14" then
        TCWebApi_set("LANHost2_Entry14", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "15" then
        TCWebApi_set("LANHost2_Entry15", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "16" then
        TCWebApi_set("LANHost2_Entry16", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "17" then
        TCWebApi_set("LANHost2_Entry17", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "18" then
        TCWebApi_set("LANHost2_Entry18", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "19" then
        TCWebApi_set("LANHost2_Entry19", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "20" then
        TCWebApi_set("LANHost2_Entry20", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "21" then
        TCWebApi_set("LANHost2_Entry21", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "22" then
        TCWebApi_set("LANHost2_Entry22", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "23" then
        TCWebApi_set("LANHost2_Entry23", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "24" then
        TCWebApi_set("LANHost2_Entry24", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "25" then
        TCWebApi_set("LANHost2_Entry25", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "26" then
        TCWebApi_set("LANHost2_Entry26", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "27" then
        TCWebApi_set("LANHost2_Entry27", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "28" then
        TCWebApi_set("LANHost2_Entry28", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "29" then
        TCWebApi_set("LANHost2_Entry29", "InternetAccess","internetAccess")
    elseif Request_Form("NameIndex") = "30" then
        TCWebApi_set("LANHost2_Entry30", "InternetAccess","internetAccess")
    end if
    TCWebApi_commit("LANHost2")
	TCWebApi_save()
end if

if Request_Form("speedlimitflag") = "1" then
	tcWebApi_JsonHook("cmcc_lanhost_speedlimit_list","speedlimitlist")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>设备信息</TITLE>
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
    var gwAddrTmp = '<% tcWebApi_get("alinkmgr_Entry","gwAddr","s") %>';
    var gwAddr = gwAddrTmp.split(':');
    var portIPTemp = '<% tcWebApi_get("Info_Ether","PortIP","s") %>';
    var portIP = portIPTemp.split(',');
    var dhcpNum = portIP.length - 1;
    var portMacTemp = '<% tcWebApi_get("Info_Ether","PortMac","s") %>';
    portMacTemp += '<% tcWebApi_get("Info_Ether","PortMac2","s") %>';
    var portMac = portMacTemp.split(',');

    var maxbandwidthInfo = '<% tcWebApi_JsonHook("get_maxbandwidth_info","action","area") %>';
</script>
<style>
.table-outer {
    border: none;
}
.trStyle3 {
    height: 91px;
}
.trStyle2 .tdWidth2 {
    padding: 0;
}
.btn_icon {
    display: inline-block;
    width: 32px;
    height: 16px;
    line-height: 16px;
    background-color: #2e7bff;
    border-radius: 4px;
    font-size: 12px;
    font-family: MicrosoftYaHei;
    color: #ffffff;
    padding: 0;
}
.trName {
    display: flex;
    justify-content: center;
    align-items: center;
}
.device-name {
    margin: 0 4px;
    width: 73px;
    line-height: 19px;
    word-break: break-all;
    color: rgb(46, 123, 255);
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
.img-edit {
    display: inline-block;
    width: 24px;
    height: 24px;
    background: url(../img/icon_edit.png) no-repeat center;
}
.font-blue {
    height: 19px;
    line-height: 19px;
    color: #2E7BFF;
    letter-spacing: 0.5px;
    margin-left: 5px;
}
.font-limit {
    color: #4D504F;
    margin-left: -1px;
    display: inline-block;
    width: 94px;
    text-align: left;
}
select,  .select-list {
    margin-bottom: 0;
    width: 200px;
}
.select-list-selected {
    width: 145px;
}
.select-list.select-open .select-list-options {
    width: 200px;
}
.online select, .online .select-list {
    width: 130px;
}
.online .select-list.select-open .select-list-options {
    width: 130px;
}
.select-list .select-list-items.select-list-items-selected,
.select-list .select-list-items {
    text-align: left;
}
.online .select-list-selected {
    width: 78px;
}
.trLimit {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    height: 91px;
    line-height: 30px;
    font-size: 13px;
}
.trLimit input[type="text"] {
    width: 92px;
    height: 24px;
    margin-bottom: 0;
}
.limit-text {
    margin-left: 6px;
}
.self {
    font-size: 14px;
    font-family: MicrosoftYaHei;
    color: #2E7BFF;
    letter-spacing: 0.5px;
}
.pageContainer {
    width: 100%;
    height: 32px;
    line-height: 32px;
    margin: 25px auto;
    text-align: center;
}
.page {
    display: inline-block;
}
.page li {
    width: 32px;
    height: 32px;
    line-height: 32px;
    background: #ffffff;
    border-radius: 2px;
    border: 1px solid #d9d9d9;
    text-align: center;
    font-size: 14px;
    font-family: MicrosoftYaHei;
    color: #7c7e89;
    float: left;
    margin-right: 8px;
    cursor: pointer;
}
.page li.active {
    background: #2e7bff;
    border-radius: 2px;
    border: 1px solid #d9d9d9;
    color: #ffffff;
}
.page li img {
    padding-top: 8px;
}
</style>
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
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
	<FORM name=RebootForm action="/cgi-bin/terminal_page.asp" method="post">
        <INPUT type="HIDDEN" name="rebootflag" value="0">
        <INPUT type="HIDDEN" name="restoreFlag" value="<% tcWebApi_get("System_Entry","reboot_type","s") %>">

        <script>
            function Reboot()
            {
                confirm("确认重启？", function(ret) {
                    if(ret)
                    {
                        document.RebootForm.rebootflag.value = "1";
                        document.RebootForm.restoreFlag.value = "1";
                        setTimeout(function() {
                            document.RebootForm.submit();
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
		<input id="Selected_Menu" type="hidden" value="终端管理" name="Selected_Menu">
	</div>
</FORM>
</div>
<br/>
<% else %>
<div class="in_welcom" onclick="top.location.href='/'">
		<span>您好！</span>
		<a>
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="管理->终端管理" name="Selected_Menu"></TD>
	</div>
</div>
<% end if %>

<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
	<TBODY>
		<TR>
			<TD class="header" style="height: 50px;">
				<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
					<TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
                        <TR id="MenuArea_L0">
							<TD id=MenuArea_L1></TD>
                        </TR>
<% else %>
							<TD id=MenuArea_L1></TD>
<% end if %>
					</TBODY>
				</TABLE>
			</TD>
		</TR>  
		<TR>
			<TD class="content" style="height: 528px;">
				<script>
                    var device_ip = '<% tcWebApi_get("Account_Entry0","LoginIp","s") %>';
                    var onlineList = [];
                    function LoadFrame()
                    {
                        scmRadio.init($('body'));
						var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
						set_action(query_string);
                    }

                    // 时间格式转换
                    function formatSeconds3(secondTime) {
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

                        var str1 = dayTime ? dayTime + "天" : "",
                            str2 = hourTime ? hourTime + "小时" : "",
                            str3 = minuteTime ? minuteTime + "分钟" : "0分钟";

                        return str1 + str2 + str3;
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

                    var Index = 0,
                        HostName = "",
                        IPaddr = "",
                        txRate = 0,
                        rxRate = 0,
                        OnlineTime = "",
                        connectType = 0,
                        interAccess = 0;
                    // 检查是否已存在mac
                    function CheckDeviceIn(mac) {
                        var value1 = '<% tcWebApi_JsonHook("get_online_lanhost_info", "action", "area") %>',
                            value2 = '<% tcWebApi_JsonHook("get_offline_lanhost_info", "action", "area") %>';

                        var rsp1 = JSON.parse(value1),
                            rsp2 = JSON.parse(value2);
                        var list1 = rsp1.data,
                            list2 = rsp2.data;
                        with (getElById('ConfigForm')) {
                            for (var i = 0; i < list1.length; i++) {
                                if (mac.toLowerCase() == list1[i]['MAC'].toLowerCase()) {
                                    Index = list1[i]["Index"];
                                    HostName = list1[i]["HostName"];
                                    IPaddr = list1[i]["IP"];
                                    txRate = rateUnit(list1[i]["txrate"]);
                                    rxRate = rateUnit(list1[i]["rxrate"]);
                                    OnlineTime = formatSeconds3(list1[i]["OnlineTime"]);
                                    connectType = get_connect_type(list1[i]);
                                    interAccess = list1.InternetAccess;
                                    return true;
                                }
                            }
                            for (var i = 0; i < list2.length; i++) {
                                if (mac.toLowerCase() == list2[i]['MAC'].toLowerCase()) {
                                    Index = list2[i]["Index"];
                                    HostName = list2[i]["HostName"];
                                    IPaddr = list2[i]["IP"];
                                    txRate = '0 kbps';
                                    rxRate = '0 kbps';
                                    // OnlineTime = formatSeconds3(list2[i]["LatestActiveTime"]);
                                    OnlineTime = "0分钟";
                                    connectType = get_connect_type(list2[i]);
                                    interAccess = list2.InternetAccess;
                                    return true;
                                }
                            }
                        }
                        return false;
                    }

                    // 获取连接类型
                    function get_connect_type(item) {
                        var connect_type = "";
                        if(item.conntype == 0) {
                            connect_type = "有线";
                        }
                        else {
                            if(item.port <= 8) {
                                connect_type = "2.4G";
                            }
                            else if(item.port >= 9) {
                                connect_type = "5G";
                            }
                        }
                        return connect_type;
                    }

                    // 修改设备名称
                    function change_device_name(index, name) {
                        confirm("设备名称", name, function(ret){ 
                            if(ret)
                            {
                                var Form = document.ConfigForm;
                                Form.Save_Flag.value = "3";
                                Form.NameIndex.value = parseInt(index) - 1;
                                Form.Hostname.value = document.getElementById("hostName").value;
                                $("form[name='ConfigForm']").submit();
                            }
                        });
                    }

                    // 修改允许上网状态
                    function change_device_access(index, value) {
                        var Form = document.ConfigForm;
                        Form.Save_Flag.value = "4";
                        Form.NameIndex.value = parseInt(index) - 1;
                        Form.internetAccess.value = value == 1 ? 0 : 1;
                        $("form[name='ConfigForm']").submit();
                    }

                    // 更改设备显示类型
                    function modeChange() {
                        var selIndex = document.getElementById("modeIndex").selectedIndex;
                        var htmlstr = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList">'+
                                    '<thead>'+
                                        '<tr class="trStyle2">'+
                                            '<TD class="tdWidth2" style="width: 228px!important;font-weight: normal;">'+
                                                '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">'+
                                                    '<OPTION value=0>在线设备</OPTION>'+
                                                    '<OPTION value=1>离线设备</OPTION>'+
                                                    '<OPTION value=2>访客Wi-Fi设备</OPTION>'+
                                                    '<OPTION value=3>黑名单</OPTION>'+
                                                    '<OPTION value=4>白名单</OPTION>'+
                                                    '</SELECT>'+
                                            '</TD>'+
                                            '<td class="tdWidth2" style="width: 147px!important;">上/下行速度</TD>'+
                                            '<td class="tdWidth2" style="width: 186px!important;">IP/MAC地址</TD>'+
                                            '<td id="dataTime" class="tdWidth2" style="width: 124px!important;">在线时长</TD>'+
                                            '<td class="tdWidth2" style="width: 136px!important;">允许上网</TD>'+
                                        '</tr>'+
                                    '</thead>'+
                                '</table>';
                        switch (selIndex) {
                            //在线设备
                            case 0:
                                var value1 = '<% tcWebApi_JsonHook("get_online_lanhost_info", "action", "area") %>'
                                var rsp1 = JSON.parse(value1);
                                var list1 = rsp1.data;

                                setTimeout(function() {
                                    $.ajax({  
                                        type: "GET",   //提交的方法
                                        url: "/cgi-bin/terminalTimer.asp", //提交的地址  
                                        async: true,
                                        dataType: 'text',
                                        success: function(data) {
                                            if(data.indexOf("value") != -1) {
                                                var indexStart = data.indexOf("<script>"),
                                                    indexEnd = data.indexOf("<\/script>");
                                                data = data.substring(indexStart + 8, indexEnd);
                                                eval(data);
                                                var list2 = JSON.parse(value).data;
                                                if(list1 && list2) 
                                                    DeviceInfoInit(list1, list2);
                                                else innerData.innerHTML = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList online">'+
                                                    '<thead>'+
                                                        '<tr class="trStyle2">'+
                                                            '<TD class="tdWidth2" style="width: 153px!important;font-weight: normal;">'+
                                                                '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">'+
                                                                    '<OPTION value=0 selected>在线设备</OPTION>'+
                                                                    '<OPTION value=1>离线设备</OPTION>'+
                                                                    '<OPTION value=2>访客Wi-Fi设备</OPTION>'+
                                                                    '<OPTION value=3>黑名单</OPTION>'+
                                                                    '<OPTION value=4>白名单</OPTION>'+
                                                                    '</SELECT>'+
                                                                '</TD>'+
                                                            '<td class="tdWidth2" style="width: 123px!important;">上/下行速度</TD>'+
                                                            '<td class="tdWidth2" style="width: 152px!important;">IP/MAC地址</TD>'+
                                                            '<td id="dataTime" class="tdWidth2" style="width: 121px!important;">在线时长</TD>'+
                                                            '<td class="tdWidth2" style="width: 95px!important;">允许上网</TD>'+
                                                            '<td class="tdWidth2" style="width: 177px!important;">网络限速</TD>'+
                                                            '</tr>'+
                                                        '</thead>'+
                                                '</table>';
                                            }
                                        },
                                        error: function(error) {
                                            console.log(error);
                                        }
                                    });
                                }, 100);

                                setTimeout(function() {
                                    $.ajax({  
                                        type: "GET",   //提交的方法
                                        url: "/cgi-bin/terminalTimer.asp", //提交的地址  
                                        async: true,
                                        dataType: 'text',
                                        success: function(data) {
                                            if(data.indexOf("value") != -1) {
                                                var indexStart = data.indexOf("<script>"),
                                                    indexEnd = data.indexOf("<\/script>");
                                                data = data.substring(indexStart + 8, indexEnd);
                                                eval(data);
                                                var list3 = JSON.parse(value).data;
                                                if(list1 && list3) 
                                                    DeviceInfoInit(list1, list3);
                                                else innerData.innerHTML = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList online">'+
                                                    '<thead>'+
                                                        '<tr class="trStyle2">'+
                                                            '<TD class="tdWidth2" style="width: 153px!important;font-weight: normal;">'+
                                                                '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">'+
                                                                    '<OPTION value=0 selected>在线设备</OPTION>'+
                                                                    '<OPTION value=1>离线设备</OPTION>'+
                                                                    '<OPTION value=2>访客Wi-Fi设备</OPTION>'+
                                                                    '<OPTION value=3>黑名单</OPTION>'+
                                                                    '<OPTION value=4>白名单</OPTION>'+
                                                                    '</SELECT>'+
                                                                '</TD>'+
                                                            '<td class="tdWidth2" style="width: 123px!important;">上/下行速度</TD>'+
                                                            '<td class="tdWidth2" style="width: 152px!important;">IP/MAC地址</TD>'+
                                                            '<td id="dataTime" class="tdWidth2" style="width: 121px!important;">在线时长</TD>'+
                                                            '<td class="tdWidth2" style="width: 95px!important;">允许上网</TD>'+
                                                            '<td class="tdWidth2" style="width: 177px!important;">网络限速</TD>'+
                                                            '</tr>'+
                                                        '</thead>'+
                                                '</table>';
                                            }
                                        },
                                        error: function(error) {
                                            console.log(error);
                                        }
                                    });
                                }, 300);
                                break;
                            // 离线设备
                            case 1:
                                var value = '<% tcWebApi_JsonHook("get_offline_lanhost_info", "action", "area") %>';
                                var rsp = JSON.parse(value);
                                var list = rsp.data;
                                // if(list) 
                                    DeviceInfoInit_2(selIndex, list);
                                // else innerData.innerHTML = htmlstr;
                                break;
                            // 访客Wi-Fi设备
                            case 2:
                                var value = '<% tcWebApi_JsonHook("get_guest_lanhost_info", "action", "area") %>';
                                var rsp = JSON.parse(value);
                                var list = rsp.data;
                                // var list = [];
                                if(list) 
                                    DeviceInfoInit_2(selIndex, list);
                                else innerData.innerHTML = htmlstr;
                                break;
                            // 黑名单
                            case 3:
                                var mac_enable = '<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s")%>';
                                var filter_type = '<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s")%>';
                                if(mac_enable && filter_type == "Black") {
                                    var value = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>';
                                    var rsp = JSON.parse(value);
                                    var list = rsp.data;
                                    DeviceInfoInit_BW(selIndex, list);
                                }
                                else {
                                    var list = [];
                                    DeviceInfoInit_BW(selIndex, list);
                                }
                                break;
                            // 白名单
                            case 4:
                                var mac_enable = '<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s")%>';
                                var filter_type = '<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s")%>';
                                if(mac_enable && filter_type == "White") {
                                    var value = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>';
                                    var rsp = JSON.parse(value);
                                    var list = rsp.data;
                                    DeviceInfoInit_BW(selIndex, list);
                                }
                                else {
                                    var list = [];
                                    DeviceInfoInit_BW(selIndex, list);
                                }
                                break;
                        }
                    }

                    // 在线设备数据显示
                    function DeviceInfoInit(list1, list2)
                    {
                        getElById("innerData").style.border = "1px solid rgba(202, 208, 209, 0.5)";
                        var htmlStr = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList online">' +
                            '<thead>' +
                                '<tr class="trStyle2">' +
                                '<TD class="tdWidth2" style="width: 153px!important;font-weight: normal;">' +
                                    '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">' +
                                        '<OPTION value=0 selected>在线设备</OPTION>' +
                                        '<OPTION value=1>离线设备</OPTION>' +
                                        '<OPTION value=2>访客Wi-Fi设备</OPTION>' +
                                        '<OPTION value=3>黑名单</OPTION>' +
                                        '<OPTION value=4>白名单</OPTION>' +
                                    '</SELECT>' +
                                '</TD>' +
                                '<td class="tdWidth2" style="width: 123px!important;">上/下行速度</TD>' +
                                '<td class="tdWidth2" style="width: 152px!important;">IP/MAC地址</TD>' +
                                '<td id="dataTime" class="tdWidth2" style="width: 121px!important;">在线时长</TD>' +
                                '<td class="tdWidth2" style="width: 95px!important;">允许上网</TD>' +
                                '<td class="tdWidth2" style="width: 177px!important;">网络限速</TD>' +
                                '</tr>' +
                            '</thead><tbody>';
                        for ( var i = 0; i < list1.length; i++ )
                        {
                            var conntype = get_connect_type(list1[i]);
                            
                            htmlStr += '<tr class="trStyle3">';
                            htmlStr += '<td class="tdWidth3">' + '<div class="trName"><div class="btn_icon" style="cursor: auto;">' + conntype + '</div>' + '<span class="device-name">' + (list1[i].HostName ? list1[i].HostName : "anonymous") + '</span>' + '<div class="img-edit" style="cursor: pointer;" onclick="change_device_name(\'' + list1[i].Index + '\',\'' +  list1[i].HostName + '\')"></div></div>' + '</td>';
                            var time = parseInt(list2[i].Uptime) - parseInt(list1[i].Uptime);
                            if(time) {
                                rxrate = ((parseInt(list2[i].RxBytes) - parseInt(list1[i].RxBytes)) / time),
                                txrate = ((parseInt(list2[i].TxBytes) - parseInt(list1[i].TxBytes)) / time);
                                rxrate = rxrate ? rxrate.toFixed(1) : rxrate;
                                txrate = txrate ? txrate.toFixed(1) : txrate;
                            }
                            else {
                                rxrate = "0 kbps";
                                txrate = "0 kbps";
                            }
                            onlineList[i] = {};
                            onlineList[i].rxrate = rxrate;
                            onlineList[i].txrate = txrate;
                            htmlStr += "<td class=\"tdWidth3\" style=\"line-height: 19px;font-size: 13px;text-align: left!important;padding-left: 23px;\"><div style=\"margin-bottom: 12px;\"><img src=\"../img/icon_upload.png\"><span class=\"font-blue\">" + (time == 0 ? txrate : rateUnit(txrate)) + "</span></div><div><img src=\"../img/icon_download.png\"><span class=\"font-blue\">" + (time == 0 ? rxrate : rateUnit(rxrate)) + "</span></div></td>";
                            if(list1[i].IP)
                            {
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>' + list1[i].IP + '</div>' + '<div>' + list1[i].MAC + '</div>' + '</td>';
                            }
                            else {
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>--</div>' + '<div>' + list1[i].MAC + '</div>' + '</td>';
                            }
                            
                            htmlStr += '<td class="tdWidth3" style="line-height: 23px;">' + formatSeconds3(list1[i].OnlineTime) + '</td>';
                            if(device_ip == list1[i].IP) {
                                htmlStr += '<td class="tdWidth3 allow"><div class="self">（自己）</div></td>';
                            }
                            else {
                                if(list1[i].InternetAccess == 1 || list1[i].InternetAccess == "") {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=1 checked onclick="change_device_access(\'' + list1[i].Index + '\',\'' +  1 + '\')"></td>';
                                }
                                else if (list1[i].InternetAccess == 0) {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=0 onclick="change_device_access(\'' + list1[i].Index + '\',\'' +  0 + '\')"></td>';
                                }
                            }                           
                            htmlStr += "<td><div class=\"trLimit\" id=\"trlimit" + i + "\"><div class=\"limit-text\"><div style=\"margin-top: 15px;width: 100%;\"><div style=\"display: inline-block;width: 24px;height: 24px;line-height: 24px;\"><img src=\"../img/icon_upload.png\" alt=\"\"></div><span class=\"font-limit\" id=\"rx" + doDelColon(list1[i].MAC) + "\">不限速</span></div><div style=\"margin-bottom: 15px;width: 100%;\"><div style=\"display: inline-block;width: 24px;height: 24px;line-height: 24px;\"><img src=\"../img/icon_download.png\" alt=\"\"></div><span class=\"font-limit\" id=\"tx" + doDelColon(list1[i].MAC) + "\">不限速</span></div></div><div class=\"img-edit limit-button\" style=\"cursor: pointer;margin-left: 2px;\"data-flag=\"0\" onclick=\"change_device_limit('trlimit" + i + "', " + i + ", '" + list1[i].MAC + "')\"></div></div>\n</td>";
                            htmlStr += '</tr>';
                        }
                        htmlStr += '</tbody></table>';
                        innerData.innerHTML = htmlStr;
                        scmSelect.init($('body'));
                        scmCheckbox.init($('body'));
                        appSpeedLimitInfoLoad();
                    }

                    // 离线/访客设备数据显示
                    function DeviceInfoInit_2(selIndex, list)
                    {
                        var htmlStr = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList">'+
                                '<thead>'+
                                    '<tr class="trStyle2">'+
                                        '<TD class="tdWidth2" style="width: 228px!important;font-weight: normal;">'+
                                            '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">'+
                                                '<OPTION value=0>在线设备</OPTION>'+
                                                '<OPTION value=1 ' + (selIndex == 1 ? 'selected' : '') + '>离线设备</OPTION>'+
                                                '<OPTION value=2 ' + (selIndex == 2 ? 'selected' : '') + '>访客Wi-Fi设备</OPTION>'+
                                                '<OPTION value=3>黑名单</OPTION>'+
                                                '<OPTION value=4>白名单</OPTION>'+
                                            '</SELECT>'+
                                        '</TD>'+
                                        '<td class="tdWidth2" style="width: 147px!important;">上/下行速度</TD>'+
                                        '<td class="tdWidth2" style="width: 186px!important;">IP/MAC地址</TD>'+
                                        '<td id="dataTime" class="tdWidth2" style="width: 124px!important;">在线时长</TD>'+
                                        '<td class="tdWidth2" style="width: 136px!important;">允许上网</TD>'+
                                        '</tr></thead><tbody>';
                        for ( var i = 0; i < list.length; i++ )
                        {
                            var conntype = get_connect_type(list[i]);

                            htmlStr += '<tr class="trStyle3">';
                            htmlStr += '<td class="tdWidth3">' + '<div class="trName"><div class="btn_icon" style="cursor: auto;">' + conntype + '</div>' + '<span class="device-name">' + (list[i].HostName ? list[i].HostName : "anonymous") + '</span>' + '<div class="img-edit" style="cursor: pointer;"  onclick="change_device_name(\'' + list[i].Index + '\',\''  + list[i].HostName + '\')"></div></div>' + '</td>';
                            htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;text-align: left!important;padding-left: 23px;">' + '<div style="margin-bottom: 12px;"><img src="../img/icon_upload.png">' + '<span class="font-blue">' + rateUnit(list[i].TxBytes) + '</span>' + '</div>' + '<div><img src="../img/icon_download.png">' + '<span class="font-blue">' + rateUnit(list[i].RxBytes) + '</span>' + '</div>' +  '</td>';
                            if(list[i].IP)
                            {
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>' + list[i].IP + '</div>' + '<div>' + list[i].MAC + '</div>' + '</td>';
                            }
                            else {
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>--</div>' + '<div>' + list[i].MAC + '</div>' + '</td>';
                            }
                            htmlStr += '<td class="tdWidth3" style="line-height: 23px;">' + formatSeconds3(list[i].OnlineTime) + '</td>';
                            if(list[i].InternetAccess == 1 || list[i].InternetAccess == "") {
                                htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=1 checked onclick="change_device_access(\'' + list[i].Index + '\',\'' +  1 + '\')"></td>';
                            }
                            else if (list[i].InternetAccess == 0) {
                                htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=0 onclick="change_device_access(\'' + list[i].Index + '\',\'' +  0 + '\')"></td>';
                            }
                            htmlStr += '</tr>';
                        }
                        htmlStr += '</tbody></table>';
                        innerData.innerHTML = htmlStr;
                        scmSelect.init($('body'));
                        scmCheckbox.init($('body'));
                    }

                    // 黑/白设备数据显示
                    function DeviceInfoInit_BW(selIndex, list)
                    {
                        var htmlStr = '<table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList">'+
                                '<thead>'+
                                    '<tr class="trStyle2">'+
                                        '<TD class="tdWidth2" style="width: 228px!important;font-weight: normal;">'+
                                            '<SELECT id="modeIndex" onchange="modeChange()" size=1 name="modeIndex">'+
                                                '<OPTION value=0>在线设备</OPTION>'+
                                                '<OPTION value=1>离线设备</OPTION>'+
                                                '<OPTION value=2>访客Wi-Fi设备</OPTION>'+
                                                '<OPTION value=3 ' + (selIndex == 3 ? 'selected' : '') + '>黑名单</OPTION>'+
                                                '<OPTION value=4 ' + (selIndex == 4 ? 'selected' : '') + '>白名单</OPTION>'+
                                            '</SELECT>'+
                                        '</TD>'+
                                        '<td class="tdWidth2" style="width: 147px!important;">上/下行速度</TD>'+
                                        '<td class="tdWidth2" style="width: 186px!important;">IP/MAC地址</TD>'+
                                        '<td id="dataTime" class="tdWidth2" style="width: 124px!important;">在线时长</TD>'+
                                        '<td class="tdWidth2" style="width: 136px!important;">允许上网</TD>'+
                                        '</tr></thead><tbody>';
                        for ( var i = 0; i < list.length; i++ )
                        {
                            if(CheckDeviceIn(list[i]["MacAddr"])) {
                                htmlStr += '<tr class="trStyle3">';
                                htmlStr += '<td class="tdWidth3">' + '<div class="trName"><div class="btn_icon" style="cursor: auto;">' + connectType + '</div>' + '<span class="device-name">' + HostName + '</span>' + '<div class="img-edit" style="cursor: pointer;"  onclick="change_device_name(\'' + Index + '\',\''  + HostName + '\')"></div></div>' + '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;text-align: left!important;padding-left: 23px;">' + '<div style="margin-bottom: 12px;"><img src="../img/icon_upload.png">' + '<span class="font-blue">' + txRate + '</span>' + '</div>' + '<div><img src="../img/icon_download.png">' + '<span class="font-blue">' + rxRate + '</span>' + '</div>' +  '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>--</div>' + '<div>' + list[i].MacAddr + '</div>' + '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 23px;">' + OnlineTime + '</td>';
                                if(interAccess == 1 || interAccess == "") {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=1 checked onclick="change_device_access(\'' + Index + '\',\'' +  1 + '\')"></td>';
                                }
                                else if (interAccess == 0) {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=0 onclick="change_device_access(\'' + Index + '\',\'' +  0 + '\')"></td>';
                                }
                            }
                            else {
                                htmlStr += '<tr class="trStyle3">';
                                htmlStr += '<td class="tdWidth3">' + '<div class="trName">' + '<span class="device-name">--</span>' + '</div>' + '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;">' + '<div>--</div>' + '<div>' + list[i].MacAddr + '</div>' + '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 19px;font-size: 13px;text-align: left!important;padding-left: 23px;">' + '<div style="margin-bottom: 12px;"><img src="../img/icon_upload.png">' + '<span class="font-blue">0 kbps</span>' + '</div>' + '<div><img src="../img/icon_download.png">' + '<span class="font-blue">0 kbps</span>' + '</div>' +  '</td>';
                                htmlStr += '<td class="tdWidth3" style="line-height: 23px;">--</td>';
                                if(list[i].InternetAccess == 1 || list[i].InternetAccess == "") {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=1 checked onclick="change_device_access(\'' + list[i].Index + '\',\'' +  1 + '\')"></td>';
                                }
                                else if (list[i].InternetAccess == 0) {
                                    htmlStr += '<td class="tdWidth3 allow"><INPUT class="input-onoff" type=checkbox value=0 onclick="change_device_access(\'' + list[i].Index + '\',\'' +  0 + '\')"></td>';
                                }
                            }
                            
                            htmlStr += '</tr>';
                        }
                        htmlStr += '</tbody></table>';
                        innerData.innerHTML = htmlStr;
                        scmSelect.init($('body'));
                        scmCheckbox.init($('body'));
                    }

                    function change_device_limit(trlimit, i, mac) {
                        var macStr = doDelColon(mac);
                        $('#' + trlimit).html('<div class="limit-text"><div style="margin-top: 10px;width: 100%;"><div style="display: inline-block;width: 24px;height: 24px;line-height: 24px;"><img src="../img/icon_upload.png" alt=""></div><input type="text" class="input-txt" id="up_' + macStr + '" name="up_' + macStr + '"><span style="color: rgb(77, 80, 79); font-size: 10px;"> kbps</span></div><div style="width: 100%;"><div style="display: inline-block;width: 24px;height: 24px;line-height: 24px;"><img src="../img/icon_download.png" alt=""></div><input type="text" class="input-txt" id="down_' + macStr + '" name="down_' + macStr + '"><span style="color: rgb(77, 80, 79); font-size: 10px;"> kbps</span></div><div style="width: 160px; text-align: center; letter-spacing: 0.64px; line-height: 16px; transform: scale(0.75);"><div>[100-102400]</div><div>0和空表示不限速</div></div></div>');
                        appSpeedLimitInfoUpdate(i, mac);

                        setTimeout(function() {
                            document.body.onclick = function (e) {
                                var current = document.querySelectorAll(".trStyle3")[i];
                                current = current.querySelector(".trLimit");
                                if (!current.contains(e.target)) {
                                    save_device_limit(i, mac);
                                }
                            };
                        }, 500);
                    }

                    function appSpeedLimitInfoLoad()
                    {
                        var rsp = JSON.parse(maxbandwidthInfo);
                        var maxbandwidthList = rsp.data;
                        var maxbandwidthListLen = maxbandwidthList.length;
                        
                        if ( maxbandwidthListLen )
                        {
                            for ( var i = 0; i < dhcpNum; i++ )
                            {
                                for ( var j = 0; j < maxbandwidthListLen; j++ )
                                {
                                    if ( maxbandwidthList[j]['Mac'] == doDelColon(portMac[i]) )
                                    {
                                        var mac = maxbandwidthList[j]['Mac'];
                                        if(maxbandwidthList[j]['upRate'] == 0) {
                                            $("#rx"+mac).text("不限速");
                                        }
                                        else {
                                            $("#rx"+mac).text(maxbandwidthList[j]['upRate'] + " kbps");
                                        }
                                        if(maxbandwidthList[j]['downRate'] == 0) {
                                            $("#tx"+mac).text("不限速");
                                        }
                                        else {
                                            $("#tx"+mac).text(maxbandwidthList[j]['downRate'] + " kbps");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    function appSpeedLimitInfoUpdate(index, mac)
                    {
                        var rsp = JSON.parse(maxbandwidthInfo);
                        var maxbandwidthList = rsp.data;
                        var maxbandwidthListLen = maxbandwidthList.length;
                        
                        if ( maxbandwidthListLen )
                        {
                            for ( var i = 0; i < dhcpNum; i++ )
                            {
                                for ( var j = 0; j < maxbandwidthListLen; j++ )
                                {
                                    if ( maxbandwidthList[j]['Mac'] == doDelColon(mac) )
                                    {
                                        var mac = doDelColon(maxbandwidthList[j]['Mac']);
                                        setText("up_"+mac, maxbandwidthList[j]['upRate']);
                                        setText("down_"+mac, maxbandwidthList[j]['downRate']);
                                    }	
                                }
                            }
                        }
                    }

                    function doCheckIsNumber(digit)
                    {
                        var reg = /^[1-9]\d*$|^0$/;
                        return reg.test(digit);
                    }

                    function doDelSpaces(str)
                    {
                        return str.replace(/^\s*|\s*$/g, "");
                    }

                    function doDelColon(str)
                    {
                        var new_str = "";
                        var c = doDelSpaces(str).split(':');
                        var len = c.length;
                        
                        for ( var i = 0; i < len; i++ )
                        {
                            new_str += c[i]; 
                        }

                        return new_str;
                    }

                    function checkUpDownRate(mac) {
                        mac = doDelColon(mac);
                        var uprate = doDelSpaces(getValue("up_" + mac));
                        var downrate = doDelSpaces(getValue("down_" + mac));

                        if ("" == uprate) {
                            setText("up_" + mac, 0);
                            uprate = 0;
                        }

                        if ("" == downrate) {
                            setText("down_" + mac, 0);
                            downrate = 0;
                        }

                        if (!doCheckIsNumber(uprate) || !doCheckIsNumber(downrate)) {
                            alert("限速值非法");
                            return false;
                        }

                        if (parseInt(uprate) > 102400 || parseInt(downrate) > 102400) {
                            alert("限速值不能超过102400");
                            return false;
                        }

                        return true;
                    }

                    function appSpeedLimitInfoSubmit(i, mac)
                    {
                        var speedlimitList = "",
                            macStr = doDelColon(mac);
                        speedlimitList += i + " " + doDelColon(mac) + " " 
                                                            + doDelSpaces(getValue("up_"+macStr)) + " " 
                                                            + doDelSpaces(getValue("down_"+macStr)) + ";";
                        setText("speedlimitlist", speedlimitList);
                    }

                    function save_device_limit(i, mac)
                    {
                        if ( checkUpDownRate(mac) )
                        {
                            appSpeedLimitInfoSubmit(i, mac);
                            setText("speedlimitflag", 1);
                            getElById("ConfigForm").submit();
                        }
                    }
                </script>
				<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
					<TBODY>
						<TR>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
							<TD id=MenuArea_L2 style="display: none;">
								<ul class="TRD">
								<li class="TSD">设备信息</li>
								</ul>
							</TD>
<% else %>
							<TD id=MenuArea_L2>
								<ul class="TRD">
								<li class="TSD">终端管理</li>
								</ul>
							</TD>
<% end if %>
							
							<SCRIPT language=javascript>
								MakeMenu(getElById ('Selected_Menu').value);
							</SCRIPT>			
							<TD valign="top">
								<form name="ConfigForm" action="/cgi-bin/terminal_page.asp" method="post">
                                    <input type="hidden" id="speedlimitflag" name="speedlimitflag" value="0"/>
                                    <input type="hidden" id="speedlimitlist" name="speedlimitlist" value="0"/>

                                    <input type="hidden" name="NameIndex" value="0"/>
                                    <input type="hidden" name="Hostname" value=""/>
                                    <input type="hidden" name="internetAccess" value=""/>

                                    <input type="hidden" name="Save_Flag" value="0">
                                    <input type="hidden" name="SourceMACAddress" value="">
                                    <input type="hidden" name="EnMacFilter_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s")%> ">
                                    <input type="hidden" name="EnableMac_Flag" value="Yes">
                                    <input type="hidden" name="ListType_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>">
                                    <input type="hidden" name="curNum" value="<% tcWebApi_get("IpMacFilter","add_macnum","s") %>">
                                    <input type="hidden" name="RuleType_Flag" value="MAC">
                                    <input type="hidden" name="Direction_Flag" value="Incoming">
                                    <input type="hidden" name="IpMacType_Flag" value="Mac">
                                    <input type="hidden" name="Actionflag" value="Add">
                                    <input type="hidden" name="Interface_Flag" value="br0"></input>
                                    <div style="width: 823px;margin: 23px auto 25px;">
                                        <div class="table-outer" id="innerData"></div>
                                        <script language=Javascript type=text/javascript>
                                            var value1 = '<% tcWebApi_JsonHook("get_online_lanhost_info", "action", "area") %>';
                                            var rsp1 = JSON.parse(value1);
                                            var list1 = rsp1.data;

                                            setTimeout(function() {
                                                $.ajax({  
                                                    type: "GET",   //提交的方法
                                                    url: "/cgi-bin/terminalTimer.asp", //提交的地址  
                                                    async: true,
                                                    dataType: 'text',
                                                    success: function(data) {
                                                        if(data.indexOf("value") != -1) {
                                                            var indexStart = data.indexOf("<script>"),
                                                                indexEnd = data.indexOf("<\/script>");
                                                            data = data.substring(indexStart + 8, indexEnd);
                                                            eval(data);
                                                            var list2 = JSON.parse(value).data;
                                                            if(list1 && list2) 
                                                                DeviceInfoInit(list1, list2);
                                                        }
                                                    },
                                                    error: function(error) {
                                                        console.log(error);
                                                    }
                                                });
                                            }, 100);

                                            setTimeout(function() {
                                                $.ajax({  
                                                    type: "GET",   //提交的方法
                                                    url: "/cgi-bin/terminalTimer.asp", //提交的地址  
                                                    async: true,
                                                    dataType: 'text',
                                                    success: function(data) {
                                                        if(data.indexOf("value") != -1) {
                                                            var indexStart = data.indexOf("<script>"),
                                                                indexEnd = data.indexOf("<\/script>");
                                                            data = data.substring(indexStart + 8, indexEnd);
                                                            eval(data);
                                                            var list3 = JSON.parse(value).data;
                                                            if(list1 && list3) 
                                                                DeviceInfoInit(list1, list3);
                                                        }
                                                    },
                                                    error: function(error) {
                                                        console.log(error);
                                                    }
                                                });
                                            }, 300);
                                        </script>

                                        <!-- 分页器 -->
                                        <div class="pageContainer" style="display: none;">
                                            <ul class="page clearfix">
                                                <li><img src="../img/icon_right.png" alt=""></li>
                                                <li class="active">1</li>
                                                <li>2</li>
                                                <li><img src="../img/icon_left.png" alt=""></li>
                                            </ul>
                                        </div>
                                    </div>
                                 </form>
							</TD>
						</TR>
					</TBODY>
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