<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
	<TITLE>网络侧信息</TITLE>
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
<BODY class="text-center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
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
		<input id="Selected_Menu" type="hidden" value="状态->网络侧信息" name="Selected_Menu">
	</div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
<TBODY>
<TR>
<TD class="header">
	<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
	<TBODY>
	<TR><TD id=MenuArea_L1></TD></TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<TR>
<TD class="content">
<SCRIPT language=JavaScript type=text/javascript>
var userState = 1;
if ( curUserName == sptUserName )
{
	userState = 0;
}
var para = 0;
var CurAPMode = "<% tcWebApi_get("WanInfo_Common", "CurAPMode", "s") %>";
var pvc_counts=<% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>;
<% if tcwebApi_get("WebCustom_Entry", "isCTSFUC9Supported", "h") = "Yes" then %>		
pvc_counts = 1;
<% end if %>
/* get all value */
/* num 0 */
var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue", "s") %>";
var Wan_WanName = vArrayStr.split(',');
<% tcWebApi_constSet("WebCurSet_Entry", "waninfo_cycle_read", "1") %>
/* num 1 */
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_1", "s") %>";
var Wan_WanValue = vArrayStr.split(',');
/* num 2 */
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_2"," s") %>";
/* num 3 */
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_3", "s") %>";
var Wan_Actives = vArrayStr.split(',');
/* num 4 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_4", "s") %>";
var WANEnNAT = vArrayStr.split(',');
/* num 5 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_5", "s") %>";
/* num 6 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_6", "s") %>";
var Wan_IPVERSION = vArrayStr.split(',');
/* num 7 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_7", "s") %>";
var Wan_Status4 = vArrayStr.split(',');
/* num 8 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_8", "s") %>";
var Wan_IP4 = vArrayStr.split(',');
/* num 9 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_9", "s") %>";
var Wan_ENCAP = vArrayStr.split(',');
/* num 10 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_10", "s") %>";
var Wan_GateWay4 = vArrayStr.split(',');
/* num 11 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_11", "s") %>";
var Wan_DNS4 = vArrayStr.split(',');
/* num 12 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_12", "s") %>";
var Wan_SecDNS4 = vArrayStr.split(',');
/* num 13 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_13", "s") %>";
var Wan_Status6 = vArrayStr.split(',');
/* num 14 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_14", "s") %>";
var Wan_IP6 = vArrayStr.split(',');
/* num 15 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_15", "s") %>";
var Wan_GateWay6 = vArrayStr.split(',');
/* num 16 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_16", "s") %>";
var Wan_DNS6 = vArrayStr.split(',');
/* num 17 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_17", "s") %>";
var Wan_SecDNS6 = vArrayStr.split(',');
/* num 18 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_18", "s") %>";
var Wan_PD6 = vArrayStr.split(',');
/* num 19 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_19", "s") %>";
var Wan_NetMask4 = vArrayStr.split(',');
/* num 20 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_20", "s") %>";
/* num 21 */	
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_21", "s") %>";
/* num 22 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_22", "s") %>";
var Wan_Connection = vArrayStr.split(',');
/* num 23 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_23", "s") %>";
var Wan_VidPRI = vArrayStr.split(',');
/* num 24 */		
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_24", "s") %>";
var Wan_MAC = vArrayStr.split(',');
<% if tcWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
/* num 27 */
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_27", "s") %>";
var Wan_Dslite = vArrayStr.split(',');
<% end if %>
/* num 28 */
vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue_28", "s") %>";
var Wan_DHCPv6 = vArrayStr.split(',');
var LinkLocal = "<% tcWebApi_get("WanInfo_Entry0", "LinkLocalAddr", "s") %>";

<% tcWebApi_constSet("WebCurSet_Entry", "waninfo_cycle_read", "0") %>
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
<% if tcWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
Wan_Dslite = SortUtil.SortMyArray( Wan_Dslite );
<% end if %>
Wan_DHCPv6 = SortUtil.SortMyArray( Wan_DHCPv6 );

function transTemperature(temperature)
{
	var temp = Number(temperature);

	if ( temp >= Math.pow(2, 15) )
	{
		return -Math.round((Math.pow(2, 16)-temp)/256);
	}
	else
	{
		return Math.round(temp/256);
	}
}			

function PonInfoClass()
{				
	var SupplyVoltage = '<% tcWebApi_get("Info_PonPhy", "SupplyVoltage", "s") %>';
	var TxBiasCurrent = '<% tcWebApi_get("Info_PonPhy", "TxBiasCurrent", "s") %>';
	var Temperature = '<% tcWebApi_get("Info_PonPhy", "Temperature", "s") %>';
	var TxPower = '<% tcWebApi_get("Info_PonPhy", "TxPower", "s") %>';
	var RxPower = '<% tcWebApi_get("Info_PonPhy", "RxPower", "s") %>';

	this.LinkSta				= '<% tcWebApi_get("XPON_LinkCfg", "LinkSta", "s") %>';
	this.trafficstate			= '<% tcWebApi_get("XPON_Common", "trafficStatus", "s") %>';
	this.fecState				= '<% tcWebApi_get("Info_PonPhy", "FecStatus", "s") %>';
	this.ponType				= '<% tcWebApi_get("XPON_Common", "xponMode", "s") %>';
	this.loidStatus				= 'init';
	this.PonState 				= 'down';
	this.FECEnable 				= '-';
	this.WarnInfo 				= 'disconnect';
	this.PonSendPkt 			= '<% tcWebApi_get("Info_PonWanStats", "TxFrameCnt", "s") %>';
	this.PonRecvPkt 			= '<% tcWebApi_get("Info_PonWanStats", "RxFrameCnt", "s") %>';
	this.SendPower 				= '-';
	this.RecvPower 				= '-';
	this.WorkVoltage 			= '-';
	this.WorkElectric 			= '-';
	this.WorkTemperature		= '-';
	this.EncryptEnable			= '-';
	this.encryptState			= '<% tcWebApi_get("WebCurSet_Entry", "EPONEncryption", "s") %>';
	this.GemPortInfo			= '<% tcWebApi_get("GPON_GEMPort", "EncryptionStateALL", "s") %>';
	this.DispGemPortState = DispGemPortState;
	this.phyStatus				=	'<% tcWebApi_get("XPON_Common", "phyStatus", "s") %>';

	if ( ('GPON' != this.ponType) && ('EPON' != this.ponType) )
	{
		this.ponType = 'GPON';
	}

	if ( 'GPON' == this.ponType )
	{
		this.loidAuth			= '<% tcWebApi_get("GPON_LOIDAuth", "AuthStatus", "s") %>';
		this.loidV1				= '<% tcWebApi_get("GPON_LOIDAuth", "LOID", "s") %>';
	}
	else
	{
		this.loidAuth			= '<% tcWebApi_get("EPON_LOIDAuth", "AuthStatus", "s") %>';
		this.loidV1				= '<% tcWebApi_get("EPON_LOIDAuth", "LOID0", "s") %>';
	}

	if ( 'up' == this.trafficstate )
	{
		this.PonState			= 'up';
		this.WarnInfo			= 'no info';
		this.loidStatus			= 'up';
	}
	else
	{
		if ( ('0' != this.LinkSta) && ('2' == this.loidAuth) && (0 != this.loidV1.length) )
		{
			this.loidStatus		= 'error';
		}
	}

	if ( '0' != this.LinkSta )
	{
		<% if TxPower <> "N/A" then %>				
		this.SendPower			= (Math.round(Math.log((Number(TxPower))/10000)/(Math.log(10))*100)/10);
		<% else %>
		this.SendPower			= '-';
		<% end if %>				
		<% if RxPower <> "N/A" then %>				
		this.RecvPower			= (Math.round(Math.log((Number(RxPower))/10000)/(Math.log(10))*100)/10);
		<% else %>
		this.RecvPower			= '-';
		<% end if %>
		<% if SupplyVoltage <> "N/A" then %>				
		this.WorkVoltage 		= (Number(SupplyVoltage)/10);
		<% else %>
		this.WorkVoltage 		= '-';
		<% end if %>
		<% if TxBiasCurrent <> "N/A" then %>				
		this.WorkElectric 		= (Number(TxBiasCurrent)*2/1000);
		<% else %>
		this.WorkElectric		= '-';
		<% end if %>
		<% if Temperature <> "N/A" then %>				
		this.WorkTemperature 	= transTemperature(Temperature);
		<% else %>
		this.WorkTemperature	= '-';
		<% end if %>
		this.FECEnable			= ( '1' == this.fecState ) ? 'enabled' : 'disabled';

		if ( '2' == this.LinkSta )
		{
			this.EncryptEnable	= ( '1' == this.encryptState ) ? 'enabled' : 'disabled';
		}
	}

	function DispGemPortState()
	{
		var gemportList;
		var gemportInfo;
		var gemportState;
		var i = 0;

		if ( this.GemPortInfo.indexOf('#') >= 0 )
		{
			this.GemPortInfo = this.GemPortInfo.substring(0, this.GemPortInfo.length - 1);
		}
		else
		{
			document.write('关闭');
			return -1;
		}

		gemportList = this.GemPortInfo.split('#');
		for ( i = 0; i < gemportList.length; i++ )
		{
			gemportInfo = gemportList[i].split(':');
			if ( 2 != gemportInfo.length )
			{
				continue;
			}
			gemportState = 'GEMPORT' + gemportInfo[0] + ':' + ((1 == gemportInfo[1]) ? '开启' : '关闭') + '; ';
			document.write(gemportState);
		}
		return 0;
	}
}

var PonInfo = new PonInfoClass();
var EthernetState = '<% tcWebApi_get("WanInfo_Common","EthernetState","s") %>';
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
var ApCliStatus = '<% tcWebApi_get("APWanInfo_Entry0","Status","s") %>';
<% end if %>	

function ListCreate_info1(para)
{
	var index = 1;
	var ip6index = 0;
	var region = "<% tcWebApi_get("DeviceInfo_devParaStatic", "ZoneCode", "s") %>";
    var i = 0;
    if(Wan_WanName[i].indexOf('INTERNET') == -1) {
        i = 1;
    }
	if((para == 6) && ((CurAPMode == "Bridge") || (CurAPMode == "APClient")))
    {
        var fixipv6 = "<% tcWebApi_get("Lan_Entry0", "IP6LINKLOCAL", "s") %>";
        if(fixipv6.length == 0)
        fixipv6 = 'fe80::1';
        document.write('<tr align="middle">');
        if ( 'up' == Wan_Status4[0] )
        {
            document.write('<td>已连接&nbsp;</td>');
            document.write('<td>' + fixipv6 + '&nbsp;</td>');
            document.write('<td>' + fixipv6 + '&nbsp;</td>');
            document.write('<td>fe80::1&nbsp;</td>');
        }
        else
        {
            document.write('<td>未连接&nbsp;</td>');
            document.write('<td>-&nbsp;</td>');
            document.write('<td>-&nbsp;</td>');
            document.write('<td>-&nbsp;</td>');
        }
        return;
    }

	// for ( var i = 0; i < pvc_counts; i++ )
	// {
		if ( Wan_Actives[i] != "N/A" )
		{
			<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes" then
			if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1" then
			if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0" then %>
			if ( Wan_WanName[i].indexOf('TR069') >= 0 )
			<% end if
			end if
			end if %>
			{
				if ( para == 6 )
				{
					if ( (Wan_IPVERSION[i] == "IPv6") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
					{
						document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
						document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
						if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
							document.write('<td class="tdWidth3">br0</td>');
						else
							document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %> */
						ip6index = ip6index + 1;
						var isIPGWUp = 0;

						if ( (Wan_IP6[i] != "N/A") && (Wan_GateWay6[i] != "N/A") )
						{
							if ( (0 != Wan_IP6[i].length) && ('-' != Wan_IP6[i]) && (0 != Wan_GateWay6[i].length) && ('-' != Wan_GateWay6[i]) )
							{
								isIPGWUp = 1;
							}
						}

						if ( Wan_WanName[i].indexOf('_B_') >= 0 )
						{
							isIPGWUp = 1;								
						}
						<% if TCWebApi_get("Wan_Common", "TransMode", "h" ) = "Ethernet" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
						if ( EthernetState == "up" )
<% else %>
						if (( EthernetState == "up" ) || ( ApCliStatus == "up" ))
<% end if %>
						<% else %>
						if ( PonInfo.PonState == "up" )
						<% end if %>
						{
							if ( ('up' == Wan_Status6[i]) && (1 == isIPGWUp) )
							{
								document.write('<td class="tdWidth3">已连接</td>');
								document.write('<td class="tdWidth3">' + Wan_IP6[i] + '</td>');
								document.write('<td class="tdWidth3">' + LinkLocal + '</td>');
								document.write('<td class="tdWidth3">' + Wan_GateWay6[i] + '</td>');
							}
							<% if TCWebApi_get("WebCustom_Entry", "isPPPoEOnDemandSupported", "h" ) = "Yes" then %>
							else if ( (Wan_Actives[i] == "Yes") && (Wan_WanName[i].indexOf('_B_') >= 0 || ('PPPoE' != Wan_ENCAP[i]) || (('PPPoE' == Wan_ENCAP[i]) && (('Connect_Keep_Alive' == Wan_Connection[i]) || ('-' == Wan_Connection[i])))) )
							<% else %>
							else if ( Wan_Actives[i] == "Yes" )	
							<% end if %>
							{
								document.write('<td class="tdWidth3">连接中</td>');
								document.write('<td class="tdWidth3">-</td>');
								if(LinkLocal != "")
										document.write('<td class="tdWidth3">' + LinkLocal + '</td>');
								else
								document.write('<td class="tdWidth3">-</td>');
								document.write('<td class="tdWidth3">-</td>');
							}
							else
							{
								document.write('<td class="tdWidth3">未连接</td>');
								document.write('<td class="tdWidth3">-</td>');
								document.write('<td class="tdWidth3">-</td>');
								document.write('<td class="tdWidth3">-</td>');
							}
						}
						else
						{
							document.write('<td class="tdWidth3">未连接</td>');
							document.write('<td class="tdWidth3">-</td>');
							document.write('<td class="tdWidth3">-</td>');							
						}
						document.write('</tr>');
						index = index + 1;
					}
					else 
					{
						if ( Wan_IPVERSION[i] == "IPv4" )
						{
							index = index + 1;
						}
					}
				}
				else 
				{
					if ( para == 4 )
					{
						<% if TCWebApi_get("VoIPBasic_Common", "VoIPConfig", "h" ) = "OMCI" then %>
						if ( Wan_WanName[i].indexOf('VOICE') >= 0 )
						{
							continue;
						}
						<% end if %>
						if ( (Wan_IPVERSION[i] == "IPv4") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
						{
							document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
							if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
								document.write('<td class="tdWidth3">br0</td>');
							else
								document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %> */
							<% if TCWebApi_get("Wan_Common","TransMode","h" ) = "Ethernet" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							if ( EthernetState == "up" )
<% else %>
							if (( EthernetState == "up" ) || ( ApCliStatus == "up" ))
<% end if %>
							<% else %>
							if ( PonInfo.PonState == "up" )
							<% end if %>
							{
								if ( 'up' == Wan_Status4[i] )
								{
									document.write('<td class="tdWidth3">已连接</td>');
									document.write('<td class="tdWidth3">' + Wan_IP4[i] + '</td>');
									document.write('<td class="tdWidth3">' + Wan_NetMask4[i] + '</td>');
								}
								<% if TCWebApi_get("WebCustom_Entry", "isPPPoEOnDemandSupported", "h" ) = "Yes" then %>
								else if ( (Wan_Actives[i] == "Yes") && ((Wan_WanName[i].indexOf('_B_') >= 0) || ('PPPoE' != Wan_ENCAP[i]) || (('PPPoE' == Wan_ENCAP[i]) && (('Connect_Keep_Alive' == Wan_Connection[i]) || ('-' == Wan_Connection[i])))) )
								<% else %>
								else if ( Wan_Actives[i] == "Yes" )	
								<% end if %>
								{
									document.write('<td class="tdWidth3">连接中</td>');
									document.write('<td class="tdWidth3">-</td>');
									document.write('<td class="tdWidth3">-</td>');
								}
								else
								{
									document.write('<td class="tdWidth3">未连接</td>');
									document.write('<td class="tdWidth3">-</td>');
									document.write('<td class="tdWidth3">-</td>');
								}
							}
							else
							{
								document.write('<td class="tdWidth3">未连接</td>');
								document.write('<td class="tdWidth3">-</td>');
								document.write('<td class="tdWidth3">-</td>');
							}
							document.write('<td class="tdWidth3">' + Wan_MAC[i] + '</td>');
							document.write('</tr>');
							index = index + 1;
						}
						else 
						{
							if ( Wan_IPVERSION[i] == "IPv6" )
							{
								index = index + 1;
							}
						}
					}
				}
			}
		}
	// }

	if ( (0 == ip6index) && (6 == para) )
	{
		document.write('<tr class="trStyle3">');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
	}
}

function ListCreate_info2(para)
{
	var index = 1;
	var ip6index = 0;
	
	for ( var i = 0; i < pvc_counts; i++ )
	{
		if ( Wan_Actives[i] != "N/A" )
		{
			<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes" then
			if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1" then
			if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0" then %>
			if( Wan_WanName[i].indexOf('TR069') >= 0 )
			<% end if
			end if
			end if %>
			{
				if ( para == 6 )
				{
					if ( (Wan_IPVERSION[i] == "IPv6") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
					{
						document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
						document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
						if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
							document.write('<td class="tdWidth3">br0</td>');
						else
							document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %> */
						ip6index = ip6index + 1;
												
					/*	if ( 'Connect_Manually' == Wan_Connection[i] )
						{
							document.write('<td class="tdWidth3"> 手动 </td>');
						}
						else
						{
							document.write('<td class="tdWidth3"> 自动 </td>');
						}	*/					
						document.write('<td colspan="2" class="tdWidth3">' + Wan_DHCPv6[i] + '</td>');
						document.write('</tr>');
						index = index + 1;
					}
					else 
					{
						if ( Wan_IPVERSION[i] == "IPv4" )
						{
							index = index + 1;
						}
					}
				}
				else 
				{
					if ( para == 4 )
					{
						<% if TCWebApi_get("VoIPBasic_Common", "VoIPConfig", "h" ) = "OMCI" then %>
						if ( Wan_WanName[i].indexOf('VOICE') >= 0 )
						{
							continue;
						}
						<% end if %>
						if ( (Wan_IPVERSION[i] == "IPv4") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
						{
							document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
							if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
								document.write('<td class="tdWidth3">br0</td>');
							else
								document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %> 
							if ( 'Connect_Manually' == Wan_Connection[i] )
							{
								document.write('<td class="tdWidth3"> 手动 </td>');
							}
							else
							{
								document.write('<td class="tdWidth3"> 自动 </td>');
							} */
							if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
								document.write('<td class="tdWidth3">DHCP</td>');
							else
								document.write('<td class="tdWidth3">' + Wan_ENCAP[i] + '</td>');
							document.write('</tr>');
							index = index + 1;
						}
						else 
						{
							if ( Wan_IPVERSION[i] == "IPv6" )
							{
								index = index + 1;
							}
						}
					}
				}
			}
		}
	}

	if ( (0 == ip6index) && (6 == para) )
	{
		document.write('<tr class="trStyle3">');
		//document.write('<td class="tdWidth3">-</td>');
		document.write('<td colspan="2" class="tdWidth3">-</td>');
		document.write('<td colspan="2" class="tdWidth3">-</td>');
	}
}

function ListCreate_info2p(para)
{
	var ip6index = 0;
	
	for ( var i = 0; i < pvc_counts; i++ )
	{
		if( Wan_Actives[i] != 'N/A' )
		{
			<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes" then
			if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1" then
			if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0" then %>
			if ( Wan_WanName[i].indexOf('TR069') >= 0 )
			<% end if
			end if
			end if %>
			{
				if ( para == 6 )
				{
					if ( Wan_IPVERSION[i] == 'IPv4' )
					{
						continue;
					}
				}
				else if ( para == 4 )
				{
					if ( Wan_IPVERSION[i] == 'IPv6' )
					{
						continue;	
					}
					<% if TCWebApi_get("VoIPBasic_Common", "VoIPConfig", "h") = "OMCI" then %>
					if ( Wan_WanName[i].indexOf('VOICE') >= 0 )
					{
						continue;
					}
					<% end if %>
				}
				else
				{
					if ( (0 == ip6index) && (6 == para) )
					{
						document.write('<tr class="trStyle3">');
						document.write('<td class="tdWidth3">-</td>');
						document.write('<td class="tdWidth3">-</td>');
						document.write('<td class="tdWidth3">-</td>');
					}
					return;
				}
				document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
				document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
				if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
					document.write('<td class="tdWidth3">br0</td>');
				else
					document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %> */
				ip6index = ip6index + 1;
				//document.write('<td class="tdWidth3">' + Wan_VidPRI[i] + '</td>');
				document.write('<td class="tdWidth3">' + Wan_MAC[i] + '</td>');
				document.write('</tr>');
			}
		}
	}
	
	if ( (0 == ip6index) && (6 == para) )
	{
		document.write('<tr class="trStyle3">');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
	}
}

function ListCreate_info3(para)
{
	var index = 1;
	var ip6index = 0; 
	var i = 0;

	var region = "<% tcWebApi_get("DeviceInfo_devParaStatic", "ZoneCode", "s") %>";
	if(1/*(region == "JXI") || (region == "SHA") || (region == "ANH")*/)
	{
    if((para == 6) && ((CurAPMode == "Bridge") || (CurAPMode == "APClient")))
    {
        var fixipv6 = 'fe80::1';
        document.write('<tr align="middle">');

        if ( 'up' == Wan_Status4[0] )
        {
            document.write('<td>' + fixipv6 + '&nbsp;</td>');
            document.write('<td>' + fixipv6 + '&nbsp;</td>');
            document.write('<td>fe80::/64&nbsp;</td>');
        }
        else
        {
            document.write('<td>-&nbsp;</td>');
            document.write('<td>-&nbsp;</td>');
            document.write('<td>-&nbsp;</td>');
        }
        return;
    }
    }

	//for ( var i = 0; i < pvc_counts; i++ )
	{
		if ( Wan_Actives[i] != "N/A" )
		{
			<% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes" then
			if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1" then
			if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0" then %>
			if ( Wan_WanName[i].indexOf('TR069') >= 0 )
			<% end if
			end if
			end if %>
			{
				if ( para == 6 )
				{
					if ( (Wan_IPVERSION[i] == "IPv6") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
					{
						ip6index = ip6index + 1;
						document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
						document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
						if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
							document.write('<td class="tdWidth3">br0</td>');
						else
							document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %>	*/
						<% if TCWebApi_get("Wan_Common", "TransMode", "h") = "Ethernet" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
						if ( EthernetState == "up" )
<% else %>
						if (( EthernetState == "up" ) || ( ApCliStatus == "up" ))
<% end if %>
						<% else %>
						if ( PonInfo.PonState == "up" )
						<% end if %>
						{
							if ( 'up' == Wan_Status6[i] )
							{
								document.write('<td class="tdWidth3">' + Wan_DNS6[i] + '</td>');
								document.write('<td class="tdWidth3">' + Wan_SecDNS6[i] + '</td>');
								document.write('<td colspan="2" class="tdWidth3">' + Wan_PD6[i] + '</td>');
							/*	<% if tcWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
								document.write('<td class="tdWidth3">' + Wan_Dslite[i] + '</td>');
								<% end if %>	*/
							}
							else
							{
								document.write('<td class="tdWidth3">' + '-' + '</td>');
								document.write('<td class="tdWidth3">' + '-' + '</td>');
								document.write('<td colspan="2" class="tdWidth3">' + '-' + '</td>');
							/*	<% if tcWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
								document.write('<td class="tdWidth3">' + '-' + '</td>');
								<% end if %>  */
							}
						}
						else
						{
							document.write('<td class="tdWidth3">' + '-' + '</td>');
							document.write('<td class="tdWidth3">' + '-' + '</td>');
							document.write('<td colspan="2" class="tdWidth3">' + '-' + '</td>');
						/*	<% if tcWebApi_get("WebCustom_Entry", "isDSLiteSupported", "h") = "Yes" then %>
							document.write('<td class="tdWidth3">' + '-' + '</td>');
							<% end if %>  */
						}
						document.write('</tr>');
						index = index + 1;
					}
					else 
					{
						if ( Wan_IPVERSION[i] == "IPv4" )
						{
							index = index + 1;
						}
					}
				}
				else 
				{
					if ( para == 4 )
					{
						<% if TCWebApi_get("VoIPBasic_Common", "VoIPConfig", "h" ) = "OMCI" then %>
						if ( Wan_WanName[i].indexOf('VOICE') >= 0 )
						{
							continue;
						}
						<% end if %>
						if ( (Wan_IPVERSION[i] == "IPv4") || (Wan_IPVERSION[i] == "IPv4/IPv6") )
						{
							document.write('<tr class="trStyle3">');
/* <% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							document.write('<td class="tdWidth3">' + Wan_WanName[i] + '</td>');
<% else %>
							if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
								document.write('<td class="tdWidth3">br0</td>');
							else
								document.write('<td class="tdWidth3">nas0_0</td>');
<% end if %>	*/
							if((CurAPMode == "Bridge") || (CurAPMode == "APClient"))
								document.write('<td class="tdWidth3">DHCP</td>');
							else
								document.write('<td class="tdWidth3">' + Wan_ENCAP[i] + '</td>');
							<% if TCWebApi_get("Wan_Common", "TransMode", "h") = "Ethernet" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							if ( EthernetState == "up" )
<% else %>
							if (( EthernetState == "up" ) || ( ApCliStatus == "up" ))
<% end if %>
							<% else %>
							if ( PonInfo.PonState == "up" )
							<% end if %>
							{
								if ( 'up' == Wan_Status4[i] )
								{
									document.write('<td class="tdWidth3">' + Wan_GateWay4[i] + '</td>');
									document.write('<td class="tdWidth3">' + Wan_DNS4[i] + '</td>');
									document.write('<td class="tdWidth3">' + Wan_SecDNS4[i] + '</td>');
								}
								else
								{
									document.write('<td class="tdWidth3">' + '-' + '</td>');
									document.write('<td class="tdWidth3">' + '-' + '</td>');
									document.write('<td class="tdWidth3">' + '-' + '</td>');
								}
							}
							else
							{
								document.write('<td class="tdWidth3">' + '-' + '</td>');
								document.write('<td class="tdWidth3">' + '-' + '</td>');
								document.write('<td class="tdWidth3">' + '-' + '</td>');
							}
							document.write('</tr>');
							index = index + 1;
						}
						else 
						{
							if ( Wan_IPVERSION[i] == "IPv6" )
							{
								index = index + 1;
							}
						}
					}
				}
			}
		}
	}

	if ( (0 == ip6index) && (6 == para) )
	{
		document.write('<tr class="trStyle3">');
		//document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td class="tdWidth3">-</td>');
		document.write('<td colspan="2" class="tdWidth3">-</td>');
		//document.write('<td class="tdWidth3">-</td>');
	}
}

<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
var cfg_menu_list  = new Array( 'IPv4连接信息', 'IPv6连接信息', 'PON链路连接信息');
<% else %>
var cfg_menu_list  = new Array( '软件工作模式', '广域网络信息');
<% end if %>	

var cfg_cookie_name = 'sta-network-menu';
init_l_menu();
function HideIPV6()
{
    setDisplay("tabOptionv6",0);
}
</SCRIPT>
<TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD id="MenuArea_L2">
	<ul class="TRD">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
	<li name="IPv4ContInfo" id="IPv4连接信息">IPv4连接信息</li>
	<li name="IPv6ContInfo" id="IPv6连接信息">IPv6连接信息</li>
	<li name="PONContInfo" id="PON链路连接信息">PON链路连接信息</li>
<% else %>
	<li name="SwWorkMode" id="软件工作模式">软件工作模式</li>
	<li name="WanContInfo" id="广域网络信息">广域网络信息</li>
<% end if %>	
	</ul>
</TD>
<SCRIPT language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>
<TD valign="top">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
	<div class='hide' id="软件工作模式_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">软件工作模式</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TR>
                    <TD class="table-outer">
                        <TABLE name="tabAPMode" class="statblList" border="1">
                            <TBODY>
                                <TR>
                                    <TD class=table_title width="20%">软件工作模式</TD>
                                    <TD>
                                    <SCRIPT language=javascript>
                                            var fixedmode = '<% tcWebApi_get("APWanInfo_Common", "FixedAPMode", "s") %>';
                                            var curmode = '<% tcWebApi_get("WanInfo_Common", "CurAPMode", "s") %>';
                                            if ( curmode == "Bridge")
                                                document.write("桥接模式");
                                            else if(curmode == "APClient")
                                                document.write("无线中继模式");
                                            else if ( curmode == "Route" )
                                                document.write("路由模式");
                                            else if ( fixedmode == "Bridge")
                                                document.write("桥接模式");
                                            else if(fixedmode == "APClient")
                                                document.write("无线中继模式");
                                            else if ( fixedmode == "Route" )
                                                document.write("路由模式");
                                            else
                                                document.write("桥接模式");
                                    </SCRIPT> 
                                    </TD>
                                </TR>
                            </TBODY>
                        </TABLE>
                    </TD>
                </TR>
            </TBODY>
	    </TABLE>
	</div>
	<div class='hide' id="局域网络信息_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">局域网络信息</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="table-outer">
                        <TABLE name="tabAPMode" class="statblList" border="1">
                            <TBODY>
                                <TR> 
                                    <TD class=table_title width="20%">IP地址</TD>
                                    <TD><% if TCWebApi_get("Lan_Entry0", "IP", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP", "s") end if %></TD>
                                </TR>
                                <TR>
                                    <TD class=table_title>IPv6地址</TD>
                                    <TD> <% if TCWebApi_get("Lan_Entry0", "IP6", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP6", "s") end if %></TD>
                                </TR>
                                <TR>
                                    <TD class=table_title>MAC地址</TD>
                                    <TD><% if TCWebApi_Get("Info_Ether", "mac", "h") <> "N/A" then TCWebApi_Get("Info_Ether", "mac", "s") end if %> </TD>
                                </TR>
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
                            </TBODY>
                        </TABLE>
                    </div>
                    </TD>
                </TR>
            </TBODY>
	    </TABLE>
	</div>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
	<div class='hide' id="IPv4连接信息_item">
<% else %>
	<div class='hide' id="广域网络信息_item">
<% end if %>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">WAN IPv4广域网络信息</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TR>
                    <TD class="table-outer">
                        <TABLE name="tabAPMode" class="statblList" border="1">
                            <thead>
                                <tr class="trStyle2">
                                    <th class="tdWidth2">连接状态</th>
                                    <th class="tdWidth2">IP地址</th>
                                    <th class="tdWidth2">子网掩码</th>
                                    <th class="tdWidth2">MAC地址</th>
                                </tr>
                            </thead>
                            <tbody>
                                <SCRIPT language=JavaScript type=text/javascript>
                                    ListCreate_info1(4);
                                </SCRIPT>
                            </tbody>
                            <thead>
                                <tr class="trStyle2">
                                    <th class="tdWidth2">IP获取方式</th>
                                    <th class="tdWidth2">默认网关</th>
                                    <th class="tdWidth2">首选DNS</th>
                                    <th class="tdWidth2">备用DNS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <SCRIPT language=JavaScript type=text/javascript>
                                    ListCreate_info3(4);
                                </SCRIPT>
                            </tbody>
                        </TABLE>
                    </TD>
                </TR>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
            </TBODY>
        </TABLE>
	</div>
	<div class='hide' id="IPv6连接信息_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto 109px;margin-bottom: 65px;">
            <TBODY>
<% end if %>
                <TR>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 48px;">WAN IPv6广域网络信息</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TD class="table-outer">
                    <TABLE name="tabAPMode" class="statblList" border="1">
                        <thead>
                            <tr class="trStyle2">
                                <th class="tdWidth2">连接状态</th>
                                <th class="tdWidth2">IPv6地址</th>
                                <th class="tdWidth2">LinkLocal地址</th>
                                <th class="tdWidth2">IPv6默认网关</th>
                            </tr>
                        </thead>
                        <tbody>
                            <SCRIPT language=JavaScript type=text/javascript>
                                ListCreate_info1(6);
                            </SCRIPT>
                        </tbody>
                        <thead>
                            <tr class="trStyle2">
                                <th colspan="2" class="tdWidth2">前缀获取方式</th>
                                <th colspan="2" class="tdWidth2">IP获取方式</th>
                            </tr>
                        </thead>
                        <tbody>
                            <SCRIPT language=JavaScript type=text/javascript>
                                ListCreate_info2(6);
                            </SCRIPT>
                        </tbody>
                        <thead>
                            <tr class="trStyle2">
                                <th class="tdWidth2">IPv6首选DNS</th>
                                <th class="tdWidth2">IPv6备用DNS</th>
                                <th colspan="2" class="tdWidth2">前缀</th>
                            </tr>
                        </thead>
                        <tbody>
                            <SCRIPT language=JavaScript type=text/javascript>
                                ListCreate_info3(6);
                            </SCRIPT>
                        </tbody>
                    </TABLE>
                </TD>
            </TBODY>
        </TABLE>
    </div>
	<div class='hide' id="PON链路连接信息_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">链路连接信息</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TR>
                    <TD class="table-outer">
                        <DIV id=secPonInfo1>
                            <TABLE  class="statblList" border="1" name="tabPONStat">
                                <TBODY>
                                    <TR> 
                                        <TD class=table_title width="20%">PON链路连接状态</TD>
                                        <TD>
                                            <script language=JavaScript type=text/javascript>
                                                if ( PonInfo.PonState == "up" )
                                                {
                                                    document.write("在线");
                                                }
                                                else if ( PonInfo.PonState == "connecting" )
                                                {
                                                    document.write("连接中");
                                                }
                                                else
                                                {
                                                    document.write("离线");
                                                }
                                                </script>
                                        </TD>
                                    </TR>
                                    <% if tcwebApi_get("WebCustom_Entry", "isCTPONJSSupported", "h") = "Yes" then %>
                                    <TR>
                                        <TD class=table_title>EPON连接状态</TD>
                                        <TD>
                                            <script language=JavaScript type=text/javascript>
                                                if ( (PonInfo.phyStatus.indexOf("up") > -1) && (PonInfo.trafficstate == "up") )
                                                {
                                                    document.write("已注册,已认证");
                                                }
                                                else if ( (PonInfo.phyStatus.indexOf("up") > -1) && (PonInfo.trafficstate == "down") )
                                                {
                                                    document.write("已注册,未认证");
                                                }
                                                else
                                                {
                                                    document.write("未注册,未认证");
                                                }
                                                </script>
                                        </TD>
                                    </TR>
                                    <% end if %>
                                    <% if tcwebApi_get("WebCustom_Entry", "isCTPONNMGSupported", "h") = "Yes" then %>
                                    <TR>
                                        <TD class=table_title>
                                            <script language=JavaScript type=text/javascript>
                                                document.write(PonInfo.ponType + '状态');
                                                </script>
                                        </TD>
                                        <TD>
                                            <script language=JavaScript type=text/javascript>
                                                if ( PonInfo.loidStatus == 'up' )
                                                {
                                                    document.write("认证成功");
                                                }
                                                else if ( PonInfo.loidStatus == 'error' )
                                                {
                                                    document.write("LOID错误或不存在");
                                                }
                                                else
                                                {
                                                    document.write("初始状态");
                                                }
                                                </script>
                                        </TD>
                                    </TR>
                                    <% end if %>
                                    <TR>
                                        <TD class=table_title>FEC使能</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if ( '-' == PonInfo.FECEnable )
                                                {
                                                    document.write(PonInfo.FECEnable);
                                                }
                                                else
                                                {
                                                    if ( PonInfo.FECEnable == "disabled" )
                                                    {
                                                        document.write("去使能");
                                                    }
                                                    else
                                                    {
                                                        document.write("使能");
                                                    }
                                                }
                                                </SCRIPT>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>加密模式</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if ( '1' == PonInfo.LinkSta )
                                                {
                                                    PonInfo.DispGemPortState();
                                                }
                                                else
                                                {
                                                    if ( '-' == PonInfo.EncryptEnable )
                                                    {
                                                        document.write(PonInfo.EncryptEnable);
                                                    }
                                                    else
                                                    {
                                                        if ( PonInfo.EncryptEnable == "disabled" )
                                                        {
                                                            document.write("关闭");
                                                        }
                                                        else
                                                        {
                                                            document.write("开启");
                                                        }
                                                    }
                                                }
                                                </SCRIPT>
                                        </TD>
                                    </TR>
                                    <TR> 
                                        <TD class=table_title width="20%">告警信息</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                if ( PonInfo.WarnInfo == "disconnect" )
                                                {
                                                    document.write("连接中断");
                                                }
                                                else
                                                {
                                                    document.write("无告警");
                                                }
                                                </SCRIPT>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>PON口发包数</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.PonSendPkt);
                                                </SCRIPT>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>PON口收包数</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.PonRecvPkt);
                                                </SCRIPT>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>发送光功率</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.SendPower);
                                                </SCRIPT>dBm
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>接收光功率</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.RecvPower);
                                                </SCRIPT>dBm
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>工作电压</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.WorkVoltage);
                                                </SCRIPT>mV
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>工作电流</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                                document.write(PonInfo.WorkElectric);
                                                </SCRIPT>mA
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD class=table_title>工作温度</TD>
                                        <TD>
                                            <SCRIPT language=JavaScript type=text/javascript>
                                            document.write(PonInfo.WorkTemperature);
                                            </SCRIPT>℃
                                        </TD>
                                    </TR>
                                </TBODY>
                            <TBODY>
                            <TR><TD class='table_title' colspan='2' style="text-align: center;">链路连接信息</TD></TR>
                            <TR>
                            <TD class=table_title width="20%">PON链路连接状态</TD>
                            <TD > 
                            <script language=JavaScript type=text/javascript>
                            if ( PonInfo.PonState == "up" )
                            {
                                document.write("在线");
                            }
                            else if ( PonInfo.PonState == "connecting" )
                            {
                                document.write("连接中");
                            }
                            else
                            {
                                document.write("离线");
                            }
                            </script>
                            &nbsp;
                            </TD>
                            </TR>
                            <% if tcwebApi_get("WebCustom_Entry", "isCTPONJSSupported", "h") = "Yes" then %>
                            <TR>
                            <TD class=table_title>EPON连接状态</TD>
                            <TD > 
                            <script language=JavaScript type=text/javascript>
                            if ( (PonInfo.phyStatus.indexOf("up") > -1) && (PonInfo.trafficstate == "up") )
                            {
                                document.write("已注册,已认证");
                            }
                            else if ( (PonInfo.phyStatus.indexOf("up") > -1) && (PonInfo.trafficstate == "down") )
                            {
                                document.write("已注册,未认证");
                            }
                            else
                            {
                                document.write("未注册,未认证");
                            }
                            </script>
                            &nbsp;
                            </TD>
                            </TR>
                            <% end if %>
                            <% if tcwebApi_get("WebCustom_Entry", "isCTPONNMGSupported", "h") = "Yes" then %>
                            <TR>
                            <TD class=table_title>
                            <script language=JavaScript type=text/javascript>
                            document.write(PonInfo.ponType + '状态:');
                            </script>
                            </TD>
                            <TD > 
                            <script language=JavaScript type=text/javascript>
                            if ( PonInfo.loidStatus == 'up' )
                            {
                                document.write("认证成功");
                            }
                            else if ( PonInfo.loidStatus == 'error' )
                            {
                                document.write("LOID错误或不存在");
                            }
                            else
                            {
                                document.write("初始状态");
                            }
                            </script>
                            &nbsp;
                            </TD>
                            </TR>
                            <% end if %>
                            <TR>
                            <TD class=table_title>FEC使能</TD>
                            <TD>
                            <SCRIPT language=JavaScript type=text/javascript>
                            if ( '-' == PonInfo.FECEnable )
                            {
                                document.write(PonInfo.FECEnable);
                            }
                            else
                            {
                                if ( PonInfo.FECEnable == "disabled" )
                                {
                                    document.write("去使能");
                                }
                                else
                                {
                                    document.write("使能");
                                }
                            }
                            </SCRIPT>
                            &nbsp;
                            </TD>
                            </TR>
                            <TR>
                            <TD class=table_title>加密模式</TD>
                            <TD>
                            <SCRIPT language=JavaScript type=text/javascript>
                            if ( '1' == PonInfo.LinkSta )
                            {
                                PonInfo.DispGemPortState();
                            }
                            else
                            {
                                if ( '-' == PonInfo.EncryptEnable )
                                {
                                    document.write(PonInfo.EncryptEnable);
                                }
                                else
                                {
                                    if ( PonInfo.EncryptEnable == "disabled" )
                                    {
                                        document.write("关闭");
                                    }
                                    else
                                    {
                                        document.write("开启");
                                    }
                                }
                            }
                            </SCRIPT>
                            &nbsp;
                            </TD>
                            </TR>
                            <TR>
                            <TD class=table_title>告警信息</TD>
                            <TD>
                            <SCRIPT language=JavaScript type=text/javascript>
                            if ( PonInfo.WarnInfo == "disconnect" )
                            {
                                document.write("连接中断");
                            }
                            else
                            {
                                document.write("无告警");
                            }
                            </SCRIPT>
                            &nbsp;
                            </TD>
                            </TR>
                            </TBODY>
                            </TABLE>
                        </DIV>
                    </TD>
                </TR>
            </TBODY>
	    </TABLE>
    </div>
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
