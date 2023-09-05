<!--[if IE]>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[else]>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<![endif]-->
<%
if Request_Form("Wizard_Flag") = "1" then
	tcWebApi_constSet("System_Entry","IsGoWizard","No")
end if

if Request_Form("Wan_Flag") = "1" then
	TCWebApi_set("APWanInfo_Common","FixedAPMode","wanapmode")
	TCWebApi_commit("APWanInfo_Common")
elseif Request_Form("Wan_Flag") = "2" then
	TCWebApi_set("APWanInfo_Common","FixedAPMode","wanapmode")
	TCWebApi_set("Wan_PVC0_Entry0","LinkMode","dhcppppnet")
	tcWebApi_constSet("Wan_PVC0_Entry0","ISP","0")
	TCWebApi_commit("Wan_PVC0_Entry0")
	TCWebApi_commit("APWanInfo_Common")
elseif Request_Form("Wan_Flag") = "3" then
	TCWebApi_set("APWanInfo_Common","FixedAPMode","wanapmode")
	TCWebApi_set("Wan_PVC0_Entry0","LinkMode","dhcppppnet")
	TCWebApi_set("Wan_PVC0_Entry0","USERNAME","pppUserName")
	TCWebApi_set("Wan_PVC0_Entry0","PASSWORD","pppPassword")
	TCWebApi_commit("Wan_PVC0_Entry0")
	TCWebApi_commit("APWanInfo_Common")
end if

if Request_Form("WifiSSID_Flag") = "1" then
	TCWebApi_set("WLan_Entry0","SSID","wlssid")
	TCWebApi_set("WLan11ac_Entry0","SSID","wlacssid")
	if Request_Form("WifiWPAPSK_Flag") = "1" then	
		TCWebApi_set("WLan_Entry0","WPAPSK","wlpwd")
		TCWebApi_set("WLan11ac_Entry0","WPAPSK","wlpwd")
	else
		tcWebApi_constSet("WLan_Entry0","AuthMode","OPEN")
		tcWebApi_constSet("WLan11ac_Entry0","AuthMode","OPEN")
	end if
	TCWebApi_commit("WLan_Entry0")
	TCWebApi_commit("WLan11ac_Entry0")
	TCWebApi_save()	
end if
%>
<HTML>
<HEAD>
<TITLE>Wizard</TITLE>
<META http-equiv="pragma" content="no-cache">
<META http-equiv="cache-control" content="no-cache,must-revalidate">
<META http-equiv="viewport" content="width-device-width,initial-scale=1.0">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK type="text/css" rel="stylesheet" href="/JS/stylemain.css">
<SCRIPT language="javascript" src="/JS/util.js"></SCRIPT>
<SCRIPT language="javaScript" src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=JavaScript type=text/javascript>
<% if tcwebApi_get("System_Entry","IsGoWizard","h") = "Yes" then %>
var browserType = getBrowserType();
var wifissid = '<%tcWebApi_get("WLan_Entry","SSID","s")%>';
var wifissidac = '<%tcWebApi_get("WLan11AC_Entry","SSID","s")%>';	
	
function wizardsubmit()
{
	setText("Wizard_Flag", 1);
	getElById("ConfigForm").submit();
}

function showdhcpnet() 
{
	setDisplay("pppoe_username_net", 0);
	setDisplay("pppoe_password_net", 0);
}

function showpppnet() 
{
	setDisplay("pppoe_username_net", 1);
	setDisplay("pppoe_password_net", 1);
}

function showapwk() 
{
	setDisplay("net", 0);
	showdhcpnet();
	setSelect("sel_net", "linkIP");
}

function showwanwk() 
{
	setDisplay("net", 1);
	showdhcpnet();
	setSelect("sel_net", "linkIP");
}

function doswnetsetting(val)
{
	if ( val == "linkIP" )
	{
		showdhcpnet();
	}
	else if ( val == "linkPPP" )
	{
		showpppnet();
	}
}

function doswwkmode(val)
{	
	if ( val == "Route" )
	{
		showwanwk();
	}
	else if ( val == "Bridge" )
	{
		showapwk();
	}
}

function dowifiencrypt(val)
{
	setDisplay("wifipassword", val);
}

function checkpppform()
{
	/* check pppoe username */
	var pppuname = getValue("uname_net");
	if ( pppuname == "" )
	{
		alert("上网账号不能为空");
		return false;
	}
	
	if ( isValidNameEx(pppuname) == false )
	{
		alert("上网账号不合法");
		return false;
	}

	/* check pppoe password */
	var ppppwd = getValue("pwd_net");
	if ( ppppwd == "" )
	{
		alert("上网密码不能为空");
		return false;
	}
	
	if ( isValidNameEx(ppppwd) == false )
	{
		alert("上网密码不合法");
		return false;
	}
	
	return true;
}

function checkwlform()
{
	/* check wifi 2.4g */
	var wlSsid = getValue("wifiname");
	if ( wlSsid == "" )
	{
		alert("wifi 2.4g名称不能为空");
		return false;
	}
	var wlSsid_substr = wlSsid.substring(0, 5);
	if ( wlSsid_substr != "CMCC-" )
	{
		alert("wifi 2.4g名称必须以'CMCC-'开头");
		return false;
	}
	
	/* check wifi 5g */
	var wlacSsid = getValue("wifiacname");
	if ( wlacSsid == "" )
	{
		alert("wifi 5g名称不能为空");
		return false;
	}	
	var wlSsidac_substr = wlacSsid.substring(0, 5);
	if ( wlSsidac_substr != "CMCC-" )
	{
		alert("wifi 5g名称必须以'CMCC-'开头");
		return false;
	}
	
	var wlencrypt = getRadioVal("wifiencrypt");
	if ( wlencrypt == "Yes" )
	{
		/* check wifi password */
		var wlallWpa = getValue("wifipwd");
		if ( wlallWpa == "" )
		{
			alert("wifi密码不能为空");
			return false;
		}
		else
		{
			setText("WifiWPAPSK_Flag", 1);
		}
	}

	return true;
}

function btnCommit()
{
	if ( checkwlform() )
	{
		var sel_wk = getValue("sel_wk");
		if ( sel_wk == "Bridge" )
		{
			setText("WifiSSID_Flag", 1);
			setText("Wan_Flag", 1); 
		}
		else if ( sel_wk == "Route" )
		{
			var sel_net = getValue("sel_net");
			if ( sel_net == "linkIP" )
			{
				setText("WifiSSID_Flag", 1);
				setText("Wan_Flag", 2); 
			}
			else if ( sel_net == "linkPPP" )
			{
				if ( checkpppform() )
				{
					setText("WifiSSID_Flag", 1);
					setText("Wan_Flag", 3); 
				}
				else
				{
					return false;
				}
			}
		}
		wizardsubmit();
	}
}

function LoadFrame()
{
	/* IE height */
	if ( browserType == "IE" || browserType == "IE 11" )
	{
		setheight("tblForm", "header", "TDF", "", "", "");
	}
	/* init form */
	setText("wifiname", wifissid);
	setText("wifiacname", wifissidac);
	setSelect("sel_wk", "Bridge");
	showapwk();
	setRadio("wifiencrypt", "Yes");
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

/* IE change height */
if ( browserType == "IE" || browserType == "IE 11" )
{
	window.onresize = function()
	{
		setheight("tblForm", "header", "TDF", "", "", "");
	}
}	
<% else %>
top.window.location.href ='/cgi-bin/content.asp';
<% end if %>
</SCRIPT>
</HEAD>
<% if tcwebApi_get("System_Entry","IsGoWizard","h") = "Yes" then %>
<BODY vLink="#000000" aLink="#000000" link="#000000" leftMargin="0" topMargin="0" 
marginheight="0" marginwidth="0" onload="if(getElById('ConfigForm') != null)LoadFrame();">
<TABLE class="major" cellSpacing="0" cellPadding="0" border="0" align="center">
<TBODY>
<TR id="header">
<TD class="header">
	<TABLE class="tbl_nav" cellSpacing="0" cellPadding="0" border="0">
	<TBODY>
	<TR>
	<TD>&nbsp;</TD>
	<TD>
		<TABLE id="table8" cellSpacing="0" cellPadding="0" border="0">
		<TBODY>
		<TR>
			<TD class="td_model text-left"></TD>
			<TD class="welcom">
		</TR>
		</TBODY>
		</TABLE>
	</TD>
	</TR>
	</TBODY>
	</TABLE>
	<TABLE class="tbl_qr" cellSpacing="0" cellPadding="0" border="0">
	<TBODY>
	<TR><TD><img src="/img/qr.png" width="100" height="100"></TD></TR>
	</TBODY>
	</TABLE>
	<TABLE id="table2" cellSpacing="0" cellPadding="0" border="0">
	<TBODY>
	<TR><TD id=MenuArea_L1></TD></TR>
	<TR><TD id=MenuArea_L2></TD></TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<TR>
<TD class="content">
	<TABLE class="tblMain hp-100" cellSpacing="0" cellPadding="0" border="0">
	<TBODY>
	<TR>
	<TD class="Item_T" rowspan="3"><ul class="TRD"><li class="TSD">快速上网配置</li></ul></TD>
	<TD class="w-10"></TD>
	<TD>
		<TABLE id="tblForm" class="hp-100" cellSpacing="0" cellPadding="0" border="0">
		<TBODY>
		<TR>
		<TD valign='top'>
			<FORM id="ConfigForm" action="/cgi-bin/wizard.asp" method="post">
			<INPUT type="hidden" id="Wizard_Flag" name="Wizard_Flag" value="0"/>
			<INPUT type="hidden" id="Wan_Flag" name="Wan_Flag" value="0"/>
			<INPUT type="hidden" id="WifiSSID_Flag" name="WifiSSID_Flag" value="0"/>
			<INPUT type="hidden" id="WifiWPAPSK_Flag" name="WifiWPAPSK_Flag" value="0"/>
			<TABLE cellSpacing="0" cellPadding="0" border="0">
			<TBODY>
			<TR><TD colspan="2"><FONT size="2"><B>首次使用，一次设置，即可快速联网。</B></FONT></TD></TR>
			<TR>
			<TD class="w-130 text-left"><FONT>工作模式:</FONT></TD>
			<TD class="text-left">
				<SELECT class="w-200" id="sel_wk" name="wanapmode" onchange="doswwkmode(this.value)">
					<OPTION value="Route">WAN上行模式</OPTION>
					<OPTION value="Bridge">AP模式</OPTION>
				</SELECT>
			</TD>
			</TR>
			<TR id="net">
			<TD class="w-130 text-left"><FONT>上网方式:</FONT></TD>
			<TD class="text-left">
				<SELECT class="w-200" id="sel_net" name="dhcppppnet" onchange="doswnetsetting(this.value)">
					<OPTION value="linkIP">自动获取IP地址</OPTION>
					<OPTION value="linkPPP">PPPoE拨号</OPTION>
				</SELECT>
			</TD>
			</TR>
			<TR id="pppoe_username_net">
			<TD class="w-130 text-left"><FONT>上网账号:</FONT></TD>
			<TD class="text-left"><INPUT class="w-200" type="text" id="uname_net" name="pppUserName" maxLength=65 value=""/></TD>
			</TR>
			<TR id="pppoe_password_net">
			<TD class="w-130 text-left"><FONT>上网密码:</FONT></TD>
			<TD class="text-left"><INPUT class="w-200" type="text" id="pwd_net" name="pppPassword" maxLength=65 value=""/></TD>
			</TR>
			<TR>
			<TD class="w-130 text-left"><FONT>WI-FI名称(2.4G):</FONT></TD>
			<TD class="text-left"><INPUT class="w-200" type="text" id="wifiname" name="wlssid" maxLength=33 value=""/></TD>
			</TR>
			<TR>
			<TD class="w-130 text-left"><FONT>WI-FI名称(5G):</FONT></TD>
			<TD class="text-left"><INPUT class="w-200" type="text" id="wifiacname" name="wlacssid" maxLength=65 value=""/></TD>
			</TR>
			<TR>
			<TD class="w-130 text-left"><FONT>WI-FI是否加密:</FONT></TD>
			<TD class="text-left">
			<INPUT type="radio" name="wifiencrypt" value="Yes" onclick="dowifiencrypt(1)"/>
			<FONT>加密</FONT>&nbsp;&nbsp;
			<INPUT type="radio" name="wifiencrypt" value="No" onclick="dowifiencrypt(0)"/>
			<FONT>不加密</FONT>
			</TD>
			</TR>
			<TR id="wifipassword">
			<TD class="w-130 text-left"><FONT>WI-FI密码:</FONT></TD>
			<TD class="text-left"><INPUT class="w-200" type="text" id="wifipwd" name="wlpwd" maxLength=63 value=""/></TD>
			</TR>
			</TBODY>
			</TABLE>
			</FORM>
		</TD>
		</TR>
		<TR>
		<TD colspan="2">
		<P align=center>
		<IMG id="btnOK" onclick="btnCommit()" src="/img/ok.gif" border="0">
		&nbsp;&nbsp;
		<IMG id="btnCancel" onclick="wizardsubmit()" src="/img/cancel.gif" border="0">
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
<!-- copyright bottom -->
<SCRIPT language=JavaScript type=text/javascript>
printCopyRightBottom();
</SCRIPT>
</TBODY>
</TABLE>
</BODY>
<% end if %>
</HTML>

