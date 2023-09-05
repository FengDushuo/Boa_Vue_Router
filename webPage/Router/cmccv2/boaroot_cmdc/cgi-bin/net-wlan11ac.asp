<%
IF Request_Form("wlanWEPFlag")="2" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	TCWebApi_save()
End if
%>
<HTML>
<HEAD>
<TITLE>WLAN5G配置</TITLE>
<META http-equiv=Content-Language content=zh-cn >
<META http-equiv=Content-Type content="text/html; charset=gb2312" >
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet >
<SCRIPT language=javascript src="/JS/menu.js" ></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js" ></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT>
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR >
<style>
    @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
        .click.input_eye {
            top: -20px;
        }
    }
    .form-radio .input-radio {
        margin-left: 12px;
    }
    #inpsw1 input,
    #inpsw2 input,
    #inpsw3 input,
    #inpsw4 input,
    #inpsw5 input {
        padding-right: 42px;
    }
</style>
<SCRIPT language=JavaScript type=text/javascript >
	
function showDiv(){
	$("#mainContant").css("display","block");
}	

var changeTimer1 = null,
    changeTimer2 = null,
    changeTimer3 = null,
    changeTimer4 = null;
var enbl = <% tcWebApi_get("WLan_Common","APOn","s") %>;
var acenbl = <% tcWebApi_get("WLan11ac_Common","APOn","s") %>;
var meshEbl = "<% tcWebApi_get("Mesh_dat", "MapEnable", "s") %>";
var devRole = "<% tcWebApi_get("Info_Mesh","DeviceRole","s") %>";
HT5GExtCh = new Array(22);
HT5GExtCh[0] = 1;
HT5GExtCh[1] = 0;
HT5GExtCh[2] = 1;
HT5GExtCh[3] = 0;
HT5GExtCh[4] = 1;
HT5GExtCh[5] = 0;
HT5GExtCh[6] = 1;
HT5GExtCh[7] = 0;
HT5GExtCh[8] = 1;
HT5GExtCh[9] = 0;
HT5GExtCh[10] = 1;
HT5GExtCh[11] = 0;
HT5GExtCh[12] = 1;
HT5GExtCh[13] = 0;
HT5GExtCh[14] = 1;
HT5GExtCh[15] = 0;
HT5GExtCh[16] = 1;
HT5GExtCh[17] = 0;
HT5GExtCh[18] = 1;
HT5GExtCh[19] = 0;
HT5GExtCh[20] = 1;
HT5GExtCh[21] = 0;


<% if tcwebApi_get("Wlan11ac_Entry","FrontHaul","h") = "1" then %>
var bss_fh_support = '1';
<% else %>
var bss_fh_support = '0';
<% end if %>
<% if tcwebApi_get("Wlan11ac_Entry","BackHaul","h") = "1" then %>
var bss_bh_support = "1";
<% else %>
var bss_bh_support = '0';
<% end if %>

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
var wpsenable;
<% end if %>
var wepidx;
var WEPSelectIndex;
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
var WLanACSSID = new Array(<% tcWebApi_JsonHook("get_wlanac_ssid_info", "", "") %>);
<% end if %>

<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
var isMeshBssCfg = 0;

function mesh_save_check()
{
		if(isMeshBssCfg)
		{
			var wlwpa_check = 0;
			if((document.forms[0].WEP_Selection.value != 'OPEN') && (document.forms[0].WEP_Selection.value != 'WPA2PSK'))
			{
				alert("EasyMesh开启时，加密模式必须为 \"OPEN\" 或者 \"WPA2PSK\"!");
				return 0;
			}
			
			var TKIP_Selection1_ctl = document.forms[0].TKIP_Selection1;
			var TKIP_Selection2_ctl = document.forms[0].TKIP_Selection2;
			var TKIP_Selection3_ctl = document.forms[0].TKIP_Selection3;
			var TKIP_Selection4_ctl = document.forms[0].TKIP_Selection4;
			var TKIP_Selection5_ctl = document.forms[0].TKIP_Selection5;
			var TKIP_Selection6_ctl = document.forms[0].TKIP_Selection6;

			var TKIP_Selection1_val, TKIP_Selection2_val, TKIP_Selection3_val, TKIP_Selection4_val, TKIP_Selection5_val, TKIP_Selection6_val;
			
			if(TKIP_Selection1_ctl)
			{
				TKIP_Selection1_val = TKIP_Selection1_ctl.value;
			}
			if(TKIP_Selection2_ctl)
			{
				TKIP_Selection2_val = TKIP_Selection2_ctl.value;
			}
			if(TKIP_Selection3_ctl)
			{
				TKIP_Selection3_val = TKIP_Selection3_ctl.value;
			}
			if(TKIP_Selection4_ctl)
			{
				TKIP_Selection4_val = TKIP_Selection4_ctl.value;
			}
			if(TKIP_Selection5_ctl)
			{
				TKIP_Selection5_val = TKIP_Selection5_ctl.value;
			}
			if(TKIP_Selection6_ctl)
			{
				TKIP_Selection6_val = TKIP_Selection6_ctl.value;
			}
			
			if((TKIP_Selection1_ctl) && ((TKIP_Selection1_val == "NONE") || (TKIP_Selection1_val == "AES")))
			{
					wlwpa_check = 1;
			}
			else if((TKIP_Selection2_ctl) && ((TKIP_Selection2_val == "NONE") || (TKIP_Selection2_val == "AES")))
			{
					wlwpa_check = 1;
			}
			else if((TKIP_Selection3_ctl) && ((TKIP_Selection3_val == "NONE") || (TKIP_Selection3_val == "AES")))
			{
					wlwpa_check = 1;
			}
			else if((TKIP_Selection4_ctl) && ((TKIP_Selection4_val == "NONE") || (TKIP_Selection4_val == "AES")))
			{
					wlwpa_check = 1;
			}
			else if((TKIP_Selection5_ctl) && ((TKIP_Selection5_val == "NONE") || (TKIP_Selection5_val == "AES")))
			{
					wlwpa_check = 1;
			}
			else if((TKIP_Selection6_ctl) && ((TKIP_Selection6_val == "NONE") || (TKIP_Selection6_val == "AES")))
			{
					wlwpa_check = 1;
			}

			if((0 == wlwpa_check) && (document.forms[0].WEP_Selection.value != 'None'))
			{
				alert("EasyMesh开启时, WPA加密模式必须为 \"None\" 或者 \"AES\"!");
				return 0;
			}
		}
		return 1;
}

function easymesh_checkAuthMode(wlAuthMode)
{
	if(wlAuthMode)
	{
		for (var idx=0; idx < wlAuthMode.length; idx++) 
		{
			var tmpAuthMode = wlAuthMode.options[idx].value;
			tmpAuthMode = tmpAuthMode.toUpperCase();
			if((tmpAuthMode != 'OPEN') && (tmpAuthMode != 'WPA2PSK'))
			{
				wlAuthMode.options[idx].disabled = true;
			}
			else
			{
				wlAuthMode.options[idx].disabled = false;
			}
		}
	}
}

function easymesh_checkEncrType(wlEncrType)
{
	if(wlEncrType)
	{
		for (var idx=0; idx < wlEncrType.length; idx++) 
		{
			var tmpEncrType = wlEncrType.options[idx].value;
			tmpEncrType = tmpEncrType.toUpperCase();
			if(tmpEncrType != "AES")
			{
				wlEncrType.options[idx].disabled = true;
			}
			else
			{
				wlEncrType.options[idx].disabled = false;
			}
		}
	}
}

function easymesh_onload()
{
	var wl_authMode="", wl_encrypType = "";
	var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
	var bss_gl_al_mac = "";
	var bss_gl_fh_support = 0, bss_gl_bh_support = 0;

	var node_idx = document.ConfigForm.SSID_INDEX.value;
	node_idx = parseInt(node_idx) + 1;
	isMeshBssCfg = 0;
	document.getElementById('div_mesh_check_msg').style.display = 'none';

	if(mapDevRole != 1 && mapDevRole != 2)
	{
			console.log("EasyMesh Device Role is neither Controller nor Agent!");
			return;
	}
	bss_gl_al_mac = "<% tcWebApi_get("Mesh_radio5glbssinfo","AL-MAC","s") %>";
	
	switch(node_idx)
	{
			case 1:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry0","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry0","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.1","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.1","EncrypType","s") %>";
				break;
			case 2:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry1","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry1","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.2","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.2","EncrypType","s") %>";
				break;
			case 3:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry2","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry2","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.3","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.3","EncrypType","s") %>";
				break;
			case 4:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry3","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry3","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.4","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.4","EncrypType","s") %>";
				break;
			case 5:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry4","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry4","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.5","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.5","EncrypType","s") %>";
				break;
			case 6:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry5","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry5","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.6","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.6","EncrypType","s") %>";
				break;
			case 7:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry6","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry6","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.7","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.7","EncrypType","s") %>";
				break;
			case 8:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry7","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry7","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.8","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.8","EncrypType","s") %>";
				break;
			case 9:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry8","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry8","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.9","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.9","EncrypType","s") %>";
				break;
			case 10:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry9","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry9","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.10","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.10","EncrypType","s") %>";
				break;
			case 11:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry10","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry10","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.11","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.11","EncrypType","s") %>";
				break;
			case 12:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry11","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry11","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.12","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.12","EncrypType","s") %>";
				break;
			case 13:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry12","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry12","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.13","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.13","EncrypType","s") %>";
				break;
			case 14:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry13","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry13","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.14","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.14","EncrypType","s") %>";
				break;
			case 15:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry14","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry14","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.15","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.15","EncrypType","s") %>";
				break;
			case 16	:
				bss_gl_fh_support = "<% tcWebApi_get("WLan11ac_Entry15","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("WLan11ac_Entry15","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.16","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.16","EncrypType","s") %>";
				break;
			default:
				bss_gl_al_mac = "";
				bss_gl_fh_support = 0;
				bss_gl_bh_support = 0;
				wl_authMode = "";
				wl_encrypType = "";
				break;
	}
	al_mac = al_mac.toUpperCase();
	bss_gl_al_mac = bss_gl_al_mac.toUpperCase();
	if((al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
	|| (bss_gl_al_mac == null) || (bss_gl_al_mac == "N/A") || (bss_gl_al_mac == "") || (bss_gl_al_mac == "00:00:00:00:00:00"))
	{
			return;
	}
	
	if( ((bss_gl_al_mac == al_mac) || (bss_gl_al_mac == "FF:FF:FF:FF:FF:FF")) 
			&& ((1 == bss_gl_fh_support) || (1 == bss_gl_bh_support)) )
	{
			easymesh_checkAuthMode(document.forms[0].WEP_Selection);
			
			easymesh_checkEncrType(document.forms[0].TKIP_Selection1);
			easymesh_checkEncrType(document.forms[0].TKIP_Selection2);
			easymesh_checkEncrType(document.forms[0].TKIP_Selection3);
			easymesh_checkEncrType(document.forms[0].TKIP_Selection4);
			easymesh_checkEncrType(document.forms[0].TKIP_Selection5);
			easymesh_checkEncrType(document.forms[0].TKIP_Selection6);
			
			if((wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK"))
			{
				alert("When EasyMesh Enable, AutoMode must be \"OPEN\" or \"WPA2PSK\"!", function(ret){
					isMeshBssCfg = 1;
					document.getElementById('div_mesh_check_msg').style.display = '';
					return;
				});
			}else{
				isMeshBssCfg = 1;
				document.getElementById('div_mesh_check_msg').style.display = '';
				return;
			}
			
			if(wl_authMode.toUpperCase() != "OPEN")
			{
				if((wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
				{
					alert("When EasyMesh Enable, Encryption Type must be \"NONE\" or \"AES\"!", function(ret){
						isMeshBssCfg = 1;
						document.getElementById('div_mesh_check_msg').style.display = '';
						return;
					});
				}
			}else{
				isMeshBssCfg = 1;
				document.getElementById('div_mesh_check_msg').style.display = '';
				return;
			}
	}else{
		isMeshBssCfg = 1;
		document.getElementById('div_mesh_check_msg').style.display = '';
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
	
	$.getJSON("/cgi-bin/getWpsPara11ac.asp", function(data, status){
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
				document.ConfigForm.btnStartWPS.disabled = 'disabled';
				setTimeout(getWPStimerRunning, 1000);
			}
			else
			{
				top.getWlanWpsTimerCount = 0;
				switch(wpsTimerRunningData)
				{
					case "1":
                        getElById('btnStartWPS').innerText = 'Stop WPS';
						break;
					default:
                        getElById('btnStartWPS').innerText = 'Start WPS';
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
                    getElById('btnStartWPS').innerText = 'Stop WPS';
					break;
				default:
                    getElById('btnStartWPS').innerText = 'Start WPS';
					break;
			}
            document.ConfigForm.btnStartWPS.disabled = "";
		}
	}
	
}
<% end if %>

function showWpsBtn() {
    <% if tcWebApi_get("Wlan11ac_Entry0", "WPSConfMode","h") = "0" then %>
        document.ConfigForm.btnStartWPS.disabled = "disabled";
    <% end if %>
}

function PERESSIDenable()
{
	if (document.ConfigForm.ESSID_Enable_Selection_h.checked)
		document.ConfigForm.ESSID_Enable_Selection[0].checked = true;
	else
		document.ConfigForm.ESSID_Enable_Selection[1].checked = true;	
}

function ESSIDenable()
{
	if (document.ConfigForm.ESSID_HIDE_h.checked == true)
		document.ConfigForm.ESSID_HIDE_Selection[1].checked = true;	
	else
		document.ConfigForm.ESSID_HIDE_Selection[0].checked = true;	

    <% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
    doBroadcastSSIDChange();
    <% end if %>
}

function APenable(c)
{
	if ( '0' == c )
	{
		if ( document.ConfigForm.wlanac_APenable_h.checked == true )
		{
			setText('SaveWlEnb_Flag', 1);
		}
		else if ( document.ConfigForm.wlanac_APenable_h.checked == false )
		{
			setText('SaveWlEnb_Flag', 1);
		}
	}
	else if ( '1' == c )
	{
		if ( document.ConfigForm.wlanac_AP5enable_h.checked == true )
		{
			document.ConfigForm.wlan_APon.value = "1";
		}
		else
		{
			document.ConfigForm.wlan_APon.value = "0";
		}
	}
    // else if ( '2' == c )
	// {
	// 	if ( document.ConfigForm.wlanac_AP5hide_h.checked == true )
	// 	{
    //         setText('WLAN11acAPHide', 1);
	// 	}
	// 	else if ( document.ConfigForm.wlanac_AP5hide_h.checked == false )
	// 	{
    //         setText('WLAN11acAPHide', 0);
	// 	}
	// }
}

function ChannelSelect()
{
	if ( document.ConfigForm.bwControl.selectedIndex == 0 )
	{
		document.ConfigForm.WLANChannelBandwidth[0].selected = true;
	}
	else if ( document.ConfigForm.bwControl.selectedIndex == 1 )
	{
		document.ConfigForm.WLANChannelBandwidth[1].selected = true;
		document.ConfigForm.WLan11acVHTChannelBandwidth[0].selected = true;
	}
	else if ( document.ConfigForm.bwControl.selectedIndex == 2 )
	{
		document.ConfigForm.WLANChannelBandwidth[2].selected = true;
		document.ConfigForm.WLan11acVHTChannelBandwidth[0].selected = true;
	}
    else if(document.ConfigForm.bwControl.selectedIndex == 3)
	{
		document.ConfigForm.WLANChannelBandwidth[1].selected=true;
		document.ConfigForm.WLan11acVHTChannelBandwidth[1].selected=true;
	}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
	else if(document.ConfigForm.bwControl.selectedIndex == 4)
	{
		document.ConfigForm.WLANChannelBandwidth[1].selected=true;
		document.ConfigForm.WLan11acVHTChannelBandwidth[2].selected=true;
	}
<% end if %>
}

function WPS_Enable()
{
	if(document.ConfigForm.WPS_ENABLE_NOH.checked == true)
		document.ConfigForm.UseWPS_Selection[0].checked = true;
	else if(document.ConfigForm.WPS_ENABLE_NOH.checked == false)
		document.ConfigForm.UseWPS_Selection[1].checked = true;

	// if(dowpscheck())
	// {
	// 	document.ConfigForm.wlanWEPFlag.value = 1;
	// 	RefreshChannPage();
	// 	LoadFrame();
	// }

	// if (document.ConfigForm.UseWPS_Selection[0].checked == true)
	// 	document.ConfigForm.WPS_ENABLE_NOH.checked = true;
	// else
	// 	document.ConfigForm.WPS_ENABLE_NOH.checked = false;
}

function doCheckWepSelectIndex()
{
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
		WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex + 1;
<% else %>
		WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex;
<% end if %>
	return true;	
}

<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
	<% if tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") <> "N/A" then %>
		var oldwpsTimerRunningData = "<% tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","s") %>";
	<% else %>
		var oldwpsTimerRunningData = "";
	<% end if %>
<% end if %>

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doStartWPS(){
	if((document.ConfigForm.WPSMode_Selection[0].checked)&&(document.ConfigForm.isInWPSing.value==0))
	{
		var pincode = document.ConfigForm.WPSEnrolleePINCode;
		var len = pincode.value.length;
		if(doPINCodeCheck(pincode) == false)
		{
			return ;
		}
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") <> "1"  then %>
<% if tcWebApi_get("Wlan11ac_Entry", "WPSConfStatus", "h") = "2" then %>
		if(len <= 0)
		{
			alert('WPS PIN码不能为空!');
			return;
		}
<% end if %>
<% end if %>
	}
	if(document.ConfigForm.isInWPSing.value==0){
		alert("请2分钟内启动WPS连接.");
	}
    <% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
        top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
    <% end if %>
	document.ConfigForm.WpsStart.value = 1;
	
    ajax_wps_submit(25);
}

function doResetOOB(){
	document.ConfigForm.WpsOOB.value = 1;
	//document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}

function doGenerate(){
	document.ConfigForm.WpsGenerate.value = "1";
	//document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}
<% end if %>

function strESSIDCheck(str) {
// 	if(str.value.match(/[^\x00-\xff]/g)){
// <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
// 		var reg = /[\u4e00-\u9fa5]/g;
// 		var chinese_str = str.value.match(reg);
// 		var len = 2*chinese_str.length + (str.value.length - chinese_str.length);
// 		//if( str.value.length > 10 )
// 		if( len > 20 )
// <% end if %>
// 		{
// <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
// 			alert("Wi-Fi名称不能超过20个字符或10个汉字，请重新输入！");
// <% else %>
// 			alert("SSID名称不合法！");
// <% end if %>
// 			return true;
// 		}
// 	}
	valpwd = getValue('PreSharedKey1');
    if(str.value.length <= 0){
		alert('Wi-Fi名称不能为空！');
		return false;
	}
	if(!checkSSID(str.value))
	{
		alert("SSID长度不能超过28个字节，请重新输入！");
		return false;
	}
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
 	if (str.value.indexOf("`") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		return false;
 	}
	 if (str.value.indexOf(",") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		return false;
 	}
	 if (str.value.indexOf(" ") != -1)
 	{
 		alert("不支持填写','、'`'、' '");
 		return false;
 	}

	 if ( isValidWPAPskKey(valpwd) == false )
		{
			alert('WPA 预认证共享密钥应为8到63位ASCII字符或者64位16进制数，请重新输入！');
			return false;
		}
 <% end if %>
	var bssidnum = parseInt("<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>");
	var curssidIdx = parseInt("<% tcWebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>");
	var the_substring = str.value.substring(0, 11);

	// if(the_substring != 'xiaoduwifi-')
	// {
	// 	alert('Wi-Fi名称应该是以"xiaoduwifi-"开头的字符串！');
	// 	return false;
	// }
// 	for(var index=0; index < bssidnum; index++)
// 	{
// 		if(index == curssidIdx)
// 			continue;
// <% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
// 		if(str.value == WLanACSSID[index])
// <% else %>
// 		if(str.value == wlan11acssid[index])
// <% end if %>
// 		{
// 			alert("SSID"+(curssidIdx+5)+"不能与SSID"+(index+5)+"的名称相同！");
// 			return true;
// 		}
// 	}
	return true;
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

function LoadSsidIdxList()
{
	var ssidNum = <% tcWebApi_get("WLan11ac_Common", "BssidNum", "s") %>;;

	var ssidindex = 1;
	
	var ssid1 = "<% tcWebApi_get("WLan11ac_Entry0","EnableSSID","s") %>";
	var ssid2 = "<% tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") %>";
	var ssid3 = "<% tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") %>";
	var ssid4 = "<% tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") %>";

	document.ConfigForm.SSID_INDEX.options.length = 0;
	document.ConfigForm.SSID_INDEX[0] = new Option("SSID5", "0");
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> Yes then %>
	if ( ssidNum > "1" )
	{
		if(ssid2 == "0" || ssid2 == "1")
		{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID6(组网回传网络)", "1");
			ssidindex++;
		}
		if(ssid3 == "0" || ssid3 == "1")
		{
			
			if(ssidNum > "2")
			{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID7(访客网络)", "2");
			ssidindex++;
			}
			
		}
		if(ssid4 == "0" || ssid4 == "1")
		{
			
			if(ssidNum > "3")
			{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID8(WIFI5兼容)", "3");
			ssidindex++;
			}
		}
	}
<% else %>
<% if tcwebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>
	if ( ssidNum > "1" )
	{
		if(ssid2 == "0" || ssid2 == "1")
		{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID6(组网回传网络)", "1");
			ssidindex++;
		}
		if(ssid3 == "0" || ssid3 == "1")
		{
			
			if(ssidNum > "2")
			{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID7(访客网络)", "2");
			ssidindex++;
			}
			
		}
		if(ssid4 == "0" || ssid4 == "1")
		{
			
			if(ssidNum > "3")
			{
			document.ConfigForm.SSID_INDEX[ssidindex] = new Option("SSID8", "3");
			ssidindex++;
			}
		}
	}
<% end if %>
<% end if %>
	setSelect('SSID_INDEX', <% tcWebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>);
}

function doWlanSwitch()
{
	if ( acenbl || enbl )
	{
		setCheck('wlanac_APenable_h', 1);
		APenable('1');
	}
	else
	{
		APenable('0');
	}
}
<% if tcwebApi_get("Mesh_common","CmccApMeshFlag","h") = "1" then %>
function isDisabled(){
	var node_idx = document.forms[0].SSID_INDEX.value;
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
			$("select[name='SSID_INDEX']").prop("disabled", false);
			$("input[name='wlanWEPFlag']").prop("disabled", false);		
	<% end if %>
	<% end if %>
			$("option[value='WEP-64Bits']").eq(0).css("display", "none");
			$("option[value='WEP-128Bits']").eq(0).css("display", "none");
			$("option[value='WPAPSKWPA2PSK']").eq(0).css("display", "none");
			$("option[value='WPAPSK']").eq(0).css("display", "none");
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>		
			if($("option[value='WPA3PSK']").length != 0)	
				$("option[value='WPA3PSK']").eq(0).css("display", "none");
<% end if %>
		}	
	<% end if %>
}

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
<% end if %>
function LoadFrame()
{
document.getElementById('currentIdx').value = "SSID" + (parseInt(<% tcWebApi_get("WebCurSet_Entry", "wlan_ac_id", "s") %>) + 5);
<% if tcWebApi_get("WebCustom_Entry","isShowNumOfSsid","h") = "Yes" then %>
	LoadSsidIdxList();
<% end if %>
	doCheckSSID();
	RefreshChannPage();
	doCheckWepSelectIndex();
<% if tcwebApi_get("Mesh_common","CmccApMeshFlag","h") = "1" then %>
	isDisabled();
	isShowSsidType();
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") = "Yes" then %>
	//setText('ESSID', WLanACSSID[0]);
	setText('ESSID', WLanACSSID[<% tcwebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>]);
<% end if %>
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
	initWLan11ac2ndFrequencySel();	
	VHTBandwidthRefreshPage();
	if ( initFlag == true )
	{
		initWLan11acTxBeamFormingSel();
		initFlag = false;
	}
<% end if %>
	if ( document.ConfigForm.isDot1XSupported.value == 1 )
	{
		if ( document.ConfigForm.isAuthenTypeSupported.value == 1 )
		{
			document.getElementById("WEP_Selection_div").style.display = "none";
			document.getElementById("WEP_Selection_show_div").style.display = "";
			doWEPChange2();
		}
		else
		{
			document.getElementById("WEP_Selection_div").style.display = "";
			document.getElementById("WEP_Selection_show_div").style.display = "none";
		}
	}
	
	if ( document.ConfigForm.WirelessMode.selectedIndex >= 1 )
	{
		document.ConfigForm.Is11nMode.value = 1;
		if ( document.ConfigForm.WirelessMode.selectedIndex >= 2 )
		{
			document.ConfigForm.Is11acMode.value = 1;
		}
		else
		{
			document.ConfigForm.Is11acMode.value = 0;
		}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if ( (document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1) 
			|| (document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2) )
<% else %>
		if ( document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1 )
<% end if %>
		{
			if ( InsExtChOpt(document.ConfigForm.Channel_ID.value) == 1 )
			{
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 1;
			}
			else
			{
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 0;
			}
			document.ConfigForm.WLANExtensionChannel.disabled = true;	
		}
	}
	else
	{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then %>
	if ( document.ConfigForm.isInWPSing.value == 1 )
	{
		document.ConfigForm.ResetOOB.disabled = true;
	}
	
	if ( document.ConfigForm.wlan_VC.value == 0 )
	{
		wpsenable = document.ConfigForm.UseWPS_Selection[0].checked;
	}
<% end if %>
<% end if %>
	wepidx = WEPSelectIndex;
	if ( document.ConfigForm.isWDSSupported.value == 1 )
	{
		if ( document.ConfigForm.WLAN_WDS_Active[0].checked == true ) /* if wds enable */
		{
			autoWLAN_WDS_Active();
		}
		else if ( document.ConfigForm.WLAN_WDS_Active[1].checked == true ) /* if wds disable */
		{
			autoWLAN_WDS_Deactive();
		}
	}
	
	if ( document.ConfigForm.bharti_ssid2.value == 1 )
	{
		doloadSSID2();
	}
<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
		McsRefreshPage();
<% end if %>
	dobwControlopt();
	if ( document.ConfigForm.WLANChannelBandwidth.selectedIndex == 0 )
	{
		document.ConfigForm.bwControl.value = 1;
	}
	else if ( document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1
		&& document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 0 )
	{
		document.ConfigForm.bwControl.value = 2;
	}
    else if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2) {
        document.ConfigForm.bwControl.value = 3;
    }
	else if(document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 0
		&& document.ConfigForm.WLANChannelBandwidth.selectedIndex != 0
		&& document.ConfigForm.WLANChannelBandwidth.selectedIndex != 2)
	{
		document.ConfigForm.bwControl.value = 2;
	}
	else if ( document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 1 )
	{
		document.ConfigForm.bwControl.value = 4;
	}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
	else if(document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 2) {
        document.ConfigForm.bwControl.value = 5;
    }

    // 信道大于等于149后，如果选择的是160，则改为20/40/80
    if(document.ConfigForm.Channel_ID.selectedIndex > 8 
        && document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1 
        && document.ConfigForm.WLan11acVHTChannelBandwidth.value == 2) {
        document.ConfigForm.bwControl.value = 4;
        document.ConfigForm.WLan11acVHTChannelBandwidth.value = 1;
    }
            
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then %>
	if ( document.ConfigForm.UseWPS_Selection[0].checked == true )
	{
		document.ConfigForm.WPS_ENABLE_NOH.checked = true;
	}
	else
	{
		document.ConfigForm.WPS_ENABLE_NOH.checked = false;
	}
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
<% if tcWebApi_get("Wlan11ac_Common","ChannelDisable","h") = "1" then %>
	document.forms[0].Channel_ID.disabled = true;
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
    setDisplay('wlacInfoTab', acenbl);
	doWlanSwitch();
	$('.tblMain').trigger('click');
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function doCheckSSID()
{	
	var ssid_val = document.ConfigForm.wlan_VC.value;	
	var ssid_optval = document.ConfigForm.SSID_INDEX.value;	
	if(ssid_val != ssid_optval)	
	{		
		document.ConfigForm.wlanWEPFlag.value = 2;		
		//document.ConfigForm.submit();	
		$("form[name='ConfigForm']").submit();
	}
}	

function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegionABand = document.ConfigForm.hCountryRegionABand;
	var ctlCountryRegionABand0 = document.ConfigForm.CountryRegionABand0;
	var ctlCountryRegionABand1 = document.ConfigForm.CountryRegionABand1;
	var ctlCountryRegionABand2 = document.ConfigForm.CountryRegionABand2;
	var ctlCountryRegionABand3 = document.ConfigForm.CountryRegionABand3;
	var ctlCountryRegionABand4 = document.ConfigForm.CountryRegionABand4;
	var ctlCountryRegionABand5 = document.ConfigForm.CountryRegionABand5;
	var ctlCountryRegionABand6 = document.ConfigForm.CountryRegionABand6;
	var ctlCountryRegionABand7 = document.ConfigForm.CountryRegionABand7;
	var ctlCountryRegionABand8 = document.ConfigForm.CountryRegionABand8;
	var ctlCountryRegionABand9 = document.ConfigForm.CountryRegionABand9;
	var ctlCountryRegionABand10 = document.ConfigForm.CountryRegionABand10;
	var ctlCountryRegionABand11 = document.ConfigForm.CountryRegionABand11;
	if(vCountryName == "ARGENTINA")
		ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
	else if (vCountryName == "ARMENIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "AUSTRIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "AZERBAIJAN")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "BELGIUM")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BELIZE")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BOLIVIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BRAZIL")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BRUNEI DARUSSALAM")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BULGARIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "CHINA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;		
	else if (vCountryName == "CROATIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
	else if (vCountryName == "CYPRUS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;		
	else if (vCountryName == "CZECH REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
	else if (vCountryName == "DENMARK")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;	
	else if (vCountryName == "EGYPT")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "ESTONIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FINLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FRANCE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "GEORGIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "GERMANY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "GREECE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "HUNGARY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "ICELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "INDONESIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "IRAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "IRELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "ITALY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "JAPAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
	else if (vCountryName == "KOREA DEMOCRATIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "KOREA REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "LATVIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LITHUANIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LUXEMBOURG")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "MONACO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "NETHERLANDS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PERU")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "PHILIPPINES")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "POLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PORTUGAL")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SLOVAKIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SLOVENIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SOUTH AFRICA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SPAIN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SWEDEN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SWITZERLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "TAIWAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
	else if (vCountryName == "TRINIDAD AND TOBAGO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "TUNISIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "TURKEY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "UNITED KINGDOM")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "URUGUAY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "UZBEKISTAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "VENEZUELA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else
		ctlCountryRegionABand.value = ctlCountryRegionABand0.value;

	RefreshChannPage();
	if(document.ConfigForm.RTDEVICE.value == "7615")
	{
		initWLan11ac2ndFrequencySel();
		VHTBandwidthRefreshPage();
	}
	document.ConfigForm.CountryChange.value = 1; 
}

var bInit = 1;
function RefreshChannPage(){
	var index = 0;
	var ctlChannel_ID = document.ConfigForm.Channel_ID;
	var vChannel = ctlChannel_ID.value;
	var vCountryRegionABand = document.ConfigForm.hCountryRegionABand.value;
	if(bInit == 1){
		vChannel = "<% tcWebApi_get("WLan11ac_Common","Channel","s") %>";
		bInit = 0;
	}
	ctlChannel_ID.length = 0;
	if(vCountryRegionABand == 0){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 1){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("124", "124");
		ctlChannel_ID.options[index++] = new Option("128", "128");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
	}else if(vCountryRegionABand == 2){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
	}else if(vCountryRegionABand == 3){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else if(vCountryRegionABand == 4){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("57", "57");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 5){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else if(vCountryRegionABand == 6){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
	}else if(vCountryRegionABand == 8){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
	}else if(vCountryRegionABand == 9){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 10){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}else if(vCountryRegionABand == 11){
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
	}else{
		ctlChannel_ID.options[index++] = new Option("AUTO", "0");
		ctlChannel_ID.options[index++] = new Option("36", "36");
		ctlChannel_ID.options[index++] = new Option("40", "40");
		ctlChannel_ID.options[index++] = new Option("44", "44");
		ctlChannel_ID.options[index++] = new Option("48", "48");
		ctlChannel_ID.options[index++] = new Option("52", "52");
		ctlChannel_ID.options[index++] = new Option("56", "56");
		ctlChannel_ID.options[index++] = new Option("60", "60");
		ctlChannel_ID.options[index++] = new Option("64", "64");
		ctlChannel_ID.options[index++] = new Option("100", "100");
		ctlChannel_ID.options[index++] = new Option("104", "104");
		ctlChannel_ID.options[index++] = new Option("108", "108");
		ctlChannel_ID.options[index++] = new Option("112", "112");
		ctlChannel_ID.options[index++] = new Option("116", "116");
		ctlChannel_ID.options[index++] = new Option("120", "120");
		ctlChannel_ID.options[index++] = new Option("124", "124");
		ctlChannel_ID.options[index++] = new Option("128", "128");
		ctlChannel_ID.options[index++] = new Option("132", "132");
		ctlChannel_ID.options[index++] = new Option("136", "136");
		ctlChannel_ID.options[index++] = new Option("140", "140");
		ctlChannel_ID.options[index++] = new Option("149", "149");
		ctlChannel_ID.options[index++] = new Option("153", "153");
		ctlChannel_ID.options[index++] = new Option("157", "157");
		ctlChannel_ID.options[index++] = new Option("161", "161");
		ctlChannel_ID.options[index++] = new Option("165", "165");
	}
	ctlChannel_ID.options[0].selected=true;
	SelectValue(ctlChannel_ID, vChannel);

	if(document.ConfigForm.Is11nMode.value == "1"){
		document.getElementById("11nMode_0_div").style.display="none";
		document.getElementById("11nMode_1_div").style.display="";
	}else{
		document.getElementById("11nMode_0_div").style.display="";
		document.getElementById("11nMode_1_div").style.display="none";
	}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
	if((document.ConfigForm.WLANChannelBandwidth.value == 1 ) || (document.ConfigForm.WLANChannelBandwidth.value == 2 ))
<% else %>
	if(document.ConfigForm.WLANChannelBandwidth.value == "1")
<% end if %>
	{
		document.getElementById("HT_BW_1_div").style.display="";
		if(document.ConfigForm.Is11acMode.value == "1"){
			document.getElementById("11acMode_1_div").style.display="";
		}else{
			document.getElementById("11acMode_1_div").style.display="none";
		}
	}else{
		document.getElementById("HT_BW_1_div").style.display="none";
		document.getElementById("11acMode_1_div").style.display="none";
	}	
	if(document.ConfigForm.isWPSSupported.value == "1")
	{
		if(document.ConfigForm.wlan_VC.value == 0 ){
			// if(document.ConfigForm.UseWPS_Selection[0].checked == true)
			// 	document.getElementById("WPSConfMode_1_div").style.display="";
			// else
			// 	document.getElementById("WPSConfMode_1_div").style.display="none";
		}
	}
	var vAuthMode = document.ConfigForm.WEP_Selection.value;
	if(document.getElementById("Radius-WEP64_div") != null) 
		document.getElementById("Radius-WEP64_div").style.display="none";
	if(document.getElementById("Radius-WEP128_div") != null)
		document.getElementById("Radius-WEP128_div").style.display="none";
	if(document.getElementById("WPA_div") != null)
		document.getElementById("WPA_div").style.display="none";
	if(document.getElementById("WPA2_div") != null)
		document.getElementById("WPA2_div").style.display="none";
	if(document.getElementById("WPA1WPA2_div") != null)
		document.getElementById("WPA1WPA2_div").style.display="none";
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
	if(document.getElementById("WPA3_div") != null)
		document.getElementById("WPA3_div").style.display="none";
	if(document.getElementById("WPA3_192Bit_div") != null)
		document.getElementById("WPA3_192Bit_div").style.display="none";
<% end if %>
<% end if %>
	if(vAuthMode == "Radius-WEP64"){
		if(document.getElementById("Radius-WEP64_div") != null) 
			document.getElementById("Radius-WEP64_div").style.display="";
	}
	if(vAuthMode == "Radius-WEP128"){
		if(document.getElementById("Radius-WEP128_div") != null)
			document.getElementById("Radius-WEP128_div").style.display="";
	}
	if(vAuthMode == "WPA"){
		if(document.getElementById("WPA_div") != null)
			document.getElementById("WPA_div").style.display="";
	}
	if(vAuthMode == "WPA2"){
		if(document.getElementById("WPA2_div") != null)
			document.getElementById("WPA2_div").style.display="";
	}
	if(vAuthMode == "WPA1WPA2"){
		if(document.getElementById("WPA1WPA2_div") != null)
			document.getElementById("WPA1WPA2_div").style.display="";
	}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
	if(vAuthMode == "WPA3"){
		if(document.getElementById("WPA3_div") != null)
			document.getElementById("WPA3_div").style.display="";
	}
	if(vAuthMode == "WPA3-192Bit"){
		if(document.getElementById("WPA3_192Bit_div") != null)
			document.getElementById("WPA3_192Bit_div").style.display="";
	}
<% end if %>
<% end if %>		
	if(document.getElementById("WEP-64Bits_div") != null)
		document.getElementById("WEP-64Bits_div").style.display="none";
	if(document.getElementById("WEP-128Bits_div") != null)
		document.getElementById("WEP-128Bits_div").style.display="none";
	if(document.getElementById("WPA2PSK_div") != null)
		document.getElementById("WPA2PSK_div").style.display="none";
	if(document.getElementById("WPAPSK_div") != null)
		document.getElementById("WPAPSK_div").style.display="none";
	if(document.getElementById("WPAPSKWPA2PSK_div") != null)
		document.getElementById("WPAPSKWPA2PSK_div").style.display="none";	
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
		document.getElementById("WPA2PSKWPA3PSK_div").style.display="none";	
	if(document.getElementById("WPA3PSK_div") != null)
		document.getElementById("WPA3PSK_div").style.display="none";
<% end if %>	
	if(vAuthMode == "WEP-64Bits"){
		if(document.getElementById("WEP-64Bits_div") != null)
			document.getElementById("WEP-64Bits_div").style.display="";
	}else if(vAuthMode == "WEP-128Bits"){
		if(document.getElementById("WEP-128Bits_div") != null)
			document.getElementById("WEP-128Bits_div").style.display="";
	}else if(vAuthMode == "WPA2PSK"){
		if(document.getElementById("WPA2PSK_div") != null)
			document.getElementById("WPA2PSK_div").style.display="";
	}else if(vAuthMode == "WPAPSK"){
		if(document.getElementById("WPAPSK_div") != null)
			document.getElementById("WPAPSK_div").style.display="";
	}else if(vAuthMode == "WPAPSKWPA2PSK"){
		if(document.getElementById("WPAPSKWPA2PSK_div") != null)
			document.getElementById("WPAPSKWPA2PSK_div").style.display="";
	}
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	else if(vAuthMode == "WPA2PSKWPA3PSK"){
		if(document.getElementById("WPA2PSKWPA3PSK_div") != null)
			document.getElementById("WPA2PSKWPA3PSK_div").style.display="";	
	}else if(vAuthMode == "WPA3PSK"){
		if(document.getElementById("WPA3PSK_div") != null)
			document.getElementById("WPA3PSK_div").style.display="";	
	}
<% end if %>

	
	if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="none";
	if(vAuthMode == "OPEN")
		;
	else if(vAuthMode == "WEP-64Bits")
		;
	else if(vAuthMode == "WEP-128Bits")
		;
	else if(vAuthMode == "Radius-WEP64")
		;
	else if(vAuthMode == "Radius-WEP128")
		;
	else if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="";
}
<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
var MCSInit = 1;
function McsRefreshPage(){
	var rt_device = "<%tcWebApi_get("WLan11ac_Common","rt_device","s")%>";
	var index = 0;
	var WLANMCS_ID = document.ConfigForm.WLANMCS;
	var vWLANMCS = WLANMCS_ID.value;
	var ls11acmode = document.ConfigForm.Is11acMode.value;
	if(MCSInit == 1){
		vWLANMCS = "<%tcWebApi_get("Wlan11ac_Entry","HT_MCS","s")%>";
		MCSInit = 0;
	}
	WLANMCS_ID.length = 0;
	WLANMCS_ID.options[index++] = new Option("0", "0");
	WLANMCS_ID.options[index++] = new Option("1", "1");
	WLANMCS_ID.options[index++] = new Option("2", "2");
	WLANMCS_ID.options[index++] = new Option("3", "3");
	WLANMCS_ID.options[index++] = new Option("4", "4");
	WLANMCS_ID.options[index++] = new Option("5", "5");
	WLANMCS_ID.options[index++] = new Option("6", "6");
	WLANMCS_ID.options[index++] = new Option("7", "7");
	if(ls11acmode == "1"){
		WLANMCS_ID.options[index++] = new Option("8", "8");
		if (document.ConfigForm.WLANChannelBandwidth.selectedIndex != 0)
		WLANMCS_ID.options[index++] = new Option("9", "9");
	}
	else if (rt_device == "7612" || rt_device == "7615") {
		WLANMCS_ID.options[index++] = new Option("8", "8");
		WLANMCS_ID.options[index++] = new Option("9", "9");
		WLANMCS_ID.options[index++] = new Option("10", "10");
		WLANMCS_ID.options[index++] = new Option("11", "11");
		WLANMCS_ID.options[index++] = new Option("12", "12");
		WLANMCS_ID.options[index++] = new Option("13", "13");
		WLANMCS_ID.options[index++] = new Option("14", "14");
		WLANMCS_ID.options[index++] = new Option("15", "15");
	}
	WLANMCS_ID.options[index++] = new Option("AUTO", "33");
	
	WLANMCS_ID.options[0].selected=true;
	SelectValue(WLANMCS_ID, vWLANMCS);
}
<% end if %>
<% If tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" Then %>
var VHTSec80Channel = "<% tcWebApi_get("WLan11ac_Common","VHT_Sec80_Channel","s") %>";
var initFlag = true;

function initWLan11acTxBeamFormingSel()			//init TxBeamforming sel
{
	var ITxBfEn = "<%tcWebApi_get("WLan11ac_Common","ITxBfEn","s")%>";
	var ETxBfEnCond = "<%tcWebApi_get("WLan11ac_Common","ETxBfEnCond","s")%>";
	var ETxBfIncapable = "<%tcWebApi_get("WLan11ac_Common","ETxBfIncapable","s")%>";
	if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Both
	{
		document.ConfigForm.WLan11acTxBeamForming[0].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Explicit
	{
		document.ConfigForm.WLan11acTxBeamForming[1].selected = true;
	}
	else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Implicit
	{
		document.ConfigForm.WLan11acTxBeamForming[2].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Disable
	{
		document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
	}
	else
	{
		document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
	}
}

function doVHTTxBeamFormingChange()
{
	if(document.ConfigForm.WLan11acTxBeamForming[0].selected == true)			//Both
	{
		document.ConfigForm.WLan11acITxBfEn.value = "1";
		document.ConfigForm.WLan11acETxBfEnCond.value = "1";
		document.ConfigForm.WLan11acETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[1].selected == true)		//Explicit
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "1";
		document.ConfigForm.WLan11acETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[2].selected == true)		//Implicit
	{
		document.ConfigForm.WLan11acITxBfEn.value = "1";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[3].selected == true)		//Disable
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
	else
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
}

function setVHTbwChannel()
{
	document.ConfigForm.VHTSec80Channel.value = VHTSec80Channel;					
}

function initWLan11ac2ndFrequencySel()		//init 2ndFrequencyChannel sel options
{
	document.ConfigForm.WLan11ac2ndFrequency.length = 0;
	var opts = document.ConfigForm.Channel_ID.options;
	var selindex = document.ConfigForm.Channel_ID.selectedIndex;
	var optsval = opts[selindex].value;
	var oindex = 0;
	var fcount = new Array(5);
	fcount[0] = "36~48";
	fcount[1] = "52~64";
	fcount[2] = "100~112";
	fcount[3] = "116~128";
	fcount[4] = "149~161";
	if(optsval >= 36 && optsval <= 48)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(optsval >= 52 && optsval <= 64)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}	
	}	
	else if(optsval >= 100 && optsval <= 112)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(optsval >= 116 && optsval <= 128)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}	
	}
	else if(optsval >= 149 && optsval <= 161)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(selindex != 0)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],4);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[4].selected = true;
		}	
	}
	onVHTbwChannelChange();		
}

function onVHTbwChannelChange()
{
	var opts = document.ConfigForm.Channel_ID.options;
	var selindex = document.ConfigForm.Channel_ID.selectedIndex;
	var optsval = opts[selindex].value;
	var j = document.ConfigForm.WLan11ac2ndFrequency.selectedIndex;
	if(optsval >= 36 && optsval <= 48)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "52";
				break;
			case 1:
				VHTSec80Channel = "100";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}
	else if(optsval >= 52 && optsval <= 64)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "100";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}		
	else if(optsval >= 100 && optsval <= 112)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}	
	else if(optsval >= 116 && optsval <= 128)
	{				
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}	
	else if(optsval >= 149 && optsval <= 161)
	{		
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "116";
				break;
		}
	}
	else if(selindex != 0)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "116";
				break;
			case 4:
				VHTSec80Channel = "149";
				break;
		}
	}	
}	

function VHTBandwidthRefreshPage()
{
	if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 3) &&
		(document.ConfigForm.TxStream_Action.selectedIndex == 3) &&
		(document.ConfigForm.RxStream_Action.selectedIndex == 3))
	{
		if(document.ConfigForm.WLan11acVHTChannelBandwidth.options[3].selected == true && document.ConfigForm.Channel_ID.selectedIndex != 0)
		{
			document.getElementById("WLan11ac2ndFrequencyTable").style.display = "";
		}
		else
		{
			document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
		}
	}
	else
	{
		document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
	}
}
<% End If %>

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function dowpscheck(){				//modified by fred to support WPS2.0
	var wlan=document.ConfigForm;
	if(wlan.SSID_INDEX.value==0){	
		if(wlan.UseWPS_Selection[0].checked == true){
			//check if WscV2Supported
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
			if (wlan.ESSID_HIDE_Selection[1].checked == true){
				alert("SSID broadcast must be enabled if you want to use WPS, in other cases you need to disable WPS firstly!");
			  wlan.UseWPS_Selection[1].checked = true;
			  return 0;
			}
			if (WEPSelectIndex != 0 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 5 && WEPSelectIndex != 8 && WEPSelectIndex != 9 && WEPSelectIndex != 10
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					&& WEPSelectIndex != 6 && WEPSelectIndex != 7
<% end if %>
			)
			{
				alert("The authentication type must be one of \"OPEN,WPA,WPA2,WPAPSK,WPA2PSK,WPAPSK/WPA2PSK\" if you want to use WPS, in other cases you need to disable WPS firstly!");
				wlan.WEP_Selection.selectedIndex = wepidx;	
				if(wpsenable)
				{
					wlan.UseWPS_Selection[0].checked = true;
				}else{
					wlan.UseWPS_Selection[1].checked = true;
				}
					return 0;
			}
			if(((WEPSelectIndex == 3) && (wlan.TKIP_Selection5.value== "TKIP"))||((WEPSelectIndex==4) && (wlan.TKIP_Selection4.value== "TKIP"))|| ((WEPSelectIndex==5) && (wlan.TKIP_Selection6.value== "TKIP")))
			{
				//WPAPSK ,WPA2PSK and WPAPSKWPA2PSK with TKIP	
				alert("Encryption type must not be TKIP if you want to use WPS, in other cases you need to disable WPS firstly!");
				wlan.UseWPS_Selection[1].checked = true;
				return 0;
			}
			else if(((WEPSelectIndex == 8) && (wlan.TKIP_Selection1.value== "TKIP"))||((WEPSelectIndex==9) && (wlan.TKIP_Selection2.value== "TKIP"))|| ((WEPSelectIndex==10) && (wlan.TKIP_Selection3.value== "TKIP")))
			{	
				//WPA, WPA2 and WPAWPA2 with TKIP
				alert("Encryption type must not be TKIP if you want to use WPS, in other cases you need to disable WPS firstly!");
				wlan.UseWPS_Selection[1].checked = true;
				return 0;
			}
	
			return 1;
<% end if %>
		//do simple check if only WPS 1.0 supported, use original check code in 1.0
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") <> "1"  then %>
		//WEPSelectIndex 1=WEP64,2=WEP128,3=Radius-WEP64,4=Radius-WEP128
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		if(wlan.WEP_Selection.value == "WPA3PSK" || wlan.WEP_Selection.value == "WPA2PSKWPA3PSK")
				return 1;
<% end if %>
		if(WEPSelectIndex == 1 || WEPSelectIndex == 2 || WEPSelectIndex == 6 || WEPSelectIndex == 7){
			// alert("加密模式为WEP时，无法开启WPS功能！");
			if(wpsenable){
				wlan.UseWPS_Selection[0].checked = true;
			}else{
				wlan.UseWPS_Selection[1].checked = true;
			}
			return 0;
		}else{
			return 1;
		}
<% end if %>
	
		}
		else{
			return 1;
		}
	}else{
		return 1;
	}
}
<%  end if %>

function doBroadcastSSIDChange(){
	//check if WscV2Supported

	var wlan=document.ConfigForm;
    <% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
        if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (wlan.ESSID_HIDE_Selection[1].checked == true))
        {
                alert("隐藏Wi-Fi，WPS使能将被关闭！");
                wlan.UseWPS_Selection[0].checked = false;
                wlan.WPS_ENABLE_NOH.disabled = true;
                wlan.WPS_ENABLE_NOH.checked = false;
        }

        if((wlan.SSID_INDEX.value==0) && (wlan.ESSID_HIDE_Selection[1].checked == true))
		{
            wlan.WPS_ENABLE_NOH.disabled = true;
		}
        else {
            wlan.WPS_ENABLE_NOH.disabled = false;
        }
    <% end if %>

	return 1;	
}

function doEncryptionChange(object){
	//check if WscV2Supported
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
	var wlan=document.ConfigForm;	
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (object.value == "TKIP"))
	{
		var rv = confirm("WPS will be disabled!");
		if (rv == false)
		{
			object.value="AES";
		}
		else
		{
			object.value = "TKIP";
			wlan.UseWPS_Selection[0].checked = false;
			wlan.UseWPS_Selection[1].checked = true;
		}
	}
	LoadFrame();
<% end if %>

	return 1;
}

function doWEPChange(){
	doCheckWepSelectIndex();
	var wlan=document.ConfigForm;	
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (WEPSelectIndex != 0 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 5 && WEPSelectIndex != 8 && WEPSelectIndex != 9 && WEPSelectIndex != 10
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
					&& WEPSelectIndex != 6 && WEPSelectIndex != 7
<% end if %>
	))
	{
		var rv = confirm("WPS will be disabled!");
		if (rv == false)
		{
			wlan.WEP_Selection.selectedIndex = wepidx;
		}
		else
		{
			wlan.UseWPS_Selection[0].checked = false;
			wlan.UseWPS_Selection[1].checked = true;
		}			
	}
<% end if %>

	//do simple check if only WPS 1.0 supported, use original check code in 1.0
<% if tcWebApi_get("WLan_Entry","WscV2Support","h") <> "1"  then %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	if(wlan.WEP_Selection.value != "WPA3PSK" && wlan.WEP_Selection.value != "WPA2PSKWPA3PSK"){
<% end if %>
	// if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) &&(WEPSelectIndex == 1 || WEPSelectIndex == 2 || WEPSelectIndex == 6 || WEPSelectIndex == 7))
	// {
	// 	alert("加密模式为WEP时，无法开启WPS功能！");
	// 	wlan.WEP_Selection.selectedIndex = wepidx;
	// 	$('.tblMain').trigger('click');
	// }
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
	}
<% end if %>
<% end if %>
<% end if %>	
	if(WEPSelectIndex == 0)
	{
        alert("你的网络将被设置为不加密的不安全状态，建议选择WPAPSK或WPA2PSK的加密方式！");
        wlan.wlanWEPFlag.value = 1;
		LoadFrame();
	}else{
		LoadFrame();
	}
}

function doWEPChange2(){
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(dowpscheck()){
<% end if %>
		document.ConfigForm.wlanWEPFlag.value = 1;
		if(WEPSelectIndex != 9){
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			document.ConfigForm.WEP_Selection.selectedIndex = 8;
<% else %>
			document.ConfigForm.WEP_Selection.selectedIndex = 9;
<% end if %>
		//document.ConfigForm.submit();
		$("form[name='ConfigForm']").submit();
		}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	}
<% end if %>
}

function doWDSEncrypTypeChange(){
		document.ConfigForm.wlanWEPFlag.value = 4;
}

function doSSIDChange(){
	document.ConfigForm.wlanWEPFlag.value = 2;
	//document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}

function doExtChaLockChange() {
	if(document.ConfigForm.WirelessMode.selectedIndex >= 1){
		if(document.ConfigForm.RTDEVICE.value == "7615")
		{
			initWLan11ac2ndFrequencySel();
			VHTBandwidthRefreshPage();
		}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1)||(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2)){
<% else %>
		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
<% end if %>
			document.ConfigForm.wlanWEPFlag.value = 1;
			LoadFrame();
		}
	}
}

function dobwControlopt()
{
	if ( document.ConfigForm.WirelessMode.selectedIndex >= 1 )
	{		
		setDisplay('bwControl_r', 1);
<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
		setDisplay('wlanmcsrate', 1);
<% end if %>
		setDisplay('guardval', 1);
		$("#bwControl").empty();
		$("#bwControl").append("<option value='1'>20 MHz</option>");
		$("#bwControl").append("<option value='2'>20/40 MHz</option>");
		$("#bwControl").append("<option value='3'>40 MHz</option>");
		$("#bwControl").append("<option value='4'>20/40/80 MHz</option>");
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
		$("#bwControl").append("<option value='5'>160 MHz</option>");
<% end if %>
		if ( document.ConfigForm.WirelessMode.selectedIndex < 2 ) 
		{
			$("#bwControl option[value='4']").remove();
        <% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
            $("#bwControl option[value='5']").remove();
        <% end if %>
		}
        else {
            if ( document.ConfigForm.Channel_ID.selectedIndex > 8 ) 
            {
                if(document.ConfigForm.Channel_ID.selectedIndex == 13) {
                    $("#bwControl option[value='5']").remove();
                    $("#bwControl option[value='4']").remove();
                    $("#bwControl option[value='3']").remove();
                    $("#bwControl option[value='2']").remove();
                }
                else {
                    <% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
                        $("#bwControl option[value='5']").remove();
                    <% end if %>
                }
            }
        }
        
	}
	else
	{
		setDisplay('bwControl_r', 0);
<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
		setDisplay('wlanmcsrate', 0);
<% end if %>
		setDisplay('guardval', 0);
	}
}

function doWirelessModeChange()
{
	document.ConfigForm.wlanWEPFlag.value = 1;
	dobwControlopt();
	if ( document.ConfigForm.WirelessMode.selectedIndex >= 1 )
	{
		document.ConfigForm.Is11nMode.value = 1;
		if ( document.ConfigForm.WirelessMode.selectedIndex >= 2 ) 
		{			
			document.ConfigForm.Is11acMode.value = 1;
		}
		else
		{
			document.ConfigForm.Is11acMode.value = 0;
		}
	}
	else
	{
		document.ConfigForm.Is11nMode.value = 0;
		document.ConfigForm.Is11acMode.value = 0;
	}
	
	LoadFrame();
}

function doVHTBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	LoadFrame();
}

function doChannelBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	LoadFrame();
}

function doExtChannChange(){
	if(document.ConfigForm.WLANExtensionChannel.selectedIndex==0){
		document.ConfigForm.ExtChannFlag.value = 0;
	}else{
		document.ConfigForm.ExtChannFlag.value = 1;
	}
}

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doWPSUseChange(){
	if(dowpscheck()){
		document.ConfigForm.wlanWEPFlag.value = 1;
		RefreshChannPage();
		LoadFrame();
	}
}

function doWPSModeChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	//document.ConfigForm.submit();
	$("form[name='ConfigForm']").submit();
}
<% end if %>

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

function doshowStrongChange1(value) {
    changeTimer1 = setTimeout(function() {
        strength_label1.style.display = "";
        var password_strength = checkPWStrength(value);
        switch (password_strength) {
            case 0:
                strength_label1.style.display = "none";
                break;
            case 1:
                $("#strength_label1 span")[0].innerText = "弱";
                break;
            case 2:
                $("#strength_label1 span")[0].innerText = "中";
                break;
            case 3:
            case 4:
                $("#strength_label1 span")[0].innerText = "高";
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

function doshowStrongChange3(value) {
    changeTimer3 = setTimeout(function() {
        strength_label3.style.display = "";
        var password_strength = checkPWStrength(value);
        switch (password_strength) {
            case 0:
                strength_label3.style.display = "none";
                break;
            case 1:
                $("#strength_label3 span")[0].innerText = "弱";
                break;
            case 2:
                $("#strength_label3 span")[0].innerText = "中";
                break;
            case 3:
            case 4:
                $("#strength_label3 span")[0].innerText = "高";
                break;
        }
    }, 200);
}

function doshowStrongChange4(value) {
    changeTimer4 = setTimeout(function() {
        strength_label4.style.display = "";
        var password_strength = checkPWStrength(value);
        switch (password_strength) {
            case 0:
                strength_label4.style.display = "none";
                break;
            case 1:
                $("#strength_label4 span")[0].innerText = "弱";
                break;
            case 2:
                $("#strength_label4 span")[0].innerText = "中";
                break;
            case 3:
            case 4:
                $("#strength_label4 span")[0].innerText = "高";
                break;
        }
    }, 200);
}

function blurFn3(that) {
    doshowStrongChange3(that.value);
    wpapskCheck(that);
}

function blurFn4(that) {
    doshowStrongChange4(that.value);
    wpapskCheck(that);
}

function wpapskCheck(object) {
	var keyvalue=object.value;
	var wpapsklen=object.value.length;
 	if(wpapsklen >= 8 && wpapsklen < 64){
  	if(keyvalue.match(/[^\x00-\xff]/g))
 	  {
            alert('WPA 预认证共享密钥应为8到63位ASCII字符或者64位16进制数，请重新输入！');
			return true;
 	  }
	  else 
 	  {
			for ( i = 0; i < wpapsklen; i++ )
			{
				if ( keyvalue.charAt(i) == ' ' || keyvalue.charAt(i) == '`')
				{
                    alert('WPA 预认证共享密钥应为8到63位ASCII字符或者64位16进制数，请重新输入！');
					return true;
				}
			}
 	  }
	}else if(wpapsklen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert("16进制预认证共享密钥错误!");
				return true;
			}
		}
	}else {
		alert("预认证共享密钥长度错误!");
		return true;
	}	
	return false;
}

function WDSKeyCheck(object) {
	var keyvalue=object.value;
	var wdskeylen=object.value.length;
 	if(wdskeylen < 8) {
  	alert('WDS Key length error!');
		return true;
	}else if(wdskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('WDS Key Hex value error!');
				return true;
			}
		}
	}else if(wdskeylen > 64) {
    alert('WDS Key length error!');
		return true;
	}			
	return false;
}

function doWEPTypeChange(){

}

function doHexCheck(c)
{
  if ((c >= "0")&&(c <= "9"))
  {
    return 1;
  }
  else if ((c >= "A")&&(c <= "F"))
  {
    return 1;
  }
  else if ((c >= "a")&&(c <= "f"))
  {
    return 1;
  }

  return -1;
}

function doNonSympolCheck(c)
{
	if ((c >= "0")&&(c <= "9"))
	{
		return 1;
	}
	else if ((c >= "A")&&(c <= "Z"))
	{
		return 1;
	}
	else if ((c >= "a")&&(c <= "z"))
	{
		return 1;
	}

  return -1;
}

function doKEYcheck(object)
{
	var index = object.value.indexOf("0x");
	len=object.value.length;
	
	if(len == 0){
		return true;
	}

	if(WEPSelectIndex==1)
	{
		if(len==5)/*wep 64*/
		{
			return true;
		}
		else if(len==10)/*wep 64*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert('密匙无效，请输入 5位ASCII字符或 10位16进制数作为一个 64-bit WEP 认证密匙。');
						return false;
				}
			}
		}
		else
		{
					alert('密匙无效，请输入 5位ASCII字符或 10位16进制数作为一个 64-bit WEP 认证密匙。');
			return false;
		}
	}
	else if(WEPSelectIndex==2)
	{
		if(len==13)/*wep 128*/
		{
			return true;
		}
		else if(len==26)/*wep 128*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert('密匙无效，请输入 13位 ASCII字符或 26位16进制数作为一个 128-bit WEP 认证密匙。');
					return false;
				}
			}
		}
		else
		{
					alert('密匙无效，请输入 13位 ASCII字符或 26位16进制数作为一个 128-bit WEP 认证密匙。');
			return false;
		}
	}
	if(document.ConfigForm.isDot1XSupported.value==1)
	{
		if(WEPSelectIndex==6)
		{
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		else if(WEPSelectIndex==7)
		{
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("nvalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("nvalid Key Value");
				return false;
			}
		}
	}
	return true;
}

function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";

  if ( len == 0 )
  {
    object.value ="00:00:00:00:00:00";
    return;
  }

  if ( len == 12 )
  {
    var newAddr = "";
    var i = 0;

    for ( i = 0; i < len; i++ )
    {
      var c = szAddr.charAt(i);
      
      if ( doHexCheck(c) < 0 )
      {
      	alert("Invalid MAC Address");        
      	object.focus();
        return;
      }
      if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
        newAddr = newAddr + ":";
      newAddr = newAddr + c;
    }
    object.value = newAddr;
    return;
  }
  else if ( len == 17 )
  {
    var i = 2;
    var c0 = szAddr.charAt(0);
    var c1 = szAddr.charAt(1);

    if ( (doHexCheck(c0) < 0) || (doHexCheck(c1) < 0) )
    {
			alert("Invalid MAC Address");       	
			object.focus();
			return;
    }
    
    i = 2;
    while ( i < len )
    {
      var c0 = szAddr.charAt(i);
      var c1 = szAddr.charAt(i+1);
      var c2 = szAddr.charAt(i+2);  
      if ( (c0 != ":") || (doHexCheck(c1) < 0) || (doHexCheck(c2) < 0) )
      {
				alert("Invalid MAC Address");         	
				object.focus();
				return;
      }
      i = i + 3;
    }
    return; 
  }
  else
  {
		alert("Invalid MAC Address");         	
		object.focus();
		return;
  }
}

function checkBeacon(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 20 || value > 1000) {
    alert("Beacon value must be between 20 and 1000");    
    return true;  	
  }
  return false;
}

function checkRTS(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 1500 || value > 2347) {
    alert("RTS Threshold value must be between 1500 and 2347");    
    return true;  	
  }
  return false;
}

function checkFrag(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 256 || value > 2346) {
    alert("Fragmentation Threshold value must be between 256 and 2346");    
    return true;  	
  }
  if (value % 2) {
    alert("Fragmentation Threshold value must be an even number");    
    return true;  	
  }
  return false;
}

function checkDTIM(value) 
{
  if (!isNumeric(value)) {
    alert("Non-integer value given" + value);    
    return true;
  }
  if (value < 1 || value > 255) {
    alert("DTIM value must be between 1 and 255");		
    return true;
	}	
	return false;
}

<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
function checkStationNum(value, limit) 
{
	if (!isNumeric(value) || parseInt(value,10) < 0){
    //alert("Station Number value must be between 0 and " + limit);
	alert("Station Number value must bigger than 0 ");
		return true;
	}	
	return false;
}
<% End If %>

function checkRekeyinteral(value, flag) 
{
	if (!isNumeric(value)) {
		if(flag == 1){
			alert("WPA Group Rekey Interval : Non-integer value given"); 
		}else{
			alert("Key Renewal Interval : Non-integer value given");
		}
		return true;
	}
	if (value < 10 || value > 4194303) {
		if(flag == 1){
			alert("WPA Group Rekey Interval must be between 10 and 4194303");
		}else{
			alert("Key Renewal Interval must be between 10 and 4194303");
		}	
		return true;
	}	
	return false;
}

function quotationCheck(object, limit_len) {
	var len = object.value.length;
	var c;
	var i, j = 0;
  for (i = 0; i < len; i++)
  {
	 	var c = object.value.charAt(i);
	  if (c == '"')
		{
			j += 6;
		}
		else
			j++;
  }
 	if (j > limit_len-1)
	{
    alert('too many quotation marks!');		
    return true;
	}	
	return false;
}

function ValidateChecksum(PIN)
{
	var accum = 0;
	accum += 3 * (((PIN - PIN % 10000000) / 10000000) % 10);
	accum += 1 * (((PIN - PIN % 1000000) / 1000000) % 10);
	accum += 3 * (((PIN - PIN % 100000) / 100000) % 10);
	accum += 1 * (((PIN - PIN % 10000) / 10000) % 10);
	accum += 3 * (((PIN - PIN % 1000) / 1000) % 10);
	accum += 1 * (((PIN - PIN % 100) / 100) % 10);
	accum += 3 * (((PIN - PIN % 10) / 10) % 10);
	accum += 1 * (((PIN - PIN % 1) / 1) % 10);
	if ((accum % 10) == 0)
		return true;
	else
		return false;
}

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
//interface for future use
function ValidateChecksum_4(PIN)
{
	return true;
}

function ignoreSpaces(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split(" ");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}

function ignoreDash(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split("-");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}
<% end if %>

function doPINCodeCheck(object)
{
	var len= object.value.length;
	var ch;
<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1"  then %>
	if(len==9)
	{
		acutal_value=0;
		ch_4= object.value.charAt(4);
		if( ch_4 != ' ' & ch_4  != '-')
		{
				alert("WPS PIN code format error!");
				return false;
		}
		object.value = ignoreSpaces(object.value);
		object.value = ignoreDash(object.value);
		
		if (ValidateChecksum(Number(object.value)) == false)
		{
			alert("WPS PIN code checksum error!");
			return false;
		}
		return true;
	}

	if(len==8)
	{
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert('请输入8位数字PIN码!');
				return false;
			}
		}
		if (ValidateChecksum(Number(object.value)) == false){
			alert("WPS PIN code checksum error!");
			return false;		
		}
		return true;
	}

	if(len==4)
	{
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert('请输入8位数字PIN码!');
				return false;
			}
		}
		if (ValidateChecksum_4(Number(object.value)) == false)
		{
			alert("WPS PIN code checksum error!>");
			return false;
		}
		return true;
	}

	if(len==0)
	{
		return true;
	}

	alert("WPS PIN code format error!");
	return false;
<% end if %>

<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") <> "1"  then %>
	if (len > 0)
	{
		if(len < 8)
		{
				alert('请输入8位数字PIN码!');
			return;
		}
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert('请输入8位数字PIN码!');
				return;
			}
		}
		if (ValidateChecksum(Number(object.value)) == false)
		{
			alert("WPS PIN code checksum error!");
		}
		return;
	}
<% end if %>	
}
<% end if %>	
function SetCtlValue()
{		
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
		var Wlan11acMuOfdmaDl = getCheckVal('Wlan11acMuOfdmaDlEnable');
		if(Wlan11acMuOfdmaDl == 1)
		{
			setText('Wlan11acMuOfdmaDlEnable_flag', 1);
			setText('Wlan11acMuOfdmaUlEnable_flag', 1);
		}
		else
		{
			setText('Wlan11acMuOfdmaDlEnable_flag', 0);
			setText('Wlan11acMuOfdmaUlEnable_flag', 0);
		}
		var Wlan11acMuMimoDl = getCheckVal('Wlan11acMuMimoDlEnable');
		if(Wlan11acMuMimoDl == 1)
		{
			setText('Wlan11acMuMimoDlEnable_flag', 1);
			setText('Wlan11acMuMimoUlEnable_flag', 1);
		}
		else
		{
			setText('Wlan11acMuMimoDlEnable_flag', 0);
			setText('Wlan11acMuMimoUlEnable_flag', 0);
		}
		var wlan11acSR = getCheckVal('wlan11acSREnable');
		if(wlan11acSR == 1)
		{
			setText('Wlan11acSREnable_flag', 1);
		}
		else
		{
			setText('Wlan11acSREnable_flag', 0);
		}
<% end if %>
		 
}

function doSave(time){
    <% if tcWebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then %>
		var WirelessMode = document.ConfigForm.WirelessMode.value;
		var isWirelessMixed = "<% tcWebApi_get("WLan11ac_Common","isWirelessMixed","s") %>";
		if (1 == isWirelessMixed && WirelessMode != '14'
    <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
            && WirelessMode != '17'
    <% end if %>
            )
            {
                alert("all entry wirelessmode will change to 11111" + WirelessMode);
            }
            else if(0 == isWirelessMixed && (WirelessMode == 14
    <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
            || WirelessMode == 17
    <% end if %>
                )
            )
            {
                alert("all entry wirelessmode will change to " + WirelessMode);
            }		
    <% end if %>
	SetCtlValue();
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
	var ssidname = getValue('ESSID');
	var cur11acssidIdx = parseInt("<% tcWebApi_get("WebCurSet_Entry", "wlan_ac_id", "s") %>");
	<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
	var wlan11acssid = new Array("<% tcWebApi_get("WLan11ac_Entry0", "SSID", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry1", "SSID", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry2", "SSID", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry3", "SSID", "s") %>");
	<% end if %>
	
<% if tcwebApi_get("Mesh_common","CmccApMeshFlag","h") <> "1" then %>
	if ( cur11acssidIdx != 0 && 
<% if tcwebApi_get("WebCustom_Entry","isSSIDChineseSupported","h") <> "Yes" then %>
			ssidname != wlan11acssid[cur11acssidIdx]
<% else %>
			ssidname != WLanACSSID[cur11acssidIdx]
<% end if %>
			 )
	{
		alert("SSID"+(cur11acssidIdx+5)+"不允许修改名称!");
		setText('ESSID', WLanACSSID[cur11acssidIdx]);
		return false;
	}
<% end if %>

	var  WpaPskvalueold= new Array("<% tcWebApi_get("WLan11ac_Entry0", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry1", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry2", "WPAPSK", "s") %>",
								"<% tcWebApi_get("WLan11ac_Entry3", "WPAPSK", "s") %>");
	
	var acAutoMode =getValue('WEP_Selection');
	
	var acKey1 = new Array("<% tcWebApi_get("WLan11ac_Entry0", "Key1Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry1", "Key1Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry2", "Key1Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry3", "Key1Str", "s") %>");
	var acKey2 = new Array("<% tcWebApi_get("WLan11ac_Entry0", "Key2Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry1", "Key2Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry2", "Key2Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry3", "Key2Str", "s") %>");
	var acKey3 = new Array("<% tcWebApi_get("WLan11ac_Entry0", "Key3Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry1", "Key3Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry2", "Key3Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry3", "Key3Str", "s") %>");
	var acKey4 = new Array("<% tcWebApi_get("WLan11ac_Entry0", "Key4Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry1", "Key4Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry2", "Key4Str", "s") %>",
							"<% tcWebApi_get("WLan11ac_Entry3", "Key4Str", "s") %>");
<% if tcwebApi_get("Mesh_common","CmccApMeshFlag","h") <> "1" then %>
	if(acAutoMode == "WPAPSKWPA2PSK")
	{
		var WpaPskvalue3 = getValue('PreSharedKey3');

		if ( cur11acssidIdx != 0 && WpaPskvalue3 != WpaPskvalueold[cur11acssidIdx] )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			setText('PreSharedKey3', WpaPskvalueold[cur11acssidIdx]);
			return false;
		}
	}
	else if(acAutoMode == "WPAPSK")
	{
		var WpaPskvalue2 = getValue('PreSharedKey2');
		if( cur11acssidIdx != 0 && WpaPskvalue2 != WpaPskvalueold[cur11acssidIdx] )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			setText('PreSharedKey2', WpaPskvalueold[cur11acssidIdx]);
			return false;
		}
	}
	else if(acAutoMode == "WPA2PSK")
	{
		var WpaPskvalue1 = getValue('PreSharedKey1');
		if( cur11acssidIdx != 0 && WpaPskvalue1 != WpaPskvalueold[cur11acssidIdx] )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			setText('PreSharedKey1', WpaPskvalueold[cur11acssidIdx]);
			return false;
		}
	}
	else if(acAutoMode == "WEP-64Bits")
	{
		var acWEP_Key13 = getValue('WEP_Key13');
		var acWEP_Key23 = getValue('WEP_Key23');
		var acWEP_Key33 = getValue('WEP_Key33');
		var acWEP_Key43 = getValue('WEP_Key43');
		if ( cur11acssidIdx != 0 && (acWEP_Key13 != acKey1[cur11acssidIdx] || acWEP_Key23 != acKey2[cur11acssidIdx] || acWEP_Key33 != acKey3[cur11acssidIdx] || acWEP_Key43 != acKey4[cur11acssidIdx]) )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			if(acKey1[cur11acssidIdx] != "N/A")
				setText('WEP_Key13', acKey1[cur11acssidIdx]);
			else
				setText('WEP_Key13', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key23', acKey2[cur11acssidIdx]);
			else
				setText('WEP_Key23', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key33', acKey3[cur11acssidIdx]);
			else
				setText('WEP_Key33', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key43', acKey4[cur11acssidIdx]);
			else
				setText('WEP_Key43', "");
			return false;
		}		
	}
	else if(acAutoMode == "WEP-128Bits")
	{
		var acWEP_Key13 = getValue('WEP_Key14');
		var acWEP_Key23 = getValue('WEP_Key24');
		var acWEP_Key33 = getValue('WEP_Key34');
		var acWEP_Key43 = getValue('WEP_Key44');
		if ( cur11acssidIdx != 0 && (acWEP_Key13 != acKey1[cur11acssidIdx] || acWEP_Key23 != acKey2[cur11acssidIdx] || acWEP_Key33 != acKey3[cur11acssidIdx] || acWEP_Key43 != acKey4[cur11acssidIdx]) )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			if(acKey1[cur11acssidIdx] != "N/A")
				setText('WEP_Key14', acKey1[cur11acssidIdx]);
			else
				setText('WEP_Key14', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key24', acKey2[cur11acssidIdx]);
			else
				setText('WEP_Key24', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key34', acKey3[cur11acssidIdx]);
			else
				setText('WEP_Key34', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key44', acKey4[cur11acssidIdx]);
			else
				setText('WEP_Key44', "");
			return false;
		}		
	}
	else if(acAutoMode == "Radius-WEP64")
	{
		var acWEP_Key13 = getValue('WEP_Key11');
		var acWEP_Key23 = getValue('WEP_Key21');
		var acWEP_Key33 = getValue('WEP_Key31');
		var acWEP_Key43 = getValue('WEP_Key41');
		if ( cur11acssidIdx != 0 && (acWEP_Key13 != acKey1[cur11acssidIdx] || acWEP_Key23 != acKey2[cur11acssidIdx] || acWEP_Key33 != acKey3[cur11acssidIdx] || acWEP_Key43 != acKey4[cur11acssidIdx]) )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			if(acKey1[cur11acssidIdx] != "N/A")
				setText('WEP_Key11', acKey1[cur11acssidIdx]);
			else
				setText('WEP_Key11', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key21', acKey2[cur11acssidIdx]);
			else
				setText('WEP_Key21', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key31', acKey3[cur11acssidIdx]);
			else
				setText('WEP_Key31', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key41', acKey4[cur11acssidIdx]);
			else
				setText('WEP_Key41', "");
			return false;
		}		
	}
	else if(acAutoMode == "Radius-WEP128")
	{
		var acWEP_Key13 = getValue('WEP_Key12');
		var acWEP_Key23 = getValue('WEP_Key22');
		var acWEP_Key33 = getValue('WEP_Key32');
		var acWEP_Key43 = getValue('WEP_Key42');
		if ( cur11acssidIdx != 0 && (acWEP_Key13 != acKey1[cur11acssidIdx] || acWEP_Key23 != acKey2[cur11acssidIdx] || acWEP_Key33 != acKey3[cur11acssidIdx] || acWEP_Key43 != acKey4[cur11acssidIdx]) )
		{
			alert("SSID"+(cur11acssidIdx+5)+"不允许修改共享密钥！");
			if(acKey1[cur11acssidIdx] != "N/A")
				setText('WEP_Key12', acKey1[cur11acssidIdx]);
			else
				setText('WEP_Key12', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key22', acKey2[cur11acssidIdx]);
			else
				setText('WEP_Key22', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key32', acKey3[cur11acssidIdx]);
			else
				setText('WEP_Key32', "");
			if(acKey2[cur11acssidIdx] != "N/A")
				setText('WEP_Key42', acKey4[cur11acssidIdx]);
			else
				setText('WEP_Key42', "");
			return false;
		}		
	}
<% end if %>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(document.ConfigForm.SSID_INDEX.value==0){
    if(document.ConfigForm.WPSMode_Selection[0].checked)
    {
			var pincode = document.ConfigForm.WPSEnrolleePINCode;
			if((doPINCodeCheck(pincode) == false))
			{
			  return false;
			}
     }
	}
<% end if %>
<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then %>
	if(0 == WEPSelectIndex)	
	{
		return false;
	}
<% end if %>
	if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
		checkRTS(document.ConfigForm.RTSThreshold.value) ||
		checkFrag(document.ConfigForm.FragmentThreshold.value) ||
		checkDTIM(document.ConfigForm.DTIM.value)
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
		|| checkStationNum(document.ConfigForm.StationNum.value, document.ConfigForm.maxStaNum.value)
<% End If %>
	){
		return false;
	}
		
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	if(0 == mesh_save_check())
	{
		return false;
	}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
		if(document.ConfigForm.WEP_Selection.value == "WPA3PSK")
		{
				document.ConfigForm.hRekeyMethod.value = "TIME";
				if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA3)){
					return false;
				}
		}
		if(document.ConfigForm.WEP_Selection.value == "WPA2PSKWPA3PSK")
		{
				document.ConfigForm.hRekeyMethod.value = "TIME";
				if (wpapskCheck(document.ConfigForm.PreSharedKey_WPA2WPA3)){
					return false;
				}
		}
<% end if %>
	if(WEPSelectIndex == 3){ 
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey2)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey2, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval2.value, 0)){
			return false;
		}  			
	}

	if(WEPSelectIndex == 4){
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey1)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey1, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval1.value, 0)){
			return false;
		}  			
	}

	if(WEPSelectIndex == 5){
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey3)){
			return false;
		}
		
		if(quotationCheck(document.ConfigForm.PreSharedKey3, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval3.value, 0)){
			return false;
		}  			
	}
      	
	if(WEPSelectIndex == 1){ 
		document.ConfigForm.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.ConfigForm.WEP_Key13))||
		(!doKEYcheck(document.ConfigForm.WEP_Key23))||
		(!doKEYcheck(document.ConfigForm.WEP_Key33))||
		(!doKEYcheck(document.ConfigForm.WEP_Key43))){
			return false;
		}
	}
	
	if(WEPSelectIndex == 2){ 
		document.ConfigForm.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.ConfigForm.WEP_Key14))||
		(!doKEYcheck(document.ConfigForm.WEP_Key24))||
		(!doKEYcheck(document.ConfigForm.WEP_Key34))||
		(!doKEYcheck(document.ConfigForm.WEP_Key44))){
			return false;
		}
	}
	
	if(document.ConfigForm.isDot1XSupported.value==1)
	{	
		if(WEPSelectIndex == 6) 
		{
			if((!doKEYcheck(document.ConfigForm.WEP_Key11))||
			(!doKEYcheck(document.ConfigForm.WEP_Key21))||
			(!doKEYcheck(document.ConfigForm.WEP_Key31))||
			(!doKEYcheck(document.ConfigForm.WEP_Key41)))
			{
				return false;
			}
		}

		if(WEPSelectIndex == 7) 
		{
			if((!doKEYcheck(document.ConfigForm.WEP_Key12))||
			(!doKEYcheck(document.ConfigForm.WEP_Key22))||
			(!doKEYcheck(document.ConfigForm.WEP_Key32))||
			(!doKEYcheck(document.ConfigForm.WEP_Key42)))
			{
				return false;
			}
		}
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
		var vAuthMode = document.ConfigForm.WEP_Selection.selectedIndex + 1;
<% else %>
		var vAuthMode = document.ConfigForm.WEP_Selection.selectedIndex;
<% end if %>
		if((WEPSelectIndex == 6) || (WEPSelectIndex == 7) || (WEPSelectIndex == 8) || (WEPSelectIndex == 9)
		|| (WEPSelectIndex == 10))
		{
			if(document.ConfigForm.isDot1XEnhanceSupported.value == 0)
			{
				if(vAuthMode == 6){
					radiusip = document.ConfigForm.radiusSVR_IP1.value;
				}
				else if(vAuthMode == 7){
					radiusip = document.ConfigForm.radiusSVR_IP2.value;
				}
				else if(vAuthMode == 8){
					radiusip = document.ConfigForm.radiusSVR_IP3.value;
				}
				else if(vAuthMode == 9){
					radiusip = document.ConfigForm.radiusSVR_IP4.value;
				}
				else if(vAuthMode == 10){
					radiusip = document.ConfigForm.radiusSVR_IP5.value;
				}								
				
			 if(inValidIPAddr(radiusip))
			 {
				return false;
			 }
			}
			//serverport
			if(vAuthMode == 6){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port1.value);
				radiuskey = document.ConfigForm.radiusSVR_Key1.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter1.value;
			}
			else if(vAuthMode == 7){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port2.value);
				radiuskey = document.ConfigForm.radiusSVR_Key2.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter2.value;
			}
			else if(vAuthMode == 8){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port3.value);
				radiuskey = document.ConfigForm.radiusSVR_Key3.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter3.value;
			}
			else if(vAuthMode == 9){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port4.value);
				radiuskey = document.ConfigForm.radiusSVR_Key4.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter4.value;
			}
			else if(vAuthMode == 10){
				radiusport = parseInt(document.ConfigForm.radiusSVR_Port5.value);
				radiuskey = document.ConfigForm.radiusSVR_Key5.value;
				session_timeout_interval = document.ConfigForm.radiusSVR_ReAuthInter5.value;
			}
			if(isNaN(radiusport) || radiusport < 0 || radiusport > 65535)
			{	
				alert("adius Server Port number's range: 0 ~ 65535");
				return false;
			}
			
			// radius share key
			{
				if (radiuskey.length == 0)
				{
  					alert("Radius Share secret can not be empty"); 
  					return false; 
				}
			}

			{
				if (session_timeout_interval.length == 0)
				{
  					alert("Re-auth Interval can not be empty"); 
  					return false; 
				}
			}
   	}

		if((WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10))
		{
			if(vAuthMode == 8){
				WPARekeyInter = document.ConfigForm.WPARekeyInter3.value;
			}
			else if(vAuthMode == 9){
				WPARekeyInter = document.ConfigForm.WPARekeyInter4.value;
			}
			else if(vAuthMode == 10){
				WPARekeyInter = document.ConfigForm.WPARekeyInter5.value;
			}
			
			if(checkRekeyinteral(WPARekeyInter, 1)){
				return false;	
			}
   	}
	}
	
	//if wds support meantime AuthMode of MAIN SSID is wpa2psk,wpapsk WPAPSKWPA2PSK , then check wds key 
	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
		{
			if(document.ConfigForm.isDot1XSupported.value==1)
			{
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5)
				|| (WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10))
				{
					if (WDSKeyCheck(document.ConfigForm.WDS_Key))
					{
						return false;
					}
			
					if(quotationCheck(document.ConfigForm.WDS_Key, 385) )
					{
						return false;	 
					}  			
				}	
			}
			else
			{
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5))
				{
					if (WDSKeyCheck(document.ConfigForm.WDS_Key))
					{
						return false;
					}
					if(quotationCheck(document.ConfigForm.WDS_Key, 385) )
					{
						return false;	 
					}  			
				}	
			}
		}
	}
	if(!strESSIDCheck(document.ConfigForm.ESSID)){
		return false;	   
	}

	document.ConfigForm.wlanWEPFlag.value = 3;
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=2){
			document.ConfigForm.Is11acMode.value=1;
		}else{
			document.ConfigForm.Is11acMode.value=0;
		}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
			document.ConfigForm.Wlan_HTBW40M.value = 1;
			document.ConfigForm.WLANChannelBandwidth.value = 1;
		}
		else if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2){
			document.ConfigForm.Wlan_HTBW40M.value = 0;
			document.ConfigForm.WLANChannelBandwidth.value = 1;
		}
		else{
			document.ConfigForm.WLANChannelBandwidth.value = 0;
		}
<% end if %>	
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
	doVHTTxBeamFormingChange();
	if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 3) && (document.ConfigForm.WLan11acVHTChannelBandwidth.options[3].selected == true) && (document.ConfigForm.Channel_ID.selectedIndex != 0))
	{
		setVHTbwChannel();
	}
<% end if %>

    if(document.ConfigForm.WEP_Selection.value == 'OPEN') {
        setText('auth_5', 'OPEN');
    }
    else {
        setText('auth_5', 'WPAPSKWPA2PSK');
    }
	
    ajax_submit(time);
}

function ajax_submit(time) {
    var params=$('form').serialize(); //把form表单里的参数自动封装为参数传递

    $.ajax({  
        type: "POST",   //提交的方法
        url: "/cgi-bin/asp_submit_wifi_5.asp", //提交的地址  
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

function ajax_wps_submit(time) {
    var params=$('form').serialize(); //把form表单里的参数自动封装为参数传递

    $.ajax({  
        type: "POST",   //提交的方法
        url: "/cgi-bin/asp_submit_wps_5.asp", //提交的地址  
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


function checkSelectedKEY(){
	var group;
	var curCBX;
	var vAuthMode = document.ConfigForm.WEP_Selection.value;
	if(vAuthMode == "Radius-WEP64"){
		group = document.ConfigForm.DefWEPKey1;
	}
	else if(vAuthMode == "Radius-WEP128"){
		group = document.ConfigForm.DefWEPKey2;
	}
	else if(vAuthMode == "WEP-64Bits"){
		group = document.ConfigForm.DefWEPKey3;
	}
	else if(vAuthMode == "WEP-128Bits"){
		group = document.ConfigForm.DefWEPKey4;
	}

	for (var i=0; i<group.length; i++){
		if (group[i].checked)
		break;
	}
	
	if(vAuthMode == "Radius-WEP64"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key11;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key21;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key31;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key41;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "Radius-WEP128"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key12;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key22;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key32;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key42;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-64Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key13;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key23;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key33;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key43;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-128Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key14;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key24;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key34;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key44;
			break;
		default:
		  ;
		}
	}
	
	len=curCBX.value.length;
	index = curCBX.value.indexOf("0x");

	if(WEPSelectIndex==1)/*wep 64*/
	{
		if(len==5)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==10)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==12)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
	else if(WEPSelectIndex==2)/*wep 128*/
	{
		if(len==13)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==26)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==28)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
}

function checkFocus(value){
	if(WEPSelectIndex == 0){
		document.ConfigForm.WEP_Selection.focus();
	}
}

function autoWLAN_WDS_Active()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = false;
		document.ConfigForm.WDS_Key.disabled = false;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = false;
}	

function autoWLAN_WDS_Deactive()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = true;
		document.ConfigForm.WDS_Key.disabled = true;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = true;
}

function InsExtChOpt(CurrCh)
{
	var ExtChann = document.ConfigForm.ExtChannFlag;
	if ((1*CurrCh >= 36) && (1*CurrCh <= 64))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 9;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 100) && (1*CurrCh <= 136))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 17;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 149) && (1*CurrCh <= 161))
	{
			CurrCh = 1*CurrCh;
			CurrCh -= 1;
			CurrCh /= 4;
			CurrCh -= 19;

			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else
	{
			ExtChann.value = 0;
	}
	return ExtChann.value;
}

function doloadSSID2()
{
	if(document.ConfigForm.SSID_INDEX.selectedIndex == 1)
	{
		var j;
		var frm = document.ConfigForm;
		for(j = 0; j < frm.elements.length; j++)
		{	
			if(frm.elements[j].type != "hidden")		
				frm.elements[j].disabled = true;
		}
	}
	document.ConfigForm.SSID_INDEX.disabled = false;
}

function isNumeric(s)
{
  var len = s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}

function SelectValue(o,v){
	for(var i=0; i<o.options.length; i++)
		if(o.options[i].value == v){
		o.options[i].selected=true;
		break;
	}
}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
function doWirelessTxStreamChange(){
	var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
	var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;

	for(var i=0; i<length; i++)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);

	document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("0/40 MHz", "0");
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
	if(document.ConfigForm.TxStream_Action.selectedIndex == 3)
	{
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
	}
	if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
	else
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
	VHTBandwidthRefreshPage();		
}

function doWirelessRxStreamChange(){
	var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
	var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;

	for(var i=0; i<length; i++)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);

	document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("20/40 MHz", "0");
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
	if(document.ConfigForm.RxStream_Action.selectedIndex == 3)
	{
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
	}
	if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
	else
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
	VHTBandwidthRefreshPage();		
}
<%end if%>

var cfg_menu_list  = new Array( 'WLAN5G基本配置', 'WLAN5G高级配置' );
var cfg_cookie_name = 'sta-network-menu';
init_l_menu();
</SCRIPT>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0" >
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
	<div class="in_welcom" onclick="top.location.href='/'">
		<span>您好！</span>
		<a>
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="网络->WLAN 5G配置" name="Selected_Menu"></TD>
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
		<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
		<TBODY>
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD">
					<li name="WLAN5GBasicConfig" id="WLAN5G基本配置">5G 基本配置</li>
                    <% if tcWebApi_get("WLan11ac_Common", "APOn","h") <> "0" then %>
                        <li name="WLAN5GAdvanceConfig" id="WLAN5G高级配置">5G 高级配置</li>
                    <% end if %>
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top">
				<TABLE <% if tcWebApi_get("Wlan11ac_Entry","WPSMode","h") = "0" then %> style="display:none" <% end if %> id="mainContant">
				<TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top">
						<FORM name=ConfigForm action="/cgi-bin/net-wlan11ac.asp" method="post" >
						<div style="display:none;" id="WLAN5G基本配置_item">
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                                <TBODY>
                                    <TR>
                                        <TD>
                                            <div class="advanceTitle">5G 基本配置</div>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD>
                                            <div class="title-line"></div>
                                        </TD>
                                    </TR>
                                <TR>
								<TD>
									<INPUT TYPE="HIDDEN" NAME="SaveWlEnb_Flag" value="0">
                                    <INPUT TYPE="HIDDEN" NAME="auth_5" value="<% tcWebApi_get("Wlan11ac_Entry3","AuthMode","s") %>">	
									<INPUT TYPE="HIDDEN" NAME="wlanWEPFlag" VALUE="0" >
									<INPUT TYPE="HIDDEN" NAME="CountryChange" VALUE="0" >
									<INPUT TYPE="HIDDEN" NAME="WDS_EncrypType_NONE" value="NONE" >
									<INPUT TYPE="HIDDEN" NAME="WDS_EncrypType_WEP" value="WEP" >
									<INPUT TYPE="HIDDEN" NAME="BasicRate_Value1" VALUE="15" >
									<INPUT TYPE="HIDDEN" NAME="BasicRate_Value2" VALUE="3" >
									<INPUT TYPE="HIDDEN" NAME="BasicRate_Value3" VALUE="351" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand0" value="0" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand1" value="1" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand2" value="2" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand3" value="3" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand4" value="4" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand5" value="5" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand6" value="6" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand7" value="7" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand8" value="8" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand9" value="9" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand10" value="10" >
									<INPUT TYPE="HIDDEN" NAME="CountryRegionABand11" value="11" >
                                    <INPUT TYPE="HIDDEN" NAME="wlan_APon" value="<% tcWebApi_get("WLan11ac_Common","APOn","s") %>">
									<INPUT TYPE="HIDDEN" NAME="HTMCSAUTO" value="33" >
									<INPUT TYPE="HIDDEN" NAME="HTBW" value="0" >
									<INPUT TYPE="HIDDEN" NAME="VHTBW" value="0" >
									<INPUT TYPE="HIDDEN" NAME="RTDEVICE" value="<% tcWebApi_get("WLan11ac_Common","rt_device","s") %>" >
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
									<INPUT TYPE="HIDDEN" NAME="VHTSec80Channel" value="<% tcWebApi_get("WLan11ac_Common","VHT_Sec80_Channel","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="WLan11acITxBfEn" value="<% tcWebApi_get("WLan11ac_Common","ITxBfEn","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="WLan11acETxBfEnCond" value="<% tcWebApi_get("WLan11ac_Common","ETxBfEnCond","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="WLan11acETxBfIncapable" value="<% tcWebApi_get("WLan11ac_Common","ETxBfIncapable","s") %>" >
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
									<INPUT TYPE="HIDDEN" NAME="Wlan_HTBW40M" value="<% tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","s") %>" >
<% end if %>
									<INPUT TYPE="HIDDEN" NAME="Is11nMode" value="<% tcWebApi_get("WLan11ac_Common","11nMode","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="Is11acMode" value="<% tcWebApi_get("WLan11ac_Common","11acMode","s") %>" >														
									<INPUT TYPE="HIDDEN" NAME="CountryName" value="<% tcWebApi_get("WLan11ac_Common","Country","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="ExtChannFlag" value="<% tcWebApi_get("WLan11ac_Common","HT_EXTCHA","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="BssidNum" value="<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="hCountryRegionABand" value="<% tcWebApi_get("WLan11ac_Common","CountryRegionABand","s") %>" >
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
									<INPUT TYPE="HIDDEN" NAME="WPSConfigured" value="2" >
									<INPUT TYPE="HIDDEN" NAME="WpsConfModeAll" value="7" >
									<INPUT TYPE="HIDDEN" NAME="WpsConfModeNone" value="0" >
									<INPUT TYPE="HIDDEN" NAME="WpsStart" value="0" >
									<INPUT TYPE="HIDDEN" NAME="WpsOOB" value="0" >
									<INPUT TYPE="HIDDEN" NAME="WpsGenerate" value="0" >
<% end if %>
									<INPUT TYPE="HIDDEN" NAME="maxStaNum" value="<% tcWebApi_get("Info_WLan11ac","maxStaNumSupported","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="isAuthenTypeSupported" value="<% if tcWebApi_get("Info_WLan11ac","isAuthenTypeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="isWDSSupported" value="<% if tcWebApi_get("Info_WLan11ac","isWDSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="bharti_ssid2" value="<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="wlan_VC" value="<% tcWebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>" >
									<INPUT TYPE="HIDDEN" NAME="isWPSSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="isPerSSIDSupport" value="<% if tcWebApi_get("WebCustom_Entry","isPerSSIDSupport","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="WscV2Support" value="<% if tcWebApi_get("WLan11ac_Entry","WscV2Support","h") = "1" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" NAME="hRekeyMethod" value="DISABLE" >

<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7915" then %>
									<INPUT TYPE="HIDDEN" ID="is11AXModeSupported" NAME="is11AXModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
									<INPUT TYPE="HIDDEN" ID="isWPA3ModeSupported" NAME="isWPA3ModeSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<% end if %>
																	
									<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
									<TBODY>
										<TR>
											<TD>
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
												<TBODY>
										<TR class='hide'>
										<TD class='w-130'><div class="form-text"><p>功能开关</p></TD>
										<TD>
											<INPUT TYPE="RADIO" NAME="wlan_APenable" VALUE="1" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %> >开启   
											<INPUT TYPE="RADIO" NAME="wlan_APenable" VALUE="0" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "0" then asp_Write("checked") end if %> <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "N/A" then asp_Write("checked") end if %> >关闭
										</TD>
										</TR>
										<TR class="hide">
										<TD class='w-130'><div class="form-text"><p>无线总开关</p></TD>
										<TD><INPUT class="input-onoff" type=checkbox name="wlanac_APenable_h" onclick="APenable('0')" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %>>
										</TD>
										</TR>
										<TR id="wlanac_enbl">
										<TD class='w-130'><div class="form-text"><p>Wi-Fi 开关</p></TD>
										<TD><INPUT class="input-onoff" type=checkbox name="wlanac_AP5enable_h" onclick="APenable('1')" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %>>
										</TD>
										</TR>
                                        <!-- <TR id="wlanac_hide">
										<TD class='w-130'><div class="form-text"><p>隐藏Wi-Fi</p></TD>
										<TD><INPUT class="input-onoff" type=checkbox name="wlanac_AP5hide_h" onclick="APenable('2')" <% if tcWebApi_get("WLan11ac_Common","APHide","h") = "1" then asp_Write("checked") end if %>>
                                            <INPUT TYPE="HIDDEN" name="WLAN11acAPHide" value="<% if tcWebApi_get("Wlan11ac_Common","APHide","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","APHide","s") end if %>" >
										</TD>
										</TR>
                                        -->
										</TBODY>
										</TABLE>
									</TD>
									</TR>
									</TBODY>
									</TABLE>
									<TABLE id="wlacInfoTab" cellSpacing=0 cellPadding=0 width="100%" border=0 >
									<TBODY>
										<TR>
											<TD>
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
												<TBODY>
<% if tcWebApi_get("WebCustom_Entry","isPerSSIDSupport","h") = "Yes"  then %>

									<TR>
                  	<TD class='w-130'><div class="form-text">SSID</div></TD>
                  	<TD ><INPUT class="input-onoff" type=checkbox name="ESSID_Enable_Selection_h" onclick=PERESSIDenable() <% if tcWebApi_get("Wlan11ac_Entry","EnableSSID","h") = "1" then asp_Write("checked") end if %>>
                     </TD>
                  </TR>
									<TR class='hide'>
										<TD class='w-130'><div class="form-text">PerSSID使能</div></TD>
										<TD>
										<INPUT TYPE="RADIO" NAME="ESSID_Enable_Selection" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","EnableSSID","h") = "1" then asp_Write("checked") end if %> >开启
										<INPUT TYPE="RADIO" NAME="ESSID_Enable_Selection" VALUE="0" <% If tcWebApi_get("Wlan11ac_Entry","EnableSSID","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","EnableSSID","h") = "N/A" then asp_Write("checked") end if %> >关闭
										</TD>
									</TR>
<% end if %>	
<% if tcWebApi_get("WLan11ac_Common","BssidNum","h") = "1" then %>												
													<TR id=trSSID class="hide">
														<TD class='w-130'><div class="form-text">SSID索引</div></TD>
														<TD>
														<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
															<OPTION value="0" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then asp_write("selected") end if %> >SSID5</OPTION>
														</select>
														</TD>
													</TR>
<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "2" then %>
													<TR id=trSSID class="hide">
														<TD class='w-130'><div class="form-text">SSID索引</div></TD>
														<TD>
														<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
														<OPTION value="0" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then asp_write("selected") end if %> >SSID5</OPTION>
<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
														<OPTION value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "1" then asp_write("selected") end if %> >SSID6(组网回传网络)</OPTION>
<% end if %>
<% end if %>
<% end if %>
														</select>
														</TD>
													</TR>
<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "3" then %>
													<TR id=trSSID class="hide">
														<TD class='w-130'><div class="form-text">SSID索引</div></TD>
														<TD>
														<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
														<OPTION value="0" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then asp_write("selected") end if %> >SSID5</OPTION>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
														<OPTION value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "1" then asp_write("selected") end if %> >SSID6(组网回传网络)</OPTION>
<% end if %>
														<OPTION value="2" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "2" then asp_write("selected") end if %> >SSID7(访客网络)</OPTION>
<% end if %>
<% end if %>
														</select>
														</TD>
													</TR>
<% elseif tcWebApi_get("WLan11ac_Common","BssidNum","h") = "4" then %>
													<TR id=trSSID>
														<TD class='w-130'><div class="form-text">SSID索引</div></TD>
														<TD>
														<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
														<OPTION value="0" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then asp_write("selected") end if %> >SSID5</OPTION>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
														<OPTION value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "1" then asp_write("selected") end if %> >SSID6(组网回传网络)</OPTION>
<% end if %>
														<OPTION value="2" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "2" then asp_write("selected") end if %> >SSID7(访客网络)</OPTION>
														<OPTION value="3" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "3" then asp_write("selected") end if %> >SSID8(WIFI5兼容)</OPTION>
<% end if %>
<% end if %>
														</select>
														</TD>
													</TR>
<% end if %>
													<TR>
														<TD class='w-130'><div class="form-text">Wi-Fi 名称</div></TD>
														<TD><INPUT TYPE="TEXT" NAME="ESSID" MAXLENGTH="32" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","SSID","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","SSID","s") end if %>"></TD>
                                                        <script>
                                                            if(meshEbl == 1 && devRole == 2) {
                                                                document.ConfigForm.ESSID.disabled = true;
                                                            }
                                                        </script>
													</TR>													
										        
												</TBODY>
												</TABLE>															

												<TABLE cellSpacing=0 cellPadding=0 border=0 >
												<TBODY>
<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>							
												<TR>
													<TD class='w-130'><div class="form-text">认证模式</div></TD>
													<TD>
													<div id="WEP_Selection_div">
													<SELECT NAME="WEP_Selection" SIZE="1" onChange="doWEPChange()">
                                                    <script>
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.WEP_Selection.disabled = true;
                                                        }
                                                    </script>
<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then %>
													<OPTION value="OPEN" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %> >OPEN</OPTION>
<% elseif tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
<% else %>
													<OPTION value="OPEN" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %> >OPEN</OPTION>
<% end if %>
													<OPTION value="WPAPSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>  >WPA-PSK</OPTION>
													<OPTION value="WPA2PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %> >WPA2-PSK</OPTION>
													<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %> >WPA-PSK/WPA2-PSK</OPTION>			
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
													<OPTION value="WPA3PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA3PSK" then asp_Write("selected") end if %>>WPA3-PSK</OPTION>
													<OPTION value="WPA2PSKWPA3PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA2PSKWPA3PSK" then asp_Write("selected") end if %>>WPA2-PSK/WPA3-PSK</OPTION>		
<% end if %>
													</SELECT>
													</div>
													<div id="WEP_Selection_show_div"> 
													<select name="WEP_Selection_show" SIZE="1" >
													<option <% if tcWebApi_get("Info_WLan11ac","isAuthenTypeSupported","h") = "Yes" then asp_Write("selected") elseif tcWebApi_get("Info_WLan11ac","isAuthenTypeSupported","h") = "N/A" then asp_Write("selected") end if %> >WPA2</option>
													</select>
													</div>
													</TD>
												</TR>
<% else %>  	
												<TR>
													<TD class='w-130'><div class="form-text">认证模式</div></TD>
													<TD>
													<SELECT NAME="WEP_Selection" SIZE="1" onChange="doWEPChange()">
                                                    <script>
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.WEP_Selection.disabled = true;
                                                        }
                                                    </script>
<% if tcWebApi_get("Info_WLan11ac","isbharti","h") <> "Yes" then %>
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>	
<% else %>
													<OPTION value="OPEN" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>>OPEN</OPTION>
<% end if %>	
<% end if %>
													<OPTION value="WPAPSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>>WPA-PSK</OPTION>
													<OPTION value="WPA2PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>>WPA2-PSK</OPTION>
													<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %>>WPA-PSK/WPA2-PSK</OPTION>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
													<OPTION value="WPA3PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA3PSK" then asp_Write("selected") end if %>>WPA3-PSK</OPTION>
													<OPTION value="WPA2PSKWPA3PSK" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA2PSKWPA3PSK" then asp_Write("selected") end if %>>WPA2-PSK/WPA3-PSK</OPTION>		
<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
													<OPTION value="WPA3" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA3" then asp_Write("selected") end if %>>WPA3</OPTION>		
													<OPTION value="WPA3-192Bit" <% if tcWebApi_get("Wlan11ac_Entry","AuthMode","h") = "WPA3-192Bit" then asp_Write("selected") end if %>>WPA3-192Bit</OPTION>		
<% end if %>
<% end if %>
													</SELECT>
													</TD>
												</TR>
<% end if %>						  	  		  		            		            		            		            	        
											</TBODY>
											</TABLE>
		            		            		            		            	        		 	

											<div id="WPA2PSK_div">
											<TABLE cellSpacing=0 cellPadding=0 border=0 >
											<TBODY>   		        
												<TR>
													<TD class='w-130'><div class="form-text">加密方式</div></TD>
													<TD>
													<SELECT NAME="TKIP_Selection4" onChange="doEncryptionChange(this)" SIZE="1">
														<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</OPTION>
														<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> >TKIP</OPTION>
														<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP+AES</OPTION>
													</SELECT>
                                                    <script>
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.TKIP_Selection4.disabled = true;
                                                        }
                                                    </script>
													</TD>
												</TR>  	
												<TR>
													<TD><div class="form-text">预共享密钥</div></TD>
													<TD><span id="inpsw1" style="position: relative;"><INPUT TYPE="PASSWORD" ID="PreSharedKey1" NAME="PreSharedKey1" SIZE="48" MAXLENGTH="64" VALUE='<% If tcWebApi_get("Wlan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WPAPSK","s") end if %>' onkeyup="doshowStrongChange1(this.value)">
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw1" data-flag=0 onclick="doshowpswChange1()"></div>
                                                    </span>
													<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
													
													<script language="JavaScript" type="text/JavaScript">
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.PreSharedKey1.disabled = true;
                                                        }
                                                       
													function doshowpswChange1() {
                                                        clearTimeout(changeTimer1);
														with (getElById('ConfigForm')){
                                                            var flag = getElById('cb_enablshowpsw1').getAttribute('data-flag');
															if (flag==0) {
                                                                getElById("PreSharedKey1").setAttribute("type", "text");
                                                                getElById("cb_enablshowpsw1").setAttribute("data-flag", "1");
                                                            }
                                                            else {
                                                                getElById("PreSharedKey1").setAttribute("type", "password");
                                                                getElById("cb_enablshowpsw1").setAttribute("data-flag", "0");
                                                            }
															inpsw1des.innerHTML = '<TD></TD><TD><div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>';
                                                            inpsw1des.style.display = "";
														}
													
													}
													
													</script>
													<%end if%>
													</TD>
												</TR>
                                                <TR id="strength_label1" style="display: none;">
                                                    <TD></TD>
                                                    <TD class='w-130'><P class="pwd-tips">密码强度：<span></span></P></TD>
                                                </TR>
                                                <TR id="inpsw1des" style="display: none;"></TR>
												<TR class='hide'>
													<TD><TD><div class="form-text">密钥更新周期</div></TD>
													<TD>
													<INPUT TYPE="TEXT" id="keyRenewalInterval1" NAME="keyRenewalInterval1" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)"> (0 ~ 4194303)秒
													<script language="JavaScript" type="text/JavaScript">
														var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
														if("N/A" == rekeystr || "" == rekeystr)
															document.getElementById('keyRenewalInterval1').value = "3600";
														else
															document.getElementById('keyRenewalInterval1').value = rekeystr;
													</script>
													</TD>
												</TR>
											</TBODY>
											</TABLE>
											</div>
											<div id="WPAPSK_div">
											<TABLE cellSpacing=0 cellPadding=0 border=0 >
											<TBODY>
												<TR>
													<TD class='w-130'><div class="form-text">加密方式</div></TD>
													<TD>
													<SELECT NAME="TKIP_Selection5" onChange="doEncryptionChange(this)" SIZE="1">
														<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</OPTION>
														<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> >TKIP</OPTION>
														<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP+AES</OPTION>
													</SELECT>
                                                    <script>
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.TKIP_Selection5.disabled = true;
                                                        }
                                                    </script>
													</TD>
												</TR>  	
												<TR>
													<TD><div class="form-text">预共享密钥</div></TD>
													<TD><span id="inpsw2" style="position: relative;"><INPUT TYPE="PASSWORD" ID="PreSharedKey2" NAME="PreSharedKey2" SIZE="48" MAXLENGTH="64" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WPAPSK","s") end if %>" onkeyup="doshowStrongChange2(this.value)">
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw2" data-flag=0 onclick="doshowpswChange2()"></div>
                                                    </span>
													<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
													<script language="JavaScript" type="text/JavaScript">
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.PreSharedKey2.disabled = true;
                                                        }
													function doshowpswChange2() {
                                                        clearTimeout(changeTimer2);
														with (getElById('ConfigForm')){
															var flag = getElById('cb_enablshowpsw2').getAttribute('data-flag');
															if (flag==0) {
                                                                getElById("PreSharedKey2").setAttribute("type", "text");
                                                                getElById("cb_enablshowpsw2").setAttribute("data-flag", "1");
                                                            }
                                                            else {
                                                                getElById("PreSharedKey2").setAttribute("type", "password");
                                                                getElById("cb_enablshowpsw2").setAttribute("data-flag", "0");
                                                            }
															inpsw2des.innerHTML = '<TD></TD><TD><div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>';
                                                            inpsw2des.style.display = "";
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
                                                <TR id="inpsw2des" style="display: none;"></TR>
												<TR class='hide'>
													<TD><TD><div class="form-text">密钥更新周期</div></TD>
													<TD><INPUT TYPE="TEXT" id="keyRenewalInterval2" NAME="keyRenewalInterval2" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)"> (0 ~ 4194303)秒
													<script language="JavaScript" type="text/JavaScript">
														var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
														if("N/A" == rekeystr || "" == rekeystr)
															document.getElementById('keyRenewalInterval2').value = "3600";
														else
															document.getElementById('keyRenewalInterval2').value = rekeystr;
													</script>
													</TD>
												</TR>  
											</TBODY>
											</TABLE>
											</div>
											<div id="WPAPSKWPA2PSK_div">
											<TABLE cellSpacing=0 cellPadding=0 border=0 >
											<TBODY>
                                                <TR>
													<TD class='w-130'><div class="form-text">加密方式</div></TD>
													<TD>
													<SELECT NAME="TKIP_Selection6" onChange="doEncryptionChange(this)" SIZE="1">
														<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</OPTION>
														<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> >TKIP</OPTION>
														<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP+AES</OPTION>
													</SELECT>
                                                    <script>
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.TKIP_Selection6.disabled = true;
                                                        }
                                                    </script>
													</TD>
												</TR>  	
												<TR>
													<TD><div class="form-text">预共享密钥</div></TD>
													<TD><span id="inpsw3" style="position: relative;"><INPUT TYPE="PASSWORD" ID="PreSharedKey3" NAME="PreSharedKey3" SIZE="48" MAXLENGTH="64" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WPAPSK","s") end if %>">
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw3" data-flag=0 onclick="doshowpswChange3()"></div>
                                                    </span>
													<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
													<script language="JavaScript" type="text/JavaScript">
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.PreSharedKey3.disabled = true;
                                                        }
													function doshowpswChange3() {
														with (getElById('ConfigForm')){
                                                            var flag = getElById('cb_enablshowpsw3').getAttribute('data-flag');
															if (flag==0) {
                                                                getElById("PreSharedKey3").setAttribute("type", "text");
                                                                getElById("cb_enablshowpsw3").setAttribute("data-flag", "1");
                                                            }
                                                            else {
                                                                getElById("PreSharedKey3").setAttribute("type", "password");
                                                                getElById("cb_enablshowpsw3").setAttribute("data-flag", "0");
                                                            }
															inpsw3des.innerHTML = '<TD></TD><TD><div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>';
                                                            inpsw3des.style.display = "";
														}
													
													}
													
													</script>
													<% end if %>
													</TD>
												</TR>
                                                <TR id="inpsw3des" style="display: none;"></TR>

												<TR class='hide'>
													<TD><TD><div class="form-text">密钥更新周期</div></TD>
													<TD>
													<INPUT TYPE="TEXT" id="keyRenewalInterval3" NAME="keyRenewalInterval3" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)"> (0 ~ 4194303)秒
													<script language="JavaScript" type="text/JavaScript">
														var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
														if("N/A" == rekeystr || "" == rekeystr)
															document.getElementById('keyRenewalInterval3').value = "3600";
														else
															document.getElementById('keyRenewalInterval3').value = rekeystr;
													</script>
													</TD>
												</TR>  
											</TBODY>
											</TABLE>
											</div>
<% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %> 
<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>
											<div id="WPA3_div">	
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
													<TBODY>					
														<TR>
															<TD width="130"><div class="form-text">Radius 服务器地址</div></TD>
															<TD><input id="WPA3_radiusSVR_IP" name="WPA3_radiusSVR_IP" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
														</TR>
														<TR>
															<TD><div class="form-text">Radius 服务器端口</div></TD>
															<TD><input id="WPA3_radiusSVR_Port" name="WPA3_radiusSVR_Port" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
														</TR>
														<TR>
															<TD><div class="form-text">Radius 共享密钥</div></TD>
															<TD><input id="WPA3_radiusSVR_Key" name="WPA3_radiusSVR_Key" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
														</TR>
										<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
														<TR>
															<TD><div class="form-text">备用服务器地址</div></TD>
															<TD><input id="WPA3_bakradiusSVR_IP" name="WPA3_bakradiusSVR_IP" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
														</TR> 
															<TR>
																<TD><div class="form-text">备用服务器端口</div></TD>
																<TD><input id="WPA3_bakradiusSVR_Port" name="WPA3_bakradiusSVR_Port" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
															</TR>
														<TR>
															<TD><div class="form-text">备用分享密码</div></TD>
															<TD><input id="WPA3_bakradiusSVR_Key" name="WPA3_bakradiusSVR_Key" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
														</TR> 
										<% end if %>						
														<TR>
															<TD><div class="form-text">重复认证间隔</div></TD>
															<TD><input type="text" id="WPA3_radiusSVR_ReAuthInter3" name="WPA3_radiusSVR_ReAuthInter3" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
														</TR>
														<TR>
															<TD><div class="form-text">加密方式</div></TD>
															<TD>
																<SELECT ID="WPA3_TKIP_Selection1" NAME="WPA3_TKIP_Selection1" onChange="doEncryptionChange(this)" SIZE="1">
																	<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %> >AES</OPTION>
																</SELECT>
                                                                <script>
                                                                    if(meshEbl == 1 && devRole == 2) {
                                                                        document.ConfigForm.WPA3_TKIP_Selection1.disabled = true;
                                                                    }
                                                                </script>
															</TD>
														</TR>
														<TR>
														<TD><div class="form-text">WPA组密钥更新间隔</div></TD>
															<TD>
																<input type="text" id="WPA3_WPARekeyInter" name="WPA3_WPARekeyInter" size="7" maxlength="7" >
																<div class="form-text"> 秒</font>
																<script language="JavaScript" type="text/JavaScript">
																	var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
																	if("N/A" == rekeystr || "" == rekeystr)
																		document.getElementById('WPA3_WPARekeyInter').value = "3600";
																	else
																		document.getElementById('WPA3_WPARekeyInter').value = rekeystr;
																</script>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</div>   
											<div id="WPA3_192Bit_div">	
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
													<TBODY>					
														<TR>
															<TD width="130"><div class="form-text">Radius 服务器地址</div></TD>
															<TD><input id="WPA3_192Bit_radiusSVR_IP" name="WPA3_192Bit_radiusSVR_IP" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
														</TR>
														<TR>
															<TD><div class="form-text">Radius 服务器端口</div></TD>
															<TD><input id="WPA3_192Bit_radiusSVR_Port" name="WPA3_192Bit_radiusSVR_Port" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
														</TR>
														<TR>
															<TD><div class="form-text">Radius 共享密钥</div></TD>
															<TD><input id="WPA3_192Bit_radiusSVR_Key" name="WPA3_192Bit_radiusSVR_Key" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
														</TR>
										<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
														<TR>
															<TD><div class="form-text">备用服务器地址</div></TD>
															<TD><input id="WPA3_192Bit_bakradiusSVR_IP" name="WPA3_192Bit_bakradiusSVR_IP" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
														</TR> 
															<TR>
																<TD><div class="form-text">备用服务器端口</div></TD>
																<TD><input id="WPA3_192Bit_bakradiusSVR_Port" name="WPA3_192Bit_bakradiusSVR_Port" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
															</TR>
														<TR>
															<TD><div class="form-text">备用分享密码</div></TD>
															<TD><input id="WPA3_192Bit_bakradiusSVR_Key" name="WPA3_192Bit_bakradiusSVR_Key" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
														</TR> 
										<% end if %>						
														<TR>
															<TD><div class="form-text">重复认证间隔</div></TD>
															<TD><input type="text" id="WPA3_192Bit_radiusSVR_ReAuthInter" name="WPA3_192Bit_radiusSVR_ReAuthInter" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
														</TR>
														<TR>
															<TD><div class="form-text">加密方式</div></TD>
															<TD>
																<SELECT ID="WPA3_192Bit_TKIP_Selection1" NAME="WPA3_192Bit_TKIP_Selection1" onChange="doEncryptionChange(this)" SIZE="1">
																	<OPTION value="GCMP256" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "GCMP256" then asp_Write("selected") end if %> >GCMP256</OPTION>
																</SELECT>
                                                                <script>
                                                                    if(meshEbl == 1 && devRole == 2) {
                                                                        document.ConfigForm.WPA3_192Bit_TKIP_Selection1.disabled = true;
                                                                    }
                                                                </script>
															</TD>
														</TR>
														<TR>
														<TD><div class="form-text">WPA组密钥更新间隔</div></TD>
															<TD>
																<input type="text" id="WPA3_192Bit_WPARekeyInter" name="WPA3_192Bit_WPARekeyInter" size="7" maxlength="7" >
																<font color="#000000"> 秒</font>
																<script language="JavaScript" type="text/JavaScript">
																	var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
																	if("N/A" == rekeystr || "" == rekeystr)
																		document.getElementById('WPA3_192Bit_WPARekeyInter').value = "3600";
																	else
																		document.getElementById('WPA3_192Bit_WPARekeyInter').value = rekeystr;
																</script>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</div> 
<% end if %>
											<div id="WPA2PSKWPA3PSK_div">
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
												<TBODY>
													<TR>
														<TD class='w-130' width="130"><div class="form-text">加密方式</div></TD>
														<TD>
														<SELECT NAME="TKIP_Selection_WPA2WPA3" onChange="doEncryptionChange(this)" SIZE="1">
															<OPTION value="AES" selected = "selected") >AES</OPTION>
															<OPTION value="TKIP" disabled=true >TKIP</OPTION>
															<OPTION value="TKIPAES" disabled=true >TKIP+AES</OPTION>
														</SELECT>
                                                        <script>
                                                            if(meshEbl == 1 && devRole == 2) {
                                                                document.ConfigForm.TKIP_Selection_WPA2WPA3.disabled = true;
                                                            }
                                                        </script>
														</TD>
													</TR>  	
													<TR>
														<TD width="130"><div class="form-text">预共享密钥</div></TD>
														<TD><span id="inpsw4" style="position: relative;"><INPUT TYPE="PASSWORD" NAME="PreSharedKey_WPA2WPA3" id="PreSharedKey_WPA2WPA3" MAXLENGTH="64" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WPAPSK","s") end if %>" onBlur="blurFn3(this)">
                                                        <div class="input_eye eye-pwd" id="cb_enablshowpsw4" data-flag=0 onclick="doshowpswChange4()"></div>
                                                        </span>
														<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
														<script language="JavaScript" type="text/JavaScript">
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.PreSharedKey_WPA2WPA3.disabled = true;
                                                        }
														function doshowpswChange4() {
                                                            clearTimeout(changeTimer3);
															with (getElById('ConfigForm')){
                                                                var flag = getElById('cb_enablshowpsw4').getAttribute('data-flag');
                                                                if (flag==0) {
                                                                    getElById("PreSharedKey_WPA2WPA3").setAttribute("type", "text");
                                                                    getElById("cb_enablshowpsw4").setAttribute("data-flag", "1");
                                                                }
                                                                else {
                                                                    getElById("PreSharedKey_WPA2WPA3").setAttribute("type", "password");
                                                                    getElById("cb_enablshowpsw4").setAttribute("data-flag", "0");
                                                                }
                                                                inpsw4des.innerHTML = '<TD></TD><TD><div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>';
                                                                inpsw4des.style.display = "";
															}
													
														}
													
														</script>
														<% end if %>
														</TD>
													</TR>
                                                    <TR id="strength_label3" style="display: none;">
                                                        <TD></TD>
                                                        <TD class='w-130'><P class="pwd-tips">密码强度：<span></span></P></TD>
                                                    </TR>
                                                    <TR id="inpsw4des" style="display: none;"></TR>
													<TR class='hide'>
														<TD width="130"><TD><div class="form-text">密钥更新周期</div></TD>
														<TD><INPUT TYPE="TEXT" id="keyRenewalInterval_WPA2WPA3" NAME="keyRenewalInterval_WPA2WPA3" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)"> (0 ~ 4194303)秒
														<script language="JavaScript" type="text/JavaScript">
															var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
															if("N/A" == rekeystr || "" == rekeystr)
																document.getElementById('keyRenewalInterval_WPA2WPA3').value = "3600";
															else
																document.getElementById('keyRenewalInterval_WPA2WPA3').value = rekeystr;
														</script>
														</TD>
													</TR>  
												</TBODY>
												</TABLE>
												</div>
												<div id="WPA3PSK_div">
												<TABLE cellSpacing=0 cellPadding=0 border=0 >
												<TBODY>
													<TR>
														<TD class='w-130' width="130"><div class="form-text">加密方式</div></TD>
														<TD>
														<SELECT NAME="TKIP_Selection_WPA3" onChange="doEncryptionChange(this)" SIZE="1">
															<OPTION value="AES" selected = "selected") >AES</OPTION>
															<OPTION value="TKIP" disabled=true >TKIP</OPTION>
															<OPTION value="TKIPAES" disabled=true >TKIP+AES</OPTION>
														</SELECT>
                                                        <script>
                                                            if(meshEbl == 1 && devRole == 2) {
                                                                document.ConfigForm.TKIP_Selection_WPA3.disabled = true;
                                                            }
                                                        </script>
														</TD>
													</TR>  	
													<TR>
														<TD width="130"><div class="form-text">预共享密钥</div></TD>
														<TD><span id="inpsw5" style="position: relative;"><INPUT TYPE="PASSWORD" NAME="PreSharedKey_WPA3" id="PreSharedKey_WPA3" SIZE="48" MAXLENGTH="64" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WPAPSK","s") end if %>" onBlur="blurFn4(this)">
                                                            <div class="input_eye eye-pwd" id="cb_enablshowpsw5" data-flag=0 onclick="doshowpswChange5()"></div>
                                                        </span>
														<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
														<script language="JavaScript" type="text/JavaScript">
                                                        if(meshEbl == 1 && devRole == 2) {
                                                            document.ConfigForm.PreSharedKey_WPA2WPA3.disabled = true;
                                                        }
														function doshowpswChange5(value) {
                                                            clearTimeout(changeTimer4);
															with (getElById('ConfigForm')){
                                                                flag = getElById('cb_enablshowpsw5').getAttribute('data-flag');
                                                                if (flag==0) {
                                                                    getElById("PreSharedKey_WPA3").setAttribute("type", "text");
                                                                    getElById("cb_enablshowpsw5").setAttribute("data-flag", "1");
                                                                }
                                                                else {
                                                                    getElById("PreSharedKey_WPA3").setAttribute("type", "password");
                                                                    getElById("cb_enablshowpsw5").setAttribute("data-flag", "0");
                                                                }
                                                                inpsw5des.innerHTML = '<TD></TD><TD><div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>';
                                                                inpsw5des.style.display = "";
															}
													
														}
													
														</script>
														<% end if %>


													</TD>
													</TR>
                                                    <TR id="strength_label4" style="display: none;">
                                                        <TD></TD>
                                                        <TD class='w-130'><P class="pwd-tips">密码强度：<span></span></P></TD>
                                                    </TR>
                                                    <TR id="inpsw5des" style="display: none;"></TR>
													<TR class='hide'>
														<TD width="130"><TD><div class="form-text">密钥更新周期</div></TD>
														<TD><INPUT TYPE="TEXT" id="keyRenewalInterval_WPA3" NAME="keyRenewalInterval_WPA3" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)"> (0 ~ 4194303)秒
														<script language="JavaScript" type="text/JavaScript">
															var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
															if("N/A" == rekeystr || "" == rekeystr)
																document.getElementById('keyRenewalInterval_WPA3').value = "3600";
															else
																document.getElementById('keyRenewalInterval_WPA3').value = rekeystr;
														</script>
														</TD>
													</TR>  
												</TBODY>
												</TABLE>
												</div>
<% end if %>

<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then %>						
						<div id="Radius-WEP64_div">  	            	
							<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>
							<TR>
								<TD class='w-130'><div class="form-text">Radius Server IP</div></TD>
								<TD><input name="radiusSVR_IP1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Server Port</div></TD>
								<TD><input name="radiusSVR_Port1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Share secret</div></TD>
								<TD><input name="radiusSVR_Key1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR>
<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
							<TR>
								<TD><div class="form-text">Backup Server IP</div></TD>
								<TD><input name="bakradiusSVR_IP1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR> 
							<TR>
								<TD><div class="form-text">Backup Server Port</div></TD>
								<TD><input name="bakradiusSVR_Port1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
							</TR>
							<TR>
								<TD><div class="form-text">Backup Share secret</div></TD>
								<TD><input name="bakradiusSVR_Key1" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR> 
<% end if %>						
							<TR>
								<TD><div class="form-text">Re-auth Interval</div></TD>
								<TD><input type="text" name="radiusSVR_ReAuthInter1" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-64Bits</div></TD>
								<TD>每个键请输入5个字符或10个字符（0~9, a, b, c, d, e, f）</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-128Bits</div></TD>
								<TD>每个键请输入13个字符或26个字符（0~9, a, b, c, d, e, f）</TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if %> >Key#1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key11" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key1Str","s") end if %>" onBlur="doKEYcheck(this);" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="2" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if %> >Key#2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key21" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key2Str","s") end if %>"  onBlur="doKEYcheck(this);" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="3" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if %> >Key#3</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key31" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key3Str","s") end if %>"  onBlur="doKEYcheck(this);" > </TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="4" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if %> >Key#4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key41" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key4Str","s") end if %>"  onBlur="doKEYcheck(this);" > </TD>
							</TR>
						</TBODY>
						</TABLE>
						</div>    		            		            		            		            	        			 	
						<div id="Radius-WEP128_div"> 	
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY> 	
							<TR>
								<TD class='w-130'><div class="form-text">Radius Server IP</div></TD>
								<TD><input name="radiusSVR_IP2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Server Port</div></TD>
								<TD><input name="radiusSVR_Port2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Share secret</div></TD>
								<TD><input name="radiusSVR_Key2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR>
							<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
							<TR>
								<TD><div class="form-text">Backup Server IP</div></TD>
								<TD><input name="bakradiusSVR_IP2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR> 
							<TR>
								<TD><div class="form-text">Backup Server Port</div></TD>
								<TD><input name="bakradiusSVR_Port2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
							</TR>
							<TR>
								<TD><div class="form-text">Backup Share secret</div></TD>
								<TD><input name="bakradiusSVR_Key2" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR> 
							<% end if %>						
							<TR>
								<TD><div class="form-text">Re-auth Interval</div></TD>
								<TD><input type="text" name="radiusSVR_ReAuthInter2" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-64Bits</div></TD>
								<TD>每个键请输入5个字符或10个字符（0~9, a, b, c, d, e, f）</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-128Bits</div></TD>
								<TD>每个键请输入13个字符或26个字符（0~9, a, b, c, d, e, f）</TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if %> >Key#1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key12" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key1Str","s") end if %>" onBlur="doKEYcheck(this);" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="2" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if %> >Key#2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key22" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key2Str","s") end if %>"  onBlur="doKEYcheck(this);" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="3" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if %> >Key#3</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key32" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key3Str","s") end if %>"  onBlur="doKEYcheck(this);" > </TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="4" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if %> >Key#4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key42" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key4Str","s") end if %>"  onBlur="doKEYcheck(this);" > </TD>
							</TR>
						</TBODY>
						</TABLE>
						</div>  
							
						<div id="WPA_div">	
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>					
							<TR>
								<TD class='w-130'><div class="form-text">Radius Server IP</div></TD>
								<TD><input name="radiusSVR_IP3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Server Port</div></TD>
								<TD><input name="radiusSVR_Port3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Share secret</div></TD>
								<TD><input name="radiusSVR_Key3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR>
<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
							<TR>
								<TD><div class="form-text">Backup Server IP</div></TD>
								<TD><input name="bakradiusSVR_IP3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR> 
							<TR>
								<TD><div class="form-text">Backup Server Port</div></TD>
								<TD><input name="bakradiusSVR_Port3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
							</TR>
							<TR>
								<TD><div class="form-text">Backup Share secret</div></TD>
								<TD><input name="bakradiusSVR_Key3" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR> 
<% end if %>						
							<TR>
								<TD><div class="form-text">Re-auth Interval</div></TD>
								<TD><input type="text" name="radiusSVR_ReAuthInter3" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
							</TR>
							<TR>
								<TD><div class="form-text">加密方式</div></TD>
								<TD>
								<SELECT NAME="TKIP_Selection1" onChange="doEncryptionChange(this)" SIZE="1">
								<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %> >AES</OPTION>
								<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if %> >TKIP</OPTION>
								<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %> >TKIP+AES</OPTION>
								</SELECT>
                                <script>
                                    if(meshEbl == 1 && devRole == 2) {
                                        document.ConfigForm.TKIP_Selection1.disabled = true;
                                    }
                                </script>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WPA组密钥更新间隔</div></TD>
								<TD>
								<input type="text" id="WPARekeyInter3" name="WPARekeyInter3" size="7" maxlength="7" onBlur="checkRekeyinteral(this.value, 1)"> 秒
								<script language="JavaScript" type="text/JavaScript">
									var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
									if("N/A" == rekeystr || "" == rekeystr)
										document.getElementById('WPARekeyInter3').value = "3600";
									else
										document.getElementById('WPARekeyInter3').value = rekeystr;
								</script>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</div>
						<div id="WPA2_div">
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>		
							<TR>
								<TD class='w-130'><div class="form-text">Radius Server IP</div></TD>
								<TD><input name="radiusSVR_IP4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Server Port</div></TD>
								<TD><input name="radiusSVR_Port4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Share secret</div></TD>
								<TD><input name="radiusSVR_Key4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR>
<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
							<TR>
								<TD><div class="form-text">Backup Server IP</div></TD>
								<TD><input name="bakradiusSVR_IP4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR> 
							<TR>
								<TD><div class="form-text">Backup Server Port</div></TD>
								<TD><input name="bakradiusSVR_Port4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
							</TR>
							<TR>
								<TD><div class="form-text">Backup Share secret</div></TD>
								<TD><input name="bakradiusSVR_Key4" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR> 
<% end if %>						
							<TR>
								<TD><div class="form-text">Re-auth Interval</div></TD>
								<TD><input type="text" name="radiusSVR_ReAuthInter4" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
							</TR>
							<TR>
								<TD><div class="form-text">加密方式</div></TD>
								<TD>
								<SELECT NAME="TKIP_Selection2" onChange="doEncryptionChange(this)" SIZE="1">
									<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</OPTION>
									<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if %>>TKIP</OPTION>
									<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP+AES</OPTION>
								</SELECT>
                                <script>
                                    if(meshEbl == 1 && devRole == 2) {
                                        document.ConfigForm.TKIP_Selection2.disabled = true;
                                    }
                                </script>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WPA组密钥更新间隔</div></TD>
								<TD><input type="text" id="WPARekeyInter4" name="WPARekeyInter4" size="7" maxlength="7" onBlur="checkRekeyinteral(this.value, 1)"> 秒
								<script language="JavaScript" type="text/JavaScript">
									var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
									if("N/A" == rekeystr || "" == rekeystr)
										document.getElementById('WPARekeyInter4').value = "3600";
									else
										document.getElementById('WPARekeyInter4').value = rekeystr;
								</script>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</div>    		            		            		            		            	        	
						<div id="WPA1WPA2_div">
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>	
							<TR>
								<TD class='w-130'><div class="form-text">Radius Server IP</div></TD>
								<TD><input name="radiusSVR_IP5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Server Port</div></TD>
								<TD><input name="radiusSVR_Port5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Radius Share secret</div></TD>
								<TD><input name="radiusSVR_Key5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR>
<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then %>						
							<TR>
								<TD><div class="form-text">Backup Server IP</div></TD>
								<TD><input name="bakradiusSVR_IP5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15"></TD>
							</TR> 
							<TR>
								<TD><div class="form-text">Backup Server Port</div></TD>
								<TD><input name="bakradiusSVR_Port5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5"> </TD>
							</TR>
							<TR>
								<TD><div class="form-text">Backup Share secret</div></TD>
								<TD><input name="bakradiusSVR_Key5" type="text" value="<% if tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","BAK_RADIUS_Key","s") end if %>" size="48" maxlength="63"></TD>
							</TR> 
<% end if %>						
							<TR>
								<TD><div class="form-text">Re-auth Interval</div></TD>
								<TD><input type="text" name="radiusSVR_ReAuthInter5" value="<% if tcWebApi_get("WLan11ac_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","session_timeout_interval","s") end if %>" size="48" maxlength="63"> 秒</TD>
							</TR>
							<TR>
								<TD><div class="form-text">加密方式</div></TD>
								<TD>
								<SELECT NAME="TKIP_Selection3" onChange="doEncryptionChange(this)" SIZE="1">
									<OPTION value="AES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</OPTION>
									<OPTION value="TKIP" <% If tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if %>>TKIP</OPTION>
									<OPTION value="TKIPAES" <% if tcWebApi_get("Wlan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIPAES</OPTION>
								</SELECT>
                                <script>
                                    if(meshEbl == 1 && devRole == 2) {
                                        document.ConfigForm.TKIP_Selection3.disabled = true;
                                    }
                                </script>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WPA组密钥更新间隔</div></TD>
								<TD><input type="text" id="WPARekeyInter5" name="WPARekeyInter5" size="7" maxlength="7" onBlur="checkRekeyinteral(this.value, 1)"> 秒
								<script language="JavaScript" type="text/JavaScript">
									var rekeystr = "<% tcWebApi_get("Wlan11ac_Entry","RekeyInterval","s") %>";
									if("N/A" == rekeystr || "" == rekeystr)
										document.getElementById('WPARekeyInter5').value = "3600";
									else
										document.getElementById('WPARekeyInter5').value = rekeystr;
								</script>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</div> 
<% end if %>  		            		            		            		            	        	
						<div id="WEP-64Bits_div">
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>		
							<TR>
								<TD class='w-130'><div class="form-text">WEP AuthType</div></TD>
								<TD>
								<SELECT NAME="WEP_TypeSelection1" SIZE="1" onChange="doWEPTypeChange()">
									<OPTION value="OpenSystem" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("selected") elseif tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "N/A" then asp_Write("selected") end if %>>OPENWEP</OPTION>
									<OPTION value="SharedKey" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("selected") end if %>>SHAREDWEP</OPTION>
									<OPTION value="WEPAuto" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("selected") end if %>>Both</OPTION>
								</SELECT>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-64Bits</div></TD>
								<TD>每个键请输入5个字符或10个字符（0~9, a, b, c, d, e, f）</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-128Bits</div></TD>
								<TD>每个键请输入13个字符或26个字符（0~9, a, b, c, d, e, f）</TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if %> >Key#1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key13" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key1Str","s") end if %>" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="2" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if %> >Key#2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key23" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key2Str","s") end if %>" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="3" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if %> >Key#3</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key33" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key3Str","s") end if %>" > </TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="4" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if %> >Key#4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key43" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key4Str","s") end if %>" > </TD>
							</TR>
						</TBODY>
						</TABLE>
						</div>
						<div id="WEP-128Bits_div">
						<TABLE cellSpacing=0 cellPadding=0 border=0 >
						<TBODY>	
							<TR>
								<TD class='w-130'><div class="form-text">WEP AuthType</div></TD>
								<TD>
								<SELECT NAME="WEP_TypeSelection2" SIZE="1" onChange="doWEPTypeChange()">
									<OPTION value="OpenSystem" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("selected") elseif tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "N/A" then asp_Write("selected") end if %>>OPENWEP</OPTION>
									<OPTION value="SharedKey" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("selected") end if %>>SHAREDWEP</OPTION>
									<OPTION value="WEPAuto" <% if tcWebApi_get("Wlan11ac_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("selected") end if %>>Both</OPTION>
								</SELECT>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-64Bits</div></TD>
								<TD>每个键请输入5个字符或10个字符（0~9, a, b, c, d, e, f）</TD>
							</TR>
							<TR>
								<TD><div class="form-text">WEP-128Bits</div></TD>
								<TD>每个键请输入13个字符或26个字符（0~9, a, b, c, d, e, f）</TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if %> >Key#1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key14" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key1Str","s") end if %>" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="2" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if %> >Key#2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key24" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key2Str","s") end if %>" ></TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="3" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if %> >Key#3</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key34" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("Wlan11ac_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key3Str","s") end if %>" > </TD>
							</TR> 
							<TR>
								<TD class="form-radio"><INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="4" <% If tcWebApi_get("Wlan11ac_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if %> >Key#4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WEP_Key44" SIZE="30" MAXLENGTH="28" VALUE="<% If tcWebApi_get("Wlan11ac_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","Key4Str","s") end if %>" > </TD>
							</TR>   
						</TBODY>
						</TABLE>
						</div>	


											</TD>
										</TR>
									</TBODY>
									</TABLE>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		<DIV id="div_mesh_check_msg" style="display: none">
			<p class="form-text" style="color: red;">提示：EasyMesh 开启时，加密模式必须为 None 或者 WPA2PSK。WPA加密方式必须为 None 或者 AES。</p>
		</DIV>
<% end if %>

							<TR>
								<TD colspan='2'>
                                    <P style="margin-top: 32px;margin-left: 182px;">
                                        <BUTTON id="btnOK" onclick="doSave(10)" type="button" name="BUTTON">保 存</BUTTON>
                                    </P>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
					</div>
					
						<div style="display:none;" id="WLAN5G高级配置_item">
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;margin-bottom: 0;">
                                <TBODY>
                                    <TR>
                                        <TD>
                                            <div class="advanceTitle">5G 高级配置</div>
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
									<TD class='w-130'><div class="form-text">当前索引</div></TD>
									<TD>
										<INPUT type="text" disabled id="currentIdx" ></TD>
									</TR>

<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") = "1" then %>
									<TR id='isSsidTypeSupport' class="hide">
									<TD class='w-130'><div class="form-text">组网类别</div></TD>
									<TD><INPUT disabled type=text name=ssidType></TD>
									</TR>
<% end if %>									
									<TR>
										<TD><div class="form-text">工作模式</div></TD>
										<TD>
                                            <SELECT ID="WirelessMode" NAME="WirelessMode" SIZE="1" onChange="doWirelessModeChange()">
<% if tcWebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then %>
													<OPTION value="2" <% if tcWebApi_get("Wlan11ac_Entry","WirelessMode","h") = "2" then asp_Write("selected") end if %> >802.11a</OPTION>
													<OPTION value="8" <% if tcWebApi_get("Wlan11ac_Entry","WirelessMode","h") = "8" then asp_Write("selected") end if %> >802.11n/a</OPTION>
													<OPTION value="14" <% if tcWebApi_get("Wlan11ac_Entry","WirelessMode","h") = "14" then asp_Write("selected") end if %> >802.11ac</OPTION>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
													<OPTION value="17" <% if tcWebApi_get("Wlan11ac_Entry","WirelessMode","h") = "17" then asp_Write("selected") end if %> >802.11ax</OPTION>
<% end if %>
<% else %>
													<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "2" then asp_Write("selected") end if %> >802.11a</OPTION>
													<OPTION value="8" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "8" then asp_Write("selected") end if %> >802.11n/a</OPTION>
													<OPTION value="14" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "14" then asp_Write("selected") end if %> >802.11ac</OPTION>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
													<OPTION value="17" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "17" then asp_Write("selected") end if %> >802.11ax</OPTION>
<% end if %>
<% end if %>
												</SELECT>
                                        
										</TD>
									</TR> 
								<TR>
							      <TD ><div class="form-text">信道</div></TD>
							      <TD>
												<SELECT NAME="Channel_ID" SIZE="1" onChange="doExtChaLockChange()" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>disabled<% end if %> ></SELECT>
										</TD>
							      <TD>
							        <DIV class="hide">
			            			<SELECT NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >	
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
											countryarr[94]="VIET NAM";
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
											</DIV>
										</TD>
										
									</TR>


									<TR class="hide">
										<TD><div class="form-text">当前信道</div></TD> 
										<TD>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
										<INPUT TYPE="TEXT" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan11ac","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","CurrentChannel","s") end if %>" disabled >
<% else %>
<% if tcWebApi_get("WLan11ac_Common","Channel","h") = "0" then %>
										<INPUT TYPE="TEXT" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan11ac","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","CurrentChannel","s") end if %>" disabled >
<% else %>
										<INPUT TYPE="TEXT" NAME="CurrentChannel" MAXLENGTH="2" VALUE="<% If tcWebApi_get("WLan11ac_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","Channel","s") end if %>" disabled >
<% end if %>
<% end if %>
										</TD>
									</TR>
									<TR>
                    <TD>
                        <div class="form-text">发射功率</div>
                     </TD>
                    <TD>
                    	<SELECT style="WIDTH: 123px" size=1 name=wlTxPwr> 
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                        <OPTION value=100 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "100" then asp_Write("selected") end if %> >100%</OPTION>
                        <OPTION value=80 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "80" then asp_Write("selected") end if %> >80%</OPTION>
                        <OPTION value=50 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "50" then asp_Write("selected") end if %> >60%</OPTION>
                        <OPTION value=25 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "25" then asp_Write("selected") end if %> >40%</OPTION>
                        <OPTION value=10 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "10" then asp_Write("selected") end if %> >20%</OPTION>	
<% else %>
                                                                            <OPTION value=100 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "100" then asp_Write("selected") end if %> >穿墙模式</OPTION>
																			<% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "80" then %>
																						<OPTION value=80 selected>标准模式</OPTION>
																			<% else %>
																						<OPTION value=50 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "50" then asp_Write("selected") end if %> >标准模式</OPTION>
																			<% end if %>
																			<% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "10" then %>
																						<OPTION value=10 selected>节能模式</OPTION>
																			<% else %>
																						<OPTION value=25 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "25" then asp_Write("selected") end if %> >节能模式</OPTION>
																			<% end if %> 	
<% end if %>
                       </SELECT> 
                    </TD>
                  </TR>		
									<TR id=bwControl_r>
										<TD>
                                            <div class="form-text">信道频宽</div>
                                        </TD>
										<TD><SELECT style="WIDTH: 123px" id=bwControl onChange=ChannelSelect() size=1 name=bwControl></SELECT></TD>
									</TR>
                                    
<% if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then %>
									<TR id=wlanmcsrate>
										<TD><div class="form-text">速率</div></TD>
										<TD><select name="WLANMCS" STYLE="WIDTH:105" SIZE="1" ></select></TD>
									</TR>
<% end if %>
									<TR id=guardval>
										<TD class='w-130'><div class="form-text">保护间隔</div></TD>
										<TD>
										<select name="WLANGuardInterval" STYLE="WIDTH:105" SIZE="1" >
											<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "0" then asp_Write("selected") end if %>>Long</option>
											<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "N/A" then asp_Write("selected") end if %> >Short</option>
										</select>
										</TD>
									</TR>		
									<TR class="hide">
										<TD><div class="form-text">Beacon信标帧发送间隔</div></TD>
										<TD><INPUT TYPE="TEXT" NAME="BeaconInterval" MAXLENGTH="4" VALUE="<% If tcWebApi_get("WLan11ac_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","BeaconPeriod","s") else asp_Write("100") end if %>">
                                            <span style="padding-left: 8px;">(范围：20~1000)</span>
                                        </TD>
									</TR> 
									<TR class='hide'>
										<TD><div class="form-text">RTS/CTS界限</div></TD>
										<TD><INPUT TYPE="TEXT" NAME="RTSThreshold" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","RTSThreshold","s") else asp_Write("2347") end if %>">(范围：1500~2347)</TD>
									</TR> 
									<TR class='hide'>
										<TD><div class="form-text">分割界限</div></TD>
										<TD><INPUT TYPE="TEXT" NAME="FragmentThreshold" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","FragThreshold","s") else asp_Write("2346") end if %>">(范围：256~2346, 仅偶数)</TD>
									</TR> 
									<TR class="hide">
										<TD><div class="form-text">DTIM间隔</div></TD>
										<TD><INPUT TYPE="TEXT" NAME="DTIM" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","DtimPeriod","s") else asp_Write("1") end if %>" >
                                            <span style="padding-left: 8px;">(范围：1~255)</span>
                                        </TD>
									</TR>												
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>																	
									<TR class='hide'>
										<TD><div class="form-text">电台编号</div></TD>
										<TD>
										<INPUT NAME="StationNum" TYPE="text" value="<% if tcWebApi_get("Wlan11ac_Entry","MaxStaNum","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","MaxStaNum","s") else asp_Write("0") end if %>" MAXLENGTH="2" onkeyup="value=isNumeric(value)?value:'0';">
											(范围：0~<% tcWebApi_get("Info_WLan11ac","maxStaNumSupported","s") %>, 0表示没有限制)
										</TD>
									</TR> 
<% End If %>	                  
                  
							
								</TBODY>
							</TABLE>
							
							<div id="11nMode_1_div" class='hide'>
								<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
									<TBODY>
										<TR>
											<TD class='w-130'><div class="form-text">信道带宽</div></TD>
											<TD>
												<select name="WLANChannelBandwidth" STYLE="WIDTH:105" SIZE="1" onChange="doChannelBandwidthChange();" >
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "0" then asp_Write("selected") end if %>>20 MHz</option>
												<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "1" then %><% if tcWebApi_get("WLan11ac_Common","HT_BW","h") <> "0" then asp_Write("selected") end if %><% end if %><% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %>>20/40 MHz</option>
												<option value="2" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then %><% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if %><% End If %>>40 MHz</option>
												<% else %>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %>>20/40 MHz</option>
												<% end if %>
												</select>
											</TD>
										</TR>
									</TBODY>
								</TABLE> 

								<div id="HT_BW_1_div" class='hide'>
									<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
										<TBODY>
											<TR>
												<TD class='w-130'><div class="form-text">扩展信道</div></TD>
												<TD>
												<select name="WLANExtensionChannel" SIZE="1" onChange="doExtChannChange();">
													<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %> >向下扩展信道</option>
													<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %> >向上扩展信道</option>
												</select>
												</TD>
											</TR>
										</TBODY>
									</TABLE> 
								</div>												
							</div>
							<div id="11acMode_1_div" class='hide'>
								<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
									<TBODY>
										<TR>
											<TD class='w-130'><div class="form-text">VHT带宽</div></TD>
											<TD>
												<select name="WLan11acVHTChannelBandwidth" SIZE="1" onChange="doVHTBandwidthChange();">
												<option value="0" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "0" then asp_Write("selected") end if %>>20/40 MHz</option>
												<option value="1" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "N/A" then asp_Write("selected") end if %>>20/40/80 MHz</option>
											<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
												<option value="2" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "2" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "N/A" then asp_Write("selected") end if %>>160 MHz</option>
												<option value="3" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "3" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "N/A" then asp_Write("selected") end if %>>80+80 MHz</option>
											<% end if %>
                                            <% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7916" then %>
												<option value="2" <% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "2" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "N/A" then asp_Write("selected") end if %> >160 MHz</option>
                                            <% end if %>
												</select>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
<% If tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" Then %>
								<div id="WLan11ac2ndFrequencyTable" style="display:none">
									<TABLE cellSpacing=0 cellPadding=0 border=0  style="width: 714px;margin: 0 auto;">
										<TBODY>
											<TR>
												<TD class='w-130'><div class="form-text">第二频率(信道)</div></TD>
												<TD><select name="WLan11ac2ndFrequency" SIZE="1" onChange="onVHTbwChannelChange();"></select></TD>
											</TR>
											<TR>
												<TD><div class="form-text">固定发送波束成形</div></TD>
												<TD>
													<select name="WLan11acTxBeamForming" STYLE="WIDTH:109" SIZE="1">
														<option value="3">Both</option>
														<option value="2">Explicit TxBF</option>
														<option value="1">Implicit TxBF</option>
														<option value="0">Disable</option>
													</select>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</div>
<% End If %>
								<TABLE cellSpacing=0 cellPadding=0 border=0 class='hide' style="width: 714px;margin: 0 auto;">
									<TBODY>
										<TR>
											<TD class='w-130'><div class="form-text">VHT保护间隔</div></TD>
											<TD>
												<select name="WLan11acVHTGuardInterval" STYLE="WIDTH:109" SIZE="1">
													<option value="0" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "0" then asp_Write("selected") end if %>>Long</option>
													<option value="1" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "N/A" then asp_Write("selected") end if %>>Short</option>
												</select>
											</TD>
										</TR>  		            		            		            		            	        
									</TBODY>
								</TABLE>
							</div>
					
							<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
								<TBODY>
									<TR>
                                        <TD class='w-130'><div class="form-text">隐藏Wi-Fi</div></TD>
                                        <TD ><INPUT class="input-onoff" type=checkbox name="ESSID_HIDE_h" onclick=ESSIDenable() <% if tcWebApi_get("Wlan11ac_Entry","HideSSID","h") = "1" then asp_Write("checked") end if %>>
                                        </TD>
                                    </TR>
									<TR class='hide'>
										<TD class='w-130'><div class="form-text">广播使能</div></TD>
										<TD>
										<INPUT TYPE="RADIO" NAME="ESSID_HIDE_Selection" VALUE="0" <% If tcWebApi_get("Wlan11ac_Entry","HideSSID","h") = "0" then asp_Write("checked") end if %> >开启		
										<INPUT TYPE="RADIO" NAME="ESSID_HIDE_Selection" VALUE="1" onClick="doBroadcastSSIDChange();" <% If tcWebApi_get("Wlan11ac_Entry","HideSSID","h") = "1" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","HideSSID","h") = "N/A" then asp_Write("checked") end if %> >关闭
										</TD>
									</TR>
								</TBODY>
							</TABLE>							
	
							<div id="11nMode_0_div" class='hide'>
							<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
							<TBODY>
								<TR>
									<TD class='w-130'><div class="form-text">WMM使能</div></TD>
									<TD>
									<INPUT TYPE="RADIO" NAME="WMM_Selection" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","WMM","h") = "1" then asp_Write("checked") end if %> >开启
									<INPUT TYPE="RADIO" NAME="WMM_Selection" VALUE="0" <% If tcWebApi_get("Wlan11ac_Entry","WMM","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","WMM","h") = "N/A" then asp_Write("checked") end if %> >关闭
									</TD>
								</TR>
							</TBODY>
							</TABLE>
							</div>
	
<% If tcWebApi_get("Info_WLan11ac","isWDSSupported","h") = "Yes" Then %>					
						<TABLE cellSpacing=0 cellPadding=0 border=0 class='hide' style="width: 714px;margin: 0 auto;">
						<TBODY>			
							<TR>
								<TD class='w-130'><div class="form-text">WDS Peer MAC #1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC1" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan11ac_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC0","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">WDS Peer MAC #2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC2" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("WLan11ac_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC1","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">WDS Peer MAC #3</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC3" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC2","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">WDS Peer MAC #4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC4" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC3","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
<% End If %> 		            		            		            		            	        
						</TBODY>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=0 border=0 class='hide' style="width: 714px;margin: 0 auto;">
						<TBODY>
							<TR>
								<TD class='w-130'><div class="form-text">Active</div></TD>
								<TD>
								<INPUT TYPE="RADIO" NAME="WLAN_FltActive" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","AccessPolicy","h") <> "0" then asp_Write("checked") end if %> ><font color="#000000">开启</font>
								<INPUT TYPE="RADIO" NAME="WLAN_FltActive" VALUE="0" <% If tcWebApi_get("Wlan11ac_Entry","AccessPolicy","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","AccessPolicy","h") = "N/A" then asp_Write("checked") end if %> ><font color="#000000">关闭</font>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">Action</div></TD>
								<TD>
								<SELECT NAME="WLAN_FltAction" SIZE="1">
									<OPTION value="1" <% if tcWebApi_get("Wlan11ac_Entry","AccessPolicy","h") = "1" then asp_Write("selected") end if %>>Allow</OPTION>
									<OPTION value="2" <% if tcWebApi_get("Wlan11ac_Entry","AccessPolicy","h") = "2" then asp_Write("selected") end if %>>Deny</OPTION>
								</SELECT>
								</TD>
							</TR>
							<TR>
								<TD><div class="form-text">Mac地址#1</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC1" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC0","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC0","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Mac地址#2</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC2" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC1","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC1","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Mac地址#3:></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC3" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC2","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC2","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Mac地址#4</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC4" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC3","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC3","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>
							<TR>
								<TD><div class="form-text">Mac地址#5</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC5" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC4","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC4","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>  
							<TR>
								<TD><div class="form-text">Mac地址#6</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC6" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC5","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC5","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>  
							<TR>
								<TD><div class="form-text">Mac地址#7:></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC7" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC6","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC6","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>  
							<TR>
								<TD><div class="form-text">Mac地址#8</div></TD>
								<TD><INPUT TYPE="TEXT" NAME="WLANFLT_MAC8" STYLE="WIDTH:140" SIZE="20" MAXLENGTH="20" VALUE="<% if tcWebApi_get("Wlan11ac_Entry","WLan_MAC7","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry","WLan_MAC7","s") end if %>" onBlur="doMACcheck(this)"></TD>
							</TR>    		            		            		            		            	        
						</TBODY>
						</TABLE>	  	
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
					<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
						<TBODY>
							<TR class="hide">
								<TD width="130"><div class="form-text">TWT 开关</div></TD>
								<TD>
									<select id="TWTSupport_flag" name="TWTSupport_flag">
										<option value=0 <% if tcWebApi_get("Wlan11ac_Common", "TWTSupport", "h") = "0" then asp_Write("selected") end if %> >关闭</option>
										<option value=1 <% if tcWebApi_get("Wlan11ac_Common", "TWTSupport", "h") = "1" then asp_Write("selected") end if %> >使能</option>
										<option value=2 <% if tcWebApi_get("Wlan11ac_Common", "TWTSupport", "h") = "2" then asp_Write("selected") end if %> >强制</option>
									</select>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "is11AXEnhanceModeSupported", "h") = "Yes" then %>
						<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
							<TBODY>
								<TR>
									<TD width="130"><div class="form-text">BSS Color</div></TD>
									<TD>
										<INPUT style="WIDTH: 123px" size="3" name="BSSColorNum_flag" id="BSSColorNum_flag" value=<% tcWebApi_get("Wlan11ac_Common", "BSSColorNum", "s") %>>
									</TD>
								</TR>
							</TBODY>
							<TBODY>
								<TR>
									<TD width="130"><div class="form-text">持续时间</div></TD>
									<TD>
										<INPUT style="WIDTH: 123px" size="8" name="RTS_flag" id="RTS_flag" value=<% tcWebApi_get("Wlan11ac_Common", "RTS", "s") %>>
									</TD>
									<TD>32us</TD>
								</TR>
							</TBODY>
							<TBODY>
								<TR>
									<TD width="130"><div class="form-text">BSSID最大值</div></TD>
									<TD>
										<select id="CBSSIDMaxIndex_flag" name="CBSSIDMaxIndex_flag">
											<option value=1 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "1" then asp_Write("selected") end if %> >1</option>
											<option value=2 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "2" then asp_Write("selected") end if %> >2</option>
											<option value=3 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "3" then asp_Write("selected") end if %> >3</option>
											<option value=4 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "4" then asp_Write("selected") end if %> >4</option>
											<option value=5 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "5" then asp_Write("selected") end if %> >5</option>
											<option value=6 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "6" then asp_Write("selected") end if %> >6</option>
											<option value=7 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "7" then asp_Write("selected") end if %> >7</option>
											<option value=8 <% if tcWebApi_get("Wlan11ac_Common", "CBSSIDMaxIndex", "h") = "8" then asp_Write("selected") end if %> >8</option>
										</select>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;"> 
							<TBODY>
								<TR>
									<TD width=130><div class="form-text">个人TWT使能</div></TD>
									<TD>
										<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportDisable" value=0 <% if tcWebApi_get("Wlan11ac_Common", "IndividualTWTSupport", "h") <> "1" then asp_Write("checked") end if %> <% if tcWebApi_get("Wlan11ac_Common", "IndividualTWTSupport", "h") <> "2" then asp_Write("checked") end if %>>
										<font color="#000000">关闭 </font>
										<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportEnable" value=1 <% if tcWebApi_get("Wlan11ac_Common", "IndividualTWTSupport", "h") = "1" then asp_Write("checked") end if %>>
										<font color="#000000">使能 </font>
										<INPUT type="RADIO" name="IndividualTWTSupport_flag" id="IndividualTWTSupportMandatory" value=2 <% if tcWebApi_get("Wlan11ac_Common", "IndividualTWTSupport", "h") = "2" then asp_Write("checked") end if %>>
										<font color="#000000">强制 </font>
									</TD>
								</TR>
							</TBODY>
							<TBODY>
								<TR>
									<TD width=130><div class="form-text">HE LDPC</div></TD>
									<TD>
										<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCDisable" value=0 <% if tcWebApi_get("Wlan11ac_Common", "HELDPCE", "h") <> "1" then asp_Write("checked") end if %>>
										<font color="#000000">关闭 </font>
										<INPUT type="RADIO" name="HELDPC_flag" id="HELDPCEnable" value=1 <% if tcWebApi_get("Wlan11ac_Common", "HELDPCE", "h") = "1" then asp_Write("checked") end if %>>
										<font color="#000000">使能 </font>
									</TD>
								</TR>
							</TBODY>
							<TBODY>
								<TR>
									<TD width=130><div class="form-text">Spatial Reuse</div></TD>
									<TD>
										<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseDisable" value=0 <% if tcWebApi_get("Wlan11ac_Common", "SpatialReuse", "h") <> "1" then asp_Write("checked") end if %>>
										<font color="#000000">关闭 </font>
										<INPUT type="RADIO" name="SpatialReuse_flag" id="SpatialReuseEnable" value=1 <% if tcWebApi_get("Wlan11ac_Common", "SpatialReuse", "h") = "1" then asp_Write("checked") end if %>>
										<font color="#000000">使能 </font>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
						<input type="hidden" id="Wlan11acMuOfdmaDlEnable_flag" name="Wlan11acMuOfdmaDlEnable_flag" value="<% if tcWebApi_get("Wlan11ac_Common","MuOfdmaDlEnable","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","MuOfdmaDlEnable","s") end if %>">
						<input type="hidden" id="Wlan11acMuOfdmaUlEnable_flag" name="Wlan11acMuOfdmaUlEnable_flag" value="<% if tcWebApi_get("Wlan11ac_Common","MuOfdmaUlEnable","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","MuOfdmaUlEnable","s") end if %>">
						<input type="hidden" id="Wlan11acMuMimoDlEnable_flag" name="Wlan11acMuMimoDlEnable_flag" value="<% if tcWebApi_get("Wlan11ac_Common","MuMimoDlEnable","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","MuMimoDlEnable","s") end if %>">
						<input type="hidden" id="Wlan11acMuMimoUlEnable_flag" name="Wlan11acMuMimoUlEnable_flag" value="<% if tcWebApi_get("Wlan11ac_Common","MuMimoUlEnable","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","MuMimoUlEnable","s") end if %>">
						<input type="hidden" id="Wlan11acSREnable_flag" name="Wlan11acSREnable_flag" value="<% if tcWebApi_get("Wlan11ac_Common","SREnable","h") <> "N/A" then tcWebApi_get("Wlan11ac_Common","SREnable","s") end if %>">
										<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">												
												<TBODY>
													<TR class="hide">
													<TD width="130"><div class="form-text">MU-OFDMA使能</div></TD>
														<TD>
															<INPUT class="input-onoff" type=checkbox <% if tcWebApi_get("Wlan11ac_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %> id=Wlan11acMuOfdmaDlEnable name=Wlan11acMuOfdmaDlEnable>
														</TD>
													</TR>
												</TBODY>
												<TBODY>
													<TR class="hide">
													<TD width="130"><div class="form-text">MU-MIMO使能</div></TD>
														<TD>
															<INPUT class="input-onoff" type=checkbox <% if tcWebApi_get("Wlan11ac_Common","MuMimoDlEnable","h") = "1" then asp_Write("checked") end if %> id=Wlan11acMuMimoDlEnable name=Wlan11acMuMimoDlEnable>
														</TD>
													</TR>
												</TBODY>	
												<TBODY>
													<TR class="hide">
													<TD width="130"><div class="form-text">SR使能</div></TD>
														<TD>
															<INPUT class="input-onoff" type="checkbox" <% if tcWebApi_get("Wlan11ac_Common","SREnable","h") = "1" then asp_Write("checked") end if %> id="wlan11acSREnable" name="wlan11acSREnable">
														</TD>
													</TR>
												</TBODY>
										</TABLE>		
<% end if %>	            		              	 
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
										<table cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
										<tr>
										<TD width="130"><div class="form-text">Tx Stream</div></TD>
										<td>
										<SELECT NAME="TxStream_Action" SIZE="1" onChange="doWirelessTxStreamChange()">
											<OPTION value="1" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "1" then asp_Write("selected") end if %>>1
											<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "2" then asp_Write("selected") end if %>>2
<% if tcWebApi_get("Info_WLan11ac","isMT7615DSupported","h") <> "Yes" then %>				
											<OPTION value="3" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "3" then asp_Write("selected") end if %>>3
											<OPTION value="4" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "4" then asp_Write("selected") end if %>>4	
<%end if%>
										</SELECT>
										</td>
										</tr>
										<tr>
										<td width="130"><div class="form-text">Rx Stream</div></TD>
										<td>
										<SELECT NAME="RxStream_Action" SIZE="1" onChange="doWirelessRxStreamChange()">
											<OPTION value="1" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "1" then asp_Write("selected") end if %>>1
											<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "2" then asp_Write("selected") end if %>>2
<% if tcWebApi_get("Info_WLan11ac","isMT7615DSupported","h") <> "Yes" then %>				
											<OPTION value="3" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "3" then asp_Write("selected") end if %>>3
											<OPTION value="4" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "4" then asp_Write("selected") end if %>>4
<%end if%>
										</SELECT>
										</td>
										</tr>
										</table>
<%end if%>			
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then %>
												<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
												<TBODY>
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
									<INPUT TYPE="HIDDEN" NAME="isInWPSing" value="<% tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","s") %>" >
<% else %>
									<INPUT TYPE="HIDDEN" NAME="isInWPSing" value="<% tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","s") %>" >
<% end if %>
													<TR>
								                    	<TD class='w-130'><div class="form-text">WPS使能</div></TD>
								                    	<TD ><INPUT class="input-onoff" type=checkbox name="WPS_ENABLE_NOH" onClick=WPS_Enable()>
                                                        </TD>
                                                    </TR>
                                                    <TR>
                                                        <TD class='w-130'><div class="form-text"></div></TD>
                                                        <TD>
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
                                                        <button name="btnStartWPS" id="btnStartWPS" onclick="doStartWPS();"><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "N/A" then asp_Write("Start WPS") end if %></button>
<% else %>
                                                        <button name="btnStartWPS" id="btnStartWPS" onclick="doStartWPS();"<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "N/A" then asp_Write("Start WPS") end if %></button>
<% end if %>
														</TD>
								                    </TR>
                                                </TBODY>
                                                <TBODY>
													<TR class='hide'>
														<TD><div class="form-text">WPS使能</div></TD>
														<TD>
														<input name="UseWPS_Selection" VALUE="1" <% If tcWebApi_get("Wlan11ac_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if %> onClick="doWPSUseChange();" type="radio">开启
														<input name="UseWPS_Selection" VALUE="0" <% If tcWebApi_get("Wlan11ac_Entry","WPSConfMode","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","WPSConfMode","h") = "N/A" then asp_Write("checked") end if %> onClick="doWPSUseChange();" type="radio">关闭
														</TD>
													</TR>  	  		            		            		           	               
												</TBODY>
												</TABLE>
												<div id="WPSConfMode_1_div">	
												<TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">
												<TBODY>
													<TR class='hide'>
														<TD class='w-130'><div class="form-text">WPS状态</div></TD>
														<TD>
														<% if tcWebApi_get("Wlan11ac_Entry", "WPSConfStatus", "h") = "1" then asp_Write("未配置")
															elseif tcWebApi_get("Wlan11ac_Entry", "WPSConfStatus", "h") = "2" then asp_Write("已配置")
															elseif tcWebApi_get("Wlan11ac_Entry", "WPSConfStatus", "h") = "N/A" then asp_Write("未配置") end if %>
														</TD>
													</TR>
													<TR class='hide'>
														<TD class='w-130' ><div class="form-text">WPS模式</div></TD>
														<TD>
														<input name="WPSMode_Selection" value="0" onClick="doWPSModeChange();" <% If tcWebApi_get("Wlan11ac_Entry","WPSMode","h") = "0" then asp_Write("checked") end if %> type="radio">PIN码
														<input name="WPSMode_Selection" value="1" onClick="doWPSModeChange();" <% If tcWebApi_get("Wlan11ac_Entry","WPSMode","h") = "1" then asp_Write("checked") end if %> <% If tcWebApi_get("Wlan11ac_Entry","WPSMode","h") = "N/A" then asp_Write("checked") end if %>  type="radio">PBC
														
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
														<input name="StartWPS" id="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
<% else %>
														<input name="StartWPS" id="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
<% end if %>
														</TD>
													</TR>
<% if tcWebApi_get("Wlan11ac_Entry","WPSMode","h") = "0" then %>
													<TR>
														<TD><div class="form-text">生成PIN</div></TD>
														<TD>
														<iframe src="/cgi-bin/getPinData11Ac.cgi" frameborder="0" scrolling="no" width="16%" height="28" align=left onload="showDiv()"></iframe>
														<input type="button" name="pin_generate" value="生成PIN码" onClick="doGenerate()">
														</TD>
													</TR>
													<TR>
														<TD><div class="form-text">PIN</div></TD>
														<TD><input name="WPSEnrolleePINCode" size="9" maxlength="9" value="<% If tcWebApi_get("Wlan11ac_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("Wlan11ac_Entry","enrolleePinCode","s") end if %>" onkeyup="doPINCodeCheck(this)" type="text"></TD>
													</TR>
<% end if %>
													<TR>
														<TD></TD>
														<TD class='hide'>
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
														<input name="StartWPS" id="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
<% else %>
														<input name="StartWPS" id="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
<% end if %>
														</TD>
													</TR>

													<TR class='hide'>  		
														<TD><div class="form-text">WPS进度</div></TD>
														<TD class='hide'>
														<% if tcWebApi_get("Info_WLan11ac", "wlanWPSStatus", "h") = "Idle" then asp_Write("Idle")
														elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus", "h") = "In progress" then asp_Write("Inprogress")
														elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus", "h") = "Configured" then asp_Write("Configured")
														elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus", "h") = "WPS process Fail" then asp_Write("WPS process Fail")
														else tcWebApi_get("Info_WLan11ac", "wlanWPSStatus", "s") end if%>
														</TD>
														<TD><input name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" ></TD>
													</TR>
													<TR>
														<TD></TD>
														<TD class='hide'><input name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" ></TD>
													</TR>
												</TBODY>
												</TABLE>
												</div>
<% end if %>
<% end if %> 
											<TABLE cellSpacing=0 cellPadding=0 border=0 class='hide' style="width: 714px;margin: 0 auto;">
											<TBODY>
<% If tcWebApi_get("Info_WLan11ac","isWDSSupported","h") = "Yes" Then %>
												<TR>
													<TD class='w-130'><div class="form-text">WDS使能</div></TD>
													<TD>
													<input type="RADIO" name="WLAN_WDS_Active" value="1" onClick="autoWLAN_WDS_Active()" <%If tcWebApi_get("WLan11ac_WDS","WdsEnable","h") <> "0" then asp_Write("checked") end if%> >开启
													<input type="RADIO" name="WLAN_WDS_Active" value="0" onClick="autoWLAN_WDS_Deactive()" <%If tcWebApi_get("WLan11ac_WDS","WdsEnable","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan11ac_WDS","WdsEnable","h") = "N/A" then asp_Write("checked") end if%> >关闭
													</TD>
												</TR>
											</TBODY>
											</TABLE>

											<TABLE cellSpacing=0 cellPadding=0 border=0 class='hide' style="width: 714px;margin: 0 auto;">
											<TBODY>
												<TR>
													<TD class='w-130'><div class="form-text">WDS加密方式</div></TD>
													<TD>
													<SELECT NAME="WDS_EncrypType_Selection" SIZE="1" onChange="doWDSEncrypTypeChange()">
														<OPTION value="TKIP" <% If tcWebApi_get("WLan11ac_WDS","WdsEncrypType","h") = "TKIP" then asp_Write("selected") end if %> >TKIP</OPTION>
														<OPTION value="AES" <% if tcWebApi_get("WLan11ac_WDS","WdsEncrypType","h") = "AES" then asp_Write("selected") end if %> >TKIP+AES</OPTION>
													</SELECT>
													</TD>
												</TR>
<% end if %>
												<TR>
													<TD><div class="form-text">WDS密钥</div></TD>
													<TD><INPUT TYPE="TEXT" NAME="WDS_Key" STYLE="WIDTH:140" SIZE="48" MAXLENGTH="64" VALUE="<% If tcWebApi_get("WLan11ac_WDS","WdsKey","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","WdsKey","s") end if %>" onBlur="WDSKeyCheck(this)">
                                                        <div class="font-help">(8~63个字符或64个十六进制字符串)</div></TD>
												</TR>
											</TBODY>
											</TABLE>
			
							
							<table cellSpacing=0 cellPadding=0 border=0 style="width: 714px;margin: 0 auto;">							
								<TR>
									<TD colspan='2'>
                                        <P style="margin-left: 182px;">
                                            <BUTTON id="btnOK1" onclick="doSave(25)" type="button" name="BUTTON">保 存</BUTTON>
                                        </P>
									</TD>
								</TR>		
							</table>

						</div>
						</FORM>
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
<% tcWebApi_constSet("WebCurSet_Entry", "info_wlan11ac_read", "0") %>
