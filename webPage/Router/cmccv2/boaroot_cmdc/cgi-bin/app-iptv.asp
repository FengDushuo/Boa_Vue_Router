<%
if Request_Form("iptvSave_Flag") = "1" then
    TCWebApi_unset("WanInfo_WanIF")
	TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
	if Request_Form("VLANMode") = "TAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "VlanID")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "v8021P")
			TCWebApi_set("WanInfo_WanIF", "v8021PEnable", "v8021PClick")
	elseif Request_Form("VLANMode") = "UNTAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanUNTAG")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	elseif Request_Form("VLANMode") = "TRANSPARENT" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanTRANSPARENT")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	end if
	TCWebApi_set("WanInfo_WanPVC","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanPVC","ENCAP","ENCAP")
    TCWebApi_set("WanInfo_WanIF","Active","iptvEnable")
	TCWebApi_set("WanInfo_WanIF","PreActive","iptvEnable")
	TCWebApi_set("WanInfo_WanIF","ServiceList","serviceList")
	TCWebApi_set("WanInfo_WanIF","BandActive","BandActive")
	TCWebApi_set("WanInfo_WanIF","LAN1","interface1")
	if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then
	    TCWebApi_set("WanInfo_WanIF","LAN2","interface2")
	end if
	if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then
        TCWebApi_set("WanInfo_WanIF","LAN3","interface3")
        TCWebApi_set("WanInfo_WanIF","LAN4","LAN4")
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then
        TCWebApi_set("WanInfo_WanIF","SSID1","SSID1")
        TCWebApi_set("WanInfo_WanIF","SSID2","SSID2")
        TCWebApi_set("WanInfo_WanIF","SSID3","SSID3")
        TCWebApi_set("WanInfo_WanIF","SSID4","SSID4")
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then
        TCWebApi_set("WanInfo_WanIF","SSIDAC1","SSIDAC1")
        TCWebApi_set("WanInfo_WanIF","SSIDAC2","SSIDAC2")
        TCWebApi_set("WanInfo_WanIF","SSIDAC3","SSIDAC3")
        TCWebApi_set("WanInfo_WanIF","SSIDAC4","SSIDAC4")
	end if
	TCWebApi_set("WanInfo_WanIF","WanMode","wanMode")
	TCWebApi_set("WanInfo_WanIF","LinkMode","linkMode")
	if Request_Form("wanMode") = "Route" then
		TCWebApi_set("WanInfo_WanIF","MTU","MTU")
		if Request_Form("linkMode") = "linkPPP" then
			TCWebApi_set("WanInfo_WanIF","PPPGETIP","PPPGetIpFlag")
			TCWebApi_set("WanInfo_WanIF","CONNECTION","ConnectionFlag")
			TCWebApi_set("WanInfo_WanIF","USERNAME","pppUserName")
			TCWebApi_set("WanInfo_WanIF","PASSWORD","pppPassword")
            TCWebApi_set("WanInfo_WanIF","DNS","dns1")
            TCWebApi_set("WanInfo_WanIF","SecDNS","dns2")
            TCWebApi_set("WanInfo_WanIF","ThirdDNS","third_dns3")
			TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
			if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then
				tcWebApi_set("WanInfo_WanIF","CONNECTION","ppp_DialMethod")
				if Request_Form("ppp_DialMethod") = "Connect_on_Demand" then
					tcWebApi_set("WanInfo_WanIF","CLOSEIFIDLE","pppondemand_idletime")
				end if
			end if
		end if
	elseif Request_Form("wanMode") = "Bridge" then
			TCWebApi_set("WanInfo_WanIF","BridgeMode","bridgeMode")
			TCWebApi_set("WanInfo_WanIF","DHCPRealy","dhcprelay")
	end if
	
	TCWebApi_set("WanInfo_WanIF","IPVERSION","IPVersionValue")
	TCWebApi_set("WanInfo_WanIF","ISP","ISP")
	
	TCWebApi_set("WanInfo_WanIF","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanIF","dot1q","dot1q")
	if Request_Form("dot1q") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","VLANID","VlanID")
	end if
	TCWebApi_set("WanInfo_WanIF","dot1p","dot1p")
	if Request_Form("dot1p") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","dot1pData","dot1pData")
	end if
	tcWebApi_set("WanInfo_WanIF", "DOT1P", "v8021P")
	if Request_Form("MulVIDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","MulticastVID","MulticastVID")
	end if

	TCWebApi_set("WanInfo_WanIF","NATENABLE","NATENABLE")
	TCWebApi_set("WanInfo_WanIF","IGMPproxy","IGMPproxy")
	
	if Request_Form("IPVersionValue") <> "IPv6" then
		if Request_Form("linkMode") = "linkIP" then
			if Request_Form("IpMode") = "Static" then
				TCWebApi_set("WanInfo_WanIF","IPADDR","wanIpAddress")
				TCWebApi_set("WanInfo_WanIF","NETMASK","wanSubnetMask")
				TCWebApi_set("WanInfo_WanIF","GATEWAY","defaultGateway")
				TCWebApi_set("WanInfo_WanIF","DNS","dnsPrimary")
				TCWebApi_set("WanInfo_WanIF","SecDNS","dnsSecondary")
                TCWebApi_set("WanInfo_WanIF","ThirdDNS","dns3")
                TCWebApi_set("WanInfo_WanIF","MannualdnsEnable","dnsDHCP")
            else
                TCWebApi_set("WanInfo_WanIF","MannualdnsEnable","dnsDHCP")
                if Request_Form("dnsDHCP") = "1" then
                    TCWebApi_set("WanInfo_WanIF","DNS","dns1")
                    TCWebApi_set("WanInfo_WanIF","SecDNS","dns2")
                    TCWebApi_set("WanInfo_WanIF","ThirdDNS","third_dns3")
                end if
			end if
		end if
	end if

	if Request_Form("IPVersionValue") <> "IPv4" then
			TCWebApi_set("WanInfo_WanIF","DHCPv6","pppv6Mode")
			TCWebApi_set("WanInfo_WanIF","GW6_Manual","Disable_Flag")
		if Request_Form("IdIpv6AddrType") = "Static" then
			TCWebApi_set("WanInfo_WanIF","IPADDR6","IdIpv6Addr")
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
			TCWebApi_set("WanInfo_WanIF","PREFIX6","IdIpv6PrefixLen")
			TCWebApi_set("WanInfo_WanIF","DNS6","IdIpv6Dns1")
			TCWebApi_set("WanInfo_WanIF","SecDNS6","IdIpv6Dns2")
		elseif Request_Form("IdIpv6AddrType") = "DHCP" then
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
		end if
	end if
	
	TCWebApi_set("WanInfo_WanIF","IFIdx","WanCurrIFIdx")
	if Request_Form("OperatorStyle") = "Add" then
		TCWebApi_set("Wan_Common","LatestIFIdx","WanCurrIFIdx")
		TCWebApi_set("WanInfo_WanPVC", "EPONEnable", "EPONEnable")
		TCWebApi_set("WanInfo_WanPVC", "GPONEnable", "GPONEnable")
	end if

	if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then
		if Request_Form("DsliteEnable") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","DsliteEnable")
			TCWebApi_set("WanInfo_WanIF","DsliteMode","dslitemode")
			if Request_Form("dslitemode") = "1" then
					TCWebApi_set("WanInfo_WanIF","DsliteAddr","dsliteaddress")
			end if
		else
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","DsliteEnable")
		end if
	end if

	if Request_Form("PDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","PDEnable","PDEnable")
	else
		TCWebApi_set("WanInfo_WanIF","PDEnable","PDEnable")
	end if

	if Request_Form("pdmodeUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "DHCPv6PD")
		if Request_Form("DHCPv6PD") = "No" then
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "PDOrigin")			
			TCWebApi_set("WanInfo_WanIF", "PDPrefix", "pdprefix")
			TCWebApi_set("WanInfo_WanIF", "PrefixPltime", "pdprefixptime")
			TCWebApi_set("WanInfo_WanIF", "PrefixVltime", "pdprefixvtime")
		else
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "PDOrigin")
		end if
	else
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "DHCPv6PD")
		TCWebApi_set("WanInfo_WanIF", "PDOrigin", "PDOrigin")
	end if
	
	if tcwebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPEnable", "DHCPEnable")
	end if
	
	if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "wanhwaddress")
	end if

	if tcWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyDisabled")
		tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user_zero")
		tcWebApi_set("WanInfo_WanIF","BridgeInterface","BridgeInterface")
		if Request_Form("ppp_proxy_biUsed") = "Yes" then
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_mode")
			if Request_Form("ppp_proxy_bi_mode") = "1" then
				tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyEnabled")
				tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user")
			elseif Request_Form("ppp_proxy_bi_mode") = "2" then
				tcWebApi_set("WanInfo_WanIF","BridgeInterface","BridgeInterface")
			end if
		else
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_disable")
		end if
	else		
		if Request_Form("pppbiUsed") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","BridgeInterface")
		else
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","BridgeInterface")
		end if
	end if

	if Request_Form("OperatorStyle") <> "Add" then
		tcWebApi_set("WanInfo_WanIF","Option60Enable1","Option60Enable1")
		tcWebApi_set("WanInfo_WanIF","Option60Enable2","Option60Enable2")
		tcWebApi_set("WanInfo_WanIF","Option60Enable3","Option60Enable3")
		tcWebApi_set("WanInfo_WanIF","Option60Enable4","Option60Enable4")

		tcWebApi_set("WanInfo_WanIF","Option60Type1","Option60Type1")
		tcWebApi_set("WanInfo_WanIF","Option60Type2","Option60Type2")
		tcWebApi_set("WanInfo_WanIF","Option60Type3","Option60Type3")
		tcWebApi_set("WanInfo_WanIF","Option60Type4","Option60Type4")

		tcWebApi_set("WanInfo_WanIF","Option60ValueMode1","Option60ValueMode1")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode2","Option60ValueMode2")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode3","Option60ValueMode3")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode4","Option60ValueMode4")

		tcWebApi_set("WanInfo_WanIF","Option60Value1","Option60Value1")
		tcWebApi_set("WanInfo_WanIF","Option60Value2","Option60Value2")
		tcWebApi_set("WanInfo_WanIF","Option60Value3","Option60Value3")
		tcWebApi_set("WanInfo_WanIF","Option60Value4","Option60Value4")
	end if

	if tcWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "maccloneAddress")
	end if

	TCWebApi_commit("WanInfo_WanPVC")
	TCWebApi_save()
elseif Request_Form("iptvSave_Flag") = "2" then
    TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
    TCWebApi_commit("WanInfo_Common")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
    <TITLE>IPTV设置</TITLE>
    <META http-equiv=Content-Language content=zh-cn>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
    <SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
    <SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
    <SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
    <SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT>
    <script language="javascript" src="/JS/polyfill.min.js"></script>
    <script language="javascript" src="/JS/popup.js"></script>
    <script language="javascript" src="/JS/scm_select.js"></script>
    <script language="javascript" src="/JS/scm_radio.js"></script>
    <script language="javascript" src="/JS/scm_checkbox.js"></script>
    <META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>

<style>
    .newcheck input[type="checkbox"], .input-checkbox {
        margin-left: -12px;
    }
</style>

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
        <div class="in_welcom" >
            <span>您好！</span>
            <a onclick="top.location.href='/'">
                <span>返回主页</span>
            </a>
            <input id="Selected_Menu" type="hidden" value="应用->IPTV设置" name="Selected_Menu">
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

            <SCRIPT language=JavaScript type=text/javascript>
                    var index = "<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>";
                    console.log(index)

                    var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
                    // num 0
                    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
                    vArrayStr = vArrayStr.replace(/VOICE/g, "VOIP");
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

                    function getMaxIFIdx() {
                        var IFIdxLen = IFIdxArray.length;
                        var IFIdxStoreV = 0;
                        var i = 0;
                        var IFIdxV = 0;

                        if (isPlusInteger(IFIdxStore))
                            IFIdxStoreV = parseInt(IFIdxStore);

                        IFIdxStoreV++;

                        for (i = IFIdxStoreV; i <= 99; i++) {
                            if (!isIdExist(i))
                                return i;
                        }

                        for (i = 1; i < IFIdxStoreV; i++) {
                            if (!isIdExist(i))
                                return i;
                        }

                        return 1;
                    }

                    function isIdExist(ifIdx) {
                        var i = 0;
                        var IFIdxV = 0;
                        var IFIdxLen = IFIdxArray.length;

                        for (i = 0; i < IFIdxLen; i++) {
                            IFIdxV = parseInt(IFIdxArray[i]);

                            if (IFIdxV == ifIdx)
                                return true;
                        }

                        return false;
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

                    function LoadFrame()
                    {
                        with ( document.forms[0])
                        {
                            scmSelect.init($('body'));
                            scmRadio.init($('body'));
                            scmCheckbox.init($('body'));
                            setEnable();
                            ChangeInterface(1);
                            ChangeInterface(2);
                            ChangeInterface(3);
                            if (index != 8)
                                WanIdChange();
                        }
						var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
						set_action(query_string);
                    }

                    function WanIdChange() {
                        document.ConfigForm.iptvSave_Flag.value = "2";
                        $("form[name='ConfigForm']").submit();
                    }

                    function setEnable()
                    {
                        var enChecked = getCheckVal('chIptvEnable');
                        if (enChecked == '1')
                        {
                            document.ConfigForm.iptvEnable.value = "Yes";
                        }
                        else
                        {
                            document.ConfigForm.iptvEnable.value = "No";
                        }
                    }

                    function btnSubmit()
                    {
                        var	vForm = document.ConfigForm;
                        var enChecked = getCheckVal('chIptvEnable');
                        vForm.OperatorStyle.value = "Modify"; //modify
                        vForm.iptvSave_Flag.value = "1";
                        vForm.submit();
                    }
                    
                    function ChangeInterface(num)
                    {
                        var enChecked = getCheckVal('Interface' + num);
                        if (enChecked == '1')
                        {
                            document.ConfigForm["interface" + num].value = "Yes";
                        }
                        else
                        {
                            document.ConfigForm["interface" + num].value = "No";
                        }
                    }
                </SCRIPT>
            <TR>
                <TD class="content">
                    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
                        <TBODY>
                            <TR>
                                <TD id="MenuArea_L2">
                                    <ul class="TRD">
                                        <li name="IGMPSet" id="IPTV设置" class="TSD">IPTV设置</li>
                                    </ul>
                                </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById('Selected_Menu').value);
                                </SCRIPT>
                                <TD valign="top">
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                        style="width: 714px;margin: 30px auto;">
                                        <TBODY>
                                            <TR>
                                                <TD>
                                                    <div class="advanceTitle">IPTV设置</div>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD>
                                                    <div class="title-line"></div>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD>
                                                    <FORM name="ConfigForm" action="/cgi-bin/app-iptv.asp" method="post"
                                                        style="padding: 0;">
                                                        <input type="hidden" name="iptvEnable" value="<% tcWebApi_get("WanInfo_WanIF", "Active", "s") %>">
                                                        <input type="hidden" name="wanMode" value="Bridge">
                                                        <input type="hidden" name="serviceList" value="IPTV">
                                                        <input type="hidden" name="linkMode" value="linkIP">
                                                        <input type="hidden" name="IPVersionValue" value="IPv4">
                                                        <input type="hidden" name="VLANMode" value="<% tcWebApi_get("WanInfo_WanPVC", "VLANMode", "s") %>">
                                                        <input type="hidden" name="v8021P" value="0">
                                                        <input type="hidden" name="v8021PClick" value="No">
                                                        <input type="hidden" name="WanCurrIFIdx" value="2">
                                                        <input type="hidden" name="curSetIndex" value="8">
                                                        <input type="hidden" name="WanActive" value="Yes">
                                                        <INPUT type="hidden" name="dnsDHCP" value="0">

                                                        <input type="hidden" name="ENCAP" value="1483 Bridged IP LLC">
                                                        <input type="hidden" name="BandActive" value="N/A">
                                                        <input type="hidden" name="LAN4" value="No">
                                                        <input type="hidden" name="SSID1" value="No">
                                                        <input type="hidden" name="SSID2" value="No">
                                                        <input type="hidden" name="SSID3" value="No">
                                                        <input type="hidden" name="SSID4" value="No">
                                                        <input type="hidden" name="SSIAC1" value="No">
                                                        <input type="hidden" name="SSIAC2" value="No">
                                                        <input type="hidden" name="SSIAC3" value="No">
                                                        <input type="hidden" name="SSIAC4" value="No">
                                                        <input type="hidden" name="MTU" value="1500">
                                                        <input type="hidden" name="ISP" value="3">
                                                        <input type="hidden" name="dot1pData" value="0">
                                                        <input type="hidden" name="dot1p" value="Yes">
                                                        <input type="hidden" name="dot1q" value="Yes">
                                                        <input type="hidden" name="NATENABLE" value="Disabled">
                                                        <input type="hidden" name="IGMPproxy" value="No">
                                                        <input type="hidden" name="EPONEnable" value="Yes">
                                                        <input type="hidden" name="GPONEnable" value="Yes">
                                                        <input type="hidden" name="DsliteEnable" value="No">
                                                        <input type="hidden" name="PDEnable" value="No">
                                                        <input type="hidden" name="DHCPv6PD" value="No">
                                                        <input type="hidden" name="PDOrigin" value="None">
                                                        <input type="hidden" name="DHCPEnable" value="0">
                                                        <input type="hidden" name="BridgeInterface" value="No">

                                                        <input type="hidden" name="iptvSave_Flag" value="0">
                                                        <input type="hidden" name="OperatorStyle" value="Add">
                                                        <input type="hidden" name="interface1" value="0">
                                                        <input type="hidden" name="interface2" value="0">
                                                        <input type="hidden" name="interface3" value="0">
                                                        
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <TBODY>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="form-text">IPTV网络</div>
                                                                    </TD>
                                                                    <TD>
                                                                        <INPUT class="input-onoff" type=checkbox
                                                                            name=chIptvEnable onclick="setEnable()" <%if
                                                                            tcWebApi_get("WanInfo_WanIF","Active","h")="Yes"
                                                                            then asp_Write("checked") end if%>>
                                                                    </TD>
                                                                </TR>
                                                            </TBODY>
                                                        </TABLE>
                                                                <div>
                                                                    <div class="form-text" style="display: inline-block;width: 174px;">LAN接口</div>
                                                                    <INPUT id=Interface1 onclick="ChangeInterface(1)"
                                                                        type=checkbox value="0" name="Interface1" <%if
                                                                        tcWebApi_get("WanInfo_WanIF","LAN1","h")="Yes"
                                                                        then asp_Write("checked") end if%>>
                                                                    <span style="margin-right: 20px;"> 网口1</span>
                                                                    <INPUT id=Interface2 onclick="ChangeInterface(2)"
                                                                        type=checkbox value="0" name="Interface2" <%if
                                                                        tcWebApi_get("WanInfo_WanIF","LAN2","h")="Yes"
                                                                        then asp_Write("checked") end if%>>
                                                                    <span style="margin-right: 20px;"> 网口2</span>
                                                                    <INPUT id=Interface3 onclick="ChangeInterface(3)"
                                                                        type=checkbox value="0" name="Interface3" <%if
                                                                        tcWebApi_get("WanInfo_WanIF","LAN3","h")="Yes"
                                                                        then asp_Write("checked") end if%>>
                                                                    <span> 网口3</span>
                                                                </div>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <TBODY>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="form-text">VLAN-ID</div>
                                                                    </TD>
                                                                    <TD><INPUT TYPE="TEXT" NAME="VlanID" MAXLENGTH="32"
                                                                            VALUE="<% tcWebApi_get("WanInfo_WanPVC","VLANID","s") %>"></TD>
                                                                </TR>
                                                            </TBODY>
                                                        </TABLE>
                                                    </FORM>
                                                    <P style="margin-left: 182px;">
                                                        <INPUT onclick='btnSubmit()' type=button
                                                            value="保 存" name=applyIPTV>
                                                    </P>
                                                </TD>
                                            </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                </TD>
            </TR>
        </TBODY>
    </TABLE>
    </TD>
    </TR>
    </TBODY>
    </TABLE>
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
