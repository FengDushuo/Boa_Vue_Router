<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if

if Request_Form("Wan_Flag") = "2" then
	 TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
	 TCWebApi_commit("WanInfo_Common")
end if

tcWebApi_get("WanInfo_WanIF", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "wanif_read", "1")

tcWebApi_get("WanInfo_WanPVC", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "wanpvc_read", "1")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>上网设置</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
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
    <style>
        .tblMain table td {
            width: 15%;
        }
        input[type="button"][name^="btnCancel"].btn-more {
            width: 69px;
            height: 28px;
            min-width: 69px;
            line-height: 15px;
        }
        #scan_list .tdWidth3{
            vertical-align: bottom;
        }
        #btnReSet0 {
            width: 66px;
            height: 21px;
            font-size: 13px;
            font-family: MicrosoftYaHei;
            color: #2E7BFF;
            line-height: 21px;
            background: none;
            text-decoration: underline;
            letter-spacing: 1px;
        }
        .helpDesc li {
            list-style: none;
        }
        #same input[type="button"].input-onoff.button-on, #same .input-checkbox.input-onoff.checkbox-on {
            float: right;
            margin-right: 48px;
            top: -21px;
            background-size: 50% !important;
            background: url(../img/checkbox-checked.png) center no-repeat;
        }
        #same input[type="button"].input-onoff, #same input[type="button"].input-onoff.button-off, #same .input-checkbox.input-onoff {
            float: right;
            margin-right: 48px;
            top: -21px;
            background-size: 50% !important;
            background: url(../img/checkbox-unchecked.png) center no-repeat;
        }

        /* 原生滚动条样式修改 */
        ::-webkit-scrollbar {
            width: 4px;
        }
        /* 滚动槽 */
        ::-webkit-scrollbar-track {
            background-color: transparent;
            margin: 8px 0;
        }
        /* 滚动条滑块 */
        ::-webkit-scrollbar-thumb {
            background: #dbe2e1;
            border-radius: 4px;
        }
    </style>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
    </HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);Internet_Mode_Select();FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
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
	<FORM name=RebootForm action="/cgi-bin/wan_page.asp" method="post">
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
		<input id="Selected_Menu" type="hidden" value="上网设置" name="Selected_Menu">
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
                        <SCRIPT language=javascript>
                            MakeMenu(getElById ('Selected_Menu').value);
                        </SCRIPT>
					</TBODY>
				</TABLE>
			</TD>
		</TR>  
		<TR>
			<TD class="content" style="height: 528px;">	
<% end if %>
    <SCRIPT language=JavaScript type=text/javascript>
                    var wanIndex = "<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>";
                    var scan_type = 0;
                    var statusValue = '<% tcWebApi_JsonHook("get_homepage_basic_info", "action", "area") %>';
                    var Obj = JSON.parse(statusValue).data[0];
                    var current_mode = "<% tcWebApi_get("APWanInfo_Common","FixedAPMode","s") %>";

                    var timerStatus = null;
                    function get_wan_status() {
                        var page_title = $(".page-title");
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
                                    Obj = JSON.parse(value).data[0];
                                    if(Obj.Connect_status == '3') {
                                        page_title.html('<img src="../img/icon_success.png"><span>已成功连接到互联网。</span>');
                                    }
                                    else {
                                        page_title.html('<img src="../img/icon_gth_s.png"><span>路由器未连接互联网。</span>');
                                    }
                                }
                            },
                            error: function(error) {
                                console.log(error);
                            }
                        });
                    }

                    <%if TCWebApi_get("WebCustom_Entry","isIPTVPortBindSupported","h" ) = "Yes" then%>
                        var iptvinfo  = '<% tcWebApi_JsonHook("get_ap_iptv_info", "", "") %>'
                        var iptvvlanid = '<% tcWebApi_get("APWanInfo_IPTVInfo","VLANID","s") %>';	
                    <% end if %>	
                        var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
                        // num 0
                        var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
                        var vEntryName = vArrayStr.split(','); 
                        vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
                        var vEntryIndex = vArrayStr.split(',');
                        var vCurrentDHCPv6 = "<% tcWebApi_get("WanInfo_WanIF","DHCPv6","s") %>";
                        var vBindStatus = "<% tcWebApi_get("WanInfo_Common","BindStatus","s") %>";
                        var ppp_flag = 2;
                        var manual_flag = 2;
                        var vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>";
                        if(vcurConnect == "Connect_Keep_Alive")
                            ppp_flag = 0;
                        else if(vcurConnect == "Connect_Manually")
                            ppp_flag = 1;	
                        vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>";
                        if(vcurConnect == "connect")
                            manual_flag = 0;
                        else if((vcurConnect == "disconnect"))
                            manual_flag = 1;
                        <% tcWebApi_constSet("WanInfo_Common", "CycleJump", "19") %>
                        // num 20
                        var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
                        var IFIdxArray = CycleV.split(',');
                    
                        <% tcWebApi_constSet("WanInfo_Common", "CycleJump", "5") %>
                        // num 26
                        var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
                        var PPPBiArray = CycleV.split(',');
                    
                        var IFIdxStore = "<% tcWebApi_get("Wan_Common","LatestIFIdx","s") %>"                      
                        
                        function isPPPproxybiOn()
                        {
                    <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                            if ( 'none' != getElement('ppp_proxy_bi').style.display )
                            {
                                if ( 0 != getRadioVal("ppp_proxy_bi_mode") )
                                    return 1;
                            }
                    <%else%>
                            if ( 'none' != getElement('ppp_bi').style.display )
                            {
                                if ( getCheckVal('cb_enable_pppbi') == '1' )
                                    return 1;
                            }
                    <%end if%>
                            return 0;
                        }
                        function checkDupPPPBi()
                        {
                            var curIdx = "<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>";
                            var i = 0;
                            
                            if ( 1 == isPPPproxybiOn() )
                            {
                                for( i = 0; i < nEntryNum; i++ )
                                {
                                    if ( curIdx == vEntryIndex[i] )
                                        continue;
                                        
                                    if ( 
                    <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                                        '0' != PPPBiArray[i] 
                    <%else%>
                                        'Yes' == PPPBiArray[i]
                    <%end if%>
                                        )
                                        return 1;
                                }
                            }
                    
                            return 0;
                        }
                        
                        function getMaxIFIdx()
                        {
                            var IFIdxLen = IFIdxArray.length;
                            var IFIdxStoreV = 0;
                            var i = 0;
                            var IFIdxV = 0;
                            
                            if ( isPlusInteger(IFIdxStore) )
                                IFIdxStoreV = parseInt(IFIdxStore);
                            
                            IFIdxStoreV ++;
                            
                            for ( i = IFIdxStoreV; i <= 99; i ++ )
                            {
                                if (!isIdExist(i))
                                    return i;
                            }
                            
                            for ( i = 1; i < IFIdxStoreV; i ++ )
                            {
                                if (!isIdExist(i))
                                    return i;
                            }
                    
                            return 1; 
                        }
                        
                        function isIdExist(ifIdx)
                        {
                            var i = 0;
                            var IFIdxV = 0;
                            var IFIdxLen = IFIdxArray.length;
                            
                            for ( i = 0; i < IFIdxLen; i ++ )
                            {
                                IFIdxV = parseInt(IFIdxArray[i]);
                    
                                if ( IFIdxV == ifIdx )
                                    return true;
                            }
                            
                            return false;
                        }
                        
                        function Internet_Mode_Select()
                        {
                            var cur_mode = "<% tcWebApi_get("APWanInfo_Common","FixedAPMode","s") %>";
                            if(cur_mode=="")
                                cur_mode = "<% tcWebApi_get("WanInfo_Common","CurAPMode","s")  %>";
                            switch(cur_mode)
                            {
                            case 'Route':
                                setDisplay("宽带设置_item",1);
                                 setDisplay("中继设置_item",0);
                                 setDisplay("AP设置_item",0);
                                setDisplay("wlan_mode",0);
                                 break;
                            case 'APClient':
                                 setDisplay("宽带设置_item",0);
                                 setDisplay("AP设置_item",0);
                                setDisplay("wlan_mode",1);
                                Wlan_Mode_Select();
                                 break;
                            case 'Bridge':
                                 setDisplay("宽带设置_item",0);
                                 setDisplay("中继设置_item",0);
                                 setDisplay("AP设置_item",1);
                                setDisplay("wlan_mode",0);
                                 break;
                            }	
                        }
                    
                        function Wlan_Mode_Select()
                        {
                            var  cur_mode = "<% tcWebApi_get("apcli_common","currentRadio","s")  %>";
                            switch(cur_mode)
                            {
                                case '0':
                                    setDisplay("中继设置_item",1);
                                    break;
                                case '1':
                                    setDisplay("中继设置_item",0);
                                    break;
                            }
                        }
                    
                    function WanIPConstruction(domain,conName,vlanId,vlanPri,vlanEnable,bindstr,ConnectionType, nat, enblService, wanIpAddress,serviceList,dnsstr,addrType,wanSubnetMask,defaultGateway,DHCPRelay,DhcpCode,xIpv4Enable,xIpv6Enable,xIpv6Status,xIpv6AddrType,xIpv6Addr,xIpv6PrefixLen,xIpv6Gateway,xIpv6Dns)
                    {
                    this.domain = domain;
                    var list = domain.split('.');
                    this.key =     '.' + list[4] + '.I.' + list[6];
                    this.wanConn = 'IPCon';
                    this.wanId = this.domain;
                    this.conName = conName;
                    this.vlanId = vlanId;
                    this.vlanPri = vlanPri;
                    this.vlanEnable = vlanEnable;
                    this.bind = bindstr;
                    this.multMode = 0;
                    this.bindflag = 1;
                    this.ConnectionType = ConnectionType;
                    this.nat = getBoolValue(nat);
                    this.enblService = getBoolValue(enblService);
                    this.wanIpAddress = wanIpAddress;
                    this.serviceList = serviceList;
                    var dns = dnsstr.split(',');
                    this.dnsPrimary = dns[0];
                    this.dnsSecondary = dns[1];
                    this.dns3 = dns[2];
                    this.addrType = addrType;
                    this.wanSubnetMask = wanSubnetMask;
                    this.defaultGateway = defaultGateway;
                    this.atmVpi = '';
                    this.atmVci = '';
                    this.LinkType = '';
                    this.atmServiceCategory = '';
                    this.atmPeakCellRate = '';
                    this.atmSustainedCellRate = '';
                    this.atmMaxBurstSize = '';
                    this.encapMode = '';
                    this.DHCPRelay = DHCPRelay;
                    this.ProxyEnable = '';
                    this.Relating = ' ';
                    this.DhcpCode=DhcpCode;
                    this.xIpv4Enable = xIpv4Enable;
                    this.xIpv6Enable = xIpv6Enable;
                    this.xIpv6Status = xIpv6Status;
                    this.xIpv6AddrType = xIpv6AddrType;
                    this.xIpv6Addr = xIpv6Addr;
                    this.xIpv6PrefixLen = xIpv6PrefixLen;
                    if (this.xIpv6PrefixLen == '0')
                    {
                    this.xIpv6PrefixLen = '';
                    }
                    this.xIpv6Gateway = xIpv6Gateway;
                    var Ipv6DnsServer = xIpv6Dns.split(',');
                    this.xIpv6Dns1 = Ipv6DnsServer[0];
                    if (Ipv6DnsServer.length > 1)
                    {
                    this.xIpv6Dns2 = Ipv6DnsServer[1];
                    }
                    else
                    {
                    this.xIpv6Dns2 = '';
                    }
                    }
                    function WanPPPConstruction(domain,conName,vlanId,vlanPri,vlanEnable,bindstr,ConnectionType, nat,enblService, wanIpAddress,serviceList,dnsstr,RemoteIPAddress,pppUserName, pppPassword,CntTrigger,ProxyEnable,pppIdleTimeout,DHCPRelay, ConnectionStatus,xIpv4Enable,xIpv6Enable,xIpv6Status,xIpv6AddrType,xIpv6Addr,xIpv6PrefixLen,xIpv6Gateway,xIpv6Dns)
                    {
                    this.domain = domain;
                    var list = domain.split('.');
                    this.key = '.' + list[4] + '.P.' + list[6];
                    this.wanConn = 'PPPCon';
                    this.wanId = this.domain;
                    this.conName = conName;
                    this.vlanId = vlanId;
                    this.vlanPri = vlanPri;
                    this.vlanEnable = vlanEnable;
                    this.bind = bindstr;
                    this.multMode = 0;
                    this.bindflag = 1;
                    this.ConnectionType = ConnectionType;
                    this.nat = getBoolValue(nat);
                    this.enblService = getBoolValue(enblService);
                    this.wanIpAddress = wanIpAddress;
                    this.serviceList = serviceList;
                    var dns = dnsstr.split(',');
                    this.dnsPrimary = dns[0];
                    this.dnsSecondary = dns[1];
                    this.dns3 = dns[2];
                    this.defaultGateway = RemoteIPAddress;
                    this.pppUserName = pppUserName;
                    this.pppPassword = pppPassword;
                    this.ProxyEnable = ProxyEnable;
                    this.pppIdleTimeout = pppIdleTimeout;
                    this.atmVpi = '';
                    this.atmVci = '';
                    this.LinkType = '';
                    this.atmServiceCategory = '';
                    this.atmPeakCellRate = '';
                    this.atmSustainedCellRate = '';
                    this.atmMaxBurstSize = '';
                    this.encapMode = '';
                    this.cntMode = CntTrigger;
                    this.Status = ConnectionStatus;
                    this.Relating = ' ';
                    this.DHCPRelay = DHCPRelay;
                    this.xIpv4Enable = xIpv4Enable;
                    this.xIpv6Enable = xIpv6Enable;
                    this.xIpv6Status = xIpv6Status;
                    this.xIpv6AddrType = xIpv6AddrType;
                    this.xIpv6Addr = xIpv6Addr;
                    this.xIpv6PrefixLen = xIpv6PrefixLen;
                    if (this.xIpv6PrefixLen == '0')
                    {
                    this.xIpv6PrefixLen = '';
                    }
                    this.xIpv6Gateway = xIpv6Gateway;
                    var Ipv6DnsServer = xIpv6Dns.split(',');
                    this.xIpv6Dns1 = Ipv6DnsServer[0];
                    if (Ipv6DnsServer.length > 1)
                    {
                    this.xIpv6Dns2 = Ipv6DnsServer[1];
                    }
                    else
                    {
                    this.xIpv6Dns2 = '';
                    }
                    }
                    function trimString(destStr, cTrim)
                    {
                    var i;
                    var j;
                    var retStr = '';
                    for (i = 0; i < destStr.length; i++)
                    {
                    if (destStr.charAt(i) != cTrim)
                    {
                    retStr += destStr.charAt(i);
                    }
                    }
                    return retStr;
                    }
                    function PvcConstruction(domain,atmPvc,atmQoS,atmPeakCellRate,LinkType,atmSustainedCellRate,atmMaxBurstSize,encapMode)
                    {
                    this.domain = domain;
                    var list = domain.split('.');
                    this.key =     '.' + list[4] + '.';
                    var realPvc = trimString(atmPvc, ' ');
                    if(realPvc.charAt(0) == 'P')
                    {
                    realPvc = realPvc.substr(4);
                    }
                    var pvc = realPvc.split('/');
                    this.atmVpi = pvc[0];
                    this.atmVci = pvc[1];
                    this.LinkType = LinkType;    
                    this.atmServiceCategory = atmQoS;
                    this.atmPeakCellRate = atmPeakCellRate;
                    this.atmSustainedCellRate = atmSustainedCellRate;
                    this.atmMaxBurstSize = atmMaxBurstSize;
                    this.encapMode = encapMode;
                    }
                    var pppUsrAccess = '|Subscriber,';
                    var pppUsrAccessArr = pppUsrAccess.split(",");
                    var pppPwdAccess = '|Subscriber,';
                    var pppPwdAccessArr = pppPwdAccess.split(",");
                    var WanPPP = new Array(null);
                    var WanIP = new Array(null);
                    var CntPvc = new Array(new PvcConstruction("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","PVC:0/35","UBR","0","EoA","0","0","LLC"),null);
                    if (WanIP.length > 1)
                    AssociateParam('WanIP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');
                    if (WanPPP.length > 1)
                    AssociateParam('WanPPP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');
                    function ipv6mode(domain, mode)
                    {
                    this.domain = domain;
                    this.mode = mode;
                    }
                    var ipv6enable = new Array(new ipv6mode("InternetGatewayDevice.DeviceInfo.X_CT-COM_IPProtocolVersion","3"),null);
                    var ipv6version = ipv6enable[0].mode;
                    var Wan = Array();
                    for (i = 0; i < WanIP.length-1; i++)
                    {
                    Wan[i] = WanIP[i];
                    }
                    for (j = 0; j < WanPPP.length-1; j++,i++)
                    {
                    Wan[i] = WanPPP[j];
                    }
                    var upRate = parseInt('0');
                    var pcrMax = 5500;
                    if (upRate != 0)
                    pcrMax = Math.floor((upRate * 1000) / (53 * 8));
                    var i = 0;
                    var AddFlag = false;
                    var SelWanIndex = -1;
                    var pvcByUseIndex = -1;
                    var pvcByUseCount = 0;
                    var wanList = '';
                    var changePVCFlag = true;
                    
                    var msg = new Array(6);
                    msg[0] = "操作成功！";
                    msg[1] = "修改失败,一条PVC下只能创建8条Interface！";
                    msg[2] = "修改失败,PVC已满,只能创建8条PVC！";
                    msg[3] = "创建失败,此PVC已经存在8条Interface！";
                    msg[4] = "创建失败,PVC已满,只能创建8条PVC！";
                    msg[5] = "删除错误, Interface不存在！";
                    
                    var oldIpVer;
                    <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
                    var apclissid = new Array(<% tcWebApi_JsonHook("get_apclient_ssid_info", "", "") %>);
                    <% end if %>
                    
                    function LoadFrame()
                    {
                    with (getElById('ConfigForm'))
                    {
                        if (wanIndex != 0)
                            WanIdChange();
                        Wan_Flag.value = "0";
                        var wanStatus = "<% tcWebApi_get("WanInfo_Common","ErrCode","s") %>";
                        if((0 != parseInt(wanStatus)) && (wanStatus != "N/A"))
                        {
                            if(99 == parseInt(wanStatus))
                            {
                                alert(msg[5]);
                                return;
                            }
                            else{
                                alert(msg[parseInt(wanStatus)]);
                                return;
                            }
                            //document.ConfigForm.submit();
                            ajax_submit(20);
                        }
                    
                        oldIpVer = getRadioVal("IpVersion");
                        if ((CurWan.length-1) > 0)
                        {
                            WanModeChange();
                            if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
                            {
                                dhcpv6pdflag.value = "No";
                                setDisplay('secBind',0);
                                setDisplay('secNat',0);
                                clearBindList();
                            }
                            else
                            {
                                var ipVer = getRadioVal("IpVersion");
                    <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                setDisplay('secBind',0);
                    <% else %>
                    <% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %>
                                setDisplay('secBind',0);
                    <% else %>
                                setDisplay('secBind',1);
                    <% end if %>
                    <% end if %>
                                if((wanMode.value == "Bridge") || ("IPv6" == ipVer)) setDisplay('secNat',0);
                                else setDisplay('secNat',1);
                            }
                            if(linkMode.value == "linkPPP")
                                DialMethodChange();
                            VLANModeChg();
                            DOT1PShow();
                            EnableDNSDHCPClick();
                            
                            WanCurrIFIdx.value = getIFIdxvidDomain(getSelectVal('wanId'));
                        }
                        else
                        {
                            IpMode[2].checked = false;
                            onChangeSvrList();
                            ServiceListLoad(0);
                        }
                        var isCYE8SFUSupported="<% tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","s") %>";
                        var wanuilimit="<% tcWebApi_get("WanInfo_Common","NOWANUILIMIT","s") %>";
                        if("Yes" == isCYE8SFUSupported && "1" != wanuilimit){
                          btnAddCnt.style.display="none";
                          btnRemoveCnt.style.display="none";
                        }

                        InternetModeSelect();
                    }
                    
                    <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                    <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
                        LockTR69Node(1);
                    <% end if %>
                    <%else%>		
                    <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
                        setText('wlanssidap', apclissid[0]);
                        setText('wlanACssidap', apclissid[1]);
                    <% end if %>
                        // authModeChange();
                        ACauthModeChange();
                    <% end if %>
                    
                    <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                       if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                       if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                        setDisable('btnRemoveCnt',1);
                        setDisable('btnAddCnt',1);
                        setDisplay('btnOK', 0);
                        setDisplay('btnCancel', 0);
                    <% end if
                    end if
                    end if %>
                    }
                    
                    <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
                    function LockTR69Node(isLock)
                    {
                        var serviceType = '<% tcWebApi_get("WanInfo_WanIF","ServiceList","s") %>';
                        var idx = 0;
                        var frm = document.ConfigForm;
                    
                        if ( 1 == isLock )
                        {
                    <% if tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") = "Yes"  then %>
                            if(getElement('wanId').selectedIndex<3)
                    <%else%>		
                            if ( serviceType.indexOf('TR069') >= 0 )
                    <% end if%>
                            {
                                for ( idx = 0; idx < frm.elements.length; idx ++ )
                                {
                                        if ( 'hidden' == frm.elements[idx].type
                                        || 'btnAddCnt' == frm.elements[idx].id
                    <% if tcwebApi_get("WebCustom_Entry","isCTSFUC9Supported","h") <> "Yes" then %>		
                                        || 'wanId' == frm.elements[idx].id 
                    <% end if %>
                                        )
                                            continue;
                        
                                        frm.elements[idx].disabled = true;			
                                }
                                setDisplay('btnOK', 0);
                                setDisplay('btnCancel', 0);
                            }
                        }
                        else
                        {
                                for ( idx = 0; idx < frm.elements.length; idx ++ )
                                {
                                        if ( 'hidden' == frm.elements[idx].type )
                                            continue;
                        
                                        frm.elements[idx].disabled = false;			
                                }
                                setDisplay('btnOK', 1);
                                setDisplay('btnCancel', 1);
                        }
                    }
                    <% end if %>
                    
                    function IpVersionChange()
                    {
                        with (getElById('ConfigForm'))
                        {
                            var ipVer = getRadioVal("IpVersion");
                            var ConnType = getSelectVal('wanMode');
                            var Serverlist = getSelectVal('serviceList');
                            if (ConnType != 'Route')
                            {
                                setDisplay('divIpVersion', 1);
                                setDisplay('secIPv6Div', 0);
                                return;
                            }
                            setDisplay('divIpVersion', 1);
                            setDisplay('secIPv6Div', 1);
                            if ("IPv4" == ipVer)
                            {
                                if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE" )
                                {
                                    setDisplay('secNat', 0);
                                    nat.value = "Disabled";
                                }
                                else
                                {
                                    setDisplay('secNat', 1);
                                    if ( oldIpVer != ipVer )
                                    {
                                        nat.value = "Enable";
                                        setCheck('cb_nat', 1);
                                    }
                                }
                                if ('linkIP' == getSelectVal('linkMode'))
                                {
                                    // setDisplay('secDhcp', 1);
                                    setDisplay('secStatic', 1);
                                    setDisplay('secPppoeItems', 0);
                                    if (SelWanIndex != -1)
                                    {
                                        if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))
                                        {
                                            IpMode[0].checked = true;
                                        }
                                        else
                                        {
                                            IpMode[1].checked = true;
                                        }
                                    }
                                }
                                else
                                {
                                    setDisplay('secDhcp', 0);
                                    setDisplay('secStatic', 0);
                                    setDisplay('secPppoeItems', 1);
                                }
                                setDisplay('secPppoe', 0);
                                setDisplay('secPppoa', 0);
                                setDisplay('secIpoa', 0);
                                if(IpMode[1].checked && ("linkIP" == getSelectVal('linkMode')))
                                {
                                    setDisplay('secStaticItems', 1);
                                    setDisplay('secDHCPItems', 0);
                                }
                                else
                                {
                                    setDisplay('secStaticItems', 0);
                                    setDisplay('secDHCPItems', 1);
                                }
                                setDisplay('TrIpv6AddrType', 0);
                                setDisplay('TrIpv6Addr', 0);
                                setDisplay('TrIpv6Dns1', 0);
                                setDisplay('TrIpv6Dns2', 0);
                                setDisplay('TrIpv6Gateway', 0);
                                setDisplay('TrIpv6GatewayInfo', 0);
                            }
                            else if ("IPv6" == ipVer)
                            {
                                setDisplay('secNat', 0);
                                nat.value = "Disabled";
                                setDisplay('secDhcp', 0);
                                setDisplay('secStatic', 0);
                                setDisplay('secPppoe', 0);
                                setDisplay('secPppoa', 0);
                                setDisplay('secIpoa', 0);
                                setDisplay('secStaticItems', 0);
                                setDisplay('secDHCPItems', 0);
                                setDisplay('TrIpv6AddrType', 1);
                                var linkstr = getSelectVal('linkMode');
                                if(linkstr == "linkIP")
                                    WriteIPv6List(1);
                                else
                                    WriteIPv6List(0);
                            }
                            else
                            {
                                if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE")
                                {
                                    setDisplay('secNat', 0);
                                    nat.value = "Disabled";
                                }
                                else
                                {
                                    setDisplay('secNat', 1);
                                    if ( oldIpVer != ipVer )
                                    {
                                        nat.value = "Enable";
                                        setCheck('cb_nat', 1);
                                    }
                                }
                                if ('linkIP' == getSelectVal('linkMode'))
                                {
                                    // setDisplay('secDhcp', 1);
                                    setDisplay('secStatic', 1);
                                    setDisplay('secPppoeItems', 0);
                                    if (SelWanIndex != -1)
                                    {
                                        if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))
                                        {
                                            IpMode[0].checked = true;
                                        }
                                        else
                                        {
                                            IpMode[1].checked = true;
                                        }
                                    }
                                }
                                else
                                {
                                    setDisplay('secDhcp', 0);
                                    setDisplay('secStatic', 0);
                                    setDisplay('secPppoeItems', 1);
                                }
                                    setDisplay('secPppoe', 0);
                                    setDisplay('secPppoa', 0);
                                    setDisplay('secIpoa', 0);
                                    if (('linkIP' == getSelectVal('linkMode')) && IpMode[1].checked)
                                    {
                                        setDisplay('secStaticItems', 1);
                                        setDisplay('secDHCPItems', 0);
                                    }
                                    else
                                    {
                                        setDisplay('secStaticItems', 0);
                                        setDisplay('secDHCPItems', 0);
                                    }
                                    setDisplay('TrIpv6AddrType', 1);
                                    if('linkIP' == getSelectVal('linkMode'))
                                    {
                                        if(IpMode[0].checked)
                                        {
                                            WriteIPv6List(0);
                                        }
                                        else if(IpMode[1].checked)
                                            WriteIPv6List(2);
                                        else
                                            WriteIPv6List(0);
                                    }
                                    else
                                        WriteIPv6List(0);
                                }
                                oldIpVer = ipVer;
                                
                                EnableDNSDHCPClick();
                                dsliteShow();
                                pdEnableShow();
                                ppp_dialMethodChg();
                        }
                    }
                    var changeflag = 1;
                    function onChangeSvrList()
                    {
                    with (getElById('ConfigForm'))
                    {
                        if ((serviceList.value == 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
                        {
                            changeflag = 0;
                            secManualDial.style.display = "none";
                            secIdleTime.style.display = "none";
                        }
                        else if((serviceList.value != 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
                        {
                            if(changeflag == 0)
                            {
                                addOption(DialMethod,1,"有流量时自动连接");
                                addOption(DialMethod,'Manual',"手动拨号");
                                changeflag = 1;
                            }
                        }
                        if (serviceList.value == "TR069"   || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
                        {
                            dhcpv6pdflag.value = "No";
                            cb_nat.checked = false;
                            nat.value = "Disabled";
                            setDisplay('secBind',0);
                            setDisplay('secNat',0);
                            clearBindList();
                        }
                        else
                        {
                            dhcpv6pdflag.value = "Yes";
                            cb_nat.checked = true;
                            nat.value = "Enable";
                    <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                            setDisplay('secBind',0);
                    <% else %>
                    <% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %>
                                setDisplay('secBind',0);
                    <% else %>
                            setDisplay('secBind',1);
                    <% end if %>
                    <% end if %>
                            if(wanMode.value == "Bridge")
                            {
                                setDisplay('secNat',0);
                                nat.value = "Disabled";
                            }
                            else
                            {
                                setDisplay('secNat',1);
                            }
                        }
                        if (AddFlag == true)
                        {
                            if ((serviceList.value == "OTHER" || serviceList.value == "IPTV" || serviceList.value == "OTT") && wanMode.value == "Bridge")
                            {
                                cb_dhcprelay.checked = true;
                            }
                            else
                            {
                                cb_dhcprelay.checked = false;
                            }
                        }
                        IpVersionChange();
                        MTUDispChange();
                        MultiVIDDispChange();
                        dsliteShow();
                        pdEnableShow();
                        dhcpEnableShow();
                        pppoeProxyShow();
                        ppp_dialMethodChg();
                    }
                    }
                    function onSelectSvrList()
                    {
                        pdDefaultSel = 1;
                        enabledhcpSel = 1;
                        onChangeSvrList();
                    with (getElById('ConfigForm'))
                    {
                        if ((serviceList.value == "OTHER" || serviceList.value == "IPTV" || serviceList.value == "OTT") && wanMode.value == "Bridge")
                        {
                            cb_dhcprelay.checked = true;
                        }
                        else
                        {
                            cb_dhcprelay.checked = false;
                        }
                    }
                    }
                    function DialMethodChange()
                    {
                    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") <> "Yes"  then %>
                    <% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
                        setDisplay('secIdleTime',0);
                        setDisplay('secManualDial',0);
                    <% else %>
                        var cntMode = getSelectVal('DialMethod');
                        if (cntMode == 'AlwaysOn')
                        {
                            setDisplay('secIdleTime',0);
                            setDisplay('secManualDial',0);
                            setText('ConnectionFlag', "Connect_Keep_Alive");
                        }
                        else if (cntMode == 'Manual')
                        {
                            setDisplay('secIdleTime',0);
                            setDisplay('secManualDial',1);
                            setText('ConnectionFlag', "Connect_Manually");
                            if(0 == ppp_flag){
                                setDisable('pppDialButton',1);
                                setText('pppDialButton', '手动拨号');
                            }
                            else if(1 == ppp_flag){
                                if(0 == manual_flag){
                                    setDisable('pppDialButton',0);
                                    setText('pppDialButton', '断开连接');
                                    setText('pppManualStatus_Flag', 'disconnect');
                                }
                                else{
                                    setDisable('pppDialButton',0);
                                    setText('pppDialButton', '手动拨号');
                                    setText('pppManualStatus_Flag', 'connect');
                                }
                                
                            }
                            else
                            {
                                setDisable('pppDialButton',1);
                                setText('pppDialButton', '手动拨号');
                            }
                        }
                    <% end if %>
                    <% end if %>
                    }
                    function cb_enblServiceChange()
                    {
                        if(document.ConfigForm.cb_enblService.checked)
                            document.ConfigForm.WanActive.value = "Yes";
                        else
                            document.ConfigForm.WanActive.value = "No";
                    }
                    function clearBindList()
                    {
                    for (var i = 1; i <= 4; i++)
                    {
                    document.getElementById("secLan" + i).disabled = false;
                    document.getElementById("cb_bindlan" + i).checked = false;
                    document.getElementById("secWireless" + i).disabled = false;
                    document.getElementById("cb_bindwireless" + i).checked = false;
                    document.getElementById("cb_bindwirelessac" + i).checked = false;
                    }
                    }
                    function linkModeSelect()
                    {
                        with (getElById('ConfigForm'))
                        {
                            pdDefaultSel = 1;
                            isNeedChange = 1;
                            var ipVer = getRadioVal("IpVersion");
                            if (getSelectVal('linkMode') == 'linkIP')
                            {
                                if("IPv6" == ipVer)
                                    WriteIPv6List(1);
                                else if("IPv4/IPv6" == ipVer)
                                {
                                    if(IpMode[0].checked)
                                        WriteIPv6List(0);
                                    else if(IpMode[1].checked)
                                        WriteIPv6List(2);
                                    else
                                        WriteIPv6List(0);
                                }
                                // setDisplay("secDhcp", 1);
                                setDisplay('secStatic',1);
                                if (SelWanIndex != -1)
                                {
                                }
                                else
                                {
                                    IpMode[0].checked = true;
                                }
                            }
                            else
                            {
                                if("IPv4" != ipVer)
                                    WriteIPv6List(0);
                                setDisplay("secDhcp", 0);
                                setDisplay('secStatic',0);
                                IpMode[2].checked = true;
                                DialMethodChange();
                            }
                            setDisplay('secPppoe',0);
                            IpModeChange();
                            IpVersionChange();
                            MTUDispChange();
                            dsliteShow();
                            dnsShow();
                            pdEnableShow();
                            dhcpEnableShow();
                            pppoeProxyShow();
                            ppp_dialMethodChg();
                        }
                    }
                    
                    var isWanModeChg = -1;
                    var isAddBtnClick = 0;
                    function ServiceListLoad(isBridge)
                    {
                        var bridgeArray = new Array('INTERNET', 'IPTV', 'OTT','OTHER');
                        var i = 0;
                        var status = '<% tcWebApi_get("WanInfo_WanIF","ServiceList","s") %>';
                        var isSel = 0;
                        <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) = "1" then %>
                        var routeArray = new Array('TR069', 'INTERNET', 'TR069_INTERNET'
                                                                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                                                                , 'VOICE', 'TR069_VOICE', 'VOICE_INTERNET', 'TR069_VOICE_INTERNET'
                                                                <% end if %>
                                                                , 'IPTV', 'OTT', 'OTHER');
                        <% else %>
                        var routeArray;
                        if ( status.indexOf('TR069') >= 0 && 0 == isAddBtnClick )
                            routeArray = new Array(status);
                        else
                             routeArray = new Array('INTERNET'
                                                                     <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                                                                     <% if tcwebApi_get("VoIPBasic_Common","VoIPConfig","h") <> "OMCI" then %>
                                                                      , 'VOICE', 'VOICE_INTERNET'
                                                                     <% end if %>
                                                                     <% end if %>
                                                                      , 'IPTV', 'OTT', 'OTHER');
                        <% end if %>
                    
                    <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                        with ( getElById('serviceListShow') )
                        {
                            options.length=0;
                            if ( 1 == isBridge )
                            {
                                for( i=0; i< bridgeArray.length; i++)
                                {
                                    var opt = new Option(bridgeArray[i], bridgeArray[i]);
                                    if ( status == opt.value )
                                    {
                                        opt.selected = true;
                                        isSel = i;
                                    }
                                    options.add ( opt );
                                }
                                options[isSel].setAttribute('selected', 'true');
                            }
                            else
                            {
                                for( i=0; i< routeArray.length; i++)
                                {
                                    var opt = new Option(routeArray[i], routeArray[i]);
                                    if ( status == opt.value )
                                    {
                                        opt.selected = true;
                                        isSel = i;
                                    }
                                    options.add ( opt );
                                }
                                options[isSel].setAttribute('selected', 'true');
                            }
                        }
                    <% end if %>
                    
                        with ( getElById('serviceList') )
                        {
                            options.length=0;
                    
                            if ( 1 == isBridge )
                            {
                                for( i=0; i< bridgeArray.length; i++)
                                {
                                    var opt = new Option(bridgeArray[i], bridgeArray[i]);
                                    if ( status == opt.value )
                                    {
                                        opt.selected = true;
                                        isSel = i;
                                    }
                                    options.add ( opt );
                                }
                                options[isSel].setAttribute('selected', 'true');
                            }
                            else
                            {
                                for( i=0; i< routeArray.length; i++)
                                {
                                    var opt = new Option(routeArray[i], routeArray[i]);
                                    if ( status == opt.value )
                                    {
                                        opt.selected = true;
                                        isSel = i;
                                    }
                                    options.add ( opt );
                                }
                                options[isSel].setAttribute('selected', 'true');
                            }
                            
                            if ( -1 == isWanModeChg )
                                isWanModeChg = isBridge;
                            else
                            {
                                if ( 	isWanModeChg != isBridge )
                                {
                                    isWanModeChg = isBridge;
                                    onSelectSvrList();
                                }
                            }
                        }
                    }
                    
                    function WanModeChange()
                    {
                    with (getElById('ConfigForm'))
                    {
                        if (wanMode.value == "Route")
                        {
                            ServiceListLoad(0);
                            setDisplay('secIpMode',1);
                            setDisplay('secRouteItems',1);
                            setDisplay('divLink', 1);
                            // setDisplay('secDhcp',1);
                            setDisplay('secStatic',1);
                            setDisplay('secPppoe',1);
                            setDisplay('secbridgeDhcprelay',0);
                            setDisplay('secBridgeType',0);
                        
                            if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE")
                            {
                                setDisplay('secNat',0);
                            }
                            else
                            {
                                setDisplay('secNat',1);
                            }
                            setDisplay('secIgmp',1);
                            IpModeChange();
                    <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
                            setDisplay('secCloneMAC', 1);
                    <%end if%>
                        }
                        else if (wanMode.value == "Bridge")
                        {
                            ServiceListLoad(1);
                            setDisplay('secIpMode',0);
                            setDisplay('secRouteItems',0);
                            setDisplay('divLink', 0);
                            setDisplay('secStaticItems',0);
                            setDisplay('secDHCPItems', 0);
                            setDisplay('secPppoeItems',0);
                            setDisplay('secDhcp',0);
                            setDisplay('secStatic',0);
                            setDisplay('secPppoe',0);
                            setDisplay('secBridgeType',1);
                            setDisplay('cb_dhcprelay',1);
                            getElement('secbridgeDhcprelay').style.display = "";
                            //setRadio("IpVersion", "IPv4");
                            setDisplay('secNat',0);
                            nat.value = "Disabled";
                            setDisplay('secIgmp',0);
                    <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
                            setDisplay('secCloneMAC', 0);
                    <%end if%>
                        }
                        else if (wanMode.value == "multMode")
                        {
                            setDisplay('secIpMode',1);
                            setDisplay('secRouteItems',1);
                            setDisplay('secDhcp',0);
                            setDisplay('secStatic',0);
                            setDisplay('secPppoe',1);
                            setDisplay('secbridgeDhcprelay',0);
                            IpMode[2].checked = true;
                            setDisplay('secNat',1);
                            setDisplay('secIgmp',1);
                            IpModeChange();
                        }
                        if (AddFlag == true)
                        {
                            if ((serviceList.value == "OTHER" || serviceList.value == "IPTV" || serviceList.value == "OTT") && wanMode.value == "Bridge")
                            {
                                cb_dhcprelay.checked = true;
                            }
                            else
                            {
                                cb_dhcprelay.checked = false;
                            }
                        }
                        IpVersionChange();
                        MTUDispChange();
                        MultiVIDDispChange();
                        dsliteShow();
                        pdEnableShow();
                        dhcpEnableShow();
                        pppoeProxyShow();
                        ppp_dialMethodChg();
                    }
                    }
                    
                    function WanModeSelect()
                    {
                    isNeedChange = 1;
                    WanModeChange();
                    linkModeSelect();
                    with (getElById('ConfigForm'))
                    {
                    if ((serviceList.value == "OTHER" || serviceList.value == "IPTV" || serviceList.value == "OTT") && wanMode.value == "Bridge")
                    {
                    cb_dhcprelay.checked = true;
                    }
                    else
                    {
                    cb_dhcprelay.checked = false;
                    }
                        if ( serviceList.value != "TR069"
                    && serviceList.value != "VOICE"
                    && serviceList.value != "TR069_VOICE"
                     && 'Route' == wanMode.value )
                        {
                            nat.value = "Enable";
                            setCheck('cb_nat', 1);
                        }
                    }
                    }
                    
                    function IpModeChange()
                    {
                        with (getElById('ConfigForm'))
                        {
                            var ipVer = getRadioVal("IpVersion");
                            if (IpMode[0].checked == true)
                            {
                            setDisplay('secStaticItems',0);
                            setDisplay('secDHCPItems', 1);
                            setDisplay('secPppoeItems',0);
                            document.ConfigForm.third_dns3.value = "0.0.0.0";
                            document.ConfigForm.ISPTypeValue.value = "0";
                                if("IPv4/IPv6" == ipVer){
                                    if(getSelectVal('linkMode') == 'linkIP')
                                        WriteIPv6List(0);
                                }
                                    
                            }
                            else if (IpMode[1].checked == true)
                            {
                            setDisplay('secStaticItems',1);
                            setDisplay('secDHCPItems', 0);
                            setDisplay('secPppoeItems',0);
                            document.ConfigForm.dnsDHCP.value = "0";
                            document.ConfigForm.ISPTypeValue.value = "1";
                                if("IPv4/IPv6" == ipVer){
                                    if(getSelectVal('linkMode') == 'linkIP')
                                        WriteIPv6List(2);
                                }
                            }
                            else if (IpMode[2].checked == true)
                            {
                            setDisplay('secStaticItems',0);
                            setDisplay('secPppoeItems',1);
                            setDisplay('secDHCPItems', 0);
                            document.ConfigForm.ISPTypeValue.value = "2";
                            }
                            else if (IpMode[3].checked == true)
                            {
                            setDisplay('secStaticItems',0);
                            setDisplay('secPppoeItems',1);
                            setDisplay('secDHCPItems', 0);
                            document.ConfigForm.ISPTypeValue.value = "3";
                            }
                            else if (IpMode[4].checked == true)
                            {
                            setDisplay('secStaticItems',1);
                            setDisplay('secPppoeItems',0);
                            setDisplay('secDHCPItems', 0);
                            document.ConfigForm.ISPTypeValue.value = "4";
                            }
                        }
                    }
                    function cb_bindflagChange()
                    {
                    with (getElById('ConfigForm'))
                    {
                        if (cb_bindflag.checked == true)
                        {
                            bindflag.value = "Yes";
                            setDisplay('secBind',1);
                            if(wanMode.value == "Bridge")
                                setDisplay('secbridgeDhcprelay',1);
                            else
                                setDisplay('secbridgeDhcprelay',0);
                            
                        }
                        else
                        {
                            bindflag.value = "No";
                            setDisplay('secBind',0);
                            setDisplay('secbridgeDhcprelay',0);
                        }
                    }
                    }
                    function Enbl8021dChange()
                    {
                    with (getElById('ConfigForm'))
                    {
                    if (enbl8021d.checked == true)
                    {
                    setDisplay('sec8021d',1);
                    document.ConfigForm.vlanPri.value = "Yes";
                    }
                    else
                    {
                    setDisplay('sec8021d',0);
                    document.ConfigForm.vlanPri.value = "No";
                    }
                    }
                    }
                    function Enbl8021qChange()
                    {
                    with (getElById('ConfigForm'))
                    {
                    if (enbl8021q.checked == true)
                    {
                    setDisplay('secVlan',1);
                    document.ConfigForm.vlanId.value = "Yes";
                    if ( 0 == v8021P.value.length )
                        v8021P.value = '0';
                    }
                    else
                    {
                    setDisplay('secVlan',0);
                    document.ConfigForm.vlanId.value = "No";
                    }
                    }
                    }
                    
                    function DOT1PShow()
                    {
                        if( document.ConfigForm.cb_8021P.checked )
                        {
                            document.ConfigForm.v8021PClick.value = "Yes";
                            setDisplay('v8021P', 1);
                        }
                        else
                        {
                            document.ConfigForm.v8021PClick.value = "No";
                            setDisplay('v8021P', 0);
                        }
                    }
                    function Enable8021PClick()
                    {
                        document.ConfigForm.v8021P.value = 0;
                        DOT1PShow();
                    }
                    function EnableNatClick()
                    {
                        if(document.ConfigForm.cb_nat.checked)
                            document.ConfigForm.nat.value = "Enable";
                        else
                            document.ConfigForm.nat.value = "Disabled";
                    }
                    function dnsShow(params) {
                        if(document.ConfigForm.cb_DNSEnableDHCP.checked) {
                            setDisplay('DHCPdns1', 1);
                            setDisplay('DHCPdns2', 1);
                        }
                        else {
                            setDisplay('DHCPdns1', 0);
                            setDisplay('DHCPdns2', 0);
                        }
                    }
                    function EnableDNSDHCPClick() {
                        if(document.ConfigForm.cb_DNSEnableDHCP.checked) {
                            document.ConfigForm.dnsDHCP.value = "1";
                            setDisplay('DHCPdns1', 1);
                            setDisplay('DHCPdns2', 1);
                        }
                        else {
                            document.ConfigForm.dnsDHCP.value = "0";
                            setDisplay('DHCPdns1', 0);
                            setDisplay('DHCPdns2', 0);
                        }      
                    } 
                    function EnableIGMPProxyClick()
                    {
                        if(document.ConfigForm.cb_enblIgmp.checked)
                            document.ConfigForm.enblIgmp.value = "Yes";
                        else
                            document.ConfigForm.enblIgmp.value = "No";
                    }
                    function EnableDHCPRealy()
                    {
                        if(document.ConfigForm.cb_dhcprelay.checked)
                            document.ConfigForm.dhcprelay.value = "Yes";
                        else
                            document.ConfigForm.dhcprelay.value = "No";
                    }
                    function atmServiceCategoryChange()
                    {
                    with (getElById('ConfigForm'))
                    {
                    switch (atmServiceCategory.value)
                    {
                    case "ubr":
                    setDisplay('secAtmPeakCellRate',0);
                    setDisplay('secAtmSustainedCellRate',0);
                    setDisplay('secAtmMaxBurstSize',0);
                    break;
                    case "ubr+":
                    case "cbr":
                    secAtmPeakCellRate.style.display = "";
                    secAtmSustainedCellRate.style.display = "none";
                    secAtmMaxBurstSize.style.display = "none";
                    break;
                    case "nrt-vbr":
                    case "rt-vbr":
                    secAtmPeakCellRate.style.display = "";
                    secAtmSustainedCellRate.style.display = "";
                    secAtmMaxBurstSize.style.display = "";
                    break;
                    }
                    }
                    }
                    function getWanList(list,index)
                    {
                    var temp = Wan[index].domain.split('.');
                    if (list == '')
                    {
                    return (temp[4] + '.' + temp[5] + '.' + temp[6]);
                    }
                    else
                    {
                    return ('|' + temp[4] + '.' + temp[5] + '.' + temp[6]);
                    }
                    }
                    function isDigit(val) {
                    if (val < '0' || val > '9')
                    return false;
                    return true;
                    }
                    function isDecimalDigit(digit)
                    {
                    if ( digit == "" )
                    {
                    return false;
                    }
                    for ( var i = 0 ; i < digit.length ; i++ )
                    {
                    if ( !isDigit(digit.charAt(i)) )
                    {
                    return false;
                    }
                    }
                    return true;
                    }
                    function isUseableIpAddress(address)
                    {
                    var num = 0;
                    var addrParts = address.split('.');
                    if (addrParts.length != 4)
                    {
                    return false;
                    }
                    if (isDecimalDigit(addrParts[0]) == false)
                    {
                    return false;
                    }
                    num = parseInt(addrParts[0]);
                    if (!(num >= 1 && num <= 223 && num != 127))
                    {
                    return false;
                    }
                    for (var i = 1; i <= 2; i++)
                    {
                    if (isDecimalDigit(addrParts[i]) == false)
                    {
                    return false;
                    }
                    num = parseInt(addrParts[i]);
                    if (!(num >= 0 && num <= 255))
                    {
                    return false;
                    }
                    }
                    if (isDecimalDigit(addrParts[3]) == false)
                    {
                    return false;
                    }
                    num = parseInt(addrParts[3]);
                    if (!(num >= 1 && num <= 254))
                    {
                    return false;
                    }
                    return true;
                    }
                    
                    
                    function CheckForm(type) {
                        if (type == 0) {
                            return true;
                        }
                        with (getElById('ConfigForm')) {
                            ClearStatusVar();
                            if (wanId.length == 0) {
                                alert("目前没有WAN连接，请点击添加按钮新建一条WAN连接并点击确定按钮以保存配置！");
                                return false;
                            }

                            if (serviceList.value.indexOf('TR069') >= 0) {
                                for (var i = 0; i < (CurWan.length - 1); i++) {
                                    if (false == AddFlag && curSetIndex.value == CurWan[i].domain)
                                        continue;

                                    if (CurWan[i].WanName.indexOf('TR069') >= 0) {
                                        alert('只能创建一个TR069 WAN口。');
                                        return false;
                                    }
                                }
                            }

                            // if ( 'TAG' == VLANMode.value )
                            // {
                            //     var v = vlan.value;
                            //     if(isPlusInteger(v) == false)
                            //     {
                            //         alert("VLAN ID不合法！");
                            //         return false;
                            //     }
                            //     else
                            //     {
                            //         if ((v == "") || (v < 1) || (v > 4094))
                            //         {
                            //         alert("VLAN ID不合法！");
                            //         return false;
                            //         }
                            //     }
                            // }

                            // if ( 'TAG' == VLANMode.value )
                            // {
                            //     var v = v8021P.value;
                            //     if (isPlusInteger(v) == false)
                            //     {
                            //         alert("802.1p不合法！");
                            //         return false;
                            //     }
                            //     else
                            //     {
                            //         if ((v == "") || (v < 0) || (v > 7))
                            //         {
                            //             alert("802.1p不合法！");
                            //             return false;
                            //         }
                            //     }
                            // }

                            if ('none' != getElement('mulvidsec').style.display) {
                                var v = MulticastVID.value;
                                if (0 != v.length) {
                                    // if (isPlusInteger(v) == false)
                                    // {
                                    //     alert("组播VLAN ID不合法！");
                                    //     return false;
                                    // }
                                    // else
                                    // {
                                    //     if ( v < 1 || v > 4094 )
                                    //     {
                                    //         alert("组播VLAN ID不合法！");
                                    //         return false;
                                    //     }
                                    // }
                                }
                                MulVIDUsed.value = 'Yes';
                            }
                            else
                                MulVIDUsed.value = 'No';

                            if ('none' != getElement('MTUsec').style.display) {
                                var v = MTU.value;
                                if (isPlusInteger(v) == false) {
                                    alert("MTU不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    return false;
                                }
                                else {
                                    if (getSelectVal('linkMode') == 'linkPPP') {
                                        if ('IPv4' == getRadioVal('IpVersion')) {
                                            if ((v == '') || (0 == v || (v < 128) || (v > 1492))) {
                                                alert("MTU不合法，请输入值为128~1492之间的整数！");
                                                $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                return false;
                                            }

                                            if (dnsDHCP.value == "1") {
                                                if (!isAbcIpAddress(dns1.value)) {
                                                    alert("DNS1地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns1.focus();
                                                    return false;
                                                }
                                                if (!isUseableIpAddress(dns1.value)) {
                                                    alert("DNS1地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns1.focus();
                                                    return false;
                                                }
                                                if (dns2.value != '' && !isAbcIpAddress(dns2.value)) {
                                                    alert("DNS2地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns2.focus();
                                                    return false;
                                                }
                                                if (dns2.value != '' && !isUseableIpAddress(dns2.value)) {
                                                    alert("DNS2地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns2.focus();
                                                    return false;
                                                }
                                            }
                                        }
                                        else {
                                <% if tcwebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
                                                    if (getCheckVal('cb_enabledslite') == 1) {
                                                if ((v == '') || (0 == v || (v < 1320) || (v > 1492))) {
                                                    alert("MTU不合法，请输入值为1320~1492之间的整数！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    return false;
                                                }
                                            } else {
                                <% end if %>
                                                        if ((v == '') || (0 == v || (v < 1280) || (v > 1492))) {
                                                        alert("MTU不合法，请输入值为1280~1492之间的整数！");
                                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                        return false;
                                                    }					
                                <% if tcwebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
                                                    }
                                <% end if %>			
                                                    }
                                    }
                                    else {
                                        if ('IPv4' == getRadioVal('IpVersion')) {
                                            if ((v == '') || (0 == v || (v < 576) || (v > 1500))) {
                                                alert("MTU不合法，请输入值为576~1500之间的整数！");
                                                return false;
                                            }
                                            if (dnsDHCP.value == "1") {
                                                if (!isAbcIpAddress(dns1.value)) {
                                                    alert("DNS1地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns1.focus();
                                                    return false;
                                                }
                                                if (!isUseableIpAddress(dns1.value)) {
                                                    alert("DNS1地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns1.focus();
                                                    return false;
                                                }
                                                if (dns2.value != '' && !isAbcIpAddress(dns2.value)) {
                                                    alert("DNS2地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns2.focus();
                                                    return false;
                                                }
                                                if (dns2.value != '' && !isUseableIpAddress(dns2.value)) {
                                                    alert("DNS2地址不合法！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    dns2.focus();
                                                    return false;
                                                }
                                            }
                                        }
                                        else {
                                <% if tcwebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
                                                        if (getCheckVal('cb_enabledslite') == 1) {
                                                if ((v == '') || (0 == v || (v < 1320) || (v > 1500))) {
                                                    alert("MTU不合法，请输入值为1320~1500之间的整数！");
                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                    return false;
                                                }
                                            } else {
                                <% end if %>
                                                        if ((v == '') || (0 == v || (v < 1280) || (v > 1500))) {
                                                        alert("MTU不合法，请输入值为1280~1500之间的整数！");
                                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                        return false;
                                                    }
                                <% if tcwebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
                                                    }
                                <% end if %>
                                                    }
                                    }
                                }
                            }

                            if ('none' != getElement('PDEnableSec').style.display) {
                                PDUsed.value = 'Yes';
                                if (getCheckVal('cb_enabledpd') == 1)
                                    enablepd.value = 'Yes';
                                else
                                    enablepd.value = 'No';
                            }
                            else
                                PDUsed.value = 'No';

                            if ('none' != getElement('pdmode_1').style.display) {
                                pdmodeUsed.value = 'Yes';
                                if (getRadioVal('pdmode') == 'No') {
                                    var prefixObjs = pdprefix.value.split('/');
                                    if (prefixObjs.length != 2) {
                                        alert("前缀地址不合法！格式为XXXX.XXXX.XXXX.XXXX::/XX");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        return false;
                                    }

                                    if (true != isGlobalIpv6Address(prefixObjs[0])) {
                                        alert("前缀IP格式不合法！格式为XXXX.XXXX.XXXX.XXXX::");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        return false;
                                    }

                                    var TemLen = parseInt(prefixObjs[1]);
                                    if (true != isPlusInteger(prefixObjs[1]) || true == isNaN(TemLen) || TemLen > 64 || TemLen < 16) {
                                        alert("前缀长度不合法！长度为16-64");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        return false;
                                    }

                                    switch (CheckPDTime(pdprefixptime.value, pdprefixvtime.value)) {
                                        case 1:
                                            alert('前缀首选寿命： "' + pdprefixptime.value + '" 不合法 !');
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        case 2:
                                            alert('前缀有效寿命： "' + pdprefixvtime.value + '" 不合法 !');
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        case 3:
                                            alert('前缀有效寿命：' + pdprefixvtime.value + '必须大于前缀首选寿命 : ' + pdprefixptime.value);
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                    }
                                }
                            }
                            else
                                pdmodeUsed.value = 'No';

                            if ('none' != getElement('enabledhcpsec').style.display) {
                                if (getCheckVal('cb_enabledhcp') == 1)
                                    enable_dhcp.value = '1';
                                else
                                    enable_dhcp.value = '0';
                            }
                            else
                                enable_dhcp.value = '0';

                            if (getElement('secPppoeItems').style.display != "none") {
                                if (getElement('secIdleTime').style.display != "none") {
                                <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                                    var idletime_val = pppTimeOut.value;
                                    if (0 == idletime_val.length
                                        || false == isPlusInteger(idletime_val)
                                        || parseInt(idletime_val) < 1) {
                                        alert('无流量空闲超时时间不合法！');
                                        return false;
                                    }

                                    pppondemand_idletime.value = parseInt(idletime_val) * 60;
                                <% else %>
                                if (isPlusInteger(pppTimeOut.value) == false) {
                                        alert("空闲超时不合法！");
                                        return false;
                                    }
                                    else {
                                        if ((getElement('pppTimeOut').value < 1) || (getElement('pppTimeOut').value > 4320)
                                            || (getElement('pppTimeOut').value == '')) {
                                            alert("空闲超时不合法！");
                                            return false;
                                        }
                                    }
                                <% end if %>
                                }
                                if (isValidNamePPPoE(pppUserName.value) == false) {
                                    alert("用户名不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    return false;
                                }
                                if (isValidPwdPPPoE(pppPassword.value) == false) {
                                    alert("密码不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    return false;
                                }
                            }
                            if ((getElement('secDHCPItems').style.display != "none")) {
                                if (dnsDHCP.value == "1") {
                                    if (!isAbcIpAddress(dns1.value)) {
                                        alert("DNS1地址不合法！");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        dns1.focus();
                                        return false;
                                    }
                                    if (!isUseableIpAddress(dns1.value)) {
                                        alert("DNS1地址不合法！");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        dns1.focus();
                                        return false;
                                    }
                                    if (dns2.value != '' && !isAbcIpAddress(dns2.value)) {
                                        alert("DNS2地址不合法！");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        dns2.focus();
                                        return false;
                                    }
                                    if (dns2.value != '' && !isUseableIpAddress(dns2.value)) {
                                        alert("DNS2地址不合法！");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        dns2.focus();
                                        return false;
                                    }
                                }
                            }
                            if ((getElement('secStaticItems').style.display != "none")
                                && ("IPv6" != getRadioVal("IpVersion"))) {
                                if (WanIP != null) {
                                    var iloop;
                                    for (iloop = 0; iloop < WanIP.length - 1; iloop++) {
                                        if ((vpi != WanIP[iloop].atmVpi) && (vci != WanIP[iloop].atmVci)) {
                                            if (wanIpAddress.value == WanIP[iloop].wanIpAddress) {
                                                alert("IP地址和" + WanIP[iloop].conName + "冲突！");
                                                $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                return false;
                                            }
                                        }
                                    }
                                }

                                if (!isAbcIpAddress(wanIpAddress.value)) {
                                    alert("IP地址不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    wanIpAddress.focus();
                                    return false;
                                }
                                if (!isValidSubnetMask(wanSubnetMask.value)) {
                                    alert("子网掩码不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    wanSubnetMask.focus();
                                    return false;
                                }
                                
								var lanIPaddr = "<% tcWebApi_get("Lan_Entry","IP","s") %>";
                                if (isSameSubNet(wanIpAddress.value, wanSubnetMask.value, lanIPaddr, wanSubnetMask.value)) {
                                    alert("错误！LAN的IP地址段与WAN的IP地址段冲突！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    wanIpAddress.focus();
                                    return false;
                                }
                                
                                if (!checkGW(defaultGateway.value)) {
                                    alert("缺省网关不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    defaultGateway.focus();
                                    return false;
                                }
                                if (calcSubNet(wanIpAddress.value, wanSubnetMask.value) != calcSubNet(defaultGateway.value, wanSubnetMask.value)) {
                                    alert('IP地址 "' + wanIpAddress.value + '" 和' + '缺省网关 "' + defaultGateway.value + '"不在同一个网段。');
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    defaultGateway.focus();
                                    return false;
                                }
                                if (!isAbcIpAddress(dnsPrimary.value)) {
                                    alert("DNS1地址不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    dnsPrimary.focus();
                                    return false;
                                }
                                if (!isUseableIpAddress(dnsPrimary.value)) {
                                    alert("DNS1地址不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    dnsPrimary.focus();
                                    return false;
                                }
                                if (dnsSecondary.value != '' && !isAbcIpAddress(dnsSecondary.value)) {
                                    alert("DNS2地址不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    dnsSecondary.focus();
                                    return false;
                                }
                                if (dnsSecondary.value != '' && !isUseableIpAddress(dnsSecondary.value)) {
                                    alert("DNS2地址不合法！");
                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                    dnsSecondary.focus();
                                    return false;
                                }
                                // if (dns3.value != '' && !isAbcIpAddress(dns3.value)) {
                                //     alert("DNS3地址不合法！");
                                //     $('.popup-dialog.upgrade1').parent().css("display", "none");
                                //     dns3.focus();
                                //     return false;
                                // }
                                // if (dns3.value != '' && !isUseableIpAddress(dns3.value)) {
                                //     alert("DNS3不合法！");
                                //     $('.popup-dialog.upgrade1').parent().css("display", "none");
                                //     dns3.focus();
                                //     return false;
                                // }
                            }
                            if ((secIPv6Div.style.display != "none")) {
                                if ('IPv4' != getRadioVal('IpVersion')) {
                                    if (TrIpv6Addr.style.display != "none") {
                                        if (!isGlobalIpv6Address(getValue('IdIpv6Addr'))) {
                                            alert("IPv6地址不正确！");
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        }
                                        var v = getValue('IdIpv6PrefixLen');
                                        if (isPlusInteger(v) == false) {
                                            alert("IPv6前缀长度不正确！");
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        }
                                        else {
                                            if ((v == "") || (v <= 0) || (v > 128)) {
                                                alert("IPv6前缀长度不正确！");
                                                return false;
                                            }
                                            if (v.length > 1 && v.charAt(0) == '0') {
                                                alert("IPv6前缀长度不正确！");
                                                return false;
                                            }
                                        }
                                        if (!isUnicastIpv6Address(getValue('IdIpv6Dns1'))) {
                                            alert("IPv6首选DNS服务器地址不正确！");
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        }
                                        var v1 = getValue('IdIpv6Dns2');
                                        if (v1 != '' && !isUnicastIpv6Address(v1)) {
                                            alert("IPv6备用DNS服务器地址不正确！");
                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                            return false;
                                        }
                                    }
                                    var v2 = getValue('IdIpv6Gateway');
                                    if (v2 != '' && !isUnicastIpv6Address(v2)) {
                                        alert("IPv6默认网关不合法！");
                                        $('.popup-dialog.upgrade1').parent().css("display", "none");
                                        return false;
                                    }
                                }
                            }
                            <%if TCWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
                            if ('none' != getElement('dslite_1').style.display) {
                                if (getCheckVal('cb_enabledslite') == 1)
                                    enabledslite.value = 'Yes';
                                else
                                    enabledslite.value = 'No';

                                dsliteUsed.value = 'Yes';
                            }
                            else
                                dsliteUsed.value = 'No';
                            <% end if%>
                                    
                            <%if tcWebApi_get("WebCustom_Entry", "isCTPONC9Supported", "h") = "Yes" then %>
                            if (!checkWANMac(wanhwaddress.value)) {
                                alert('WAN连接MAC地址不合法!');
                                return false;
                            }
                            wanhwaddress.value = wanhwaddress.value.replace(/-/g, ':');
                            <% end if%>
                                
                            <%if TCWebApi_get("WebCustom_Entry", "isPPPoEProxySupported", "h") = "Yes" then %>
                            if ('none' != getElement('ppp_proxy_bi').style.display) {
                                ppp_proxy_biUsed.value = 'Yes';
                                if ('1' == getRadioVal("ppp_proxy_bi_mode") && 'none' != getElement('ppp_proxy_user').style.display) {
                                    var pppmaxUser = parseInt(pppproxy_user.value);
                                    if (true != isPlusInteger(pppproxy_user.value) || true == isNaN(pppmaxUser) || pppmaxUser > 4 || pppmaxUser < 1) {
                                        alert("PPPoE代理最大用户数不合法！长度为1-4");
                                        return false;
                                    }
                                }

                                if (0 != getRadioVal("ppp_proxy_bi_mode")) {
                                    if (1 == checkDupPPPBi()) {
                                        alert("仅支持1条WAN连接开启PPPoE代理或桥混合模式");
                                        return false;
                                    }
                                }
                            }
                            else
                                ppp_proxy_biUsed.value = 'No';
                            <%else%>
                                //		if ( 'none' != getElement('ppp_bi').style.display )
                                //		{
                                //			pppbiUsed.value = 'Yes';
                                //			if ( getCheckVal('cb_enable_pppbi') == '1' )
                                //			{
                                //				if ( 1 == checkDupPPPBi() )
                                //				{
                                //						alert("仅支持1条WAN连接开启桥混合模式");
                                //						return false;
                                //				}
                                //				enablepppbi.value = 'Yes';
                                //			}
                                //			else
                                //				enablepppbi.value = 'No';
                                //		}
                                //		else
                                //			pppbiUsed.value = 'No';
                            <% end if%>
                                
                        }
                    
                    <%if TCWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
                    function checkHexMAC(byteMAC)
                    {
                        var idx = 0;
                        var c;
                    
                        for ( idx = 0; idx < byteMAC.length; idx ++ )
                        {
                                c = byteMAC.charAt(idx);
                                if ( !((c >= '0' && c <= '9')
                                     || (c >= 'a' && c <= 'f')) )
                                    return false;
                        }
                    
                        return true;	
                    }
                    
                    function isSameObj(objs, oneobj)
                    {
                        var idx = 0;
                    
                        for ( idx = 0; idx < objs.length; idx ++ )
                        {
                                if ( 	objs[idx] != oneobj )
                                    return false;
                        }
                    
                        return true;
                    }
                    
                    function checkWANMac( mac )
                    {
                        var chkMAC = mac.toLowerCase();
                        var macObjs;
                        var keys = new Array(':', '-');
                        var idx = 0;
                    
                        if ( 17 != chkMAC.length )
                            return false;
                    
                        if ( chkMAC.indexOf( keys[0] ) >= 0 )
                            macObjs = chkMAC.split( keys[0] );
                        else
                            macObjs = chkMAC.split( keys[1] );
                    
                        if ( 6 != macObjs.length )
                            return false;
                    
                        for ( idx = 0; idx < macObjs.length; idx ++ )
                        {
                                if ( 	2 != macObjs[idx].length )
                                    return false;
                    
                          if ( !checkHexMAC(macObjs[idx]) )
                              return false;
                        }
                    
                        if ( isSameObj(macObjs, 'ff') )
                            return false;
                    
                        if ( 0x01 == ( macObjs[0] & 0x01 ) ) // multicast mac
                            return false;
                            
                        return true;
                    }
                    <%end if%>
                    
                    mode = getSelectVal('wanMode');
                    ipMode = getRadioVal('IpMode');
                    brMode = getSelectVal('bridgeMode');
                    var type = getLinkType(mode,ipMode,brMode);
                    var wanType = getWanType(mode,ipMode,brMode);
                    var BindArray = new Array();
                    var j = 0;
                    for (var i = 1; i <= 4; i++)
                    {
                    var len = 'InternetGatewayDevice.LANDevice.1.'.length;
                    if (getCheckVal('cb_bindlan'+i) == 1)
                    BindArray[j++] = getValue('cb_bindlan'+i).substr(len);
                    if (getCheckVal('cb_bindwireless'+i) == 1)
                    BindArray[j++] = getValue('cb_bindwireless'+i).substr(len);
                    }
                    if (BindArray.length > 0)
                    {
                    for (var j = 0; j < Wan.length; j++)
                    {
                    if ((j != SelWanIndex) && (Wan[j].bind != ""))
                    {
                    if (mode == "Bridge")
                    {
                    for (i = 0; i < BindArray.length; i++)
                    {
                    if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
                    {
                    alert('绑定选项与其他WAN连接的绑定选项冲突，请重新选择绑定接口，如果所有绑定选项皆被其他WAN绑定，则不能进行任何绑定！');
                    return false;
                    }
                    }
                    }
                    else
                    {
                    if (getRadioVal('IpVersion') == 'IPv4')
                    {
                    if ((Wan[j].ConnectionType.indexOf("Bridge") >= 0)
                    || (Wan[j].xIpv4Enable == 1))
                    {
                    for (i = 0; i < BindArray.length; i++)
                    {
                    if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
                    {
                    alert('绑定选项与其他WAN连接的绑定选项冲突，请重新选择绑定接口，如果所有绑定选项皆被其他WAN绑定，则不能进行任何绑定！');
                    return false;
                    }
                    }
                    }
                    }
                    else if (getRadioVal('IpVersion') == 'IPv6')
                    {
                    if ((Wan[j].ConnectionType.indexOf("Bridge") >= 0)
                    || (Wan[j].xIpv6Enable == 1))
                    {
                    for (i = 0; i < BindArray.length; i++)
                    {
                    if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
                    {
                    alert('绑定选项与其他WAN连接的绑定选项冲突，请重新选择绑定接口，如果所有绑定选项皆被其他WAN绑定，则不能进行任何绑定！');
                    return false;
                    }
                    }
                    }
                    }
                    else
                    {
                    for (i = 0; i < BindArray.length; i++)
                    {
                    if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
                    {
                    alert('绑定选项与其他WAN连接的绑定选项冲突，请重新选择绑定接口，如果所有绑定选项皆被其他WAN绑定，则不能进行任何绑定！');
                    return false;
                    }
                    }
                    }
                    }
                    }
                    }
                    }
                    
                    if (AddFlag == true)
                    {
                    var count = 0;
                    var i;
                    if (AddFlag == true)
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (Wan[i].atmVpi == vpi && Wan[i].atmVci == vci)
                    {
                    count++;
                    }
                    }
                    if (count >= 4)
                    {
                    alert('一条PVC下最多只能添加四条WAN连接！');
                    return false;
                    }
                    }
                    count = 0;
                    if (wanType == 'WANIPConnection') 
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (Wan[i].wanConn == 'IPCon' && Wan[i].atmVpi == vpi
                    && Wan[i].atmVci == vci)
                    {
                    count++;
                    }
                    }
                    if (count >= 3)
                    {
                    alert('一条PVC下最多只能添加三条IPOE（或者桥）的WAN连接！');
                    return false;
                    }
                    }
                    else if (mode == 'Bridge') 
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if ((Wan[i].ConnectionType == 'PPP' || Wan[i].ConnectionType == 'IP' || Wan[i].wanConn == 'IPCon')
                    && Wan[i].atmVpi == vpi
                    && Wan[i].atmVci == vci)
                    {
                    count++;
                    }
                    }
                    if (count >= 3)
                    {
                    alert('一条PVC下最多只能添加三条IPOE（或者桥）的WAN连接！');
                    return false;
                    }
                    }
                    else 
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if ((Wan[i].wanConn == 'PPPCon' && Wan[i].ConnectionType == 'IP_Routed')
                    && Wan[i].atmVpi == vpi
                    && Wan[i].atmVci == vci)
                    {
                    count++;
                    }
                    }
                    if (count >= 4)
                    {
                    alert('一条PVC下最多只能添加四条PPPoE的WAN连接！');
                    return false;
                    }
                    }
                    }
                    if (CntPvc.length >= 9 && GetWanIndexPvcByUse(vpi,vci) == -1)
                    {
                    if (AddFlag == true)
                    {
                    alert("您最多只能建立8条PVC！");
                    return false;
                    }
                    }
                    return true;
                    }
                    function DisableInvisibleItems()
                    {
                    var Inputs = document.getElementsByTagName("div");
                    for (var i = 0; i < Inputs.length; i++)
                    {
                    if (Inputs[i].style.display == "none")
                    {
                    Inputs[i].disabled = true;
                    }
                    }
                    }
                    function ManualCntSubmit()
                    {
                        if (AddFlag == true)
                        {
                            return;
                        }
                        setDisable('btnRemoveCnt',1);
                        setDisable('btnOK',1);
                        setDisable('btnAddCnt',1);
                        setDisable('pppDialButton',1);
                        document.ConfigForm.Wan_Flag.value = "4";
                        //document.ConfigForm.submit();
                        ajax_submit(20);
                    }
                    function resetText()
                    {
                    var Inputs = document.getElementsByTagName("input");
                    for (var i = 0; i < Inputs.length; i++)
                    {
                    if (Inputs[i].type == "text" || Inputs[i].type == "password" )
                    {
                    Inputs[i].value = '';
                    }
                    }
                    }
                    function AddOption(selItem,value,text,ifSelected)
                    {
                    var option = document.createElement("option");
                    option.innerHTML = text;
                    option.value = value;
                    option.selected = ifSelected;
                    selItem.appendChild(option);
                    }
                    function RemoveOption(selItem,index)
                    {
                        selItem.removeChild(selItem.options[index]);
                    }
                    
                    function GetWanIndexPvcByUse(atmVpi,atmVci,exception)
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (Wan[i].atmVpi == atmVpi && Wan[i].atmVci == atmVci
                    && (exception == null || exception != i))
                    {
                    return i;
                    }
                    }
                    return -1;
                    }
                    function GetWanIndexPvcByUseEx(atmVpi, atmVci, execption)
                    {
                    for (i = 0; i < Wan.length; i++)
                    {
                    if ((Wan[i].atmVpi == atmVpi) &&
                    (Wan[i].atmVci == atmVci) &&
                    (execption != i) &&
                    (Wan[i].Relating.domain == Wan[execption].Relating.domain))
                    {
                    return i;
                    }
                    }
                    return -1;
                    }
                    function getSameWanList(index)
                    {
                    var atmVpi = Wan[index].atmVpi;
                    var atmVci = Wan[index].atmVci;
                    var list = '';
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (i != index && Wan[i].atmVpi == atmVpi && Wan[i].atmVci == atmVci)
                    {
                    list += getWanList(list,i);
                    }
                    }
                    return list;
                    }
                    function getDeleteDomainName()
                    {
                    var Pvc = Wan[SelWanIndex].Relating;
                    var index = Pvc.domain.lastIndexOf('.');
                    var DslDomain = Pvc.domain.substr(0,index);    
                    var pos = GetWanIndexPvcByUseEx(Wan[SelWanIndex].atmVpi,
                    Wan[SelWanIndex].atmVci,SelWanIndex);
                    if (pos > -1)
                    {
                    return Wan[SelWanIndex].domain;
                    }
                    else
                    {
                    return DslDomain;
                    }
                    }
                    
                    function ClearStatusVar()
                    {
                    wanList = '';
                    pvcByUseIndex = -1;
                    changePVCFlag = true;
                    }
                    function CancelAddCnt()
                    {
                    with (getElById('ConfigForm'))
                    {
                    RemoveOption(getElement('wanId'),wanId.length - 1);
                    AddFlag = false;
                    btnAddCnt.disabled = false;
                    }
                    }
                    function onCancel()
                    {
                    var wanIdItem = getElement('wanId');
                    if (wanIdItem.value == -1)
                    {
                    CancelAddCnt();
                    if (wanIdItem.length > 0)
                    {
                    
                    WanIdChange();
                    }
                    }
                    else RefreshPage();
                    }
                    function getBind(bindstr,cb_str)
                    {
                    if (getCheckVal(cb_str) == 1)
                    {
                    if (bindstr == '')
                    {
                    return  getValue(cb_str);
                    }
                    else
                    {
                    return  ',' + getValue(cb_str);
                    }
                    }
                    return '';
                    }
                    function getChangeWanTypeUrl(CntType)
                    {
                    var url = '';
                    if (pvcByUseIndex == -1)
                    {
                    pvcByUseIndex = SelWanIndex;
                    }
                    url = 'dellist=' + wanList + '&';
                    url += getAddWanUrl(CntType);
                    return url;
                    }
                    function getLinkType(mode,ipMode,brMode)
                    {
                    if (mode == "Route")
                    {
                    if (ipMode == 'PPPoA')
                    {
                    return 'PPPoA';
                    }
                    else if (ipMode == 'IPoA')
                    {
                    return 'IPoA';
                    }
                    else if (ipMode == 'CIP')
                    {
                    return 'CIP';
                    }
                    else
                    {
                    return 'EoA';
                    }
                    }
                    else if (mode == "Bridge")
                    {
                    return 'EoA';
                    }
                    }
                    function getWanType(mode,ipMode,brMode)
                    {
                    var LinkType = getLinkType(mode,ipMode,brMode);
                    if (mode == 'Bridge' && LinkType == 'EoA')
                    {
                    if (brMode == 'IP_Bridged')
                    {
                    return 'WANIPConnection';
                    }
                    else
                    {
                    return 'WANPPPConnection';
                    }
                    }
                    if ((LinkType == 'EoA' && ipMode == 'PPPoE') || (LinkType == 'PPPoA'))
                    {
                    return 'WANPPPConnection';
                    }
                    else if ((LinkType == 'EoA' && ipMode != 'PPPoE') || (LinkType == 'IPoA') || (LinkType == 'CIP'))
                    {
                    return 'WANIPConnection';
                    }
                    }
                    function addParam(Form,mode,ipMode,brMode)
                    {
                    var serviceList = getValue('serviceList');
                    var vpi = getValue('atmVpi');
                    var vci = getValue('atmVci');
                    Form.usingPrefix('y');
                    var wanName =  serviceList + '_' + mode.charAt(0)  + '_'
                    + vpi + '_' + vci;
                    if ("OTHER" == serviceList)
                    {
                    wanName =  'Other' + '_' + mode.charAt(0)  + '_'
                    + vpi + '_' + vci;
                    }
                    Form.addParameter('Name',wanName);
                    Form.addParameter('X_ATP_VLANEnabled',getCheckVal('enbl8021q'));
                    if (getCheckVal('enbl8021q') == 1)
                    {
                    Form.addParameter('X_ATP_VLANID',getValue('vlan'));
                    }
                    if (getCheckVal('enbl8021d') == 1)
                    {
                    Form.addParameter('X_ATP_Priority',getValue('v8021P'));
                    }
                    else
                    {
                    Form.addParameter('X_ATP_Priority',255);
                    }
                    var bindstr = '';
                    for (i = 1; i <= 4; i++)
                    {
                    bindstr = bindstr + getBind(bindstr,'cb_bindlan'+i);
                    bindstr = bindstr + getBind(bindstr,'cb_bindwireless'+i);
                    }
                    Form.addParameter('X_CT-COM_LanInterface',bindstr);
                    if (mode == 'Route')
                    {
                    Form.addParameter('ConnectionType','IP_Routed');
                    if (ipMode == 'PPPoE')
                    {
                    Form.addParameter('Username',getValue('pppUserName'));
                    var pwd = getValue('pppPassword');
                    if (pwd != '@1GV)Z<!')
                    {
                    Form.addParameter('Password',pwd);
                    }
                    if (pwd == '@1GV)Z<!')
                    {
                    var Pword = Wan[SelWanIndex].pppPassword;
                    Form.addParameter('Password', Pword);
                    }
                    Form.addParameter('ConnectionTrigger',getValue('DialMethod'));
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "1");
                    Form.addParameter('DNSServers','');
                    }
                    else if (ipMode == 'Static')
                    {
                    Form.addParameter('AddressingType',ipMode);
                    Form.addParameter('ExternalIPAddress',getValue('wanIpAddress'));
                    Form.addParameter('SubnetMask',getValue('wanSubnetMask'));
                    Form.addParameter('DefaultGateway',getValue('defaultGateway'));
                    var DnsStr = getValue('dnsPrimary') + ',' + getValue('dnsSecondary') + ',' + getValue('dns3');
                    Form.addParameter('DNSServers',DnsStr);
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "0");
                    }
                    else if (ipMode == 'DHCP')
                    {
                    Form.addParameter('AddressingType',ipMode);
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "1");
                    Form.addParameter('DNSServers','');
                    Form.addParameter('X_ATP_DHCPOptionCode',getValue('wanDhcpCode'));
                    }
                    else if (ipMode == 'IPoA')
                    {
                    Form.addParameter('AddressingType', "Static");
                    Form.addParameter('ExternalIPAddress',getValue('wanIpAddress'));
                    Form.addParameter('SubnetMask',getValue('wanSubnetMask'));
                    Form.addParameter('DefaultGateway',getValue('defaultGateway'));
                    var DnsStr = getValue('dnsPrimary') + ',' + getValue('dnsSecondary') + ',' + getValue('dns3');
                    Form.addParameter('DNSServers',DnsStr);
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "0");
                    }
                    else if (ipMode == 'CIP')
                    {
                    Form.addParameter('AddressingType', "Static");
                    Form.addParameter('ExternalIPAddress',getValue('wanIpAddress'));
                    Form.addParameter('SubnetMask',getValue('wanSubnetMask'));
                    Form.addParameter('DefaultGateway',getValue('defaultGateway'));
                    var DnsStr = getValue('dnsPrimary') + ',' + getValue('dnsSecondary') + ',' + getValue('dns3');
                    Form.addParameter('DNSServers',DnsStr);
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "0");
                    }
                    else if (ipMode == 'PPPoA')
                    {
                    Form.addParameter('Username',getValue('pppUserName'));
                    var pwd = getValue('pppPassword');
                    if (pwd != '@1GV)Z<!')
                    {
                    Form.addParameter('Password',pwd);
                    }
                    if (pwd == '@1GV)Z<!')
                    {
                    var Pword = Wan[SelWanIndex].pppPassword;
                    Form.addParameter('Password', Pword);
                    }
                    Form.addParameter('ConnectionTrigger',getValue('DialMethod'));
                    Form.addParameter('DNSEnabled', "1");
                    Form.addParameter('DNSOverrideAllowed', "1");
                    Form.addParameter('DNSServers','');
                    }
                    var enablNat = getCheckVal('cb_nat');
                    if (enablNat == 0)
                    {
                    Form.addParameter('NATEnabled', 0);
                    }
                    else
                    {
                    Form.addParameter('NATEnabled', 1);
                    }
                    }
                    else if (mode == 'Bridge')
                    {
                    Form.addParameter('ConnectionType',brMode);
                    Form.addParameter('X_CT-COM_LanInterface-DHCPEnable',(getCheckVal('cb_dhcprelay')+1)%2);
                    Form.addParameter('DNSEnabled', "0");
                    Form.addParameter('DNSServers','');
                    if (brMode == 'IP')
                    {
                    Form.addParameter('AddressingType','Static');
                    }
                    }
                    if (mode == 'Route')
                    {
                    var IpVer = getRadioVal('IpVersion');
                    var xIpv4Enable = 0;
                    var xIpv6Enable = 0;
                    if (IpVer == 'IPv4')
                    {
                    xIpv4Enable = 1;
                    xIpv6Enable = 0;
                    }
                    else if (IpVer == 'IPv6')
                    {
                    xIpv4Enable = 0;
                    xIpv6Enable = 1;
                    }
                    else
                    {
                    xIpv4Enable = 1;
                    xIpv6Enable = 1;
                    }
                    Form.addParameter('X_CT-COM_IPv4Enable', xIpv4Enable);
                    Form.addParameter('X_CT-COM_IPv6Enable', xIpv6Enable);
                    if (1 == xIpv6Enable)
                    {
                    Form.addParameter('X_CT-COM_IPv6AddressingType', getSelectVal('IdIpv6AddrType'));
                    if ('SLAAC' != getSelectVal('IdIpv6AddrType'))
                    {
                    Form.addParameter('X_CT-COM_IPv6DefaultGateway', getValue('IdIpv6Gateway'));
                    }
                    else
                    {
                    Form.addParameter('X_CT-COM_IPv6DefaultGateway', '');
                    }
                    if (getSelectVal('IdIpv6AddrType') == 'Static')
                    {
                    Form.addParameter('X_CT-COM_IPv6Address', getValue('IdIpv6Addr'));
                    Form.addParameter('X_CT-COM_IPv6PrefixLength', getValue('IdIpv6PrefixLen'));
                    if (getValue('IdIpv6Dns2') == '')
                    {
                    Form.addParameter('X_CT-COM_IPv6DNSServers', getValue('IdIpv6Dns1'));
                    }
                    else
                    {
                    Form.addParameter('X_CT-COM_IPv6DNSServers', getValue('IdIpv6Dns1') + ',' + getValue('IdIpv6Dns2'));
                    }
                    Form.addParameter('X_CT-COM_IPv6DNSEnabled', '1');
                    Form.addParameter('X_CT-COM_IPv6DNSOverrideAllowed', '0');
                    }
                    else
                    {
                    Form.addParameter('X_CT-COM_IPv6Address', "");
                    Form.addParameter('X_CT-COM_IPv6PrefixLength', '0');
                    Form.addParameter('X_CT-COM_IPv6DNSEnabled', '1');
                    Form.addParameter('X_CT-COM_IPv6DNSOverrideAllowed', '1');
                    Form.addParameter('X_CT-COM_IPv6DNSServers', "");
                    }
                    }
                    }
                    else
                    {
                    Form.addParameter('X_CT-COM_IPv6Enable', '0');
                    }
                    Form.addParameter('Enable',getCheckVal('cb_enblService'));
                    Form.addParameter('X_CT-COM_ServiceList',serviceList);
                    Form.endPrefix();
                    Form.usingPrefix('x');
                    Form.addParameter('DestinationAddress','PVC:' + vpi + '/' + vci);
                    var ATMQoS = getSelectVal('atmServiceCategory');
                    Form.addParameter('ATMQoS',ATMQoS);
                    Form.addParameter('Enable',1);
                    switch (ATMQoS)
                    {
                    case "ubr+":
                    case "cbr":
                    Form.addParameter('ATMPeakCellRate',getValue('atmPeakCellRate'));
                    break;
                    case "nrt-vbr":
                    case "rt-vbr":
                    Form.addParameter('ATMPeakCellRate',getValue('atmPeakCellRate'));
                    Form.addParameter('ATMSustainableCellRate',getValue('atmSustainedCellRate'));
                    Form.addParameter('ATMMaximumBurstSize',getValue('atmMaxBurstSize'));
                    break;
                    }
                    if (mode == 'Route')
                    {
                    if (ipMode == 'PPPoE')
                    {
                    Form.addParameter('LinkType','EoA');
                    }
                    else if (ipMode == 'PPPoA')
                    {
                    Form.addParameter('LinkType','PPPoA');
                    }
                    else if (ipMode == 'IPoA')
                    {
                    Form.addParameter('LinkType','IPoA');
                    }
                    else if (ipMode == 'CIP')
                    {
                    Form.addParameter('LinkType','CIP');
                    }
                    else
                    {
                    Form.addParameter('LinkType','EoA');
                    }
                    }
                    else if (mode == 'Bridge')
                    {
                    Form.addParameter('LinkType','EoA');
                    }
                    Form.addParameter('ATMEncapsulation',getValue('encapMode'));
                    Form.endPrefix();
                    }
                    function isLinkTypeDiffer(mode,ipMode,vpi,vci,exception)
                    {
                    mode = getSelectVal('wanMode');
                    ipMode = getRadioVal('IpMode');
                    vpi = getValue('atmVpi')
                    vci = getValue('atmVci');
                    var brMode = getSelectVal('bridgeMode');
                    var type = getWanType(mode,ipMode,brMode);
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (Wan[i].atmVpi == vpi && Wan[i].atmVci == vci
                    && (exception == null || exception != i))
                    {
                    if (type != Wan[i].LinkType)
                    {
                    return true;
                    }
                    }
                    }
                    return false;
                    }
                    function getAddWanUrl(CntType)
                    {
                    if (pvcByUseIndex == -1)
                    {
                    url =  'x=InternetGatewayDevice.WANDevice.1.WANConnectionDevice.'
                    + '&y=' + CntType;
                    }
                    else
                    {  
                    var DslDomain = Wan[pvcByUseIndex].Relating.domain;
                    var CntDomain = DslDomain.substr(0,DslDomain.lastIndexOf('.'));
                    url =  'x=' + CntDomain + '&y=' + CntType;
                    }
                    return url;
                    }
                    function AddSubmitParam(Form,type)
                    {
                    if (type == 0)
                    {
                    var DslList = "";
                    var cb_Dsl = getElById('cb_dslEnable');
                    for (i = 0; i < cb_Dsl.length; i++)
                    {
                    if (cb_Dsl[i].checked == true)
                    {
                    if(DslList == "")
                    {
                    DslList += cb_Dsl[i].value;
                    }
                    }
                    }
                    Form.addParameter('InternetGatewayDevice.WANDevice.1.WANDSLInterfaceConfig.ConfigMode', DslList);
                    Form.setAction('set.cgi?RequestFile=html/network/wan1.asp');
                    }
                    else
                    {
                    var url;
                    var mode = getSelectVal('wanMode');
                    var ipMode = getRadioVal('IpMode');
                    var brMode = getSelectVal('bridgeMode');
                    var CntType = getWanType(mode,ipMode,brMode);
                    vpi = getValue('atmVpi')
                    vci = getValue('atmVci');
                    pvcByUseIndex = -1;
                    for (i = 0; i < Wan.length; i++)
                    {
                    if (((Wan[i].atmVpi == vpi && Wan[i].atmVci == vci)) && (i != SelWanIndex))
                    {
                    pvcByUseIndex = i;
                    break;
                    }
                    }
                    if (AddFlag == true)
                    {
                    url = 'addwan.cgi?' + getAddWanUrl(CntType);
                    }
                    else
                    {
                    var temp = Wan[SelWanIndex].domain.split('.');
                    if ((Wan[SelWanIndex].atmVpi != vpi) || (Wan[SelWanIndex].atmVci != vci))
                    {
                    changePVCFlag = true;
                    }
                    else
                    {
                    changePVCFlag = false;
                    }
                    if (Wan[SelWanIndex].domain.indexOf(CntType) < 0)
                    {
                    if (changePVCFlag == true)
                    {
                    if (GetWanIndexPvcByUseEx(Wan[SelWanIndex].atmVpi,
                    Wan[SelWanIndex].atmVci,SelWanIndex) > -1)
                    {
                    wanList = temp[4] + '.' + temp[5] + '.' + temp[6];
                    }
                    else
                    {
                    wanList = temp[4];
                    }
                    url = 'changewantype.cgi?dellist=' + wanList + '&' + getAddWanUrl(CntType);
                    }
                    else
                    {
                    wanList = temp[4] + '.' + temp[5] + '.' + temp[6];
                    url = 'changewantype.cgi?' + getChangeWanTypeUrl(CntType)
                    }
                    }
                    else
                    {
                    if (changePVCFlag == true)
                    {
                    var index = GetWanIndexPvcByUse(vpi,vci);
                    if (index >= 0)
                    {
                    pvcByUseIndex = index;
                    if (GetWanIndexPvcByUseEx(Wan[SelWanIndex].atmVpi,Wan[SelWanIndex].atmVci,SelWanIndex) >=0 )
                    {
                    wanList = temp[4] + '.' + temp[5] + '.' + temp[6];
                    }
                    else
                    {
                    wanList = temp[4];
                    }
                    url = 'changewantype.cgi?' + getChangeWanTypeUrl(CntType);
                    }
                    else
                    {
                    if (GetWanIndexPvcByUseEx(Wan[SelWanIndex].atmVpi,
                    Wan[SelWanIndex].atmVci,SelWanIndex) > -1)
                    {
                    wanList = temp[4] + '.' + temp[5] + '.' + temp[6];
                    url = 'changewantype.cgi?dellist=' + wanList + '&' + getAddWanUrl(CntType);
                    }
                    else
                    {
                    url = 'setcfg.cgi?x=' + Wan[SelWanIndex].Relating.domain
                    + '&y=' + Wan[SelWanIndex].domain
                    + '&RequestFile=html/network/wan1.asp';
                    }
                    }
                    }
                    else
                    {
                    url = 'setcfg.cgi?x=' + Wan[SelWanIndex].Relating.domain
                    + '&y=' + Wan[SelWanIndex].domain
                    + '&RequestFile=html/network/wan1.asp';
                    }
                    }
                    }
                    addParam(Form,mode,ipMode,brMode);
                    Form.setAction(url);
                    setDisable('btnRemoveCnt',1);
                    setDisable('btnOK',1);
                    setDisable('btnAddCnt',1);
                    }
                    }
                       
                    function VLANModeChg()
                    {
                        with (getElById('ConfigForm'))
                        {
                            switch (VLANMode.value)
                            {
                                case 'TAG':
                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                    setDisplay('vlansec', 1);
                                    setDisplay('priosec', 1);
                    <% else %>
                    <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                    setDisplay('vlansec', 1);
                                    setDisplay('priosec', 1);
                    <% else %>
                                    setDisplay('vlansec', 0);
                                    setDisplay('priosec', 0);
                    <% end if %>
                    <% end if %>
                                    vlanId.value = "Yes";
                                    vlanPri.value = "Yes";
                                if ( 0 == v8021P.value.length )
                                    v8021P.value = '0';
                                break;
                    
                                case 'UNTAG':
                                case 'TRANSPARENT':
                                    setDisplay('vlansec', 0);
                                    setDisplay('priosec', 0);
                                    vlanId.value = "No";
                                    vlanPri.value = "No";
                                break;
                    
                                default:
                                break;
                            }
                        }
                    }
                    
                    var isNeedChange = 0;
                    function MTUDispChange()
                    {
                        var mtudescrip = new Array('MTU[128-1492]', 'MTU[576-1500]', 'MTU[128-1492]', 'MTU[1280-1500]','MTU[1320-1492]','MTU[1320-1500]');
                        with (getElById('ConfigForm'))
                        {
                            if ( 'Route' == wanMode.value )
                            {
                                // setDisplay('MTUsec', 1);
                                if (AddFlag == true || isNeedChange)
                                {
                                    // isNeedChange = false;
                                    // if (getSelectVal('linkMode') == 'linkPPP')
                                    //     MTU.value = 1492;
                                    // else
                                    //     MTU.value = 1500;
                                }
                    
                                // if (getSelectVal('InternetMode') == 'PPPoE') {
                                //     setDisplay('MTUsec', 1);
                                // }
                                // else {
                                //     setDisplay('MTUsec', 0);
                                // }
                                setDisplay('MTUsec', 1);
                                var mtu_temp_value ="<%if tcWebApi_get("WanInfo_WanIF","MTU","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MTU","s") end if%>"
                                if (getSelectVal('linkMode') == 'linkPPP')
                                    MTU.value = (mtu_temp_value >1492? 1492:mtu_temp_value);
                                else
                                    MTU.value = mtu_temp_value;
                                if (getSelectVal('linkMode') == 'linkPPP')
                                {
                                    if ('IPv4' == getRadioVal('IpVersion'))
                                        getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[0] + '</div>';
                                    else{
                    <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                                        if (getCheckVal('cb_enabledslite') == 1){
                                            getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[4] + '</div>';	
                                        }else{
                    <% end if %>
                                        getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[2] + '</div>';
                    <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                                }
                    <% end if %>
                                    }
                                }
                                else
                                {
                                    if ('IPv4' == getRadioVal('IpVersion'))			
                                        getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[1] + '</div>';
                                    else{
                    <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                                        if (getCheckVal('cb_enabledslite') == 1){
                                            getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[5] + '</div>';	
                                        }else{
                    <% end if %>
                                        getElement("MIUDescrip").innerHTML = '<div class="form-text">' + mtudescrip[3] + '</div>';		
                    <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                                }
                    <% end if %>
                                    }
                                }
                            }
                        }
                    }
                    
                    function MultiVIDDispChange()
                    {
                        var svrList;
                    
                        with (getElById('ConfigForm'))
                        {
                            svrList = serviceList.value;
                            if ( svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 || svrList.indexOf('IPTV') >= 0 || svrList.indexOf('OTT') >= 0)
                            {
                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                setDisplay('mulvidsec', 1);
                    <% else %>
                    <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                setDisplay('mulvidsec', 1);
                    <% else %>
                                setDisplay('mulvidsec', 0);
                    <% end if %>
                    <% end if %>
                            }
                            else
                            {
                                setDisplay('mulvidsec', 0);
                            }
                        }
                    }
                    
                    function dsliteShow()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                        var ipVer;
                        var svrList;
                        var mode;
                        var addrType;
                    
                        ipVer = getRadioVal('IpVersion');
                        svrList = getSelectVal('serviceList');
                        mode = getSelectVal('wanMode');
                    
                        if ( 'Route' == mode && 
                            'IPv4' != ipVer && svrList.indexOf('INTERNET') >= 0)
                        {
                            setDisplay('dslite_1', 1);
                            var modeObj = document.getElementsByName('dslitemode');
                            if ( modeObj.length >= 2 )
                            {
                                modeObj[0].disabled = false;
                                modeObj[1].disabled = false;
                            }
                            addrType = getSelectVal('IdIpv6AddrType');
                            if ( 'Static' == addrType )
                            {
                                if ( modeObj.length >= 2 )
                                {
                                    modeObj[0].disabled = true;
                                    modeObj[1].checked = true;
                                }
                            }
                            cb_enabledsliteChange();
                        }
                        else
                        {
                            setDisplay('dslite_1', 0);
                            setDisplay('dslite_2', 0);
                            setDisplay('dslite_3', 0);
                        }
                    <%end if%>
                    }
                    
                    function cb_enabledsliteChange()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                        with (getElById('ConfigForm'))
                        {
                            if ( 1 == getCheckVal('cb_enabledslite') )
                            {
                                setDisplay('dslite_2', 1);
                                dslitemodeChange();
                            }
                            else
                            {
                                setDisplay('dslite_2', 0);
                                setDisplay('dslite_3', 0);
                            }
                        }
                        MTUDispChange();
                    <%end if%>
                    }
                    
                    function dslitemodeChange()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                        var mode;
                    
                        with (getElById('ConfigForm'))
                        {
                            mode = getRadioVal("dslitemode");
                            switch (mode)
                            {
                                case '1':
                                    setDisplay('dslite_3', 1);
                                    break;
                                default:
                                    setDisplay('dslite_3', 0);
                                    break;	
                            }
                        }
                     <%end if%>
                    }
                    
                    var pdDefaultSel = 0;
                    function pdEnableShow()
                    {
                        var ipVer;
                        var mode;
                        var svrList;
                    
                        ipVer = getRadioVal('IpVersion');
                        mode = getSelectVal('wanMode');
                        svrList = getSelectVal('serviceList');
                        addrType = getSelectVal('IdIpv6AddrType');
                    
                        if ( 'Route' == mode && 'IPv4' != ipVer
                            && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 || svrList.indexOf('IPTV') >= 0 || svrList.indexOf('OTT') >= 0) )
                        {
                            setDisplay('PDEnableSec', 1);
                            if ( svrList.indexOf('INTERNET') >= 0 && 1 == pdDefaultSel )
                                setCheck('cb_enabledpd', 1);
                            pdDefaultSel = 0;
                            pdModeShow( getCheckVal('cb_enabledpd') );
                        }
                        else
                        {
                            setDisplay('PDEnableSec', 0);
                            pdModeShow(0);
                        }
                    }
                    
                    function cb_pdEnableChange()
                    {
                            var pdEnable = getCheckVal('cb_enabledpd');
                    
                            pdModeShow(pdEnable);
                    }
                    
                    function pdModeShow( show )
                    {
                        addrType = getSelectVal('IdIpv6AddrType');
                    
                        if ( 1 == show )
                        {
                            setDisplay('pdmode_1', 1);
                            var modeObj = document.getElementsByName('pdmode');
                            if ( modeObj.length >= 2 )
                            {
                                modeObj[0].disabled = false;
                                modeObj[1].disabled = false;
                            }
                    
                            if ( 'Static' == addrType )
                            {
                                if ( modeObj.length >= 2 )
                                {
                                    modeObj[0].disabled = true;
                                    modeObj[1].checked = true;
                                }
                            }
                    
                            pdmodeChange();
                        }
                        else
                        {
                            setDisplay('pdmode_1', 0);
                            pdStaticCfgShow(0);
                        }
                    }
                    
                    function pdmodeChange()
                    {
                        var pdmode_sel;
                    
                        pdmode_sel = getRadioVal('pdmode');
                        if ( 'No' == pdmode_sel )
                            pdStaticCfgShow(1);
                        else
                            pdStaticCfgShow(0);
                    }
                    
                    function pdStaticCfgShow( show )
                    {
                        setDisplay('pdmode_2', show);
                        setDisplay('pdmode_3', show);
                        setDisplay('pdmode_4', show);
                    }
                    
                    function CheckPDTime(Time1,Time2)
                    {
                        var TemTime1 = Time1;
                        var TemTime2 = Time2;
                    
                        if ( TemTime1.length > 10 || '' == TemTime1 )
                            return 1;
                        if ( TemTime2.length > 10 || '' == TemTime2 )
                            return 2;
                        if ( true != isPlusInteger(TemTime1))
                            return 1;
                        if ( true != isPlusInteger(TemTime2))
                            return 2;
                    
                        TemTime1 = parseInt(Time1);
                        TemTime2 = parseInt(Time2);
                        if ( TemTime1 > 4294967295 || TemTime1 < 600 )
                            return 1;
                        if ( TemTime2 > 4294967295 || TemTime2 < 600 )
                            return 2;
                        if ( TemTime2 <= TemTime1 )
                                return 3;
                    
                        return true;
                    }
                    
                    var enabledhcpSel = 0;
                    function dhcpEnableShow()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then%>
                        var svrList;
                    
                        svrList = getSelectVal('serviceList');
                    
                        if ( 'TR069' == svrList
                            || 'VOICE' == svrList
                            || 'TR069_VOICE' == svrList )
                        {
                            setDisplay('enabledhcpsec', 0);
                            setCheck('cb_enabledhcp', 0);
                        }
                        else
                        {
                            setDisplay('enabledhcpsec', 1);
                            if ( 1 == enabledhcpSel )
                            {
                                enabledhcpSel = 0;
                                if ( svrList.indexOf('OTHER') >= 0 || svrList.indexOf('IPTV') >= 0 || svrList.indexOf('OTT') >= 0 )
                                    setCheck('cb_enabledhcp', 0);
                                else
                                    setCheck('cb_enabledhcp', 1);
                            }
                        }
                    <%else%>
                        setDisplay('enabledhcpsec', 0);
                        setCheck('cb_enabledhcp', 0);
                    <%end if%>
                    }
                    
                    function pppoeProxyShow()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                        var mode;
                        var linkMode;
                        var svrList;
                    
                        mode = getSelectVal('wanMode');
                        linkMode = getSelectVal('linkMode');
                        svrList = getSelectVal('serviceList');
                    
                        if ( 'Route' == mode && 'linkPPP' == linkMode
                           && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 || svrList.indexOf('IPTV') >= 0 || svrList.indexOf('OTT') >= 0) )
                        {
                            setDisplay('ppp_proxy_bi', 1);
                            ppp_proxy_bi_Change();
                        }
                        else
                        {
                            setDisplay('ppp_proxy_bi', 0);
                            setDisplay('ppp_proxy_user', 0);
                        }
                    <%else%>
                        pppbiShow();
                    <%end if%>
                    }
                    
                    function ppp_proxy_bi_Change()
                    {
                    <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                        var mode;
                    
                        with (getElById('ConfigForm'))
                        {
                            mode = getRadioVal("ppp_proxy_bi_mode");
                    
                            switch ( mode )
                            {
                                case '1':
                                    setDisplay('ppp_proxy_user', 1);
                                    break;
                                default:
                                    setDisplay('ppp_proxy_user', 0);
                                    break;	
                            }
                        }
                    <%end if%>
                    }
                    
                    function pppbiShow()
                    {
                        var mode;
                        var linkMode;
                        var svrList;
                    
                        mode = getSelectVal('wanMode');
                        linkMode = getSelectVal('linkMode');
                        svrList = getSelectVal('serviceList');
                    
                        if ( 'Route' == mode && 'linkPPP' == linkMode
                           && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 || svrList.indexOf('IPTV') >= 0 || svrList.indexOf('OTT') >= 0) )
                            setDisplay('ppp_bi', 1);
                        else
                            setDisplay('ppp_bi', 0);
                    }
                    
                    function ppp_dialMethodChg()
                    {
                    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                        var mode;
                        var linkMode;
                    
                        mode_val = getSelectVal('wanMode');
                        linkMode_val = getSelectVal('linkMode');
                    
                        setDisplay('secIdleTime', 0);
                        setDisplay('secManualDial', 0);
                    
                        with ( getElById('ConfigForm') )
                        {
                            if ( 'Route' == mode_val && 'linkPPP' == linkMode_val )
                            {
                                switch ( getSelectVal('ppp_DialMethod') )
                                {
                                    case 'Connect_on_Demand':
                                        setDisplay('secIdleTime', 1);
                                        if ( 0 == pppTimeOut.value.length )
                                        {
                                            if ( 0 == pppondemand_idletime.value.length )
                                                pppTimeOut.value = '30';
                                            else
                                                pppTimeOut.value = parseInt(pppondemand_idletime.value) / 60;
                                        }
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                    <% end if %>
                    }
                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                    // var cfg_menu_list  = new Array( '宽带设置_mode');
                    // var cfg_cookie_name = 'net-wanset-menu';
                    // init_l_menu();
                    
                    function authModeChange()
                    {
                        with ( document.ConfigForm )
                        {
                            var SecurMode = getSelectVal('wlSecurMode');
                            
                            switch ( SecurMode )
                            {
                                case 'OPEN':
                                    setDisplay("wpapsw", 0);
                                    setDisplay("wlWpaD", 0);
                                    setDisplay("wlKeyIdx", 0);
                                    setDisplay("wlKey", 0);
                                    setDisplay("wlKeyBitD", 0);
                                    break;
                                case 'WEP_OPEN':
                                case 'WEP_SHARED':
                                    setDisplay("wpapsw", 0);
                                    setDisplay("wlWpaD", 0);
                                    setDisplay("wlKeyIdx", 1);
                                    setDisplay("wlKey", 1);
                                    setDisplay("wlKeyBitD", 1);
                                    break;
                                case 'WPAPSK':
                                case 'WPA2PSK':
                                    setDisplay("wpapsw", 1);
                                    setDisplay("wlWpaD", 1);
                                    setDisplay("wlKeyIdx", 0);
                                    setDisplay("wlKey", 0);
                                    setDisplay("wlKeyBitD", 0);
                                    break;
                            }
                        }
                    }
                    
                    function ManualSet()
                    {
                        var vForm = document.ConfigForm;
                    
                        if (getCheckVal('cb_MSEnbl') == 1)
                            vForm.MSEnbl.value = "1";
                        else
                            vForm.MSEnbl.value = "0";
                    }
                    
                    function SyncWlanCFG()
                    {
                        var vForm = document.ConfigForm;
                        
                        if (getCheckVal('cb_SyncWlCFG') == 1)
                            vForm.SyncWlCFG.value = "1";
                        else
                            vForm.SyncWlCFG.value = "0";
                    }
                    
                    function addParameter(Form)
                    {
                        var ssid = getValue('wlanssidap');
                        if ( ssid == '' )
                        {
                            setText('CMCC-QLINK', ssid.value);
                        }
                        
                        if ( ssid.length > 32 )
                        {
                            alert('SSID "' + getValue('wlanssidap') + '" 应小于等于32个字符。');
                            return false;
                        }
                    <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>	
                        if ( isValidAscii(ssid) != '' )
                        {
                            alert("SSID 有无效字符 '" + isValidAscii(wlanssidap.value) + "'。");
                            return false;
                        }
                    <% end if %>	
                        if ( ssid.charAt(ssid.length - 1) == ' ' )
                        {
                            alert("SSID 不能以空字符结束。");
                            return false;
                        }
                        
                        var AuthMode = getSelectVal('wlSecurMode');
                        if ( AuthMode == 'None' )
                        {
                            return true;
                        }
                        else if (( AuthMode == 'Basic_OPEN' ) || ( AuthMode == 'Basic_SHARED' ))
                        {
                            var index = parseInt(getSelectVal('wlKeyIndex'));
                            var wlKeys = getElById('wlKeys');
                            var val = wlKeys.value;
                            var KeyBit = getSelectVal('wlKeyBit');
                            
                            if ( val == '' )
                            {
                                alert('密匙的值不能为空。');
                                return false;
                            }
                            
                            if ( val != '' )
                            {
                                if ( KeyBit == '128' )
                                {
                                    if ( isValidKey(val, 13) == false )
                                    {
                                        alert('密匙 "' + val + '" 无效，请输入 13位 ASCII字符或 26位16进制数作为一个 128-bit WEP 认证密匙。');
                                        return false;
                                    }
                                }
                                else
                                {
                                    if ( isValidKey(val, 5) == false )
                                    {
                                        alert('密匙 "' + val + '" 无效，请输入 5位ASCII字符或 10位16进制数作为一个 64-bit WEP 认证密匙。');
                                        return false;
                                    }
                                }
                            }
                    
                            return true;
                        }
                        
                        return true;
                    }
                    
                    function ACauthModeChange()
                    {
                        with ( document.ConfigForm )
                        {
                            var SecurMode = getSelectVal('wlACSecurMode');
                            
                            switch ( SecurMode )
                            {
                                case 'OPEN':
                                    setDisplay("ACwpapsw", 0);
                                    setDisplay("wlACWpaD", 0);
                                    setDisplay("wlACKeyIdx", 0);
                                    setDisplay("wlACKey", 0);
                                    setDisplay("wlACKeyBitD", 0);
                                    break;
                                case 'WEP_OPEN':
                                case 'WEP_SHARED':
                                    setDisplay("ACwpapsw", 0);
                                    setDisplay("wlACWpaD", 0);
                                    setDisplay("wlACKeyIdx", 1);
                                    setDisplay("wlACKey", 1);
                                    setDisplay("wlACKeyBitD", 1);
                                    break;
                                case 'WPAPSK':
                                case 'WPA2PSK':
                                    setDisplay("ACwpapsw", 1);
                                    setDisplay("wlACWpaD", 1);
                                    setDisplay("wlACKeyIdx", 0);
                                    setDisplay("wlACKey", 0);
                                    setDisplay("wlACKeyBitD", 0);
                                    break;
                            }
                        }
                    }
                    
                    function ACManualSet()
                    {
                        var vForm = document.ConfigForm;
                    
                        if (getCheckVal('cb_ACMSEnbl') == 1)
                            vForm.ACMSEnbl.value = "1";
                        else
                            vForm.ACMSEnbl.value = "0";
                    }
                    
                    function SyncWlanACCFG()
                    {
                        var vForm = document.ConfigForm;
                        
                        if (getCheckVal('cb_SyncWlACCFG') == 1)
                            vForm.SyncWlACCFG.value = "1";
                        else
                            vForm.SyncWlACCFG.value = "0";
                    }
                    
                    function ACaddParameter(Form)
                    {
                        var ssid = getValue('wlanACssidap');
                        if ( ssid == '' )
                        {
                            setText('CMCC-QLINK', ssid.value);
                        }
                        
                        if ( ssid.length > 32 )
                        {
                            alert('SSID "' + getValue('wlanACssidap') + '" 应小于等于32个字符。');
                            return false;
                        }
                    <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>	
                        if ( isValidAscii(ssid) != '' )
                        {
                            alert("SSID 有无效字符 '" + isValidAscii(wlanACssidap.value) + "'。");
                            return false;
                        }
                    <% end if %>
                        if ( ssid.charAt(ssid.length - 1) == ' ' )
                        {
                            alert("SSID 不能以空字符结束。");
                            return false;
                        }
                        
                        var AuthMode = getSelectVal('wlACSecurMode');
                        if ( AuthMode == 'None' )
                        {
                            return true;
                        }
                        else if (( AuthMode == 'Basic_OPEN' ) || ( AuthMode == 'Basic_SHARED' ))
                        {
                            var index = parseInt(getSelectVal('wlACKeyIndex'));
                            var wlKeys = getElById('wlACKeys');
                            var val = wlKeys.value;
                            var KeyBit = getSelectVal('wlACKeyBit');
                            
                            if ( val == '' )
                            {
                                alert('密匙的值不能为空。');
                                return false;
                            }
                            
                            if ( val != '' )
                            {
                                if ( KeyBit == '128' )
                                {
                                    if ( isValidKey(val, 13) == false )
                                    {
                                        alert('密匙 "' + val + '" 无效，请输入 13位 ASCII字符或 26位16进制数作为一个 128-bit WEP 认证密匙。');
                                        return false;
                                    }
                                }
                                else
                                {
                                    if ( isValidKey(val, 5) == false )
                                    {
                                        alert('密匙 "' + val + '" 无效，请输入 5位ASCII字符或 10位16进制数作为一个 64-bit WEP 认证密匙。');
                                        return false;
                                    }
                                }
                            }
                    
                            return true;
                        }
                        
                        return true;
                    }
                    
                    function EnableAPMode()
                    {
                        if(document.ConfigForm.cb_EnableAPMode.checked)
                            document.ConfigForm.APModeEnable.value = "Bridge";
                        else
                            document.ConfigForm.APModeEnable.value = "";
                    }

                    function ajax_submit(time) {
                        clearInterval(timerStatus);
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
						//2022/4/22 Fix : SM Parameter is in form[1]
                        // var params=$('form').eq(0).serialize(); //把form表单里的参数自动封装为参数传递
                        var params=$('form').eq(1).serialize(); //把form表单里的参数自动封装为参数传递
<% else %>
                        var params=$('form').eq(0).serialize(); //把form表单里的参数自动封装为参数传递
<% end if %>
						var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
                        $.ajax({  
                            type: "POST",   //提交的方法
                            url: "/cgi-bin/asp_submit_wan.asp" + query_string, //提交的地址  
                            async: true,
                            data: params,
                            dataType: "text",
                            success: function(data) {
                                showLoading(time, "upgrade2");
                            },
                            error: function(error) {
                                showLoading(3, "upgrade2", "配置失败，请重试……");
                            }
                        });
                    }
                    
                    function btnReSet()
                    {
                        confirm("重置后设备的上网模式会变为桥接模式，确定重置吗？", function(ret) {
                            if(!ret) 
                            {
                                return;
                            }else{
                                document.ConfigForm.Wan_Flag.value = "10";
                                setTimeout(function() {
                                    ajax_submit(20);
                                }, 1000);
                                
                            }
                        });
                    }
                    <% end if %>
                </SCRIPT>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
				<FORM name=ConfigForm action="/cgi-bin/wan_page.asp" method="post">
                    <INPUT type="HIDDEN" name="changeFlag" value="0">
                    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
                        <TBODY>
                            <TR>	
                                <TD valign="bottom">
<% else %>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);Internet_Mode_Select();FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
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
	<div class="in_welcom" >
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="网络->上网设置" name="Selected_Menu"></TD>
	</div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
	<TBODY>
		<TR>
			<TD class="header">
				<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
					<TBODY>
						<TR>
							<TD id=MenuArea_L1></TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>  
		<TR>
			<TD class="content" style="height: 528px;">	
				<FORM name=ConfigForm action="/cgi-bin/wan_page.asp" method="post">
                    <INPUT type="HIDDEN" name="changeFlag" value="0">
                    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
                        <TBODY>
                            <TR>	
                                <TD id=MenuArea_L2>
                                    <ul class="TRD">
                                    <li class="TSD">上网设置</li>
                                    </ul>
                                </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById ('Selected_Menu').value);
                                </SCRIPT>	
                                <TD valign="top">
<% end if %>	

                                    <div class="content-inner">
                                        <div class="page-title">
                                            <script>
                                                if(Obj.Connect_status == '3') {
                                                    document.write(`
                                                        <img src="../img/icon_success.png">
                                                        <span>已成功连接到互联网。</span>
                                                    `);
                                                }
                                                else {
                                                    document.write(`
                                                        <img src="../img/icon_gth_s.png">
                                                        <span>路由器未连接互联网。</span>
                                                    `);
                                                }
                                                timerStatus = setInterval(get_wan_status, 2000);
                                            </script>
                                        </div>
                                        <div class="line-img"></div>
                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="margin: 35px 0 44px 152px;">
                                            <TBODY>
                                                <TR>
                                                    <TD>
                                                        <!-- <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                            <DIV style="display:none;" id="宽带设置_mode_item">
                                                        <% end if %>          -->
                            
                                                        <DIV id=divLink>
                                                            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" 
                                                            border=0>
                                                                <TBODY>
                                                                    <TR>
                                                                        <TD width=150>
                                                                            <div class="form-text">模式选择</div>
                                                                        </TD>
                                                                        <TD>
                                                                            <LABEL id=> 
                                                                                <SELECT id=InternetMode onchange=InternetModeSelect() name="InternetMode">
                                                                                <OPTION value="RouterSetting_AP" id="AP设置" <%if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="Bridge" then asp_Write("selected") end if %>>桥接
                                                                                <OPTION value="DHCP" id="DHCP">路由-自动获取IP(DHCP)
                                                                                <OPTION value="Static" id="Static">路由-手动输入IP(静态IP)
                                                                                <OPTION value="PPPoE" id="PPPoE">路由-宽带拨号上网(PPPoE)
                                                                                <OPTION value="wlSetting_24G" id="24G中继设置" <%if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then asp_Write("selected") end if %>>Wi-Fi中继
                                                                                </SELECT>
                                                                            </LABEL>
                                                                            <script>
                                                                                var InternetMode = document.ConfigForm.InternetMode;
                                                                                <% if TCWebApi_get("APWanInfo_Common","FixedAPMode","h")="Route" then %>
                                                                                    <% if TCWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkIP" then %>
                                                                                        <% if TCWebApi_get("WanInfo_WanIF","ISP","h") = "0" then %>
                                                                                            InternetMode.options[1].selected = 'selected';
                                                                                        <% else %>
                                                                                            InternetMode.options[2].selected = 'selected';
                                                                                        <% end if %>
                                                                                    <% else %>
                                                                                        InternetMode.options[3].selected = 'selected';
                                                                                    <% end if %>
                                                                                <% end if %>
                                                                            </script>
                                                                        </TD>
                                                                    </TR>
                                                                </TBODY>
                                                            </TABLE>
                                                        </DIV>

                                                        <DIV id=wlan_mode style="display: none;">
                                                            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                <TBODY>
                                                                    <TR>
                                                                        <TD></TD>
                                                                        <TD>
                                                                            <div class="font-help" style="width: 389px;">启用Wi-Fi中继模式后，当前设备通过Wi-Fi连接另一台路由器，扩展其Wi-Fi覆盖范围。</div>
                                                                        </TD>
                                                                    </TR>
                                                                    <TR>
                                                                        <TD width=150>
                                                                            <div class="form-text">无线频段</div>
                                                                        </TD>
                                                                        <TD>
                                                                            <LABEL> 
                                                                                <SELECT id=WlanMode name="WlanMode" >
                                                                                <OPTION value="wlan_24G" id="24G_mode" <%if tcWebApi_get("apcli_common","currentRadio","h")="0" then asp_Write("selected") end if %>>2.4G
                                                                                <OPTION value="wlan_5G" id="5G_mode" <%if tcWebApi_get("apcli_common","currentRadio","h")="1" then asp_Write("selected") end if %>>5G
                                                                                <OPTION value="wlan_all" id="all_mode">2.4G/5G
                                                                                </SELECT>
                                                                            </LABEL>
                                                                        </TD>
                                                                    </TR>
                                                                    <TR id="same">
                                                                        <TD id="sameInput">
                                                                            <INPUT id='samePwd' class="input-onoff" type=checkbox name='samePwd'> 
                                                                        </TD>
                                                                        <TD>
                                                                            <div class="font-help" style="width: 279px;">连接成功后，本路由器的Wi-Fi名称和Wi-Fi密码与主路由保持一致。</div>
                                                                        </TD>
                                                                    </TR>
                                                                    <TR id="scan_btn">
                                                                        <TD></TD>
                                                                        <TD>
                                                                            <input type="button" name="btnOK" style="margin: 24px auto;" onclick="scan_action()" value="扫描网络">
                                                                        </TD>
                                                                    </TR>
                                                                </TBODY>
                                                            </TABLE>
                                                        </DIV>
                            
                                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                        <DIV id="宽带设置_item">
                                                            <% end if %> 
                                
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                    <TABLE cellSpacing=0 cellPadding=0 border=0>
                                                            <% else %>
                                                                                    <TABLE cellSpacing=0 cellPadding=0 border=0 style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                                    <TABLE cellSpacing=0 cellPadding=0 border=0>
                                                            <% end if %>
                                                                                        <TBODY>
                                                                                            <TR>
                                                                                                <TD width=150>
                                                                                                    <div class="form-text">连接名称</div>
                                                                                                    <input type="hidden" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
                                                                                                    <input type="hidden" name="WanActive" value="<% tcWebApi_get("WanInfo_WanIF","Active","s") %>">
                                                                                                    <input type="hidden" name="WanCurrIFIdx" value='1'>
                                                            <script language="JavaScript" type="text/JavaScript">
                                                            var ipvChanged = 0;//flag of ip version whether changed
                                
                                                            function InternetModeSelect()
                                                            {
                                                                var InternetMode = getSelectVal('InternetMode');
                                                                switch(InternetMode)
                                                                {
                                                                    case 'DHCP':
                                                                    case 'Static':
                                                                    case 'PPPoE':
                                                                        setDisplay("宽带设置_item",1);
                                                                        setDisplay("中继设置_item",0);
                                                                        setDisplay("AP设置_item",0);
                                                                        setDisplay("wlan_mode",0);
                                                                        linkModeSelect();
                                                                        if (InternetMode == 'DHCP' || InternetMode == 'Static') {
                                                                             document.ConfigForm.linkMode.options[0].selected = 'selected';
                                                                            linkModeSelect();
                                                                            if (InternetMode == 'DHCP') {
                                                                                getElById('ipmode1').checked = true;
                                                                                IpModeChange();
                                                                                setDisplay("dhcp_tips",1);
                                                                                setDisplay("static_tips",0);
                                                                                setDisplay("pppoe_tips",0);
                                                                            }
                                                                            else {
                                                                                getElById('ipmode2').checked = true;
                                                                                IpModeChange();
                                                                                setDisplay("dhcp_tips",0);
                                                                                setDisplay("static_tips",1);
                                                                                setDisplay("pppoe_tips",0);
                                                                            }
                                                                        }
                                                                        else {
                                                                             document.ConfigForm.linkMode.options[1].selected = 'selected';
                                                                            linkModeSelect();
                                                                            setDisplay("dhcp_tips",0);
                                                                            setDisplay("static_tips",0);
                                                                            setDisplay("pppoe_tips",1);
                                                                        }
                                                                        break;
                                                                    case 'wlSetting_24G':
                                                                        setDisplay("宽带设置_item",0);
                                                                        setDisplay("AP设置_item",0);
                                                                        setDisplay("wlan_mode",1);
                                                                        // WlanModeSelect();
                                                                        setDisplay("中继设置_item",1);
                                                                        break;
                                                                    case 'RouterSetting_AP':
                                                                        setDisplay("宽带设置_item",0);
                                                                        setDisplay("中继设置_item",0);
                                                                        setDisplay("AP设置_item",1);
                                                                        setDisplay("wlan_mode",0);
                                                                        break;
                                                                }
                                                            }

                                                            function sameClick(type) {
                                                                var vForm = document.ConfigForm;
                                                                if (type == 0) {
                                                                    if (getElById("samePwd").checked) {
                                                                        vForm.SyncWlCFG_2.value = "1";
                                                                    }
                                                                    else {
                                                                        vForm.SyncWlCFG_2.value = "0";
                                                                    }
                                                                }
                                                                else {
                                                                    if (getElById("samePwd").checked) {
                                                                        vForm.SyncWlCFG_5.value = "1";
                                                                    }
                                                                    else {
                                                                        vForm.SyncWlCFG_5.value = "0";
                                                                    }
                                                                }
                                                            }
                                
                                                            function WlanModeSelect()
                                                            {
                                                                var WlanMode = getSelectVal('WlanMode');
                                                                scmCheckbox.init($('body'));
                                                            }

                                                            function scan_action() {
                                                                <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                if(Obj.Connect_status != '0' && current_mode != "APClient") {
                                                                    alert("请拔掉WAN口网线，并关闭MESH功能！");
                                                                    return false
                                                                }
                                                                else {
                                                                    alert("请先关闭MESH功能！");
                                                                    return false
                                                                }
                                                                <% else %>
                                                                if(Obj.Connect_status != '0' && current_mode != "APClient") {
                                                                    alert("请先拔掉WAN口网线！");
                                                                    return false
                                                                }
                                                                <% end if %>
                                                        
                                                                alert("正在扫描，请等待……", "empty", "upgrade upgrade1", "../img/loading.png");
                                                                var WlanMode = getSelectVal('WlanMode');
                                                                switch(WlanMode)
                                                                {	
                                                                    case 'wlan_24G':
                                                                        scan_req(0);
                                                                        break;
                                                                    case 'wlan_5G':
                                                                        scan_req(1);
                                                                        break;
                                                                    case 'wlan_all':
                                                                        scan_req_all();
                                                                        break;
                                                                }
                                                            }

                                                            function scan_req(type) {
                                                                var urlStr = type == 0 ? "/cgi-bin/wanScan_2.asp" : "/cgi-bin/wanScan_5.asp";

                                                                $.ajax({  
                                                                    type: "GET",   //提交的方法
                                                                    url: urlStr, //提交的地址  
                                                                    async: true,
                                                                    dataType: 'text',
                                                                    success: function(data) {
                                                                        setTimeout(function() {
                                                                            $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                                            setDisplay('scan_btn', 0);
                                                                            setDisplay('scan_again', 1);
                                                                            get_scan_result(type);
                                                                        }, 4000);
                                                                    },
                                                                    error: function(error) {
                                                                        console.log(error);
                                                                    }
                                                                });
                                                            }

                                                            function get_scan_result(type) {
                                                                var urlStr = type == 0 ? "/cgi-bin/wanTimer_2.asp" : "/cgi-bin/wanTimer_5.asp";

                                                                $.ajax({  
                                                                    type: "GET",   //提交的方法
                                                                    url: urlStr, //提交的地址  
                                                                    async: true,
                                                                    dataType: 'text',
                                                                    success: function(data) {
                                                                        if(data.indexOf("value") != -1) {
                                                                            var indexStart = data.indexOf("<script>"),
                                                                                indexEnd = data.indexOf("<\/script>");
                                                                            data = data.substring(indexStart + 8, indexEnd);
                                                                            eval(data);
                                                                            if(value) {
                                                                                var neighbor_list = JSON.parse(value).data;
                                                                                for (var i = 0; i < neighbor_list.length; i++) {
                                                                                    if(neighbor_list[i].Security.indexOf('WEP') >= 0) {
                                                                                        neighbor_list.splice(i, 1);
                                                                                    }
                                                                                }
                                                                                if(neighbor_list) {
                                                                                    setDisplay('scan_list', 1);
                                                                                    list_show(type, neighbor_list);
                                                                                }
                                                                                else {
                                                                                    $("#scan_list").html("");
                                                                                }
                                                                            }
                                                                        }
                                                                    },
                                                                    error: function(error) {
                                                                        console.log(error);
                                                                    }
                                                                });
                                                            }

                                                            function scan_req_all() {
                                                                $.ajax({  
                                                                    type: "GET",   //提交的方法
                                                                    url: "/cgi-bin/wanScan_2.asp", //提交的地址  
                                                                    async: true,
                                                                    dataType: 'text',
                                                                    success: function() {
                                                                        $.ajax({  
                                                                            type: "GET",   //提交的方法
                                                                            url: "/cgi-bin/wanScan_5.asp", //提交的地址  
                                                                            async: true,
                                                                            dataType: 'text',
                                                                            success: function() {
                                                                                setTimeout(function() {
                                                                                    $('.popup-dialog.upgrade1').parent().css("display", "none");
                                                                                    setDisplay('scan_btn', 0);
                                                                                    setDisplay('scan_again', 1);
                                                                                    get_scan_result_all();
                                                                                }, 4000);
                                                                            },
                                                                            error: function(error) {
                                                                                console.log(error);
                                                                            }
                                                                        });
                                                                    },
                                                                    error: function(error) {
                                                                        console.log(error);
                                                                    }
                                                                });
                                                            }

                                                            function get_scan_result_all() {
                                                                var list1 = null,
                                                                    list2 = null;
                                                                $.ajax({  
                                                                    type: "GET",   //提交的方法
                                                                    url: "/cgi-bin/wanTimer_2.asp", //提交的地址  
                                                                    async: true,
                                                                    dataType: 'text',
                                                                    success: function(data) {
                                                                        if(data.indexOf("value") != -1) {
                                                                            var indexStart = data.indexOf("<script>"),
                                                                                indexEnd = data.indexOf("<\/script>");
                                                                            data = data.substring(indexStart + 8, indexEnd);
                                                                            eval(data);
                                                                            if(value) {
                                                                                list1 = JSON.parse(value).data;
                                                                                for (var i = 0; i < list1.length; i++) {
                                                                                    list1[i].type = "0";
                                                                                    if(list1[i].Security.indexOf('WEP') >= 0) {
                                                                                        list1.splice(i, 1);
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    },
                                                                    error: function(error) {
                                                                        console.log(error);
                                                                    }
                                                                });

                                                                $.ajax({  
                                                                    type: "GET",   //提交的方法
                                                                    url: "/cgi-bin/wanTimer_5.asp", //提交的地址  
                                                                    async: true,
                                                                    dataType: 'text',
                                                                    success: function(data) {
                                                                        if(data.indexOf("value") != -1) {
                                                                            var indexStart = data.indexOf("<script>"),
                                                                                indexEnd = data.indexOf("<\/script>");
                                                                            data = data.substring(indexStart + 8, indexEnd);
                                                                            eval(data);
                                                                            list2 = JSON.parse(value).data;
                                                                            if(value) {
                                                                                for (var i = 0; i < list2.length; i++) {
                                                                                    list2[i].type = "1";
                                                                                    if(list2[i].Security.indexOf('WEP') >= 0) {
                                                                                        list2.splice(i, 1);
                                                                                    }
                                                                                }
                                                                            }
                                                                            if(list1 && list2) {
                                                                                setDisplay('scan_list', 1);
                                                                                list_show_all(list1, list2);
                                                                            }
                                                                            else {
                                                                                $("#scan_list").html("");
                                                                            }
                                                                        }
                                                                    },
                                                                    error: function(error) {
                                                                        console.log(error);
                                                                    }
                                                                });

                                                            }

                                                            function list_show(type, neighbor_list) {
                                                                var htmlStr = '';

                                                                for (var i = 0; i < neighbor_list.length; i++) {
                                                                    var arr = neighbor_list[i].Security.split('/');
                                                                    neighbor_list[i].Auth = arr[0];
                                                                    neighbor_list[i].Encryptype = arr[1];

                                                                    var item = neighbor_list[i];

                                                                    htmlStr += '<tr class="tableLi" onclick="select_change(\'' + type + '\', \'' + item.SSID + '\', \'' + item.BSSID + '\', \'' + item.Auth + '\', \'' + item.Encryptype + '\', \'' + item.Ch + '\', \'' + item.Rssi + '\')">    <td class="left-name" style="width: 92%;"><p class="top">' + item.SSID + '</p><p class="bot">' + item.Auth + '</p>    </td>    <td style="width: 8%;"><div class="right-icon ' + (item.Auth == 'OPEN' ? 'open' : '') + '"></div></td></tr>';
                                                                }
                                                                
                                                                $("#scan_list").html(htmlStr);
                                                            }

                                                            function list_show_all(neighbor_list1, neighbor_list2) {
                                                                var htmlStr = '';

                                                                var len = neighbor_list1.length;
                                                                for (var i = 0; i < len; i++) {
                                                                    var arr = neighbor_list1[i].Security.split('/');
                                                                    neighbor_list1[i].Auth = arr[0];
                                                                    neighbor_list1[i].Encryptype = arr[1];

                                                                    var item = neighbor_list1[i];

                                                                    htmlStr += '<tr class="tableLi" onclick="select_change(\'' + item.type + '\', \'' + item.SSID + '\', \'' + item.BSSID + '\', \'' + item.Auth + '\', \'' + item.Encryptype + '\', \'' + item.Ch + '\', \'' + item.Rssi + '\')"><td class="left-name" style="width: 92%;"><p class="top">' + item.SSID + '</p><p class="bot">' + item.Auth + '</p></td><td style="width: 8%;"><div class="right-icon ' + (item.Auth == 'OPEN' ? 'open' : '') + '""></div></td></tr>';
                                                                }

                                                                for (var i = 0; i < neighbor_list2.length; i++) {
                                                                    var arr = neighbor_list2[i].Security.split('/');
                                                                    neighbor_list2[i].Auth = arr[0];
                                                                    neighbor_list2[i].Encryptype = arr[1];

                                                                    var item2 = neighbor_list2[i];

                                                                    htmlStr += '<tr class="tableLi" onclick="select_change(\'' + item2.type + '\' , \'' + item2.SSID + '\', \'' + item2.BSSID + '\', \'' + item2.Auth + '\', \'' + item2.Encryptype + '\', \'' + item2.Ch + '\', \'' + item2.Rssi + '\')"><td class="left-name" style="width: 92%;"><p class="top">' + item2.SSID + '</p><p class="bot">' + item2.Auth + '</p></td><td style="width: 8%;"><div class="right-icon ' + (item2.Auth == 'OPEN' ? 'open' : '') + '""></div></td></tr>';
                                                                }
                                                                
                                                                $("#scan_list").html(htmlStr);
                                                            }

                                                            function select_change(type, SSID, BSSID, Auth, Encryptype, Ch, Rssi) {
                                                                setDisplay('auto', 1);
                                                                setDisplay('manual', 0);
                                                                getElById("connectSSID").value = SSID;                                                      
                                                                if (Auth == "OPEN") {  // OPEN时不填密码
                                                                    getElById("connectPWD").disabled = true;
                                                                }
                                                                else {
                                                                    getElById("connectPWD").disabled = false;
                                                                }
                                                                $("#btnJoin").click(function() {
                                                                    scan_connect(type, SSID, Auth, Encryptype, Rssi);
                                                                });
                                                            }

                                                            function scan_connect(type, ssid, auth, encry, signal) {
                                                                var vForm = document.ConfigForm;
                                                                sameClick(type);
                                                                vForm.rfBand.value = type;
                                                                vForm.wlanssid.value = ssid;
                                                                // if(auth == "WPAPSKWPA2PSK") {
                                                                //     auth = "WPA2PSK";
                                                                // }
                                                                vForm.SecurMode.value = auth;
                                                                if (auth != "OPEN" && getElById("connectPWD").value == "") {
                                                                    $('.popup-dialog.upgrade1').css("display", "none");
                                                                    alert("密码不能为空，请重新输入！");
                                                                    return false
                                                                }
                                                                // if(encry == "TKIPAES") {
                                                                //     encry = "AES";
                                                                // }
                                                                vForm.EncrypType.value = encry;
                                                                vForm.Connecting.value = "1";
                                                                document.ConfigForm.Wan_Flag.value = "5";
                                                                ajax_submit(20);
                                                            }

                                                            function scan_connect_manual() {
                                                                <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                if(Obj.Connect_status != '0') {
                                                                    alert("请拔掉WAN口网线，并关闭MESH功能！");
                                                                    return false
                                                                }
                                                                else {
                                                                    alert("请先关闭MESH功能！");
                                                                    return false
                                                                }
                                                                <% else %>
                                                                if(Obj.Connect_status != '0') {
                                                                    alert("请先拔掉WAN口网线！");
                                                                    return false
                                                                }
                                                                <% end if %>

                                                                var vForm = document.ConfigForm;
                                                                var WlanMode = getSelectVal('WlanMode');
                                                                if (WlanMode == "wlan_24G") {
                                                                    vForm.rfBand.value = 0;
                                                                    sameClick(0);
                                                                }
                                                                else if (WlanMode == "wlan_5G") {
                                                                    vForm.rfBand.value = 1;
                                                                    sameClick(1);
                                                                }
                                                                else {
                                                                    $('.popup-dialog.upgrade1').css("display", "none");
                                                                    alert("请保证选择的无线频段为2.4G或5G！");
                                                                    return false
                                                                }
                                                                vForm.wlanssid.value = getElById("connectSSID").value;
                                                                vForm.Connecting.value = "1";
                                                                document.ConfigForm.Wan_Flag.value = "6";
                                                                ajax_submit(20);
                                                            }

                                                            function CheckIpVersionState()
                                                            {
                                                                var vForm = document.ConfigForm;
                                                                ipvChanged = 0;
                                                                vForm.IPVersionValue.value = "<% tcWebApi_get("WanInfo_WanIF","IPVERSION","s") %>";
                                                                var vValue = getRadioVal("IpVersion");
                                                                if(vForm.IPVersionValue.value != vValue){
                                                                    if(vForm.IPVersionValue.value == "IPv4")
                                                                        ipvChanged = 1;
                                                                    else if(vForm.IPVersionValue.value == "IPv6")
                                                                        ipvChanged = 2;
                                                                    else ipvChanged = 3;
                                                                }
                                                                vForm.IPVersionValue.value = vValue;
                                                                
                                                                with (getElById('ConfigForm'))
                                                                {
                                                                    if(IdIpv6AddrType.value == "SLAAC")
                                                                        pppv6Mode.value = "No";
                                                                    else if(IdIpv6AddrType.value == "DHCP")
                                                                        pppv6Mode.value = "Yes";
                                                                    else
                                                                        pppv6Mode.value = "N/A";	
                                                                }
                                                                
                                                            }
                                                                
                                                            function WanIndexConstruction(domain,WanName)
                                                            {
                                                                this.domain = domain;
                                                                this.WanName = WanName;
                                                            }
                                                            function CheckWansActives()
                                                            {
                                                                var	nCurTemp = 0;
                                                                var	vcurLinks = new Array(nEntryNum);
                                
                                                                for(var i=0; i<nEntryNum; i++)
                                                                {	
                                                                    vcurLinks[nCurTemp++] = new WanIndexConstruction(vEntryIndex[i], vEntryName[i]);
                                                                }
                                                                
                                                                var	vObjRet = new Array(nCurTemp+1);
                                                                for(var m=0; m<nCurTemp; m++)
                                                                {
                                                                    vObjRet[m] = vcurLinks[m];
                                                                }
                                                                vObjRet[nCurTemp] = null;
                                                                return vObjRet;
                                                            }
                                                            var	CurWan = CheckWansActives();
                                                            var WanNameObjs;
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                                var vlength = 0;
                                                            <% end if
                                                            end if
                                                            end if%>
                                
                                                            function WriteWanNameSelected()
                                                            {
                                                                var WanIDNums = CurWan;
                                                                var nlength = WanIDNums.length-1;
                                                                var i = 0;
                                                                var isSel = 0;
                                                                var gotopts = 0;
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                                var str = 0;
                                                            <% end if
                                                            end if
                                                            end if%>
                                                                if(nlength == 1) 
                                                                    document.ConfigForm.curSetIndex.value = WanIDNums[0].domain;
                                                                
                                                                WanNameObjs = new Array(nlength)
                                                                for( i=0; i< nlength; i++)
                                                                {
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                                    str = WanIDNums[i].WanName;
                                                                    if( str.indexOf('TR069') >= 0 )
                                                                    {
                                                                        WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);			
                                                                        vlength++;
                                                                    }
                                                            <%else%>
                                                                    WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);
                                                            <%end if
                                                            else%>
                                                                    WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);
                                                            <%end if
                                                            else%>
                                                            <% if TCWebApi_get("VoIPBasic_Common","VoIPConfig","h" ) = "OMCI" then %>
                                                                    if( WanIDNums[i].WanName.indexOf('VOICE') >= 0 ){
                                                                        continue;
                                                                    }
                                                            <% end if%>
                                                                    WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);
                                                            <% end if%>
                                                                }
                                                                WanNameObjs.sort(WanNameSort);
                                                                
                                                                with (getElById('wanId'))
                                                                {
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                                    for( i=0; i< vlength; i++)
                                                            <%else%>
                                                                    for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if
                                                            else%>
                                                                    for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if
                                                            else%>
                                                                    for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if%>
                                                                    {
                                                                        var opt = new Option(WanNameObjs[i].IfaceName, WanNameObjs[i].IfaceDomain);
                                                                        if ( document.ConfigForm.curSetIndex.value == WanNameObjs[i].IfaceDomain )
                                                                        {
                                                                            opt.selected = true
                                                                            isSel = i;
                                                                        }
                                                                        options.add ( opt );
                                                                        gotopts = 1;
                                                                    }
                                                                    if ( gotopts )
                                                                    {
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                            <%else%>
                                                                        options[isSel].setAttribute('selected', 'true');
                                                            <% end if
                                                            else%>
                                                                        options[isSel].setAttribute('selected', 'true');
                                                            <% end if
                                                            else%>
                                                                        options[isSel].setAttribute('selected', 'true');
                                                            <% end if%>
                                                                    }
                                                                }
                                                            }
                                
                                                            function getIFIdxvidDomain(domain)
                                                            {
                                                                var i = 0;
                                                            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
                                                            if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
                                                            if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
                                                                for( i=0; i< vlength; i++)
                                                            <%else%>
                                                                for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if
                                                            else%>
                                                                for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if
                                                            else%>
                                                                for( i=0; i< WanNameObjs.length; i++)
                                                            <% end if%>
                                                                {
                                                                    if ( domain == WanNameObjs[i].IfaceDomain )
                                                                        return WanNameObjs[i].IfaceIndex;
                                                                }
                                
                                                                return 1;
                                                            }
                                
                                                            function WanNameObject(IFDomain, IFName, IFIdx)
                                                            {
                                                                this.IfaceDomain = IFDomain;
                                                                this.IfaceName = IFName;
                                                                this.IfaceIndex = IFIdx;
                                                            }
                                
                                                            function v4v6BindCheck(curindex, v4BindIdx, v6BindIdx)
                                                            {
                                                            <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                                                                if ( ( curindex == v4BindIdx && (-1 == v6BindIdx ) )
                                                                    || ( curindex == v4BindIdx && curindex == v6BindIdx )
                                                                    || ( curindex == v6BindIdx && (-1 == v4BindIdx ) )
                                                                    || ( curindex == v6BindIdx && curindex == v4BindIdx ) )
                                                                    return 1;
                                
                                                                return 0;
                                                            <%end if%>
                                                            }
                                
                                                            //type: 
                                                            //0: Add action
                                                            //1: Modify action
                                                            function	checkBandBoxStatus(type)
                                                            {
                                                            //lan
                                                                var strCurBind = "";
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                                                                var aCurBindFlag = new Array(12);
                                                            <% else %>
                                                                var aCurBindFlag = new Array(8);
                                                            <% end if %>
                                                                aCurBindFlag[0] = "<% tcWebApi_get("WanInfo_WanIF","LAN1","s") %>";
                                                                if(aCurBindFlag[0] != "N/A")
                                                                {
                                                                    aCurBindFlag[1] = "<% tcWebApi_get("WanInfo_WanIF","LAN2","s") %>";
                                                                    aCurBindFlag[2] = "<% tcWebApi_get("WanInfo_WanIF","LAN3","s") %>";
                                                                    aCurBindFlag[3] = "<% tcWebApi_get("WanInfo_WanIF","LAN4","s") %>";
                                                                    aCurBindFlag[4] = "<% tcWebApi_get("WanInfo_WanIF","SSID1","s") %>";
                                                                    aCurBindFlag[5] = "<% tcWebApi_get("WanInfo_WanIF","SSID2","s") %>";
                                                                    aCurBindFlag[6] = "<% tcWebApi_get("WanInfo_WanIF","SSID3","s") %>";
                                                                    aCurBindFlag[7] = "<% tcWebApi_get("WanInfo_WanIF","SSID4","s") %>";
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                                                                    aCurBindFlag[8] = "<% tcWebApi_get("WanInfo_WanIF","SSID1AC","s") %>";
                                                                    aCurBindFlag[9] = "<% tcWebApi_get("WanInfo_WanIF","SSID2AC","s") %>";
                                                                    aCurBindFlag[10] = "<% tcWebApi_get("WanInfo_WanIF","SSID3AC","s") %>";
                                                                    aCurBindFlag[11] = "<% tcWebApi_get("WanInfo_WanIF","SSID4AC","s") %>";
                                                                    for(k=0; k<12; k++)
                                                            <% else %>
                                                                    for(k=0; k<8; k++)
                                                            <% end if %>
                                                                    {
                                                                        strCurBind = strCurBind + aCurBindFlag[k] + ",";
                                                                    }
                                                                }
                                                                
                                                                var strBindFlag = "";
                                                                var nInterfaces = CurWan.length-1;
                                                                var vForm = document.ConfigForm;
                                                                if(vForm.cb_bindlan1.checked)
                                                                    vForm.bindlan1.value = "Yes";
                                                                else vForm.bindlan1.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindlan1.value + ",";
                                                                if(vForm.cb_bindlan2.checked)
                                                                    vForm.bindlan2.value = "Yes";
                                                                else vForm.bindlan2.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindlan2.value + ",";
                                                                if(vForm.cb_bindlan3.checked)
                                                                    vForm.bindlan3.value = "Yes";
                                                                else vForm.bindlan3.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindlan3.value + ",";
                                                                if(vForm.cb_bindlan4.checked)
                                                                    vForm.bindlan4.value = "Yes";
                                                                else vForm.bindlan4.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindlan4.value + ",";
                                                            //wireless
                                                                if(vForm.cb_bindwireless1.checked)
                                                                    vForm.bindwireless1.value = "Yes";
                                                                else vForm.bindwireless1.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwireless1.value + ",";
                                                                if(vForm.cb_bindwireless2.checked)
                                                                    vForm.bindwireless2.value = "Yes";
                                                                else vForm.bindwireless2.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwireless2.value + ",";
                                                                if(vForm.cb_bindwireless3.checked)
                                                                    vForm.bindwireless3.value = "Yes";
                                                                else vForm.bindwireless3.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwireless3.value + ",";
                                                                if(vForm.cb_bindwireless4.checked)
                                                                    vForm.bindwireless4.value = "Yes";
                                                                else vForm.bindwireless4.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwireless4.value;
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                                                                strBindFlag = strBindFlag + ",No,No,";
                                                            //wireless 5g
                                                                if(vForm.cb_bindwirelessac1.checked)
                                                                    vForm.bindwirelessac1.value = "Yes";
                                                                else vForm.bindwirelessac1.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwirelessac1.value + ",";
                                                                if(vForm.cb_bindwirelessac2.checked)
                                                                    vForm.bindwirelessac2.value = "Yes";
                                                                else vForm.bindwirelessac2.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwirelessac2.value + ",";
                                                                if(vForm.cb_bindwirelessac3.checked)
                                                                    vForm.bindwirelessac3.value = "Yes";
                                                                else vForm.bindwirelessac3.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwirelessac3.value + ",";
                                                                if(vForm.cb_bindwirelessac4.checked)
                                                                    vForm.bindwirelessac4.value = "Yes";
                                                                else vForm.bindwirelessac4.value = "No";
                                                                strBindFlag = strBindFlag + vForm.bindwirelessac4.value;	
                                                            <% end if %>
                                                                var aTemp1 = new Array();
                                                                var aTemp2 = new Array();
                                                                var aTemp3 = new Array();
                                                                
                                                            <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                                                                    if ( 'none' != getElement('ppp_proxy_bi').style.display )
                                                                    {
                                                                        if ( getRadioVal("ppp_proxy_bi_mode") == '1' )
                                                                            return true;
                                                                    }
                                                            <%end if%>
                                                                
                                                                if(vBindStatus != "N/A")
                                                                {
                                                                    aTemp1 = vBindStatus.split(',');
                                                                    aTemp2 = strBindFlag.split(',');
                                                                    aTemp3 = strCurBind.split(',');
                                                                    //check ip version;
                                                                    var strIpversion = vForm.IPVersionValue.value;//current ip version;
                                                            <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                                                                    if ( 'none' != getElement('dslite_1').style.display )
                                                                    {
                                                                        if (getCheckVal('cb_enabledslite') == 1)
                                                                                strIpversion = "IPv4/IPv6";
                                                                    }	
                                                            <%end if%>
                                                                    
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>		
                                                                    for(var i=0; i<14; i++)
                                                            <% else %>
                                                                    for(var i=0; i<8; i++)
                                                            <% end if %>
                                                                    {
                                                                        
                                                                        if((aTemp1[i] == "Yes") && (aTemp2[i] == "Yes"))
                                                                        {
                                                            <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                                                                            if (1 == type) // modify action
                                                                            {
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
                                                                                if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i]))
                                                                                    || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i+1]))
                                                                                    || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[42+2*i]), parseInt(aTemp1[42+2*i+1]))) )
                                                                                    continue;
                                                            <% else %>
                                                                                if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i]))
                                                                                    || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i+1]))
                                                                                    || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[24+2*i]), parseInt(aTemp1[24+2*i+1]))) )
                                                                                    continue;
                                                            <% end if %>
                                                                            }
                                                            <%else%>
                                                                            //continue if it do modify action and the port is bind 
                                                                            if((1 == type) && (aTemp3[i] == "Yes")){
                                                                                if(0 == ipvChanged)//ip version  has not changed
                                                                                    continue;
                                                                                else{
                                                                                    //if("IPv4/IPv6" == strIpversion){
                                                                                        if(3 == ipvChanged){//ipv4/v6->ipv4 or ipv6
                                                                                            continue;
                                                                                        }
                                                                                        else if(1 == ipvChanged){//ipv4->ipv4/ipv6
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                                                                                            if(0 == aTemp1[14+2*i+1])//if ipv6 is not binded, can ok
                                                            <% else %>	
                                                                                            if(0 == aTemp1[8+2*i+1])//if ipv6 is not binded, can ok
                                                            <% end if %>
                                                                                                continue;
                                                                                        }
                                                                                        else if(2 == ipvChanged){//ipv6->ipv4/ipv6
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>								
                                                                                            if(0 == aTemp1[14+2*i])//if ipv4 is not binded, can ok
                                                            <% else %>	
                                                                                            if(0 == aTemp1[8+2*i])//if ipv4 is not binded, can ok
                                                            <% end if %>
                                                                                                continue;
                                                                                        }
                                                                                    //}
                                                                                }
                                                                            }
                                                            <%end if%>
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>				
                                                                            if((("IPv4" == strIpversion) && (0 == aTemp1[14+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[14+2*i+1]))){				
                                                                                continue;
                                                                            }
                                                            <% else %>
                                                                            if((("IPv4" == strIpversion) && (0 == aTemp1[8+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[8+2*i+1]))){
                                                                                continue;
                                                                            }
                                                            <% end if %>					
                                                                            var strindex;
                                                                            if(i < 4)
                                                                            {
                                                                                strindex = i+1;
                                                                                alert("Lan" + strindex.toString() + "已被其它Interface绑定，不能重复绑定！");
                                                                                return;
                                                                            }
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>					
                                                                            else if(i >=4 && i < 8)
                                                                            {
                                                                                strindex = i - 3;
                                                                                alert("SSID" + strindex.toString() + "已被其它Interface绑定，不能重复绑定！");
                                                                                return;
                                                                            }
                                                                            else
                                                                            {
                                                                                strindex = i - 5;
                                                                                <%if TCWebApi_get("WebCustom_Entry","isCTPONCNJSSupported","h" ) = "Yes" then%>
                                                                                <%else%>
                                                                                    alert("SSID" + strindex.toString() + "已被其它Interface绑定，不能重复绑定！");
                                                                                    return;
                                                                                <%end if%>
                                                                            }
                                                            <% else %>
                                                                            else
                                                                            {
                                                                                strindex = i - 3;
                                                                                alert("SSID" + strindex.toString() + "已被其它Interface绑定，不能重复绑定！");
                                                                                return;
                                                                            }
                                                            <% end if %>
                                                                            return false;
                                                                        }
                                                                    }	
                                                                }
                                                                return true;
                                                            }
                                
                                                            function getENCAPstatus()
                                                            {
                                                                with (getElById('ConfigForm'))
                                                                {
                                                                    if(wanMode.value == "Bridge")
                                                                    {
                                                                        ISPTypeValue.value = "3";
                                                                        EnCAPFlag.value = "1483 Bridged IP LLC";
                                                                    }
                                                                    else
                                                                    {
                                                                        if(linkMode.value == "linkPPP")
                                                                        {
                                                                            ISPTypeValue.value = "2";//pppoe mode
                                                                            EnCAPFlag.value = "PPPoE LLC";
                                                                        }
                                                                        else
                                                                            EnCAPFlag.value = "1483 Bridged IP LLC";
                                                                    }
                                                                }
                                                            }
                                
                                                            var isSave = 0;
                                
                                                            <% if tcWebApi_get("WebCustom_Entry", "isIPTVPortBindSupported","h") = "Yes" then %>
                                                            function setIPTVBindInfo(saveflag)
                                                            {
                                                                var bindVal = "";
                                                                for ( var i = 0; i < 3; i++ )
                                                                {
                                                                    var elmName = "iptv_bindlan" + saveflag + "_" + (i+1);
                                                                    if ( getCheckVal(elmName) )
                                                                    {
                                                                        bindVal += "1"
                                                                    }
                                                                    else
                                                                    {
                                                                        bindVal += "0"
                                                                    }
                                                                }
                                
                                                                setText("iptvportbind_h"+saveflag, bindVal);
                                                            }
                                                            <% end if %>
                                                            
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            function btnSave(saveflag)
                                                            <% else %>
                                                            function btnSave()
                                                            <%end if%>													
                                                            {
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                var heartbeat = "<% tcwebApi_get("alinkmgr_Entry","heartBeatTime","s") %>";
                                                                var EthernetState = "<% tcwebApi_get("WanInfo_Common","EthernetState","s") %>";
                                                                if(saveflag == 0)
                                                                {
                                                            <%end if%>	
                                                                    if( isSave )
                                                                        return;
                                                                    if(CheckForm(1) == false)
                                                                        return false;
                                                                    getENCAPstatus();
                                                                    CheckIpVersionState();
                                                                    cb_enblServiceChange();
                                                                    EnableDHCPRealy();
                                                                    var	vForm = document.ConfigForm;
                                
                                                                    if(vForm.linkMode.value == "linkPPP")
                                                                    {
                                                                        DialMethodChange();
                                                                        setText('pppManualStatus_Flag', 'disconnect');
                                                                    }
                                                                    vForm.Wan_Flag.value = "1";
                                                                    if(AddFlag == true){
                                                                        vForm.OperatorStyle.value = "Add";//add new
                                                                        if(checkBandBoxStatus(0) == false)
                                                                            return false;
                                                                        vForm.WanCurrIFIdx.value = getMaxIFIdx();
                                                                    }
                                                                    else{
                                                                        vForm.OperatorStyle.value = "Modify";//modify
                                                                        if(checkBandBoxStatus(1) == false)
                                                                            return false;
                                                                    }
                                                                    // cmcc customer need the button as enable state.
                                                                    //setDisable('btnRemoveCnt',1);
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                                                    setDisable('btnOK',1);
                                                            <% else %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                    setDisable('btnOK',1);
                                                            <% end if %>
                                                                    if(EthernetState != "up")
                                                                    {
                                                                        //alert("请连接wan口！");
                                                                    }
                                                            <%end if%>													
                                                                    //setDisable('btnAddCnt',1);
                                                                    isSave = 1;
                                                                    // confirm("该配置会导致设备重启，确定保存吗？", function(ret) {
                                                                    //         if(ret)
                                                                    //         {
                                                                    //             document.ConfigForm.changeFlag.value = "1";
                                                                    //             ajax_submit(20);
                                                                    //         }
                                                                    //         else {
                                                                    //             location.reload();
                                                                    //         }
                                                                    //     });
                                                                    document.ConfigForm.changeFlag.value = "1";
                                                                    ajax_submit(20);
                                                                    
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                }
                                                                else if(saveflag == 1)
                                                                {
                                                                    document.ConfigForm.Wan_Flag.value = "5";
                                                                    addParameter(vForm);
                                                                    // confirm("该配置会导致设备重启，确定保存吗？", function(ret) {
                                                                    //         if(ret)
                                                                    //         {
                                                                    //             document.ConfigForm.changeFlag.value = "1";
                                                                    //             ajax_submit(20);
                                                                    //         }
                                                                    //         else {
                                                                    //             location.reload();
                                                                    //         }
                                                                    //     });
                                                                    document.ConfigForm.changeFlag.value = "1";
                                                                    ajax_submit(20);
                                                                    
                                                                }
                                                                else if(saveflag == 2)
                                                                {
                                                                    document.ConfigForm.Wan_Flag.value = "6";
                                                                    ACaddParameter(vForm);
                                                                    // confirm("该配置会导致设备重启，确定保存吗？", function(ret) {
                                                                    //         if(ret)
                                                                    //         {
                                                                    //             document.ConfigForm.changeFlag.value = "1";
                                                                    //             ajax_submit(20);
                                                                    //         }
                                                                    //         else {
                                                                    //             location.reload();
                                                                    //         }
                                                                    //     });
                                                                    document.ConfigForm.changeFlag.value = "1";
                                                                    ajax_submit(20);
                                                                    
                                                                }
                                                                else if ( saveflag == 3 )
                                                                {
                                                                    var currmode = "<% tcwebApi_get("WanInfo_Common","CurAPMode","s") %>";
                                                                    if ( currmode == "Bridge" )
                                                                    {
                                                                        /*alert("当前已经AP模式上线");
                                                                        return;*/
                                                                    }
                                                                    /*
                                                                    if (document.ConfigForm.cb_EnableAPMode.checked)
                                                                    {
                                                                        if(EthernetState != "up")
                                                                        {
                                                                            alert("请检查WAN口是否正常连接");
                                                                            return;
                                                                        }
                                                                        document.ConfigForm.APModeEnable.value = "Bridge";
                                                                    }
                                                                    else
                                                                    {
                                                                        document.ConfigForm.APModeEnable.value = "";
                                                                    }*/
                                                            <% if tcWebApi_get("WebCustom_Entry", "isIPTVPortBindSupported","h") = "Yes" then %>
                                                                    setIPTVBindInfo(saveflag);
                                                            <% end if %>
                                                                    document.ConfigForm.changeFlag.value = "1";
                                                                    document.ConfigForm.Wan_Flag.value = "9";
                                                                    ajax_submit(20);
                                                                    // confirm("该配置会导致设备重启，确定保存吗？", function(ret) {
                                                                    //         if(ret)
                                                                    //         {
                                                                    //             document.ConfigForm.changeFlag.value = "1";
                                                                    //             document.ConfigForm.Wan_Flag.value = "9";
                                                                    //             ajax_submit(20);
                                                                    //         }
                                                                    //         else {
                                                                    //             location.reload();
                                                                    //         }
                                                                    //     });
                                                                }
                                                            <%end if%>												
                                                            }
                                
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            function wpsbtn(wpsflag)
                                                            {
                                                                    if(wpsflag == 1)
                                                                    {
                                                                        document.ConfigForm.Wan_Flag.value = "7";
                                                                        //document.ConfigForm.submit();
                                                                        ajax_submit(20);
                                                                    }
                                                                    else if(wpsflag == 2)
                                                                    {
                                                                        document.ConfigForm.Wan_Flag.value = "8";
                                                                        //document.ConfigForm.submit();
                                                                        ajax_submit(20);
                                                                    }
                                                            }
                                                            <% end if %>
                                
                                                            function btnAddWanCnt()
                                                            {
                                                                if ((CurWan.length-1) >= 8)
                                                                {
                                                                    alert("您最多只能建立8条WAN连接！");
                                                                    return;
                                                                }
                                                                if (AddFlag == true)
                                                                {
                                                                    alert("请您保存新建连接后再进行新的添加！");
                                                                    return;
                                                                }
                                                            <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
                                                                LockTR69Node(0);
                                                            <% end if %>
                                                                AddFlag = true;
                                                                resetText();
                                                                with (getElById('ConfigForm'))
                                                                {
                                                                    AddOption(getElementByName('wanId'),-1,'新建WAN连接',true);
                                                                    btnAddCnt.disabled = true;
                                                                    setSelect('linkMode', 'linkPPP');	
                                                            <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
                                                                    isAddBtnClick = 1;
                                                                    ServiceListLoad(1);
                                                            <% end if %>
                                                                    setSelect('serviceList','INTERNET');
                                                                    setText('ConnectionFlag', "Connect_Keep_Alive");
                                                                    setCheck('cb_enblService',1);
                                                                    setSelect('wanMode',"Route");
                                                                    setSelect('bridgeMode', "PPPoE_Bridged");
                                                            <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                                                                    setSelect('ppp_DialMethod', "Connect_Keep_Alive");
                                                                    pppTimeOut.value = 30;
                                                                    pppondemand_idletime.value = parseInt(pppTimeOut.value) * 60;
                                                            <% end if %>
                                                                    lockObj('pppUserName',false);
                                                                    lockObj('pppPassword',false);
                                                                    lockObj('vlan',false);
                                                                    SelWanIndex = -1;
                                                                    enabledhcpSel = 1;
                                                                    WanModeChange();
                                                                    onChangeSvrList();
                                                                    IpMode[2].checked = true;
                                                                    IpModeChange();
                                                                    VLANModeChg();
                                                                    DOT1PShow();
                                                                    for (var i = 0; i < 4; i++)
                                                                    {
                                                                        var checkString = 'cb_bindlan' + (i+1);
                                                                        setCheck(checkString,0);
                                                                        checkString = 'cb_bindwireless' + (i+1);
                                                                        setCheck(checkString,0);
                                                            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	  			
                                                                        checkString = 'cb_bindwirelessac' + (i+1);
                                                                        setCheck(checkString,0);
                                                            <% end if %>			
                                                                    }
                                                                    setRadio('pdmode', 'Yes');
                                                            <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
                                                                    setText('wanhwaddress', '00:00:00:00:00:00');
                                                            <%end if%>
                                                                    document.getElementById("table8").focus();
                                                                }
                                                            }
                                                            function btnRemoveWanCnt()
                                                            {
                                                                if ((CurWan.length - 1) == 0)
                                                                {
                                                                    alert("无法删除，您未添加任何WAN连接！");
                                                                    return;
                                                                }
                                                                if (AddFlag == true)
                                                                {
                                                                    alert("新建WAN连接并未保存，不能进行删除操作！");
                                                                    return;
                                                                }
                                                                confirm("您是否确认要删除此条WAN连接？", function(ret){
                                                                    if(ret){
                                                                        var	vForm = document.ConfigForm;
                                                                        vForm.Wan_Flag.value = "3";
                                                                        for(var i=0; i<(CurWan.length-1); i++)
                                                                        {
                                                                            if(CurWan[i].domain == vForm.curSetIndex.value)
                                                                            {
                                                                                if ( CurWan[i].WanName.indexOf('TR069') >= 0 )
                                                                                {
                                                                                    vForm.DelTR069_Flag.value = "1";	
                                                                                }
                                                                            }
                                                                        }
                                
                                                                        for(var i=0; i<(CurWan.length-1); i++)
                                                                        {
                                                                            if(CurWan[i].domain != vForm.curSetIndex.value)
                                                                            {
                                                                                vForm.afterdeleteFlag.value = CurWan[i].domain;
                                                                                break;
                                                                            }
                                                                        }
                                                                        setDisable('btnRemoveCnt',1);
                                                                        setDisable('btnOK',1);
                                                                        setDisable('btnAddCnt',1);
                                                                        vForm.OperatorStyle.value = "Del";
                                                                        //vForm.submit();
                                                                        ajax_submit(20);
                                                                    }
                                                                });
                                
                                                            }
                                
                                                            function OnIPv6Changed()
                                                            {
                                                            with (getElById('ConfigForm'))
                                                            {
                                                                var linkstr = getSelectVal('linkMode');
                                                                var AddrType = getSelectVal('IdIpv6AddrType');
                                                                if (AddrType == 'SLAAC')
                                                                {
                                                                            setDisplay('TrIpv6Addr', 0);
                                                                            setDisplay('TrIpv6Dns1', 0);
                                                                            setDisplay('TrIpv6Dns2', 0);
                                                                            setDisplay('TrIpv6GatewayInfo', 0);
                                                                            setDisplay('TrIpv6Gateway', 0);
                                                                            ISPTypeValue.value = "0";
                                                                }
                                                                else if (AddrType == 'DHCP')
                                                                {
                                                                            setDisplay('TrIpv6Addr', 0);
                                                                            setDisplay('TrIpv6Dns1', 0);
                                                                            setDisplay('TrIpv6Dns2', 0);
                                                                            setDisplay('TrIpv6Gateway', 1);
                                                                            setDisplay('TrIpv6GatewayInfo', 1);
                                                                            ISPTypeValue.value = "0";
                                                                }
                                                                else if (AddrType == 'Static')
                                                                {
                                                                            setDisplay('TrIpv6Addr', 1);
                                                                            setDisplay('TrIpv6Dns1', 1);
                                                                            setDisplay('TrIpv6Dns2', 1);
                                                                            setDisplay('TrIpv6Gateway', 1);
                                                                            setDisplay('TrIpv6GatewayInfo', 1);
                                                                            ISPTypeValue.value = "1";
                                                                }
                                                                dsliteShow();
                                                                pdEnableShow();
                                                            }
                                                            }
                                                            function WriteIPv6List(index)
                                                            {
                                                                var vmode = new Array("No", "Yes", "N/A");
                                                                var ctrl = getElById('IdIpv6AddrType');
                                                                for(var i=0; i<ctrl.options.length;)
                                                                {
                                                                    ctrl.removeChild(ctrl.options[i]);
                                                                }
                                                                if(index == 0)
                                                                {
                                                                    var aMenu = new Array("SLAAC","DHCP");
                                                                    for(i=0; i<aMenu.length; i++)
                                                                    {
                                                                        ctrl.options.add(new Option(aMenu[i],aMenu[i]));
                                                                        if(vCurrentDHCPv6 == vmode[i])
                                                                        {
                                                                            document.ConfigForm.IdIpv6AddrType.selectedIndex = i;
                                                                        }
                                                                    }
                                                                }
                                                                else if(index == 1)
                                                                {
                                                                    var aMenu = new Array("SLAAC","DHCP","Static");
                                                                    for(i=0; i<aMenu.length; i++)
                                                                    {
                                                                        ctrl.options.add(new Option(aMenu[i],aMenu[i]));
                                                                        if(vCurrentDHCPv6 == vmode[i])
                                                                        {
                                                                            document.ConfigForm.IdIpv6AddrType.selectedIndex = i;
                                                                        }
                                                                    }
                                                                }
                                                                else if(index == 2)
                                                                {
                                                                    var aMenu = "Static";
                                                                    ctrl.options.add(new Option(aMenu,aMenu));
                                                                }
                                                                OnIPv6Changed();
                                                            }
                                
                                                            function WanIdChange()
                                                            {
                                                                document.ConfigForm.Wan_Flag.value  = "2";
                                                                document.ConfigForm.curSetIndex.value = 0;
                                                                $("form[name='ConfigForm']").submit();
                                                            }
                                
                                                            <% if tcWebApi_get("WebCustom_Entry", "isIPTVPortBindSupported","h") = "Yes" then %>	
                                                            function doIPTVActive(flag)
                                                            {
                                                                if ( getCheckVal("iptvEbl_s" + flag) )
                                                                {
                                                                    setText("iptvEbl_h" + flag, "Yes");
                                                                }
                                                                else
                                                                {
                                                                    setText("iptvEbl_h" + flag, "No");		
                                                                }
                                                            }
                                
                                                            function createIPTVBindList(flag)
                                                            {
                                                                var i = 0;
                                                                
                                                                var rsp = JSON.parse(iptvinfo);
                                                                var iptvinfo_list = rsp.data;
                                                                var iptvActive = "" + iptvinfo_list[0]['Active'];
                                                                var iptvLanportStr = "" + iptvinfo_list[0]['LAN'];
                                                                var iptvWlan24gportStr = "" + iptvinfo_list[0]['WLAN24G'];
                                                                var iptvWlan5gportStr = "" + iptvinfo_list[0]['WLAN5G'];
                                                                var html = "";
                                                                
                                                                html += '<TR><TD align="center" width="25%">Enable IPTV</TD>';
                                                                html += '<TD><input type="checkbox" id="iptvEbl_s' + flag + '" name="iptvEbl_s' + flag + '" onclick="doIPTVActive('+flag+')">';
                                                                html += '<input type="hidden" id="iptvEbl_h' + flag + '" name="iptvEbl_h' + flag + '" value="No">';
                                                                html += '<input type="hidden" id="iptvportbind_h' + flag + '" name="iptvportbind_h' + flag + '" value="0"></TD></TR>';
                                                                html += '<TR><TD align="center" width="25%">VLANID</TD>';
                                                                html += '<TD><input type="text" size="5" id="iptvVlanid_s' + flag + '" name="iptvVlanid_s' + flag + '" value="0"></TD></TR>';
                                                                html += '<TR><TD width=150><div class="form-text">绑定选项</div></TD><TD colspan="4">';
                                                                for ( i = 0; i < 3; i++ )
                                                                {
                                                                    html += '<INPUT id="iptv_bindlan' + flag + '_' + (i+1) + '" type=checkbox name="iptv_bindlan' + flag + '_' + (i+1) + '">LAN' + (i+1);
                                                                }
                                                                html += '</TD></TR>'
                                
                                                                document.write(html);
                                                                
                                                                if ( iptvActive == "Yes" )
                                                                {
                                                                    setCheck("iptvEbl_s" + flag, 1);
                                                                }
                                                                else
                                                                {
                                                                    setCheck("iptvEbl_s" + flag, 0);
                                                                }
                                                                
                                                                if ( parseInt(iptvvlanid) >= 0 )
                                                                {
                                                                    setText("iptvVlanid_s" + flag,  iptvvlanid);
                                                                }
                                
                                                                if ( iptvLanportStr != "" )
                                                                {
                                                                    for ( var i = 0; i < 3; i++ ) 
                                
                                                                    {
                                                                        var elmName = "iptv_bindlan" + flag + "_" + (i+1);
                                                                        if ( iptvLanportStr.charAt(i) == '1' )
                                                                        {
                                                                            setCheck(elmName, 1);
                                                                        }
                                                                        else
                                                                        {
                                                                            setCheck(elmName, 0);
                                                                        }
                                                                    }
                                                                }
                                
                                                                doIPTVActive(flag);		
                                                            }
                                                            <% end if %>
                                                            </script>
                                                                                                </TD>
                                                                                                <TD class="newselect">
                                                                                            <select onChange=WanIdChange()  name=wanId id='wanId' >
                                                                                            </select>
                                                                                                <script language=JavaScript type=text/javascript>
                                                                                            WriteWanNameSelected();
                                                                                            </script></TD>
                                                                                        <!-- </TR>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                            <TR>
                                                            <% else %>
                                                                                            <TR style='display:none'>
                                                            <% end if %>
                                                            <% else %>
                                                                                            <TR>
                                                            <% end if %> -->
                                                                                            <TD>
                                                                                                <P align=center>
                                                                                                    <button id=btnAddCnt onclick="btnAddWanCnt()" name=btnAddCnt  style="width: 140px;margin-left: 210px;">新 建</button>
                                                                                                </P>
                                                                                            </TD>
                                                                                            <input type="hidden" name="Wan_Flag" value="0">
                                                                                            <input type="hidden" name="DelTR069_Flag" value="0">
                                                                                            <input type="hidden" name="EnCAPFlag" value="PPPoE">
                                                                                            <input type="hidden" name="PPPGetIpFlag" value="Dynamic">
                                                                                            <input type="hidden" name="ConnectionFlag" value="<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>">
                                                                                            <input type="hidden" name="Enable_Flag" value="Yes">
                                                                                            <input type="hidden" name="Disable_Flag" value="No">
                                                                                            <input type="hidden" name="afterdeleteFlag" value="0">
                                                                                            <input type="hidden" name="OperatorStyle" value="Modify">
                                                                                            <input type="hidden" name="dhcpv6pdflag" value="Yes">
                                                                                            <input type="hidden" name="pppManualStatus_Flag" value="<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>">
                                                                                        </TR>
                                                                                    </TBODY></TABLE>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                            <% else %>
                                                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                            <% end if %>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">模式</div>
                                                                                </TD>
                                                                                <TD width=200><LABEL>
                                                            <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                                                                                        <select id=wanMode onChange=WanModeSelect() name="wanMode" style='display:none'>
                                                                                                <option value="Route" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Route" then asp_Write("selected") end if%>>Route 
                                                                                                <option value="Bridge" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Bridge" then asp_Write("selected") end if%>>Bridge 
                                                                                            </select>
                                                                                                        <select id=wanModeShow onChange=WanModeSelect() name="wanModeShow" disabled='true'>
                                                                                                <option value="Route" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Route" then asp_Write("selected") end if%>>Route 
                                                                                                <option value="Bridge" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Bridge" then asp_Write("selected") end if%>>Bridge 
                                                                                            </select>
                                                            <% else %>
                                                                                                        <select id=wanMode onChange=WanModeSelect() name="wanMode">
                                                                                                <option value="Route" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Route" then asp_Write("selected") end if%>>Route 
                                                                                                <option value="Bridge" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Bridge" then asp_Write("selected") end if%>>Bridge 
                                                                                            </select>
                                                            <% end if %>
                                                                                            </LABEL>
                                                                            </TD>
                                                                                            <TD>
                                                                                                <div class="form-text">启用</div>
                                                                                            <LABEL>
                                                                                            <INPUT id=cb_enblService onclick=cb_enblServiceChange() type=checkbox name=cb_enblService <%if tcWebApi_get("WanInfo_WanIF","Active","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                <input id=enblService type=hidden name="enblService">
                                                                                            </LABEL></TD></TR></TBODY></TABLE>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                            <% end if %>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">承载业务</div>
                                                                                </TD>
                                                                                <TD><LABEL>
                                                            <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                                                                    <SELECT id=serviceList onchange=onSelectSvrList() name=serviceList style='display:none'> 
                                                                                            </SELECT>
                                                                                    <SELECT id=serviceListShow onchange=onSelectSvrList() name=serviceListShow disabled='true'> 
                                                                                            </SELECT>
                                                            <% else %>
                                                                                    <SELECT id=serviceList onchange=onSelectSvrList() name=serviceList> 
                                                                                            </SELECT>
                                                            <% end if %>
                                                                                            </LABEL>
                                                                            </TD>
                                                                                            <TD></TD></TR></TBODY></TABLE>
                                
                                                                            <TABLE style="DISPLAY: none" height=32 cellSpacing=0 
                                                                            cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150 height="32">
                                                                                    <div class="form-text">启用绑定</div>
                                                                                </TD>
                                                                                <TD width=306><LABEL> 
                                                                                            <INPUT id=cb_bindflag onclick=cb_bindflagChange() type=checkbox name="cb_bindflag" <%if tcWebApi_get("WanInfo_WanIF","BandActive","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                            <INPUT id=bindflag type=hidden value="<%tcWebApi_get("WanInfo_WanIF","BandActive","s") %>" name="bindflag">
                                                                                            </LABEL></TD></TR></TBODY></TABLE>
                                                                            <DIV id=secBind>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0>
                                                            <% end if %>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150 >
                                                                                    <div class="form-text">绑定选项</div>
                                                                                </TD>
                                                                                <TD colspan="4">
                                                                                    <SPAN id=secLan1>
                                                                                    <INPUT id=cb_bindlan1 type=checkbox name=cb_bindlan1 <%if tcWebApi_get("WanInfo_WanIF","LAN1","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    LAN1 
                                                                                                            <INPUT id=bindlan1 type=hidden value=0 name=bindlan1> 
                                                                                                            </SPAN> &nbsp; 
                                                                                    <SPAN id=secLan2>
                                                                                                            <INPUT id=cb_bindlan2 type=checkbox  name=cb_bindlan2 <%if tcWebApi_get("WanInfo_WanIF","LAN2","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    LAN2 
                                                                                                            <INPUT id=bindlan2 type=hidden value=0 name=bindlan2> 
                                                                                                            </SPAN> &nbsp;
                                                                                    <SPAN id=secLan3>
                                                                                    <INPUT id=cb_bindlan3 type=checkbox name=cb_bindlan3 <%if tcWebApi_get("WanInfo_WanIF","LAN3","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    LAN3 
                                                                                    <INPUT id=bindlan3 type=hidden value=0 name=bindlan3> 
                                                                                    </SPAN> &nbsp;
                                                                                    <SPAN id=secLan4>
                                                                                                            <INPUT id=cb_bindlan4 type=checkbox name=cb_bindlan4 <%if tcWebApi_get("WanInfo_WanIF","LAN4","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    LAN4 
                                                                                                            <INPUT id=bindlan4 type=hidden value=0 name=bindlan4>
                                                                                    </SPAN>
                                                                                    </TD>
                                                                                </TR>
                                                                                </TBODY>
                                                                            </TABLE>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanBindTab">
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanBindTab" style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanBindTab">
                                                            <% end if %>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150 >&nbsp;</TD>
                                                                                <TD colspan="4">
                                                                                    <SPAN id=secWireless1>
                                                                                    <INPUT id=cb_bindwireless1  type=checkbox name=cb_bindwireless1 <%if tcWebApi_get("WanInfo_WanIF","SSID1","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    SSID1
                                                                                    <INPUT id=bindwireless1 type=hidden value=0 name=bindwireless1> 
                                                                                    </SPAN> &nbsp; 
                                                                                    <SPAN id=secWireless2>
                                                                                    <INPUT id=cb_bindwireless2 type=checkbox name=cb_bindwireless2 <%if tcWebApi_get("WanInfo_WanIF","SSID2","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    SSID2
                                                                                    <INPUT id=bindwireless2 type=hidden value=0 name=bindwireless2>
                                                                                    </SPAN> &nbsp;
                                                                                    <SPAN id=secWireless3>
                                                                                    <INPUT id=cb_bindwireless3 type=checkbox name=cb_bindwireless3 <%if tcWebApi_get("WanInfo_WanIF","SSID3","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    SSID3 
                                                                                    <INPUT id=bindwireless3 type=hidden value=0 name=bindwireless3> 
                                                                                    </SPAN> &nbsp; 
                                                                                    <SPAN id=secWireless4>
                                                                                    <INPUT id=cb_bindwireless4 type=checkbox name=cb_bindwireless4 <%if tcWebApi_get("WanInfo_WanIF","SSID4","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                    SSID4 
                                                                                    <INPUT id=bindwireless4 type=hidden value=0 name=bindwireless4> 
                                                                                    </SPAN></TD>
                                                                                </TR>
                                                                                </TBODY>
                                                                            </TABLE>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanacBindTab">
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanacBindTab" style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                            <TABLE cellSpacing=0 cellPadding=0 border=0 id="wlanacBindTab">
                                                            <% end if %>
                                                                                        <TBODY>
                                                                                           <TR>
                                                                                                    <TD width=150 >&nbsp;</TD>
                                                                                                    <TD colspan="4">
                                                                                                    <SPAN id=secWirelessac1>
                                                                                                        <INPUT id=cb_bindwirelessac1 type=checkbox name=cb_bindwirelessac1 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC1","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                        SSIDAC1
                                                                                                        <INPUT id=bindwirelessac1 type=hidden value=0 name=bindwirelessac1> 
                                                                                            </SPAN> &nbsp; 
                                                                                                    <SPAN id=secWirelessac2>
                                                                                                        <INPUT id=cb_bindwirelessac2 type=checkbox name=cb_bindwirelessac2 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC2","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                        SSIDAC2
                                                                                                        <INPUT id=bindwirelessac2 type=hidden value=0 name=bindwirelessac2> 
                                                                                                    </SPAN> &nbsp; 
                                                                                                    <SPAN id=secWirelessac3>
                                                                                                        <INPUT id=cb_bindwirelessac3 type=checkbox name=cb_bindwirelessac3 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC3","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                        SSIDAC3
                                                                                                        <INPUT id=bindwirelessac3 type=hidden value=0 name=bindwirelessac3> 
                                                                                                    </SPAN> &nbsp; 
                                                                                                    <SPAN id=secWirelessac4>
                                                                                                        <INPUT id=cb_bindwirelessac4 type=checkbox name=cb_bindwirelessac4 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC4","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                        SSIDAC4
                                                                                                        <INPUT id=bindwirelessac4 type=hidden value=0 name=bindwirelessac4> 
                                                                                                    </SPAN>
                                                                                                    </TD>
                                                                                    </TR>
                                                                                    </TBODY>
                                                                                    </TABLE>
                                                                                        </DIV>
                                                                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                    <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                        <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0 id='enabledhcpsec'>
                                                                                            <% else %>
                                                                                            <TABLE height=0 cellSpacing=0 cellPadding=0 width="100%" border=0 id='enabledhcpsec'>
                                                                    <% end if %>
                                                                    <% else %>
                                                                                            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0 id='enabledhcpsec'>
                                                                    <% end if %>
                                                                                            <TBODY>
                                                                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                    <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                            <TR>
                                                                    <% else %>
                                                                                            <TR style='display:none'>
                                                                    <% end if %>
                                                                    <% else %>
                                                                                            <TR>
                                                                    <% end if %>
                                                                                    <TD width=150>
                                                                                        <div class="form-text">DHCP Server启用</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                    <INPUT id='cb_enabledhcp' type=checkbox name='cb_enabledhcp' <% if tcWebApi_get("WanInfo_WanIF", "DHCPEnable", "h") = "1" then asp_Write("checked") end if %>>
                                                                                    <INPUT id='enable_dhcp' type=hidden name='enable_dhcp'>
                                                                                    <script language="JavaScript" type="text/JavaScript">
                                                            <% if TCWebApi_get("WebCustom_Entry", "isShowNumOfSsid", "h") = "Yes" then %>
                                                                                    var validSSID = "<% tcWebApi_get("WLan_Common", "BssidNum", "s") %>";
                                                                        
                                                                                    if ( validSSID == "1" )
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 0);
                                                                                        setDisplay('secWireless3', 0);
                                                                                        setDisplay('secWireless4', 0);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 1);
                                                                                        setDisplay('secWireless3', 0);
                                                                                        setDisplay('secWireless4', 0);
                                                                                    }
                                                                                    
                                                                                    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported", "h") = "Yes" then %>										  
                                                                                    //wireless 5g
                                                                                    setDisplay('secWirelessac1', 1);
                                                                                    setDisplay('secWirelessac2', 0);
                                                                                    setDisplay('secWirelessac3', 0);
                                                                                    setDisplay('secWirelessac4', 0);
                                                                                    <% end if %>
                                                            <% else %>                                  
                                                                                    var validSSID = "<% tcWebApi_get("WLan_Common", "BssidNum", "s") %>";
                                                                                
                                                                                    if ( validSSID == "1" )
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 0);
                                                                                        setDisplay('secWireless3', 0);
                                                                                        setDisplay('secWireless4', 0);
                                                                                    }
                                                                                    else if ( validSSID == "2" )
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 1);
                                                                                        setDisplay('secWireless3', 0);
                                                                                        setDisplay('secWireless4', 0);
                                                                                    }
                                                                                    else if ( validSSID == "3" )
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 1);
                                                                                        setDisplay('secWireless3', 1);
                                                                                        setDisplay('secWireless4', 0);
                                                                                    }
                                                                                    else if ( validSSID == "4" )
                                                                                    {
                                                                                        setDisplay('secWireless1', 1);
                                                                                        setDisplay('secWireless2', 1);
                                                                                        setDisplay('secWireless3', 1);
                                                                                        setDisplay('secWireless4', 1);
                                                                                    }
                                                                                    
                                                                                    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>										  
                                                                                    //wireless 5g
                                                                                    var validacSSID = "<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>";
                                                                                    
                                                                                    if ( validacSSID == "1" )
                                                                                    {
                                                                                        setDisplay('secWirelessac1', 1);
                                                                                        setDisplay('secWirelessac2', 0);
                                                                                        setDisplay('secWirelessac3', 0);
                                                                                        setDisplay('secWirelessac4', 0);
                                                                                    }
                                                                                    else if ( validacSSID == "2" )
                                                                                    {
                                                                                        setDisplay('secWirelessac1', 1);
                                                                                        setDisplay('secWirelessac2', 1);
                                                                                        setDisplay('secWirelessac3', 0);
                                                                                        setDisplay('secWirelessac4', 0);
                                                                                    }
                                                                                    else if ( validacSSID == "3" )
                                                                                    {
                                                                                        setDisplay('secWirelessac1', 1);
                                                                                        setDisplay('secWirelessac2', 1);
                                                                                        setDisplay('secWirelessac3', 1);
                                                                                        setDisplay('secWirelessac4', 0);
                                                                                    }
                                                                                    else if ( validacSSID == "4" )
                                                                                    {
                                                                                        setDisplay('secWirelessac1', 1);
                                                                                        setDisplay('secWirelessac2', 1);
                                                                                        setDisplay('secWirelessac3', 1);
                                                                                        setDisplay('secWirelessac4', 1);
                                                                                    }
                                                                                    <% end if %>
                                                            <% end if %>  				
                                                                                    <% if tcwebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes" then %>
                                                                                    setDisplay('secLan2', 0);
                                                                                    <% end if %>
                                                                                    <% if tcwebApi_get("WebCustom_Entry", "isCT2PORTSSupported", "h") = "Yes" then %>
                                                                                    setDisplay('secLan3', 0);
                                                                                    setDisplay('secLan4', 0);
                                                                                    <% end if %>
                                                                                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                                    setDisplay('secLan4', 0);
                                                                                    <% end if %>
                                                                                    <% if TCWebApi_get("WebCustom_Entry", "isWLanSupported", "h" ) <> "Yes" then %>
                                                                                    setDisplay('wlanBindTab', 0);
                                                                                    <% end if %>
                                                                                    <% if TCWebApi_get("WebCustom_Entry", "isWLanACSupported", "h" ) <> "Yes" then %>
                                                                                    setDisplay('wlanacBindTab', 0);
                                                                                    <% end if %>
                                                                                    </script>
                                                                                </TD>
                                                                                </TR>
                                                                                </TBODY>
                                                                                </TABLE>
                                                                            <DIV id=divLink style="display: none;">
                                                                            <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" 
                                                                            border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">链接方式</div>
                                                                                </TD>
                                                                                <TD><LABEL> 
                                                                                                <SELECT id=linkMode onchange=linkModeSelect() name="linkMode">
                                                                                                <OPTION value="linkIP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkIP" then asp_Write("selected") end if%>>通过IP方式建立链接 
                                                                                                <OPTION value="linkPPP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkPPP" then asp_Write("selected") end if%>>通过PPPoE方式建立链接 
                                                                                                </SELECT>
                                                                                                </LABEL></TD></TR></TBODY></TABLE></DIV>
                                                                            <DIV id=divIpVersion>
                                                                                <TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                            <TBODY>
                                                                                                <TR>
                                                                                                    <TD></TD>
                                                                                                    <TD>
                                                                                                        <div id="dhcp_tips" class="font-help">从服务器自动获取IP、子网掩码、缺省网关等。</div>
                                                                                                        <div id="static_tips" class="font-help">手动设置IP、子网掩码、网关、DNS等。</div>
                                                                                                        <div id="pppoe_tips" class="font-help">通过账号密码拨号上网。</div>
                                                                                                    </TD>
                                                                                                </TR>
                                                                                                <TR>
                                                                                                <TD width=150>
                                                                                                    <div class="form-text">IP协议</div>
                                                                                                </TD>
                                                                                                <TD>
                                                            <%if tcWebApi_get("DeviceInfo_devParaStatic","ZoneCode", "h") <> "JXI" then %> 
                                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION", "h") = "IPv4" then asp_Write("checked") elseif tcWebApi_get("Wan_Entry","IPVERSION","h") = "N/A" then asp_Write("checked") end if%>>
                                                                                            IPv4
                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv6" then  asp_Write("checked") end if%>>
                                                                                            IPv6
                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4/IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv4/IPv6" then asp_Write("checked") end if%>>
                                                                                            IPv4/IPv6
                                                            <% else %>
                                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION", "h") = "IPv4" then asp_Write("checked") end if%>>
                                                                                            IPv4 
                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv6" then  asp_Write("checked") end if%>>
                                                                                            IPv6
                                                                            <INPUT id=IpVersion onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4/IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv4/IPv6" then asp_Write("checked") end if%>>
                                                                                            IPv4/IPv6 
                                                            <% end if %>
                                                                            <input type="hidden" name="IPVersionValue" value="IPv4/IPv6">
                                                                            <input type="hidden" name="ISPTypeValue" value="<% tcWebApi_get("WanInfo_WanIF","ISP","s") %>">
                                                                                                </TD>
                                                                                        </TR>
                                                                                    </TBODY>
                                                                                </TABLE>
                                                                            </DIV>
                                                                            <DIV id=secIpMode>
                                                                            <DIV id=secDhcp style="display: none;">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150 >
                                                                                    <div class="form-text">设备模式</div>
                                                                                </TD>
                                                                                <TD>
                                                                                    <INPUT onclick="IpModeChange()" type=radio value="DHCP" id="ipmode1" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "0" then asp_Write("checked") end if%>> DHCP
                                                                                    <INPUT onclick="IpModeChange()" type=radio value="Static" id="ipmode2" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "1" then asp_Write("checked") end if%>> Static
                                                                                </TD>
                                                                                </TR></TBODY></TABLE>
                                                                            </DIV>
                                                                            <DIV id=secPppoe style="display:none">
                                                                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                  <TBODY>
                                                                                  <TR>
                                                                                    <TD width=150 >
                                                                                        <div class="form-text">设备模式</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <INPUT onclick="IpModeChange()" type=radio value="PPPoE" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "2" then asp_Write("checked") end if%>> PPPoE
                                                                                        <INPUT onclick="IpModeChange()" type=radio value="PPPoA" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "3" then asp_Write("checked") end if%>> PPPoA
                                                                                        <INPUT onclick="IpModeChange()" type=radio value="IPoA" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "4" then asp_Write("checked") end if%>> IPoA
                                                                                    </TD>
                                                                                </TR></TBODY></TABLE>
                                                                            </DIV>
                                                                            <DIV id=secBridgeType style="DISPLAY: none">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">桥类型</div>
                                                                                </TD>
                                                                                <TD><LABEL>
                                                                                <SELECT id=bridgeMode name="bridgeMode"> 
                                                                                    <OPTION value="PPPoE_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "PPPoE_Bridged" then asp_Write("selected") end if%>>PPPoE_Bridged</OPTION> 
                                                                                    <OPTION value="IP_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "IP_Bridged" then asp_Write("selected") end if%>>IP_Bridged</OPTION></SELECT> 
                                                                                </LABEL></TD></TR></TBODY></TABLE>
                                                                            </DIV>
                                                                            <DIV id=secbridgeDhcprelay style="DISPLAY: none">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">使能DHCP透传</div>
                                                                                </TD>
                                                                                <TD><LABEL>
                                                                                                <INPUT id=cb_dhcprelay type=checkbox name=cb_dhcprelay onClick="EnableDHCPRealy()" <%if tcWebApi_get("WanInfo_WanIF","DHCPRealy","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                <input type="hidden" name="dhcprelay" value="No">
                                                                                                </LABEL></TD>
                                                                                </TR></TBODY></TABLE>
                                                                            </DIV>
                                                                            <INPUT id=multMode type=hidden value=0 name=multMode>
                                                                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                    <TBODY>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                        <TR>
                                                            <% else %>
                                                                                        <TR style="display: none;">
                                                            <% end if %>
                                                            <% else %>
                                                                                        <TR>
                                                            <% end if %>
                                                                                                <TD width=150>
                                                                                                    <div class="form-text">VLAN模式</div>
                                                                                                </TD>
                                                                                                <TD colspan='2'>
                                                                                            <select id='VLANMode' onChange="VLANModeChg()" size=1 name='VLANMode'>
                                                                                                <option value="TAG" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TAG" then asp_Write("selected") end if%>>TAG
                                                                                                <option value="UNTAG"  <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "UNTAG" then asp_Write("selected") end if%>>UNTAG
                                                                                                <option value="TRANSPARENT" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TRANSPARENT" then asp_Write("selected") end if%>>TRANSPARENT
                                                                                            </select>
                                                                                    </TD>
                                                                                            </TR>
                                
                                                                                                <TR id='vlansec'>
                                                                                                <TD>
                                                                                                    <div class="form-text">VLAN ID[1-4094]</div>
                                                                                                </TD>
                                                                                                <TD colspan='2'>
                                                                                            <INPUT id=vlan maxLength=4 size=5 name=vlan value="<%if tcWebApi_get("WanInfo_WanIF","VLANID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","VLANID","s") end if%>">
                                                                                                                        <INPUT id=vlanId type=hidden name=vlanId value="No">
                                                                                                                        <INPUT id=vlanUNTAG type=hidden name=vlanUNTAG value="4096">
                                                                                                                        <INPUT id=vlanTRANSPARENT type=hidden name=vlanTRANSPARENT value="4097">
                                                                                    </TD>
                                                                                            </TR>
                                                                                                <TR id='priosec'>
                                                                                                <TD>
                                                                                                    <div class="form-text">802.1p[0-7]</div>
                                                                                                </TD>
                                                                                                <TD colspan='2'>
                                                                                                <INPUT id=cb_8021P type=checkbox name=cb_8021P onClick="Enable8021PClick()" <%if tcWebApi_get("WanInfo_WanIF","v8021PEnable","h") = "Yes" then asp_Write("checked") end if%> >
                                                                                                使能
                                                                                                &nbsp;
                                                                                                <INPUT id=v8021PClick type=hidden name=v8021PClick <%if tcWebApi_get("WanInfo_WanIF","v8021PEnable","h") = "No" then asp_Write("value='No'") else asp_Write("value='Yes'") end if%>>
                                                                                                <INPUT id=v8021P maxLength=1 size=5 name=v8021P value="<%if tcWebApi_get("WanInfo_WanIF","dot1pData","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","dot1pData","s") end if%>" <%if tcWebApi_get("WanInfo_WanIF","v8021PEnable","h") = "No" then asp_Write("style='display:none'") end if%>>
                                                                                                <INPUT id=vlanPri type=hidden name=vlanPri value="No">
                                                                                                <INPUT id=vlanPriNone type=hidden name=vlanPriNone value="0">
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='mulvidsec'>
                                                                                                <TD>
                                                                                                    <div class="form-text">组播VLAN ID[1-4094]</div></TD>
                                                                                                <TD colspan='2'>
                                                                                                        <INPUT id=MulticastVID maxLength=4 size=5 name=MulticastVID value="<%if tcWebApi_get("WanInfo_WanIF","MulticastVID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MulticastVID","s") end if%>">
                                                                                                        <input type="hidden" name="MulVIDUsed" value="No">
                                                                                                </TD>
                                                                                            </TR>
<!--
                                                                                            <TR id='MTUsec' style="display: none;">
                                                                                                <TD width=150 id='MIUDescrip'>
                                                                                                    <div class="form-text">MTU[1-1500]</div>
                                                                                                </TD>
                                                                                                <TD colspan='2'>
                                                                                                    <INPUT id=MTU maxLength=4 size=5 name=MTU value="<%if tcWebApi_get("WanInfo_WanIF","MTU","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MTU","s") end if%>">  (128~1492)
                                                                                                </TD>
                                                                                            </TR>
-->
                                                                                            <TR id='MTUsec' style="display: none;">
                                                                                                <TD width=150 id='MIUDescrip'>
                                                                                                    <div class="form-text">MTU[1-1500]</div>
                                                                                                </TD>
                                                                                                <TD colspan='2'>
                                                                                                    <INPUT id=MTU maxLength=4 size=5 name=MTU value="<%if tcWebApi_get("WanInfo_WanIF","MTU","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MTU","s") end if%>">  
                                                                                                </TD>
                                                                                            </TR>
                                                                                </TBODY>
                                                                            </TABLE>
                                                                            <DIV id=secNat style="display: none;">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">NAT</div>
                                                                                </TD>
                                                                                <TD>
                                                                                    <LABEL>
                                                                                        <INPUT id=cb_nat class="input-onoff" type=checkbox name=cb_nat onClick="EnableNatClick()" <%if tcWebApi_get("WanInfo_WanIF","NATENABLE","h") = "Enable" then asp_Write("checked") end if%>>
                                                                                        <INPUT id=nat type=hidden value="<% tcWebApi_get("WanInfo_WanIF","NATENABLE","s") %>" name="nat">
                                                                                    </LABEL>
                                                                                </TD>
                                                                                </TR>
                                                                            </TBODY>
                                                                            </TABLE>
                                                                            </DIV>
                                                                            <DIV id=secIgmp>
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR style="DISPLAY: none">
                                                                                <TD width=150>
                                                                                    <div class="form-text">使能IGMP Proxy</div>
                                                                                </TD>
                                                                                <TD><LABEL>
                                                                                                <INPUT id=cb_enblIgmp type=checkbox name="cb_enblIgmp" <%if tcWebApi_get("WanInfo_WanIF","IGMPproxy","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                <INPUT id=enblIgmp type=hidden value="No" name=enblIgmp>
                                                                                                </LABEL></TD></TR></TBODY></TABLE>
                                                                            </DIV>
                                
                                                                            
                                                                            <DIV id=secRouteItems>
                                                                            <DIV id=secPppoeItems style="display: none">
                                                                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                    <TBODY>
                                                                                        <TR>
                                                                                        <TD width=150>
                                                                                            <div class="form-text">用户名</div>
                                                                                        </TD>
                                                                                        <TD><LABEL><INPUT id=pppUserName maxLength=63 size=15 
                                                                                            name=pppUserName value="<%if TCWebApi_get("WanInfo_WanIF","USERNAME","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","USERNAME","s" ) end if %>"> </LABEL></TD></TR>
                                                                                        <TR>
                                                                                        <TD>
                                                                                            <div class="form-text">密码</div>
                                                                                        </TD>
                                                                                        <TD>
                                                                                            <span id="inpsw" style="position: relative;">
                                                                                            <INPUT id=pppPassword class='input_s1' type=password maxLength=63 size=15 name=pppPassword value="<% if TCWebApi_get("WanInfo_WanIF","PASSWORD","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PASSWORD","s" ) end if %>">
                                                                                            <div class="input_eye eye-pwd" id="cb_enablshowpsw" data-flag=0 onclick="doshowpswChange()"></div>
                                                                                            </span>
                                                            <script language="JavaScript" type="text/JavaScript">
                                                                function doshowpswChange() {
                                                                    with (getElById('ConfigForm')){
                                                                        var flag = getElById('cb_enablshowpsw').getAttribute('data-flag');
                                                                        if (flag==0) {
                                                                            getElById("pppPassword").setAttribute("type", "text");
                                                                            getElById("cb_enablshowpsw").setAttribute("data-flag", "1");
                                                                        }
                                                                        else {
                                                                            getElById("pppPassword").setAttribute("type", "password");
                                                                            getElById("cb_enablshowpsw").setAttribute("data-flag", "0");
                                                                            
                                                                        }
                                                                    }
                                                                }
                                                            </script>
                                                                                        </TD>
                                                                                        </TR>
                                                                                        <TR style="DISPLAY: none">
                                                                                        <TD>
                                                                                            <div class="form-text">服务名称</div>
                                                                                        </TD>
                                                                                        <TD><INPUT id=pppServerName class='input_s1'  maxLength=63 size=15 name=pppServerName>
                                                                                                        </TD>
                                                                                                    </TR>
                                                                    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                                                                                                    <TR>
                                                                                                    <TD>
                                                                                                        <div class="form-text">拨号方式</div>
                                                                                                    </TD>
                                                                                                    <TD>
                                                                                                    <SELECT id='ppp_DialMethod' onchange='ppp_dialMethodChg()' name='ppp_DialMethod'> 
                                                                                                    <OPTION value="Connect_Keep_Alive" <%if TCWebApi_get("WanInfo_WanIF","CONNECTION","h" ) = "Connect_Keep_Alive" then asp_Write("selected") end if %>>自动连接</OPTION>
                                                                    <% if tcWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
                                                                                                    <OPTION value="Connect_on_Demand" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_on_Demand" then asp_Write("selected")  end if%>>有流量时自动连接</OPTION>
                                                                    <% end if %>
                                                                                                    </SELECT>
                                                                                                    <SELECT id='DialMethod' name='DialMethod' style='DISPLAY: none'>
                                                                                                    </SELECT>
                                                                                                    </TD>
                                                                                                    </TR>
                                                                    <% else %>
                                                                    <% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
                                                                                        <TR style='DISPLAY: none'>
                                                                                        <TD>
                                                                                            <div class="form-text">拨号方式</div>
                                                                                        </TD>
                                                                                        <TD><SELECT id=DialMethod style="WIDTH: 117px" onchange=DialMethodChange() name=DialMethod></SELECT>
                                                                                                        </TD>
                                                                                                    </TR>
                                                                    <% else %>
                                                                                        <TR>
                                                                                        <TD>
                                                                                            <div class="form-text">拨号方式</div>
                                                                                        </TD>
                                                                                        <TD><SELECT id=DialMethod style="WIDTH: 117px" onchange=DialMethodChange() name=DialMethod> 
                                                                                            <OPTION value="AlwaysOn" <%if TCWebApi_get("WanInfo_WanIF","CONNECTION","h" ) = "Connect_Keep_Alive" then asp_Write("selected") end if %>>自动连接</OPTION> 
                                                                                            <OPTION value="Manual" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_Manually" then asp_Write("selected")  end if%>>手动拨号</OPTION></SELECT>
                                                                                                        </TD>
                                                                                                    </TR>
                                                                    <% end if %>
                                                                    <% end if %>
                                                                                        <TR id=secManualDial style="DISPLAY: none">
                                                                                        <TD>&nbsp;</TD>
                                                                                        <TD><INPUT id=pppDialButton onclick=ManualCntSubmit() type=button value=手动拨号 name=pppDialButton> 
                                                                                        </TD></TR>
                                                                                        <TR id=secIdleTime style="DISPLAY: none">
                                                                                        <TD>
                                                                    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                                                                                                                    无流量：
                                                                                                                    <input type="hidden" id='pppondemand_idletime' name='pppondemand_idletime' value="<%if tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","s") end if%>" >
                                                                    <% else %>
                                                                                            空闲超时（分钟）[1-4320]
                                                                    <% end if %>
                                                                                            </TD>
                                                                                                        <TD> 
                                                                                                        <INPUT id=pppTimeOut maxLength=4 size=4 name=pppTimeOut>
                                                                    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
                                                                                                                                                分钟后断开连接
                                                                    <% end if %>
                                                                                                        <input type="hidden" name="pppv6Mode" value="0">
                                                                                                        </TD>
                                                                                                    </TR>
                                                                    <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
                                                                                                    <TR id='ppp_proxy_bi'>
                                                                                                        <TD width=150>
                                                                                                            <div class="form-text">PPPoE代理或桥混合</div>
                                                                                                        </TD>
                                                                                                        <TD>
                                                                                                                <INPUT id='ppp_proxy_bi_mode' onclick='ppp_proxy_bi_Change()' type=radio value="0" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode", "h") = "0" then asp_Write("checked") elseif tcWebApi_get("WanInfo_WanIF","pppProxyBiMode", "h") = "N/A" then asp_Write("checked") end if%>>
                                                                                                                不启用PPPoE代理或PPPoE路由桥混合
                                                                                                                <INPUT id='ppp_proxy_bi_mode' onclick='ppp_proxy_bi_Change()' type=radio value="1" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode","h") = "1" then asp_Write("checked") end if%>>
                                                                                                                启用PPPoE代理
                                                                                                                <INPUT id='ppp_proxy_bi_mode' onclick='ppp_proxy_bi_Change()' type=radio value="2" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode","h") = "2" then asp_Write("checked") end if%>>
                                                                                                                启用PPPoE路由桥混合模式
                                                                                                                    <INPUT id='ppp_proxy_biUsed' type=hidden name='ppp_proxy_biUsed'>
                                                                                                                    <INPUT id='ppp_proxy_bi_disable' type=hidden name='ppp_proxy_bi_disable' value='0'>
                                                                                                                    <INPUT id='pppproxyDisabled' type=hidden name='pppproxyDisabled' value='0'>
                                                                                                                    <INPUT id='pppbiDisabled' type=hidden name='pppbiDisabled' value='No'>
                                                                                                                    <INPUT id='pppproxyEnabled' type=hidden name='pppproxyEnabled' value='1'>
                                                                                                                    <INPUT id='pppbiEnabled' type=hidden name='pppbiEnabled' value='Yes'>
                                                                                                        </TD>
                                                                                                    </TR>
                                                                                                    <TR id='ppp_proxy_user'>
                                                                                                        <TD width=150>
                                                                                                            <div class="form-text">代理最大用户数[1-4]</div>
                                                                                                        </TD>
                                                                                                        <TD>
                                                                                                                <INPUT id='pppproxy_user' maxLength=1 size=3 name='pppproxy_user' value="<%if tcWebApi_get("WanInfo_WanIF","ProxyMaxUser","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","ProxyMaxUser","s") end if%>">
                                                                                                                    <INPUT id='pppproxy_user_zero' type=hidden name='pppproxy_user_zero' value='0'>
                                                                                                        </TD>
                                                                                                    </TR>
                                                                    <%else%>
                                                                                <!--TR id='ppp_bi' >
                                                                                        <TD width=150>
                                                                                            <div class="form-text">PPPoE路由桥混合模式启用</div>
                                                                                        </TD>
                                                                                        <TD>
                                                                                                <INPUT id='cb_enable_pppbi' type=checkbox name='cb_enable_pppbi' <%if tcWebApi_get("WanInfo_WanIF","BridgeInterface","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                                <INPUT id='enablepppbi' type=hidden name='enablepppbi'>
                                                                                                <INPUT id='pppbiUsed' type=hidden name='pppbiUsed'>
                                                                                                <INPUT id='pppbiDisabled' type=hidden name='pppbiDisabled' value='No'>
                                                                                        </TD>
                                                                                </TR-->
                                                                    <%end if%>   
                                                                                    </TBODY>
                                                                                </TABLE>
                                                                            </DIV>
                                                                            <DIV id=secDHCPItems style="display: none">
                                                                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                    <TBODY>
                                                                                    <TR>
                                                                                        <TD width=150>
                                                                                            <div class="form-text">静态DNS使能</div>
                                                                                        </TD>
                                                                                        <TD>
                                                                                            <LABEL>
                                                                                                <INPUT id=cb_DNSEnableDHCP class="input-onoff" type=checkbox name=cb_DNSEnableDHCP onClick="EnableDNSDHCPClick()" <%if tcWebApi_get("WanInfo_WanIF","MannualdnsEnable","h") = "1" then asp_Write("checked") end if%>>
                                                                                                <INPUT id=dnsDHCP type=hidden value="<% tcWebApi_get("WanInfo_WanIF","MannualdnsEnable","s") %>" name="dnsDHCP">
                                                                                            </LABEL>
                                                                                        </TD>
                                                                                    </TR>
                                                                                    <TR id="DHCPdns1" style="display: none;">
                                                                                        <TD>
                                                                                            <div class="form-text">DNS1</div>
                                                                                        </TD>
                                                                                        <TD><INPUT id=dns1 maxLength=15 size=15 name=dns1 value="<%if tcWebApi_get("WanInfo_WanIF","DNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS","s") end if%>"></TD>
                                                                                    </TR>
                                                                                    <TR id="DHCPdns2" style="display: none;">
                                                                                        <TD>
                                                                                            <div class="form-text">DNS2</div>
                                                                                        </TD>
                                                                                        <TD><INPUT id=dns2 maxLength=15 size=15 name=dns2 placeholder="此项可不填写" value="<%if tcWebApi_get("WanInfo_WanIF","SecDNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS","s") end if%>"></TD>
                                                                                        <input type="hidden" name="third_dns3" value="<% tcWebApi_get("WanInfo_WanIF","ThirdDNS","s") %>">
                                                                                    </TR>
                                                                                    </TBODY>
                                                                                </TABLE>
                                                                            </DIV>
                                                                            <DIV id=secStaticItems style="display: none">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR>
                                                                                <TD width=150>
                                                                                    <div class="form-text">IP 地址</div>
                                                                                </TD>
                                                                                <TD><LABEL><INPUT id=wanIpAddress maxLength=15 size=15 name=wanIpAddress value="<%if TCWebApi_get("WanInfo_WanIF","IPADDR","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR","s" ) end if %>"> </LABEL></TD></TR>
                                                                                <TR>
                                                                                <TD>
                                                                                    <div class="form-text">子网掩码</div>
                                                                                </TD>
                                                                                <TD><INPUT id=wanSubnetMask maxLength=15 size=15 name=wanSubnetMask placeholder="255.255.255.0" value="<%if TCWebApi_get("WanInfo_WanIF","NETMASK","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","NETMASK","s" ) end if %>">
                                                                                                </TD>
                                                                                            </TR>
                                                                                <TR>
                                                                                <TD>
                                                                                    <div class="form-text">缺省网关</div>
                                                                                </TD>
                                                                                <TD><INPUT id=defaultGateway maxLength=15 size=15 name=defaultGateway value="<%if TCWebApi_get("WanInfo_WanIF","GATEWAY","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","GATEWAY","s" ) end if %>"></TD></TR>
                                                                                <TR>
                                                                                <TD>
                                                                                    <div class="form-text">DNS1</div>
                                                                                </TD>
                                                                                <TD><INPUT id=dnsPrimary maxLength=15 size=15 name=dnsPrimary value="<%if tcWebApi_get("WanInfo_WanIF","DNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS","s") end if%>"></TD></TR>
                                                                                <TR>
                                                                                <TD>
                                                                                    <div class="form-text">DNS2</div>
                                                                                </TD>
                                                                                <TD><INPUT id=dnsSecondary maxLength=15 size=15 name=dnsSecondary placeholder="此项可不填写" value="<%if tcWebApi_get("WanInfo_WanIF","SecDNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS","s") end if%>"></TD>
                                                                                </TR>
                                                                                <!-- <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">DNS3</div>
                                                                                    </TD>
                                                                                    <TD><INPUT id=dns3 maxLength=15 size=15 name=dns3 placeholder="此项可不填写" value="<%if tcWebApi_get("WanInfo_WanIF","ThirdDNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","ThirdDNS","s") end if%>"></TD>
                                                                                </TR> -->
                                                                            </TBODY></TABLE>
                                                                            </DIV>
                                                                            </DIV>
                                                                            <DIV id=secIPv6Div style="display: none">
                                                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                                                                <TBODY>
                                                                                <TR id=TrIpv6AddrType>
                                                                                <TD width=150>
                                                                                    <div class="form-text">全局地址获取方式</div>
                                                                                </TD>
                                                                                            <TD><select id="IdIpv6AddrType" style="WIDTH: 130px" onChange="pdDefaultSel=1;OnIPv6Changed();" name="IdIpv6AddrType">
                                                                                                <option value="SLAAC" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "No" then asp_Write("selected") end if %>>SLAAC 
                                                                                                <option value="DHCP" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "Yes" then asp_Write("selected") end if %>>DHCP
                                                                                                <option value="Static" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "N/A" then asp_Write("selected") end if %>>Static 
                                                                                                </select>
                                                                                            </TD>
                                                                                            </TR>
                                                                                <TR id=TrIpv6Addr>
                                                                                <TD>
                                                                                    <div class="form-text">IPv6地址</div>
                                                                                </TD>
                                                                                <TD><INPUT id=IdIpv6Addr maxLength=39 size=36 name=IdIpv6Addr value="<%if TCWebApi_get("WanInfo_WanIF","IPADDR6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR6","s" ) end if %>">
                                                                                &nbsp;/ 
                                                                                <INPUT id=IdIpv6PrefixLen maxLength=3 size=3 style="width: 56px;" name=IdIpv6PrefixLen value="<% if TCWebApi_get("WanInfo_WanIF","PREFIX6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PREFIX6","s" ) end if %>"> 
                                                                                </TD>
                                                                                </TR>
                                                                                <TR id=TrIpv6Gateway>
                                                                                <TD>
                                                                                    <div class="form-text">IPv6默认网关</div>
                                                                                </TD>
                                                                                <TD><INPUT id=IdIpv6Gateway maxLength=39 size=36 name=IdIpv6Gateway value="">
                                                                                                <script language="JavaScript" type="text/JavaScript">
                                                                                                var ipv6gwstr = "<% tcWebApi_get("WanInfo_WanIF","GATEWAY6","s" ) %>";
                                                                                                if("N/A" == ipv6gwstr)
                                                                                                    setText('IdIpv6Gateway', "");
                                                                                                else
                                                                                                    setText('IdIpv6Gateway', ipv6gwstr);
                                                                                                </script></TD></TR>
                                                                    <TR id="TrIpv6GatewayInfo">
                                                                                <TD></TD>
                                                                                <TD><div class="font-help" style="margin-bottom: 12px;">(IPv6默认网关不填内容，则自动获取)</div></TD></TR>
                                                                                <TR id=TrIpv6Dns1>
                                                                                <TD>
                                                                                    <div class="form-text">首选DNS服务器</div>
                                                                                </TD>
                                                                                <TD><INPUT id=IdIpv6Dns1 maxLength=39 size=36 name=IdIpv6Dns1 value="<%if tcWebApi_get("WanInfo_WanIF","DNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS6","s") end if%>"></TD></TR>
                                                                                <TR id=TrIpv6Dns2>
                                                                                <TD>
                                                                                    <div class="form-text">备用DNS服务器</div>
                                                                                </TD>
                                                                                <TD><INPUT id=IdIpv6Dns2 maxLength=39 size=36 name=IdIpv6Dns2 value="<%if tcWebApi_get("WanInfo_WanIF","SecDNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS6","s") end if%>">
                                                                    </TD></TR>
                                                                                <TR id='PDEnableSec'>
                                                                                        <TD id='PDEnableDescrip'>
                                                                                            <div class="form-text">PD</div>
                                                                                        </TD>
                                                                                        <TD>
                                                                                        <INPUT id='cb_enabledpd' class="input-onoff" type=checkbox onclick='cb_pdEnableChange()' name='cb_enabledpd' <%if tcWebApi_get("WanInfo_WanIF","PDEnable","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                        <INPUT id='enablepd' type=hidden name='enablepd'>
                                                                                        <INPUT id='PDUsed' type=hidden name='PDUsed'>
                                                                                        <INPUT id='PDDisabled' type=hidden name='PDDisabled' value='No'>
                                                                                        </TD>
                                                                                </TR>
                                                                        <TR id='pdmode_1'>
                                                                            <TD>
                                                                                <div class="form-text">前缀模式</div>
                                                                            </TD>
                                                                                    <TD>
                                                                                                        <INPUT id='pdmode' onclick='pdmodeChange()' type=radio value="Yes" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin", "h") <> "Static" then asp_Write("checked") end if%>>
                                                                                                        Auto&nbsp;&nbsp; 
                                                                                                        <INPUT id='pdmode' onclick='pdmodeChange()' type=radio value="No" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin","h") = "Static" then asp_Write("checked") end if%>>
                                                                                                        Manual&nbsp;&nbsp; 
                                                                                                        <INPUT id='pdmodeUsed' type=hidden name='pdmodeUsed'>
                                                                                                        <INPUT id='pdmodeDisabled' type=hidden name='pdmodeDisabled' value='No'>
                                                                                                        <INPUT id='pdmodeAuto' type=hidden name='pdmodeAuto' value='PrefixDelegation'>
                                                                                                        <INPUT id='pdmodeStatic' type=hidden name='pdmodeStatic' value='Static'>
                                                                                                        <INPUT id='pdmodeNone' type=hidden name='pdmodeNone' value='None'>
                                                                                        </TD>
                                                                        </TR>
                                                                        <TR id='pdmode_2'>
                                                                                                <TD>
                                                                                                    <div class="form-text">前缀地址</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                        <INPUT id='pdprefix' maxLength=39 size=36 name='pdprefix' value="<%if tcWebApi_get("WanInfo_WanIF","PDPrefix","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PDPrefix","s") end if%>">
                                                                                                </TD>
                                                                        </TR>
                                                                        <TR id='pdmode_3'>
                                                                                                <TD>
                                                                                                    <div class="form-text">首选寿命</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                        <INPUT id='pdprefixptime' maxLength=10 size=10 name='pdprefixptime' value="<%if tcWebApi_get("WanInfo_WanIF","PrefixPltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixPltime","s") end if%>">
                                                                                                        (600 - 4294967295) 秒
                                                                                                </TD>
                                                                        </TR>
                                                                        <TR id='pdmode_4'>
                                                                                                <TD>
                                                                                                    <div class="form-text">有效寿命</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                        <INPUT id='pdprefixvtime' maxLength=10 size=10 name='pdprefixvtime' value="<%if tcWebApi_get("WanInfo_WanIF","PrefixVltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixVltime","s") end if%>">
                                                                                                        (600 - 4294967295) 秒
                                                                                                </TD>
                                                                        </TR>
                                                            <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
                                                                        <TR id='dslite_1'>
                                                                                <TD>
                                                                                    <div class="form-text">DS-Lite</div>
                                                                                </TD>
                                                                                <TD>
                                                                                        <INPUT class="input-onoff" id='cb_enabledslite' onclick=cb_enabledsliteChange() type=checkbox name='cb_enabledslite' <%if tcWebApi_get("WanInfo_WanIF","DsliteEnable","h") = "Yes" then asp_Write("checked") end if%>>
                                                                                        <INPUT id='enabledslite' type=hidden name='enabledslite'>
                                                                                        <INPUT id='dsliteUsed' type=hidden name='dsliteUsed'>
                                                                                        <INPUT id='dsliteDisabled' type=hidden name='dsliteDisabled' value='No'>
                                                                                </TD>
                                                                        </TR>
                                                                        <TR id='dslite_2'>
                                                                                <TD>
                                                                                    <div class="form-text">DS-Lite模式</div>
                                                                                </TD>
                                                                                <TD>
                                                                                        <INPUT id='dslitemode' onclick='dslitemodeChange()' type=radio value="0" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode", "h") = "0" then asp_Write("checked") elseif tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "N/A" then asp_Write("checked") end if%>>
                                                                                        Auto&nbsp;&nbsp; 
                                                                                        <INPUT id='dslitemode' onclick='dslitemodeChange()' type=radio value="1" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "1" then  asp_Write("checked") end if%>>
                                                                                        Manual&nbsp;&nbsp; 
                                                                                </TD>
                                                                        </TR>
                                                                        <TR id='dslite_3'>
                                                                                <TD>
                                                                                    <div class="form-text">DS-Lite服务器</div>
                                                                                </TD>
                                                                                <TD>
                                                                                        <INPUT id='dsliteaddress' maxLength=39 size=36 name='dsliteaddress' value="<%if tcWebApi_get("WanInfo_WanIF","DsliteAddr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DsliteAddr","s") end if%>">
                                                                                </TD>
                                                                        </TR>
                                                            <%end if%>
                                                                    </TBODY></TABLE>
                                                                        </DIV>
                                                            <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
                                                                                    <script language='JavaScript' type='text/JavaScript'>
                                                                                        function CloneMAC()
                                                                                        {
                                                                                            var pcMAC = '<%tcWebApi_get("PC","PCMAC","s")%>';
                                
                                                                                            with ( getElById('ConfigForm') )
                                                                                            {
                                                                                                if ( 0 != pcMAC.length
                                                                                                        && 'N/A' != pcMAC )
                                                                                                {
                                                                                                    wanhwaddress.value = pcMAC;
                                                                                                    alert('获取成功');
                                                                                                }
                                                                                                else
                                                                                                    alert('获取失败');
                                                                                            }
                                                                                        }
                                                                                    </script>
                                                                                    <div id=secCloneMAC>
                                                                                                    <table cellSpacing=0 cellPadding=0 width='100%' border=0>
                                                                                                        <tbody>
                                                                                                <tr>
                                                                                                    <td width='150'>
                                                                                                        <div class="form-text">WAN连接MAC地址</div>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                    <input id='wanhwaddress' maxLength=17 size=20 name='wanhwaddress' value="<%if tcWebApi_get("WanInfo_WanIF","WanHWAddr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","WanHWAddr","s") else asp_write("00:00:00:00:00:00") end if%>">
                                                                                                    &nbsp;&nbsp;&nbsp;
                                                                                                    <input id='btnCloneMAC' onclick='CloneMAC()' type=button value='获取PC MAC'>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>&nbsp;</td>
                                                                                                    <td>
                                                                                                        （全0表示不进行修改）
                                                                                                    </td>
                                                                                                    </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                    </div>
                                                            <%end if%>
                                                                        <LABEL></LABEL>
                                                                                    <LEFT> 
                                                            <%if tcwebApi_get("WebCustom_Entry","isNPUMultiWanSupported","h") = "Yes" then %>
                                                                                    <INPUT id=btnRemoveCnt onclick="btnRemoveWanCnt()" name=btnRemoveCnt type=button value=删除连接 class="BtnDel">
                                                            <%end if%>
                                                                                    </LEFT>
                                                            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                                                        <LABEL></LABEL>
                                                                                    <LEFT>
                                                                                    <P align=center style="margin-top: 48px;margin-left: -360px;">
                                                                                        <INPUT id=btnCancel0 name=btnCancel0 onclick=onCancel(); type=button value="取 消">
                                                                                        <INPUT id=btnSave10 name=btnSave10 onclick=btnSave(0) type=button style="margin-left: 60px;width: 140px;" value="确 定">
                                                                                    </P>
                                                                                    <P align=center style="margin-top: -12px;margin-left: -74px;">
                                                                                        <INPUT id=btnReSet0 name=btnReSet0 onclick=btnReSet(); type=button value="重置设置">
                                                                                    </P> 
                                                                                    </LEFT>
                                                                                </DIV>
                                                                            </DIV>
                                
                                                                                    <DIV id="中继设置_item" style="margin-left: -152px;width: 714px;display: none;">
                                                                                <% if tcWebApi_get("apcli_common","currentRadio","h")="0" then %>
                                                                                    <% if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then %>
                                                                                    <script>
                                                                                        var value = '<% tcWebApi_JsonHook("get_apcli_connstatus", "0", "area") %>';
                                                                                        connect_2 = value ? JSON.parse(value).data[0].APCLI_STATUS : 0;
                                                                                        if (connect_2 == 1) {
                                                                                            document.write("<div><div class=\"connect-img\"><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/icon_wdwl_nor.png\"></div></div><div class=\"hr\"></div><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/zj.png\"></div></div><div class=\"hr\"></div><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/bj.png\"></div></div></div><div class=\"connect-img text\" style=\"margin-top: 3px;\"><div class=\"connect-icon\"><div class=\"info-text\">我的网络</div></div><div class=\"connect-icon\"><div class=\"info-text\"><p>主路由</p><p><% tcWebApi_get("apcli_entry0","SSID","s") %></p></div></div><div class=\"connect-icon\"><div class=\"info-text\"><p>本机</p><p>SSID：<% tcWebApi_get("WLan_Entry0","SSID","s") %></p></div></div></div></div>");
                                                                                        }
                                                                                        else {
                                                                                            document.write("<div class=\"helpDesc\" style=\"background: rgb(243, 243, 243); border-radius: 5px; padding: 12px 4px 12px 20px;\"><li>1、开启Wi-Fi中继模式前，请拔掉WAN口的网线；</li><li>2、打开或关闭Wi-Fi中继时，当前路由器Wi-Fi将会断开，稍后如果不能自动重新连接，请尝试手动连接Wi-Fi；</li><li>3、如果Mesh已开启，请手动关闭Mesh功能后，再切换为Wi-Fi中继模式；</li><li>4、如果访客Wi-Fi已开启，路由器切换为Wi-Fi中继模式且开启同步主路由名称和密码后，您的访客Wi-Fi将自动关闭。</li></div>");
                                                                                        }
                                                                                    </script>
                                                                                    <% else %>
                                                                                    <div class="helpDesc" style="background: rgb(243, 243, 243); border-radius: 5px; padding: 12px 4px 12px 20px;">
                                                                                        <li>1、开启Wi-Fi中继模式前，请拔掉WAN口的网线；</li>
                                                                                        <li>2、打开或关闭Wi-Fi中继时，当前路由器Wi-Fi将会断开，稍后如果不能自动重新连接，请尝试手动连接Wi-Fi；</li>
                                                                                        <li>3、如果Mesh已开启，请手动关闭Mesh功能后，再切换为Wi-Fi中继模式；</li>
                                                                                        <li>4、如果访客Wi-Fi已开启，路由器切换为Wi-Fi中继模式且开启同步主路由名称和密码后，您的访客Wi-Fi将自动关闭。</li>
                                                                                        
                                                                                    </div>
                                                                                    <% end if %>
                                                                                <% else %>
                                                                                    <% if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then %>
                                                                                    <script>
                                                                                        var value = '<% tcWebApi_JsonHook("get_apcli_connstatus", "1", "area") %>';
                                                                                        connect_5 = value ? JSON.parse(value).data[0].APCLI_STATUS : 0;
                                                                                        if (connect_5 == 1) {
                                                                                            document.write("<div><div class=\"connect-img\"><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/icon_wdwl_nor.png\"></div></div><div class=\"hr\"></div><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/zj.png\"></div></div><div class=\"hr\"></div><div class=\"connect-icon\"><div class=\"img\"><img src=\"../img/home_page/bj.png\"></div></div></div><div class=\"connect-img text\" style=\"margin-top: 3px;\"><div class=\"connect-icon\"><div class=\"info-text\">我的网络</div></div><div class=\"connect-icon\"><div class=\"info-text\"><p>主路由</p><p><% tcWebApi_get("apcli_entry1","SSID","s") %></p></div></div><div class=\"connect-icon\"><div class=\"info-text\"><p>本机</p><p>SSID：<% tcWebApi_get("WLan_Entry0","SSID","s") %></p></div></div></div></div>");
                                                                                        }
                                                                                        else {
                                                                                            document.write("<div class=\"helpDesc\" style=\"background: rgb(243, 243, 243); border-radius: 5px; padding: 12px 4px 12px 20px;\"><li>1、开启Wi-Fi中继模式前，请拔掉WAN口的网线；</li><li>2、打开或关闭Wi-Fi中继时，当前路由器Wi-Fi将会断开，稍后如果不能自动重新连接，请尝试手动连接Wi-Fi；</li><li>3、如果Mesh已开启，请手动关闭Mesh功能后，再切换为Wi-Fi中继模式；</li><li>4、如果访客Wi-Fi已开启，路由器切换为Wi-Fi中继模式且开启同步主路由名称和密码后，您的访客Wi-Fi将自动关闭。</li></div>");
                                                                                        }
                                                                                        </script>
                                                                                    <% else %>
                                                                                    <div class="helpDesc" style="background: rgb(243, 243, 243); border-radius: 5px; padding: 12px 4px 12px 20px;">
                                                                                        <li>1、开启Wi-Fi中继模式前，请拔掉WAN口的网线；</li>
                                                                                        <li>2、打开或关闭Wi-Fi中继时，当前路由器Wi-Fi将会断开，稍后如果不能自动重新连接，请尝试手动连接Wi-Fi；</li>
                                                                                        <li>3、如果Mesh已开启，请手动关闭Mesh功能后，再切换为Wi-Fi中继模式；</li>
                                                                                        <li>4、如果访客Wi-Fi已开启，路由器切换为Wi-Fi中继模式且开启同步主路由名称和密码后，您的访客Wi-Fi将自动关闭。</li>
                                                                                    </div>
                                                                                    <% end if %>
                                                                                <% end if %>
                                                                                        <div class="advanceTitle" style="margin-top: 24px;">已加入的无线网络</div>
                                                                                        <div class="table-outer">
                                                                                            <INPUT id=rfBand type=hidden name=rfBand value="<% tcWebApi_get("apcli_common","currentRadio","s") %>">
                                                                                            <INPUT id=MSEnbl type=hidden name=MSEnbl value="1">
                                                                                            <INPUT id=wlanssid type=hidden name=wlanssid value="">
                                                                                            <INPUT id=SecurMode type=hidden name=SecurMode value="OPEN">
                                                                                            <INPUT id=EncrypType type=hidden name=EncrypType value="">
                                                                                            <INPUT id=SyncWlCFG_2 type=hidden name=SyncWlCFG_2 value="0">
                                                                                            <INPUT id=SyncWlCFG_5 type=hidden name=SyncWlCFG_5 value="0">
                                                                                            <INPUT id=Signal type=hidden name=Signal value="1">
                                                                                            <INPUT id=Connecting type=hidden name=Connecting value="0">
                                                                                            <TABLE cellSpacing=0 celladding=0 width="100%" border=0 style="border-collapse: collapse;border-style: hidden;">
                                                                                            <tbody>
                                                                                                <tr class="tableLi">
                                                                                        <%if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then %>
                                                                                            <% if tcWebApi_get("apcli_common","currentRadio","h")="0" then %>
                                                                                                <script>
                                                                                                    if (connect_2 == 1) {
                                                                                                        var auth = "<% tcWebApi_get("apcli_entry0","AuthMode","s") %>";
                                                                                                        document.write('<td class="left-name" style="width: 92%;"><p class="top"><% tcWebApi_get("apcli_entry0","SSID","s") %></p><p class="bot">' + auth + '</p></td><td style="width: 8%;"><div class="right-icon ' + (auth == 'OPEN' ? 'open' : '') + '"></div></td>');
                                                                                                    }
                                                                                                    else {
                                                                                                        document.write("<td class=\"left-name\" style=\"width: 92%;\"><p class=\"top\">无</p><p class=\"bot\">--</p></td><td style=\"width: 8%;\"><div class=\"right-icon no-connect\"></div></td>");
                                                                                                    }
                                                                                                </script>
                                                                                            <% else %>
                                                                                                <script>
                                                                                                    if (connect_5 == 1) {
                                                                                                        var auth = "<% tcWebApi_get("apcli_entry1","AuthMode","s") %>";
                                                                                                        document.write('<td class="left-name" style="width: 92%;"><p class="top"><% tcWebApi_get("apcli_entry1","SSID","s") %></p><p class="bot">' + auth + '</p></td><td style="width: 8%;"><div class="right-icon ' + (auth == 'OPEN' ? 'open' : '') + '"></div></td>');
                                                                                                    }
                                                                                                    else {
                                                                                                        document.write("<td class=\"left-name\" style=\"width: 92%;\"><p class=\"top\">无</p><p class=\"bot\">--</p></td><td style=\"width: 8%;\"><div class=\"right-icon no-connect\"></div></td>");
                                                                                                    }
                                                                                                </script>
                                                                                            <% end if %>
                                                                                        <% else %>
                                                                                            <td class="left-name" style="width: 92%;">
                                                                                                <p class="top">无</p>
                                                                                                <p class="bot">--</p>
                                                                                            </td>
                                                                                            <td style="width: 8%;">
                                                                                                <div class="right-icon no-connect"></div>
                                                                                            </td>
                                                                                        <% end if %>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                
                                                                                        <div id="scanTitle" class="advanceTitle" style="margin-top: 20px;">
                                                                                            <span class="fl">可用无线网络</span>
                                                                                            <span class="scan-again fr" id="scan_again" style="display: none;" onclick="scan_action()">重新扫描</span>
                                                                                        </div>
                                                                                        <div id="scan-table" class="table-outer scan-table">
                                                                                            <TABLE cellSpacing=0 celladding=0 width="100%" border=0 style="border-collapse: collapse;border-style: hidden;margin: 40pX 0;">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="width: 40%;">
                                                                                                            <div class="form-text" style="text-align: right;margin-right: 24px;">Wi-Fi名称</div>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <INPUT id=connectSSID maxLength=15 size=15 name=connectSSID value="" placeholder="请手动输入或者扫描网络"></TD>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 40%;">
                                                                                                            <div class="form-text" style="text-align: right;margin-right: 24px;">Wi-Fi密码</div>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <INPUT id=connectPWD maxLength=15 size=15 name=connectPWD value=""></TD>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                   
                                                                                                    <TR id="auto" style="display: none;">
                                                                                                        <td></td>
                                                                                                        <td>
                                                                                                            <input type="button" id="btnJoin" name="btnJoin"  value="加入网络">
                                                                                                        </td>
                                                                                                    </TR>
                                                                                                    <TR id="manual">
                                                                                                        <td></td>
                                                                                                        <td>
                                                                                                            <input type="button" id="btnJoin" name="btnJoin"  value="加入网络" onclick="scan_connect_manual()">
                                                                                                        </td>
                                                                                                    </TR>
                                                                                                </tbody>
                                                                                            </TABLE>

                                                                                            <div style="max-height: 397px;overflow-y: auto;">
                                                                                                <TABLE cellSpacing=0 celladding=0 width="100%" border=0 style="border-collapse: collapse;border-style: hidden;">
                                                                                                <INPUT id=apcli_flag type=hidden name=apcli_flag value="0">
                                                                                                    <tbody id="scan_list" style="display: none;">
                                                                                                        <tr class="tableLi">
                                                                                                            <td class="left-name" style="width: 92%;">
                                                                                                                <p class="top">无</p>
                                                                                                                <p class="bot">--</p>
                                                                                                            </td>
                                                                                                            <td style="width: 8%;">
                                                                                                                <div class="right-icon"></div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </DIV>
                                                                                    <DIV id="5G中继设置_item" style="display: none;">
                                                                                        <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
                                                                                            <INPUT id=apcli_acflag type=hidden name=apcli_acflag value="1">
                                                                                            <TBODY>
                                                                                            <TR>
                                                                                                <TD>
                                                                                                    <div class="form-text">无线5G中继上行SSID</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <LABEL> 
                                                                                                        <LABEL>
                                                                                                        <INPUT id=wlanACssidap maxLength=63 size=15 name=wlanACssidap value="<%if tcWebApi_get("apcli_entry1","SSID","h") <> "N/A" then tcWebApi_get("apcli_entry1","SSID","s") else asp_write("CMCC-QLINK") end if%>"> 
                                                                                                        </LABEL>
                                                                                                    </LABEL>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD colspan="2" class="newcheck"><INPUT onclick=ACManualSet() type=checkbox <%if tcWebApi_get("apcli_entry1","Enable","h") = "1" then asp_Write("checked") end if%> name=cb_ACMSEnbl>
                                                                                                    <div class="form-text" style="display: inline-block;margin-left: 2px;">手动设置中继上行WLAN安全参数</div>
                                                                                                    <INPUT id=ACMSEnbl type=hidden name=ACMSEnbl value="<%if tcWebApi_get("apcli_entry1","Enable","h") <> "N/A" then tcWebApi_get("apcli_entry1","Enable","s") else asp_write("0") end if%>">
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD>
                                                                                                    <div class="form-text">加密方式</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <LABEL> 
                                                                                                        <SELECT id=wlACSecurMode onchange=ACauthModeChange() name="wlACSecurMode">
                                                                                                            <OPTION value="OPEN" <%if TCWebApi_get("apcli_entry1","AuthMode","h" ) = "OPEN" then asp_Write("selected") end if %>>OPEN
                                                                                                            <OPTION value="WEP_OPEN" <%if TCWebApi_get("apcli_entry1","AuthMode","h" ) = "WEP_OPEN" then asp_Write("selected") end if %>>WEP_OPEN
                                                                                                            <OPTION value="WEP_SHARED" <%if TCWebApi_get("apcli_entry1","AuthMode","h" ) = "WEP_SHARED" then asp_Write("selected") end if %>>WEP_SHARED
                                                                                                            <OPTION value="WPAPSK" <%if TCWebApi_get("apcli_entry1","AuthMode","h" ) = "WPAPSK" then asp_Write("selected") end if %>>WPA-PSK
                                                                                                            <OPTION value="WPA2PSK" <%if TCWebApi_get("apcli_entry1","AuthMode","h" ) = "WPA2PSK" then asp_Write("selected") end if %>>WPA2-PSK
                                                                                                        </SELECT>
                                                                                                    </LABEL>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='ACwpapsw'>
                                                                                                <TD class='w-130'>
                                                                                                    <div class="form-text">预认证共享密钥</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <span id="ACinpsw">
                                                                                                    <INPUT type=password maxLength=65 id=wlACWpaPsk name=wlACWpaPsk value='<% if tcWebApi_get("apcli_entry1", "WPAPSK", "h") <> "N/A" then tcWebApi_get("apcli_entry1", "WPAPSK", "s") end if %>'>
                                                                                                    </span>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='wlACWpaD'>
                                                                                                <TD class='w-130'>
                                                                                                    <div class="form-text">WPA 加密</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <LABEL> 
                                                                                                        <SELECT id=wlACWpa name="wlACWpa">
                                                                                                            <OPTION value="TKIP" <%if TCWebApi_get("apcli_entry1","EncrypType","h" ) = "TKIP" then asp_Write("selected") end if %>>TKIP
                                                                                                            <OPTION value="AES" <%if TCWebApi_get("apcli_entry1","EncrypType","h" ) = "AES" then asp_Write("selected") end if %>>AES
                                                                                                        </SELECT>
                                                                                                    </LABEL>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='wlACKeyBitD'>
                                                                                                <TD class='w-130'>
                                                                                                    <div class="form-text">加密长度</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <LABEL> 
                                                                                                        <SELECT id=wlKeyBit name="wlACKeyBit">
                                                                                                            <OPTION value="128" <%if TCWebApi_get("apcli_entry1","KeyBit","h" ) = "128" then asp_Write("selected") end if %>>128-bit
                                                                                                            <OPTION value="64" <%if TCWebApi_get("apcli_entry1","KeyBit","h" ) = "64" then asp_Write("selected") end if %>>64-bit
                                                                                                        </SELECT>
                                                                                                    </LABEL>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='wlACKeyIdx'>
                                                                                                <TD class='w-130'>
                                                                                                    <div class="form-text">当前密钥索引</div>
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <LABEL> 
                                                                                                        <SELECT id=wlACKeyIndex name="wlACKeyIndex">
                                                                                                            <OPTION value="1" <%if TCWebApi_get("apcli_entry1","DefaultKeyID","h" ) = "1" then asp_Write("selected") end if %>>1
                                                                                                            <OPTION value="2" <%if TCWebApi_get("apcli_entry1","DefaultKeyID","h" ) = "2" then asp_Write("selected") end if %>>2
                                                                                                            <OPTION value="3" <%if TCWebApi_get("apcli_entry1","DefaultKeyID","h" ) = "3" then asp_Write("selected") end if %>>3
                                                                                                            <OPTION value="4" <%if TCWebApi_get("apcli_entry1","DefaultKeyID","h" ) = "4" then asp_Write("selected") end if %>>4
                                                                                                        </SELECT>
                                                                                                    </LABEL>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR id='wlACKey'>
                                                                                                <TD class='w-130'>
                                                                                                    <div class="form-text">密钥</div>
                                                                                                </TD>
                                                                                                <TD><INPUT maxLength=26 name=wlACKeys value="<% if tcWebApi_get("apcli_entry1", "Key", "h") <> "N/A" then tcWebApi_get("apcli_entry1", "Key", "s") end if %>"></TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD colspan="2" class="newcheck"><INPUT onclick=SyncWlanACCFG() type=checkbox <%if tcWebApi_get("apcli_entry1","needSync","h") = "1" then asp_Write("checked") end if%> name=cb_SyncWlACCFG>
                                                                                                    <div class="form-text" style="display: inline-block;margin-left: 2px;">WLAN下行与WLAN中继上行使用相同的无线配置</div>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD colspan="2">
                                                                                                    <div class="font-help" style="width: 316px;margin-left: 44px;">提示：设置后，设备将会自动切换到WLAN上行模式。</div>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD colspan="2">
                                                                                                    <P align=center style="margin-top: 48px;margin-left: -274px;">
                                                                                                        <INPUT id=btnSave2 name=btnSave2 onclick=btnSave(2); type=button value="确 定" style="width: 140px;">
                                                                                                        <INPUT id=btnCancel0 name=btnCancel0 style="margin-left: 24px;" onclick=onCancel(); type=button value="取 消">
                                                                                                        <INPUT id=btnReSet2 name=btnReSet2 style="margin-left: 24px;" onclick=btnReSet(); type=button value="重 置">
                                                                                                    </P>
                                                                                                </TD>
                                                                                            </TR>
                                                                                    <!--		<TR>
                                                                                                <TD colspan="2">
                                                                                                    <div class="form-text">WPS方式添加组网</div>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TR>
                                                                                                <TD colspan="2">
                                                                                                <P align=center>
                                                                                                    <INPUT id=acWPSMode name=acWPSMode onclick=wpsbtn(2); type=button value="WPS模式连接">
                                                                                                </P>
                                                                                                </TD>
                                                                                            </TR>  -->
                                                                                            <TBODY>
                                                                                        </TABLE>
                                                                                    </DIV>
                                                                                    <DIV id="AP设置_item">
                                                                                        <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
                                                                                            <TBODY>
                                                                                            <TR>
                                                                                                <TD> <!--
                                                                                                    <INPUT id=cb_EnableAPMode onclick=EnableAPMode() type=checkbox name=cb_EnableAPMode <%if tcWebApi_get("WanInfo_Common","CurAPMode","h") = "Bridge" then asp_Write("checked") elseif tcWebApi_get("APWanInfo_Common","FixedAPMode","h") = "Bridge" then asp_Write("checked") end if%>>
                                                                                                    <input type="hidden" name="APModeEnable" value="<%if tcWebApi_get("APWanInfo_Common","APModeEnable","h") <> "N/A" then tcWebApi_get("APWanInfo_Common","APModeEnable","s") else asp_write("") end if%>"> -->
                                                                                                </TD>
                                                                                                <TD>
                                                                                                    <div class="font-help">启用桥接模式设置后，通过一根网线将路由器WAN口和网关的LAN口相连，即可实现上网。</div>
                                                                                                </TD>
                                                                                            </TR>
                                                            <% if tcWebApi_get("WebCustom_Entry", "isIPTVPortBindSupported","h") = "Yes" then %>
                                                                                            <script language="JavaScript" type="text/JavaScript">
                                                                                            createIPTVBindList(3);
                                                                                            </script>
                                                            <% end if %>
                                                                                            <TR>
                                                                                                <TD colspan="2">
                                                                                                <P align=center style="margin-top: 48px;margin-left: -360px;">
                                                                                                    <INPUT id=btnCancel0 name=btnCancel0 onclick=onCancel(); type=button value="取 消">
                                                                                                    <INPUT id=btnSave3 name=btnSave3 onclick=btnSave(3); type=button style="margin-left: 60px;width: 140px;" value="确 定">
                                                                                                </P>
                                                                                                </TD>
                                                                                            </TR>
                                                                                            <TBODY>
                                                                                        </TABLE>
                                                                                    </DIV>
                                                        <%end if%>													
                                                                                </TD>
                                                </TR>
                                                <TR>
                                                    <TD><INPUT id=pppIdleTimeout type=hidden value=0 name=pppIdleTimeout>
                                                    <INPUT type=hidden name=xponstate value="Yes">
                                                    <input type='hidden' id='Option60Enable1' name='Option60Enable1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable1","s") end if%>">
                                                    <input type='hidden' id='Option60Enable2' name='Option60Enable2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable2","s") end if%>">
                                                    <input type='hidden' id='Option60Enable3' name='Option60Enable3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable3","s") end if%>">
                                                    <input type='hidden' id='Option60Enable4' name='Option60Enable4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable4","s") end if%>">
                                                    
                                                    <input type='hidden' id='Option60Type1' name='Option60Type1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type1","s") end if%>">
                                                    <input type='hidden' id='Option60Type2' name='Option60Type2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type2","s") end if%>">
                                                    <input type='hidden' id='Option60Type3' name='Option60Type3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type3","s") end if%>">
                                                    <input type='hidden' id='Option60Type4' name='Option60Type4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type4","s") end if%>">
        
                                                    <input type='hidden' id='Option60ValueMode1' name='Option60ValueMode1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode1","s") end if%>">
                                                    <input type='hidden' id='Option60ValueMode2' name='Option60ValueMode2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode2","s") end if%>">
                                                    <input type='hidden' id='Option60ValueMode3' name='Option60ValueMode3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode3","s") end if%>">
                                                    <input type='hidden' id='Option60ValueMode4' name='Option60ValueMode4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode4","s") end if%>">
        
                                                    <input type='hidden' id='Option60Value1' name='Option60Value1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value1","s") end if%>">
                                                    <input type='hidden' id='Option60Value2' name='Option60Value2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value2","s") end if%>">
                                                    <input type='hidden' id='Option60Value3' name='Option60Value3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value3","s") end if%>">
                                                    <input type='hidden' id='Option60Value4' name='Option60Value4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value4","s") end if%>">
        
                                                    </TD></TR>
                                                    <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                <tr>
                <% else %>
                                <tr style="display:none;">
                <% end if %>
                                    <td colspan="2">
                                        <P align=center style="margin-top: 44px;margin-left: -274px;">
                                            <input type="button" id=btnOK name=btnOK onclick="btnSave();" style="width: 140px;" value="确 定">
                                            <input type="button" id=btnCancel name=btnCancel style="margin-left: 24px;" onclick=onCancel() value="取 消">
                                        </P>
                                    </td>
                                </tr>
                                            </TBODY>
                                        </TABLE>
                                    </div>
                                </TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                </FORM>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<script language="JavaScript">
    function lockObj(objName, readST)
    {
        if ( null != getElById(objName) )
        {
            getElById(objName).readOnly = readST;
            getElById(objName).style.color = readST ? 'gray' : '';
        }
    }
    var UsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPUsername","s")%>";
    var PasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPPassword","s")%>";
    var VLANIDOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aVLANIDMark","s")%>";
    if(UsernameOpenFlag == "0")
        lockObj('pppUserName', true);
    if(PasswordOpenFlag == "0")
        lockObj('pppPassword', true);
    if(VLANIDOpenFlag == "0")
        lockObj('vlan', true);
    </script>		
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY>
</HTML>
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>