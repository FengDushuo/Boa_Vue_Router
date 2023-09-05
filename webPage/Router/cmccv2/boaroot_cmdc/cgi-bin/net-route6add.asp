<%
if Request_Form("IPv6_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","route6_id","curSetIdx")
	
	TCWebApi_set("Route6_Entry","Active","hEnableflag")
	TCWebApi_set("Route6_Entry","DST_IP","DestIPAddress")
	TCWebApi_set("Route6_Entry","Prefix_len","PrefixLen")
	if Request_Form("gwEnableflag") = "Yes" then
		TCWebApi_set("Route6_Entry","Gateway","GatewayIPAddress")
	end if
	TCWebApi_set("Route6_Entry","Device","WanInterfaceFlag")
	
	TCWebApi_set("Route6_Entry","metric","metricFlag")
	
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_commit("Route6_Entry")
	TCWebApi_save()
end if
%>
<!--[if IE]> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "w3.org/TR/html4/strict.dtd">
<!--[else]> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<![endif]-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href='/JS/stylemain.css' type='text/css'>
<title>IPv6 静态路由</title>
<script language="javascript" src="/JS/menu.js"></script>
<script language="javascript" src="/JS/util.js"></script>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<script language="JavaScript" type="text/JavaScript">
<% if Request_Form("IPv6_Flag") = "1" then %>
	location.replace("/cgi-bin/net-routeset.asp");
<%end if%>
</script>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" alink="#000000" link="#000000" vlink="#000000" style="text-align: center" onLoad="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()"
onunload="DoUnload()">
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
<div class="in_welcom" >
	<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
	<input id="Selected_Menu" type="hidden" value="网络->路由配置" name="Selected_Menu"></TD>
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
 
<tr>
<td class="content">
<script language="JavaScript" type="text/javascript">
	var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	// num 0
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryName = vArrayStr.split(',');
	// num 1
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryValue = vArrayStr.split(',');
	// num 2~5
	<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "4") %>
	// num 6
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var Wan_IPVERSION = vArrayStr.split(',');

	vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
	vEntryValue = SortUtil.SortMyArray( vEntryValue );
	Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
	
var host = [["InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","192.168.1.1","255.255.255.0"],null];
var IpAddress = host[0][1];
var SubnetMask = host[0][2];
function stWanppp(domain,wanName,CntType,address,enable,servicelist)
{
this.domain = domain;
var list = domain.split('.');
this.key = 	list[4];
this.wanName = wanName;
this.CntType = CntType;
this.LinkType = '';
this.address = address;
this.enable = enable;
this.servicelist = servicelist;
}
function stWanip(domain,wanName,CntType,address,enable,servicelist)
{
this.domain = domain;
var list = domain.split('.');
this.key = 	list[4];
this.wanName = wanName;
this.CntType = CntType;
this.LinkType = '';
this.address = address;
this.enable = enable;
this.servicelist = servicelist;
}
function stDsl(domain,LinkType,address,enable,servicelist)
{
this.domain = domain;
var list = domain.split('.');
this.key = 	list[4];
this.LinkType = LinkType;
this.address = address;
this.enable = enable;
this.servicelist = servicelist;
}
var WanPPP = new Array(new stWanppp("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANPPPConnection.2","1_TR069_INTERNET_R_0_35","IP_Routed","","1","TR069_INTERNET"),null);
var WanIP = new Array(null);
var CntPvc = new Array(new stDsl("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","EoA"),null);
var k = 0;
var Wan = new Array();
for (i = 0; i < WanPPP.length-1; i++)
{
if ((WanPPP[i].enable == 0)
|| (WanPPP[i].servicelist.indexOf('TR069') >= 0)
|| (WanPPP[i].CntType.indexOf('Bridge') > -1))
{
continue;
}
Wan[k] = WanPPP[i];
k++;
}
for (j = 0; j < WanIP.length-1; j++)
{
if ((WanIP[j].enable == 0)
|| (WanIP[j].servicelist.indexOf('TR069') >= 0)
|| (WanIP[j].CntType.indexOf('Bridge') > -1))
{
continue;
}
Wan[k] = WanIP[j];
k++;
}

var route6count = 32;
function stStaticRoute6(Domain, DestIPAddress, PrefixLength, GatewayIPAddress, Interface)
{
	this.Domain = Domain;
	this.DestIPAddress = DestIPAddress;
	this.PrefixLength = PrefixLength;
	this.GatewayIPAddress = GatewayIPAddress;
	this.Interface = Interface;
}
function getStaticRoute6Info()
{
	var	nCurTemp = 0;
	var	vDestIPAddress = new Array(route6count);
	var	vPrefixLength = new Array(route6count);
	var	vcurLinks = new Array(route6count);
	
	vDestIPAddress[0] = "<% tcWebApi_get("Route6_Entry0","DST_IP","s") %>";
	vDestIPAddress[1] = "<% tcWebApi_get("Route6_Entry1","DST_IP","s") %>";
	vDestIPAddress[2] = "<% tcWebApi_get("Route6_Entry2","DST_IP","s") %>";
	vDestIPAddress[3] = "<% tcWebApi_get("Route6_Entry3","DST_IP","s") %>";
	vDestIPAddress[4] = "<% tcWebApi_get("Route6_Entry4","DST_IP","s") %>";
	vDestIPAddress[5] = "<% tcWebApi_get("Route6_Entry5","DST_IP","s") %>";
	vDestIPAddress[6] = "<% tcWebApi_get("Route6_Entry6","DST_IP","s") %>";
	vDestIPAddress[7] = "<% tcWebApi_get("Route6_Entry7","DST_IP","s") %>";
	vDestIPAddress[8] = "<% tcWebApi_get("Route6_Entry8","DST_IP","s") %>";
	vDestIPAddress[9] = "<% tcWebApi_get("Route6_Entry9","DST_IP","s") %>";
	vDestIPAddress[10] = "<% tcWebApi_get("Route6_Entry10","DST_IP","s") %>";
	vDestIPAddress[11] = "<% tcWebApi_get("Route6_Entry11","DST_IP","s") %>";
	vDestIPAddress[12] = "<% tcWebApi_get("Route6_Entry12","DST_IP","s") %>";
	vDestIPAddress[13] = "<% tcWebApi_get("Route6_Entry13","DST_IP","s") %>";
	vDestIPAddress[14] = "<% tcWebApi_get("Route6_Entry14","DST_IP","s") %>";
	vDestIPAddress[15] = "<% tcWebApi_get("Route6_Entry15","DST_IP","s") %>";
	vDestIPAddress[16] = "<% tcWebApi_get("Route6_Entry16","DST_IP","s") %>";
	vDestIPAddress[17] = "<% tcWebApi_get("Route6_Entry17","DST_IP","s") %>";
	vDestIPAddress[18] = "<% tcWebApi_get("Route6_Entry18","DST_IP","s") %>";
	vDestIPAddress[19] = "<% tcWebApi_get("Route6_Entry19","DST_IP","s") %>";
	vDestIPAddress[20] = "<% tcWebApi_get("Route6_Entry20","DST_IP","s") %>";
	vDestIPAddress[21] = "<% tcWebApi_get("Route6_Entry21","DST_IP","s") %>";
	vDestIPAddress[22] = "<% tcWebApi_get("Route6_Entry22","DST_IP","s") %>";
	vDestIPAddress[23] = "<% tcWebApi_get("Route6_Entry23","DST_IP","s") %>";
	vDestIPAddress[24] = "<% tcWebApi_get("Route6_Entry24","DST_IP","s") %>";
	vDestIPAddress[25] = "<% tcWebApi_get("Route6_Entry25","DST_IP","s") %>";
	vDestIPAddress[26] = "<% tcWebApi_get("Route6_Entry26","DST_IP","s") %>";
	vDestIPAddress[27] = "<% tcWebApi_get("Route6_Entry27","DST_IP","s") %>";
	vDestIPAddress[28] = "<% tcWebApi_get("Route6_Entry28","DST_IP","s") %>";
	vDestIPAddress[29] = "<% tcWebApi_get("Route6_Entry29","DST_IP","s") %>";
	vDestIPAddress[30] = "<% tcWebApi_get("Route6_Entry30","DST_IP","s") %>";
	vDestIPAddress[31] = "<% tcWebApi_get("Route6_Entry31","DST_IP","s") %>";
	
	vPrefixLength[0] = "<% tcWebApi_get("Route6_Entry0","Prefix_len","s") %>";
	vPrefixLength[1] = "<% tcWebApi_get("Route6_Entry1","Prefix_len","s") %>";
	vPrefixLength[2] = "<% tcWebApi_get("Route6_Entry2","Prefix_len","s") %>";
	vPrefixLength[3] = "<% tcWebApi_get("Route6_Entry3","Prefix_len","s") %>";
	vPrefixLength[4] = "<% tcWebApi_get("Route6_Entry4","Prefix_len","s") %>";
	vPrefixLength[5] = "<% tcWebApi_get("Route6_Entry5","Prefix_len","s") %>";
	vPrefixLength[6] = "<% tcWebApi_get("Route6_Entry6","Prefix_len","s") %>";
	vPrefixLength[7] = "<% tcWebApi_get("Route6_Entry7","Prefix_len","s") %>";
	vPrefixLength[8] = "<% tcWebApi_get("Route6_Entry8","Prefix_len","s") %>";
	vPrefixLength[9] = "<% tcWebApi_get("Route6_Entry9","Prefix_len","s") %>";
	vPrefixLength[10] = "<% tcWebApi_get("Route6_Entry10","Prefix_len","s") %>";
	vPrefixLength[11] = "<% tcWebApi_get("Route6_Entry11","Prefix_len","s") %>";
	vPrefixLength[12] = "<% tcWebApi_get("Route6_Entry12","Prefix_len","s") %>";
	vPrefixLength[13] = "<% tcWebApi_get("Route6_Entry13","Prefix_len","s") %>";
	vPrefixLength[14] = "<% tcWebApi_get("Route6_Entry14","Prefix_len","s") %>";
	vPrefixLength[15] = "<% tcWebApi_get("Route6_Entry15","Prefix_len","s") %>";
	vPrefixLength[16] = "<% tcWebApi_get("Route6_Entry16","Prefix_len","s") %>";
	vPrefixLength[17] = "<% tcWebApi_get("Route6_Entry17","Prefix_len","s") %>";
	vPrefixLength[18] = "<% tcWebApi_get("Route6_Entry18","Prefix_len","s") %>";
	vPrefixLength[19] = "<% tcWebApi_get("Route6_Entry19","Prefix_len","s") %>";
	vPrefixLength[20] = "<% tcWebApi_get("Route6_Entry20","Prefix_len","s") %>";
	vPrefixLength[21] = "<% tcWebApi_get("Route6_Entry21","Prefix_len","s") %>";
	vPrefixLength[22] = "<% tcWebApi_get("Route6_Entry22","Prefix_len","s") %>";
	vPrefixLength[23] = "<% tcWebApi_get("Route6_Entry23","Prefix_len","s") %>";
	vPrefixLength[24] = "<% tcWebApi_get("Route6_Entry24","Prefix_len","s") %>";
	vPrefixLength[25] = "<% tcWebApi_get("Route6_Entry25","Prefix_len","s") %>";
	vPrefixLength[26] = "<% tcWebApi_get("Route6_Entry26","Prefix_len","s") %>";
	vPrefixLength[27] = "<% tcWebApi_get("Route6_Entry27","Prefix_len","s") %>";
	vPrefixLength[28] = "<% tcWebApi_get("Route6_Entry28","Prefix_len","s") %>";
	vPrefixLength[29] = "<% tcWebApi_get("Route6_Entry29","Prefix_len","s") %>";
	vPrefixLength[30] = "<% tcWebApi_get("Route6_Entry30","Prefix_len","s") %>";
	vPrefixLength[31] = "<% tcWebApi_get("Route6_Entry31","Prefix_len","s") %>";
	
	for(var i=0; i<route6count; i++)
	{
		if(vDestIPAddress[i] != "N/A")
			vcurLinks[nCurTemp++] = new stStaticRoute6(i, vDestIPAddress[i], vPrefixLength[i], "", "");
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
var StaticRoute = getStaticRoute6Info();

function btnClear()
{
with ( document.forms[0] )
{
	DestIPAddress.value = '';
	PrefixLen.value = '';
	GatewayIPAddress.value = '';
	gEnable.checked = false;
}
}
function LoadFrame()
{
	document.ConfigForm.IPv6_Flag.value = "0";
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function CheckForm(Form)
{
//Form.usingPrefix('x');
with ( document.forms[0] )
{
	for (i = 0; i < StaticRoute.length - 1; i++)
	{
		if ((StaticRoute[i].DestIPAddress == getValue('DestIPAddress'))
		&& (StaticRoute[i].PrefixLength == getValue('PrefixLen')))
		{
			alert('目的IP地址错误，它已被其它静态路由占用了!');
			return false;
		}
	}
	var DestIp = DestIPAddress.value;
	if (DestIp == '')
	{
		alert('目的IP地址错误!');
		return false;
	}
	if (isIpv6Address(DestIp) == false)
	{
		alert('目的IP地址错误!');
		return false;
	}
	if ((PrefixLen.value == '')
	|| (!isInteger(PrefixLen.value))
	|| (parseInt(PrefixLen.value) > 128)
	|| (parseInt(PrefixLen.value) < 0))
	{
		alert('前缀长度错误!');
		return false;
	}
	var addrTmp = getValue('DestIPAddress');
	var plen1 = getValue('PrefixLen');
	var plen2 = 0;
	/*for (i = 0; i < StaticRoute.length - 1; i++)
	{
		if ((StaticRoute[i].PrefixLength == '')
		|| (StaticRoute[i].DestIPAddress == ''))
		{
			continue;
		}
		plen2 = StaticRoute[i].PrefixLength;
		if (true == CompareTwoAddress(addrTmp, plen1, StaticRoute[i].DestIPAddress, plen2))
		{
			alert('目的IP地址错误!');
			return false;
		}
	}*/
	if (gwStr.checked == true)
	{
		if (isIpv6Address(GatewayIPAddress.value) == false)
		{
			alert("默认网关错误!");
			return false;
		}
		if (isUnicastIpv6Address(GatewayIPAddress.value) == false)
		{
			alert("默认网关错误!");
			return false;
		}
	}
	if ('' == getSelectVal('Interface'))
	{
		alert('输出接口错误!');
		return false;
	}
	var selectobj = getSelectVal('Interface');
	/*if (Wan.length > 0)
	{
		for (z=0; z < Wan.length; z++)
		{
			if (Wan[z].domain == selectobj)
			{
				if ( Wan[z].address.indexOf(":") < 0 )
				{
					alert("使用接口未获取到Ipv6地址!");
					return false;
				}
			}
		}
	}*/
//Form.addParameter('DestIPAddress', DestIPAddress.value);
//Form.addParameter('PrefixLength', PrefixLen.value);
//if (gwStr.checked == true)
//{
//Form.addParameter('GatewayIPAddress',GatewayIPAddress.value);
//}
//else
//{
//Form.addParameter('GatewayIPAddress', '');
//}
//Form.addParameter('Enable', getCheckVal('gEnable'));
//Form.addParameter('Interface', getSelectVal('Interface'));
}
/*if (0 == getValue('PrefixLen'))
{
	for (i = 0; i < StaticRoute.length - 1; i++)
	{
		if (0 == StaticRoute[i].PrefixLength)
		{
			alert('目的IP地址错误!');
			return false;;
		}
	}
}*/
//Form.endPrefix();
return true;
}

function checkFormstatus()
{
	var Form = document.ConfigForm;
	if(Form.gEnable.checked)
		Form.hEnableflag.value = "Yes";
	else Form.hEnableflag.value = "No";
	
	if(Form.gwStr.checked)
		Form.gwEnableflag.value = "Yes";
	else Form.gwEnableflag.value = "No";
	
	
}
function SubmitForm()
{
var Form = document.ConfigForm;
	if (true == CheckForm(Form))
	{
	//if(Form.Interface.value == "br0")
		Form.WanInterfaceFlag.value = Form.Interface.value;	
	//else Form.WanInterfaceFlag.value = Form.Interface.value;
		checkFormstatus();
		Form.IPv6_Flag.value = "1";
		Form.submit();
	}
}
function Cancle()
{
location.replace("net-routeset.asp");
}
</script>
<table height="100%" border="0" cellpadding="0" cellspacing="0" class="tblMain">
<TBODY>
<tr>
    <TD id="MenuArea_L2">
	<ul class="TRD">
           <li id=TSD class="TSD">IPv6 静态路由</li>
       </ul>
    </TD>
	<SCRIPT language=javascript>
	MakeMenu(getElById ('Selected_Menu').value);
	</SCRIPT>
	<TD valign="top">
    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
    <TBODY>
<tr>
<td width="7" background="/img/panel3.gif">　</td>
<td valign="top">
<form name="ConfigForm" action="/cgi-bin/net-route6add.asp" method="post">
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
        <TBODY>
            <TR>
                <TD>
                    <div class="advanceTitle">添加IPv6静态路由</div>
                </TD>
            </TR>
            <TR>
                <TD>
                    <div class="title-line"></div>
                </TD>
            </TR>
<tr>
<td>
                      <input type="hidden" name="IPv6_Flag" value="0">
                      <input type="hidden" name="curSetIdx" value="<% tcWebApi_get("Route6","add_num","s") %>">
                      <input type="hidden" name="WanInterfaceFlag" value="nas0_0">
                      <input type="hidden" name="metricFlag" value="0">
                      <input type="hidden" name="hEnableflag" value="No">
                      <input type="hidden" name="gwEnableflag" value="No">
                      <script language="JavaScript" type="text/JavaScript">
var 	nCount = 8;
var		nEntryCount = 8;
function WanIndexConstruction(domain,WanName,WanMode)
{
	this.domain = domain;
	this.WanName = WanName;
	this.WanMode = WanMode;
}
	
function WriteWanNameSelected()
{
	/*var	iSlected = 0;
	var WanIDNums = CurWan;
	var nlength = WanIDNums.length-1;
	for(var i=0; i< nlength; i++)
	{
			if((WanIDNums[i].WanName.search(/TR069/i) < 1) && (WanIDNums[i].WanMode == "Route"))
				document.writeln("<option value=" + WanIDNums[i].domain + ">" + WanIDNums[i].WanName + "</option>");
			if(document.dmzForm.CurWan_Flag.value == WanIDNums[i].domain)
			{
					document.dmzForm.Interface.selectedIndex= iSlected;
			}
			iSlected++;
	}*/
	for (var i = 0; i < nEntryNum; i++)
	{
		
		if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)
		|| 'IPv4' == Wan_IPVERSION[i] )
				continue;
		document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
	}
}
</script>

<table border="0" cellpadding="0" cellspacing="0">
<TBODY>
<tr>
    <td class='w-180'><div class="form-text">静态路由</div></td>
    <td>
    <input class="input-onoff" type="checkbox" name='gEnable' value="Yes">
    </td>
</tr>
<tr>
<td><div class="form-text">目的网络地址</div></td>
<td><input type='text' name='DestIPAddress' maxlength='64'></td>
</tr>
<tr>
<td><div class="form-text">前缀长度</div></td>
<td><input type="text" name="PrefixLen" maxlength="64" >
</td>
</tr>
<tr>
<td ><div class="form-text" style="margin-left: 0;"><input type="checkbox" name='gwStr'>
<span>默认网关</span></div></td>
<td><input type='text' maxlength='64' name='GatewayIPAddress'></td>
</tr>
<tr>
<td><div class="form-text">使用接口</div></td>
<td><select name='Interface'  id="Interface" style="width:153px">
<script language="javascript">
WriteWanNameSelected();
document.writeln("<option value='br0'> LAN/br0");
</script>
</select>
</td>
</tr>
<tr>
    <td colspan="2">
        <P style="margin-top: 32px;margin-left: 182px;">
            <input type="button" style="width: 140px;" id="btnOK" onClick="SubmitForm()" value="确 定">
            <input type="button" id="btnCancel" style="margin-left: 24px;" name="btnCancel" onClick="Cancle()" value="返 回">
        </p>
    </td>
</tr>
</TBODY>
</table>
</td>
</tr>
</TBODY>
</table>
</form>
</td>
</tr>
</TBODY>
</table>
</td>
</tr>
</TBODY></table></td>
</tr>
<TBODY>
</table>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</body>
</html>
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>
