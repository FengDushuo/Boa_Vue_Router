<%
if Request_Form("SSID_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","wlan_id", "wlSsidIdx")
	TCWebApi_set("Wlan_Common","recover_wlan_id", "wlSsidIdx")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>WLAN 2.4G配置</TITLE>
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
    <style>
        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
            .click.input_eye {
                top: -20px;
            }
        }
        #inpsw1 input,
        #inrapsw input {
            padding-right: 42px;
        }
    </style>
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
		<input id="Selected_Menu" type="hidden" value="网络->WLAN 2.4G配置" name="Selected_Menu"></TD>
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
	
function showDiv(){
	$("#mainContant").css("display","block");
}
var changeTimer1 = null,
    changeTimer2 = null;
var UserLevel = 1;
<% if tcWebApi_get("WebCustom_Entry", "isEasyMeshSupport", "h") = "Yes" then %>
function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegion = document.ConfigForm.hCountryRegion;
	var ctlCountryRegion0 = document.ConfigForm.CountryRegion0;
	var ctlCountryRegion1 = document.ConfigForm.CountryRegion1;
	var ctlCountryRegion2 = document.ConfigForm.CountryRegion2;
	var ctlCountryRegion3 = document.ConfigForm.CountryRegion3;
	var ctlCountryRegion4 = document.ConfigForm.CountryRegion4;
	var ctlCountryRegion5 = document.ConfigForm.CountryRegion5;
	if(vCountryName == "CANADA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "COLOMBIA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "DOMINICAN REPUBLIC")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "GUATEMALA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "MEXICO")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "NORWAY")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "PANAMA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "PUERTO RICO")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "UNITED STATES")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "TAIWAN")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "UZBEKISTAN")			             
		ctlCountryRegion.value = ctlCountryRegion0.value;		
	else
		ctlCountryRegion.value = ctlCountryRegion1.value;

	loadChannelList();
	document.ConfigForm.CountryChange.value = 1; 
}
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
	<% if tcWebApi_get("Info_WLan","wlanWPStimerRunning_0","h") <> "N/A" then %>
		var oldwpsTimerRunningData = "<% tcWebApi_get("Info_WLan","wlanWPStimerRunning_0","s") %>";
	<% else %>
		var oldwpsTimerRunningData = "";
	<% end if %>
<% end if %>

function doStartWPS()
{
	var pinLen = 8;
	var Form = new webSubmitForm();
	
	if ( addParameter(Form) == false )
	{
		return;
	}
/*	
	if ( getSelectVal("wpsmode") == 'ap-pin' )
	{
		var pinval = getElement('pinvalue');
		if ( isSafeStringIn(pinval.value,'0123456789') == false )
		{
			alert('PIN码应当是"0123456789"之间的整数');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		
		var pinValue = pinval.value;
		if ( pinValue.length != pinLen )
		{
			alert('请输入8位数字PIN码');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		
		if ( isvalidpin(pinValue) == false )
		{
			alert('请输入正确规则的PIN码:奇数位和的3倍加上偶数位的和是10的整数倍');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		
	}
*/	
	var temp = getSelectVal("wpsmode");
	if ( temp == 'ap-pin' )
	{
		setText('hWPSMode', 0);
	}
	else
	{
		setText('hWPSMode', 1);
	}	
	
	setText('hWpsStart', 1);
	
	if ( getValue('isInWPSing') == 0 )
	{
		alert("请在2分钟内启动WPS连接.");
	}
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
	top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
<% end if %>	
	SubmitForm(25);	
}

function stWlan(domain, enable, ssid, mode, channel, rate, power, wlHide, BeaconType, 
	Encryption, AuthMode, KeyIndex, EncryptionLevel, WPAModes, IEEE11iEModes, BWControl, 
	bssCoexistenceControl, GIControl, MCSValue, TxRxStream, WPAWPA2Modes, WPSMode, PINValue)
{
	this.domain = domain;
	this.enable = enable;
	
	if ( ssid == 'N/A' )
		this.ssid = '';
	else
		this.ssid = ssid;

	var WirelessMode = 'b,g';
	if ( mode == '0' )
		WirelessMode = 'b,g';
	else if ( mode == '1' )
		WirelessMode = 'b';
	else if ( mode == '4' )
		WirelessMode = 'g';
	else if ( mode == '6' )
		WirelessMode = 'n';
	else if ( mode == '7' )
		WirelessMode = 'g,n';
	else if ( mode == '9' )
		WirelessMode = 'b,g,n';		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>	
	else if (mode == '16')
		WirelessMode = 'g,n,ax';
<% end if %>
	else
		WirelessMode = 'b,g';	
	
	this.mode = WirelessMode;

	if ( channel == 'N/A' )
		this.channel = 'Auto';
	else
		this.channel = channel;

	if ( rate == 'N/A' )
		this.rate = 'Auto';
	else
		this.rate = rate;


	if ( power == 'N/A' )
		this.power = '1';
	else
		this.power = power;
	
	if ( wlHide == '1' )
		this.wlHide = '1';
	else
		this.wlHide = '0';

	var SecurMode = 'None';
	if ( BeaconType == 'WEP-64Bits' )
		SecurMode = 'Basic';
	else if ( BeaconType == 'WEP-128Bits' )
		SecurMode = 'Basic';
	else if ( BeaconType == 'WPAPSK' )
		SecurMode = 'WPA';
	else if ( BeaconType == 'WPA2PSK' )
		SecurMode = '11i';
	else if ( BeaconType == 'WPAPSKWPA2PSK' )
		SecurMode = 'WPAand11i';
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	else if (BeaconType == 'WPA3PSK')
		SecurMode = 'WPA3-PSK';
	else if (BeaconType == 'WPA2PSKWPA3PSK')
		SecurMode = 'WPA2-PSK/WPA3-PSK';
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
	else if (BeaconType == 'WPA3')
		SecurMode = 'WPA3';
	else if (BeaconType == 'WPA3-192Bit')
		SecurMode = 'WPA3-192Bit';
<% end if %>
<% end if %>
	else//'OPEN'
		SecurMode = 'None';
	
	this.BeaconType = SecurMode;
	this.Encryption = Encryption;
	if ( AuthMode == 'N/A' )
		this.AuthMode = 'Both';
	else
		this.AuthMode = AuthMode;
	
	if ( KeyIndex == 'N/A' )
		this.KeyIndex = '1';
	else
		this.KeyIndex = KeyIndex;
	
	if ( parseInt(EncryptionLevel.substr(4)) == '64' )
		this.EncypBit = '64';
	else if ( parseInt(EncryptionLevel.substr(4)) == '128' )
		this.EncypBit = '128';
	else
		this.EncypBit = '64';
	
	if ( (WPAModes == 'N/A') || (WPAModes == 'NONE') || (WPAModes == 'WEP') )
		this.WPAModes = 'TKIP';
	else
		this.WPAModes = WPAModes;
	
	if ( (IEEE11iEModes == 'N/A') || (IEEE11iEModes == 'NONE') || (IEEE11iEModes == 'WEP') )
		this.IEEE11iEModes = 'TKIP';
	else
		this.IEEE11iEModes = IEEE11iEModes;
	
	this.BWControl = BWControl;
	if ( bssCoexistenceControl == '1' && BWControl == '1' )
	{  
		this.BWControl = '2';
	}
	
	this.GIControl = GIControl;
	if ( MCSValue == 'N/A' )
		this.MCSValue = '33';//Auto
	else
		this.MCSValue = MCSValue;
	
	this.TxRxStream = TxRxStream;	
	if ( (WPAWPA2Modes == 'N/A') || (WPAWPA2Modes == 'NONE') || (WPAWPA2Modes == 'WEP') )
		this.WPAWPA2Modes = 'TKIP';
	else
		this.WPAWPA2Modes = WPAWPA2Modes;
	
	if ( WPSMode == '1' || WPSMode == 'N/A' )
		this.WPSMode = 'ap-pbc';
	else	
		this.WPSMode = 'ap-pin';
	
	if ( PINValue == 'N/A' )
		this.PINValue="";
	else
		this.PINValue = PINValue;
}

var srt_device = "<% tcWebApi_get("WLan_Common", "rt_device", "s") %>";
var str_trstream = "1";
if ( srt_device != "N/A" )
{
	if ( srt_device.substr(3) == "2" )
		str_trstream = "2";
}
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
var WLanSSID = new Array(<% tcWebApi_JsonHook("get_wlan_ssid_info", "", "") %>);
<% end if %>

var Wlan = new Array(new stWlan("domain", 
	"<% tcWebApi_get("WLan_Entry", "EnableSSID", "s") %>",
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %> 
	"SSID", 
<% else %>
	"<% tcWebApi_get("WLan_Entry", "SSID", "s") %>",
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then %>
	"<% tcWebApi_get("WLan_Entry", "WirelessMode", "s") %>", 
<% else %>
	"<% tcWebApi_get("WLan_Common", "WirelessMode", "s") %>", 
<% end if %>
	"<% tcWebApi_get("WLan_Common", "Channel", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "HT_RATE", "s") %>", 
	"<% tcWebApi_get("WLan_Common", "TxPowerLevel", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "HideSSID", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "AuthMode", "s") %>", 
	"WEPEncryption", 
	"<% tcWebApi_get("WLan_Entry", "WEPAuthType", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "DefaultKeyID", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "AuthMode", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "EncrypType", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "EncrypType", "s") %>", 
	"<% tcWebApi_get("WLan_Common", "HT_BW", "s") %>", 
	"<% tcWebApi_get("WLan_Common", "HT_BSSCoexistence", "s") %>", 
	"<% tcWebApi_get("WLan_Common", "HT_GI", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "HT_MCS", "s") %>", 
	str_trstream, 
	"<% tcWebApi_get("WLan_Entry", "EncrypType", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "WPSMode", "s") %>", 
	"<% tcWebApi_get("WLan_Entry", "enrolleePinCode", "s") %>"), 
	null);

var enbl = <% tcWebApi_get("WLan_Common","APOn","s") %>;
var acenbl = <% tcWebApi_get("WLan11ac_Common","APOn","s") %>;
var ssidIdx = 0;
var state = enbl;
var wlHide = Wlan[0].wlHide;
var band = 2;
var phy = 'g';
var wepEnable = getWepSwitch();
var wlCorerev = 8;
var ssidAccessAttr = 'Subscriber';
var beaconTypeAccessAttr = 'Subscriber';
var EnableAccessAttr = 'Subscriber';
<% if tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "h") <> "N/A" then %>
var BandSteeringEnableVal = <% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>;
<% else %>
var BandSteeringEnableVal = 0;
<% end if %>
<% if tcwebApi_get("WLan_Entry","FrontHaul","h") = "1" then %>
var bss_fh_support = '1';
<% else %>
var bss_fh_support = '0';
<% end if %>
<% if tcwebApi_get("WLan_Entry","BackHaul","h") = "1" then %>
var bss_bh_support = "1";
<% else %>
var bss_bh_support = '0';
<% end if %>
var wpsV2Support = '<% tcWebApi_get("WLan_Entry","WscV2Support", "s") %>';
function getWepSwitch()
{
	if ( Wlan[ssidIdx].Encryption == 'WEPEncryption' )
	{
		return 1;
	}
	else if ( Wlan[ssidIdx].Encryption == 'None' )
	{
		return 0;
	}
}

function hideOption(selObject, index)
{
	var oldOption = selObject.children(index);
	var oldStr = oldOption.innerText;
	var newOption = document.createElement('<div' + oldOption.outerHTML.match(/(<\w*)([^>]*)(>)/)[2] + '>');
	newOption.innerText  = oldStr;
	newOption.swapNode(oldOption);
}

function hideWlSecInfo(hidden)
{
	var status = 'visible';
	
	with ( document.forms[0] )
	{
		var i = 0;
		
		if ( hidden == 1 )
		{
			status = 'hidden';
			wlHide.disabled = 1;
			wlSsid.disabled = 1;
		}
		else
		{
			wlHide.disabled = 0;
			wlSsid.disabled = 0;
		}
	}
}

function wlSecCbClick(cb)
{
	if ( cb.checked == true )
	{
		hideWlSecInfo(0);
	}
	else
	{
		hideWlSecInfo(1);
	}
}

function getPreauth(wlPreauth) 
{
	var ret;
	
	if ( wlPreauth == "on" )
		ret = 1;
	else
		ret = 0;
	
	return ret;
}

function isValidWPAPskKey(val) 
{
	var ret = false;
	var len = val.length;
	var maxSize = 64;
	var minSize = 8;
	
	if ( len >= minSize && len < maxSize )
	{
		if ( val.match(/[^\x00-\xff]/g) )
		{
			ret = false;
		} 
		else 
		{
			for ( i = 0; i < len; i++ )
				if ( val.charAt(i) == ' ' || val.charAt(i) == '`')
				{
					break;
				}
			if ( i == len )
				ret = true;
		}
	} 
	else if ( len == maxSize ) 
	{
		for ( i = 0; i < maxSize; i++ )
			if ( isHexaDigit(val.charAt(i)) == false )
				break;
			if ( i == maxSize )
				ret = true;
	} 
	else
		ret = false;
	
	return ret;
}

function hideAllElements()
{
	setDisplay("wlWpaD", 0);
	setDisplay("wpaPreShareKey", 0);
	setDisplay("wpaGTKRekey", 0);
	setDisplay("wlRadius", 0);
	setDisplay("Preauth", 0);
	setDisplay("NetReauth", 0);
	setDisplay("wlWepD", 0);
	setDisplay("keyInfo", 0);
}

function encrypChange()
{
	with ( document.forms[0] )
	{
		var securmode = getSelectVal('wlSecurMode');
		
		switch ( securmode )
		{
			case 'None':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 None 时，传输数据不会被加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;其他用户可以随意接入您的无线网络。容易引起安全问题。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;若没有特殊需要，建议不使用。";
				break;
			}
			case 'Basic':
			{
				setDisplay("keyInfo", 1);
				wlKeys[0].disabled = 0;
				wlKeys[1].disabled = 0;
				wlKeys[2].disabled = 0;
				wlKeys[3].disabled = 0;
				wlKeyIndex.length = 0;
				wlKeyIndex[0] = new Option("1", "1");
				wlKeyIndex[1] = new Option("2", "2");
				wlKeyIndex[2] = new Option("3", "3");
				wlKeyIndex[3] = new Option("4", "4");
				setSelect('wlKeyIndex',Wlan[ssidIdx].KeyIndex) ;
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WEP 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为64bit或128bit。";
				break;
			}
			case 'WPA':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA-PSK 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。建议使用。";
				break;
			}
			case '11i':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA2 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
			case 'WPAand11i':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA/WPA2 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
			case 'WPA3-PSK':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA3-PSK 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
			case 'WPA2-PSK/WPA3-PSK':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA2/WPA3 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			case 'WPA3':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA3 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
			case 'WPA3-192Bit':
			{
				getElement("wlUserTip").innerHTML = "<font color=red>提示:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 WPA3-192Bit 时，传输数据经过加密。"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;密钥可由用户设置为8位到63位。需要操作系统支持。";
				break;
			}
<% end if %>
<% end if %>
			default:
				break;
		}
	}
}

function wlKeyBitChange()
{
	with ( document.forms[0] )
	{
		var wlKeyBitLen = getSelectVal('wlKeyBit');
		
		if ( wlKeyBitLen == 64 )
		{
			getElement("wlKeyBitTip").innerHTML = "请输入5位字符或10位16进制数";
		}
		else
		{
			getElement("wlKeyBitTip").innerHTML = "请输入13位字符或26位16进制数";
		}
	}
}

function authModeChange(OnPageLoad)
{
	with ( document.forms[0] )
	{
		var SecurMode = getSelectVal('wlSecurMode');
		var mode = getValue('wlgMode');
		var i, algos;
		
		hideAllElements();
		
		switch ( SecurMode )
		{
			case 'None':
				setDisplay("wlWepD", 0)
				setDisplay("keyInfo", 0);
			<%if tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "0" then %>
				setDisplay("wpsinfo", 1);
				wpsModeChange();
			<%end if %>
				break;
			case 'Basic':
			case 'shared':
				setDisplay("wlWepD", 1);
				setDisplay("keyInfo", 1);
			<%if tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "0" then %>
				setDisplay("wpsinfo", 1);
			<%end if %>
				break;
			case 'radius':
				setDisplay("wlRadius", 1);
				setDisplay("wlWepD", 1);
				break;
			case 'wpa2':
			case 'wpa2mix':
				setDisplay("Preauth", 1);
				setDisplay("NetReauth", 1);
			case 'wpa':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		case 'WPA3':
		case 'WPA3-192Bit':
<% end if %>
<% end if %>
				setDisplay("wlWpaD", 1);
				setDisplay("wlRadius", 1);
				break;
			case '11i':
			case 'psk2mix':
			case 'WPA':
			case 'WPAand11i':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		case 'WPA3-PSK':
		case 'WPA2-PSK/WPA3-PSK':
<% end if %>
				setDisplay("wlWpaD", 1);
				setDisplay("wpaPreShareKey", 1);
			<%if tcWebApi_get("WebCurSet_Entry","wlan_id", "h") = "0" then %>
				setDisplay("wpsinfo", 1);
				wpsModeChange();
			<%end if %>
				break;
		}
		
		if ( OnPageLoad == 1 )
		{
			if ( "n" == mode )
				algos = new Array(new Array('AES', 'AES'));
			else
				algos = new Array(new Array('TKIP', 'TKIP'), new Array('AES', 'AES'),new Array('TKIP+AES', 'TKIPAES')
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
								,new Array('GCMP256','GCMP256')
<% end if %>
<% end if %>
			);
			
			wlWpa.length = algos.length;
			for ( var i in algos )
			{
				wlWpa[i] = new Option(algos[i][0], algos[i][1]);
				wlWpa[i].value = algos[i][1];
				
				if ( Wlan[ssidIdx].BeaconType == 'WPA' && wlWpa[i][1] == Wlan[ssidIdx].WPAModes )
				{
					wlWpa[i].selected = true;
				}
				else if ( Wlan[ssidIdx].BeaconType == '11i' && wlWpa[i][1] ==  Wlan[ssidIdx].IEEE11iEModes )
				{
					wlWpa[i].selected = true;
				}
				else if ( Wlan[ssidIdx].BeaconType == 'WPAand11i' && wlWpa[i][1] ==  Wlan[ssidIdx].WPAWPA2Modes )
				{
					wlWpa[i].selected = true;
				}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3-PSK'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == 'WPA2-PSK/WPA3-PSK'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3' && wlWpa[i][1] == 'AES'){
					wlWpa[i].selected = true;
				}
<% end if %>
<% end if %>
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		for (var idx = 0; idx < wlWpa.length; idx++)
		{
				wlWpa[idx].disabled = false;
		}
<% end if %>		

		if (SecurMode == 'WPA')
		{
			<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>	
			|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			)
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].WPAModes);
		}
		else if ( SecurMode == '11i' )
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
					|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			)
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].IEEE11iEModes);
		}
		else if ( SecurMode == 'WPAand11i' )
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			 		|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			 )
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].WPAWPA2Modes);
		}
		else if ( SecurMode == 'Basic' )
		{
			wlWep.length = 0;
			wlWep[0] = new Option("open", "OpenSystem");
			wlWep[1] = new Option("share", "SharedKey");
			wlWep[2] = new Option("open+share", "Both");
			
			if ( OnPageLoad == 1 )
			{
				setSelect('wlWep', Wlan[ssidIdx].AuthMode);
			}
			else
			{
				setSelect('wlWep', "Both");
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3-PSK')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
		else if (SecurMode == 'WPA2-PSK/WPA3-PSK')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "AES");	
		}
		else if (SecurMode == 'WPA3-192Bit'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "GCMP256")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "GCMP256");	
		}
<% end if %>
<% end if %>
	}
	encrypChange();
}

function authModeChange2(OnPageLoad)
{
	with ( document.forms[0] )
	{
		var SecurMode = getSelectVal('wlSecurMode');
		var mode = getValue('wlgMode');
		var i, algos;
		
		hideAllElements();
		
		switch ( SecurMode )
		{
			case 'None':
                alert("你的网络将被设置为不加密的不安全状态，建议选择WPAPSK或WPA2PSK的加密方式！");
				setDisplay("wlWepD", 0)
				setDisplay("keyInfo", 0);
				setDisplay("wpsinfo", 1);
				wpsModeChange();
				break;
			case 'Basic':
			case 'shared':
				setDisplay("wlWepD", 1);
				setDisplay("keyInfo", 1);
				setDisplay("wpsinfo", 1);
				break;
			case 'radius':
				setDisplay("wlRadius", 1);
				setDisplay("wlWepD", 1);
				break;
			case 'wpa2':
			case 'wpa2mix':
				setDisplay("Preauth", 1);
				setDisplay("NetReauth", 1);
			case 'wpa':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		case 'WPA3':
		case 'WPA3-192Bit':
<% end if %>
<% end if %>
				setDisplay("wlWpaD", 1);
				setDisplay("wlRadius", 1);
				break;
			case '11i':
			case 'psk2mix':
			case 'WPA':
			case 'WPAand11i':
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		case 'WPA3-PSK':
		case 'WPA2-PSK/WPA3-PSK':
<% end if %>
				setDisplay("wlWpaD", 1);
				setDisplay("wpaPreShareKey", 1);
				setDisplay("wpsinfo", 1);
				wpsModeChange();
				break;
		}
		
		if ( OnPageLoad == 1 )
		{
			if ( "n" == mode )
				algos = new Array(new Array('AES', 'AES'));
			else
				algos = new Array(new Array('TKIP', 'TKIP'), new Array('AES', 'AES'),new Array('TKIP+AES', 'TKIPAES'));
			
			wlWpa.length = algos.length;
			for ( var i in algos )
			{
				wlWpa[i] = new Option(algos[i][0], algos[i][1]);
				wlWpa[i].value = algos[i][1];
				
				if ( Wlan[ssidIdx].BeaconType == 'WPA' && wlWpa[i][1] == Wlan[ssidIdx].WPAModes )
				{
					wlWpa[i].selected = true;
				}
				else if ( Wlan[ssidIdx].BeaconType == '11i' && wlWpa[i][1] ==  Wlan[ssidIdx].IEEE11iEModes )
				{
					wlWpa[i].selected = true;
				}
				else if ( Wlan[ssidIdx].BeaconType == 'WPAand11i' && wlWpa[i][1] ==  Wlan[ssidIdx].WPAWPA2Modes )
				{
					wlWpa[i].selected = true;
				}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3-PSK'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == 'WPA2-PSK/WPA3-PSK'
				&& wlWpa[i][1] == 'AES')
				{
					wlWpa[i].selected = true;
				}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
				else if (Wlan[ssidIdx].BeaconType == 'WPA3' && wlWpa[i][1] == 'AES'){
					wlWpa[i].selected = true;
				}
<% end if %>
<% end if %>
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		for (var idx = 0; idx < wlWpa.length; idx++)
		{
				wlWpa[idx].disabled = false;
		}
<% end if %>		

		if (SecurMode == 'WPA')
		{
			<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>	
			|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			)
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].WPAModes);
		}
		else if ( SecurMode == '11i' )
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
					|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			)
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].IEEE11iEModes);
		}
		else if ( SecurMode == 'WPAand11i' )
		{
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value == "GCMP256")
					wlWpa[idx].disabled = true;	
			}
<% end if %>
<% end if %>
			if ("n" == mode
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
			 		|| Wlan[ssidIdx].WPAModes == "GCMP256"
<% end if %>
<% end if %>
			 )
				setSelect('wlWpa', "AES");
			else
				setSelect('wlWpa', Wlan[ssidIdx].WPAWPA2Modes);
		}
		else if ( SecurMode == 'Basic' )
		{
			wlWep.length = 0;
			wlWep[0] = new Option("open", "OpenSystem");
			wlWep[1] = new Option("share", "SharedKey");
			wlWep[2] = new Option("open+share", "Both");
			
			if ( OnPageLoad == 1 )
			{
				setSelect('wlWep', Wlan[ssidIdx].AuthMode);
			}
			else
			{
				setSelect('wlWep', "Both");
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3-PSK')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
		else if (SecurMode == 'WPA2-PSK/WPA3-PSK')
		{
			for (var idx = 0; idx < wlWpa.length; idx++)
			{
				if(wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;
			}
			setSelect('wlWpa',"AES");
		}
<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "AES")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "AES");	
		}
		else if (SecurMode == 'WPA3-192Bit'){
			for (var idx = 0; idx < wlWpa.length; idx++) {
				if (wlWpa[idx].value != "GCMP256")
					wlWpa[idx].disabled = true;	
			}
			setSelect('wlWpa', "GCMP256");	
		}
<% end if %>
<% end if %>
	}
	encrypChange();
}

function doBroadcastSSIDChange()
{
	with ( document.forms[0] )
	{	
        <% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
            if(wlSsidIdx[0].selected == true && enableWps.checked == true && wlHide.checked == true)
			{
					alert("隐藏Wi-Fi，WPS使能将被关闭！");
					enableWps.checked = false;
                    enableWps.disabled = true;
					WpsActive.value = "0";	
			} 
            
            if(wlSsidIdx[0].selected == true && wlHide.checked == true)
			{
                    enableWps.disabled = true;	
			}
            else {
                enableWps.disabled = false;
            }
        <% end if %>
  }	
	return 1;
}

function wpapsk_window()
{
	var psk_window = window.open("", "", "toolbar=no,width=500,height=100");
	psk_window.document.write("The WPA Pre-Shared Key is " + wpaPskKey);
	psk_window.document.close();
}

function getGmodeIndex(mode)
{
	var ret = 0;
	
	switch ( mode )
	{
		case '0':
			ret = 3;
			break;
		case '4':
			ret = 1;
			break;
		case '5':
			ret = 2;
			break;
		default:
			ret = 0;
			break;
	}
	return ret;
}

function gModeChange()
{
	with ( document.forms[0] )
	{
		var mode = getValue('wlgMode');
		
		if ( (mode == 'b,g,n') || (mode == 'n') )
		{
			setDisplay('wlTransferRate', 0);
			if ( curUserName == sptUserName )
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',1);
<% end if %>
		
				setDisplay('11NbwControl', 1);
				setDisplay('11NbwControlExt', 1);
				setDisplay('11NgiControl', 1);
			}
			loadMCSList();
		}

<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (mode == 'g,n,ax') {
			setDisplay('wlTransferRate',0);
			if (curUserName == sptUserName)
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',1);
<% end if %>
				setDisplay('11NbwControlExt',1);
				setDisplay('11NgiControl',1);
			}
			loadMCSList();
		}
<% end if %>
		else
		{
			setDisplay('wlTransferRate', 1);
			if ( curUserName == sptUserName )
			{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
				setDisplay('11NmcsControl',0);
<% end if %>
				setDisplay('11NbwControl', 0);
				setDisplay('11NbwControlExt', 0);
				setDisplay('11NgiControl', 0);
			}
			loadRateList();
		}
		loadAuthModeList();
	}
}

function loadChannelList()
{
	var CountryRegion = <% tcWebApi_get("WLan_Common", "CountryRegion", "s") %>;
<% if tcWebApi_get("WebCustom_Entry", "isEasyMeshSupport", "h") = "Yes" then %>
	CountryRegion = document.ConfigForm.hCountryRegion.value;;
<% end if %>
	if ( band == "2" )
	{
		document.forms[0].wlChannel.length = 0;
		document.forms[0].wlChannel[0] = new Option("AUTO", "0");
		if ( CountryRegion == "0" )
		{
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
		}
		else  if ( CountryRegion == "2" )
		{
			document.forms[0].wlChannel[1] = new Option("10", "10");
			document.forms[0].wlChannel[2] = new Option("11", "11");		
		}
		else  if ( CountryRegion == "3" )
		{
			document.forms[0].wlChannel[1] = new Option("10", "10");
			document.forms[0].wlChannel[2] = new Option("11", "11");
			document.forms[0].wlChannel[3] = new Option("12", "12");
			document.forms[0].wlChannel[4] = new Option("13", "13");					
		}
		else  if ( CountryRegion == "4" )
		{
			document.forms[0].wlChannel[1] = new Option("4", "4");		
		}
		else  if ( CountryRegion == "5" )
		{
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
			document.forms[0].wlChannel[12] = new Option("12", "12");
			document.forms[0].wlChannel[13] = new Option("13", "13");
			document.forms[0].wlChannel[14] = new Option("14", "14");					
		}
		else  if ( CountryRegion == "6" )
		{
			document.forms[0].wlChannel[1] = new Option("3", "3");
			document.forms[0].wlChannel[2] = new Option("4", "4");
			document.forms[0].wlChannel[3] = new Option("5", "5");
			document.forms[0].wlChannel[4] = new Option("6", "6");
			document.forms[0].wlChannel[5] = new Option("7", "7");
			document.forms[0].wlChannel[6] = new Option("8", "8");
			document.forms[0].wlChannel[7] = new Option("9", "9");					
		}								
		else
		{
			document.forms[0].wlChannel[1] = new Option("1", "1");
			document.forms[0].wlChannel[2] = new Option("2", "2");
			document.forms[0].wlChannel[3] = new Option("3", "3");
			document.forms[0].wlChannel[4] = new Option("4", "4");
			document.forms[0].wlChannel[5] = new Option("5", "5");
			document.forms[0].wlChannel[6] = new Option("6", "6");
			document.forms[0].wlChannel[7] = new Option("7", "7");
			document.forms[0].wlChannel[8] = new Option("8", "8");
			document.forms[0].wlChannel[9] = new Option("9", "9");
			document.forms[0].wlChannel[10] = new Option("10", "10");
			document.forms[0].wlChannel[11] = new Option("11", "11");
			document.forms[0].wlChannel[12] = new Option("12", "12");
			document.forms[0].wlChannel[13] = new Option("13", "13");
		}
	}
	else  if ( band == "1" )
	{
		document.forms[0].wlChannel[0] = new Option("AUTO", "0");
	}
	else
	{
		document.forms[0].wlChannel[0] = new Option("AUTO", "0")
	}
	setSelect('wlChannel', Wlan[ssidIdx].channel);
}

function loadMCSList()
{
	if ("0" == getSelectVal('bwControl'))
	{
		setDisplay('11NbwControlExt', 0);
		setDisable("WLANExtensionChannel", 1);
	}
	else
	{
		setDisplay('11NbwControlExt', 1);
		WLANExtensionChannelChange();
	}

<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
	document.forms[0].wlMcs.options.length = 0;
	document.forms[0].wlMcs[0] = new Option("Auto", "33", false, Wlan[ssidIdx].MCSValue == "33");

		
	if (Wlan[0].TxRxStream == '1')
	{
		if ("0" == getSelectVal('bwControl'))
		{
			if ("0" == getSelectVal('giControl'))
			{
				document.forms[0].wlMcs[1] = new Option("6.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("13 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("19.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("26 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("39 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("52 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("58.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("65 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
			else if ( "1" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("7.2 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("14.4 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("21.7 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("28.9 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("43.3 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("57.8 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("65 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("72.2 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
		else
		{
			if ( "0" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("13.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("27 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("40.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("54 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("81 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("108 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("121.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("135 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
			else if ( "1" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("15 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.forms[0].wlMcs[2] = new Option("30 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.forms[0].wlMcs[3] = new Option("45 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.forms[0].wlMcs[4] = new Option("60 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.forms[0].wlMcs[5] = new Option("90 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.forms[0].wlMcs[6] = new Option("120 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.forms[0].wlMcs[7] = new Option("135 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.forms[0].wlMcs[8] = new Option("150 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
	}
	else if ( Wlan[0].TxRxStream == '2' )
	{
		if ( "0" == getSelectVal('bwControl') )
		{
			if ( "0" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("13 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("26 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("39 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("52 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("78 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("104 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("117 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("130 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
			else if ( "1" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("14.4 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("28.9 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("43.3 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("57.8 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("86.7 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("115.6 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("130.0 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("144.4 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
		else
		{
			if ( "0" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("27 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("54 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("81 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("108 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("162 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("216 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("243 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("270 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
			else if ( "1" == getSelectVal('giControl') )
			{
				document.forms[0].wlMcs[1] = new Option("30 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.forms[0].wlMcs[2] = new Option("60 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.forms[0].wlMcs[3] = new Option("90 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.forms[0].wlMcs[4] = new Option("120 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.forms[0].wlMcs[5] = new Option("180 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.forms[0].wlMcs[6] = new Option("240 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.forms[0].wlMcs[7] = new Option("270 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.forms[0].wlMcs[8] = new Option("300 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
	}
<% end if %>
}
function loadRateList() 
{
	document.forms[0].wlRate.options.length = 0;
	var mode = getValue('wlgMode');
	
	if ( band == "2" )
	{ 
		if ( mode == "b" )
		{ 
			document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.forms[0].wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.forms[0].wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.forms[0].wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.forms[0].wlRate[4] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
		}
		else
		{
			document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.forms[0].wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.forms[0].wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.forms[0].wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.forms[0].wlRate[4] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
			document.forms[0].wlRate[5] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
			document.forms[0].wlRate[6] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
			document.forms[0].wlRate[7] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
			document.forms[0].wlRate[8] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
			document.forms[0].wlRate[9] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
			document.forms[0].wlRate[10] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
			document.forms[0].wlRate[11] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
			document.forms[0].wlRate[12] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
		}
	}
	else if ( band == "1" )
	{ 
		document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
		document.forms[0].wlRate[1] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
		document.forms[0].wlRate[2] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
		document.forms[0].wlRate[3] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
		document.forms[0].wlRate[4] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
		document.forms[0].wlRate[5] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
		document.forms[0].wlRate[6] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
		document.forms[0].wlRate[7] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
		document.forms[0].wlRate[8] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
	}
	else
	{
		document.forms[0].wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
	}
}

function loadSsidIdxList() 
{
	var ssidNum;
	var multiFlag = "<% tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "s") %>";

	if ( multiFlag == "Yes" )
	{//KK note: ssidNum = 5
		ssidNum = <% tcWebApi_get("WLan_Common","BssidNum","s") %>;
	}
	else
	{
		ssidNum = '0';//only can edit and query 0 index of ssid
	}
	
<% if tcWebApi_get("WebCustom_Entry", "isShowNumOfSsid","h") = "Yes" then %>
	var ssidindex = 1;
	
	var ssid1 = "<% tcWebApi_get("WLan_Entry0","EnableSSID","s") %>";
	var ssid2 = "<% tcWebApi_get("WLan_Entry1","EnableSSID","s") %>";
	var ssid3 = "<% tcWebApi_get("WLan_Entry2","EnableSSID","s") %>";
	var ssid4 = "<% tcWebApi_get("WLan_Entry3","EnableSSID","s") %>";
	var ssid5 = "<% tcWebApi_get("WLan_Entry4","EnableSSID","s") %>";

	document.forms[0].wlSsidIdx.options.length = 0;
	document.forms[0].wlSsidIdx[0] = new Option("SSID1", "0");
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>

	if(ssidNum > "1" && sptUserName == curUserName)
	{
		if(ssid2 == "0" || ssid2 == "1")
		{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID2", "1");
			ssidindex++;
		}
		if(ssid3 == "0" || ssid3 == "1") 
		{
			if(ssidNum > "2")
			{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID3(访客网络)", "2");
			ssidindex++;
			}
		}
		// if(ssid4 == "0" || ssid4 == "1") 
		// {
		// 	if(ssidNum > "3")
		// 	{
		// 	document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID4", "3");
		// 	ssidindex++;
		// 	}
		// }
		if(ssid5 == "0" || ssid5 == "1") 
		{
			// if(ssidNum > "4")
			// {
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID4(WIFI5兼容)", "4");
			ssidindex++;
			// }
		}
	}
<% else %>
<% if tcwebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>

	if(ssidNum > "1" && sptUserName == curUserName)
	{
		if(ssid2 == "0" || ssid2 == "1")
		{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID2", "1");
			ssidindex++;
		}
		if(ssid3 == "0" || ssid3 == "1") 
		{
			if(ssidNum > "2")
			{
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID3(访客网络)", "2");
			ssidindex++;
			}
		}
		// if(ssid4 == "0" || ssid4 == "1") 
		// {
		// 	if(ssidNum > "3")
		// 	{
		// 	document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID4", "3");
		// 	ssidindex++;
		// 	}
		// }
		if(ssid5 == "0" || ssid5 == "1") 
		{
			// if(ssidNum > "4")
			// {
			document.forms[0].wlSsidIdx[ssidindex] = new Option("SSID4(WIFI5兼容)", "4");//Actually , this is entry4 , SSID5
			ssidindex++;
			// }
		}
	}

<% end if %>
<% end if %>	
	<% end if %>
	var curidx = "<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>";
	var curidx_cover = "<% tcWebApi_get("Wlan_Common","recover_wlan_id","s") %>";
	if(curidx_cover == "")
	{
		setSelect('wlSsidIdx', curidx);
	}
	else
	{
		setSelect('wlSsidIdx', curidx_cover);
		
		if(curidx != curidx_cover)
		{
			selChangedSSID();
		}
	}
}

function loadMCastRateList() 
{
	if ( band == "2" ) 
	{ 
		if ( phy == "b" ) 
		{
			document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
			document.forms[0].wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.forms[0].wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.forms[0].wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.forms[0].wlMCastRate[4] = new Option("11 Mbps", "11000000");
		}
		else 
		{
			document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
			document.forms[0].wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.forms[0].wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.forms[0].wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.forms[0].wlMCastRate[4] = new Option("6 Mbps", "6000000");
			document.forms[0].wlMCastRate[5] = new Option("9 Mbps", "9000000");
			document.forms[0].wlMCastRate[6] = new Option("11 Mbps", "11000000");
			document.forms[0].wlMCastRate[7] = new Option("12 Mbps", "12000000");
			document.forms[0].wlMCastRate[8] = new Option("18 Mbps", "18000000");
			document.forms[0].wlMCastRate[9] = new Option("24 Mbps", "24000000");
			document.forms[0].wlMCastRate[10] = new Option("36 Mbps", "36000000");
			document.forms[0].wlMCastRate[11] = new Option("48 Mbps", "48000000");
			document.forms[0].wlMCastRate[12] = new Option("54 Mbps", "54000000");
		}
	}
	else if ( band == "1" ) 
	{ 
		document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
		document.forms[0].wlMCastRate[1] = new Option("6 Mbps", "6000000");
		document.forms[0].wlMCastRate[2] = new Option("9 Mbps", "9000000");
		document.forms[0].wlMCastRate[3] = new Option("12 Mbps", "12000000");
		document.forms[0].wlMCastRate[4] = new Option("18 Mbps", "18000000");
		document.forms[0].wlMCastRate[5] = new Option("24 Mbps", "24000000");
		document.forms[0].wlMCastRate[6] = new Option("36 Mbps", "36000000");
		document.forms[0].wlMCastRate[7] = new Option("48 Mbps", "48000000");
		document.forms[0].wlMCastRate[8] = new Option("54 Mbps", "54000000");
	}
	else 
	{
		document.forms[0].wlMCastRate[0] = new Option("Auto", "Auto");
	}
}

function loadAuthModeList()
{
	var mode = getValue('wlgMode');
	document.forms[0].wlSecurMode.options.length = 0;

	if ( mode == "n" )
	{
		document.forms[0].wlSecurMode[0] = new Option("OPEN", "None", false, Wlan[ssidIdx].BeaconType=="None");
		document.forms[0].wlSecurMode[1] = new Option("WPA-PSK", "WPA", false, Wlan[ssidIdx].BeaconType=="WPA");
		document.forms[0].wlSecurMode[2] = new Option("WPA2-PSK", "11i", false, Wlan[ssidIdx].BeaconType=="11i");
		document.forms[0].wlSecurMode[3] = new Option("WPA-PSK/WPA2-PSK", "WPAand11i", false, Wlan[ssidIdx].BeaconType=="WPAand11i");
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		var idx = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3-PSK", "WPA3-PSK",false,Wlan[ssidIdx].BeaconType=="WPA3-PSK");
		document.forms[0].wlSecurMode[idx++] = new Option("WPA2-PSK/WPA3-PSK", "WPA2-PSK/WPA3-PSK",false,Wlan[ssidIdx].BeaconType=="WPA2-PSK/WPA3-PSK");
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		var idx21x = document.forms[0].wlSecurMode.options.length;
		// document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3", "WPA3",false,Wlan[ssidIdx].BeaconType=="WPA3");
		// document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3-192Bit", "WPA3-192Bit",false,Wlan[ssidIdx].BeaconType=="WPA3-192Bit");
<% end if %>
<% end if %>
	}
	else 
	{
		document.forms[0].wlSecurMode[0] = new Option("OPEN", "None", false, Wlan[ssidIdx].BeaconType=="None");
		document.forms[0].wlSecurMode[1] = new Option("WEP", "Basic", false, Wlan[ssidIdx].BeaconType=="Basic");
        document.forms[0].wlSecurMode[1].style.display = "none";
		document.forms[0].wlSecurMode[2] = new Option("WPA-PSK", "WPA", false, Wlan[ssidIdx].BeaconType=="WPA");
		document.forms[0].wlSecurMode[3] = new Option("WPA2-PSK", "11i", false, Wlan[ssidIdx].BeaconType=="11i");
		document.forms[0].wlSecurMode[4] = new Option("WPA-PSK/WPA2-PSK", "WPAand11i", false, Wlan[ssidIdx].BeaconType=="WPAand11i");
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		var idx = document.forms[0].wlSecurMode.options.length;
		document.forms[0].wlSecurMode[idx++] = new Option("WPA3-PSK", "WPA3-PSK",false,Wlan[ssidIdx].BeaconType=="WPA3-PSK");
		document.forms[0].wlSecurMode[idx++] = new Option("WPA2-PSK/WPA3-PSK", "WPA2-PSK/WPA3-PSK",false,Wlan[ssidIdx].BeaconType=="WPA2-PSK/WPA3-PSK");
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		var idx21x = document.forms[0].wlSecurMode.options.length;
		// document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3", "WPA3",false,Wlan[ssidIdx].BeaconType=="WPA3");
		// document.forms[0].wlSecurMode[idx21x++] = new Option("WPA3-192Bit", "WPA3-192Bit",false,Wlan[ssidIdx].BeaconType=="WPA3-192Bit");
<% end if %>
<% end if %>
<% if tcWebApi_get("Mesh_dat","MapEnable", "h") = "1" then	 %>
		$("option[value='Basic']").eq(0).prop("disabled", true);
		$("option[value='WPA']").eq(0).prop("disabled", true);
		$("option[value='WPAand11i']").eq(0).prop("disabled", true);
<% end if %>
	}
	authModeChange(1);
	doWPSUseChange();
}

function doWPSUseChange(){
	if(document.forms[0].enableWps.checked && getSelectVal('wlSecurMode') == "Basic")
	{
		alert("加密模式为WEP时，无法开启WPS功能！");
		document.forms[0].enableWps.checked = false;
		return;
	}
	if(wpsV2Support == 1)
	{
		if(document.forms[0].enableWps.checked)
		{
			if(getSelectVal('wlWpa') == "TKIP" &&	(getSelectVal('wlSecurMode') == "WPA" || getSelectVal('wlSecurMode') == "WPAand11i" || getSelectVal('wlSecurMode') == "11i"))
			{
				alert("WPA加密模式为TKIP时，无法开启WPS功能！");
				document.forms[0].enableWps.checked = false;
				return;
			}
	
			if(document.forms[0].wlHide.checked == true)
			{
				alert("广播取消时，无法开启WPS功能！");
				document.forms[0].enableWps.checked = false;
				return;
			}
		}
	}
	
	var temp = getSelectVal("wpsmode");
	if(document.forms[0].enableWps.checked)
	{
		setDisplay("wpsmodeTR", 1);
		if (temp == 'ap-pin')
		{
			setDisplay("pinval", 1);
			setDisplay("createPinval", 1);		
		}
		document.forms[0].WpsActive.value = "1";
	}
	else
	{
		if(getValue('isInWPSing')!=0 && getValue('isInWPSing')!= 'N/A')	//WPS is running
		{
			alert("当前WPS处于工作状态，无法关闭WPS功能！请按STOP WPS按钮后，再尝试关闭WPS功能。");
			document.forms[0].enableWps.checked = true;
			document.forms[0].WpsActive.value = "1";
			return;		
		}
		else
		{
			setDisplay("wpsmodeTR", 0);
			if (temp == 'ap-pin')
			{
				setDisplay("pinval", 0);
				setDisplay("createPinval", 0);		
			}
			document.forms[0].WpsActive.value = "0";
		}
	}
	return;
}

function wpsModeChange()
{
	with ( document.forms[0])
	{
		if ( enableWps.checked )
		{
			var temp = getSelectVal("wpsmode");
			if ( temp == 'ap-pin' )
			{
				setDisplay("pinval", 1);
				setDisplay("createPinval", 1);		
			}
			else
			{
				setDisplay("pinval", 0);
				setDisplay("createPinval", 0);
			}
		}
	}
}

function wpsContChange()
{
	with ( document.forms[0])
	{
		var temp = getCheckVal("wpsControl");
		if ( temp == 0 )
		{
			setDisable("wpsMode", 1);
			setDisable("pinValue", 1);
		}
		else
		{
			setDisable("wpsMode", 0);
			setDisable("pinValue", 0);
		}
	}
}

function isvalidpin(val)
{
	var ret = false;
	var len = val.length;
	var pinSize = 8;
	var pinvalue = new Array();
	
	if ( len !=  pinSize )
	{
		return false;
	}
	else
	{
		for ( i = 0; i < pinSize; i++ )
		{
			pinvalue[i] = parseInt(val.charAt(i),10);
		}
		
		var accum = 0;
		accum = (pinvalue[0] + pinvalue[2] + pinvalue[4] + pinvalue[6]) * 3 + pinvalue[1] + pinvalue[3] + pinvalue[5] + pinvalue[7];
		if ( 0 == (accum % 10) )
		{
			return true; 
		}
		else
		{
			return false; 
		}
	}
	return ret;
}

function getAfterBurnerIndex(afterburner)
{
	var ret;
	
	if ( afterburner == "auto" )
		ret = 1;
	else
		ret = 0;
	
	return ret;
}

function getTpcDbIndex(val) 
{
	var ret;
	
	if ( val == "0" )
		ret = 0;
	else if ( val == "2" )
		ret = 1;
	else if ( val == "3" )
		ret = 2;
	else if ( val == "4" )
		ret = 3;
	else 
		ret = 0;
	
	return ret;
}

function WLANExtensionChannelChange()
{
	var channel_sel = document.forms[0].wlChannel.selectedIndex;
	if ( channel_sel <= 4 )
	{
		document.forms[0].WLANExtensionChannel.selectedIndex = 1;
		document.forms[0].WLANExtensionChannel.disabled = true;
	}
	else if ( channel_sel >= 8 )
	{
		document.forms[0].WLANExtensionChannel.selectedIndex = 0;
		document.forms[0].WLANExtensionChannel.disabled = true;
	}
	else
		document.forms[0].WLANExtensionChannel.disabled = false;
}

function ChannelChange() 
{
	if ( "0" == getSelectVal('bwControl') )
	{
		setDisplay('11NbwControlExt', 0);
		setDisable("WLANExtensionChannel", 1);
	}
	else
	{
		setDisplay('11NbwControlExt', 1);
		WLANExtensionChannelChange();
	}
}

function getBandIndex(b) 
{
	var ret;
	
	if ( b == '1' )
		ret = 1;
	else
		ret = 0;
	
	return ret;
}

function wl_afterburner_options(OnPageLoad) 
{

}

function wl_recalc(OnPageLoad)
{
	with ( document.forms[0] )
	{
		wl_afterburner_options(OnPageLoad);
	}
}

function updateCurChannel() 
{

}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
var isMeshBssCfg = 0;

function easymesh_onload()
{
	var wl_authMode="", wl_encrypType = "";
	var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
	var bss_al_mac = "";
	var bss_fh_support = 0, bss_bh_support = 0;
	var node_idx = document.forms[0].wlSsidIdx.value;
	node_idx = parseInt(node_idx) + 1;
	isMeshBssCfg = 0;

	if(mapDevRole != 1 && mapDevRole != 2)
	{
		console.log("EasyMesh Device Role is neither Controller nor Agent！");
		return;
	}
	bss_al_mac = "<% tcWebApi_get("Mesh_radio2gbssinfo","AL-MAC","s") %>";
	
	switch(parseInt(node_idx))
	{
		case 1:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry0","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry0","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.1","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.1","EncrypType","s") %>";
			break;
		case 2:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry1","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry1","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.2","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.2","EncrypType","s") %>";
			break;
		case 3:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry2","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry2","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.3","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.3","EncrypType","s") %>";
			break;
		case 4:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry3","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry3","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.4","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.4","EncrypType","s") %>";
			break;
		case 5:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry4","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry4","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.5","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.5","EncrypType","s") %>";
			break;
		case 6:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry5","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry5","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.6","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.6","EncrypType","s") %>";
			break;
		case 7:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry6","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry6","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.7","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.7","EncrypType","s") %>";
			break;
		case 8:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry7","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry7","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.8","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.8","EncrypType","s") %>";
			break;
		case 9:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry8","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry8","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.9","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.9","EncrypType","s") %>";
			break;
		case 10:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry9","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry9","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.10","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.10","EncrypType","s") %>";
			break;
		case 11:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry10","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry10","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.11","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.11","EncrypType","s") %>";
			break;
		case 12:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry11","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry11","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.12","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.12","EncrypType","s") %>";
			break;
		case 13:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry12","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry12","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.13","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.13","EncrypType","s") %>";
			break;
		case 14:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry13","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry13","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.14","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.14","EncrypType","s") %>";
			break;
		case 15:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry14","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry14","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.15","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.15","EncrypType","s") %>";
			break;
		case 16:
			bss_fh_support = "<% tcWebApi_get("WLan_Entry15","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("WLan_Entry15","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.16","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.16","EncrypType","s") %>";
			break;
		default:
			bss_al_mac = "";
			bss_fh_support = 0;
			bss_bh_support = 0;
			wl_authMode = "";
			wl_encrypType = "";
			break;
	}

	al_mac = al_mac.toUpperCase();
	bss_al_mac = bss_al_mac.toUpperCase();
	if( (al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
		|| (bss_al_mac == null) || (bss_al_mac == "N/A") || (bss_al_mac == "") || (bss_al_mac == "00:00:00:00:00:00") )
	{
		return;
	}
	
	if( ((bss_al_mac == al_mac) || (bss_al_mac == "FF:FF:FF:FF:FF:FF"))
			&& ((1 == bss_fh_support) || (1 == bss_bh_support)) )
	{
		var wlSecurMode = document.forms[0].wlSecurMode;
		for (var idx=0; idx < wlSecurMode.length; idx++) 
		{
			var tmpSecurMode = wlSecurMode.options[idx].value;
			tmpSecurMode = tmpSecurMode.toUpperCase();
			if((tmpSecurMode == "NONE") || (tmpSecurMode == "11I"))
			{
				wlSecurMode.options[idx].disabled = false;
			}
			else
			{
				wlSecurMode.options[idx].disabled = true;
			}
		}

		var wlWpa = document.forms[0].wlWpa;
		for (var idx=0; idx < wlWpa.length; idx++) 
		{
			var tmpWpa = wlWpa.options[idx].value;
			tmpWpa = tmpWpa.toUpperCase();
			if((tmpWpa == "NONE") || (tmpWpa == "AES"))
			{
				wlWpa.options[idx].disabled = false;
			}
			else
			{
				wlWpa.options[idx].disabled = true;
			}
		}

		if((wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK"))
		{
			alert("When EasyMesh Enable, AutoMode must be \"OPEN\" or \"WPA2PSK\"！", function(ret){
				isMeshBssCfg = 1;
				return;	
			});
		}else{
			isMeshBssCfg = 1;
			return;	
		}
		
		if(wl_authMode.toUpperCase() != "OPEN")
		{
			if((wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
			{
				alert("When EasyMesh Enable, Encryption Type must be \"NONE\" or \"AES\"！", function(ret){
					isMeshBssCfg = 1;
					return;	
				});
			}else{
				isMeshBssCfg = 1;
				return;	
			}
		}else{
			isMeshBssCfg = 1;
			return;	
		}
	}else{

	return;	
	}
}
<% end if %>

<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
function getTimerRunningData()
{
	var wpsTimerRunningData = '';
	
	$.ajaxSetup({
		async : false,
		cache : false
	});
	
	$.getJSON("/cgi-bin/getWpsPara.asp", function(data, status){
		wpsTimerRunningData = data.wpsTimerRunningData;
  	});
	
	top.getWlanWpsTimerCount--;
	
	return wpsTimerRunningData;
}
function getWPStimerRunning()
{
	clearTimeout(getWPStimerRunning);
	{
		var wpsTimerRunningData = '';
		if(top.getWlanWpsTimerCount > 0)
		{
			wpsTimerRunningData = getTimerRunningData();
			document.ConfigForm.isInWPSing.value = wpsTimerRunningData;
			if(('N/A' == wpsTimerRunningData) || ('' == wpsTimerRunningData) || (oldwpsTimerRunningData == wpsTimerRunningData))
			{
				document.ConfigForm.btnStartWPS.disabled = "disabled";
				setTimeout(getWPStimerRunning, 1000);
			}
			else
			{
				top.getWlanWpsTimerCount = 0;
				switch(wpsTimerRunningData)
				{
					case "1":
                        getElById('wpsmodeTRBTN').innerText = 'Stop WPS';
						break;
					default:
                        getElById('wpsmodeTRBTN').innerText = 'Start WPS';
						break;
				}
				document.ConfigForm.btnStartWPS.disabled = "";
			}
		}
		else
		{
			switch(oldwpsTimerRunningData)
			{
				case "1":
                    getElById('wpsmodeTRBTN').innerText = 'Stop WPS';
					break;
				default:
                    getElById('wpsmodeTRBTN').innerText = 'Start WPS';
					break;
			}
			document.ConfigForm.btnStartWPS.disabled = "";
		}
	}
	
}
<% end if %>

function showWpsBtn() {
    <% if tcWebApi_get("WLan_Entry", "WPSConfMode","h") = "0" then %>
        document.ConfigForm.btnStartWPS.disabled = "disabled";
    <% end if %>
}
	
function doWlanSwitch()
{
	if ( acenbl || enbl )
	{
		setCheck('wlEnbl', 1);
		setCheck('wl2Enbl', enbl);
		wl2ClickEnble(getElById('wl2Enbl'));
	}
	else
	{
		setCheck('wlEnbl', 0);
		wlClickEnble(getElById('wlEnbl'));
	}
}


<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then	 %>
function isShowSsidType(){
<% if tcWebApi_get("Mesh_dat","MapEable","h") = "0" then %>
	document.getElementById('isSsidTypeSupport').style.display = 'none';
<% end if %>
	if(1 == bss_fh_support){
		document.ConfigForm.ssidType.value = '前向网络';
	}else if(1 == bss_bh_support){
		document.ConfigForm.ssidType.value = '回传网络';
	}else{
		document.getElementById('isSsidTypeSupport').style.display = 'none';
	}
}

function isDisabled(){
	var node_idx = document.forms[0].wlSsidIdx.value;
	var inputs = $("form[name='ConfigForm'] input");
	var selects = $("form[name='ConfigForm'] select");
	var i = 0;
	<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "1" then %>
		if(node_idx == 0 || node_idx == 3){	
<% if tcWebApi_get("Info_Mesh","NetComplete","h") = "1" then %>
<% if tcWebApi_get("Info_Mesh","DeviceRole","h") = "2" then %>
			for(i = 0; i < inputs.length; i++){
				inputs.eq(i).prop("disabled", true);
			}
			for(i = 0; i < selects.length; i++){
				selects.eq(i).prop("disabled", true);
			}
			$("#wlSsidIdx").prop("disabled", false);
			$("input[name='SSID_Flag']").prop("disabled", false);
<% end if %>
<% end if %>
			if($("option[value='WPA']").length != 0)
				$("option[value='WPA']").eq(0).css("display", "none");
			if($("option[value='WPAand11i']").length != 0)	
				$("option[value='WPAand11i']").eq(0).css("display", "none");
			if($("option[value='Basic']").length != 0)	
				$("option[value='Basic']").eq(0).css("display", "none");
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>		
			if($("option[value='WPA3-PSK']").length != 0)	
				$("option[value='WPA3-PSK']").eq(0).css("display", "none");
<% end if %>
		}
		

	<% end if %>
}
<% end if %>
function doBSShow()
{
	if(document.getElementById('isBandSteerSupport').style.display!="none" && document.forms[0].bandSteering.checked)
	{
		setDisplay("rssithreshold_24g", 1);
		setDisplay("rssithreshold_24g_dtl", 1);
		setDisplay("rssithreshold_5g", 1);
		setDisplay("rssithreshold_5g_dtl", 1);
	}
	else
	{
		setDisplay("rssithreshold_24g", 0);
		setDisplay("rssithreshold_24g_dtl", 0);
		setDisplay("rssithreshold_5g", 0);
		setDisplay("rssithreshold_5g_dtl", 0);
	}
}
function LoadFrame()
{

	with ( document.forms[0] )
	{
		<% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then %>
		<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>		
		if ( initFlag == true )
		{
			initWLanTxBeamFormingSel();
			initFlag = false;
		}
		<% end if %>
		<% end if %>
		setCheck('wlHide', Wlan[ssidIdx].wlHide);
		if ( phy == "g" )
		{
			if ( Wlan[ssidIdx].mode == "b/g" )
			{
				setSelect('wlgMode', "b,g");
			}
			else
			{
				setSelect('wlgMode', Wlan[ssidIdx].mode);
			}
		}
		setSelect('bwControl', Wlan[ssidIdx].BWControl);
		setSelect('giControl', Wlan[ssidIdx].GIControl);
		loadChannelList();
		loadSsidIdxList();
		gModeChange();
		document.getElementById('currentIdx').value = "SSID" + (parseInt(<% tcWebApi_get("WebCurSet_Entry", "wlan_id", "s") %>) + 1);
		setSelect('wlTxPwr', Wlan[ssidIdx].power);
		setCheck('wlHide', Wlan[ssidIdx].wlHide);
		setCheck('enableSsid', Wlan[ssidIdx].enable);
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then %>
		setCheck('bandSteering', BandSteeringEnableVal);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
		setText('wlSsid', WLanSSID[0]);
<% else %>
		setText('wlSsid', Wlan[0].ssid);
<% end if %>
		if(parseInt(<% tcWebApi_get("WebCurSet_Entry", "wlan_id", "s") %>) != 0)
			document.getElementById('isBandSteerSupport').style.display = 'none';
			
		// doBSShow();
		if ( document.forms[0].wlSsid.value == "" )
		{
			setText('wlSsid', "CMCC-");
		}		
		setSelect('wlSecurMode', Wlan[ssidIdx].BeaconType);
		setDisplay('wlInfo', enbl);
		setDisplay('authen', enbl);
		setSelect('wlKeyBit', Wlan[ssidIdx].EncypBit);//setSelect('wlKeyBit',parseInt(Wlan[ssidIdx].EncypBit)+24);		
		wlKeyBitChange();
		if ( ssidAccessAttr.indexOf('Subscriber') < 0 )
		{
			setDisable('wlSsid', 1);
		}
		if ( EnableAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('enableSsid', 1);
		}
		if ( beaconTypeAccessAttr.indexOf('Subscriber') < 0 )
		{
			setDisable('wlSecurMode', 1);
		}
	}
	setSelect("wpsmode", Wlan[ssidIdx].WPSMode);
	if ( getSelectVal("wpsmode") == 'ap-pin' )
	{
		setText("pinvalue", Wlan[ssidIdx].PINValue);
	}
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then	 %>	
	isDisabled();
	isShowSsidType();
<% end if %>
	authModeChange(1);
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
	<% if tcWebApi_get("Wlan_Common", "ChannelDisable", "h") = "1" Then %>
	document.forms[0].wlChannel.disabled = true;
	<% end if %>
<% end if %>
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
	getWPStimerRunning();
<% end if %>
    showWpsBtn();
<% if tcwebApi_get("WLan_Common","power_consumption_wifi","h") = "Yes" then %>
	document.getElementById('trSSID').style.display = 'none';
<% end if %>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	easymesh_onload();
<% end if %>
	doWlanSwitch();
    doWlanSecMode(enbl);

    var meshEbl = "<% tcWebApi_get("Mesh_dat", "MapEnable", "s") %>";
    var devRole = "<% tcWebApi_get("Info_Mesh","DeviceRole","s") %>";
    if(meshEbl == 1 && devRole == 2) {
        wlSsid.disabled = true;
        wlWpaPsk.disabled = true;
        wlSecurMode.disabled = true;
        wlWpa.disabled = true;
    }

	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function doWlanSecMode(enbl) {
    setDisplay('wlWpaD', enbl);
	setDisplay('wpaPreShareKey', enbl);
    var SecurMode = getSelectVal('wlSecurMode');
    if(enbl && SecurMode == "None") {
        setDisplay('wlWpaD', 0);
	    setDisplay('wpaPreShareKey', 0);
    } 
}

function addParameter(Form)
{
	var url = '';
	var temp = '';
	var pinLen = 8;
	Form.usingPrefix('y');
	var phymode = getValue('wlgMode');
	Form.addParameter('Standard',phymode);
	
	if ( phymode == 'b' || phymode == 'g' || phymode== 'b/g' ||phymode== 'b,g' )
	{
		Form.addParameter('MaxBitRate', getSelectVal('wlRate'));
	}
	else
	{
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
		Form.addParameter('X_ATP_11NHtMcs',getSelectVal('wlMcs'));
<% end if %>
		Form.addParameter('X_ATP_Wlan11NBWControl', getSelectVal('bwControl'));
		Form.addParameter('X_ATP_Wlan11NGIControl', getSelectVal('giControl'));
	}
	Form.addParameter('Enable', getCheckVal('enableSsid'));
	Form.addParameter('Channel', getSelectVal('wlChannel'));
	Form.addParameter('X_CT-COM_SSIDHide', getCheckVal('wlHide'));
	Form.addParameter('X_CT-COM_Powerlevel', getSelectVal('wlTxPwr'));
	var ssid = getValue('wlSsid');
	if ( ssid == '' )
	{
		alert('Wi-Fi名称不能为空！');
		setCheck('wlEnbl', 1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	if ( !checkSSID(ssid) )
	{
		alert("SSID长度不能超过28个字节，请重新输入！");
		setCheck('wlEnbl', 1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	var the_substring = ssid.substring(0, 11);
	// if ( the_substring != 'xiaoduwifi-' )
	// {
	//     alert('Wi-Fi名称应该是以"CU-"开头的字符串！');
	// 	return false;
    // }
// <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
// 	if(ssid.match(/[^\x00-\xff]/g))
// 	{
// 		var reg = /[\u4e00-\u9fa5]/g;
// 		var chinese_str = ssid.match(reg);
// 		var len = 2*chinese_str.length + (ssid.length - chinese_str.length);
// 		if( len > 20 )
// 		{
// 			alert("Wi-Fi名称不能超过20个字符或10个汉字，请重新输入！");
// 			setCheck('wlEnbl', 1);
// 			wlClickEnble(getElById('wlEnbl'));
// 			return false;
// 		}
// 	}
// <% end if %>
	// if ( <% tcWebApi_get("WebCurSet_Entry", "wlan_id", "s") %> == 0 )
	// {
	// 	if ( document.forms[0].isCUCSupport.value == 1 )
	// 	{
	// 		var preLen= document.forms[0].SSIDPre.value.length;
	// 		var the_substring = ssid.substring(0, preLen);
	// 		if ( the_substring != document.forms[0].SSIDPre.value )
	// 		{
	// 			alert('Wi-Fi名称应该是以"xiaoduwifi-"开头的字符串！');
	// 			setCheck('wlEnbl', 1);
	// 			wlClickEnble(getElById('wlEnbl'));
	// 			return false;
	// 		}
	// 	}
	// 	else
	// 	{
	// 		var the_substring = ssid.substring(0, 11);
	// 		if ( the_substring != 'CMCC-' )
	// 		{
	// 			alert('Wi-Fi名称应该是以"xiaoduwifi-"开头的字符串！');
	// 			setCheck('wlEnbl', 1);
	// 			wlClickEnble(getElById('wlEnbl'));
	// 			return false;
	// 		}
	// 	}
	// }
	
	var bssidnum = parseInt("<% tcWebApi_get("WLan_Common", "BssidNum", "s") %>");
	var curssidIdx = parseInt("<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>");
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
	var wlanssid = new Array("<% tcWebApi_get("WLan_Entry0", "SSID", "s") %>", 
							"<% tcWebApi_get("WLan_Entry1", "SSID", "s") %>", 
							"<% tcWebApi_get("WLan_Entry2", "SSID", "s") %>", 
							"<% tcWebApi_get("WLan_Entry3", "SSID", "s") %>");
<% end if %>

<% if tcwebApi_get("Mesh_common","CmccApMeshFlag","h") <> "1" then %>
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
	if ( curssidIdx == 1 && ssid != wlanssid[curssidIdx] )
<% else %>
	if ( curssidIdx != 0 && ssid != WLanSSID[curssidIdx] )
<% end if %>
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then	 %>	
	{
		alert("SSID"+(curssidIdx+1)+"不允许修改名称！");
		setText('wlSsid', wlanssid[curssidIdx]);
		return false;
	}
<% end if %>
<% end if %>

// 	for ( var index = 0; index < bssidnum; index++ )
// 	{
// 		if ( index == curssidIdx )
// 			continue;
// <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
// 		if ( ssid == WLanSSID[index] )
// <% else %>
// 		if ( ssid == wlanssid[index] )
// <% end if %>
// 		{
// 			alert("SSID" + (curssidIdx+1) + "不能与SSID" + (index+1) + "的名称相同！");
// 			setCheck('wlEnbl', 1);
// 			wlClickEnble(getElById('wlEnbl'));
// 			return false;
// 		}
// 	}
 <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
 	if (ssid.indexOf("`") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		setCheck('wlEnbl', 1);
 		wlClickEnble(getElById('wlEnbl'));
 		return false;
 	}
	if (ssid.indexOf(",") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		setCheck('wlEnbl', 1);
 		wlClickEnble(getElById('wlEnbl'));
 		return false;
 	}
	 if (ssid.indexOf(" ") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		setCheck('wlEnbl', 1);
 		wlClickEnble(getElById('wlEnbl'));
 		return false;
 	}
 <% end if %>
	if ( ssid.charAt(ssid.length - 1) == ' ' )
	{
		alert("SSID 不能以空字符结束。");
		setCheck('wlEnbl', 1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	<% If tcWebApi_get("WebCustom_Entry", "isMaxStaNumSupported", "h") = "Yes" Then %>
	var deviceNum = parseInt(getValue('wlAssociateNum'),10);
	if ( isInteger(deviceNum) )
	{
		if ( isPlusInteger(deviceNum) == false || parseInt(deviceNum) < 1 || !isInteger(getValue('wlAssociateNum')) )
		{
			//alert('连接设备数目范围从1到40。');
			alert('连接设备数目必须大于0！');
			setCheck('wlEnbl', 1);
			wlClickEnble(getElById('wlEnbl'));      
			return false;
		}}
	<% end if %>
	Form.addParameter('SSID', ssid);
	var AuthMode = getSelectVal('wlSecurMode');
	Form.addParameter('BeaconType', AuthMode);
	Form.endPrefix();
	if ( AuthMode == 'None' )
	{
		Form.addParameter('y.BasicEncryptionModes', 'None');
		Form.addParameter('y.BasicAuthenticationMode', 'OpenSystem');
		return true;
	}
	else if ( AuthMode == 'Basic' )
	{
		var wepauthtype = getSelectVal('wlWep');
		if ( (wepauthtype == 'OpenSystem') || (wepauthtype == 'SharedKey') || (wepauthtype == 'Both') )
		{
			var KeyBit = getSelectVal('wlKeyBit');
			var index = parseInt(getSelectVal('wlKeyIndex'));
			var wlKeys = getElById('wlKeys');
			var val = wlKeys[index-1].value;
			
			if ( val == '' )
			{
				alert('密匙的值不能为空！');
				setCheck('wlEnbl', 1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			
			var vKey = 0;
			for ( vKey = 0; vKey < 4; vKey++ )
			{
				val = wlKeys[vKey].value;
				if ( val != '' )
				{
					if ( KeyBit == '128' )
					{
						if ( isValidKey(val, 13) == false )
						{
							alert('密匙 "' + val + '" 无效，请输入 13位 ASCII字符或 26位16进制数作为一个 128-bit WEP 认证密匙。');
							setCheck('wlEnbl', 1);
							wlClickEnble(getElById('wlEnbl'));
							return false;
						}
					}
					else
					{
						if ( isValidKey(val, 5) == false )
						{
							alert('密匙 "' + val + '" 无效，请输入 5位ASCII字符或 10位16进制数作为一个 64-bit WEP 认证密匙。');
							setCheck('wlEnbl', 1);
							wlClickEnble(getElById('wlEnbl'));
							return false;
						}
					}
				}
			}
			Form.addParameter('y.WEPEncryptionLevel', (KeyBit-24)+'-bit');
			Form.addParameter('y.WEPKeyIndex', index);
			for ( l = 1; l <= 4; l++ )
			{
				Form.addParameter('k' + l +  '.InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.WEPKey.' + l + '.' + 'WEPKey', wlKeys[l-1].value);
			}
		}
		Form.addParameter('y.BasicEncryptionModes', 'WEPEncryption');
		Form.addParameter('y.BasicAuthenticationMode', wepauthtype);
		return true;
	}
	else if ( AuthMode == 'WPA' || AuthMode == '11i' || AuthMode == 'WPAand11i' 
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					 || AuthMode == 'WPA3-PSK' || AuthMode == 'WPA2-PSK/WPA3-PSK'
<% end if %>)
	{
		value = getValue('wlWpaPsk');
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
		var  valueold= parseInt("<% tcWebApi_get("WLan_Entry1", "WPAPSK", "s") %>");
		if ( curssidIdx == 1 && value != valueold )
<% else %>
		var  valueold= new Array("<% tcWebApi_get("WLan_Entry0", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan_Entry1", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan_Entry2", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan_Entry3", "WPAPSK", "s") %>");
		if ( curssidIdx != 0 && value != valueold[curssidIdx] )
<% end if %>
		{
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then	 %>			
			alert("SSID"+(curssidIdx+1)+"不允许修改共享密钥！");
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
			setText('wlWpaPsk', valueold);
<% else %>
			setText('wlWpaPsk', valueold[curssidIdx]);
<% end if %>
			return false;
<% end if %>
		}

		if ( isValidWPAPskKey(value) == false )
		{
			alert('WPA 预认证共享密钥应为8到63位ASCII字符或者64位16进制数，请重新输入！');
			setCheck('wlEnbl', 1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		Form.addParameter('y.X_ATP_WPSMode', getSelectVal('wpsmode'));
		if ( document.forms[0].enableWps.checked )
		{
		/*	if ( getSelectVal("wpsmode") == 'ap-pin' )
			{
				var pinval = getElement('pinvalue');
				if ( isSafeStringIn(pinval.value, '0123456789') == false )
				{
					alert('PIN码应当是"0123456789"之间的整数');
					setCheck('wlEnbl', 1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
				}
				
				var pinValue = pinval.value;
				if ( pinValue.length != pinLen )
				{
					alert('请输入8位数字PIN码');
					setCheck('wlEnbl', 1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
				}
				if ( isvalidpin(pinValue) == false )
				{
					alert('请输入正确规则的PIN码:奇数位和的3倍加上偶数位的和是10的整数倍');
					setCheck('wlEnbl', 1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
				}
				Form.addParameter('y.X_ATP_WPSPinValue', getValue('pinvalue'));
			}*/
		}
		Form.addParameter('k.PreSharedKey.1.PreSharedKey', value);
		if ( AuthMode == 'WPA' )
		{
			Form.addParameter('y.WPAEncryptionModes', getSelectVal('wlWpa'));
		}
		else  if ( AuthMode == '11i' )
		{
			Form.addParameter('y.IEEE11iEncryptionModes', getSelectVal('wlWpa'));
		}
		else  if ( AuthMode == 'WPAand11i' )
		{
			Form.addParameter('y.WPAWPA2EncryptionModes', getSelectVal('wlWpa'));
		}
	}
	return true;
}

<% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>
var initFlag = true;
function initWLanTxBeamFormingSel()			/*init TxBeamforming sel*/
{
	var ITxBfEn = "<% tcWebApi_get("WLan_Common", "ITxBfEn", "s") %>";
	var ETxBfEnCond = "<% tcWebApi_get("WLan_Common", "ETxBfEnCond", "s") %>";
	var ETxBfIncapable = "<% tcWebApi_get("WLan_Common", "ETxBfIncapable", "s") %>";
	
	if ( ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0" )		/*Both*/
	{
		document.ConfigForm.WLanTxBeamForming[0].selected = true;
	}
	else if ( ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0" )		/*Explicit*/
	{
		document.ConfigForm.WLanTxBeamForming[1].selected = true;
	}
	else if ( ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1" )		/*Implicit*/
	{
		document.ConfigForm.WLanTxBeamForming[2].selected = true;
	}
	else if ( ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1" )		/*Disable*/
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
	else
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
}

function doVHTTxBeamFormingChange()
{
	if ( document.ConfigForm.WLanTxBeamForming[0].selected == true )			/*Both*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if ( document.ConfigForm.WLanTxBeamForming[1].selected == true )		/*Explicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if ( document.ConfigForm.WLanTxBeamForming[2].selected == true )		/*Implicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else if ( document.ConfigForm.WLanTxBeamForming[3].selected == true )		/*Disable*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
}
<% end if %>	
<% end if %>

function SubmitForm(time)
{
	if ( enbl == 1 )
	{
		if ( (getValue('isInWPSing') != 0 && getValue('isInWPSing') != 'N/A') && getValue('hWpsStart') != 1 )
		{
			alert("当前WPS处于工作状态，无法保存设置！请按STOP WPS按钮后，再尝试保存设置。");
			return;
		}		
	}		
	var Form = new webSubmitForm();
	var enable = getCheckVal('wlEnbl');
	Form.addParameter('x.WLANConfiguration.1.X_CT-COM_APModuleEnable', enable);
	var wlandomain = 'InternetGatewayDevice.LANDevice.1.WLANConfiguration.' + (ssidIdx + 1);
	
	if ( state == 1 && enable == 1 )
	{
		if ( addParameter(Form) == false )
		{
			return;
		}

        <% if tcWebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then %>
            var WirelessMode = getSelectVal('wlgMode');
            var isWirelessMixed = "<% tcWebApi_get("WLan_Common","isWirelessMixed","s") %>";
            if (1 == isWirelessMixed && WirelessMode != 'b,g,n' 
        <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
            && WirelessMode != 'g,n,ax'
        <% end if %>
            )
            {
                alert("all entry wirelessmode will change to " + WirelessMode);
            }
            else if(0 == isWirelessMixed && (WirelessMode == 'b,g,n' 
        <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
            || WirelessMode == 'g,n,ax'
        <% end if %>
            )
            )
            {
                alert("all entry wirelessmode will change to " + WirelessMode);
            }		
        <% end if %>
		
		var SecurMode = getSelectVal('wlSecurMode');
		if ( SecurMode == 'None' )
		{
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1' + '&y=' + wlandomain + '&RequestFile=html/network/wlan.asp');
		}
		else if ( SecurMode == 'Basic' )
		{
			<% if tcWebApi_get("WebCurSet_Entry", "wlan_id", "h") = "0" then %>
			if ( document.forms[0].enableWps.checked )
			{
				alert("加密模式为WEP时，无法开启WPS功能！");
				return;
			}		
			<% end if %>	
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1' + '&y=' + wlandomain + '&k1=' + '&k2=' + '&k3=' + '&k4=' + '&RequestFile=html/network/wlan.asp');
		}
		else if ( SecurMode == 'WPA' || SecurMode == '11i' || SecurMode == 'WPAand11i' )
		{
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1' + '&y=' + wlandomain + '&k=' + wlandomain + '&RequestFile=html/network/wlan.asp');
		}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		if(isMeshBssCfg)
		{
			if((SecurMode != 'None') && (SecurMode != '11i'))
			{
				alert("EasyMesh开启时，加密模式必须为 \"None\" 或者 \"WPA2PSK\"！");
				return;
			}
			var sel_wlWpa = getSelectVal('wlWpa');
			if(SecurMode != 'None')
			{
				if((sel_wlWpa != "NONE") && (sel_wlWpa != "AES"))
				{
					alert("EasyMesh开启时, WPA加密模式必须为 \"None\" 或者 \"AES\"！");
					return;
				}
			}
		}
<% end if %>
	}
	else
	{
		Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1' + '&y=' + wlandomain + '&RequestFile=html/network/wlan.asp');
	}
	// setDisable('btnOK', 1);
	SetCtlValue();
	// if(checkRSSIThreshold(getValue('rssithreshold_1')) || checkRSSIThreshold(getValue('rssithreshold_2')))
	// {
	// 	return;
	// }
	// if ( checkBeacon(getValue('wls_beaint')) || checkDTIM(getValue('wls_dtim_int')) )
	// {
	// 	return;
	// }
	<% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then %>	
	<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>
	doVHTTxBeamFormingChange();
	<% end if %>	
	<% end if %>
	document.ConfigForm.recover_wlan_id.value = document.forms[0].wlSsidIdx.value;

	ajax_submit(time);
}

function ajax_submit(time) {
    var params=$('form').serialize(); //把form表单里的参数自动封装为参数传递
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";

    $.ajax({  
        type: "POST",   //提交的方法
        url: "/cgi-bin/asp_submit_wifi_2.asp" + query_string, //提交的地址  
        async: true,
        data: params,
        dataType: "text",
        success: function(data) {
            showLoading(time, "upgrade1");
        },
        error: function(error) {
            showLoading(3, "upgrade1", "配置失败，请重试……");
        }
    });
}

function wlClickEnble(wlEnbleCl)
{   
	if ( wlEnbleCl.checked == true )
	{
		if ( state == 1 )
		{
			// setDisplay('wlan_enbl', 1);
            // setDisplay('wlan_hide', 1);
			// setDisplay('wlInfo', 1);
			// setDisplay('authen', 1);
			// setDisplay('wlUserTip', 1);
			// setDisplay('trTxStream', 1);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			// setDisplay('wlMeshTip',1);
<% end if %>
			setCheck('wl2Enbl', 1);
            authModeChange(1);
		}
		setText('hwlEnbl', 1);
		setText('SaveWlEnb_Flag', 1);
	}
	else
	{
		// setDisplay('wlan_enbl', 0);
        // setDisplay('wlan_hide', 0);
		// setDisplay('wlInfo', 0);
		// setDisplay('authen', 0);
		// setDisplay('wlUserTip', 0);
		// setDisplay('trTxStream', 0);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		// setDisplay('wlMeshTip',0);
<% end if %>
		setCheck('wl2Enbl', 0);
		setText('hwlEnbl', 0);
		setText('SaveWlEnb_Flag', 1);
		// hideAllElements();
	}
}

function wl2ClickEnble(wl2EnbleCl)
{   
	if ( wl2EnbleCl.checked == true )
	{
		if ( state == 1 )
		{
            // setDisplay('wlan_hide', 1);
			// setDisplay('wlInfo', 1);
			// setDisplay('authen', 1);
			// setDisplay('wlUserTip', 1);
			// setDisplay('trTxStream', 1);
		}
		setText('hwlEnbl', 1);
		// authModeChange(1);
	}
	else
	{
        // setDisplay('wlan_hide', 0);
		// setDisplay('wlInfo', 0);
		// setDisplay('authen', 0);
		// setDisplay('wlUserTip', 0);
		// setDisplay('trTxStream', 0);
		setText('hwlEnbl', 0);
		// hideAllElements();
	}
}

function wlHideClickEnble() {
    if ( document.ConfigForm.wlHideEnbl.checked == true )
	{
        setText('WLANAPHide', 1);
	}
	else if ( document.ConfigForm.wlHideEnbl.checked == false )
	{
        setText('WLANAPHide', 0);
	}
}

function SetCtlValue()
{		
	with ( document.forms[0] )
	{	
		var enable = getCheckVal('enableSsid');
		if ( enable == 1 )
			setText('henableSsid', 1);
		else
			setText('henableSsid', 0);
		
		var hide = getCheckVal('wlHide');
		if ( hide == 1 )
			setText('hwlHide', 1);
		else
			setText('hwlHide', 0);		

		var temp = getSelectVal("wpsmode");
		if ( temp == 'ap-pin' )
		{
			setText('hWPSMode', 0);
		}
		else
		{
			setText('hWPSMode', 1);
		}
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then %>	
		var bandSteer = getCheckVal('bandSteering')
		if ( bandSteer == 1 )
		{
			var threshold_1 = parseInt(getValue('rssithreshold_1'));
			var threshold_2 = parseInt(getValue('rssithreshold_2'));
			setText('BandSteeringEnable', 1);
		}
		else
		{
			setText('BandSteeringEnable', 0);
		}
<% end if %>		
		setText('hwlKeys0', wlKeys[0].value);
		setText('hwlKeys1', wlKeys[1].value);
		setText('hwlKeys2', wlKeys[2].value);
		setText('hwlKeys3', wlKeys[3].value);

		var mode = '0';
		WirelessMode = getSelectVal('wlgMode');
		if ( WirelessMode == 'b,g' )
			mode = '0';
		else if ( WirelessMode == 'b' )
			mode = '1';
		else if ( WirelessMode == 'g' )
			mode = '4';
		else if ( WirelessMode == 'n' )
			mode = '6';
		else if ( WirelessMode == 'g,n' )
			mode = '7';
		else if ( WirelessMode == 'b,g,n' )
			mode = '9';		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		else if (WirelessMode == 'g,n,ax')
			mode = '16';
<% end if %>
		else
			mode = '0';	
		
		setText('hwlgMode', mode);		

		var BeaconType = 'OPEN';
		var SecurMode = getSelectVal('wlSecurMode');
		if ( SecurMode == 'Basic' )
		{
			var wlKeyBitLen = getSelectVal('wlKeyBit');
			if ( wlKeyBitLen == 128 )
				BeaconType = 'WEP-128Bits';
			else
				BeaconType = 'WEP-64Bits';
		}
		else if ( SecurMode == 'WPA' )
			BeaconType = 'WPAPSK';
		else if ( SecurMode == '11i' )
			BeaconType = 'WPA2PSK';
		else if ( SecurMode == 'WPAand11i' )
			BeaconType = 'WPAPSKWPA2PSK';
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		else if (SecurMode == 'WPA3-PSK')
			BeaconType = 'WPA3PSK';
		else if (SecurMode == 'WPA2-PSK/WPA3-PSK')
			BeaconType = 'WPA2PSKWPA3PSK';
<% if tcWebApi_get("Info_WLan", "isDot1XSupported", "h") = "Yes" then %>
		else if (SecurMode == 'WPA3')
			BeaconType = 'WPA3';
		else if (SecurMode == 'WPA3-192Bit')
			BeaconType = 'WPA3-192Bit';
<% end if %>
<% end if %>
		else//'None'
			BeaconType = 'OPEN';
		
		setText('hwlAuthMode', BeaconType);
        if(BeaconType == 'OPEN') {
            setText('auth_2', BeaconType);
        }
        else {
            setText('auth_2', 'WPAPSKWPA2PSK');
        }
        
		var temp = getSelectVal("bwControl");
		setText('ht_bw', temp);
		if ( temp == '2' )
		{
			setText('bwControlhidden', 1);
			setText('ht_bw', 1);
		}
		else
		{
			setText('bwControlhidden', 0);
		}
		var temp2 = getSelectVal("WLANExtensionChannel");
		setText('HT_EXTCHA', temp2);
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		var wlanMuOfdmaDl = getCheckVal('wlanMuOfdmaDlEnable');
		if(wlanMuOfdmaDl == 1)
		{
			setText('WlanMuOfdmaDlEnable_flag', 1);
			setText('WlanMuOfdmaUlEnable_flag', 1);
		}
		else
		{
			setText('WlanMuOfdmaDlEnable_flag', 0);
			setText('WlanMuOfdmaUlEnable_flag', 0);
		}
		var wlanMuMimoDl = getCheckVal('wlanMuMimoDlEnable');
		if(wlanMuMimoDl == 1)
		{
			setText('WlanMuMimoDlEnable_flag', 1);
			setText('WlanMuMimoUlEnable_flag', 1);
		}
		else
		{
			setText('WlanMuMimoDlEnable_flag', 0);
			setText('WlanMuMimoUlEnable_flag', 0);
		}
		var wlanSR = getCheckVal('wlanSREnable');
		if(wlanSR == 1)
		{
			setText('WlanSREnable_flag', 1);
		}
		else
		{
			setText('WlanSREnable_flag', 0);
		}
<% end if %>
		setText('Save_Flag', 1);
	}
}

function checkPWStrength(sValue) {
    var modes = 0;
    if (sValue.length < 1) return modes;
    if (sValue.length < 8) return 1;
    if (/\d/.test(sValue)) modes++;
    if (/[a-z]/.test(sValue)) modes++;
    if (/[A-Z]/.test(sValue)) modes++;
    if (/\W/.test(sValue)) modes++;

    return modes;
}

function doshowStrongChange(value) {
    changeTimer1 = setTimeout(function() {
        strength_label.style.display = "";
        var password_strength = checkPWStrength(value);
        switch (password_strength) {
            case 0:
                strength_label.style.display = "none";
                break;
            case 1:
                $("#strength_label span")[0].innerText = "弱";
                break;
            case 2:
                $("#strength_label span")[0].innerText = "中";
                break;
            case 3:
            case 4:
                $("#strength_label span")[0].innerText = "高";
                break;
        }
    }, 200);
}

function doshowStrongChange2(value) {
    changeTimer2 = setTimeout(function() {
        strength_label2.style.display = "";
        var password_strength = checkPWStrength(value);
        switch (password_strength) {
            case 0:
                strength_label2.style.display = "none";
                break;
            case 1:
                $("#strength_label2 span")[0].innerText = "弱";
                break;
            case 2:
                $("#strength_label2 span")[0].innerText = "中";
                break;
            case 3:
            case 4:
                $("#strength_label2 span")[0].innerText = "高";
                break;
        }
    }, 200);
}

function selChangedSSID()
{
	document.ConfigForm.SSID_Flag.value = "1";
//	document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}

function doGenerate()
{
	setText('hWPSMode', 0);
	document.ConfigForm.WpsGenerate.value = "1";
	//document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}

var page_ready = function __page_ready()
{
	// add page load code here
	iePlaceHolder();
};

function pageCommit()
{
	$('#Save_Flag').val(0);
	$('#wlanShareCommit').val(1);
	$("form[name='ConfigForm']").submit();


	return 0;	
}

function isNumeric(s)
{
	var len = s.length;
	var ch, i;
	if( len == 0 )
		return false;
	
	for ( i = 0; i < len; i++ )
	{
		ch = s.charAt(i);
		if(i == 0 && ch == '-')
			continue;
		if ( ch > '9' || ch < '0' )
		{
			return false;
		}
	}
	return true;
}
function checkRSSIThreshold(value)
{
	if ( !isNumeric(value) ) 
	{
		alert("Non-integer value given " + value);    
		return 1;
	}
	if (value < -100 || value > 0) 
	{
		alert("RSSIThreshold must be between -100 and 0");    
		return 1;  	
	}
	return 0;
}
function checkBeacon(value) 
{
	if ( !isNumeric(value) ) 
	{
		alert("Non-integer value given" + value);    
		return 1;
	}
	if ( value < 20 || value > 1000 ) 
	{
		alert("Beacon value must be between 20 and 1000");    
		return 1;  	
	}
	return 0;
}

function checkDTIM(value) 
{
	if ( !isNumeric(value) ) 
	{
		alert("Non-integer value given" + value);    
		return 1;
	}
	if ( value < 1 || value > 255 ) 
	{
		alert("DTIM value must be between 1 and 255");		
		return 1;
	}	
	return 0;
}
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
var cfg_menu_list  = new Array('WLAN24G基本配置', 'WLAN24G高级配置', 'WLAN共享配置');
<%else%>
var cfg_menu_list  = new Array('WLAN24G基本配置', 'WLAN24G高级配置');
<% end if %>
var cfg_cookie_name = 'net-wlan-menu';
init_l_menu();
</SCRIPT>
<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
<TBODY>
<TR>
<TD id="MenuArea_L2">
	<ul class="TRD">
	<li name="WLANBasicCnf" id="WLAN24G基本配置">2.4G 基本配置</li>
    <% if tcWebApi_get("WLan_Common", "APOn","h") <> "0" then %>
        <li name="WLANAdvanceCnf" id="WLAN24G高级配置">2.4G 高级配置</li>
    <% end if %>
	<% if tcwebApi_get("WebCurSet_Entry", "CurrentAccess", "h") = "0" then %>
	<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
	<li name="WLANShardCnf" id="WLAN共享配置">WLAN共享配置</li>
	<% end if %>
	<% end if %>
	</ul>
</TD>
<SCRIPT language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>
<TD class='top'>
	
	<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 style="display:none" id="mainContant">
	<TBODY>
	<TR>
	<TD width=7 background=/img/panel3.gif></TD>
	<TD vAlign=top>
		<FORM name=ConfigForm action="/cgi-bin/net-wlan.asp" method="post">
		<DIV id='WLAN24G基本配置_item' class='hide forShowClass' style="display:none">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                <TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">2.4G 基本配置</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
                <TR>
                <TD>
    <% if tcWebApi_get("WebCustom_Entry", "isEasyMeshSupport", "h") = "Yes" then %>
            <INPUT TYPE="HIDDEN" ID="hCountryRegion" NAME="hCountryRegion" value="<% tcWebApi_get("WLan_Common","CountryRegion","s") %>" >												
            <INPUT TYPE="HIDDEN" ID="CountryName" NAME="CountryName" value="<% tcWebApi_get("WLan_Common","Country","s") %>" >
            <INPUT TYPE="HIDDEN" ID="CountryChange" NAME="CountryChange" VALUE="0" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion0" NAME="CountryRegion0" value="0" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion1" NAME="CountryRegion1" value="1" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion2" NAME="CountryRegion2" value="2" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion3" NAME="CountryRegion3" value="3" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion4" NAME="CountryRegion4" value="4" >
            <INPUT TYPE="HIDDEN" ID="CountryRegion5" NAME="CountryRegion5" value="5" >
    <% end if %>
			<INPUT TYPE="HIDDEN" NAME="recover_wlan_id" value="0">
            <INPUT TYPE="HIDDEN" NAME="SaveWlEnb_Flag" value="0">
            <INPUT TYPE="HIDDEN" NAME="auth_2" value="<% tcWebApi_get("Wlan_Entry4","AuthMode","s") %>">
            <INPUT TYPE="HIDDEN" NAME="hwlKeys0" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlKeys1" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlKeys2" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlKeys3" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlgMode" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlAuthMode" value="0">
            <INPUT TYPE="HIDDEN" NAME="hwlEnbl" value="0">
            <INPUT TYPE="HIDDEN" NAME="hWPSMode" value="0">
            <INPUT TYPE="HIDDEN" NAME="henableSsid" value="0">
            <INPUT TYPE="HIDDEN" NAME="BandSteeringEnable" value="<% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>">
            <INPUT TYPE="HIDDEN" NAME="hwlHide" value="0">			
            <INPUT TYPE="HIDDEN" NAME="WpsConfModeAll" value="7">
            <INPUT TYPE="HIDDEN" NAME="WpsConfModeNone" value="0">
            <INPUT TYPE="HIDDEN" NAME="hWpsStart" value="0">
            <INPUT TYPE="HIDDEN" NAME="isCUCSupport" value="<% if tcWebApi_get("Info_WLan", "isCUCSupport", "h")="Yes" then asp_write("1") else asp_write("0") end if %>">
            <INPUT TYPE="HIDDEN" NAME="SSIDPre" value="<%tcWebApi_get("WLan_Common", "SSIDPre", "s")%>">	
            <INPUT TYPE="HIDDEN" NAME="WpsGenerate" value="0">
            <INPUT TYPE="HIDDEN" NAME="isWPSSupported" value="<% if tcWebApi_get("WebCustom_Entry", "isWPSSupported", "h") = "Yes" then asp_write("1") else asp_write("0") end if %>">		
            <% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then %>
            <INPUT TYPE="HIDDEN" NAME="WLanITxBfEn" value="<%tcWebApi_get("WLan_Common", "ITxBfEn", "s")%>">
            <INPUT TYPE="HIDDEN" NAME="WLanETxBfEnCond" value="<%tcWebApi_get("WLan_Common", "ETxBfEnCond", "s")%>">
            <INPUT TYPE="HIDDEN" NAME="WLanETxBfIncapable" value="<%tcWebApi_get("WLan_Common", "ETxBfIncapable", "s")%>">
            <% end if %>
            <% if tcWebApi_get("WLan_Common","rt_device","h") = "7915" then %>
            <INPUT TYPE="HIDDEN" NAME="is11AXModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
            <INPUT TYPE="HIDDEN" NAME="isWPA3ModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
            <% end if %>
			<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
			<TBODY>
			<TR class="hide">
			<TD class='w-130'><P class="form-text">无线总开关</P></TD>
			<TD><INPUT class="input-onoff" onclick=wlClickEnble(this) type=checkbox value=ON name=wlEnbl></TD>
			</TR>
			<TR id="wlan_enbl">
			<TD class='w-130'><P class="form-text">Wi-Fi 开关</P></TD>
			<TD><INPUT class="input-onoff" onclick=wl2ClickEnble(this) type=checkbox value=ON name=wl2Enbl></TD>
			</TR>
            </TR>
            <!-- <TR id="wlan_hide">
            <TD class='w-130'><div class="form-text"><p>隐藏Wi-Fi</p></TD>
            <TD><INPUT class="input-onoff" onclick=wlHideClickEnble() type=checkbox value=ON name="wlHideEnbl">
                <input type="hidden" name="WLANAPHide" value="0">
            </TD> -->
            </TR>
			</TBODY>
			</TABLE>
			<TABLE id=wlInfo cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">SSID</P></TD>
			<TD><INPUT class="input-onoff" type=checkbox name=enableSsid></TD>
			</TR>
			<TR id=trSSID>
			<TD class='w-130'><P class="form-text">SSID索引</P></TD>
			<TD>
			<SELECT id=wlSsidIdx onchange="selChangedSSID()" size=1 name=wlSsidIdx></SELECT>
			<input type="hidden" name="SSID_Flag" value="0">
			</TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">Wi-Fi 名称</P></TD>
			<TD><INPUT id=wlSsid size=10 name=wlSsid></TD>
			</TR>
			</TBODY>
			</TABLE>
			<DIV id=authen>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">认证模式</P></TD>
			<TD><SELECT onchange=authModeChange2(0) size=1 name=wlSecurMode id="wlSecurMode"></SELECT></TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=Preauth>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">WPA2 预认证</P></TD>
			<TD>
				<SELECT size=1 name=wlPreauth> 
				<OPTION value=off selected>Disabled</OPTION> 
				<OPTION value=on>Enabled</OPTION>
				</SELECT>
			</TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=NetReauth>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">重认证间隔</P></TD>
			<TD><INPUT maxLength=10 name=wlNetReauth value=""></TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=wlWpaD>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">加密方式</P></TD>
			<TD><SELECT name=wlWpa id="wlWpa"></SELECT></TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=wpaPreShareKey>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">预共享密钥</P></TD>
			<TD>
				<span id="inpsw1" style="position: relative;">
				<INPUT type=password maxLength=65 id=wlWpaPsk name=wlWpaPsk value='<% if tcWebApi_get("WLan_Entry", "WPAPSK", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "WPAPSK", "s") end if %>' onkeyup="doshowStrongChange(this.value)">
                <div class="input_eye eye-pwd" id="cb_enablshowpsw" data-flag=0 onmousedown="doshowpswChange()"></div>
				</span>
				<% if TCWebApi_get("WebCurSet_Entry", "IsSupportWIFIShowPSW", "h") = "1" then %>
				<script language="JavaScript" type="text/JavaScript">				
				function doshowpswChange() {
                    clearTimeout(changeTimer1);
					with (getElById('ConfigForm')){
                        var flag = getElById('cb_enablshowpsw').getAttribute('data-flag');
                        if (flag==0) {
                            getElById("wlWpaPsk").setAttribute("type", "text");
                            getElById("cb_enablshowpsw").setAttribute("data-flag", "1");
                        }
                        else {
                            getElById("wlWpaPsk").setAttribute("type", "password");
                            getElById("cb_enablshowpsw").setAttribute("data-flag", "0");
                        }
						inpsw1des.innerHTML = '<TD></TD><TD><div class="font-help" style="margin-top: 0;">(8~63个字符或64个十六进制字符串)</div></TD>';
                        inpsw1des.style.display = "";
					}
				}
				</script>
				<% end if %>
			</TD>
			</TR>
            <TR id="strength_label" style="display: none;">
                <TD></TD>
                <TD class='w-130'><P class="pwd-tips">密码强度：<span></span></P></TD>
            </TR>
            <TR id="inpsw1des" style="display: none;"></TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=wpaGTKRekey style="DISPLAY: none">
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">WPA 组密钥更新间隔</P></TD>
			<TD><INPUT style="FONT-FAMILY: '宋体'; width: 140px" maxLength=10 name=wlWpaGtkRekey></TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=wlRadius>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">RADIUS 服务器地址</P></TD>
			<TD ><INPUT maxLength=15 name=wlRadiusIPAddr></TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">RADIUS服务器端口</P></TD>
			<TD><INPUT  maxLength=5 name=wlRadiusPort></TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">RADIUS 共享密钥</P></TD>
			<TD>
				<span id="inrapsw" style="position: relative;">
                <INPUT type=password maxLength=80 id=wlRadiusKey name=wlRadiusKey value='<% if tcWebApi_get("WLan_Entry", "WPAPSK", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "WPAPSK", "s") end if %>' onkeyup="doshowStrongChange2(this.value)">
                <div class="input_eye eye-pwd" id="cb_enablshowrapsw" data-flag=0 onclick="doshowrapswChange(wlRadiusKey.value)"></div>
				<% if TCWebApi_get("WebCurSet_Entry", "IsSupportWIFIShowPSW", "h" ) = "1" then %>
                </span>
				<script language="JavaScript" type="text/JavaScript">
                function doshowrapswChange(value) {
                    clearTimeout(changeTimer2);
					with (getElById('ConfigForm')){
                        var flag = getElById('cb_enablshowrapsw').getAttribute('data-flag');
                        if (flag==0) {
                            inrapsw.innerHTML = "<input type=\"text\" maxLength=80 name=\"wlRadiusKey\" id=\"wlRadiusKey\" value=\"" + value + "\" onkeyup=\"doshowStrongChange2(this.value)\"><div class=\"click input_eye eye-text\" id=\"cb_enablshowrapsw\" data-flag=1 onclick=\"doshowrapswChange('"+ wlRadiusKey.value +"')\"></div>";
                        }
                        else {
                            inrapsw.innerHTML = "<input type=\"password\" maxLength=80 name=\"wlRadiusKey\" id=\"wlRadiusKey\" value=\"" + value + "\" onkeyup=\"doshowStrongChange2(this.value)\"><div class=\"click input_eye eye-pwd\" id=\"cb_enablshowrapsw\" data-flag=0 onclick=\"doshowrapswChange('"+ wlRadiusKey.value +"')\"></div>";
                        }
					}
				}
				</script>
				<% end if %>
			</TD>
			</TR>
            <TR id="strength_label2" style="display: none;">
                <TD></TD>
                <TD class='w-130'><P class="pwd-tips">密码强度：<span></span></P></TD>
            </TR>
			</TBODY>
			</TABLE>
			</DIV>
			
			<DIV id=wlWepD>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">WEP 认证</P></TD>
			<TD ><SELECT name=wlWep></SELECT> </TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>
			<DIV id=keyInfo>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR>
			<TD class='w-130'><P class="form-text">加密长度</P></TD>
			<TD>
				<SELECT onchange=wlKeyBitChange() size=1 name=wlKeyBit> 
				<OPTION value=128 selected>128-bit</OPTION> 
				<OPTION value=64>64-bit</OPTION>
				</SELECT>
			</TD>
			</TR>
            <tr>
                <td></td>
                <td><div id=wlKeyBitTip class="font-help" style="margin-bottom: 12px;">请输入13位字符或26位16进制数</div></td>
            </tr>
			<TR>
			<TD class='w-130'><P class="form-text">当前密钥索引</P></TD>
			<TD><SELECT size=1 name=wlKeyIndex></SELECT></TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">密钥 1</P></TD>
			<TD>
				<INPUT maxLength=26 name=wlKeys value="<% if tcWebApi_get("WLan_Entry", "Key1Str", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "Key1Str", "s") end if %>">
			</TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">密钥 2</P></TD>
			<TD><INPUT maxLength=26 name=wlKeys value="<% if tcWebApi_get("WLan_Entry", "Key2Str", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "Key2Str", "s") end if %>"></TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">密钥 3</P></TD>
			<TD><INPUT maxLength=26 name=wlKeys value="<% if tcWebApi_get("WLan_Entry", "Key3Str", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "Key3Str", "s") end if %>"></TD>
			</TR>
			<TR>
			<TD class='w-130'><P class="form-text">密钥 4</P></TD>
			<TD><INPUT maxLength=26 name=wlKeys value="<% if tcWebApi_get("WLan_Entry", "Key4Str", "h") <> "N/A" then tcWebApi_get("WLan_Entry", "Key4Str", "s") end if %>"></TD>
			</TR>
			</TBODY>
			</TABLE>
			</DIV>

		<DIV id=trTxStream>
		<% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then %>
		<TABLE cellSpacing=0 cellPadding=0 border=0>
		<TBODY>
		<TR>
		<TD class='w-130'><P class="form-text">TxStream</P></TD>
		<TD>
			<SELECT NAME="TxStream_Action" SIZE="1">
			<OPTION value="1" <% if tcWebApi_get("WLan_Common", "HT_TxStream", "h") = "1" then asp_Write("selected") end if %>>1</OPTION> 
			<OPTION value="2" <% if tcWebApi_get("WLan_Common", "HT_TxStream", "h") = "2" then asp_Write("selected") end if %>>2</OPTION> 
			<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>		
			<OPTION value="3" <% if tcWebApi_get("WLan_Common", "HT_TxStream", "h") = "3" then asp_Write("selected") end if %>>3</OPTION> 
			<OPTION value="4" <% if tcWebApi_get("WLan_Common", "HT_TxStream", "h") = "4" then asp_Write("selected") end if %>>4</OPTION> 
			<% end if %>
			</SELECT>
		</TD>
		</TR>
		<TR>
		<TD class='w-130'><P class="form-text">RxStream</P></TD>
		<TD>
			<SELECT NAME="RxStream_Action" SIZE="1">
			<OPTION value="1" <% if tcWebApi_get("WLan_Common", "HT_RxStream", "h") = "1" then asp_Write("selected") end if %>>1</OPTION> 
			<OPTION value="2" <% if tcWebApi_get("WLan_Common", "HT_RxStream", "h") = "2" then asp_Write("selected") end if %>>2</OPTION> 
			<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>		
			<OPTION value="3" <% if tcWebApi_get("WLan_Common", "HT_RxStream", "h") = "3" then asp_Write("selected") end if %>>3</OPTION> 
			<OPTION value="4" <% if tcWebApi_get("WLan_Common", "HT_RxStream", "h") = "4" then asp_Write("selected") end if %>>4</OPTION> 	
			<% end if %>
			</SELECT>
		</TD>
		</TR>
		</TBODY>
		</TABLE>
		<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "is11AXEnhanceModeSupported", "h") = "Yes" then %>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
				<TBODY>
					<TR>
						<TD width="130">BSS Color</TD>
						<TD>
							<INPUT style="WIDTH: 123px" size="3" name="BSSColorNum_flag" id="BSSColorNum_flag" value=<% tcWebApi_get("Wlan_Common", "BSSColorNum", "s") %>>
						</TD>
					</TR>
				</TBODY>
				<TBODY>
					<TR>
						<TD width="130">持续时间</TD>
						<TD>
							<INPUT style="WIDTH: 123px" size="8" name="RTS_flag" id="RTS_flag" value=<% tcWebApi_get("Wlan_Common", "RTS", "s") %>>
						</TD>
						<TD>32us</TD>
					</TR>
				</TBODY>
				<TBODY>
					<TR>
						<TD width="130">BSSID最大值</TD>
						<TD>
							<select id="CBSSIDMaxIndex_flag" name="CBSSIDMaxIndex_flag">
								<option value=1 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "1" then asp_Write("selected") end if %> >1</option>
								<option value=2 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "2" then asp_Write("selected") end if %> >2</option>
								<option value=3 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "3" then asp_Write("selected") end if %> >3</option>
								<option value=4 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "4" then asp_Write("selected") end if %> >4</option>
								<option value=5 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "5" then asp_Write("selected") end if %> >5</option>
								<option value=6 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "6" then asp_Write("selected") end if %> >6</option>
								<option value=7 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "7" then asp_Write("selected") end if %> >7</option>
								<option value=8 <% if tcWebApi_get("Wlan_Common", "CBSSIDMaxIndex", "h") = "8" then asp_Write("selected") end if %> >8</option>
							</select>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
				<TBODY>
					<TR>
						<TD width=130>个人TWT使能</TD>
						<TD>
							<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportDisable" value=0 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") <> "1" then asp_Write("checked") end if %> <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") <> "2" then asp_Write("checked") end if %>>
							<font color="#000000">关闭 </font>
							<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportEnable" value=1 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") = "1" then asp_Write("checked") end if %>>
							<font color="#000000">使能 </font>
							<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportMandatory" value=2 <% if tcWebApi_get("Wlan_Common", "IndividualTWTSupport", "h") = "2" then asp_Write("checked") end if %>>
							<font color="#000000">强制 </font>
						</TD>
					</TR>
				</TBODY>
				<TBODY>
					<TR>
						<TD width=130>HE LDPC</TD>
						<TD>
							<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCDisable" value=0 <% if tcWebApi_get("Wlan_Common", "HELDPCE", "h") <> "1" then asp_Write("checked") end if %>>
							<font color="#000000">关闭 </font>
							<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCEnable" value=1 <% if tcWebApi_get("Wlan_Common", "HELDPCE", "h") = "1" then asp_Write("checked") end if %>>
							<font color="#000000">使能 </font>
						</TD>
					</TR>
				</TBODY>
				<TBODY>
					<TR>
						<TD width=130>Spatial Reuse</TD>
						<TD>
							<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseDisable" value=0 <% if tcWebApi_get("Wlan_Common", "SpatialReuse", "h") <> "1" then asp_Write("checked") end if %>>
							<font color="#000000">关闭 </font>
							<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseEnable" value=1 <% if tcWebApi_get("Wlan_Common", "SpatialReuse", "h") = "1" then asp_Write("checked") end if %>>
							<font color="#000000">使能 </font>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
<% end if %>

		</DIV>
		<DIV class="hide" id=wlUserTip><FONT color=red>提示:</FONT> 
		<BR>&nbsp;&nbsp;&nbsp;&nbsp;安全方式设置为 None 时，传输数据不会被加密。 
		<BR>&nbsp;&nbsp;&nbsp;&nbsp;其他用户可以随意接入您的无线网络。容易引起安全问题。 
		<BR>&nbsp;&nbsp;&nbsp;&nbsp;若没有特殊需要，建议不使用。 </DIV>
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		<DIV class="hide" id="wlMeshTip"> 
		<p><strong>EasyMesh 开启时，加密模式必须为 None 或者 WPA2PSK 或者 WPA3-SAE Transition。WPA加密方式必须为 None 或者 AES。</strong></p>
		</DIV>
	<% end if %>
		<P></P>
	</TD>
	<TD width=10>&nbsp;</TD>
	</TR>
	<TR>
	<TD colspan='2'>
        <P style="margin-top: 32px;margin-left: 182px;">
            <input type="hidden" name="Save_Flag" id='Save_Flag' value="0">
            <BUTTON id="btnOK" onclick="SubmitForm(10)" type="button" name="btnOK">保 存</BUTTON>
        </P>
	</TD>
	</TR>
	</TBODY>
	</TABLE>
	</DIV>


	<DIV id='WLAN24G高级配置_item' class='hide'  style="display:none">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;margin-bottom: 0;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">2.4G 高级配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
			</TBODY>
            </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 0 auto;">
            <TBODY>
			<TR class="hide">
			<TD class='w-130'><P class="form-text">当前索引</P></TD>
			<TD>
				<INPUT type="text" disabled id="currentIdx"></TD>
			</TR>
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then %>	
			<TR id = 'isBandSteerSupport' class="hide">
			<TD class='w-130'><P class="form-text">双频合一</P></TD>
			<TD>
				<INPUT class="input-onoff" type=checkbox name=bandSteering onClick="doBSShow()"></TD>
			</TR>
	        <TR id='rssithreshold_5g' class="hide">
			<TD class='w-130'><P class="form-text">5G接收信号强度阈值</P></TD>
			<TD><INPUT size=10 name=rssithreshold_1 type="text"> dbm(取值范围-100~0)</TD>
			</TR>
			<TR id='rssithreshold_5g_dtl' class="hide">
			<TD class='w-130'></TD>
			<TD><div class="form-text">设备连接在2.4G时，当5G信号强度大于该阈值，切换成5G</div></TD>
			</TR>
			<TR id='rssithreshold_24g' class="hide">
			<TD class='w-130'><P class="form-text">2.4G接收信号强度阈值</P></TD>
			<TD><INPUT size=10 name=rssithreshold_2 type="text"> dbm(取值范围-100~0)</TD>
			</TR>
			<TR id='rssithreshold_24g_dtl' class="hide">
			<TD class='w-130'></TD>
			<TD><div class="form-text">设备连接在5G时，当2.4G信号强度小于该阈值，切换成2.4G</div></TD>
			</TR>
			<TR id='isSsidTypeSupport' class="hide">
			<TD class='w-130'><P class="form-text">组网类别</P></TD>
			<TD><INPUT disabled type=text name=ssidType></TD>
			</TR>
<% end if %>
			<TR id=div_gMode>
			<TD class='w-130'><P class="form-text">工作模式</P></TD>
			<TD>
				<SELECT id=wlgMode onchange=gModeChange() size=1 name=wlgMode> 
				<OPTION value=b,g,n selected>802.11b/g/n 混合</OPTION>
				<OPTION value=b,g>802.11b/g 混合</OPTION>
				<OPTION value=n>802.11n</OPTION>
				<OPTION value=g>802.11g</OPTION>
				<OPTION value=b>802.11b</OPTION>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
        <OPTION value=g,n,ax> 802.11g/n/ax 混合</OPTION>
<% end if %>
				</SELECT>
			</TD>
			</TR>
			<SCRIPT language=JavaScript type=text/javascript>
			if ( curUserName != sptUserName )
				getElement("div_gMode").style.display = "none";
			</SCRIPT>
<% if tcWebApi_get("WebCustom_Entry", "isEasyMeshSupport", "h") = "Yes" then %>
			<TR>
            <TD><P class="form-text">信道</P></TD>
            <TD>
							<SELECT ID="wlChannel" NAME="wlChannel" SIZE="1" onChange="ChannelChange()" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>disabled<% end if %>></SELECT>
            </TD>
       </TR>
       <TR style="display:none">
       			<TD><P class="form-text">国家选择</P></TD>
            <TD>
            	<SELECT ID="Countries_Channels" NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >	
								<SCRIPT language=javascript >
									var countryarr = new Array(98);
									countryarr[0]="ALBANIA";
									countryarr[1]="ALGERIA";
									countryarr[2]="ARGENTINA";
									countryarr[3]="ARMENIA";
									countryarr[4]="AUSTRALIA";
									countryarr[5]="AUSTRIA";
									countryarr[6]="AZERBAIJAN";
									countryarr[7]="BAHRAIN";
									countryarr[8]="BELARUS";
									countryarr[9]="BELGIUM";
									countryarr[10]="BELIZE";
									countryarr[11]="BOLIVIA";
									countryarr[12]="BRAZIL";
									countryarr[13]="BRUNEI DARUSSALAM";
									countryarr[14]="BULGARIA";
									countryarr[15]="CANADA";
									countryarr[16]="CHILE";
									countryarr[17]="CHINA";
									countryarr[18]="COLOMBIA";
									countryarr[19]="COSTA RICA";
									countryarr[20]="CROATIA";
									countryarr[21]="CYPRUS";
									countryarr[22]="CZECH REPUBLIC";
									countryarr[23]="DENMARK";
									countryarr[24]="DOMINICAN REPUBLIC";
									countryarr[25]="ECUADOR";
									countryarr[26]="EGYPT";
									countryarr[27]="ELSALVADOR";
									countryarr[28]="FINLAND";
									countryarr[29]="FRANCE";
									countryarr[30]="GEORGIA";
									countryarr[31]="GERMANY";
									countryarr[32]="GREECE";
									countryarr[33]="GUATEMALA";
									countryarr[34]="HONDURAS";
									countryarr[35]="HONGKONG";
									countryarr[36]="HUNGARY";
									countryarr[37]="ICELAND";
									countryarr[38]="INDIA";
									countryarr[39]="INDONESIA";
									countryarr[40]="IRAN";
									countryarr[41]="IRELAND";
									countryarr[42]="ISRAEL";
									countryarr[43]="ITALY";
									countryarr[44]="JAPAN";
									countryarr[45]="KAZAKHSTAN";
									countryarr[46]="KOREA DEMOCRATIC";
									countryarr[47]="KOREA REPUBLIC";
									countryarr[48]="LATVIA";
									countryarr[49]="LEBANON";
									countryarr[50]="LIECHTENSTEIN";
									countryarr[51]="LITHUANIA";
									countryarr[52]="LUXEMBOURG";
									countryarr[53]="MACAU";
									countryarr[54]="MACEDONIA";
									countryarr[55]="MALAYSIA";
									countryarr[56]="MEXICO";
									countryarr[57]="MONACO";
									countryarr[58]="MOROCCO";
									countryarr[59]="NETHERLANDS";
									countryarr[60]="NEW ZEALAND";
									countryarr[61]="NORWAY";
									countryarr[62]="OMAN";
									countryarr[63]="PAKISTAN";
									countryarr[64]="PANAMA";
									countryarr[65]="PERU";
									countryarr[66]="PHILIPPINES";
									countryarr[67]="POLAND";
									countryarr[68]="PORTUGAL";
									countryarr[69]="PUERTO RICO";
									countryarr[70]="QATAR";
									countryarr[71]="ROMANIA";
									countryarr[72]="RUSSIA";
									countryarr[73]="SAUDI ARABIA";
									countryarr[74]="SINGAPORE";
									countryarr[75]="SLOVAKIA";
									countryarr[76]="SLOVENIA";
									countryarr[77]="SOUTH AFRICA";
									countryarr[78]="SPAIN";
									countryarr[79]="SWEDEN";
									countryarr[80]="SWITZERLAND";
									countryarr[81]="SYRIAN ARAB REPUBLIC";
									countryarr[82]="TAIWAN";
									countryarr[83]="THAILAND";
									countryarr[84]="TRINIDAD AND TOBAGO";
									countryarr[85]="TUNISIA";
									countryarr[86]="TURKEY";
									countryarr[87]="UKRAINE";
									countryarr[88]="UNITED ARAB EMIRATES";
									countryarr[89]="UNITED KINGDOM";
									countryarr[90]="UNITED STATES";
									countryarr[91]="URUGUAY";
									countryarr[92]="UZBEKISTAN";
									countryarr[93]="VENEZUELA";
									countryarr[94]="VIETNAM";
									countryarr[95]="YEMEN";
									countryarr[96]="ZIMBABWE";
									countryarr[97]="Undefined";
									
									for(i=0;i<98;i++)
									{
										if(document.ConfigForm.CountryName.value.match(countryarr[i]) != null)
										{
											document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
											document.ConfigForm.Countries_Channels[i].selected=true;
										}
										else
										{
											if(countryarr[i].match("TAIWAN") !=null){
												document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
											}
											else
											{
												document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
												document.ConfigForm.Countries_Channels[i].selected=false;
											}
										}
									}	
								</SCRIPT>				
							</SELECT> 

				</TD>
			</TR>
			<TR class="hide">
			<TD><P class="form-text">当前信道</P></TD> 
			<TD>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				<INPUT TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>" disabled >
<% else %>
<% if tcWebApi_get("WLan_Common","Channel","h") = "0" then %>
				<INPUT TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>" disabled >
<% else %>
				<INPUT TYPE="TEXT" ID="CurrentChannel_Common" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if %>" disabled >
<% end if %>
<% end if %>
			</TD>
			</TR>
			
<% else %>
			<TR id=switchChannel>
			<TD class='w-130'><P class="form-text">信道选择</P></TD>
			<TD><SELECT onchange=ChannelChange() size=1 name=wlChannel></SELECT></TD>
			</TR>
<% end if %>
			<TR id=wlTransferRate>
			<TD class='w-130'><P class="form-text">速率</P></TD>
			<TD><SELECT size=1 name=wlRate></SELECT></TD>
			</TR>
			<TR id=wlPutOutPower>
			<TD class='w-130'><P class="form-text">发射功率</P></TD>
			<TD>
				<SELECT size=1 name=wlTxPwr> 
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                    <OPTION value=1 selected>100%</OPTION>
                    <OPTION value=2>80%</OPTION>
                    <OPTION value=3>60%</OPTION> 
                    <OPTION value=4>40%</OPTION>
                    <OPTION value=5>20%</OPTION>
<% else %>
                                       <OPTION value=1 selected>穿墙模式</OPTION>
                                <% if tcWebApi_get("WLan_Common","TxPowerLevel","h") = "2" then %>
                                                <OPTION value=2>标准模式</OPTION>
                                <% else %>
                                                <OPTION value=3>标准模式</OPTION>
                                <% end if %>
                                <% if tcWebApi_get("WLan_Common","TxPowerLevel","h") = "5" then %>
                                                <OPTION value=5>节能模式</OPTION>
                                <% else %>
                                                <OPTION value=4>节能模式</OPTION>
                                <% end if %>       
<% end if %>
				</SELECT> 
			</TD>
			</TR>
			<% if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" Then %> 
			<% if tcWebApi_get("Info_WLan", "isMT7615DSupported", "h") <> "Yes" then %>		
			<TR id=trTx Beamforming>
			<TD class='w-130'><P class="form-text">固定发送波束成形</P></TD>
			<TD>
				<SELECT NAME="WLanTxBeamForming">
				<option value="3">Both</option>
				<option value="2">Explicit TxBF</option>
				<option value="1">Implicit TxBF</option>
				<option value="0">Disable</option>
				</SELECT>
			</TD>
			</TR>	 
<% end if %>
<% end if %>

			<TR id=11NbwControl>
			<TD class='w-130'><P class="form-text">信道频宽</P></TD>
			<TD>
				<SELECT id=bwControl style="WIDTH: 123px"   onchange="loadMCSList()" size=1 name=bwControl> <OPTION  value=0 selected>20Mhz</OPTION>
<% if tcWebApi_get("WebCustom_Entry", "isHTBW40M", "h") = "Yes" then %>
				<OPTION value=1>40Mhz</OPTION>
<% end if %>
				<OPTION value=2>20/40Mhz</OPTION> 
				</SELECT>

				<INPUT TYPE="hidden" id=ht_bw name=ht_bw value="0">
				<INPUT TYPE="hidden" id=bwControlhidden name=bwControlhidden value="0">
			</TD>
			</TR>
			<TR id=11NbwControlExt>
			<TD class='w-130'><P class="form-text">扩展信道</P></TD>
			<TD>
				<select id="WLANExtensionChannel"  name="WLANExtensionChannel" >
				<option value="0" <% if tcWebApi_get("WLan_Common", "HT_EXTCHA", "h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Common", "HT_EXTCHA", "h") = "N/A" then asp_Write("selected") end if %>>下偏</option>
				<option value="1" <% if tcWebApi_get("WLan_Common", "HT_EXTCHA", "h") = "1" then asp_Write("selected") end if %>>上偏</option>
				</select>
				 <INPUT TYPE="hidden" id="HT_EXTCHA" name="HT_EXTCHA" value="0">
			</TD>
			</TR>
			<SCRIPT language=JavaScript type=text/javascript>
			if ( curUserName != sptUserName )
				getElement("11NbwControlExt").style.display = "none";
			</SCRIPT>
<% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %>
			<TR id=11NmcsControl>
			<TD class='w-130'><P class="form-text">速率</P></TD>
			<TD><SELECT size=1 name=wlMcs></SELECT></TD>
			</TR>
<% end if %>
			<TR id=11NgiControl>
			<TD class='w-130'><P class="form-text">保护间隔</P></TD>
			<TD>
				<SELECT id=giControl <% if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then %> onchange="loadMCSList()" <% end if %> size=1 name=giControl> <OPTION  value=0 selected>Long</OPTION>
				<OPTION value=1>Short</OPTION>
				</SELECT>
			</TD>
			</TR>
			<TR class="hide">
			<TD class='w-130'><P class="form-text">Beacon信标帧发送间隔</P></TD>
			<TD><INPUT size=10 name=wls_beaint value="<%if tcWebApi_get("WLan_Common", "BeaconPeriod", "h") <> "N/A" then tcWebApi_get("WLan_Common", "BeaconPeriod", "s") end if%>" type="text"></TD>
			</TR>
			<TR class="hide">
			<TD class='w-130'><P class="form-text">DTIM间隔</P></TD>
			<TD><INPUT size=10 name=wls_dtim_int value="<%if tcWebApi_get("WLan_Common", "DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common", "DtimPeriod", "s") end if%>" type="text"></TD>
			</TR>
			
<SCRIPT language=JavaScript type=text/javascript>
			if ( curUserName != sptUserName )
				getElement("11NgiControl").style.display = "none";
</SCRIPT>
<DIV id=wpsinfo style="display:none">
<% If tcWebApi_get("WebCustom_Entry", "isMaxStaNumSupported", "h") = "Yes" Then %>
			<TR class='hide'>
			<TD class='w-130'><P class="form-text">连接设备数目</P></TD>
			<TD><INPUT size=10 name=wlAssociateNum value="<%tcWebApi_get("WLan_Entry", "MaxStaNum", "s")%>"></TD>
			</TR>
<% end if %>
			<TR>
			<TD class='w-130'><P class="form-text">隐藏Wi-Fi</P></TD>
			<TD><INPUT class="input-onoff" type=checkbox value=ON name=wlHide onclick="doBroadcastSSIDChange()"></TD>
			</TR>
			<TR id=TWTDisplayEnable name=TWTDisplayEnable class="hide">
											<TD width="130"><P class="form-text">TWT 开关</P></TD>
											<TD>
												<select id="TWTSupport" name="TWTSupport">
													<option value=0 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "0" then asp_Write("selected") end if %> >关闭</option>
													<option value=1 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "1" then asp_Write("selected") end if %> >使能</option>
													<option value=2 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "2" then asp_Write("selected") end if %> >强制</option>
												</select>
											</TD>
			</TR>
			<!--TABLE cellSpacing=0 cellPadding=0 border=0>
			<TBODY>
			<TR id=wpsenableTR>
			<TD class='w-130'><P class="form-text">WPS</P></TD>
			<TD>
				<INPUT class="input-onoff" type=checkbox name=enableWps <% if tcWebApi_get("WLan_Entry", "WPSConfMode","h") <> "0" then asp_Write("checked") end if %> onclick="doWPSUseChange()">
				<INPUT TYPE="hidden" NAME="WpsActive" value="0">
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
				<input id="wpsmodeTRBTN" style="margin-left: 75px;" name="btnStartWPS" value="<% IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "N/A" then asp_Write("Start WPS") end if %>" onClick="doStartWPS();" type="button"> 
<% else %>
				<input id="wpsmodeTRBTN" style="margin-left: 75px;" name="btnStartWPS" value="<% IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "N/A" then asp_Write("Start WPS") end if %>" onClick="doStartWPS();" type="button"> 
<% end if %>
			</TD>
			</TR>
			<TR id=wpsmodeTR class='hide'>
			<TD class='w-130'><P class="form-text">WPS 模式</P></TD>
			<TD>
				<SELECT id=wpsmode onchange=wpsModeChange() size=1 name=wpsmode> 
				<OPTION value=ap-pbc selected>PBC</OPTION> 
				<OPTION value=ap-pin>PIN</OPTION>
				</SELECT>
			</TD>
			</TR>
			<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
			<INPUT TYPE="hidden" NAME="isInWPSing" value="<%tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "s")%>">
<% else %>
			<INPUT TYPE="hidden" NAME="isInWPSing" value="<%tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "s")%>">
<% end if %>		
			<TR id=pinval class='hide'>
			<TD class='w-130'><P class="form-text">PIN</P></TD>
			<TD><INPUT size=10 name=pinvalue></TD>
			</TR>
<由于cgi加载过慢会导致显示出现闪烁的情况  后续如果要删除pin这部分需要删除 #maincontant  中的display:none>
			<TR id=createPinval class='hide'>
			<TD class='w-130'><P class="form-text">生成PIN</P></TD>
			<TD>
				<iframe src="/cgi-bin/getPinData.cgi" frameborder="0" scrolling="no" width="16%" height="28" align=left onload="showDiv()"></iframe>
				<input type="button" name="pin_generate" value="生成PIN码" onClick="doGenerate()">
			</TD>                      
			</TR>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
							  		<TR id=TWTDisplayEnable name=TWTDisplayEnable>
											<TD width="130"><font color="#000000">TWT 开关</font></TD>
											<TD>
												<select id="TWTSupport" name="TWTSupport">
													<option value=0 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "0" then asp_Write("selected") end if %> >关闭</option>
													<option value=1 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "1" then asp_Write("selected") end if %> >使能</option>
													<option value=2 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "2" then asp_Write("selected") end if %> >强制</option>
												</select>
											</TD>
										</TR>
<% end if %>
			</TBODY>
			</TABLE-->
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
				<input type=hidden id=WlanMuOfdmaDlEnable_flag name=WlanMuOfdmaDlEnable_flag value="<% tcWebApi_get("Wlan_Common","MuOfdmaDlEnable","s") %>">
				<input type=hidden id=WlanMuOfdmaUlEnable_flag name=WlanMuOfdmaUlEnable_flag value="<% tcWebApi_get("Wlan_Common","MuOfdmaUlEnable","s") %>">
				<input type=hidden id=WlanMuMimoDlEnable_flag name=WlanMuMimoDlEnable_flag value="<% tcWebApi_get("Wlan_Common","MuMimoDlEnable","s") %>">
				<input type=hidden id=WlanMuMimoUlEnable_flag name=WlanMuMimoUlEnable_flag value="<% tcWebApi_get("Wlan_Common","MuMimoUlEnable","s") %>">
				<input type="hidden" id="WlanSREnable_flag" name="WlanSREnable_flag" value="<% if tcWebApi_get("Wlan_Common","SREnable","h") <> "N/A" then tcWebApi_get("Wlan_Common","SREnable","s") end if %>">
					<SCRIPT language=JavaScript type=text/javascript>
							function SetWlanMuOfdmaDlEnable(obj){
								obj.checked == true ? WlanMuOfdmaDlEnable_flag.value=1 : WlanMuOfdmaDlEnable_flag.value=0;	
							}
							function SetWlanMuOfdmaUlEnable(obj){
								obj.checked == true ? WlanMuOfdmaUlEnable_flag.value=1 : WlanMuOfdmaUlEnable_flag.value=0;
							}
							function SetWlanMuMimoDlEnable(obj){
								obj.checked == true ? WlanMuMimoDlEnable_flag.value=1 : WlanMuMimoDlEnable_flag.value=0;	
							}
							function SetWlanMuMimoUlEnable(obj){
								obj.checked == true ? WlanMuMimoUlEnable_flag.value=1 : WlanMuMimoUlEnable_flag.value=0;	
							}
					</SCRIPT>
					<TR class="hide">
						<TD width="130"><div class="form-text">MU-OFDMA</div></TD>
							<TD>
								<INPUT class="input-onoff" onclick="SetWlanMuOfdmaUlEnable(this)" type=checkbox <% if tcWebApi_get("Wlan_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %> id=wlanMuOfdmaDlEnable name=wlanMuOfdmaDlEnable>
							</TD>
						</TR>
					<TR class="hide">
						<TD width="130"><div class="form-text">MU-MIMO</div></TD>
							<TD>
								<INPUT class="input-onoff" onclick="SetWlanMuOfdmaUlEnable(this)" type=checkbox <% if tcWebApi_get("Wlan_Common","MuMimoDlEnable","h") = "1" then asp_Write("checked") end if %> id=wlanMuMimoDlEnable name=wlanMuMimoDlEnable>
							</TD>
						</TR>
					<TR class="hide">
						<TD width="130"><div class="form-text">SR</div></TD>
							<TD>
								<INPUT class="input-onoff" onclick="SetWlanMuOfdmaUlEnable(this)" type="checkbox" <% if tcWebApi_get("Wlan_Common","SREnable","h") = "1" then asp_Write("checked") end if %> id="wlanSREnable" name="wlanSREnable">
							</TD>
						</TR>
					</TBODY>
				</TABLE>
<% end if %>

        <TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;<% if tcWebApi_get("WebCurSet_Entry","wlan_id","h") <>"0" then asp_Write("display:none") end if %> ">
			<TBODY>
			<TR id=wpsenableTR>
			<TD class='w-130'><P class="form-text">WPS使能</P></TD>
			<TD>
				<INPUT class="input-onoff" type=checkbox name=enableWps <% if tcWebApi_get("WLan_Entry", "WPSConfMode","h") <> "0" then asp_Write("checked") end if %> onclick="doWPSUseChange()">
				<INPUT TYPE="hidden" NAME="WpsActive" value="0">
            </TD>
            </TR>
            <TR id=wpsenableTR>
                <TD class='w-130'><div class="form-text"></div></TD>
                <TD>
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
                <button id="wpsmodeTRBTN" name="btnStartWPS" onclick="doStartWPS();" ><% IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "N/A" then asp_Write("Start WPS") end if %></button>
<% else %>
                <button id="wpsmodeTRBTN" name="btnStartWPS" onclick="doStartWPS();" ><% IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "N/A" then asp_Write("Start WPS") end if %></button>
<% end if %>
			</TD>
			</TR>
			<TR id=wpsmodeTR class='hide'>
			<TD class='w-130'><P class="form-text">WPS 模式</P></TD>
			<TD>
				<SELECT id=wpsmode onchange=wpsModeChange() size=1 name=wpsmode> 
				<OPTION value=ap-pbc selected>PBC</OPTION> 
				<OPTION value=ap-pin>PIN</OPTION>
				</SELECT>
			</TD>
			</TR>
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
			<INPUT TYPE="hidden" NAME="isInWPSing" value="<%tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "s")%>">
<% else %>
			<INPUT TYPE="hidden" NAME="isInWPSing" value="<%tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "s")%>">
<% end if %>		
			<TR id=pinval class='hide'>
			<TD class='w-130'><P class="form-text">PIN</P></TD>
			<TD><INPUT size=10 name=pinvalue></TD>
			</TR>
<!--由于cgi加载过慢会导致显示出现闪烁的情况  后续如果要删除pin这部分需要删除 #maincontant  中的display:none-->
			<TR id=createPinval class='hide'>
			<TD class='w-130'><P class="form-text">生成PIN</P></TD>
			<TD>
				<iframe src="/cgi-bin/getPinData.cgi" frameborder="0" scrolling="no" width="16%" height="28" align=left onload="showDiv()"></iframe>
				<input type="button" name="pin_generate" value="生成PIN码" onClick="doGenerate()">
			</TD>                      
			</TR>
<!--% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %-->
							  		<!--TR id=TWTDisplayEnable name=TWTDisplayEnable>
											<TD width="130"><font color="#000000">TWT 开关</font></TD>
											<TD>
												<select id="TWTSupport" name="TWTSupport">
													<option value=0 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "0" then asp_Write("selected") end if %> >关闭</option>
													<option value=1 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "1" then asp_Write("selected") end if %> >使能</option>
													<option value=2 <% if tcWebApi_get("Wlan_Common", "TWTSupport", "h") = "2" then asp_Write("selected") end if %> >强制</option>
												</select>
											</TD>
										</TR-->
<!--% end if %-->
			</TBODY>
			</TABLE>
			
			<TABLE>
			<TBODY>		
<!--% If tcWebApi_get("WebCustom_Entry", "isMaxStaNumSupported", "h") = "Yes" Then %-->
			<!--TR class='hide'>
			<TD class='w-130'><P class="form-text">连接设备数目</P></TD>
			<TD><INPUT size=10 name=wlAssociateNum value="<%tcWebApi_get("WLan_Entry", "MaxStaNum", "s")%>"></TD>
			</TR-->
<!--% end if %-->
			<!--TR>
			<TD class='w-130'><P class="form-text">广播取消</P></TD>
			<TD><INPUT class="input-onoff" type=checkbox value=ON name=wlHide></TD>
			</TR-->
            <table cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">							
                <TR>
                    <TD colspan='2'>
                        <P style="margin-top: 62px;margin-left: 182px;">
                            <BUTTON id="btnOK0" onclick="SubmitForm(25)" type="button" name="btnOK0">保 存</BUTTON>
                        </P>
                    </TD>
                </TR>		
            </table>
			</TBODY>
			</TABLE>
			
			
			
		</TABLE>
		

		
	</DIV>
	<DIV id='WLAN共享配置_item' class='hide'>
	<input type="hidden" name="wlanShareCommit" id='wlanShareCommit' value="0">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
	<TR>
	<TD class='wp-3'>&nbsp;</TD>
	<TD>
		<P>WLAN共享功能绑定信息配置
		<INPUT id=wlan_shareuserid style="WIDTH: 125px" name=wlan_shareuserid value="<%if tcWebApi_get("WlanShare_Entry0", "UserId", "h") <> "N/A" then tcWebApi_get("WlanShare_Entry0", "UserId", "s") end if%>" placeholder='请输入手机号码'> 			
		</P>
	</TD>
	</TR>
	<TR>
	<TD colspan='2'>&nbsp;</TD>
	</TR>	
	<TR>
	<TD colspan='2'>
        <P style="margin-top: 32px;margin-left: 182px;">
            <BUTTON id="btnOK1" onclick="pageCommit()" type="button" name="BUTTON">保 存</BUTTON>
        </P>
	</TD>
	</TR>				
	</TBODY>	
	</TABLE>	

	</DIV>
</TD>
</TR>
</TBODY>
</TABLE>
</FORM>
</TD>
</TR>
</TBODY>
</TABLE>

</TD>
</TR>
</TBODY>
</TABLE>
<script language="JavaScript">
var enableOpenFlag = "<% tcWebApi_get("dynCwmpAttr_Entry", "aSSIDEnable", "s") %>";
var beaconTypeOpenFlag = "<% tcWebApi_get("dynCwmpAttr_Entry", "aWLanBeaconType", "s") %>";
var ssidOpenFlag = "<% tcWebApi_get("dynCwmpAttr_Entry", "aWLanSSID", "s") %>";

if ( enableOpenFlag == "0" )
	getElById('enableSsid').disabled = true;

if ( beaconTypeOpenFlag == "0" )
	getElById('wlSecurMode').disabled = true;

if ( ssidOpenFlag == "0" )
	getElById('wlSsid').disabled = true;
	
</script>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY>
</HTML>
<% tcWebApi_constSet("WebCurSet_Entry", "info_wlan_read", "0") %>
