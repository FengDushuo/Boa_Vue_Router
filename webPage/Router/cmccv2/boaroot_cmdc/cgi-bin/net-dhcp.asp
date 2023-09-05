<%
if Request_Form("IPV4_Flag") = "1" then
	if tcwebApi_get("Lan_Entry","IP","h") <> Request_Form("ethIpAddress") then
		TCWebApi_constSet("Account_Entry0","Logged","0")
		TCWebApi_constSet("Account_Entry0","Logoff","1")
		TCWebApi_constSet("Account_Entry1","Logged","0")
		TCWebApi_constSet("Account_Entry1","Logoff","1")
		TCWebApi_constSet("Account_Entry2","Logged","0")
		TCWebApi_constSet("Account_Entry2","Logoff","1")
		TCWebApi_set("Lan_Entry","IP","ethIpAddress")
		TCWebApi_set("Lan_Entry","orig_IP","ethIpAddress")
        TCWebApi_set("Dmz_Entry","DMZ_IP","DMZ_IP_SET")
        
	end if
	TCWebApi_set("Lan_Entry","netmask","ethSubnetMask")
	TCWebApi_set("Lan_Entry","orig_netmask","ethSubnetMask")
	TCWebApi_set("Lan_Dhcp","type","dhcpSrvType")
	
	if Request_Form("dhcpSrvType") = "0" then
		TCWebApi_unset("DhcpRelay_Entry")
        TCWebApi_commit("Dhcpd_Common")
	end if
	
	if Request_Form("dhcpSrvType") = "1" then
		TCWebApi_set("Dhcpd_Common","lease","dhcpLeasedTimeFrag")
		TCWebApi_set("Dhcpd_Common","start","dhcpEthStart")
		TCWebApi_set("Dhcpd_Common","pool_count","EthendIPcount")
		TCWebApi_set("Dhcpd_Option60","DeviceStyle","IpPoolIndex")
		TCWebApi_set("Dhcpd_Option60","lease","dhcpLeasedTimeFrag")
		if Request_Form("RouteIPChangeFlag") = "1" then
			TCWebApi_set("Dhcpd_Option60","startSTB","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countSTB","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startPhone","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countPhone","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startCamera","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countCamera","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","startHGW","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countHGW","EthendIPcount")
			TCWebApi_set("Dhcpd_Option60","start","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_count","EthendIPcount")
	  end if
		if Request_Form("IpPoolIndex") = "STB" then
			TCWebApi_set("Dhcpd_Option60","startSTB","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countSTB","EthendIPcount")
		elseif Request_Form("IpPoolIndex") = "Phone" then
			TCWebApi_set("Dhcpd_Option60","startPhone","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countPhone","EthendIPcount")
		elseif Request_Form("IpPoolIndex") = "Camera" then
			TCWebApi_set("Dhcpd_Option60","startCamera","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countCamera","EthendIPcount")
		elseif Request_Form("IpPoolIndex") = "HGW" then
			TCWebApi_set("Dhcpd_Option60","startHGW","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_countHGW","EthendIPcount")
		else
			TCWebApi_set("Dhcpd_Option60","start","dhcpEthStart")
			TCWebApi_set("Dhcpd_Option60","pool_count","EthendIPcount")
		end if
		
		TCWebApi_unset("DhcpRelay_Entry")
		TCWebApi_commit("Dhcpd_Common")
		TCWebApi_commit("Dhcpd_Option60")
	end if
	
	if Request_Form("dhcpSrvType") = "2" then
		TCWebApi_set("DhcpRelay_Entry","Server","dhcpRelayServerIP")
		TCWebApi_commit("DhcpRelay_Entry")
        TCWebApi_commit("Dhcpd_Common")
	end if

    TCWebApi_commit("Dmz_Entry")
	TCWebApi_commit("Lan")
	TCWebApi_save()
end if

if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <>"Yes" then
if Request_Form("RA_Flag") = "1" then
	TCWebApi_set("Radvd_Entry","Enable","RAEnable_Flag")
	TCWebApi_set("Radvd_Entry","Mode","RAMode")
	if Request_Form("RAMode") = "1" then
		TCWebApi_set("Radvd_Entry","PrefixIPv6","radvdPrefix")
		TCWebApi_set("Radvd_Entry","Prefixv6Len","RAPrefixLen")
		TCWebApi_set("Radvd_Entry","PreferredLifetime","RAt1")
		TCWebApi_set("Radvd_Entry","ValidLifetime","RAt2")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","MinRAInterval","RACycMin")
		TCWebApi_set("Radvd_Entry","MaxRAInterval","RACycMax")
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","1")
	else
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","0")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","DelegatedWanConnection","rapdsource")
	end if
	
	TCWebApi_commit("Radvd_Entry")
	TCWebApi_save()
end if

if Request_Form("Dhcp1_Flag") = "1" then
	TCWebApi_set("Dhcp6s_Entry","Enable","EnDHCPServerFlag")
	if Request_Form("EnDHCPServerFlag") = "1" then
		TCWebApi_set("Dhcp6s_Entry","Mode","DHCPSetTypeFlag")
		if Request_Form("DHCPSetTypeFlag") = "1" then
			TCWebApi_set("Dhcp6s_Entry","AddrFormat","AddrFormat")
            TCWebApi_set("Dhcp6s_Entry","Br0Addr","dhcpIPv6")
            TCWebApi_set("Dhcp6s_Entry","MinAddress","dhcpStartaddr")
            TCWebApi_set("Dhcp6s_Entry","MaxAddress","dhcpEndaddr")
            TCWebApi_set("Dhcp6s_Entry","ValidLifetime","dhcpRefreshtime")
			TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne")
			TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo")
            TCWebApi_set("Dhcp6s_Entry","DNSserver3","DnsSrvThree")
			TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
		else
			if Request_Form("dnssource") = "999" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","2")
			elseif Request_Form("dnssource") = "998" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
				TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne_Source")
				TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo_Source")
                TCWebApi_set("Dhcp6s_Entry","DNSserver3","DnsSrvThree_Source")
			else
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","0")
				TCWebApi_set("Dhcp6s_Entry","DNSWANConnection","dnssource")
			end if
		end if
	end if

	TCWebApi_commit("Dhcp6s_Entry")
	TCWebApi_save("Dhcp6s_Entry")
end if
end if

if TCWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
	if Request_Form("Static_Flag") = "1" then
		TCWebApi_constSet("Dhcpd_Common","Action","Add")
		TCWebApi_set("Dhcpd_Common","StaticIP","StaticIpAddress")
		TCWebApi_set("Dhcpd_Common","StaticMAC","StaticMACAddress")
		
		TCWebApi_commit("Dhcpd")
		TCWebApi_save()
	end if
	if Request_Form("Static_Flag") = "2" then
		TCWebApi_constSet("Dhcpd_Common","Action","Del")
		TCWebApi_set("Dhcpd_Common","DeleteIndex","delnum")
		
		TCWebApi_commit("Dhcpd")
		TCWebApi_save()
	end if
end if

if Request_Form("RouteIPChangeFlag") = "1" then
	TCWebApi_constSet("System_Entry","reboot_type","1") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>LAN侧地址配置</TITLE>
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
    .ipv6Page input,
    .ipv6Page select,
    .ipv6Page .select-list,
    .ipv6Page .select-list.select-open .select-list-options {
        width: 320px;
    }

    .ipv6Page .select-list-selected {
        width: 253px;
    }
    
    .popup .popup-dialog {
        width: 400px;
    }
</style>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
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
		<input id="Selected_Menu" type="hidden" value="网络->LAN侧地址配置" name="Selected_Menu"></TD>
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
    <TD class="content">
		<script language="JavaScript" type="text/JavaScript">
        var dhcpListLen = 0;
		function RAUseWanChange()
		{
			with (document.forms[2])
			{
				if ("Normal" == RAUseWan.value && 1 == getCheckVal('radvdSrvType'))
				{
					setDisplay('RadvdPrefixCfg', 1);
					RAMode.value = "1";
				}
				else
				{
					setDisplay('RadvdPrefixCfg', 0);
					RAMode.value = "0";
				}
				
				setDisplay('rapdsourcepart', ('Normal' == RAUseWan.value) ? 0 : 1);
				setDisplay('ramoflagdisp_1', ('Normal' == RAUseWan.value) ? 0 : 1);
				setDisplay('ramoflagdisp_2', ('Normal' == RAUseWan.value) ? 0 : 1);
			}
		}
		function RATypeClick()
		{
			with (document.forms[2])
			{
				if (getCheckVal('radvdSrvType') == 0)
				{
					disableRASrv();
					RAEnable_Flag.value = "0";
				}
				else
				{
					enableRASrv(1);
					RAEnable_Flag.value = "1";
					RAUseWanChange();
				}
			}
		}
		function RAMOClick(flag)
		{
			with (document.forms[2])
			{
				if(0 == flag){
					if (getCheckVal('radvdmanageden') == 0)
					{
						RAManagedEn_Flag.value = "0";
					}
					else
					{
						RAManagedEn_Flag.value = "1";
					}
				}
				else if(1 == flag){
					if (getCheckVal('radvdotheren') == 0)
					{
						RAOtherEn_Flag.value = "0";
					}
					else
					{
						RAOtherEn_Flag.value = "1";
					}
				}
			}
		}

	var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
	// num 0
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryName = vArrayStr.split(','); 
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
	var vEntryIndex = vArrayStr.split(',');
	<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "5") %>
	// num 6
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vIPVersion = vArrayStr.split(',');

	function dnsSourceListChg()
	{
		var dnsSourceType = getSelectVal('dnssource');
		
		if ( '998' == dnsSourceType )
		{
			setDisplay('dnssourcepart_2', 1);
			setDisplay('dnssourcepart_3', 1);
            setDisplay('dnssourcepart_4', 1);
		}
		else
		{
			setDisplay('dnssourcepart_2', 0);
			setDisplay('dnssourcepart_3', 0);
            setDisplay('dnssourcepart_4', 0);
		}
	}

	function initDnsSourceList()
	{
		var DnsSourceIdx = '<% tcWebApi_get("Dhcp6s_Entry","DNSWANConnection","s") %>';
		var DnsType = '<% tcWebApi_get("Dhcp6s_Entry","DNSType","s") %>';
		var i = 0;
		var isSel = -1;
		var itemCnt = 0;
	
		with (getElById('dnssource'))
		{
			for( i=0; i< parseInt(nEntryNum) + 2; i++)
			{
				var opt;

				if ( 0 == i )
					opt = new Option('HGWProxy', '999');
				else if ( 1 == i )
					opt = new Option('Static', '998');
				else
				{
					var WAN_Entry = i - 2;
					var CONName = vEntryName[WAN_Entry];
					if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
						|| 'IPv4' == vIPVersion[WAN_Entry] )
						continue;

					opt = new Option(CONName, vEntryIndex[WAN_Entry]);
				}
				
				if ( 0 == i && '2' == DnsType )
				{
					opt.selected = true;
					isSel = 0;
				}
				else if ( 1 == i && '1' == DnsType )
				{
					opt.selected = true;
					isSel = 1;
				}
				else if ( i > 1 &&  '0' == DnsType && DnsSourceIdx == vEntryIndex[i - 2] )
				{
					opt.selected = true;
					isSel = itemCnt;
				}
				
				itemCnt ++;
				options.add ( opt );
			}
			
			if ( isSel >= 0 )
				options[isSel].setAttribute('selected', 'true');
		}
	}
	
    var numGlobal = 0;
	function initRaPDSourceList()
	{
		var RaPdSourceIdx = '<% tcWebApi_get("Radvd_Entry","DelegatedWanConnection","s") %>';
		var RaPdType = '<% tcWebApi_get("Radvd_Entry","AutoPrefix","s") %>';
		var RaPdTmpUseIdx = '<% tcWebApi_get("WanInfo_Common","PDRUNIFIdx","s") %>';
		var i = 0;
		var isSel = -1;
		var bakSel = -1;
		var itemCnt = 0;

		with (getElById('rapdsource'))
		{
			for( i=0; i< parseInt(nEntryNum); i++)
			{
				var opt;
				var CONName = vEntryName[i];

				if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 && CONName.indexOf('_IPTV_R_') < 0 && CONName.indexOf('_OTT_R_') < 0)
					|| 'IPv4' == vIPVersion[i] ) {
                        continue;
                    }
					

				opt = new Option(CONName, vEntryIndex[i]);
                numGlobal = 1;

				if ( 'N/A' == RaPdType || 0 == RaPdSourceIdx.length )
				{
					if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
					{
						opt.selected = true;
						isSel = itemCnt;
					}
				}
				else
				{
					if (  'N/A' != RaPdSourceIdx && RaPdSourceIdx == vEntryIndex[i] )
					{
						opt.selected = true;
						isSel = itemCnt;
					}
					else
					{
						if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
						{
							bakSel = itemCnt;
						}
					}
				}

				itemCnt ++;
				options.add ( opt );
			}
			if ( isSel >= 0 ) {
                options[isSel].setAttribute('selected', 'true');
            }
				
			else if ( bakSel >= 0 )
			{
					options[bakSel].selected = true;
					options[bakSel].setAttribute('selected', 'true');
			}
		}
	}

	  function	getendetherIPforCount(start, count)
	  {
	  	var vret = "";
		var S = start.split('.');
		if(S.length > 3)
		{
			var temp = parseInt(count) + parseInt(S[3]) - 1;
			vret = S[0] + '.' + S[1] + '.' + S[2] + '.' + temp.toString();
		}
		return vret;
	  }
function dhcpcnst(domain,dhcpStart,dhcpEnd,LeaseTime,Enable,STBMinAddr,STBMaxAddr,STBRelay,PhoneMinAddr,PhoneMaxAddr,PhoneRelay,CameraMinAddr,CameraMaxAddr,CameraRelay,ComputerMinAddr,ComputerMaxAddr,ComputerRelay,HGWMinAddr,HGWMaxAddr,HGWRelay, PortRelayEnable, PortRelayStr)
{
this.domain = domain;
this.dhcpStart = dhcpStart;
this.dhcpEnd = dhcpEnd;
this.LeaseTime = LeaseTime;
this.Enable = Enable;
this.STBMinAddr = STBMinAddr;
this.STBMaxAddr = STBMaxAddr;
this.STBRelay = STBRelay;
this.PhoneMinAddr = PhoneMinAddr;
this.PhoneMaxAddr = PhoneMaxAddr ;
this.PhoneRelay = PhoneRelay;
this.CameraMinAddr = CameraMinAddr;
this.CameraMaxAddr  = CameraMaxAddr ;
this.CameraRelay = CameraRelay;
this.ComputerMinAddr = ComputerMinAddr;
this.ComputerMaxAddr = ComputerMaxAddr ;
this.ComputerRelay = ComputerRelay ;
this.HGWMinAddr = HGWMinAddr;
this.HGWMaxAddr = HGWMaxAddr;
this.HGWRelay = HGWRelay;
this.PortRelayEnable = PortRelayEnable;
this.PortRelayStr = PortRelayStr;
}
var dhcpst = new Array(new dhcpcnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement","<% tcWebApi_get("Dhcpd_Common","start","s") %>","<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>","86400","1","<% tcWebApi_get("Dhcpd_Option60","startSTB","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countSTB","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startPhone","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countPhone","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startCamera","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countCamera","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","start","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_count","s" ) %>","0","<% tcWebApi_get("Dhcpd_Option60","startHGW","s" ) %>","<% tcWebApi_get("Dhcpd_Option60","pool_countHGW","s" ) %>","0","0",""),null);
poolIndex = top.lanDevIndex;
var proto = ''
var natEnbl = 1;
var dhcpEnbl = dhcpst[0].Enable;
var dhcpStart = "";
if(dhcpst[0].dhcpStart != "N/A")
	dhcpStart = dhcpst[0].dhcpStart;
var dhcpEnd = getendetherIPforCount(dhcpStart,dhcpst[0].dhcpEnd);
var dhcpLease = dhcpst[0].LeaseTime;
var dhcpStart1_1 = dhcpst[0].STBMinAddr;
var dhcpEnd1_1 = getendetherIPforCount(dhcpStart1_1, dhcpst[0].STBMaxAddr);
var enblrelay_stb = dhcpst[0].STBRelay;
var dhcpStart1_2 = dhcpst[0].PhoneMinAddr;
var dhcpEnd1_2 = getendetherIPforCount(dhcpStart1_2, dhcpst[0].PhoneMaxAddr);
var enblrelay_phone = dhcpst[0].PhoneRelay;
var dhcpStart1_3 = dhcpst[0].CameraMinAddr
var dhcpEnd1_3 = getendetherIPforCount(dhcpStart1_3, dhcpst[0].CameraMaxAddr);
var enblrelay_camera = dhcpst[0].CameraRelay;
var dhcpStart1_4 = dhcpst[0].ComputerMinAddr;
var dhcpEnd1_4 = getendetherIPforCount(dhcpStart1_4, dhcpst[0].ComputerMaxAddr);
var enblrelay_computer = dhcpst[0].ComputerRelay;
var dhcpStart1_5 = dhcpst[0].HGWMinAddr;
var dhcpEnd1_5 = getendetherIPforCount(dhcpStart1_5, dhcpst[0].HGWMaxAddr);
var enblrelay_hgw = dhcpst[0].HGWRelay;
var dhcpPortRelayEnable = dhcpst[0].PortRelayEnable;
var host = [["InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","192.168.1.1","255.255.255.0"],null];
var oldAddrPrimary;
var oldMaskPrimary;
var oldstartAddrPrimary;
var oldEndAddrPrimary;

if (host.length > 1)
{
oldAddrPrimary = host[0][1];
oldMaskPrimary = host[0][2];
}
function dhcpv6cnst(domain,Enable,AllocateWan,Prefix,PrefixLength,Preferredlifetime,Validlifetime,DnsSrver)
{
this.domain            = domain;
this.Enable            = Enable;
this.allocateWan       = AllocateWan;
this.Prefix            = Prefix;
this.PrefixLength      = PrefixLength;
this.Preferredlifetime = Preferredlifetime;
this.Validlifetime     = Validlifetime;
var dns           = DnsSrver.split(',');
this.DnsSrvOne    = dns[0];
if ( dns.length > 1 )
{
this.DnsSrvTwo = dns[1];
}
else
{
this.DnsSrvTwo = '';
}
}
var dhcpv6st = new Array(new dhcpv6cnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_DHCPv6","1","UseAllocatedSubnet","","64","3600","7200",""),null);
if (dhcpv6st.length > 0)
{
var dhcpEnb6l = dhcpv6st[0].Enable;
var UseAllc  = dhcpv6st[0].allocateWan;
var DnsOne   = dhcpv6st[0].DnsSrvOne;
var DnsTwo   = dhcpv6st[0].DnsSrvTwo;
if (DnsOne == '')
{
DnsOne = "fe80::1";
}
var Prefix   = dhcpv6st[0].Prefix;
var Prelen   = dhcpv6st[0].PrefixLength;
var Domana   = "";
var Time1    = dhcpv6st[0].Preferredlifetime;
var Time2    = dhcpv6st[0].Validlifetime;
}
else
{
var dhcpEnb6l = "1";
var UseAllc  = "UseAllocatedSubnet";
var DnsOne   = "fe80::1";
var DnsTwo   = "";
var Prefix   = "";
var Prelen   = "64";
var Domana   = "";
var Time1    = "3600";
var Time2    = "7200";
}
function radvdcnst(domain,Enable,AllocateWan,AssConn,Prefix,PrefixLength,Preferredlifetime,Validlifetime)
{
this.domain            = domain;
this.allocateWan       = AllocateWan;
this.AssConn           = AssConn;
this.Prefix            = Prefix;
this.PrefixLength      = PrefixLength;
this.Enable            = Enable;
this.Preferredlifetime = Preferredlifetime;
this.Validlifetime     = Validlifetime;
}
var radvdst = new Array(new radvdcnst("InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.X_CT-COM_SLAAC","1","Normal","1111:db8:1:0::","1111:db8:1:0::","64","3600","7200"),null);
if (radvdst.length > 1)
{
var radvdEnbl = radvdst[0].Enable;
var RAUseAllc  = radvdst[0].allocateWan;
var RAAssCon   = radvdst[0].AssConn;
var RAPrefix   = radvdst[0].Prefix;
var RAPrelen   = radvdst[0].PrefixLength;
var RATime1    = radvdst[0].Preferredlifetime;
var RATime2    = radvdst[0].Validlifetime;
}
else
{
var radvdEnbl = "1";
var RAUseAllc  = "UseAllocatedSubnet";
var RAAssCon   = "";
var RAPrefix   = "";
var RAPrelen   = "64";
var RATime1    = "3600";
var RATime2    = "7200";
}
var changeAddrFlag = false;
function disableDhcp6Srv()
{
with ( document.forms[3] )
{
setCheck("dhcp6SrvType" ,0);
setDisplay('AssConnection',0);
setDisplay('DHCP6SPrefixCfg',0);
// setDisable('dhcpPrefix',1);
// setDisable('PrefixLen' ,1);
// setDisable('t1',1);
// setDisable('t2',1);
setDisable('DnsSrvOne',1);
setDisable('DnsSrvTwo',1);
setDisable('DomainNameText'    ,1);
}
}
function enableDhcp6Srv(formLoad)
{
with ( document.forms[3] )
{
setCheck("dhcp6SrvType",1);
setDisplay('AssConnection',1);
if ( "Normal" == UseWan.value )
{
setDisplay('DHCP6SPrefixCfg', 1);
}
// setDisable('dhcpPrefix',0);
// setDisable('PrefixLen' ,0);
// setDisable('t1',0);
// setDisable('t2',0);
setDisable('DnsSrvOne',0);
setDisable('DnsSrvTwo',0);
setDisable('DomainNameText'    ,1);
}
}

function EnablePrefixParameter()
{
with (document.forms[3])
{
if ( 0 != getCheckVal('dhcp6SrvType'))
{
// setDisable('dhcpPrefix',0);
setDisable('NamePrefix',0);
// setDisable('PrefixLen'    ,0);
setDisable('NamePrefixLen',0);
}
}
}
function DisablePrefixParameter()
{
with (document.forms[3])
{
if ( 0 != getCheckVal('dhcp6SrvType'))
{
// setDisable('dhcpPrefix',1);
setDisable('NamePrefix',1);
// setDisable('PrefixLen'    ,1);
setDisable('NamePrefixLen',1);
}
}
}
function EnableIPPoolParameter()
{
with (document.forms[3])
{
}
}
function DisableIPPoolParameter()
{
with (document.forms[3])
{
}
}
function IPPoolGenerateOperation()
{
with (document.forms[3])
{
if ( "UsePrefix" == UsePrefixOrIPPool.value )
{
DisableIPPoolParameter();
EnablePrefixParameter();
}
else if ( "UseIPPool" == UsePrefixOrIPPool.value )
{
DisablePrefixParameter();
EnableIPPoolParameter();
}
else
{
DisablePrefixParameter();
DisableIPPoolParameter();
}
}
}
function CheckPrefix(Prefix,type)
{
var IpAddress1 = Prefix.split(':');
var IpAddress3 = Prefix;
if ( 1 == type && '' == IpAddress3)
{
return true;
}
if ( true != isUnicastIpv6Address(IpAddress3) )
{
return false;
}
switch (type)
{
case 0 :
if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
{
switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
{
case 15 :
return false;
case 14 :
if ( 8 <= parseInt(IpAddress1[0].substring(2, 3),16) && 12 > parseInt(IpAddress1[0].substring(2, 3),16) )
{
return false;
}
break;
default:
break;
}
}
break;
case 1 :
if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
{
switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
{
case 15 :
return false;
default:
break;
}
}
break;
default:
return false;
}
return true;
}
function CheckLength(Length)
{
var TemLen = parseInt(Length);
if ( true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
{
return false;
}
return true;
}
function CheckDNSRefresh(value)
{
var TemLen = parseInt(value);
if ( true == isNaN(TemLen) || TemLen > 864000 || TemLen < 60)
{
return false;
}
return true;
}
function CheckHex(Hex)
{
var TemHex  = Hex;
var Loopj   = 0;
var Tempi   = 0;
var Tempj   = 1;
var section = 0;
var num     = 0;
for (Loopj = 0 ; Loopj < TemHex.length ; Loopj++)
{
section = TemHex.substring(Tempi, Tempj);
num = parseInt(section, 16);
if ( true == isNaN(num) )
{
return false;
}
Tempi++;
Tempj++;
}
return true;
}
function CheckTime(Time1,Time2)
{
var TemTime1 = Time1;
var TemTime2 = Time2;
if ( TemTime1.length > 10 || '' == TemTime1 )
{
return 1;
}
if ( TemTime2.length > 10 || '' == TemTime2 )
{
return 2;
}
if ( true != isPlusInteger(TemTime1))
{
return 1;
}
if ( true != isPlusInteger(TemTime2))
{
return 2;
}
TemTime1 = parseInt(Time1);
TemTime2 = parseInt(Time2);
if ( TemTime1 > 4294967295 || TemTime1 < 60 )
{
return 1;
}
if ( TemTime2 > 4294967295 || TemTime2 < 60 )
{
return 2;
}
if ( TemTime2 <= TemTime1 )
{
return 3;
}
return true;
}
function disableRASrv()
{
with (document.forms[2])
{
setCheck('radvdSrvType', 0);
setDisplay('RAAssConnection', 0);
setDisplay('RadvdPrefixCfg', 0);
}
}
function enableRASrv(formLoad)
{
with (document.forms[2])
{
setCheck('radvdSrvType', 1);
setDisplay('RAAssConnection', 1);
if ("Normal" == RAUseWan.value)
{
setDisplay('RadvdPrefixCfg', 1);
}
}
}

function CheckRAPrefix(Prefix, type)
{
var IpAddress1 = Prefix.split(':');
var IpAddress3 = Prefix;
if (1 == type && '' == IpAddress3)
{
return true;
}
if (true != isGlobalIpv6Address(IpAddress3))
{
return false;
}
return true;
}
function CheckRATime(Time1,Time2)
{
var TemTime1 = Time1;
var TemTime2 = Time2;
if (TemTime1.length > 10 || '' == TemTime1)
{
return 1;
}
if (TemTime2.length > 10 || '' == TemTime2)
{
return 2;
}
if (true != isPlusInteger(TemTime1))
{
return 1;
}
if (true != isPlusInteger(TemTime2))
{
return 2;
}
TemTime1 = parseInt(Time1);
TemTime2 = parseInt(Time2);
if (TemTime1 > 4294967295 || TemTime1 < 600)
{
return 1;
}
if (TemTime2 > 4294967295 || TemTime2 < 600)
{
return 2;
}
if (TemTime2 <= TemTime1)
{
return 3;
}
return true;
}
function RAIntervalValue(vMin, vMax)
{
	var MinInterval = vMin;
	var MaxInterval = vMax;
	if ('' == MinInterval)
	{
		return 1;
	}
	if ('' == MaxInterval)
	{
		return 2;
	}
	MinInterval = parseFloat(vMin);
	MaxInterval = parseFloat(vMax);
	
	if ( MinInterval < 3 || MinInterval > 1350 )
		return 1;
	if ( MaxInterval > 1800 || MaxInterval < 4 )
		return 2;
	if ( MaxInterval < MinInterval )
		return 3;

	if ( MinInterval > (MaxInterval*0.75) )
		return 4;

	return true;
}

function RACheckForm(type)
{
	with (document.forms[2])
	{
		if (1 != getCheckVal('radvdSrvType') || "Normal" != RAUseWan.value)
		{
			if ( 1 == getCheckVal('radvdSrvType') )
			{
					RAManagedEn_Flag.value = ( 1 == getCheckVal('ramflag') ) ? '1' : '0';
					RAOtherEn_Flag.value = ( 1 == getCheckVal('raoflag') ) ? '1' : '0';
			}

			return true;
		}
		if (true != CheckRAPrefix(radvdPrefix.value,0))
		{
			alert("前缀：\"" + radvdPrefix.value + "\"不是合法的IPv6地址");
			return false;
		}
		if (true != CheckLength(RAPrefixLen.value))
		{
			alert("前缀长度：\"" + RAPrefixLen.value + "\"不合法");
			return false;
		}
		switch (CheckRATime(RAt1.value,RAt2.value))
		{
		case 1 :
		{
			alert("时间：\"" + RAt1.value + "\"不合法");
			return false;
		}
		case 2 :
		{
			alert("时间：\"" + RAt2.value + "\"不合法");
			return false;
		}
		case 3 :
		{
			alert("有效寿命：" + RAt2.value + "小于等于首选寿命：" + RAt1.value);
			return false;
		}
		default:
		break;
		}
		switch (RAIntervalValue(RACycMin.value, RACycMax.value)){
			case 1 :
			{
				alert("RA最小间隔：\"" + RACycMin.value + "\"不合法");
				return false;
			}
			case 2 :
			{
				alert("RA最大间隔：\"" + RACycMax.value + "\"不合法");
				return false;
			}
			case 3 :
			{
				alert("RA最大间隔：" + RACycMax.value + "小于RA最小间隔：" + RACycMin.value);
				return false;
			}
			case 4 :
			{
				var temp = parseFloat(RACycMax.value) * 0.75;
				alert("RA最小间隔：" + RACycMin.value + "不应大于0.75倍RA最大间隔：" + temp.toString());
				return false;
			}
			default:
				break;
		}
	}
	return true;
}

function RASubmit()
{
if (RACheckForm() == true)
{
document.forms[2].RA_Flag.value = "1";
//document.forms[2].submit(); need use jquery for hook
$("form[name='RAConfigForm']").submit();
}
}
function disableDhcpSrv()
{
with (document.forms[0])
{
dhcpSrvType[1].checked = false;
dhcpEthStart.disabled = 1;
dhcpEthEnd.disabled = 1;
enableRelay.disabled = 1;
IpPoolIndex.disabled = 1;
dhcpEthStartFrag.disabled = 1;
dhcpEthEndFrag.disabled = 1;
dhcpLeasedTimeFrag.disabled = 1;
setDisplay("DhcprelayIP", 0);
setDisplay("dhcpstartaddr",0);
setDisplay("dhcpendaddr",0);
setDisplay("dhcplease",0);
// setDisplay("dhcpipaddr",0);
// setDisplay("dhcpmacaddr",0);
// setDisplay("dhcpbtnadddel",0);
// setDisplay("dhcptablelist",0);
}
}
function enableDhcpSrv(formLoad)
{
with (document.forms[0])
{
dhcpEthStart.disabled = 0;
dhcpEthEnd.disabled = 0;

dhcpEthStart.value = dhcpStart;
dhcpEthEnd.value = dhcpEnd;

setDisable('dhcpLeasedTimeFrag', 0);
setDisable('IpPoolIndex',0);
setDisable('dhcpEthStartFrag',0);
setDisable('dhcpEthEndFrag',0);
setDisable('enableRelay',0);
setDisplay("DhcprelayIP", 0);
setDisplay("dhcpstartaddr",1);
setDisplay("dhcpendaddr",1);
setDisplay("dhcplease",1);
setDisplay("dhcpipaddr",1);
setDisplay("dhcpmacaddr",1);
setDisplay("dhcpbtnadddel",1);
setDisplay("dhcptablelist",1);
}
}
function disableDhcpSrvRelay()
{
with (document.forms[0])
{
dhcpSrvAddr.disabled = 1;
}
}
function enableDhcpSrvRelay()
{
with ( document.forms[0] )
{
if (dhcpEthStart.value != "")
dhcpSrvAddr.value = dhcpEthStart.value;
else
dhcpSrvAddr.value = dhcpStart;
dhcpSrvAddr.disabled = 0;
}
}
function typeClick()
{
with (document.forms[0])
{
	if ( natEnbl == '1' )
	{
		if ( dhcpSrvType[0].checked == true )
		{
			disableDhcpSrv();
		}
		else if( dhcpSrvType[1].checked == true )
		{
			enableDhcpSrv(0);
		}
		else
		{
			disableDhcpSrv();
			setDisplay("DhcprelayIP",1);
			getElById('dhcpRelayServerIP').focus();
		}
	}
	else
	{
		if (dhcpSrvType[0].checked == true)
		{
			disableDhcpSrv();
			disableDhcpSrvRelay();
		}
		else if (dhcpSrvType[1].checked == true)
		{
			enableDhcpSrv(0);
			disableDhcpSrvRelay();
		}
	}
}
}
function LoadFrame()
{
	with (document.forms[0])
	{
		dhcpSecPortRelay();
		IPV4_Flag.value = "0";
		typeClick();
		IpPoolIndexChange();
		oldAddrPrimary = ethIpAddress.value ;
		oldMaskPrimary = ethSubnetMask.value;
		oldstartAddrPrimary = dhcpEthStart.value ;
		oldEndAddrPrimary = dhcpEthEnd.value;
	}
	with (document.forms[2])
	{
		RA_Flag.value = "0";
		RAUseWanChange();
		RATypeClick();
	}
	with (document.forms[3])
	{
		Dhcp1_Flag.value = "0";
		typev6Click();
		UseWanChange();
	}
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
	document.StaticConfigForm.delnum.value = "";
<% end if %>
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);

}
function isEndGTEStart(EndIp, StartIp)
{
addrEnd = EndIp.split('.');
addrStart = StartIp.split('.');
E = parseInt(addrEnd[3]) + 1;
S = parseInt(addrStart[3]) + 1;
if (E < S)
return false;
return true;
}
function ipIsInIP(subStartIp, subEndIp, StartIp, EndIp)
{
addrEnd = EndIp.split('.');
addrStart = StartIp.split('.');
subAddrEnd = subEndIp.split('.');
subAddrStart = subStartIp.split('.');
for (i = 0; i < 4; i++)
{
seg = parseInt(addrEnd[i]);
subSeg = parseInt(subAddrEnd[i]);
if (subSeg > seg)
return false;
seg = parseInt(addrStart[i]);
subSeg = parseInt(subAddrStart[i]);
if ((subSeg > 0) && (subSeg < seg))
return false;
}
return true;
}
function  ipConfilt( StartIp1 , EndIp1, StartIp2, EndIp2)
{
if (!( isValidIpAddress(StartIp1)
&& isValidIpAddress(EndIp1)
&&isValidIpAddress(StartIp2)
&&isValidIpAddress(EndIp2)))
{
return false;
}
var StartIp1A = StartIp1.split('.');
var EndIp1A= EndIp1.split('.');
var StartIp2A = StartIp2.split('.');
var EndIp2A = EndIp2.split('.');
var StarIp1Value = parseInt(StartIp1A[3]);
var  EndIp1Value = parseInt(EndIp1A[3]);
var StarIp2Value = parseInt(StartIp2A[3]);
var EndIp2Value = parseInt(EndIp2A[3]);
if ((StarIp1Value >EndIp2Value)  || (EndIp1Value <StarIp2Value))
{
return false;
}
return true;
}
function CheckForm(type)
{
with (document.forms[0])
{
if (isValidIpAddress(ethIpAddress.value) == false)
{
alert('地址 "' + ethIpAddress.value + '" 无效。');
return false;
}
if (isValidSubnetMask(ethSubnetMask.value) == false)
{
alert('子网掩码 "' + ethSubnetMask.value + '" 无效。');
return false;
}
if (isBroadcastIp(ethIpAddress.value, ethSubnetMask.value) == true)
{
alert('地址 "' + ethIpAddress.value + '" 无效。');
return false;
}
if (dhcpSrvType[1].checked == true)
{
if (dhcpEthStart.value == '0.0.0.0')
{
alert('起始IP地址 "' + dhcpEthStart.value + '" 是无效IP地址。');
return false;
}
if (dhcpEthEnd.value == '0.0.0.0')
{
alert('结束IP地址  "' + dhcpEthEnd.value + '" 是无效IP地址。');
return false;
}
if ((dhcpEthStart.value != '0.0.0.0')&&(dhcpEthEnd.value != '0.0.0.0'))
{
if (isValidIpAddress(dhcpEthStart.value) == false ||
!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthStart.value, ethSubnetMask.value)))
{
alert('起始IP地址 "' + dhcpEthStart.value + '" 是无效IP地址。');
return false;
}
if (isBroadcastIp(dhcpEthStart.value, ethSubnetMask.value) == true)
{
alert('错误！起始IP地址 "' + dhcpEthStart.value + '" 无效。');
return false;
}
if (isValidIpAddress(dhcpEthEnd.value) == false ||
!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthEnd.value, ethSubnetMask.value)))
{
alert('结束IP地址 "' + dhcpEthEnd.value + '" 是无效IP地址。');
return false;
}
if (isBroadcastIp(dhcpEthEnd.value, ethSubnetMask.value) == true)
{
alert('错误！结束IP地址 "' + dhcpEthEnd.value + '" 无效。');
return false;
}
if (!(isEndGTEStart(dhcpEthEnd.value, dhcpEthStart.value)))
{
alert("结束IP地址必须等于或大于起始IP地址。");
return false;
}
if (dhcpEthStart.value == ethIpAddress.value)
{
alert("起始IP地址不能与路由IP地址相同。");
return false;
}
if (dhcpEthEnd.value == ethIpAddress.value)
{
alert("结束IP地址不能与路由IP地址相同。");
return false;
}
}
if ((dhcpEthStartFrag.value == '')
&&(dhcpEthEndFrag.value == '')
&&(dhcpLeasedTimeFrag.value ==''))
{
dhcpEthStartFrag.value = '0.0.0.0';
dhcpEthEndFrag.value = '0.0.0.0';
dhcpLeasedTimeFrag.value ='86400';
}
else
{
if ((dhcpEthStartFrag.value != '0.0.0.0')&&(dhcpEthEndFrag.value != '0.0.0.0'))
{
if (isValidIpAddress(dhcpEthStartFrag.value) == false ||
!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthStartFrag.value, ethSubnetMask.value)))
{
alert('IP池的起始IP地址 "' + dhcpEthStartFrag.value + '"  是无效IP地址。');
return false;
}
if (isBroadcastIp(dhcpEthStartFrag.value, ethSubnetMask.value) == true)
{
alert('错误！IP池的 起始IP地址 "' + dhcpEthStartFrag.value + '" 无效。');
return false;
}
if (isValidIpAddress(dhcpEthEndFrag.value) == false ||
!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthEndFrag.value, ethSubnetMask.value)))
{
alert('IP池的结束IP地址 "' + dhcpEthEndFrag.value + '"  是无效IP地址。');
return false;
}
if (isBroadcastIp(dhcpEthEndFrag.value, ethSubnetMask.value) == true)
{
alert('错误！IP池的结束IP地址 "' + dhcpEthEndFrag.value + '"  无效。');
return false;
}
if (!(isEndGTEStart(dhcpEthEndFrag.value, dhcpEthStartFrag.value)))
{
alert("IP池的结束IP地址必须大于或等于IP池的起始IP地址。");
return false;
}

var wanIPaddr = "<% tcWebApi_get("WanInfo_WanIF","IPADDR","s") %>";
var wanNetmask = "<% tcWebApi_get("WanInfo_WanIF","NETMASK","s") %>";

if (isSameSubNet(ethIpAddress.value, ethSubnetMask.value, wanIPaddr, wanNetmask))
{
alert("错误！LAN的IP地址段与WAN的IP地址段冲突！");
return false;
}

if (dhcpEthStartFrag.value == ethIpAddress.value)
{
alert("IP池的起始IP地址不能与路由IP地址相同。");
return false;
}
if (dhcpEthEndFrag.value == ethIpAddress.value)
{
alert("IP池的结束IP地址不能与路由IP地址相同。");
return false;
}
}
else if((dhcpEthStartFrag.value == '0.0.0.0')&&(dhcpEthEndFrag.value == '0.0.0.0'))
{
}
else
{
alert('IP池的起始IP地址和结束IP地址当其中一个不为0时另一个也不能为0。');
return false;
}
}
if (IpPoolIndex.value == "STB")
{
}
else if (IpPoolIndex.value == "Phone")
{
}
else if(IpPoolIndex.value == "Camera")
{
}
else if(IpPoolIndex.value == "Computer")
{
}
}
else
{
if ( natEnbl == '1' )
{
}
else
{
}
}
if ( dhcpSrvType[1].checked == true
&& ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
{
	RouteIPChangeFlag.value="1";
}
oldAddrPrimary = ethIpAddress.value;
oldMaskPrimary = ethSubnetMask.value;
if ( dhcpSrvType[1].checked == true
&& ((oldstartAddrPrimary != dhcpEthStart.value)||(oldEndAddrPrimary != dhcpEthEnd.value)))
{
	RouteIPChangeFlag.value="1";
}
oldstartAddrPrimary = dhcpEthStart.value;
oldEndAddrPrimary = dhcpEthEnd.value;
}
with (document.forms[3])
{
switch (type)
{
case 3:
{
if (1 != getCheckVal('dhcp6SrvType') || "Normal" != UseWan.value)
{
return true;
}
if ("" != dhcpPrefix.value)
{
if (true != CheckPrefix(dhcpPrefix.value,0))
{
alert('前缀："' + dhcpPrefix.value +'" 不是合法的IPv6地址！');
return false;
}
}
if ("" != dhcpPrefix.value || ("" != PrefixLen.value && 0 != PrefixLen.value))
{
if (true != CheckLength(PrefixLen.value))
{
alert('前缀长度："' + PrefixLen.value + '" 不合法！');
return false;
}
}
if ("" != dhcpPrefix.value || ("" != t1.value && 0 != t1.value) || ("" != t2.value && 0 != t2.value))
{
switch (CheckTime(t1.value,t2.value))
{
case 1 :
{
alert('时间："' + t1.value + '" 不合法！');
return false;
}
case 2 :
{
alert('时间："' + t2.value + '" 不合法！');
return false;
}
case 3 :
{
alert('有效寿命：' + t2.value + '小于' + '首选寿命：' + t1.value);
return false;
}
default:
break;
}
}
if ("" == DnsSrvOne.value && "" != DnsSrvTwo.value)
{
alert('前缀："' + DnsSrvOne.value + '" 不是合法的IPv6地址！');
return false;
}
if (true != CheckPrefix(DnsSrvOne.value,1))
{
alert('前缀："' + DnsSrvOne.value + '" 不是合法的IPv6地址！');
return false;
}
if (true != CheckPrefix(DnsSrvTwo.value,1))
{
alert('前缀："' + DnsSrvTwo.value + '" 不是合法的IPv6地址！');
return false;
}
break;
}
case 1:
{
}
break;
case 2:
{
}
break;
default:
break;
}
}
return true;
}
function setDhcpAddresses(lanIp)
{
with (document.forms[0])
{
if (isValidIpAddress(lanIp) == false)
{
alert('地址 "' + lanIp + '" 是无效IP地址。');
return;
}
var lanMask = ethSubnetMask.value;
var Start = dhcpEthStart.value;
var End = dhcpEthEnd.value;
addrParts = lanIp.split('.');
maskParts = lanMask.split('.');
if ( addrParts.length != 4 )
return false;
if ( maskParts.length != 4 )
return false;
if (isValidSubnetMask(lanMask) == false || parseInt(maskParts[3]) >= 254)
{
alert('子网掩码 "' + lanMask + '" 无效。');
return false;
}
t1 = parseInt(addrParts[3]) + 1;
t2 = 254 - parseInt(maskParts[3]);
if (255 <= t2)
{
t2 = 254;
}
if (dhcpEthStart.value != '' && t1 >= 255)
{
alert("要提供DHCP服务IP地址的最后一位必须小于254。");
return false;
}
dhcpEthStart.value = dhcpEthEnd.value = "";
for (i = 0; i < 3; i++)
{
dhcpEthStart.value = dhcpEthStart.value + addrParts[i] + ".";
dhcpEthEnd.value = dhcpEthEnd.value + addrParts[i] + ".";
}
dhcpEthStart.value = dhcpEthStart.value + t1;
dhcpEthEnd.value = dhcpEthEnd.value + t2;
if ( dhcpSrvType[1].checked == true
&& ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
{
alert('警告：该操作将改变IP地址池!');
changeAddrFlag = true;
RouteIPChangeFlag.value="1";
IpPoolIndex.value = "Computer";
dhcpEthStartFrag.value = dhcpEthStart.value;
dhcpEthEndFrag.value= dhcpEthEnd.value;
poolIndex = '1';
dhcpStart1_1 = dhcpEthStartFrag.value;
dhcpEnd1_1 = dhcpEthEndFrag.value;
dhcpStart1_2 = dhcpStart1_1;
dhcpEnd1_2 = dhcpEthEndFrag.value;
dhcpStart1_3 = dhcpStart1_1;
dhcpEnd1_3 = dhcpEthEndFrag.value;
dhcpStart1_4 = dhcpStart1_1;
dhcpEnd1_4 = dhcpEthEndFrag.value;
dhcpStart1_5 = dhcpStart1_1;
dhcpEnd1_5 = dhcpEthEndFrag.value;
}
}
}
function IpPoolIndexChange()
{
with ( document.forms[0] ) {
var index=IpPoolIndex.value;
if(index == 'HGW')
{
	if(dhcpStart1_5 != "N/A")
		dhcpEthStartFrag.value = dhcpStart1_5;
	else
		dhcpEthStartFrag.value = "";
	if(dhcpEnd1_5 != "N/A")
		dhcpEthEndFrag.value = dhcpEnd1_5;
	else
		dhcpEthEndFrag.value = "";
setCheck('enableRelay',enblrelay_hgw);
}
else if(index == 'STB')
{
dhcpEthStartFrag.value = dhcpStart1_1;
dhcpEthEndFrag.value = dhcpEnd1_1;
setCheck('enableRelay',enblrelay_stb);
}
else if(index == 'Phone')
{
dhcpEthStartFrag.value = dhcpStart1_2;
dhcpEthEndFrag.value = dhcpEnd1_2;
setCheck('enableRelay',enblrelay_phone);
}
else if(index == 'Camera')
{
dhcpEthStartFrag.value = dhcpStart1_3;
dhcpEthEndFrag.value = dhcpEnd1_3;
setCheck('enableRelay',enblrelay_camera);
}
else if(index == 'Computer')
{
dhcpEthStartFrag.value = dhcpStart1_4;
dhcpEthEndFrag.value = dhcpEnd1_4;
setCheck('enableRelay',enblrelay_computer);
}
}
}

function getPortRelayStr(relayinfstr, pr_str)
{
if (getCheckVal(pr_str) == 1)
{
if (relayinfstr == '')
{
return  getValue(pr_str);
}
else
{
return  ',' + getValue(pr_str);
}
}
return '';
}

<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
function setDhcpStaticIPAddr(StaticIP)
{
	with (document.forms[0])
	{
		if (isValidIpAddress(StaticIP) == false)
		{
			alert('地址 "' + StaticIP + '" 是无效IP地址，请重新输入。');
			return;
		}
	}
}
function setDhcpStaticMACAddr(StaticMAC)
{
	with (document.forms[0])
	{
		if (isValidMacAddress(StaticMAC) == false )
		{
			alert('MAC地址 "' + StaticMAC + '" 不正确，正确格式为(AA:BB:CC:DD:EE:FF)，请重新输入。');
			return false;
		}
	}
}

/*检查数据是否重复*/
function checkSameMac(list, type, mac) {
    mac = mac.toLocaleLowerCase();
    var ret = null;
    var arr = [];
    for (var i = 0; i < list.length; i++) {
        arr.push(list[i][type].toLocaleLowerCase());
    }
    ret = arr.indexOf(mac);
    if (ret === -1) { //不重复
        return false;
    }
    else {
        return true;
    }
}

function btnAdd()
{
	var	vForm = document.forms[1];

	if(isValidIpAddress(getElById('StaticIpAddress').value) == false || isValidMacAddress(getElById('StaticMACAddress').value) == false)
      return false;

    var StaticInfo = '<% tcWebApi_JsonHook("get_static_info", "", "") %>'
    var rsp = JSON.parse(StaticInfo);
    var StaticInfo_list = rsp.data;
    if(checkSameMac(StaticInfo_list, 'MAC', getElById('StaticMACAddress').value)) {
        alert('已存在此规则，请重新添加！');
		return false;
    }

	if(!(isSameSubNet(getElById('ethIpAddress').value, getElById('ethSubnetMask').value, getElById('StaticIpAddress').value, getElById('ethSubnetMask').value))
		|| (isBroadcastIp(getElById('StaticIpAddress').value, getElById('ethSubnetMask').value) == true))
	{
        confirm("该IP地址和LAN侧网段不一致，可能会导致设置不生效，是否确认添加？", function(ret) {
            if(ret)
            {
                vForm.Static_Flag.value = "1";
                $("form[name='StaticConfigForm']").submit();
            }
        });
        return false;
	}
    
    if(dhcpListLen == 8) {
        alert('已达到当前最大分配数量，请先删除一个后再添加！');
		return false;
    }

	vForm.Static_Flag.value = "1";
    $("form[name='StaticConfigForm']").submit();
	// vForm.submit();
}

function btnDel()
{
	var	vForm = document.forms[1];
	vForm.Static_Flag.value = "2";
	// vForm.submit();
    $("form[name='StaticConfigForm']").submit();
}

function doDel(i)
{
	var f = document.StaticConfigForm;
	var tempstr;
	var rml = document.getElementsByName('rml');
	if (rml == null)
		return;
	if(rml.length>0)
	{
		for(var n=0;n<(rml.length);n++)
		{
			if(rml[n].value == i){
				if(rml[n].checked)
				{
					tempstr = i + ",";
					f.delnum.value = f.delnum.value + tempstr;
					
				}
				else
				{
					f.delnum.value = formatstr(f.delnum.value,i);
				}
				break;
			}
		}
	}

    btnDel();
}
<% end if %>

var cfg_menu_list  = new Array('IPv4配置', '静态分配客户端配置', 'RA配置', 'IPv6配置');
var cfg_cookie_name = 'net-dhcp-menu';
init_l_menu();

</SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
          <TD id="MenuArea_L2">
            <ul class="TRD">
              <li name="IPv4Cnf" id="IPv4配置">IPv4配置</li>
              <li name="DhcpStaticCnf" id="静态分配客户端配置">静态分配客户端配置</li>
              <li name="RACnf" id="RA配置">RA配置</li>
              <li name="IPv6Cnf" id="IPv6配置">IPv6配置</li>
            </ul>
          </TD>
      <SCRIPT language=javascript>
      MakeMenu(getElById ('Selected_Menu').value);
      </SCRIPT>
      <TD valign="top" id="IPv4配置_item" class="hide tab-dhcp-table">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">IPv4配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TR>
                    <TD width=7 background=/img/panel3.gif>　</TD>
                    <TD valign="top">
                    <div>
                        <FORM name="ConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                        <TBODY>
                        <TR>
                            <TD>
                                <input type="hidden" name="portDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","PortDHCPRelay","s") %>">
                                <input type="hidden" name="portLan1" value="<% tcWebApi_get("Dhcpd_Common","PortLan1","s") %>">
                                <input type="hidden" name="portLan2" value="<% tcWebApi_get("Dhcpd_Common","PortLan2","s") %>">
                                <input type="hidden" name="portLan3" value="<% tcWebApi_get("Dhcpd_Common","PortLan3","s") %>">
                                <input type="hidden" name="portLan4" value="<% tcWebApi_get("Dhcpd_Common","PortLan4","s") %>">
                                <input type="hidden" name="portSSID1" value="<% tcWebApi_get("Dhcpd_Common","PortSSID1","s") %>">
                                <input type="hidden" name="portSSID2" value="<% tcWebApi_get("Dhcpd_Common","PortSSID2","s") %>">
                                <input type="hidden" name="portSSID3" value="<% tcWebApi_get("Dhcpd_Common","PortSSID3","s") %>">
                                <input type="hidden" name="portSSID4" value="<% tcWebApi_get("Dhcpd_Common","PortSSID4","s") %>">
                                <input type="hidden" name="DeviceDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","DeviceDHCPRelay","s") %>">
                                <input type="hidden" name="IPV4_Flag" value="0">
                                <input type="hidden" name="DMZ_IP_SET" value="">
                                <input type="hidden" name="EthendIPcount" value="100">
                                <input type="hidden" name="DeviceendIPcount" value="80"> 

                                <script language="JavaScript" type="text/JavaScript">
                                function dhcpSecPortRelay()
                                {
                                    with (document.forms[0])
                                    {
                                        if(getCheckVal('enablePortRelay') == 1)
                                            {
                                            setDisplay('portrelayInfo', 1);			
                                            document.ConfigForm.portDHCPRelayFlag.value="Yes";
                                            }
                                        else
                                        {
                                                setDisplay('portrelayInfo', 0);
                                                document.ConfigForm.portDHCPRelayFlag.value="No";
                                        }
                                    }
                                }
                                function checkportcheckboxstate()
                                {
                                    var	vForm = document.ConfigForm;
                                    
                                    if(vForm.PortRelay_lan1.checked)
                                        vForm.portLan1.value = "Yes";
                                    else vForm.portLan1.value = "No";
                                    if(vForm.PortRelay_lan2.checked)
                                        vForm.portLan2.value = "Yes";
                                    else vForm.portLan2.value = "No";
                                    if(vForm.PortRelay_lan3.checked)
                                        vForm.portLan3.value = "Yes";
                                    else vForm.portLan3.value = "No";
                                    if(vForm.PortRelay_lan4.checked)
                                        vForm.portLan4.value = "Yes";
                                    else vForm.portLan4.value = "No";
                                    if(vForm.PortRelay_ssid1.checked)
                                        vForm.portSSID1.value = "Yes";
                                    else vForm.portSSID1.value = "No";
                                    if(vForm.PortRelay_ssid2.checked)
                                        vForm.portSSID2.value = "Yes";
                                    else vForm.portSSID2.value = "No";
                                    if(vForm.PortRelay_ssid3.checked)
                                        vForm.portSSID3.value = "Yes";
                                    else vForm.portSSID3.value = "No";
                                    if(vForm.PortRelay_ssid4.checked)
                                        vForm.portSSID4.value = "Yes";
                                    else vForm.portSSID4.value = "No";
                                }
                                function GetEndSubStartCount(EndIp, StartIp)
                                {
                                    var vret;
                                    addrEnd = EndIp.split('.');
                                    addrStart = StartIp.split('.');
                                    E = parseInt(addrEnd[3]) + 1;
                                    S = parseInt(addrStart[3]);
                                    vret = E - S;
                                    return vret;
                                    
                                }
                                function btnSaveIPv4()
                                {
                                    if(CheckForm(1) == false)
                                        return false;
                                    if ( 1 == getValue("RouteIPChangeFlag"))
                                    {
                                        confirm("是否保存当前配置，并重启生效?", function(ret){ if(!ret)
                                        {                                           
                                            setText("RouteIPChangeFlag", 0);
                                            window.location.reload();
                                            return;
                                        }else{
                                            var	vForm = document.ConfigForm;
                                            vForm.EthendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEnd.value, vForm.dhcpEthStart.value);
                                            vForm.DeviceendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEndFrag.value, vForm.dhcpEthStartFrag.value);
                                            checkportcheckboxstate();
                                            var DMZStr = "<% tcWebApi_get("Dmz_Entry","DMZ_IP","s") %>";//获取DMZ的ip地址
                                            if (DMZStr !="" && DMZStr !=null && DMZStr != undefined && DMZStr !="N/A")
                                            {
                                                var DMZ_index = DMZStr.lastIndexOf(".");
                                                var behind_DMZStr = DMZStr.substr(DMZ_index);
                                                var ip_index = ethIpAddress.value.lastIndexOf(".");
                                                var before_ip = ethIpAddress.value.substring(0,ip_index);
                                                var new_ip = before_ip + behind_DMZStr;
                                                vForm.DMZ_IP_SET.value = new_ip;
                                            }
                                            vForm.IPV4_Flag.value = "1";
                                            //vForm.submit();		need use jquery for hook
                                            $("form[name='ConfigForm']").submit();
                                            
                                        }});
                                    }
                                    else
                                    {
                                        var	vForm = document.ConfigForm;
                                        vForm.EthendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEnd.value, vForm.dhcpEthStart.value);
                                        vForm.DeviceendIPcount.value = GetEndSubStartCount(vForm.dhcpEthEndFrag.value, vForm.dhcpEthStartFrag.value);
                                            
                                        checkportcheckboxstate();
                                        
                                        vForm.IPV4_Flag.value = "1";
                                        //vForm.submit();		need use jquery for hook
                                        $("form[name='ConfigForm']").submit();
                                    }
                                }
                                function devicedhcpRelay()
                                {
                                    var	vForm = document.ConfigForm;
                                    if(vForm.enableRelay.checked)
                                        vForm.DeviceDHCPRelayFlag.value = "Yes";
                                    else vForm.DeviceDHCPRelayFlag.value = "No";
                                }
                                
                                function initLeaseTimeTable()
                                {
                                    var leaseTime = '<% tcWebApi_get("Dhcpd_Common","lease","s") %>';
                                    var optname = new Array('1分钟', '1小时', '1天', '1周');
                                    var optvalue = new Array('60', '3600', '86400', '604800');
                                    var cusname = leaseTime + '秒';
                                    var hascusopt = true;
                                    var isSel = 0;

                                    with (getElById('dhcpLeasedTimeFrag'))
                                        {
                                            for( i=0; i< optname.length; i++)
                                            {
                                                var opt = new Option(optname[i], optvalue[i]);
                                                if ( leaseTime == optvalue[i] )
                                                {
                                                    opt.selected = true
                                                    isSel = i;
                                                    hascusopt = false;
                                                }
                                                options.add ( opt );
                                                options[isSel].setAttribute('selected', 'true');
                                            }
                                            
                                            
                                            if ( hascusopt && isInteger(leaseTime) && '0' != leaseTime )
                                            {
                                                var optcus = new Option(cusname, leaseTime);
                                                optcus.selected = true
                                                options.add ( optcus );
                                                isSel = i;
                                                options[isSel].setAttribute('selected', 'true');
                                            }
                                        }
                                }
                                </script>
                            <TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD width=150>
                                    <div class="form-text">IP地址</div>
                                </TD>
                                <TD><INPUT maxLength=15 onchange=setDhcpAddresses(this.value) 
                                id="ethIpAddress" name="ethIpAddress" value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>"></TD></TR>
                                <TR>
                                <TD>
                                    <div class="form-text">子网掩码</div>
                                </TD>
                                <TD><INPUT maxLength=15 onchange=setDhcpAddresses(ethIpAddress.value) 
                                    id="ethSubnetMask" name="ethSubnetMask" value="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>"></TD>
                                </TR></TBODY>
                            </TABLE>

                            <TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">		  
                                <TBODY>
                                <TR>
                                    <TD>
                                        <div class="form-text">DHCP静态IP</div>
                                    </TD>
                                    <TD>
                                    <INPUT id=dhcpSrvType onclick="typeClick()" type=radio value="0" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") end if %>>
                                    <span>禁用DHCP Server</span>
                                    <INPUT id="dhcpSrvType" onclick="typeClick()" type=radio  value="1" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %>>
                                    <span>开启DHCP Server</span>
                                    <div class='hide'>
                                    <INPUT id="dhcpSrvType" onclick="typeClick()" type=radio  value="2" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "2" then asp_Write("checked") end if %>>
                                    <span>开启DHCP Relay</span>
                                    </div>
                                </TD>
                                </TR>
                                <TR class="hide">
                                <TD>
                                    <div class="form-text">设备类型</div>
                                </TD>
                                <TD>
                                    <NOBR>
                                    <SELECT id="IpPoolIndex" onchange="IpPoolIndexChange()" size=1 name="IpPoolIndex"> 
                                    <OPTION value="HGW" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "HGW" then asp_Write("selected") end if%>>HGW
                                    <OPTION value="STB" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "STB" then asp_Write("selected") end if%>>STB
                                    <OPTION value="Phone" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Phone" then asp_Write("selected") end if%>>Phone
                                    <OPTION value="Camera" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Camera" then asp_Write("selected") end if%>>Camera
                                    <OPTION value="Computer" <%if tcWebApi_get("Dhcpd_Option60","DeviceStyle","h") = "Computer" then asp_Write("selected") end if%>>Computer</OPTION>
                                    </SELECT>
                                    </NOBR>
                                </TD>
                                </TR>
                                <TR id="dhcpstartaddr">
                                <TD width=150 height="24">
                                    <div class="form-text">起始IP地址</div>
                                </TD>
                                <TD><INPUT id="dhcpEthStart" maxLength=15 name="dhcpEthStart" value="<%if tcWebApi_get("Dhcpd_Common","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if %>"></TD>
                                <TD class="hide">
                                        <INPUT id="dhcpEthStartFrag" maxLength=15 name="dhcpEthStartFrag" value="<%if tcWebApi_get("Dhcpd_Option60","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","start","s") end if %>">
                                </TD>
                                </TR>
                                <TR id="dhcpendaddr">
                                <TD>
                                    <div class="form-text">结束IP地址</div>
                                </TD>
                                <TD><INPUT id="dhcpEthEnd" maxLength=15 name="dhcpEthEnd" value="<%if tcWebApi_get("Dhcpd_Common","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if %>"></TD>
                                <TD class="hide">
                                        <INPUT id="dhcpEthEndFrag" maxLength=15 name="dhcpEthEndFrag" value="<%if tcWebApi_get("Dhcpd_Option60","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Option60","pool_count","s") end if %>">
                                </TD>
                                </TR>
                                <TR id="dhcplease">
                                <TD>
                                    <div class="form-text">租期</div>
                                </TD>
                                <TD><SELECT size=1 name='dhcpLeasedTimeFrag' id='dhcpLeasedTimeFrag'>
                                    </SELECT>
                                    <SCRIPT language=JavaScript type=text/javascript>
                                                            initLeaseTimeTable();
                                                            </SCRIPT>
                                </TD>
                                <TD>
                                    <input type=hidden name=RouteIPChangeFlag value=0></TD>
                                <TD class="hide">
                                        设备DHCP relay <INPUT type=checkbox onclick=devicedhcpRelay() name=enableRelay <%if tcWebApi_get("Dhcpd_Common","DeviceDHCPRelay","h") = "Yes" then asp_Write("checked") end if %>>
                                </TD>
                                </TR>
                                <TR>
                                    <TD></TD>
                                    <TD>
                                        <P style="margin: 32px 0;">
                                            <BUTTON id=btnApply1 onclick="btnSaveIPv4();" type="button" name=btnApply1 value="Apply">保 存</BUTTON>
                                        </P>
                                    </TD>
                                </TR>
                                </TBODY>
                            </TABLE>
                            <DIV id=portrelayEnable>
                            <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                        <TD style="display:none"> <BR>
                                            端口DHCP relay 
                                <INPUT id=enablePortRelay onclick="dhcpSecPortRelay()" type=checkbox name="enablePortRelay" <%if tcWebApi_get("Dhcpd_Common","PortDHCPRelay","h") = "Yes" then asp_Write("checked") end if%>> 
                                </TD>
                                </TR></TBODY>
                            </TABLE>
                            </DIV>
                            <DIV id=portrelayInfo>
                            <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD>
                                    <DIV id=sec_lan1>
                                    <INPUT id=PortRelay_lan1 type=checkbox name="PortRelay_lan1" <%if tcWebApi_get("Dhcpd_Common","PortLan1","h") = "Yes" then asp_Write("checked") end if %>>
                                    LAN 1 &nbsp;
                                    </DIV>
                                    <DIV id=sec_ssid1>
                                    <INPUT id=PortRelay_ssid1 type=checkbox name="PortRelay_ssid1" <%if tcWebApi_get("Dhcpd_Common","PortSSID1","h") = "Yes" then asp_Write("checked") end if %>>
                                    SSID 1 
                                    </DIV>
                                </TD>
                                <TD>
                                    <DIV id=sec_lan2>
                                    <INPUT id=PortRelay_lan2 type=checkbox name="PortRelay_lan2" <%if tcWebApi_get("Dhcpd_Common","PortLan2","h") = "Yes" then asp_Write("checked") end if %>>
                                    LAN 2 &nbsp;
                                    </DIV>
                                    <DIV id=sec_ssid2>
                                    <INPUT id=PortRelay_ssid2 type=checkbox name="PortRelay_ssid2" <%if tcWebApi_get("Dhcpd_Common","PortSSID2","h") = "Yes" then asp_Write("checked") end if %>>
                                    SSID 2 
                                    </DIV>
                                </TD>
                                <TD>
                                    <DIV id=sec_lan3>
                                    <INPUT id=PortRelay_lan3 type=checkbox name="PortRelay_lan3" <%if tcWebApi_get("Dhcpd_Common","PortLan3","h") = "Yes" then asp_Write("checked") end if %>>
                                    LAN 3 &nbsp; 
                                    </DIV>
                                    <DIV id=sec_ssid3>
                                    <INPUT id=PortRelay_ssid3 type=checkbox name="PortRelay_ssid3" <%if tcWebApi_get("Dhcpd_Common","PortSSID3","h") = "Yes" then asp_Write("checked") end if %>>
                                    SSID 3 
                                    </DIV>
                                </TD>
                                <TD>
                                    <DIV id=sec_lan4>
                                    <INPUT id=PortRelay_lan4 type=checkbox name="PortRelay_lan4" <%if tcWebApi_get("Dhcpd_Common","PortLan4","h") = "Yes" then asp_Write("checked") end if %>>
                                    LAN 4 &nbsp; 
                                    </DIV>
                                    <DIV id=sec_ssid4>
                                    <INPUT id=PortRelay_ssid4 type=checkbox name="PortRelay_ssid4" <%if tcWebApi_get("Dhcpd_Common","PortSSID4","h") = "Yes" then asp_Write("checked") end if %>>
                                    SSID 4 
                                    </DIV>
                                </TD>
                                </TR>
                            </TBODY></TABLE>
                                </DIV>
                                <DIV id=DhcprelayIP>
                                    <div class="form-text">远端服务器IP</div>
                                    <INPUT id="dhcpRelayServerIP" maxLength=15 name="dhcpRelayServerIP" value="<%if tcWebApi_get("DhcpRelay_Entry","Server","h" ) <> "N/A" then tcWebApi_get("DhcpRelay_Entry","Server","s" ) end if %>">
                                </DIV>
                            </TD>
                        </TR>
                        </TBODY>
                            </TABLE>
                            </FORM>
                        </div>
                    </TD>
                </TR>
            </TBODY>
      </TABLE>
      </TD>

      <TD valign="top" id="静态分配客户端配置_item" class="hide tab-dhcp-table">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD width=7 background=/img/panel3.gif>　</TD>
                    <TD valign="top">
                    <div>
                        <FORM name="StaticConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">静态分配客户端配置</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
                        <TR>
                            <TD>
            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
                                <input type="hidden" name="Static_Flag" value="0">
                                <input type="hidden" name="add_num" value="<% tcWebApi_get("Dhcpd","Static_Num","s") %>">
                                <input type="hidden" name="delnum" value="">
            <% end if %>

                            <TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">		  
                                <TBODY>
            <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
            <% if tcwebApi_get("Lan_Dhcp","type","h") = "1" then %>
                                <TR id="dhcpipaddr">
                                <TD width="10%">
                                    <div class="form-text">IP地址</div>
                                </TD>
                                <TD>
                                    <INPUT maxLength=15 onchange=setDhcpStaticIPAddr(this.value) id="StaticIpAddress" name="StaticIpAddress" value="">
                                </TD>
                                </TR>
                                <TR id="dhcpmacaddr">
                                <TD width="10%">
                                    <div class="form-text">MAC地址</div>
                                </TD>
                                <TD>
                                    <INPUT maxLength=17 onchange=setDhcpStaticMACAddr(this.value) id="StaticMACAddress" name="StaticMACAddress" value="">
                                    <span>（格式：AA:BB:CC:DD:EE:FF）</span>
                                </TD>
                                </TR>
                                <TR id="dhcpbtnadddel">
                                    <TD width="10%">
                                        <div class="form-text"></div>
                                    </TD>
                                    <TD style="padding: 32px 0 60px;">
                                        <INPUT onclick="btnAdd()" id=buttonAdd name=buttonAdd type=button style="width: 230px;" value="添 加">
                                    </TD>
                                </TR>
                                <TR>
                                <TD colspan="2">
                                <TABLE id="dhcptablelist">
                                    <TR>
                                        <TD align="left" class="table-outer">
                                        <TABLE id="dhcptablelist" class="tblList2">
                                            <thead>
                                                <tr class="trStyle2">
                                                    <th class="tdWidth2" style="width: 30%;">IP地址</th>
                                                    <th class="tdWidth2" style="width: 50%;">MAC地址</th>
                                                    <th class="tdWidth2" style="width: 20%;">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var StaticInfo = '<% tcWebApi_JsonHook("get_static_info", "", "") %>'
                                                    
                                                    var rsp = JSON.parse(StaticInfo);
                                                    var StaticInfo_list = rsp.data;
                                                    dhcpListLen = StaticInfo_list.length;
                                                    if(dhcpListLen > 0)
                                                    {
                                                        for(var i = 0; i < dhcpListLen; i++)
                                                        {
                                                            document.write('<TR class="trStyle3">');
                                                            document.write('<TD class="tdWidth3" style="width: 30%;">' + StaticInfo_list[i]['IP'] + '</TD>');
                                                            document.write('<TD class="tdWidth3" style="width: 50%;">' + StaticInfo_list[i]['MAC'] + '</TD>');
                                                            document.write('<TD class="tdWidth3 operation" style="width: 20%;"><input type=checkbox id="rml" name="rml" onclick="doDel(' + StaticInfo_list[i]['Index'] + ')" value="' + StaticInfo_list[i]['Index'] + '"></TD>');
                                                            document.write('</TR>');
                                                        }
                                                    }
                                                </SCRIPT>
                                            </tbody>
                                        </TABLE>
                                        </TD>		
                                    </TR>
                                </TABLE>  
                            </TD>
                            </TR>
            <% else %>
                            <TR id="dhcpipaddr">
                            <TD width="10%">
                                <div class="form-text">IP地址</div>
                            </TD>
                            <TD>
                                <INPUT maxLength=15 onchange=setDhcpStaticIPAddr(this.value) id="StaticIpAddress" name="StaticIpAddress" value="" disabled>
                            </TD>
                            </TR>
                            <TR id="dhcpmacaddr">
                            <TD width="10%">
                                <div class="form-text">MAC地址</div>
                            </TD>
                            <TD>
                                <INPUT maxLength=17 onchange=setDhcpStaticMACAddr(this.value) id="StaticMACAddress" name="StaticMACAddress" value="" disabled>
                                <span>（格式：AA:BB:CC:DD:EE:FF）</span>
                            </TD>
                            </TR>
                            <TR id="dhcpbtnadddel">
                                <TD width="10%">
                                    <div class="form-text"></div>
                                </TD>
                                <TD style="padding: 32px 0 60px;">
                                    <INPUT onclick="btnAdd()" id=buttonAdd name=buttonAdd type=button style="width: 230px;" value="添 加" disabled>
                                </TD>
                            </TR>
                            <TR>
                            <TD colspan="2">
                            <TABLE id="dhcptablelist">
                                <TR>
                                    <TD align="left" class="table-outer">
                                    <TABLE id="dhcptablelist" class="tblList2">
                                        <thead>
                                            <tr class="trStyle2">
                                                <th class="tdWidth2" style="width: 30%;">IP</th>
                                                <th class="tdWidth2" style="width: 50%;">MAC</th>
                                                <th class="tdWidth2" style="width: 20%;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                var StaticInfo = '<% tcWebApi_JsonHook("get_static_info", "", "") %>'
                                                
                                                var rsp = JSON.parse(StaticInfo);
                                                var StaticInfo_list = rsp.data;
                                                dhcpListLen = StaticInfo_list.length;
                                                if(dhcpListLen > 0)
                                                {
                                                    for(var i = 0; i < dhcpListLen; i++)
                                                    {
                                                        document.write('<TR class="trStyle3">');
                                                        document.write('<TD class="tdWidth3" style="width: 30%;">' + StaticInfo_list[i]['IP'] + '</TD>');
                                                        document.write('<TD class="tdWidth3" style="width: 50%;">' + StaticInfo_list[i]['MAC'] + '</TD>');
                                                        document.write('<TD class="tdWidth3 operation" style="width: 20%;"><input type=checkbox id="rml" name="rml" onclick="doDel(' + StaticInfo_list[i]['Index'] + ')" value="' + StaticInfo_list[i]['Index'] + '" disabled></TD>');
                                                        document.write('</TR>');
                                                    }
                                                }
                                            </SCRIPT>
                                        </tbody>
                                    </TABLE>
                                    </TD>		
                                </TR>
                            </TABLE>  
                        </TD>
                        </TR>
            <% end if %>
            <% end if %>
                                </TBODY>
                            </TABLE>
                            </TD>
                        </TR>
                        </TBODY>
                            </TABLE>
                            </FORM>
                        </div>
                    </TD>
                </TR>
            </TBODY>
      </TABLE>
      </TD>

      <TD valign="top" id="RA配置_item" class="hide tab-dhcp-table">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD width=7 background=/img/panel3.gif>　</TD>
                    <TD valign="top">
                    <div>
                        <FORM name="RAConfigForm" action="/cgi-bin/net-dhcp.asp" method="post">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">RA配置</div>
                                        <input type="hidden" name="RA_Flag" value="0">
                                        <input type="hidden" name="RAEnable_Flag" value="<% tcWebApi_get("Radvd_Entry","Enable","s") %>">
                                        <input type="hidden" name="RAMode" value="<% tcWebApi_get("Radvd_Entry","Mode","s") %>">
                                        <input type="hidden" name="RAManagedEn_Flag" value="<% tcWebApi_get("Radvd_Entry","ManagedEnable","s") %>">
                                        <input type="hidden" name="RAOtherEn_Flag" value="<% tcWebApi_get("Radvd_Entry","OtherEnable","s") %>">
                                    </TD>
                                </TR>
                                <TR>
                                    <TD>
                                        <div class="title-line"></div>
                                    </TD>
                                </TR>
                            <TR>
                                <TD>
                                <TABLE>
                                    <TBODY>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">SLAAC</div>
                                    </TD>
                                    <TD align=left>
                                            <INPUT class="input-onoff" id=radvdSrvType onclick="RATypeClick();" type=checkbox name="radvdSrvType" <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>
                                    </TD>
                                    </TR>
                                    </TBODY>
                                </TABLE>
                                </TD>
                                <TD width=10>&nbsp;</TD>
                            </TR>
                            <TR>
                                <TD>
                                <DIV id=RAAssConnection style="DISPLAY: none">
                                <TABLE>
                                    <TBODY>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">配置模式</div>
                                    </TD>
                                    <TD align=left>
                                            <SELECT id=RAUseWan onchange="RAUseWanChange()" name="RAUseWan"> 
                                                                    <OPTION value="Normal" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("selected") end if%>>手动配置</OPTION> 
                                                                    <OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("selected") end if%>>自动配置</OPTION>
                                                                    </SELECT>
                                    </TD>
                                    </TR>
                                    <TR id='rapdsourcepart' style="display: none">
                                    <TD align=left width=120>
                                        <div class="form-text">前缀来源</div>
                                    </TD>
                                    <TD align=left id="prefixsource">
                                        <SELECT id=rapdsource name="rapdsource"></SELECT>
                                            <script language=JavaScript type=text/javascript>
                                            initRaPDSourceList();
                                            </script>
                                    </TD>
                                    </TR>
                                    <TR id='ramoflagdisp_1' style="display: none">
                                    
                                                    <TD align=left width=120>
                                                        <div class="form-text">Managed标志</div>
                                                    </TD>
                                                    <TD align=left>
                                                    <input class="input-onoff" type="checkbox" name="ramflag" id="ramflag" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
                                                    </TD>
                                    </TR>
                                    <TR id='ramoflagdisp_2' style="display: none">

                                        <TD align=left width=120>
                                            <div class="form-text">Other标志</div>
                                        </TD>
                                        <TD>
                                            <input class="input-onoff" type="checkbox" name="raoflag" id="raoflag" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
                                        </TD>
                                    </TR>
                                </TBODY>
                                </TABLE>
                                </DIV>
                                </TD>
                                <TD width=10>&nbsp;</TD>
                            </TR>
                            <TR id=RadvdPrefixCfg style="DISPLAY: none">
                                <TD>
                                <DIV>
                                <TABLE>
                                    <TBODY>
                                    <TR id=NamePrefix>
                                    <TD align=left width=120>
                                        <div class="form-text">前缀</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="radvdPrefix" maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="radvdPrefix" value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>"> 
                                    </TD>
                                    </TR>
                                    <TR id=NamePrefixLen>
                                    <TD align=left width=120>
                                        <div class="form-text">前缀长度</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="RAPrefixLen" maxLength=2 name="RAPrefixLen" value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>"> 
                                    (16 - 64)
                                    </TD>
                                    </TR>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">首选寿命</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="RAt1" maxLength=10 name="RAt1" value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>"> 
                                    (600 - 4294967295) 秒
                                    </TD>
                                    </TR>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">有效寿命</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="RAt2" maxLength=10 name="RAt2" value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>"> 
                                    (600 - 4294967295) 秒
                                    </TD>
                                    </TR>
                                    <TR>
                                    <!--TD align=left width=120>&nbsp;&nbsp;&nbsp;</TD-->
                                    <TD align=left >
                                        <div class="form-text">Managed标志</div>
                                    </TD>
                                    <TD>
                            <input class="input-onoff" type="checkbox" onClick="RAMOClick(0);" name="radvdmanageden" id="radvdmanageden" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
                                    </TD>
                            <!--input type="checkbox" onClick="RAMOClick(1);" name="radvdotheren" id="radvdotheren" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>-->
                            
                                    </TR>
                                    <TR>
                                        <TD>
                                            <div class="form-text">Other标志</div>
                                        </TD>
                                        <TD>
                                        <input class="input-onoff" type="checkbox" onClick="RAMOClick(1);" name="radvdotheren" id="radvdotheren" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
                                        </TD>
                                    </TR>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">RA最小间隔</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="RACycMin" maxLength=4 name="RACycMin" value="<%if tcWebApi_get("Radvd_Entry","MinRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MinRAInterval","s") end if%>">
                                    (3 - 1350) 秒</TD>
                                    </TR>
                                    <TR>
                                    <TD align=left width=120>
                                        <div class="form-text">RA最大间隔</div>
                                    </TD>
                                    <TD align=left >
                            <INPUT id="RACycMax" maxLength=4 name="RACycMax" value="<%if tcWebApi_get("Radvd_Entry","MaxRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxRAInterval","s") end if%>">
                                    (4 - 1800) 秒
                                    </TD>
                                    </TR>
                                    </TBODY>
                                </TABLE>
                                </DIV>
                                </TD>
                                <TD width=10>&nbsp;</TD>
                            </TR>
                            </TBODY>
                            </TABLE>
                            <P style="margin-top: 32px;margin-left: 182px;">
                                <BUTTON id="btnRASubmit" type="button" onclick=RASubmit(); name="btnRASubmit" value="Apply">保 存</BUTTON>
                            </p>
                        </FORM>
	  </TD></TR>
          </TBODY></TABLE>
       </TD>

      <TD valign="top" id="IPv6配置_item" class="hide tab-dhcp-table">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD width=7 background=/img/panel3.gif>　</TD>
                    <TD valign="top">
                    <div>
            <FORM id=ConfigForm1 name="ConfigForm1" action="/cgi-bin/net-dhcp.asp" method="post">
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") ="Yes" then %>            
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="display:none;">
<% else %>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<% end if %>
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">IPv6配置</div>
                        <input type="hidden" name="Dhcp1_Flag" value="0"> 
                      <input type="hidden" name="EnDHCPServerFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>">
                      <input type="hidden" name="DHCPSetTypeFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>">
                      <script language="JavaScript" type="text/JavaScript">
					  function typev6Click()
{
with ( document.forms[3] )
{
if (getCheckVal('dhcp6SrvType') == 0)//unchecked
{
disableDhcp6Srv();
EnDHCPServerFlag.value = "0";
}
else
{
enableDhcp6Srv(1);
EnDHCPServerFlag.value = "1";
}
	dnsSourceDisp();
}
}

function dnsSourceHide()
{
	setDisplay('dnssourcepart', 0);
	setDisplay('dnssourcepart_2', 0);
	setDisplay('dnssourcepart_3', 0);
    setDisplay('dnssourcepart_4', 0);
}
function dnsSourceDisp()
{
	with (document.forms[3])
	{
		if (1 == getCheckVal('dhcp6SrvType'))
		{
			if ( 'Normal' == UseWan.value )
			{
				dnsSourceHide();
			}
			else
			{
				setDisplay('dnssourcepart', 1);
				dnsSourceListChg();
			}
		}
		else
		{
				dnsSourceHide();
		}
	}
}

 function UseWanChange()
{
	with (document.forms[3])
	{
		if ( ("Normal" == UseWan.value) && (1 == getCheckVal('dhcp6SrvType')) )
		{
			setDisplay('DHCP6SPrefixCfg', 1);
			DHCPSetTypeFlag.value = "1";
		}
		else
		{
			if( "UseAllocatedSubnet" == UseWan.value)
				DHCPSetTypeFlag.value = "0";
			else if( "UseAllocatedOther" == UseWan.value)
				DHCPSetTypeFlag.value = "2";
			setDisplay('DHCP6SPrefixCfg', 0);
		}
		
		dnsSourceDisp();
	}
}

function DhcpCheckForm(type)
{
	with (document.forms[3])
	{
		if (1 != getCheckVal('dhcp6SrvType') || "Normal" != UseWan.value)
		{
			if ( 1 == getCheckVal('dhcp6SrvType') )
			{
				var dnsSourceType = getSelectVal('dnssource');
				
				if ( '998' == dnsSourceType )
				{
					if ("" == DnsSrvOne_Source.value || true != CheckPrefix(DnsSrvOne_Source.value,1))
					{
						alert('首选DNS服务器："' + DnsSrvOne_Source.value + '" 不是合法的IPv6地址！');
						return false;
					}
					
					if ("" != DnsSrvTwo_Source.value && true != CheckPrefix(DnsSrvTwo_Source.value,1))
					{
						alert('备用DNS服务器："' + DnsSrvTwo_Source.value + '" 不是合法的IPv6地址！');
						return false;
					}

                    if ("" != DnsSrvThree_Source.value && true != CheckPrefix(DnsSrvThree_Source.value,1))
					{
						alert('DNS3："' + DnsSrvThree_Source.value + '" 不是合法的IPv6地址！');
						return false;
					}
				}
			}

			return true;
		}

        if(dhcpIPv6.value.indexOf('/') != -1) {
            if (true != CheckPrefix(dhcpIPv6.value.split('/')[0],1))
            {
                alert('IP地址："' + dhcpIPv6.value +'" 不是合法的IPv6地址！');
                return false;
            }
        }
        else {
            if (true != CheckPrefix(dhcpIPv6.value,1))
            {
                alert('IP地址："' + dhcpIPv6.value +'" 不是合法的IPv6地址！');
                return false;
            }
        }

        if (true != CheckPrefix(dhcpStartaddr.value,1))
        {
            alert('起始地址："' + dhcpStartaddr.value +'" 不是合法的IPv6地址！');
            return false;
        }
        if (true != CheckPrefix(dhcpEndaddr.value,1))
        {
            alert('结束地址："' + dhcpEndaddr.value +'" 不是合法的IPv6地址！');
            return false;
        }

        if (true != CheckDNSRefresh(dhcpRefreshtime.value))
		{
			alert('DNS刷新时间："' + dhcpRefreshtime.value + '" 不合法！');
			return false;
		}
		
		// if (true != CheckPrefix(dhcpPrefix.value,0))
		// {
		// 	alert('前缀："' + dhcpPrefix.value +'" 不是合法的IPv6地址！');
		// 	return false;
		// }
		
		// if (true != CheckLength(PrefixLen.value))
		// {
		// 	alert('前缀长度："' + PrefixLen.value + '" 不合法！');
		// 	return false;
		// }
		
		// switch (CheckTime(t1.value,t2.value))
		// {
		// 	case 1 :
		// 	{
		// 		alert('首选寿命："' + t1.value + '" 不合法！');
		// 		return false;
		// 	}
		// 	case 2 :
		// 	{
		// 		alert('有效寿命："' + t2.value + '" 不合法！');
		// 		return false;
		// 	}
		// 	case 3 :
		// 	{
		// 		alert('有效寿命：' + t2.value + '小于等于' + '首选寿命：' + t1.value);
		// 		return false;
		// 	}
		// }
		
		if ("" == DnsSrvOne.value || true != CheckPrefix(DnsSrvOne.value,1))
		{
			alert('首选DNS服务器："' + DnsSrvOne.value + '" 不是合法的IPv6地址！');
			return false;
		}
		
		if ("" != DnsSrvTwo.value && true != CheckPrefix(DnsSrvTwo.value,1))
		{
			alert('备用DNS服务器："' + DnsSrvTwo.value + '" 不是合法的IPv6地址！');
			return false;
		}

        if ("" != DnsSrvThree.value && true != CheckPrefix(DnsSrvThree.value,1))
		{
			alert('DNS3："' + DnsSrvThree.value + '" 不是合法的IPv6地址！');
			return false;
		}	
	}
	return true;
}

function btnDhcp1Save()
{
	if (DhcpCheckForm() == true){
		document.ConfigForm1.Dhcp1_Flag.value = "1";
		//document.ConfigForm1.submit();  		need use jquery for hook
		$("form[name='ConfigForm1']").submit();
	}
}
					  </script>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
              <TR>
                <TD>
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=left width=120>
                          <div class="form-text">启动DHCP服务</div>
                      </TD>
                      <TD align=left>
                        <INPUT class="input-onoff" id=dhcp6SrvType onclick="typev6Click()" type=checkbox name="dhcp6SrvType" <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>
                      </TD>
                    </TR>
                  </TBODY></TABLE>
                </TD>
                <TD width=10>&nbsp;</TD>
              </TR>
              <TR>
                <TD>
                  <DIV id=AssConnection style="DISPLAY: none" class="ipv6Page">
                  <TABLE>
                    <TBODY>
                    <TR class="ipv6Page">
                      <TD align=left width=120>
                        <div class="form-text">配置模式</div>
                    </TD>
                      <TD align=left><SELECT id=UseWan  onchange="UseWanChange()" name="UseWan"> 
						<OPTION value="Normal" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("selected") end if%>>手动配置</OPTION> 
						<OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("selected") end if%>>自动配置前缀和域名服务器</OPTION> 
						<OPTION  value="UseAllocatedOther" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "2" then asp_Write("selected") end if%>>自动配置域名服务器</OPTION>
						  </SELECT>
                      </TD>
                    </TR>
                    <TR id='dnssourcepart' style="display: none">
                      <TD align=left width=120>
                        <div class="form-text">域名服务器来源</div>
                    </TD>
                      <TD align=left >
	              		      <SELECT id=dnssource name="dnssource" onchange='dnsSourceListChg()'></SELECT>
	              		      <script language=JavaScript type=text/javascript>
	                        initDnsSourceList();
	                        </script>
                       </TD>
                    </TR> 
										<TR id='dnssourcepart_2' style="display: none">
                      <TD align=left width=120>
                        <div class="form-text">首选DNS服务器</div>
                    </TD>
                      <TD align=left ><INPUT id="DnsSrvOne_Source" maxLength=39 name="DnsSrvOne_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
                      </TD></TR>
                    <TR id='dnssourcepart_3' style="display: none">
                      <TD align=left width=120>
                        <div class="form-text">备用DNS服务器</div>
                    </TD>
                      <TD align=left ><INPUT id="DnsSrvTwo_Source" maxLength=39 name="DnsSrvTwo_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
                      </TD></TR>
                      <TR id='dnssourcepart_4' style="display: none">
                        <TD align=left width=120>
                          <div class="form-text">DNS3</div>
                      </TD>
                        <TD align=left ><INPUT id="DnsSrvThree_Source" maxLength=39 name="DnsSrvThree_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver3","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver3","s") end if%>">
                        </TD>
                    </TR>
		    </TBODY>
                  </TABLE>
                  </DIV>
                </TD>
                <TD width=10>&nbsp;</TD>
             </TR>
             <TR id=DHCP6SPrefixCfg style="DISPLAY: none" class="ipv6Page">
                <TD>
                  <DIV>
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=left width=120>
                        <div class="form-text">分配地址格式</div>
                    </TD>
                      <TD align=left >
                          <SELECT id=AddrFormat name="AddrFormat"> 
                          <OPTION value="AddrPool" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "AddrPool" then asp_Write("selected") end if%>>地址池格式</OPTION> 
                          <OPTION value="EUI64" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "EUI64" then asp_Write("selected") end if%>>EUI64地址格式</OPTION>
                          </SELECT>
                       </TD>
                    </TR> 
                    <TR>
                        <TD align=left width=120>
                            <div class="form-text">IPv6地址</div>
                        </TD>
                        <TD align=left><INPUT id="dhcpIPv6" maxLength=64 onchange="this.value = this.value.toLowerCase( )" name="dhcpIPv6" value="<%if tcWebApi_get("Dhcp6s_Entry","Br0Addr", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Br0Addr","s") end if%>">
                        </TD>
                    </TR>
                    <TR>
                        <TD align=left width=120>
                            <div class="form-text">起始地址</div>
                        </TD>
                        <TD align=left><INPUT id="dhcpStartaddr" maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="dhcpStartaddr" value="<%if tcWebApi_get("Dhcp6s_Entry","MinAddress", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","MinAddress","s") end if%>">
                        </TD>
                    </TR>
                    <TR>
                        <TD align=left width=120>
                            <div class="form-text">结束地址</div>
                        </TD>
                        <TD align=left><INPUT id="dhcpEndaddr" maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="dhcpEndaddr" value="<%if tcWebApi_get("Dhcp6s_Entry","MaxAddress", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","MaxAddress","s") end if%>">
                        </TD>
                    </TR>
                    <TR>
                        <TD align=left width=120>
                          <div class="form-text">DNS刷新时间</div>
                      </TD>
                        <TD align=left><INPUT id="dhcpRefreshtime" maxLength=10 name="dhcpRefreshtime" value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>">
                              (60 - 864000) 秒
                        </TD>
                    </TR>
                    <!-- <TR>
                      <TD align=left width=120>
                        <div class="form-text">前缀</div>
                    </TD>
                      <TD align=left><INPUT id="dhcpPrefix" maxLength=39 onchange="this.value = this.value.toLowerCase( )" name="dhcpPrefix" value="<%if tcWebApi_get("Dhcp6s_Entry","PrefixIPv6", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") end if%>">
                      </TD></TR>
                    <TR>
                      <TD align=left width=120>
                        <div class="form-text">前缀长度</div>
                    </TD>
                      <TD align=left><INPUT id="PrefixLen" maxLength=2 name="PrefixLen" value="<%if tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "s") end if%>">
                            (16 - 64)
                      </TD></TR> -->
                    <!-- <TR>
                      <TD align=left width=120>
                        <div class="form-text">首选寿命</div>
                    </TD>
                      <TD align=left><INPUT id="t1" maxLength=10 name="t1" value="<%if tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "s") end if%>">
                            (60 - 4294967295) 秒
                      </TD></TR>
                    <TR>
                      <TD align=left width=120>
                        <div class="form-text">有效寿命</div>
                    </TD>
                      <TD align=left>
                          <INPUT id="t2" maxLength=10 name="t2" value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>">
                            (60 - 4294967295) 秒
                      </TD></TR> -->
                    <TR>
                      <TD align=left width=120>
                        <div class="form-text">首选DNS服务器</div>
                    </TD>
                      <TD align=left><INPUT id="DnsSrvOne" maxLength=39 name="DnsSrvOne" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
                      </TD></TR>
                    <TR>
                      <TD align=left width=120>
                        <div class="form-text">备用DNS服务器</div>
                    </TD>
                      <TD align=left><INPUT id="DnsSrvTwo" maxLength=39 name="DnsSrvTwo" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
                      </TD>
                    </TR>
                    <TR>
                        <TD align=left width=120>
                          <div class="form-text">DNS3</div>
                      </TD>
                        <TD align=left ><INPUT id="DnsSrvThree" maxLength=39 name="DnsSrvThree" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver3","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver3","s") end if%>">
                        </TD>
                    </TR>
                    </TBODY>
                    </TABLE>
                    </DIV>
                </TD>
                <TD width=10>&nbsp;</TD>
             </TR>
             <TR id=DHCP6SDomainName style="DISPLAY: none">
                <TD>
                  <DIV>
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD align=left width=120>Domain 
                      name:&nbsp;&nbsp;&nbsp;</TD>
                      <TD align=left>
                              <INPUT maxLength=16 name=DomainNameText value="<%if tcWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then tcWebApi_get("Ddns_Entry","MYHOST","s") end if%>">
                      </TD>
                    </TR>
                    </TBODY>
                  </TABLE>
                  </DIV>
                </TD>
                <TD width=10>&nbsp;</TD>
             </TR>
           </TBODY>
          </TABLE>
          <P style="margin-top: 32px;margin-left: 182px;">
             <BUTTON id=btnApply2 type="button" onclick="btnDhcp1Save();" name=btnApply2 value="Apply">保 存</BUTTON>
          </P>
	  </FORM>
	  </TD></TR>
          </TBODY></TABLE>
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
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
    var tdList = $(".operation .input-checkbox");
    for(var i = 0; i < tdList.length; i++) {
        $(".operation .input-checkbox").eq(i).text("删 除");
    }
    if(!numGlobal) {
        getElById('prefixsource').getElementsByClassName("select-list-options")[0].style.border = "none";
    }
</script>
