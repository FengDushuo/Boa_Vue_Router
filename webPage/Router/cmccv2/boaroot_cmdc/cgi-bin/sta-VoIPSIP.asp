<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>宽带语音信息</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<SCRIPT language=JavaScript type=text/javascript>
	<% if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "H.248"  then %>
		location.replace("/cgi-bin/sta-VoIP248.asp");
	<% end if %>
function VoipInfoClass()
{
  this.Reg1Status = '<%if tcWebAPI_get("InfoVoIP_Entry0", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry0", "Status", "s") else asp_Write("") end if %>';
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
  this.Reg2Status = '<%if tcWebAPI_get("InfoVoIP_Entry1", "Status", "h") <> "N/A" then tcWebAPI_get("InfoVoIP_Entry1", "Status", "s") else asp_Write("") end if %>';
<% end if %>
  var line1number='<%if tcWebApi_get("VoIPBasic_Common","SIPProtocol", "h") = "SIP" then asp_Write("") elseif tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "s") else asp_Write("") end if %>';
  if(line1number == ''){
  	var tmp='<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "s") else asp_Write("") end if %>';
   	if(tmp.indexOf('@') >= 0)
   		line1number=tmp.substr(0,tmp.indexOf('@'));
   	else
   		line1number=tmp;
  }
  this.Line1Number = line1number;

<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
  var line2number = '<%if tcWebApi_get("VoIPBasic_Common","SIPProtocol", "h") = "SIP" then asp_Write("") elseif tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "s") else asp_Write("") end if %>';
  if(line2number == ''){
  	var tmp2='<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "s") else asp_Write("") end if %>';
  	if(tmp2.indexOf('@') >= 0)
  		line2number=tmp2.substr(0,tmp2.indexOf('@'));
  	else
  		line2number=tmp2;
  }
  this.Line2Number = line2number;
<% end if %> 
  this.UserState1 = '<%if tcWebAPI_get("VoIPSysParam_Entry0", "SC_LINE_INFO_STATUS", "h") <> "N/A" then tcWebAPI_get("VoIPSysParam_Entry0", "SC_LINE_INFO_STATUS", "s") else asp_Write("") end if %>';
<% if TCWebAPI_get("VoIPBasic_Common", "VoIPLine2Enable", "h") = "Yes" then%>
  this.UserState2 = '<%if tcWebAPI_get("VoIPSysParam_Entry1", "SC_LINE_INFO_STATUS", "h") <> "N/A" then tcWebAPI_get("VoIPSysParam_Entry1", "SC_LINE_INFO_STATUS", "s") else asp_Write("") end if %>';
<% end if %>			
  this.showRegisterState = showRegisterState;
  this.showVoipNumber = showVoipNumber;
  this.showUserState = showUserState;
}

function showRegisterState(port)
{
	var Status = '';
	var LineEnable='';

	if ( 1 == port ){
		Status = this.Reg1Status;
		LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry0", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "Enable", "s") else asp_Write("") end if %>';
		RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry0", "RegFailReason", "s") %>";
	}
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	else if ( 2 == port ){
		Status = this.Reg2Status;
		LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry1", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "Enable", "s") else asp_Write("") end if %>';
		RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry1", "RegFailReason", "s") %>";
	}
<% end if %>
	else
		return;
			if(LineEnable == 'No'){
				document.write('去使能');
				return;
			}
			if ( Status == 'Up' )
				document.write('已注册');
			else if ( Status == 'Initializing' )
				document.write('初始化中');
			else if ( Status == 'Registering' )
				document.write('注册中');
			else if ( Status == 'Unregistering' )
				document.write('未注册');
			else if ( Status == 'Quiescent' )
				document.write('停止的');
			else if ( Status == 'Disabled' )
				document.write('去使能');
			else if ( Status == 'Error' ){
				switch ( parseInt(RegFailReason) ){
					case 2:
					case 3:
						voiptatus = '网络(SBC)不可达';
						break;
					case 4:
						voiptatus = '鉴权失败';
						break;
					case 6:
						voiptatus = '业务通道异常';
						break;  
					default:
						voiptatus = '故障';
						break;	
				}
				document.write(voiptatus);	
			}							
			else if ( Status == 'Testing' )
				document.write('测试中');
			else
				document.write('--');
}

function showVoipNumber(port)
{
	var Number = '';
	var DigNum = '';
	var k;

	if ( 1 == port )
		Number = this.Line1Number
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	else if ( 2 == port )
		Number = this.Line2Number
<% end if %>
	else
		return;

	k = Number.split('@');
	DigNum = k[0];

	document.write(DigNum);
}

function showUserState(port)
{
	var Status = "";

	if ( 1 == port )
		Status = this.UserState1;
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	else if ( 2 == port )
		Status = this.UserState2;
<% end if %>
	else
		return;
			if ( Status == "Idle" )
				document.write('空闲');
			else if ( Status == "Dialing" )
				document.write('拨号中');
			else if ( Status == "Ringing" )
				document.write('振铃');
			else if ( Status == "Ringback" )
				document.write('听回铃音');
			else if ( Status == "Connect" )
				document.write('已连接');
			else if ( Status == "Disconnect" )
				document.write('断开连接');
			else
				document.write('--');
}

var VoipInfo = new VoipInfoClass();

var cfg_menu_list  = new Array( '宽带语音信息' );
var cfg_cookie_name = 'sta-voipsip-menu';
init_l_menu();
</SCRIPT>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()"
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
<TBODY>
	<TR>
		<TD class="header">
		<TABLE cellSpacing=0 cellPadding=0 border=0 class="tbl_nav">
		<TBODY>
			<TR>
				<TD>&nbsp;</TD>
				<TD vAlign=top align=right>
				<TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
				<TBODY>
					<TR>
						<TD class="td_model">
							<span>型号: </span> 
							<span> 
							<SCRIPT language=javascript> 
								document.write(top.ModelName); 
							</SCRIPT>
							</span>
						</TD>
						<TD class=welcom >
							<span>您好！</span>
                            <a onclick="top.location.href='/'">
                            <span>返回主页</span>
                            </a>
							<INPUT id=Selected_Menu type=hidden value="状态->宽带语音信息" name=Selected_Menu>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</TD>
			</TR>
		</TBODY>
		</TABLE>
		<TABLE cellSpacing="0" cellPadding="0" border="0" style="position: absolute ; z-index:999 ; margin:-25 0 0 25"><tbody><tr><td><img src="/img/qr.png" width="100" height="100"></td></tr></tbody></TABLE>
		<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
		<TBODY>
			<TR>
				<TD id=MenuArea_L1></TD>
			</TR>
			<TR>
				<TD id=MenuArea_L2></TD>
			</TR>
		</TBODY>
		</TABLE>
<SCRIPT language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>
		</TD>
	</TR>  
	<TR>
		<TD class="content">
		<TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
      	<TBODY>
			<TR>
				<TD class="Item_T" rowspan="11">
					<ul class="TRD">
					<li class="TSD">宽带语音信息</li>
					</ul>
				</TD>
				<TD width=7 bgColor=#FAFAFA>　</TD>
				<TD width="751" height="20">　</TD>
				<TD vAlign=top width="70" background=/img/panel4.gif rowSpan=11>
				  <TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
				    <TBODY>
				      <TR>
				        <TD valign='top'></TD>
				      </TR>
				    </TBODY>
				  </TABLE>
				</TD>
			</TR>
			<TR>
				<TD width=7 background=/img/panel3.gif>　</TD>
				<TD valign="top">
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
						<TR>
							<TD width=10>&nbsp;</TD>
							<TD>
							<TABLE name="tabVoipStat" class="statblList" border="1">
							<TBODY>
								<TR>
									<TD class=table_title width="20%">名称</TD>
									<TD class=table_title width="35%">线路1</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD class=table_title width="35%">线路2</TD>
<% end if %>
								</TR>
								<TR>
									<TD class=table_title>注册服务器</TD>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "RegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServer", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "RegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServer", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% end if %>
								</TR>
								<TR>
									<TD class=table_title>注册服务器端口</TD>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "RegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServerPort", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "RegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServerPort", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% end if %>
								</TR>          
								<TR>
									<TD class=table_title>备用注册服务器</TD>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServer", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServer", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% end if %>
								</TR>
								<TR>
									<TD class=table_title>备用注册服务器端口</TD>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServerPort", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD><%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServerPort", "s") else asp_Write("--") end if %>&nbsp;</TD>
<% end if %>
								</TR>       
								<TR>
									<TD class=table_title>电话号码</TD>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showVoipNumber(1);
									</script>
									&nbsp;
									</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showVoipNumber(2);
									</script>
									&nbsp;
									</TD>
<% end if %>
								</TR>    
								<TR>
									<TD class=table_title>注册状态</TD>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showRegisterState(1);
									</script>
									&nbsp;
									</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showRegisterState(2);
									</script>
									&nbsp;
									</TD>
<% end if %>
								</TR>
								<TR>
									<TD class=table_title>用户线路状态</TD>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showUserState(1);
									</script>
									&nbsp;
									</TD>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
									<TD>
									<script language=JavaScript type=text/javascript>
										VoipInfo.showUserState(2);
									</script>
									&nbsp;
									</TD>
<% end if %>
								</TR>
							</TBODY>
							</TABLE>
							</TD>
							<TD width=10>&nbsp;</TD>
						</TR>
						<TR>
						<TD width=10>&nbsp;</TD>
						<TD></TD>
						<TD width=10>&nbsp;</TD>
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
</HTML>