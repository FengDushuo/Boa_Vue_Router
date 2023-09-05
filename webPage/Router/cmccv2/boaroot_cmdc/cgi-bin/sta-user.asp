<%
tcWebApi_get("Info_Ether", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "info_ether_read", "1")

tcWebApi_get("Info_WLan", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "info_wlan_read", "1")

tcWebApi_get("Info_WLan11ac", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "info_wlan11ac_read", "1")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>用户侧信息</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<script language="javascript" src="/JS/json2.js"></script>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<% if TCWebApi_get("WebCustom_Entry","isCTUsbSupported","h" ) = "Yes" then %> 
<SCRIPT language=JavaScript type=text/javascript src="/cgi-bin/showusb.cgi"></SCRIPT>
<% end if %>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();LoadFrame();" 
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
		<input id="Selected_Menu" type="hidden" value="状态->用户侧信息" name="Selected_Menu">
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
<SCRIPT language=JavaScript type=text/javascript>
var PortConnStatus = new Array(4);
PortConnStatus[0] = "<% tcWebApi_get("Info_Ether","Port1Status","s") %>";
PortConnStatus[1] = "<% tcWebApi_get("Info_Ether","Port2Status","s") %>";
PortConnStatus[2] = "<% tcWebApi_get("Info_Ether","Port3Status","s") %>";
PortConnStatus[3] = "<% tcWebApi_get("Info_Ether","Port4Status","s") %>";

var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
var PortIp = aryInfoTemp.split(',');
var dhcpnum = PortIp.length - 1;
aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
var PortMac = aryInfoTemp.split(',');
aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortDHCP","s") %>";
var PortDhcp = aryInfoTemp.split(',');
aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortExpire","s") %>";
var PortExpireTime = aryInfoTemp.split(',');
aryInfoTemp = "<% tcWebApi_get("Info_Ether","HostName","s") %>";
var PortHostName = aryInfoTemp.split(',');
aryInfoTemp = "<% tcWebApi_get("Info_Ether","brHost","s") %>";
var LayerConInterface = aryInfoTemp.split(',');

function getLanPort(mac)
{
	for ( var idx = 0; idx < LayerConInterface.length; idx ++ )
	{
			var mac_ports = LayerConInterface[idx];
			var obj_dif = mac_ports.split('=');
			if ( 2 == obj_dif.length
				&& mac == obj_dif[1] )
				return obj_dif[0];
	}

	return '1';
}

var wlanEnbl = "<% TCWebApi_get("WLan_Common", "APOn", "s") %>";
var wlanacEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";

var SwitchOperation = "<% TCWebApi_get("SwitchPara_Common", "SwitchNeedOperation", "s") %>";
var isNPUVer = "<% TCWebApi_get("WebCustom_Entry", "isNPUSupported", "s") %>";
var PortMode = new Array(4);
var PortRate = new Array(4);
var PortEntryEnable = new Array(4);
var PortEntryMode = new Array(4);
var PortEntryRate = new Array(4);

PortEntryEnable[0] = "<% TCWebApi_get("Info_Ether", "Port1Enable", "s") %>";
PortEntryRate[0] = "<% TCWebApi_get("Info_Ether", "Port1Speed", "s") %>";
PortEntryMode[0] = "<% TCWebApi_get("Info_Ether", "Port1Duplex", "s") %>";
PortEntryEnable[1] = "<% TCWebApi_get("Info_Ether", "Port2Enable", "s") %>";
PortEntryRate[1] = "<% TCWebApi_get("Info_Ether", "Port2Speed", "s") %>";
PortEntryMode[1] = "<% TCWebApi_get("Info_Ether", "Port2Duplex", "s") %>";
PortEntryEnable[2] = "<% TCWebApi_get("Info_Ether", "Port3Enable", "s") %>";
PortEntryRate[2] = "<% TCWebApi_get("Info_Ether", "Port3Speed", "s") %>";
PortEntryMode[2] = "<% TCWebApi_get("Info_Ether", "Port3Duplex", "s") %>";
PortEntryEnable[3] = "<% TCWebApi_get("Info_Ether", "Port4Enable", "s") %>";
PortEntryRate[3] = "<% TCWebApi_get("Info_Ether", "Port4Speed", "s") %>";
PortEntryMode[3] = "<% TCWebApi_get("Info_Ether", "Port4Duplex", "s") %>";

if(SwitchOperation == "Yes")
{
	for(i = 0; i < 4; i++)
	{
		if(PortEntryEnable[i] == "1")
		{
			if(PortEntryRate[i] != "N/A")
				PortRate[i] = PortEntryRate[i]+"M";
			else
			{
				if(i == 0)
					PortRate[i] = "1000M";
				else
					PortRate[i] = "100M";
			}
			if(PortEntryMode[i] != "N/A")	
			{
				if(PortEntryMode[i] == "0")
					PortMode[i] = "半双工";
				else if(PortEntryMode[i] == "Auto")
					PortMode[i] = "自动";
				else
					PortMode[i] = "全双工";
			}
			else
			{
				PortMode[i] = "全双工";
			}
		}
		else
		{
			if(i == 0)
				PortRate[i] = "1000M";
			else
				PortRate[i] = "100M";
			PortMode[i] = "全双工";	
		}
	}
}

else if ( ("No" == SwitchOperation) || ("Yes" == isNPUVer))
{
	for ( i = 0; i < 4; i++ )
	{
		if ( ("Down" != PortEntryRate[i]) && ("N/A" != PortEntryRate[i]) )
		{
			PortRate[i] = PortEntryRate[i];
		}
		else
		{
			PortRate[i] = "0M";
		}	

		if ( ("" != PortEntryMode[i]) && ("N/A" != PortEntryMode[i]) )	
		{
			if ( "Auto" == PortEntryMode[i] )
			{
				PortMode[i] = "自动";
			}
			else if ( "Full" == PortEntryMode[i] )
			{
				PortMode[i] = "全双工";
			}
			else
			{
				PortMode[i] = "半双工";
			}
		}	
		else
		{
			PortMode[i] = "全双工";
		}
	}
}

else
{
	PortMode[0] = "全双工";
	PortMode[1] = "全双工";
	PortMode[2] = "全双工";
	PortMode[3] = "全双工";
	PortRate[0] = "1000M";
	PortRate[1] = "100M";
	PortRate[2] = "100M";
	PortRate[3] = "100M";
}

function stWlan(domain,enable,ssid,BeaconType,BasicEncrypt,BasicAuth,WPAEncrypt,WPAAuth,IEEE11iEncrypt,IEEE11iAuth,Channel,ChannelsInUse)
{
	this.domain = domain;
	this.enable = enable;
	this.ssid = ssid;
	this.BeaconType = BeaconType;
	this.BasicAuth = BasicAuth;
	this.BasicEncrypt = BasicEncrypt;
	this.WPAAuth = WPAAuth;
	this.WPAEncrypt = WPAEncrypt;
	this.IEEE11iAuth = IEEE11iAuth;
	this.IEEE11iEncrypt = IEEE11iEncrypt;
	this.Channel = Channel;
	this.ChannelsInUse = ChannelsInUse;
}

var DeviceInfo =  [["0","Computer","  "," ","0"," Static "],null];

var WLanSSID = new Array(<% tcWebApi_JsonHook("get_wlan_ssid_info", "", "") %>);
var WLanACSSID = new Array(<% tcWebApi_JsonHook("get_wlanac_ssid_info", "", "") %>);
var WlanInfo = new Array(4);
WlanInfo[0] = new stWlan("0","<% tcWebApi_get("WLan_Entry0","HideSSID","s") %>",WLanSSID[0],"<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
<% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") <> "Yes" then %>
WlanInfo[1] = new stWlan("1","<% tcWebApi_get("WLan_Entry1","HideSSID","s") %>",WLanSSID[1],"<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanInfo[2] = new stWlan("2","<% tcWebApi_get("WLan_Entry2","HideSSID","s") %>",WLanSSID[2],"<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanInfo[3] = new stWlan("3","<% tcWebApi_get("WLan_Entry3","HideSSID","s") %>",WLanSSID[3],"<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanInfo[4] = new stWlan("4","<% tcWebApi_get("WLan_Entry4","HideSSID","s") %>",WLanSSID[4],"<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
<% end if %>

var WlanacInfo = new Array(4);
WlanacInfo[0] = new stWlan("0","<% tcWebApi_get("WLan11ac_Entry0","HideSSID","s") %>",WLanACSSID[0],"<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
<% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") <> "Yes" then %>
WlanacInfo[1] = new stWlan("1","<% tcWebApi_get("WLan11ac_Entry1","HideSSID","s") %>",WLanACSSID[1],"<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanacInfo[2] = new stWlan("2","<% tcWebApi_get("WLan11ac_Entry2","HideSSID","s") %>",WLanACSSID[2],"<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
WlanacInfo[3] = new stWlan("3","<% tcWebApi_get("WLan11ac_Entry3","HideSSID","s") %>",WLanACSSID[3],"<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","EncrypType","s") %>","AESEncryption","PSKAuthentication","0","1");
<% end if %>

var PacketInfo = new Array();
PacketInfo = [["0","0","0","0","0","0","0","0","0"],null];



Ethernet = [["0","Disabled","560097","4123","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.2","Up","560097","4123","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.3","Disabled","560362","4124","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.4","Disabled","560362","4124","0","0","3096680","5897","0","0"],null]

var usbstate0 = "<% tcWebApi_get("Usb_Entry0","usbstate","s") %>";
var usbstate1 = "<% tcWebApi_get("Usb_Entry1","usbstate","s") %>";

var usb = [null];
var usb1 = usb[0];
if (usb.length > 1)
var usb2 = usb[1];
var i = 0;
var LanInfo = new Array();

function stUserInfo(domain,name,level,busy)
{
	this.domain = domain;
	this.name = name;
	this.level = level;
	this.busy = busy;
}

var UserInfo = new Array(3);
	UserInfo[0] = new stUserInfo(0,"<% tcWebApi_get("Account_Entry0","username","s") %>","<% tcWebApi_get("Account_Entry1","usertype","s") %>","null");
	UserInfo[1] = new stUserInfo(1,"<% tcWebApi_get("Account_Entry1","username","s") %>","<% tcWebApi_get("Account_Entry2","usertype","s") %>","null");
	UserInfo[2] = new stUserInfo(2,"<% tcWebApi_get("Account_Entry2","username","s") %>","<% tcWebApi_get("Account_Entry3","usertype","s") %>","null");

var k = 1;
for(k=0; k < UserInfo.length-1; k++)
{
	var num = UserInfo[k].level;
	if (num == 1)
	{
		break;
	}
}
var sysUserName = UserInfo[k].name;
var addressNum = 0;
var i = 0;
function ipv6cnst(domain,ipv6address)
{
	this.domain = domain;
	this.ipv6address = ipv6address.split(',');
	addressNum = this.ipv6address.length;
}
var ipv6infost = new Array(new ipv6cnst("1","1111:db8:1::1,fe80::1"),new ipv6cnst("2","1111:db8:2::1,fe80::1"),new ipv6cnst("3","1111:db8:1::1,fe80::1"),null);


function LoadFrame()
{
	if (curUserName != sptUserName)
	{
		document.all("NetPacketInfo_WLan").style.display = "none";
		document.all("NetPacketInfo_Ethe").style.display = "none";
	}
}
function LanInfoConstruction(Device, IPAddr, MACAddr, Status)
{
	this.Device = Device;
	this.IPAddr = IPAddr;
	this.MACAddr = MACAddr;
	this.Status = Status;
}
function DhcpServerRelTime(timeVal)
{
	var timeString = "租期剩余";
	if (timeVal == 0)
	{
		return '租期已满';
	}
	if (timeVal >= 60*60*24)
	{
		timeString += parseInt(timeVal/(60*60*24)) + "天" ;
		timeVal %= 60*60*24;
	}
	if (timeVal >= 60*60)
	{
		timeString += parseInt(timeVal / (60*60)) + "小时" ;
		timeVal %= 60*60;
	}
	if (timeVal >= 60)
	{
		timeString += parseInt(timeVal / (60)) + "分钟" ;
		timeVal %= 60;
	}
	if (timeVal > 0)
	{
		timeString += timeVal + '秒';
	}
	return timeString;
}

var cfg_menu_list  = new Array( 'WLAN接口信息', 'WLAN5G接口信息', 'LAN接口信息', 'USB接口信息', '接入终端限制信息', 'WAN接口信息');
var cfg_cookie_name = 'sta-user-menu';
init_l_menu();
</SCRIPT>
		<TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
		<TBODY>  
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD">
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <> "Yes" then %>
					<li name="WLANInterfaceInfo" id="WLAN接口信息">WLAN接口信息</li>
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>    
					<li name="WLAN5GInterfaceInfo" id="WLAN5G接口信息">WLAN5G接口信息</li>
<% end if %>
					<li name="LANInterfaceInfo" id="LAN接口信息">LAN接口信息</li>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <> "Yes" then %> 
<% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
<% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<li name="USBInterfaceInfo" id="USB接口信息">USB接口信息</li>
<% end if %>  
<% end if %>  
<% end if %>  
<% end if %>  
<% if tcwebApi_get("WebCustom_Entry","isCTSCSupported","h") = "Yes" then %>
					<li name="TerminalLimitInfo" id="接入终端限制信息">接入终端限制信息</li>
<% end if %> 
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
<% if tcWebApi_get("APWanInfo_Common", "FixedAPMode","h") = "Route" then %>
					<li name="WANInterfaceInfo" id="WAN接口信息">WAN接口信息</li>
<% end if %>  
<% end if %>  
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD style="padding: 0 0 40px 0;" valign="top">
				<div class='hide' id="WLAN接口信息_item">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">WLAN接口信息</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
                            
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
<% if tcwebApi_get("WanInfo_Common","CurAPMode","h") = "APClient" then %>
<% if tcWebApi_get("APCli_Common", "currentRadio","h") = "0" then %>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanDHCP">
                                        <TBODY>
                                            <TR>
                                                <TD class=table_title align=middle>接口</TD>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var APSSID = "<%tcWebApi_get("APCli_Entry0","SSID","s") %>";
                                                    document.write('<TD class=table_title align=middle>' + "中继[" + APSSID + "]" + '</TD>');
                                                </SCRIPT>
                                            </TR>
                                            <TR>
                                                <TD class=table_title align=middle>认证与加密模式</TD>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var APAuthMode = "<%tcWebApi_get("APCli_Entry0","AuthMode","s") %>";
                                                    var APEncryType = "<%tcWebApi_get("APCli_Entry0","EncrypType","s") %>";
                                                    document.write('<TD>' + APAuthMode +'/'+ APEncryType + '</TD>');
                                                </SCRIPT>
                                            </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
<% end if %>
<% end if %>
<% end if %>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="statblList" border="1" name="tabWlanstat">
                                        <TBODY>
                                            <TR>
                                                <TD class=table_title width="20%">无线网络开关状态</TD>
                                                <TD>				  
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    if (wlanEnbl == "0")
                                                    {
                                                        document.write('未启用')
                                                    }
                                                    else
                                                    {
                                                        document.write('启用')
                                                    }
                                                </SCRIPT>
                                                </TD>
                                            </TR>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                            if ( wlanEnbl == "1") {
                                                if (curUserName == sptUserName) {
                                                    document.write( '<tr>' + '<td class="table_title">信道</td>' + '<td>' + "<%tcWebApi_get("Info_WLan","CurrentChannel","s") %>" + '</TD>' + '</tr>');
                                                }

                                                <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                                    var HT_BW = <%tcWebApi_get("WLan_Common","HT_BW","s") %>;
                                                    var HT_BSSCoexistence = <%tcWebApi_get("WLan_Common","HT_BSSCoexistence","s") %>;
                                                    
                                                    if( HT_BW == "0")
                                                        document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>20MHZ</td>' + '</tr>');
                                                    else if(( HT_BW == "1") && (HT_BSSCoexistence == "0"))
                                                        document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>40MHZ</td>' + '</tr>');
                                                    else if(( HT_BW == "1") && (HT_BSSCoexistence == "1"))
                                                        document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>20/40MHZ</td>' + '</tr>');
                                                <% end if %> 
                                            }
                                            </SCRIPT>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" id="tabWlanCount" name="tabWlanCount">
                                        <TBODY>
                                            <TR>
                                                <TD class=table_title align=middle>接口</TD>
                                                <TD class=table_title align=middle colSpan=4><CENTER>接收 </CENTER></TD>
                                                <TD class=table_title align=middle colSpan=4><CENTER>发送 </CENTER></TD>
                                            </TR>
                                            <TR>
                                                <TD class=table_title align=middle></TD>
                                                <TD class=table_title align=middle>字节</TD>
                                                <TD class=table_title align=middle>包</TD>
                                                <TD class=table_title align=middle>错误</TD>
                                                <TD class=table_title align=middle>丢弃</TD>
                                                <TD class=table_title align=middle>字节</TD>
                                                <TD class=table_title align=middle>包</TD>
                                                <TD class=table_title align=middle>错误</TD>
                                                <TD class=table_title align=middle>丢弃</TD>
                                            </TR>
                                            <SCRIPT language=javascript>
                                            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                            <% if tcWebApi_get("WanInfo_Common", "CurAPMode","h") = "APClient" then %>
                                            <% if tcWebApi_get("APCli_Common", "currentRadio","h") = "0" then %>
                                                document.writeln("<tr>");
                                                document.writeln("<td class='table_title' align='center'>" + "WLAN上行" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","rxbytes","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","rxpackets","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","rxerrpkts","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","rxdroppkts","s") %>" + "</td>");
                                                                
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","txbytes","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","txpackets","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","txerrpkts","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apcli0","txdroppkts","s") %>" + "</td>");
                                                document.writeln("</tr>");
                                                <% end if %>
                                                <% end if %>
                                                <% end if %>
                                                if (wlanEnbl == "1")
                                                {
                                                document.writeln("<tr>");
                                                document.writeln("<td class='table_title' align='center'>" + "无线" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","rxbytes","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanRxFrames","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanRxErrFrames","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanRxDropFrames","s") %>" + "</td>");
                                                                
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","txbytes","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanTxFrames","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanTxErrFrames","s") %>" + "</td>");
                                                document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_WLan","wlanTxDropFrames","s") %>" + "</td>");
                                                document.writeln("</tr>");
                                                }
                                            </SCRIPT>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabWlanSSID">
                                        <TBODY>
                                            <TR>
                                                <TD width="20%" align=middle class=table_title>SSID索引</TD>
                                                <TD class=table_title align=middle>SSID名称</TD>
                                                <TD class=table_title align=middle>安全配置</TD>
                                                <TD class=table_title align=middle>认证方式</TD>
                                                <TD class=table_title align=middle>加密 </TD>
                                            </TR>
                                            <SCRIPT language=javascript>
                                                var ssidnum=<% tcWebApi_get("WLan_Common","BssidNum","s") %>

                                            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                                var EnableSSID = new Array(3);
                                                EnableSSID[0] = "<% TCWebApi_get("WLan_Entry1", "EnableSSID", "s") %>";
                                                EnableSSID[1] = "<% TCWebApi_get("WLan_Entry2", "EnableSSID", "s") %>";
                                                EnableSSID[2] = "<% TCWebApi_get("WLan_Entry3", "EnableSSID", "s") %>";
                                            <% end if %>

                                                if (wlanEnbl == "1")
                                                {
                                                    for (var i = 0; i < ssidnum; i++)
                                                    {
                                            <% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") = "Yes" then %>
                                                        if ( i > 0 )
                                                            continue;
                                            <% end if %> 
                                                        var Auth = "";
                                                        var Encrypt = "";
                                                        var AuthSt = "已配置";
                                                        if (WlanInfo[i].BeaconType.indexOf('WEP') > -1)
                                                        {
                                                            Auth = WlanInfo[i].BasicAuth;
                                                            Encrypt = WlanInfo[i].BasicEncrypt;
                                                        }
                                                        else if(WlanInfo[i].BeaconType.indexOf('OPEN') > -1)
                                                        {
                                                            Auth = "OPEN";
                                                            Encrypt = "NONE";
                                                            AuthSt = "未配置";
                                                        }
                                                        else 
                                                        {
                                                            Encrypt = WlanInfo[i].WPAAuth;
                                                            Auth = WlanInfo[i].WPAEncrypt;
                                                        }							

                                                        if(Auth=="WPAPSKWPA2PSK")
                                                            Auth = "WPA-PSK/WPA2-PSK";
                                                        else if(Auth=="WPAPSK")
                                                            Auth = "WPA-PSK";							
                                                        else if(Auth=="WPA2PSK")
                                                            Auth = "WPA2-PSK";							

                                                        if(Encrypt == "TKIPAES" )
                                                            Encrypt = "TKIP+AES";

                                            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                                        if((i == 0) || (EnableSSID[i - 1] == "1"))
                                            <% end if %>
                                                            document.writeln('<tr>' + '<td class="table_title" align="center">' + 'SSID-' + (i+1) + '</td>' + '<td align="center" style="max-width: 198px!important;">' + WlanInfo[i].ssid + '</td><td align="center">' + AuthSt + '</td>' + '</td><td align="center">' + Auth.toUpperCase () + '</td>' + '<td' + ' align="center">' + Encrypt.toUpperCase() + '</td>' + '</tr>');
                                                    }
                                                }
                                            </SCRIPT>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                    <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanDHCP">
                                            <TBODY>
                    <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") <> "Route" then %-->
                                                <TR>
                                                    <TD class=table_title colspan="4" align=middle>接入设备信息</TD>
                                                </TR>
                    <!--% end if %-->
                                                <TR>
                                                    <TD class=table_title align=middle>IP地址</TD>
                                                    <TD class=table_title align=middle>MAC地址</TD>
                    <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") = "Route" then %-->
                                                    <!--TD class=table_title align=middle>状态</TD-->
                                                    <TD class=table_title align=middle>设备名称</TD>
                    <!--% end if %-->
                                                    <TD class=table_title align=middle>SSID</TD>
                                                </TR>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var lanhost_value = '<% tcWebApi_JsonHook("get_lanhost_info", "action", "area") %>'
                                                    var rsp = JSON.parse(lanhost_value);
                                                    var lanhost_list = rsp.data;
            
                                                    for(var i = 0; i < lanhost_list.length; i++)
                                                    {
                                                        if(lanhost_list[i].conntype == '1' && lanhost_list[i].Port <= 8) {
                                                            var hostname = lanhost_list[i]['HostName'] ? lanhost_list[i]['HostName'] : "anonymous";
                                                            var ssid = "";
                                                            switch (lanhost_list[i]['Port']) {
                                                                case '1':
                                                                    ssid = '<% tcWebApi_get("WLan_Entry0","SSID","s") %>';
                                                                    break;
                                                                case '2':
                                                                    ssid = '<% tcWebApi_get("WLan_Entry1","SSID","s") %>';
                                                                    break;
                                                                case '3':
                                                                    ssid = '<% tcWebApi_get("WLan_Entry2","SSID","s") %>';
                                                                    break;
                                                                case '4':
                                                                    ssid = '<% tcWebApi_get("WLan_Entry3","SSID","s") %>';
                                                                    break;
                                                                case '5':
                                                                    ssid = '<% tcWebApi_get("WLan_Entry4","SSID","s") %>';
                                                                    break;
                                                                default:
                                                                    break;
                                                            }

                                                            document.write('<TR align="center">');
                                                            document.write('<TD align="center">' + lanhost_list[i]['IP'] + '</TD>');
                                                            document.write('<TD align="center">' + lanhost_list[i]['MAC'] + '</TD>');
                                                            document.write('<TD align="center">' + hostname + '</TD>');
                                                            document.write('<TD align="center">' + ssid + '</TD>');
                                                            document.write('</TR>');
                                                        }
                                                    }
                                                </SCRIPT>
                                            </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                    <% end if %>
                    </TBODY>
                </TABLE>
       			</div>
				<div class='hide' id="WLAN5G接口信息_item">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">WLAN5G接口信息</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
<% if tcwebApi_get("WanInfo_Common","CurAPMode","h") = "APClient" then %>
<% if tcWebApi_get("APCli_Common", "currentRadio","h") = "1" then %>
                <TR>
                    <TD class="table-outer">
						<TABLE class="tblList" border="1" name="tabLanDHCP">
                            <TBODY>
                                <TR>
                                    <TD class=table_title align=middle>接口</TD>
                                    <SCRIPT language=JavaScript type=text/javascript>
                                        var APSSID = "<%tcWebApi_get("APCli_Entry1","SSID","s") %>";
                                        document.write('<TD class=table_title align=middle>' + "中继[" + APSSID + "]" + '</TD>');
                                    </SCRIPT>
                                </TR>
                                <TR>
                                    <TD class=table_title align=middle>认证与加密模式</TD>
                                    <SCRIPT language=JavaScript type=text/javascript>
                                        var APAuthMode = "<%tcWebApi_get("APCli_Entry1","AuthMode","s") %>";
                                        var APEncryType = "<%tcWebApi_get("APCli_Entry1","EncrypType","s") %>";
                                        document.write('<TD>' + APAuthMode +'/'+ APEncryType + '</TD>');
                                    </SCRIPT>
                                </TR>
                            </TBODY>
						</TABLE>
                    </TD>
                </TR>
                <TR style="height: 48px;"></TR>
						
<% end if %>
<% end if %>
<% end if %>
                <TR>
                    <TD class="table-outer">
						<TABLE class="statblList" border="1" name="tab11acStat">
                            <TBODY>
                                <TR>
                                    <TD class=table_title width="20%">无线网络开关状态</TD>
                                    <TD>				  
                                    <SCRIPT language=JavaScript type=text/javascript>
                                        if (wlanacEnbl == "0")
                                        {
                                            document.write('未启用')
                                        }
                                        else
                                        {
                                            document.write('启用')
                                        }
                                    </SCRIPT>
                                    </TD>
                                </TR>
                                <SCRIPT language=JavaScript type=text/javascript>
                                    if( wlanacEnbl == "1") {
                                        if(curUserName == sptUserName) {
                                            document.write( '<tr>' + '<td class="table_title">信道</td>' + '<td>' + "<%tcWebApi_get("Info_WLan11ac","CurrentChannel","s") %>"  + '</TD>' + '</tr>');
                                        }

                                        <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                            var acHT_BW = <%tcWebApi_get("WLan11ac_Common","HT_BW","s") %>;
                                            var VHT_BW = <%tcWebApi_get("WLan11ac_Common","VHT_BW","s") %>;
                                            var acHT_BSSCoexistence = <%tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","s") %>;

                                            if(( acHT_BW == "0") && (VHT_BW == "0"))
                                                document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>20MHZ</td>' + '</tr>');
                                            else if(( acHT_BW == "1") && (VHT_BW == "0") && (acHT_BSSCoexistence == "1"))
                                                document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>40MHZ</td>' + '</tr>');
                                            else if(( acHT_BW == "1") && (VHT_BW == "1") && (acHT_BSSCoexistence == "1"))
                                                document.write( '<tr>' + '<td class="table_title">频率带宽</td>' + '<td>80MHZ</td>' + '</tr>');
                                        <% end if %> 
                                    }
                                </SCRIPT>
                            </TBODY>
						</TABLE>
                    </TD>
                </TR>
                <TR style="height: 48px;"></TR>
						<TR>
                            <TD class="table-outer">
                            <TABLE class="tblList" border="1" id="tab11acCount" name="tab11acCount">
                                <TBODY>
                                    <TR>
                                        <TD class=table_title align=middle>接口</TD>
                                        <TD class=table_title align=middle colSpan=4><CENTER>接收 </CENTER></TD>
                                        <TD class=table_title align=middle colSpan=4><CENTER>发送 </CENTER></TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title align=middle></TD>
                                        <TD class=table_title align=middle>字节</TD>
                                        <TD class=table_title align=middle>包</TD>
                                        <TD class=table_title align=middle>错误</TD>
                                        <TD class=table_title align=middle>丢弃</TD>
                                        <TD class=table_title align=middle>字节</TD>
                                        <TD class=table_title align=middle>包</TD>
                                        <TD class=table_title align=middle>错误</TD>
                                        <TD class=table_title align=middle>丢弃</TD>
                                    </TR>
        <SCRIPT language=javascript>
        <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
        <% if tcWebApi_get("WanInfo_Common", "CurAPMode","h") = "APClient" then %>
        <% if tcWebApi_get("APCli_Common", "currentRadio","h") = "1" then %>
            document.writeln("  <tr>");
            document.writeln(" <td class='table_title' align='center'>" + "WLAN上行" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","rxbytes","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","rxpackets","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","rxerrpkts","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","rxdroppkts","s") %>" + "</td>");
                            
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","txbytes","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","txpackets","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","txerrpkts","s") %>" + "</td>");
            document.writeln("<td align='center'>" + "<% tcWebApi_get("Info_apclii0","txdroppkts","s") %>" + "</td>");
            document.writeln("  </tr>");
        <% end if %>
        <% end if %>
        <% end if %>
            if (wlanacEnbl == "1")
            {
                document.writeln("  <tr>");
                document.writeln(" <td class='table_title' align='center'>" + "无线" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanRxBytes","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanRxFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanRxErrFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanRxDropFrames","s") %>" + "</td>");

                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanTxBytes","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanTxFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanTxErrFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_WLan11ac","wlanTxDropFrames","s") %>" + "</td>");
                document.writeln("  </tr>");
            }	
        </SCRIPT>
                                </TBODY>
                            </TABLE>
                    </TD>
                </TR>
                <TR style="height: 48px;"></TR>
                        <TR>
                            <TD class="table-outer">
                                <TABLE class="tblList" border="1" name="tab11acSSID">
                                    <TBODY>
                                        <TR>
                                            <TD width="20%" align=middle class=table_title>SSID索引</TD>
                                            <TD class=table_title align=middle>SSID名称</TD>
                                            <TD class=table_title align=middle>安全配置</TD>
                                            <TD class=table_title align=middle>认证方式</TD>
                                            <TD class=table_title align=middle>加密 </TD>
                                        </TR>
                                        <SCRIPT language=javascript>
                                            var ssidacnum=<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>

                                        <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                            var EnableSSID = new Array(3);
                                            EnableSSID[0] = "<% TCWebApi_get("WLan11ac_Entry1", "EnableSSID", "s") %>";
                                            EnableSSID[1] = "<% TCWebApi_get("WLan11ac_Entry2", "EnableSSID", "s") %>";
                                            EnableSSID[2] = "<% TCWebApi_get("WLan11ac_Entry3", "EnableSSID", "s") %>";
                                        <% end if %>

                                            if (wlanacEnbl == "1")
                                            {
                                                for (var i = 0; i < 1; i++)
                                                {
                                        <% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") = "Yes" then %>
                                                    if ( i > 0 )
                                                        continue;
                                        <% end if %> 
                                                    var Auth = "";
                                                    var Encrypt = "";
                                                    var AuthSt = "已配置";
                                                    if (WlanacInfo[i].BeaconType.indexOf('WEP') > -1)
                                                    {
                                                        Auth = WlanacInfo[i].BasicAuth;
                                                        Encrypt = WlanacInfo[i].BasicEncrypt;
                                                    }
                                                    else if(WlanacInfo[i].BeaconType.indexOf('OPEN') > -1)
                                                    {
                                                        Auth = "OPEN";
                                                        Encrypt = "NONE";
                                                        AuthSt = "未配置";
                                                    }
                                                    else 
                                                    {
                                                        Encrypt = WlanacInfo[i].WPAAuth;
                                                        Auth = WlanacInfo[i].WPAEncrypt;
                                                    }							
                                                    
                                                    if(Auth=="WPAPSKWPA2PSK")
                                                        Auth = "WPA-PSK/WPA2-PSK";
                                                    else if(Auth=="WPAPSK")
                                                        Auth = "WPA-PSK";							
                                                    else if(Auth=="WPA2PSK")
                                                        Auth = "WPA2-PSK";							
                                                
                                                    if(Encrypt == "TKIPAES" )
                                                        Encrypt = "TKIP+AES";

                                        <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                                    if((i == 0) || (EnableSSID[i - 1] == "1"))
                                        <% end if %>			
                                                        document.writeln('<tr>' + '<td class="table_title" align="center">' + 'SSID-' + (i+5) + '</td>' + '<td  align="center" style="max-width: 198px!important;">' + WlanacInfo[i].ssid + '</td><td align="center">' + AuthSt + '</td>' + '</td><td align="center">' + Auth.toUpperCase () + '</td>' + '<td' + ' align="center">' + Encrypt.toUpperCase() + '</td>' + '</tr>');
                                                }
                                            }
                                        </SCRIPT>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                    <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanDHCP">
                                            <TBODY>
                    <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") <> "Route" then %-->
                                                <TR>
                                                    <TD class=table_title colspan="4" align=middle>接入设备信息</TD>
                                                </TR>
                    <!--% end if %-->
                                                <TR>
                                                    <TD class=table_title align=middle>IP地址</TD>
                                                    <TD class=table_title align=middle>MAC地址</TD>
                    <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") = "Route" then %-->
                                                    <!--TD class=table_title align=middle>状态</TD-->
                                                    <TD class=table_title align=middle>设备名称</TD>
                    <!--% end if %-->
                                                    <TD class=table_title align=middle>SSID</TD>
                                                </TR>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var lanhost_value = '<% tcWebApi_JsonHook("get_lanhost_info", "action", "area") %>'                                                   
                                                    var rsp = JSON.parse(lanhost_value);
                                                    var lanhost_list = rsp.data;
            
                                                    for(var i = 0; i < lanhost_list.length; i++)
                                                    {
                                                        if(lanhost_list[i].conntype == '1' && lanhost_list[i].Port >= 9) {
                                                            var hostname = lanhost_list[i]['HostName'] ? lanhost_list[i]['HostName'] : "anonymous";
                                                            var ssid = "";
                                                            switch (lanhost_list[i]['Port']) {
                                                                case '9':
                                                                    ssid = '<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>';
                                                                    break;
                                                                case '10':
                                                                    ssid = '<% tcWebApi_get("WLan11ac_Entry1","SSID","s") %>';
                                                                    break;
                                                                case '11':
                                                                    ssid = '<% tcWebApi_get("WLan11ac_Entry2","SSID","s") %>';
                                                                    break;
                                                                case '12':
                                                                    ssid = '<% tcWebApi_get("WLan11ac_Entry3","SSID","s") %>';
                                                                    break;
                                                                default:
                                                                    break;
                                                            }

                                                            document.write('<TR align="center">');
                                                            document.write('<TD align="center">' + lanhost_list[i]['IP'] + '</TD>');
                                                            document.write('<TD align="center">' + lanhost_list[i]['MAC'] + '</TD>');
                                                            document.write('<TD align="center">' + hostname + '</TD>');
                                                            document.write('<TD align="center">' + ssid + '</TD>');
                                                            document.write('</TR>');
                                                        }
                                                    }
                                                </SCRIPT>
                                            </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                    <% end if %>
                                    </TBODY>
                                </TABLE>
                </div>
				<div class='hide' id="LAN接口信息_item">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">LAN接口信息</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
                            <TR style="display: none;">
                                <TD class="table-outer">
                                    <TABLE class="statblList" border="1" name="tabLanAdd">
                                    <TBODY>
                                        <TR> 
                                            <TD class=table_title width="20%">IP地址</TD>
                                            <TD><% if TCWebApi_get("Lan_Entry0", "IP", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP", "s") end if %></TD>
                                        </TR>
            <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") <>"Yes" then %> 
                                        <TR>
                                            <TD class=table_title>IPv6地址</TD>
                                            <TD> <% if TCWebApi_get("Lan_Entry0", "IP6", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP6", "s") end if %></TD>
                                        </TR>
            <% end if %>
                                        <TR>
                                            <TD class=table_title>MAC地址</TD>
                                            <TD><% if TCWebApi_Get("Info_Ether", "mac", "h") <> "N/A" then TCWebApi_Get("Info_Ether", "mac", "s") end if %> </TD>
                                        </TR>
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                                        <TR>
                                            <TD class=table_title>子网掩码</TD>
                                            <TD><% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %> </TD>
                                        </TR>
            <% if tcwebApi_get("Lan_Dhcp","type","h") <>"0" then %> 			
                                        <TR>
                                            <TD class=table_title>IP地址池</TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                var start = "<% tcWebApi_get("Dhcpd_Common","start","s") %>";
                                                var addrStart = start.split('.');
                                                var end_count = "<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>";
                                                var end = parseInt(end_count) + parseInt(addrStart[3]) - 1;
                                                document.write('<TD>' + start + '-' + addrStart[0] + '.' + addrStart[1] + '.' + addrStart[2] + '.' + end + '</TD>');
                                            </SCRIPT>
                                        </TR>
            <% end if %>							
            <% end if %>
                                    </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;display: none;"></TR>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanStat">
                                    <TBODY>
            <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                        <TR>
                                            <TD class=table_title width="24%"> LAN </TD>
                                            <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if(PortConnStatus[0] == "1"
                                                || PortConnStatus[1] == "1"
                                                || PortConnStatus[2] == "1"
                                                || PortConnStatus[3] == "1" )
                                                {
                                                    document.write("已连接");
                                                }
                                                else
                                                {
                                                    document.write("未连接");
                                                }
                                            </SCRIPT>
                                            
                                            </TD>
                                        </TR>
            <% else %>
                                        <TR>
                                            <TD class=table_title width="20%" align=middle></TD>
                                            <TD class=table_title align=middle> LAN-1 </TD>
            <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
                                            <TD class=table_title align=middle> LAN-2 </TD>
            <% end if %>

            <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
            <% if tcwebApi_get("Info_Ether","lanport2flag","h") <> "1" then %>
                                            <TD class=table_title align=middle> LAN-3 </TD>
            <% end if %>						
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                                            <TD class=table_title align=middle> LAN-4 </TD>
            <% end if %>								
            <% end if %>
                                        </TR>
                                        <TR>
                                            <TD class=table_title width="20%" align=middle>连接状态</TD>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if(PortConnStatus[0] == "1")
                                                    document.write("已连接");
                                                else
                                                    document.write("未连接");
                                            </SCRIPT>
                                            
                                            </TD>
            <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if(PortConnStatus[1] == "1")
                                                    document.write("已连接");
                                                else
                                                    document.write("未连接");
                                            </SCRIPT>
                                            
                                            </TD>
            <% end if %>
            <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
            <% if tcwebApi_get("Info_Ether","lanport2flag","h") <> "1" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if(PortConnStatus[2] == "1")
                                                    document.write("已连接");
                                                else
                                                    document.write("未连接");
                                            </SCRIPT>
                                            
                                            </TD>
            <% end if %>                 	
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if(PortConnStatus[3] == "1")
                                                    document.write("已连接");
                                                else
                                                    document.write("未连接");
                                            </SCRIPT>
                                            
                                            </TD>
            <% end if %>
            <% end if %>
                                        </TR>
                                        <TR>
                                            <TD class=table_title width="20%" align=middle>工作模式</TD>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortMode[0]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortMode[1]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% end if %>
            <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
            <% if tcwebApi_get("Info_Ether","lanport2flag","h") <> "1" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortMode[2]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% end if %>		                        
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortMode[3]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% end if %>
            <% end if %>
                                        </TR>
                                        <TR>
                                            <TD class=table_title width="20%" align=middle>速率</TD>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortRate[2]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortRate[1]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% end if %>
            <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
            <% if tcwebApi_get("Info_Ether","lanport2flag","h") <> "1" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortRate[0]);
                                            </SCRIPT> 
                                             
                                            </TD >
            <% end if %>		                        
            <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                                            <TD align=middle>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PortRate[3]);
                                            </SCRIPT> 
                                             
                                            </TD>
            <% end if %>
            <% end if %>
                                        </TR>
            <% end if %>
                                    </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanDHCP">
                                    <TBODY>
            <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") <> "Route" then %-->
                                        <TR>
                                            <TD class=table_title colspan="4" align=middle>接入设备信息</TD>
                                        </TR>
            <!--% end if %-->
                                        <TR>
                                            <TD class=table_title align=middle>IP地址</TD>
                                            <TD class=table_title align=middle>MAC地址</TD>
            <!--% if tcwebApi_get("WanInfo_Common","CurAPMode","h") = "Route" then %-->
                                            <!--TD class=table_title align=middle> 状态 </TD-->
                                            <TD class=table_title align=middle>设备名称</TD>
            <!--% end if %-->
                                            <TD class=table_title align=middle>LAN端口</TD>
                                        </TR>
                                        <SCRIPT language=JavaScript type=text/javascript>
                                            var lanhost_value = '<% tcWebApi_JsonHook("get_lanhost_info", "action", "area") %>'
                                            var rsp = JSON.parse(lanhost_value);
                                            var lanhost_list = rsp.data;
    
                                            for(var i = 0; i < lanhost_list.length; i++)
                                            {
                                                if(lanhost_list[i].conntype == '0') {
                                                    var hostname = lanhost_list[i]['HostName'] ? lanhost_list[i]['HostName'] : "anonymous";

                                                    document.write('<TR align="center">');
                                                    document.write('<TD align="center">' + lanhost_list[i]['IP'] + '</TD>');
                                                    document.write('<TD align="center">' + lanhost_list[i]['MAC'] + '</TD>');
                                                    document.write('<TD align="center">' + hostname + '</TD>');
                                                    document.write('<TD align="center">' + lanhost_list[i]['Port'] + '</TD>');
                                                    document.write('</TR>');
                                                }
                                            }
                                        </SCRIPT>
                                    </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                            <TR>
                                <TD class="table-outer">
                                    <TABLE class="tblList" border="1" name="tabLanCount">
                                    <TBODY>
                                        <TR>
                                        <TD class=table_title align=middle>接口</TD>
                                        <TD class=table_title align=middle colSpan=4><CENTER>接收 </CENTER></TD>
                                        <TD class=table_title align=middle colSpan=4><CENTER>发送 </CENTER></TD></TR>
                                        <TR>
                                        <TD class=table_title align=middle></TD>
                                        <TD class=table_title align=middle>字节</TD>
                                        <TD class=table_title align=middle>包</TD>
                                        <TD class=table_title align=middle>错误</TD>
                                        <TD class=table_title align=middle>丢弃</TD>
                                        <TD class=table_title align=middle>字节</TD>
                                        <TD class=table_title align=middle>包</TD>
                                        <TD class=table_title align=middle>错误</TD>
                                        <TD class=table_title align=middle>丢弃</TD>
                                        </TR>
            <SCRIPT language=javascript>
                document.writeln("<tr>");
                document.writeln("<td class='table_title'>Ethernet"+"</td>");

                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","outOctets","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","txFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","outErrors","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","outMulticastPkts","s") %>" + "</td>");
                
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","inOctets","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","rxFrames","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","rxCrcErr","s") %>" + "</td>");
                document.writeln("<td>" + "<% tcWebApi_get("Info_Ether","inMulticastPkts","s") %>" + "</td>");
                
                document.writeln("</tr>");
                if (curUserName != sptUserName)
                {
                    document.all("NetPacketInfo_WLan").style.display = "none";
                    document.all("NetPacketInfo_Ethe").style.display = "none";
                }
            </SCRIPT>
                                    </TBODY>
                                    </TABLE>
						        </TD>
                            </TR>           
				        </TBODY>
				    </TABLE>
				</div>
				<div class='hide' id="USB接口信息_item">
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR>
				        <TD width=10></TD>
				        <TD>
				          <TABLE class="statblList" border="1" name="tabUsbStat">
				          <TBODY>
				  			<TR>
				                <TD class=table_title width="20%">USB设备</TD>
				                <TD>
				                <!-- <SCRIPT language=JavaScript type=text/javascript>
									if (usbvalue.length > 0)
									{
										document.write('已连接')
									}
									else
									{
										document.write('未连接')
									}
								</SCRIPT> -->
				        		</TD>
				        	</TR>
				     	  </TBODY>
				     	  </TABLE>
				     	</TD>
				   </TR>
				</TBODY>
				</TABLE>
				</div>     
<% if tcwebApi_get("WebCustom_Entry","isCTSCSupported","h") = "Yes" then %>
<script language=JavaScript type=text/javascript>
function onuObj( active, devtype, limitnum )
{
	this.Active = active;
	this.DevType = 	devtype;
	this.LimitNum = ( 'N/A' == limitnum ) ? '0' : limitnum;
	this.ActiveCHS = ( 'Yes' == active ) ? '启用' : '禁用';
}

var onuList = new Array();
onuList.push( new onuObj(
							  '<% tcwebApi_get("Accesslimit_Entry0", "Active", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry0", "devtype", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry0", "limitnum", "s") %>'
						) );
onuList.push( new onuObj(
							  '<% tcwebApi_get("Accesslimit_Entry1", "Active", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry1", "devtype", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry1", "limitnum", "s") %>'
						) );
onuList.push( new onuObj(
							  '<% tcwebApi_get("Accesslimit_Entry2", "Active", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry2", "devtype", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry2", "limitnum", "s") %>'
						) );
onuList.push( new onuObj(
							  '<% tcwebApi_get("Accesslimit_Entry3", "Active", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry3", "devtype", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry3", "limitnum", "s") %>'
						) );
onuList.push( new onuObj(
							  '<% tcwebApi_get("Accesslimit_Entry4", "Active", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry4", "devtype", "s") %>'
							, '<% tcwebApi_get("Accesslimit_Entry4", "limitnum", "s") %>'
						) );
function get_onuObj_byType( devtype )
{
	var len = onuList.length;
	var idx = 0;
	
	for ( idx = 0; idx < len; idx ++ )
	{
		if ( devtype == onuList[idx].DevType )
			return onuList[idx];
	}

	return null;
}
function get_onuObj_ActiveCHS_byType( devtype )
{
	var onuobj = get_onuObj_byType( devtype )

	if ( onuobj )
		return onuobj.ActiveCHS;

	return '';
}
function get_onuObj_LiminiNum_byType( devtype )
{
	var onuobj = get_onuObj_byType( devtype )

	if ( onuobj )
		return onuobj.LimitNum;

	return '';
}
</script>
				<div class='hide' id="接入终端限制信息_item">
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD width=10></TD>
						<TD>
						<TABLE class="statblList" border="1">
						<TBODY>
							<TR>
								<TD width=10></TD>
								<TD colspan='2'><b>接入终端限制信息说明：</b>
								<br>
								业务模式禁用：表示不启用限制同时接入公网的终端数量的业务;<br>
								模式一：表示允许配置同时接入公网的最大数量模式；<br>
								模式二：表示仅对每一种终端类型进行单独的数量限制。<br>
								</TD>
							</TR>
							<TR>
								<TD width=10></TD>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD align=middle>
										<TABLE cellSpacing=0 cellPadding=3 width='100%' border=1>
										<TBODY>
											<TR>
												<TD class=table_title width='40%'>业务模式</TD>
												<TD width='64%' colspan='4'>
<% if tcWebApi_get("Accesslimit_Common", "mode", "h") = "1" then %>
													模式一
<% elseif tcWebApi_get("Accesslimit_Common", "mode", "h") = "2" then %>
													模式二
<% else %>
													业务模式禁用
<% end if %>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>同时接入公网的最大终端数目</TD>
												<TD colspan='4'>
<% if tcWebApi_get("Accesslimit_Common", "totalnum", "h") <> "N/A" then %>
<% tcWebApi_get("Accesslimit_Common", "totalnum", "s") else %>
													0
<% end if %>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>接入公网的STB终端数目限制</TD>
												<TD width='12%'>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_ActiveCHS_byType('STB') );
												</script>
												</TD>
												<TD class=table_title width='12%'>最大数目</TD>
												<TD width='12%'>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_LiminiNum_byType('STB') );
												</script>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>接入公网的Camera终端数目限制</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_ActiveCHS_byType('Camera') );
												</script>
												</TD>
												<TD class=table_title>最大数目</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_LiminiNum_byType('Camera') );
												</script>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>接入公网的Computer终端数目限制</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_ActiveCHS_byType('Computer') );
												</script>
												</TD>
												<TD class=table_title>最大数目</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_LiminiNum_byType('Computer') );
												</script>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>接入公网的Phone终端数目限制</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_ActiveCHS_byType('Phone') );
												</script>
												</TD>
												<TD class=table_title>最大数目</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_LiminiNum_byType('Phone') );
												</script>
												</TD>
											</TR>
											<TR>
												<TD class=table_title>接入公网的HGW终端数目限制</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_ActiveCHS_byType('HGW') );
												</script>
												</TD>
												<TD class=table_title>最大数目</TD>
												<TD>
												<script language=JavaScript type=text/javascript>
													document.write( get_onuObj_LiminiNum_byType('HGW') );
												</script>
												</TD>
											</TR>
										</TBODY>
										</TABLE>
										</TD>
									</TR>
								</TBODY>
								</TABLE>
								</TD>
								<TD width=10></TD>
							</TR>
							<TR>
								<TD width=10></TD>
								<TD></TD>
								<TD width=10></TD>
							</TR>
						</TBODY>
						</TABLE>
						</TD>
					</TR>
				</TBODY>
				</TABLE> 
				</div> 
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
				<div class='hide' id="WAN接口信息_item">
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
				<TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">WAN接口信息</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
		        <SCRIPT language=JavaScript type=text/javascript>
					var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue", "s") %>";
					var Wan_WanName = vArrayStr.split(',');
                    var NumStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_2", "s") %>";
                    var wanIndex = NumStr.split(',').indexOf('0');
    				vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_9", "s") %>";
					var Wan_ENCAP = vArrayStr.split(',');
					vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_11", "s") %>";
					var Wan_DNS4 = vArrayStr.split(',');
					vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_12", "s") %>";
					var Wan_SecDNS4 = vArrayStr.split(',');
				</SCRIPT> 
					<TR>
				        <TD width=10></TD>
				        <TD class="table-outer">
				          <TABLE class="statblList" border="1" name="tabUsbStat">
				          <TBODY>
				  			<TR>
				                <TD class=table_title width="20%">WAN接入类型</TD>
				                <TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
									if(Wan_ENCAP[wanIndex] == "DHCP")
										document.write("DHCP自动获取");
									else if(Wan_ENCAP[wanIndex] != "N/A")
										document.write(Wan_ENCAP[wanIndex]);
									else
										document.write("-");
								</SCRIPT> 
				                </TD>
				        	</TR>
							<TR>
				                <TD class=table_title width="20%">主机名称</TD>
				                <TD align=middle><% if TCWebApi_get("Info_Ether", "wanhostname", "h") <> "N/A" then TCWebApi_get("Info_Ether", "wanhostname", "s") end if %></TD>
				        	</TR>
							<TR>
				                <TD class=table_title width="20%">DNS模式</TD>
				                <TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
									if(Wan_ENCAP[wanIndex] == "Static")
										document.write("手动获取DNS");
									else
										document.write("自动获取DNS");
								</SCRIPT> 
								</TD>
				        	</TR>
							<TR>
				                <TD class=table_title width="20%">DNS1</TD>
				                <TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
			                        if(Wan_DNS4[wanIndex] != "N/A")
									 	document.write(Wan_DNS4[wanIndex]);
									else
									 	document.write("-");
								</SCRIPT> 
								</TD>
				        	</TR>
							<TR>
				                <TD class=table_title width="20%">DNS2</TD>
				                <TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
		                        	if(Wan_SecDNS4[wanIndex] != "N/A")
									 	document.write(Wan_SecDNS4[wanIndex]);
									else
									 	document.write("-");
								</SCRIPT> 
								</TD>
				        	</TR>
				        	</TBODY>
				     	  </TABLE>
				     	  </TD>
                           </TR>
                           <TR style="height: 48px;"></TR>
                           <TR>
                            <TD class="table-outer">
				          <TABLE class="statblList" border="1" name="tabUsbStat">
				          <TBODY>
				  			<TR>
				                <TD class=table_title width="20%">接口</TD>
				                <TD class=table_title width="20%">连接状态</TD>
				                <TD class=table_title width="20%">工作模式</TD>
				                <TD class=table_title width="20%">连接速率</TD>
				        	</TR>
							<TR>
				                <TD align=middle>WAN</TD>
				                <TD align=middle><% if TCWebApi_get("Info_Ether", "wansta", "h") <> "up" then asp_write("未连接") else asp_write("已连接") end if %></TD>
				              	<TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
									document.write(PortMode[3]);
								</SCRIPT> 
		                         
		                        </TD>
								<TD align=middle>
		                        <SCRIPT language=JavaScript type=text/javascript>
									document.write(PortRate[3]);
								</SCRIPT> 
		                         
		                        </TD>
				        	</TR>
				        	</TBODY>
				     	  </TABLE>
							</TD>
                            </TR>
                            <TR style="height: 48px;"></TR>
                            <TR>
                                <TD class="table-outer">
							<TABLE class="statblList" border="1" name="tabUsbStat">
							<TBODY>
							<TR>
								<TD class=table_title align=middle>接口</TD>
								<TD class=table_title align=middle colSpan=4><CENTER>接收 </CENTER></TD>
								<TD class=table_title align=middle colSpan=4><CENTER>发送 </CENTER></TD>
							</TR>
							<TR>
								<TD class=table_title align=middle></TD>
								<TD class=table_title align=middle>字节</TD>
								<TD class=table_title align=middle>包</TD>
								<TD class=table_title align=middle>错误</TD>
								<TD class=table_title align=middle>丢弃</TD>
								<TD class=table_title align=middle>字节</TD>
								<TD class=table_title align=middle>包</TD>
								<TD class=table_title align=middle>错误</TD>
								<TD class=table_title align=middle>丢弃</TD>
							</TR>
							<SCRIPT language=javascript>
								document.writeln("<tr>");
								document.writeln("<td class='table_title'>WAN"+"</td>");

								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","rxbytes","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","rxpackets","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","rxerrpkts","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","rxdroppkts","s") %>" + "</td>");
								
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","txbytes","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","txpackets","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","txerrpkts","s") %>" + "</td>");
								document.writeln("<td>" + "<% tcWebApi_get("Info_nas0.0","txdroppkts","s") %>" + "</td>");
								
								document.writeln("</tr>");
								if (curUserName != sptUserName)
								{
									document.all("NetPacketInfo_WLan").style.display = "none";
									document.all("NetPacketInfo_Ethe").style.display = "none";
								}
							</SCRIPT>
							</TBODY>
							</TABLE>
				     	</TD>
				   </TR>
				</TBODY>
				</TABLE>
				</div> 
<% end if %>
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
</HTML><%
tcWebApi_constSet("WebCurSet_Entry", "info_ether_read", "0")
tcWebApi_constSet("WebCurSet_Entry", "info_wlan_read", "0")
tcWebApi_constSet("WebCurSet_Entry", "info_wlan11ac_read", "0")
%>
