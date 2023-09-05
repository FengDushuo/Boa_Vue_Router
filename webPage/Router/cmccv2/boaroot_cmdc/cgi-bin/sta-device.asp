<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>设备信息</TITLE>
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
        .tblMain table.tblList td.table_title:first-child, .tblMain table.statblList td.table_title:first-child {
            width: 28% !important;
        }
    </style>
</HEAD>
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
		<input id="Selected_Menu" type="hidden" value="状态->设备信息" name="Selected_Menu">
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
		//when login the Home page,set the cookie of LOGFLAG to logged
		document.cookie =  "LOGFLAG=logged;path=/;";
		<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
		var Nametype = 0;
 		var para = 0;	  
		var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		//get all value
		// num 0
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanName = vArrayStr.split(',');
		// num 1
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_WanValue = vArrayStr.split(',');
		// num 2
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 3
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		Wan_Actives = vArrayStr.split(',');
		// num 4		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var WANEnNAT = vArrayStr.split(',');
		// num 5		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 6		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IPVERSION = vArrayStr.split(',');
		// num 7		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status4 = vArrayStr.split(',');
		// num 8		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP4 = vArrayStr.split(',');
		// num 9		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_ENCAP = vArrayStr.split(',');
		// num 10		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay4 = vArrayStr.split(',');
		// num 11		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS4 = vArrayStr.split(',');
		// num 12		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS4 = vArrayStr.split(',');
		// num 13		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Status6 = vArrayStr.split(',');
		// num 14		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_IP6 = vArrayStr.split(',');
		// num 15		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_GateWay6 = vArrayStr.split(',');
		// num 16		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_DNS6 = vArrayStr.split(',');
		// num 17		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_SecDNS6 = vArrayStr.split(',');
		// num 18		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_PD6 = vArrayStr.split(',');
		// num 19		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_NetMask4 = vArrayStr.split(',');
		// num 20		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 21		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		// num 22		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_Connection = vArrayStr.split(',');
		// num 23		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_VidPRI = vArrayStr.split(',');
		// num 24		
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var Wan_MAC = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","ConnectionError","s") %>";
		var Wan_ConnectionError = vArrayStr.split(',');

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
		Wan_ConnectionError = SortUtil.SortMyArray( Wan_ConnectionError );
<% end if%>

<% if tcWebApi_get("WebCustom_Entry", "isCTPONYNSupported", "h") = "Yes"  then %>
<% if tcWebApi_get("WebCustom_Entry", "isCT2PORTSSupported", "h") = "Yes"  then %>
    var portNumber = "2";
<% else %>
    var portNumber = "4";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isWLanSupported", "h") = "Yes"  then %>
    var isWifiSupported = "AP";
<% else %>
    var isWifiSupported = "NoAP";
<% end if%>
<% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %> 
		var deviceType = "E8C 1 "+isWifiSupported;
<% else %>   
    var deviceType = "E8C "+portNumber+"+1 "+isWifiSupported;
<% end if%>
<% end if%>

function stDeviceInfo(domain,ProductClass,SerialNumber,HardwareVersion,SoftwareVersion,ManufacturerOUI)
{
this.domain = domain;
this.ProductClass = ProductClass;
this.ManufacturerOUI = ManufacturerOUI;
this.SerialNumber = SerialNumber;
this.HardwareVersion = HardwareVersion;
this.SoftwareVersion = SoftwareVersion;
}
temp = new Array(new stDeviceInfo("InternetGatewayDevice.DeviceInfo",top.ModelName,"19191900AABB818180","HG530RRA.VER.C","V100R001C01B010","00AABB"),null);
var DeviceInfo = temp[0];
function LoadFrame()
{
}
var BatchNumber = "RWC30P0.010.84725";
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
function PonInfoClass()
{
	this.LinkSta				= '<% tcWebApi_get("XPON_LinkCfg","LinkSta","s") %>';
	this.trafficstate			= '<% tcWebApi_get("XPON_Common","trafficStatus","s") %>';
	this.fecState				= '<% tcWebApi_get("Info_PonPhy","FecStatus","s") %>';
	this.PonState				= 'down';
	this.FECEnable				= 'disabled';
	this.WarnInfo				= 'disconnect';
	this.PonSendPkt				= '<% tcWebApi_get("Info_PonWanStats","TxFrameCnt","s") %>';
	this.PonRecvPkt				= '<% tcWebApi_get("Info_PonWanStats","RxFrameCnt","s") %>';
	this.SendPower				= '-';
	this.RecvPower				= '-';
	this.WorkVoltage			= '-';
	this.WorkElectric			= '-';
	this.WorkTemperature		= '-';
			
	if ( 'up' == this.trafficstate )
	{
		this.PonState 			= 'up';
		this.WarnInfo 			= 'no info';
	}
			
	if( '0' != this.LinkSta)
	{
		this.SendPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
		this.RecvPower			= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
	}

	if ( '1' == this.fecState )
	{
		this.FECEnable			= 'enabled';
	}
}
var PonInfo = new PonInfoClass();

function ListCreate_info1()
{
	var ITV_name = '<% tcWebApi_get("WanInfo_Common","ITVInfo","s") %>';

	for(var i=0;i<pvc_counts;i++)
	{
		if(Wan_Actives[i] != "N/A")
		{
			if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
			{
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
				if(Wan_IP4[i] == '-')
				{
						Wan_IP4[i] = '/';
				}
<%end if%>
				document.write('<tr align="middle">');
					
				if(Wan_WanName[i].indexOf('TR069') >= 0)
				{
					document.write('<td>' + 'ITMS管理通道状态' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}
					document.write('<td align="center">' + '路由（DHCP自动获取）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('INTERNET') >= 0)
				{
					document.write('<td>' + 'INTERNET（上网业务）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}

					if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
					{
						document.write('<td align="center">' + '路由（终端内置拨号）' + '&nbsp;</td>');
					}
					else
					{
						document.write('<td align="center">' + '桥接（电脑拨号）' + '&nbsp;</td>');
					}
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					if((PonInfo.PonState == "up")&&('up' == Wan_Status4[i]))
						document.write('<td>' + '/' + '&nbsp;</td>');
					else{
						var ErrCode=Wan_ConnectionError[i];
						var ErrDes;
						if ( ErrCode == 'ERROR_AUTHENTICATION_FAILURE' )
							ErrDes='认证失败';
						else if ( ErrCode == 'ERROR_IDLE_DISCONNECT' )
							ErrDes='空闲断开';
						else if ( ErrCode == 'ERROR_ISP_TIME_OUT' )
							ErrDes='响应超时';
						else if ( ErrCode == 'ERROR_USER_DISCONNECT' )
							ErrDes='用户断开';
						else if ( ErrCode == 'ERROR_NO_ANSWER' )
							ErrDes='无响应';
						else if ( ErrCode == 'ERROR_NOT_ENABLED_FOR_INTERNET' )
							ErrDes='无效链接';
						else
							ErrDes='其他异常';								
						document.write('<td>' + ErrDes + '&nbsp;</td>');					
					}
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('VOICE') >= 0)
				{
					document.write('<td>' + 'VOIP（语音业务）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status4[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}
					document.write('<td align="center">' + '路由（DHCP自动获取）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					VoipInfo.showRegisterState(1);
				}

				document.write('</tr>');
				
				if(ITV_name != '')
				{
					document.write('<tr align="middle">');

					if(Wan_WanValue[i].indexOf(ITV_name) >= 0)
					{
						document.write('<TD align=middle>' + 'ITV业务' + '&nbsp;</TD>');	

						if(PonInfo.PonState == "up")
						{
							if('up' == Wan_Status4[i])
							{
								document.write('<td align="center">正常&nbsp;</td>');
							}
							else
							{
								document.write('<td align="center">异常&nbsp;</td>');
							}
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}

						document.write('<TD align="center">' + '桥接（ITV终端自动获取）'+ '&nbsp;</TD>');
						document.write('<td>' + Wan_IP4[i] + '&nbsp;</td>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
					}
					document.write('</tr>');				
				}
			}
			else if(Wan_IPVERSION[i] == "IPv6")
			{
				document.write('<tr align="middle">');
<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
				if(Wan_IP6[i] == '-')
				{
						Wan_IP6[i] = '/';
				}
<%end if%>
				if(Wan_WanName[i].indexOf('TR069') >= 0)
				{
					document.write('<td>' + 'ITMS管理通道状态' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}
					document.write('<td align="center">' + '路由（DHCP自动获取）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('INTERNET') >= 0)
				{
					document.write('<td>' + 'INTERNET（上网业务）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}

					if( (Wan_ENCAP[i].indexOf('PPPoE') >=0 ) || (Wan_ENCAP[i].indexOf('DHCP') >=0 ) )
					{
						document.write('<td align="center">' + '路由（终端内置拨号）' + '&nbsp;</td>');
					}
					else
					{
						document.write('<td align="center">' + '桥接（电脑拨号）' + '&nbsp;</td>');
					}
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					if((PonInfo.PonState == "up")&&('up' == Wan_Status6[i]))
						document.write('<td>' + '/' + '&nbsp;</td>');
					else{
						var ErrCode=Wan_ConnectionError[i];
						var ErrDes;
						if ( ErrCode == 'ERROR_AUTHENTICATION_FAILURE' )
							ErrDes='认证失败';
						else if ( ErrCode == 'ERROR_IDLE_DISCONNECT' )
							ErrDes='空闲断开';
						else if ( ErrCode == 'ERROR_ISP_TIME_OUT' )
							ErrDes='响应超时';
						else if ( ErrCode == 'ERROR_USER_DISCONNECT' )
							ErrDes='用户断开';
						else if ( ErrCode == 'ERROR_NO_ANSWER' )
							ErrDes='无响应';
						else if ( ErrCode == 'ERROR_NOT_ENABLED_FOR_INTERNET' )
							ErrDes='无效链接';
						else
							ErrDes='其他异常';								
						document.write('<td>' + ErrDes + '&nbsp;</td>');					
					}
					document.write('<td>' + '/' + '&nbsp;</td>');
				}
				else if(Wan_WanName[i].indexOf('VOICE') >= 0)
				{
					document.write('<td>' + 'VOIP（语音业务）' + '</td>');

					if(PonInfo.PonState == "up")
					{
						if('up' == Wan_Status6[i])
						{
							document.write('<td align="center">正常&nbsp;</td>');
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}
					}
					else
					{
						document.write('<td align="center">异常&nbsp;</td>');
					}
					document.write('<td align="center">' + '路由（DHCP自动获取）' + '&nbsp;</td>');
					document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
					document.write('<td>' + '/' + '&nbsp;</td>');
					VoipInfo.showRegisterState(1);
				}

				document.write('</tr>');
				
				if(ITV_name != '')
				{				
					document.write('<tr align="middle">');

					if(Wan_WanValue[i].indexOf(ITV_name) >= 0)
					{
						document.write('<TD align=middle>' + 'ITV业务' + '&nbsp;</TD>');	

						if(PonInfo.PonState == "up")
						{
							if('up' == Wan_Status6[i])
							{
								document.write('<td align="center">正常&nbsp;</td>');
							}
							else
							{
								document.write('<td align="center">异常&nbsp;</td>');
							}
						}
						else
						{
							document.write('<td align="center">异常&nbsp;</td>');
						}

						document.write('<TD align="center">' + '桥接（ITV终端自动获取）'+ '&nbsp;</TD>');
						document.write('<td>' + Wan_IP6[i] + '&nbsp;</td>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
						document.write('<TD align="center">' + '/' + '&nbsp;</TD>');
					}
					document.write('</tr>');
				}
			}
		}
	}
}

function PrintRecvPower()
{
	if(PonInfo.RecvPower == '-')
	{
		document.write('<TD width="250">' + '<font color="#ff0000">' +'光纤插接不正常，请检查光路或ODF是否有接错'+ '&nbsp;</font></TD>');
	}
	else if(PonInfo.RecvPower < -24)
	{
		document.write('<TD width="250">' + '<font color="#ff0000">' +'光功率过低，请检查光路或ODF是否有接错'+ '&nbsp;</font></TD>');
	}
	else
	{
    	document.write('<TD width="250">' + PonInfo.RecvPower + 'dBm' + '&nbsp;</TD>');
	}
}

function VoipInfoClass()
{
  this.Reg1Status  = '<%if tcWebAPI_get("InfoVoIP_Entry0", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry0", "Status", "s") else asp_Write("") end if %>';
  this.Reg2Status  = '<%if tcWebAPI_get("InfoVoIP_Entry1", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry1", "Status", "s") else asp_Write("") end if %>';
  this.Line1Number = '<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "s") else asp_Write("") end if %>';
  this.Line2Number = '<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "s") else asp_Write("") end if %>';
  this.showRegisterState = showRegisterState;
}
var VoipInfo = new VoipInfoClass();

function showRegisterState(port)
{
	var Status = '';

	if ( 1 == port )
	{
		Status = this.Reg1Status;
	}
	else if ( 2 == port )
	{
		Status = this.Reg2Status;
	}
	else
	{
		return;
	}

	if ( Status == 'Up' )
		document.write('<td>' +'正常注册'+ '&nbsp;</td>');
	else if ( Status == 'Initializing' )
		document.write('<td>' +'初始化中'+ '&nbsp;</td>');
	else if ( Status == 'Registering' )
		document.write('<td>' +'注册中'+ '&nbsp;</td>');
	else if ( Status == 'Unregistering' )
		document.write('<td>' +'未注册'+ '&nbsp;</td>');
	else if ( Status == 'Quiescent' )
		document.write('<td>' +'停止的'+ '&nbsp;</td>');
	else if ( Status == 'Disabled' )
		document.write('<td>' +'去使能'+ '&nbsp;</td>');
	else if ( Status == 'Error' )
		document.write('<td>' +'故障'+ '&nbsp;</td>');
	else if ( Status == 'Testing' )
		document.write('<td>' +'测试中'+ '&nbsp;</td>');
	else
		document.write('<td>' +'其他异常'+ '&nbsp;</td>');
}
<% end if%>
</SCRIPT>
				<FORM style="DISPLAY: none" name=ConfigForm></FORM>
				<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
					<TBODY>
						<TR>
							<TD id=MenuArea_L2>
								<ul class="TRD">
								<li class="TSD">设备信息</li>
								</ul>
							</TD>
							<SCRIPT language=javascript>
								MakeMenu(getElById ('Selected_Menu').value);
							</SCRIPT>
							<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
							<LABEL>在本页面上，您可以查看设备的基本信息、ITMS注册状态和业务状态显示。 </LABEL>
							<% end if%>					
							<TD valign="top">
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
									<TBODY>
                                        <TR>
                                            <TD>
                                                <div class="advanceTitle">设备信息</div>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD>
                                                <div class="title-line"></div>
                                            </TD>
                                        </TR>
										<TR>
											<TD class="table-outer">
												<TABLE name="deviceStatList" class="statblList" border="1">
                                                    <tbody>
                                                        <tr>
                                                            <TD class=table_title width="20%">设备名称</TD>
                                                            <TD>
                                                                <SCRIPT language=javascript>
                                                                    <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                                                                        document.write(top.ModelName_dev);
                                                                    <% else %>
                                                                        document.write(top.ModelName);
                                                                    <% end if %>   
                                                                    </SCRIPT>
                                                            </TD>
                                                        </tr>
                                                        <tr>
                                                            <TD class=table_title width="20%">设备厂商</TD>
                                                            <TD>
                                                                <!-- <%If tcWebApi_get("DeviceInfo_devParaStatic","Manufacturer","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","Manufacturer","s") end if%> -->
																<SCRIPT language=javascript>
                                                                    <% if tcWebApi_get("WebCustom_Entry", "isSMSupport", "h") = "Yes" then %>
																			document.write('<%tcWebApi_get("DeviceInfo_devParaStatic","Manufacturer","s")%>');
                                                                    <% else %>
																			document.write("上海小度技术有限公司");
                                                                    <% end if %>   
																</SCRIPT>
                                                            </TD>
                                                        </tr>
                                                        <tr>
                                                            <TD class=table_title width="20%">序列号</TD>
                                                            <TD>
                                                                <%If tcWebApi_get("DeviceInfo_devParaDynamic","ManufacturerOUI","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","ManufacturerOUI","s") end if%>
                                                                <%If tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%>
                                                            </TD>
                                                        </tr>
                                                        <!--<tr>
                                                            <TD class=table_title width="20%">设备标识号</TD>
                                                            <TD>
                                                                <%If tcWebApi_get("DeviceInfo_devParaDynamic","CMEI","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","CMEI","s") end if%>
                                                            </TD>
                                                        </tr>-->
                                                        <tr>
                                                            <TD class=table_title width="20%">硬件版本</TD>
                                                            <TD>
                                                                <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s") end if%>
                                                            </TD>
                                                        </tr>
                                                        <tr>
                                                            <TD class=table_title width="20%">软件版本</TD>
                                                            <TD>
                                                                <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if %>
                                                            </TD>
                                                        </tr>
                                                        <tr>
                                                            <TD class=table_title width="20%">WAN MAC 地址</TD>
                                                            <TD>
                                                                <script>
                                                                    var fixedmode = '<% tcWebApi_get("APWanInfo_Common", "FixedAPMode", "s") %>';
                                                                    var curmode = '<% tcWebApi_get("WanInfo_Common", "CurAPMode", "s") %>';
                                                                    if ( curmode == "Bridge" || curmode == "APClient") 
                                                                        document.write('<%tcWebApi_get("Info_Ether", "mac","s")%>');
                                                                    else if ( curmode == "Route" )
                                                                        document.write('<%tcWebApi_get("waninfo.entry.1", "hwaddr","s")%>');
                                                                    else if ( fixedmode == "Bridge" || fixedmode == "APClient")
                                                                        document.write('<%tcWebApi_get("Info_Ether", "mac","s")%>');
                                                                    else if ( fixedmode == "Route" )
                                                                        document.write('<%tcWebApi_get("waninfo.entry.1", "hwaddr","s")%>');
                                                                    else
                                                                        document.write('<%tcWebApi_get("Info_Ether", "mac","s")%>');
                                                                </script>
                                                            </TD>
                                                        </tr>
                                                    </tbody>
												</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
						<% if tcWebApi_get("WebCustom_Entry", "isCTFJSupported", "h") = "Yes"  then %>
						<TR> 
							<TD width=7 background=/img/panel3.gif>　</TD>
							<TD></TD>
						</TR>
						<TR> 
							<TD width=7 background=/img/panel3.gif>　</TD>
							<TD valign="top">
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD width=10>&nbsp;</TD>
											<TD>
												<TABLE class="statblList" border="1">
													<TBODY>
														<TR>
															<TD class=table_title align=middle width="20%">&nbsp;</TD>
															<TD class=table_title align=middle width="15%">通道（WAN连接）状态</TD>
															<TD class=table_title align=middle width="20%">IP地址获取方式</TD>
															<TD class=table_title align=middle width="15%">获取的IP地址</TD>
															<TD class=table_title align=middle width="15%">上网拨号状态</TD>
															<TD class=table_title align=middle width="15%">语音注册状态</TD>
														</TR>
														<SCRIPT language=JavaScript type=text/javascript>
															ListCreate_info1();
														</SCRIPT>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
						<%end if%>
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