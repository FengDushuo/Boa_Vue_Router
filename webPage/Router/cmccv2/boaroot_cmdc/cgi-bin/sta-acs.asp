<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>远程管理状态</TITLE>
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
<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
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
			智能组网终端
		</span>
	</div>
	<div class="in_welcom">
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="状态->远程管理状态" name="Selected_Menu">
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
var resultinfo = "<%TCWebApi_get("Diagnostic_PVC","ReportResult","s")%>";
var autoreportinfo = "<%TCWebApi_get("Diagnostic_PVC","AutoReport","s")%>";
var itmsconn = "<%TCWebApi_get("Diagnostic_PVC","ItmsConn","s")%>";

<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
var cfg_menu_list  = new Array( '交互建立', '业务配置下发状态' );
<% else %>
var cfg_menu_list  = new Array( 'WOLINK状态' );
<% end if %>	

var cfg_cookie_name = 'sta-acs-menu';
init_l_menu();
</SCRIPT>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
		<TBODY>
			<TR>
				<TD id=MenuArea_L2>
					<ul class="TRD">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<li name="InteractionEstablish" id="交互建立">交互建立</li>
					<li name="OperationStatus" id="业务配置下发状态">业务配置下发状态</li>
<% else %>
					<li name="ANDLINKStatus" id="WOLINK状态">WOLINK状态</li>
<% end if %>	
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top">
                    <div style="display:none;" id="交互建立_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">交互建立</div>
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
                                                    <TD class=table_title width="20%">主动上报Inform情况</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
                                                            switch(result)
                                                            {
                                                                case "0":
                                                                    document.writeln("未上报（e家终端正在启动）");
                                                                    break;
                                                                case "1":
                                                                    document.writeln("未上报（无远程管理WAN连接）");
                                                                    break;
                                                                case "2":
                                                                    document.writeln("未上报（远程管理WAN连接未生效）");
                                                                    break;
                                                                case "3":
                                                                    document.writeln("未上报（无管理通道DNS信息）");
                                                                    break;
                                                                case "4":
                                                                    document.writeln("未上报（无ACS配置参数）");
                                                                    break;
                                                                case "5":
                                                                    document.writeln("未上报（ACS域名解析失败）");
                                                                    break;
                                                                case "6":
                                                                    document.writeln("上报无回应");
                                                                    break;
                                                                case "7":
                                                                    document.writeln("上报过程中断"); 
                                                                    break;
                                                                case "8":
                                                                    document.writeln("上报成功");
                                                                    break;
                                                                 default:
                                                                    document.writeln("N/A");
                                                                    break;			
                                                            }						
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR> 
                                                    <TD class=table_title width="20%">接受RMS连接请求情况</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var result = "<%TCWebApi_get("Cwmp_Entry","AcsConnStatus","s")%>";
                                                            switch(result)
                                                            {
                                                                case "0":
                                                                    document.writeln("未收到远程连接请求");
                                                                    break;
                                                                case "1":
                                                                    document.writeln("RMS发起的远程连接过程中断");
                                                                    break;
                                                                case "2":
                                                                    document.writeln("RMS发起的远程连接过程成功");
                                                                    break;
                                                                 default:
                                                                    document.writeln("未收到远程连接请求");
                                                                    break;			
                                                            }						
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
                    <div style="display:none;" id="业务配置下发状态_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">业务配置下发状态</div>
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
                                                    <TD class=table_title width="20%">业务配置下发状态</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var rstatus = "<%tcWebApi_get("deviceAccount_Entry","registerStatus","s") %>";
                                                            var rresult = "<%tcWebApi_get("deviceAccount_Entry","registerResult","s") %>";
                                                            if(rstatus=="0" && rresult == "99")
                                                            {
                                                                document.write('未收到远程业务配置');
                                                            }
                                                            else if(rstatus=="0" && rresult == "0")
                                                            {
                                                                document.write('正在接受RMS发起的远程业务配置');
                                                            }
                                                            else if(rstatus=="0" && rresult == "1")
                                                            {
                                                                document.write('业务配置成功');
                                                            }
                                                            else if(rstatus=="5" && rresult == "0")
                                                            {
                                                                document.write('业务配置成功');
                                                            }
                                                            else if(rstatus=="0" && rresult == "2")
                                                            {
                                                                document.write('业务配置失败');
                                                            }
                                                            else
                                                            {
                                                                document.write('未收到远程业务配置');
                                                            }
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
                    <div style="display:none;" id="WOLINK状态_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">WOLINK状态</div>
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
                                                <TR style="display:none;"> 
                                                    <TD class=table_title width="20%">设备工作接口</TD>
                                                    <TD>
                                                        <script language=JavaScript type=text/javascript>
                                                            var workmode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            if(workmode == "IF6Mode")
                                                                document.write("IF6");
                                                            else if(workmode == "IF3Mode")
                                                                document.write("IF3");
                                                            else
                                                                document.write("未知工作模式接口");
                                                        </script>
                                                    </TD>
                                                </TR>
                                                <TR>
                                                    <TD class=table_title>运行状态</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var result = "<%tcWebApi_get("wolink_Common","Status","s") %>";
                                                                if(result != "N/A" && (result != ""))
                                                                {
                                                                    switch(result)
                                                                    {	
                                                                        case "-10":
                                                                            document.write("正在注册");
                                                                            break;
                                                                        case "0":
                                                                            document.write("注册成功");
                                                                            break;
                                                                        case "-1":
                                                                            document.write("注册失败");
                                                                            break;
                                                                        case "2":
                                                                            document.write("认证成功");
                                                                            break;
                                                                        case "-2":
                                                                            document.write("认证失败");
                                                                            break;
                                                                        case "-3":
                                                                            document.write("重新注册");
                                                                            break;
                                                                        case "-5":
                                                                            document.write("负载均衡");
                                                                            break;
                                                                        default:
                                                                            document.write("未连接");
                                                                            break;			
                                                                    }						
                                                                }
                                                                else
                                                                    document.write("未连接");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>心跳发送次数</TD>
                                                    <TD>
                                                        <script language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","heartBeatCount","s") %>";
                                                            var step = "<%tcWebApi_get("alinkmgr_Entry","step","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A" && (step != "N/A") && (step != ""))
                                                                    document.write(result);
                                                                else
                                                                    document.write("0");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </script>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>WOLINK版本</TD>
                                                    <TD>
                                                        <script language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","gwVersion","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A" && (result != ""))
                                                                    document.write(result);
                                                                else
                                                                    document.write("-");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </script>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>Device ID</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","deviceId","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>Device Token</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","deviceToken","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>GW Token</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","gwToken","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("");
                                                            }
                                                            else
                                                                document.write("NA");
                                                            </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>Andlink Token</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            var result = "<%tcWebApi_get("alinkmgr_Entry","andlinkToken","s") %>";
                                                            if(mode == "IF3Mode")
                                                            {
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>省平台地址</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            if(mode == "IF6Mode")
                                                            {
                                                                var result1 = "<%tcWebApi_get("alinkmgr_Entry","ServerAddr","s") %>";
                                                                var result2 = "<%tcWebApi_get("alinkmgr_Entry","ServerPort","s") %>";
                                                                if((result1 != "N/A") && (result2 != "N/A"))
                                                                    document.write(result1 + ':' + result2);
                                                                else
                                                                    document.write("0.0.0.0");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>ChallengeCode</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            if(mode == "IF6Mode")
                                                            {
                                                                var result = "<%tcWebApi_get("alinkmgr_Entry","ChallengeCode","s") %>";
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("-");
                                                            }
                                                            else
                                                                document.write("NA");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>CheckSN</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var mode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            if(mode == "IF6Mode")
                                                            {
                                                                var result = "<%tcWebApi_get("alinkmgr_Entry","CheckSN","s") %>";
                                                                if(result != "N/A")
                                                                    document.write(result);
                                                                else
                                                                    document.write("-");
                                                            }
                                                            else
                                                                document.write("NA");
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
			    </TD>
			</TR>
		</TBODY>
		</TABLE>
		</TD>
	</TR>
<SCRIPT language=JavaScript type=text/javascript>
var curUserType = '0';  
if (curUserType == '1')
{
	ctabOption.style.display = "none";
	seDslStat.style.display = "none";
}
</SCRIPT>
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