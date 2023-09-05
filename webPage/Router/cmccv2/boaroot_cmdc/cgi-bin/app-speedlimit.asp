<!--[if IE]>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[else]>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<![endif]-->
<%
if Request_Form("speedlimitflag") = "1" then
	tcWebApi_JsonHook("cmcc_lanhost_speedlimit_list","speedlimitlist")
end if
%>
<html>
<head>
<title>设备限速</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache,must-revalidate"/>
<meta http-equiv="viewport" content="width-device-width,initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="stylesheet" href="/JS/stylemain.css"/>
<script language="javascript" src="/JS/json2.js"></script>
<script language="javascript" src="/JS/menu.js"></script>
<script language="javascript" src="/JS/util.js"></script>
<script language="javascript" src="/JS/printtable.js"></script>
<script language="javascript" src="/JS/jquery-1.8.3.min.js"></script> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<script language=Javascript type=text/javascript>
/* get current browser type */
var browserType = getBrowserType();

/* dhcp info */
var gwAddrTmp = '<% tcWebApi_get("alinkmgr_Entry","gwAddr","s") %>';
var gwAddr = gwAddrTmp.split(':');
var portIPTemp = '<% tcWebApi_get("Info_Ether","PortIP","s") %>';
var portIP = portIPTemp.split(',');
var dhcpNum = portIP.length - 1;
var portMacTemp = '<% tcWebApi_get("Info_Ether","PortMac","s") %>';
portMacTemp += '<% tcWebApi_get("Info_Ether","PortMac2","s") %>';
var portMac = portMacTemp.split(',');

/* maxbandwidth info */
var maxbandwidthInfo = '<% tcWebApi_JsonHook("get_maxbandwidth_info","action","area") %>';

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

function appSpeedLimitInfoInit()
{
	for ( var i = 0; i < dhcpNum; i++ )
	{
		if ( (portIP[i] != "N/A" || portMac[i] != "N/A") && (portIP[i] != gwAddr[0]) )
		{
			document.write('<tr class="trStyle3">');
			document.write('<td align="center" class="tdWidth3">' + (i+1) + '</td>');
			document.write('<td align="center" class="tdWidth3">' + portIP[i] + '</td>');
			document.write('<td align="center" class="tdWidth3">' + portMac[i] + '</td>');
			document.write('<td align="center" class="tdWidth3"><input class="input-small" type="text" style="background: none;color: #3f414a;margin: 0;min-width: 94px;width: 94px;" size="8" id="up_' + i + '" name="up_' + i + '" value="0"/>&nbsp;kbps</td>');
			document.write('<td align="center" class="tdWidth3"><input class="input-small" type="text" style="background: none;color: #3f414a;margin: 0;min-width: 94px;width: 94px;" size="8" id="down_' + i + '" name="down_' + i + '" value="0"/>&nbsp;kbps</td>');
			document.write('</tr>');
		}
	}
}

function appSpeedLimitInfoUpdate()
{
	var rsp = JSON.parse(maxbandwidthInfo);
	var maxbandwidthList = rsp.data;
    console.log(maxbandwidthList)
	var maxbandwidthListLen = maxbandwidthList.length;
	
	if ( maxbandwidthListLen )
	{
		for ( var i = 0; i < dhcpNum; i++ )
		{
			for ( var j = 0; j < maxbandwidthListLen; j++ )
			{
				if ( maxbandwidthList[j]['Mac'] == doDelColon(portMac[i]) )
				{
					setText("up_"+i, maxbandwidthList[j]['upRate']);
					setText("down_"+i, maxbandwidthList[j]['downRate']);
				}	
			}
		}
	}
}

function checkUpDownRate()
{
	for ( var i = 0; i < dhcpNum; i++ )
	{
		var uprate = doDelSpaces(getValue("up_"+i));
		var downrate = doDelSpaces(getValue("down_"+i));

		if ( "" == uprate )
		{
			setText("up_"+i, 0);
			uprate = 0;
		}

		if ( "" == downrate )
		{
			setText("down_"+i, 0);
			downrate = 0;
		}

		if ( !doCheckIsNumber(uprate) || !doCheckIsNumber(downrate) )
		{
			alert("限速值非法");
			return false;
		}
		
		if ( parseInt(uprate) > 102400 || parseInt(downrate) > 102400 )
		{
			alert("限速值不能超过102400");
			return false;
		}
	}
	
	return true;
}

function appSpeedLimitInfoSubmit()
{
	var speedlimitList = "";
	
	for ( var i = 0; i < dhcpNum; i++ )
	{
		if ( (portIP[i] != "N/A" || portMac[i] != "N/A") && (portIP[i] != gwAddr[0]) )
		{
			speedlimitList += i + " " + doDelColon(portMac[i]) + " " 
										+ doDelSpaces(getValue("up_"+i)) + " " 
										+ doDelSpaces(getValue("down_"+i)) + ";";
		}
	}
	setText("speedlimitlist", speedlimitList);
}

function LoadFrame()
{
	/* IE height */
	if ( browserType == "IE" || browserType == "IE 11" )
	{
		setheight("tblForm", "header", "TDF");
	}

	appSpeedLimitInfoUpdate();
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function SubmitForm()
{
	if ( checkUpDownRate() )
	{
		appSpeedLimitInfoSubmit();
		setText("speedlimitflag", 1);
		getElById("ConfigForm").submit();
	}
}

/* IE change height */
if ( browserType == "IE" || browserType == "IE 11" )
{
	window.onresize = function()
	{
		setheight("tblForm", "header", "TDF");
	}
}	
</script>
</head>
<body vLink="#000000" aLink="#000000" link="#000000" leftMargin="0" topMargin="0" 
marginheight="0" marginwidth="0" onload="DisplayLocation(getElement('Selected_Menu').value);if(getElById('ConfigForm') != null)LoadFrame();">
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
			智能组网终端
		</span>
	</div>
	<div class="in_welcom">
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="应用->设备限速配置" name="Selected_Menu">
	</div>
</div>
<table align="center" cellSpacing="0" cellPadding="0" border="0" class="major">
<tbody>
<tr id="header">
<td class="header">
	<table cellSpacing="0" cellPadding="0" border="0" id="table2">
	<tbody>
	<tr><td id=MenuArea_L1></td></tr>
	</tbody>
	</table>
</td>
</tr>
<tr>
<td class="content">
	<table cellSpacing="0" cellPadding="0" border="0" class="tblMain hp-100">
	<tbody>
	<tr>
	<td id="MenuArea_L2">
		<ul class="TRD">
			<li id="设备限速" class="TSD">设备限速</li>
		</ul>
	</td>
	<SCRIPT language=javascript>
	MakeMenu(getElById ('Selected_Menu').value);
	</SCRIPT>
	<td valign="top">
            <TABLE id="tblForm" cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                <TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">设备限速</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
		<tr>
		<td width="7" background="/img/panel3.gif"></td>
		<td valign="top">
			<form id="ConfigForm" action="/cgi-bin/app-speedlimit.asp" method="post">
			<input type="hidden" id="speedlimitflag" name="speedlimitflag" value="0"/>
			<input type="hidden" id="speedlimitlist" name="speedlimitlist" value="0"/>
			<div class="table-outer">
                <table cellSpacing="0" cellPadding="0" border="1" class="autoList tblList">
                    <thead>
                    <tr class="trStyle2">
                    <td class="tdWidth2">索引</TD>
                    <td class="tdWidth2">IP地址</TD>
                    <td class="tdWidth2">MAC地址</TD>
                    <td class="tdWidth2">上行限速</TD>
                    <td class="tdWidth2">下行限速</TD>
                    </tr>
                    </thead>
                    <tbody>
                    <script language=Javascript type=text/javascript>
                    appSpeedLimitInfoInit();
                    </script>
                    </tbody>
                    </table>
                </div>
			</form>
		</td>
		</tr>
		<tr>
		<td colspan='2'>
			<p class="text-center">
			<input type="button" id="btnOK" style="width: 200px;" onclick="SubmitForm()" value="保 存">
			</p>
		</td>
		</tr>	
		</tbody>
		</table>
	</td>
	</tr>	
	</tbody>
	</table>	
</td>
</tr>
</tbody>
</table>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</body>
</html>

