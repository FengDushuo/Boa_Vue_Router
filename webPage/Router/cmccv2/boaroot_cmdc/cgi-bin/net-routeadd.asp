<%
if Request_Form("SaveFlag") = "1" then
	TCWebApi_set("WebCurSet_Entry","route_id","add_num")
	TCWebApi_set("Route_Entry","DST_IP","DestIPAddress")
	TCWebApi_set("Route_Entry","Sub_mask","DestSubnetMask")
	if Request_Form("gwflag") = "Yes" then
		TCWebApi_set("Route_Entry","Gateway","GatewayIPAddress")
	end if
	if Request_Form("ifflag") = "Yes" then
		TCWebApi_set("Route_Entry","Device","WanInterfaceFlag")
	end if
	TCWebApi_set("Route_Entry","metric","metricFlag")

	TCWebApi_commit("Route_Entry")
	TCWebApi_save() 
elseif Request_Form("SaveFlag") = "2" then
		TCWebApi_set("WebCurSet_Entry","wan_pvc","Interface")
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
<title>静态路由</title>
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
<% if Request_Form("SaveFlag") = "1" then %>
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
function stWan(domain,wanName,CntType)
{
this.domain = domain;
var list = domain.split('.');
this.key = 	list[4];
this.wanName = wanName;
this.CntType = CntType;
this.LinkType = '';
}
function stDsl(domain,LinkType)
{
this.domain = domain;
var list = domain.split('.');
this.key = 	list[4];
this.LinkType = LinkType;
}
var WanPPP = new Array(new stWan("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANPPPConnection.2","1_TR069_INTERNET_R_0_35","IP_Routed"),null);
var WanIP = new Array(null);
var CntPvc = new Array(new stDsl("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","EoA"),null);
if (WanPPP.length > 1)
AssociateParam('WanPPP','CntPvc','LinkType');
if (WanIP.length > 1)
AssociateParam('WanIP','CntPvc','LinkType');
var Wan = new Array();
for (i = 0; i < WanIP.length-1; i++)
{
	Wan[i] = WanIP[i];
}
for (j = 0; j < WanPPP.length-1; i++,j++)
{
	Wan[i] =  WanPPP[j];
}

var routecount = 32;
function stStaticRoute(domain,DestIPAddress)
{
	this.domain = domain;
	this.DestIPAddress = DestIPAddress;
}
function getStaticRouteInfo()
{
	var	nCurTemp = 0;
	var	vDestIPAddress = new Array(routecount);
	var	vcurLinks = new Array(routecount);
	
	vDestIPAddress[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
	vDestIPAddress[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
	vDestIPAddress[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
	vDestIPAddress[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
	vDestIPAddress[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
	vDestIPAddress[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
	vDestIPAddress[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
	vDestIPAddress[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";
	vDestIPAddress[8] = "<% tcWebApi_get("Route_Entry8","DST_IP","s") %>";
	vDestIPAddress[9] = "<% tcWebApi_get("Route_Entry9","DST_IP","s") %>";
	vDestIPAddress[10] = "<% tcWebApi_get("Route_Entry10","DST_IP","s") %>";
	vDestIPAddress[11] = "<% tcWebApi_get("Route_Entry11","DST_IP","s") %>";
	vDestIPAddress[12] = "<% tcWebApi_get("Route_Entry12","DST_IP","s") %>";
	vDestIPAddress[13] = "<% tcWebApi_get("Route_Entry13","DST_IP","s") %>";
	vDestIPAddress[14] = "<% tcWebApi_get("Route_Entry14","DST_IP","s") %>";
	vDestIPAddress[15] = "<% tcWebApi_get("Route_Entry15","DST_IP","s") %>";
	vDestIPAddress[16] = "<% tcWebApi_get("Route_Entry16","DST_IP","s") %>";
	vDestIPAddress[17] = "<% tcWebApi_get("Route_Entry17","DST_IP","s") %>";
	vDestIPAddress[18] = "<% tcWebApi_get("Route_Entry18","DST_IP","s") %>";
	vDestIPAddress[19] = "<% tcWebApi_get("Route_Entry19","DST_IP","s") %>";
	vDestIPAddress[20] = "<% tcWebApi_get("Route_Entry20","DST_IP","s") %>";
	vDestIPAddress[21] = "<% tcWebApi_get("Route_Entry21","DST_IP","s") %>";
	vDestIPAddress[22] = "<% tcWebApi_get("Route_Entry22","DST_IP","s") %>";
	vDestIPAddress[23] = "<% tcWebApi_get("Route_Entry23","DST_IP","s") %>";
	vDestIPAddress[24] = "<% tcWebApi_get("Route_Entry24","DST_IP","s") %>";
	vDestIPAddress[25] = "<% tcWebApi_get("Route_Entry25","DST_IP","s") %>";
	vDestIPAddress[26] = "<% tcWebApi_get("Route_Entry26","DST_IP","s") %>";
	vDestIPAddress[27] = "<% tcWebApi_get("Route_Entry27","DST_IP","s") %>";
	vDestIPAddress[28] = "<% tcWebApi_get("Route_Entry28","DST_IP","s") %>";
	vDestIPAddress[29] = "<% tcWebApi_get("Route_Entry29","DST_IP","s") %>";
	vDestIPAddress[30] = "<% tcWebApi_get("Route_Entry30","DST_IP","s") %>";
	vDestIPAddress[31] = "<% tcWebApi_get("Route_Entry31","DST_IP","s") %>";
	
	for(var i=0; i<routecount; i++)
	{
		if(vDestIPAddress[i] != "N/A")
			vcurLinks[nCurTemp++] = new stStaticRoute(i, vDestIPAddress[i]);
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
var StaticRouteInfo = getStaticRouteInfo();

/*function WriteOption()
{
for (i = 0; i < Wan.length; i++)
{
if (Wan[i].CntType == 'IP_Routed' && (Wan[i].wanName.indexOf("TR069") == -1))
{
document.write('<option value="' + Wan[i].domain + '"' + ' id="routewan_' + i + '">'
+ Wan[i].wanName + '</option>');
}
}
}*/
function btnClear()
{
with ( document.forms[0] )
{
DestIPAddress.value = '';
DestSubnetMask.value = '';
GatewayIPAddress.value = '';
}
}
function LoadFrame()
{
	document.ConfigForm.SaveFlag.value = "0";
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function getMostRightPosOf1(str)
{
for (i = str.length - 1; i >= 0; i--)
{
if (str.charAt(i) == '1')
{
break;
}
}
return i;
}
function getBinaryString(str)
{
var numArr = [128, 64, 32, 16, 8, 4, 2, 1];
var addrParts = str.split('.');
if (addrParts.length < 3)
{
return "00000000000000000000000000000000";
}
var binstr = '';
for (i = 0; i < 4; i++)
{
var num = parseInt(addrParts[i])
for ( j = 0; j < numArr.length; j++ )
{
if ( (num & numArr[j]) != 0 )
{
binstr += '1';
}
else
{
binstr += '0';
}
}
}
return binstr;
}

// 去掉字符串中右边的字符
function myTrim(str, chr) {
    var reg = new RegExp('((' + chr + ')*$)', 'g');

    return str.replace(reg, "");
}

// 判断是否同一个网段
function calcSubNet(ipaddr, netmask) {
    var ip_arr = ipaddr.split(".");
    var mask_arr = netmask.split(".");
    var sub = "";

    for (var i = 0; i < 4; i++) {
        sub += ip_arr[i] & mask_arr[i];
        sub += ".";
    }
    sub = myTrim(sub, "\\.");

    return sub;
}

function CheckForm(Form)
{
	for (i = 0; i < StaticRouteInfo.length - 1; i++)
	{
		if (StaticRouteInfo[i].DestIPAddress == getValue('DestIPAddress'))
		{
			alert('该目的IP地址已被别的静态路由使用！');
			return false;
		}
	}
	with ( document.forms[0] )
{
	var DestIp = DestIPAddress.value;
	var index1 = IpAddress.lastIndexOf('.');
	var index2 = DestIp.lastIndexOf('.');
	if ( isValidIpAddress(DestIp) == false
	|| isDeIpAddress(DestIp) == true
	|| isBroadcastIpAddress(DestIp) == true
	|| isLoopIpAddress(DestIp) == true )
	{
		alert('目的IP地址 "' + DestIPAddress.value + '" 是无效的IP地址。');
		return false;
	}
	if (IpAddress == DestIp
	|| (DestIp.substr(index1 + 1) == '0' && IpAddress.substr(0,index1) == DestIp.substr(0,index2)))
	{
		alert('目的IP地址非法！');
		return false;
	}
//Form.addParameter('DestIPAddress',DestIPAddress.value);
	if ( isValidSubnetMask(DestSubnetMask.value) == false &&  DestSubnetMask.value != '255.255.255.255')
	{
		alert('子网掩码 "' + DestSubnetMask.value + '" 是无效的子网掩码。');
		return false;
	}
//Form.addParameter('DestSubnetMask',DestSubnetMask.value);
	if (gwStr.checked == false && ifStr.checked == false)
	{
		alert('需要选择 "使用网关IP地址"和/或者 "使用接口"。');
		return false;
	}
	if (gwStr.checked == true)
	{
		if ( isAbcIpAddress(GatewayIPAddress.value) == false )
		{
			alert('默认网关 "' + GatewayIPAddress.value + '"是无效的IP地址。');
			return false;
		}
        if (calcSubNet(DestIPAddress.value, DestSubnetMask.value) != calcSubNet(GatewayIPAddress.value, DestSubnetMask.value)) {
            alert('目的IP地址 "' + DestIPAddress.value + '" 和' + '默认网关 "' + GatewayIPAddress.value + '"不在同一个网段。');
			return false;
        }
//Form.addParameter('GatewayIPAddress',GatewayIPAddress.value);
	}
	else
	{
//Form.addParameter('GatewayIPAddress','0.0.0.0');
	}
	
	if (ifStr.checked == true)
	{
		var idx = Interface.selectedIndex;
		var WANId = Interface.options[idx].id;
		if ((idx != Interface.length - 1) && (Interface.value.indexOf('nas') > -1) && (gwStr.checked == false))
		{
			alert('当IPoE接口被选择时，必须填写网关IP地址。');
			return false;
		}
//Form.addParameter('Interface',getSelectVal('Interface'));
	}
	else
	{
	}
}
//Form.endPrefix();
return true;
}
function SubmitForm()
{
//var Form = new webSubmitForm();
if (true == CheckForm(document.ConfigForm))
{
/*Form.setAction("addcfg.cgi?x=InternetGatewayDevice.Layer3Forwarding.Forwarding"
+ "&RequestFile=html/network/route.asp");
Form.submit();*/
var vForm = document.ConfigForm;
if(vForm.user_def_num.value >= 32)
{
	alert("用户只能定义32个静态路由！");
	return;
}

	if(vForm.gwStr.checked)
		vForm.gwflag.value = "Yes";
	else vForm.gwflag.value = "No";
	
	if(vForm.ifStr.checked)
		vForm.ifflag.value = "Yes";
	else vForm.ifflag.value = "No";
	
	vForm.WanInterfaceFlag.value = vForm.Interface.value;
	vForm.SaveFlag.value = "1";
	vForm.submit();
}

}
function Cancle()
{
location.replace("/cgi-bin/net-routeset.asp");
}
</script>
<table class="tblMain" height="100%" border="0" cellpadding="0" cellspacing="0">
  <TBODY>
    <TR>
      <TD id="MenuArea_L2">
	<ul class="TRD">
           <li id="V_static" class="TSD">静态路由</li>
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
<form name="ConfigForm" action="/cgi-bin/net-routeadd.asp" method="post">
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
        <TBODY>
            <TR>
                <TD>
                    <div class="advanceTitle">添加IPv4静态路由</div>
                </TD>
            </TR>
            <tr>
                <td>
                <div class="advanceTips">
                    <span>页面帮助</span>
                </div>
                <div class="helpDesc">
                    <li>输入目的网络地址、子网掩码、网关与（或）可用WAN接口，然后点击“确定”添加记录到路由表中。</li>
                </div>
            </td>
            <TR>
                <TD>
                    <div class="title-line"></div>
                </TD>
            </TR>
            <TR>
                <td>
                      <input type="hidden" name="add_num" value="<% tcWebApi_get("Route","add_num","s") %>">
                      <input type="hidden" name="user_def_num" value="<% tcWebApi_get("Route","User_def_num","s") %>">
                      <input type="hidden" name="WanInterfaceFlag" value="PVC0">
                      <input type="hidden" name="metricFlag" value="0">
                      <input type="hidden" name="gwflag" value="No">
                      <input type="hidden" name="ifflag" value="No">
                      <script language="JavaScript" type="text/JavaScript">
	
function WriteWanNameSelected()
{
	for (var i = 0; i < nEntryNum; i++)
	{
		if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)
		|| 'IPv6' == Wan_IPVERSION[i] )
				continue;

		document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
	}
}
function ChangeInterface()
{
	//document.ConfigForm.SaveFlag.value = "2";
	//document.ConfigForm.submit();
}
					  </script>
<br>
<table border="0" cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td class='w-180'><div class="form-text">目的网络地址</div></td>
<td><input type='text' name='DestIPAddress' maxlength='15' value="<%if TCWebApi_get("Route_Entry","DST_IP","h") <> "N/A" then TCWebApi_get("Route_Entry","DST_IP","s") else asp_Write("0.0.0.0") end if %>"></td>
</tr>
<tr>
<td><div class="form-text">子网掩码</div></td>
<td><input type='text' name='DestSubnetMask' maxlength='15' value="<%if TCWebApi_get("Route_Entry","Sub_mask","h") <> "N/A" then TCWebApi_get("Route_Entry","Sub_mask","s") else asp_Write("0.0.0.0") end if %>"></td>
</tr>
<tr>
<td>
    <div class="form-text" style="margin-left: 0;"><input type="checkbox" name='gwStr' <%if TCWebApi_get("Route_Entry","Gateway","h") <> "N/A" then asp_Write("checked") end if%>> <span>使用网关IP地址</span></div>
</td>
<td><input type='text' maxlength='15' name='GatewayIPAddress' value="<%if TCWebApi_get("Route_Entry","Gateway","h") <> "N/A" then TCWebApi_get("Route_Entry","Gateway","s") end if%>"></td>
</tr>
<tr>
<td><div class="form-text" style="margin-left: 0;"><input type="checkbox" name='ifStr' <%if TcWebApi_get("Route_Entry","Device","h") <> "N/A" then asp_Write("checked")  end if%>> <span>使用接口</span></div>
</td>
                        <td><select name='Interface'  id="select" style="width:153px" onChange="ChangeInterface()">
                            <script language="javascript">
WriteWanNameSelected();
document.writeln("  <option value='br0'> LAN/br0");
</script>
                          </select></td>
</tr>
</tbody>
</table>
</p></td>
</tr>
<tr>
    <td><input type="hidden" name="SaveFlag" value="0"></td>
</tr>
<tr>
    <td colspan="2">
        <P style="margin-top: 32px;margin-left: 182px;">
          <input type="button" style="width: 140px;" id="btnOK" onClick="SubmitForm()" value="确 定">
            <input type="button" id="btnCancel" style="margin-left: 24px;" name="btnCancel" onClick="Cancle()" value="返 回">
        </p>
    </td>
</tr>
</tbody>
</table>
</form>
</td>
</tr>
<!-- <tr>
  <td colspan="2">
   <p align="center">
        <input type="button" id="btnOK" onClick="SubmitForm()" value="确定">
        &nbsp;&nbsp;
      <input type="button" id="btnCancel" name="btnCancel" onClick="Cancle()" value="取消">
   </p>
  </td>
</tr> -->
</tbody>
</table>
</td>
</tr>
  </table></td>
  </tr>
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
