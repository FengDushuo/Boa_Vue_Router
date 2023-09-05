<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
if Request_Form("defaultflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreflag2") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if	
if Request_Form("defaultflag2") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreflag22") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if

if Request_Form("rebootTimerSave_Flag") = "1" then
	TCWebApi_set("System_RebootSchedule","enable","Enable_Flag")
	TCWebApi_set("System_RebootSchedule","week","Day")
	TCWebApi_set("System_RebootSchedule","hour","Hour")
    TCWebApi_set("System_RebootSchedule","minute","Minute")
	TCWebApi_commit("System_RebootSchedule")
end if

if Request_Form("LightSave_Flag") = "1" then
	TCWebApi_set("Sys_Entry","ledStatus","LightEnable_Flag")
	TCWebApi_commit("Sys_Entry")
	TCWebApi_save()
end if
%>
<%
	if request_Form("backupflg") = "1" then
		tcWebApi_set("usbRestore_Entry", "dev", "ClDevType")
		tcWebApi_set("usbRestore_Entry", "autorestore", "autorestoreflag")
		tcWebApi_set("WebCurSet_Entry", "opt", "opt")
		tcWebApi_Commit("WebCurSet_Entry")
		tcWebApi_Commit("usbRestore_Entry")
		tcWebApi_Save()
	elseif request_Form("backupflg") = "2" then
		tcWebApi_set("WebCurSet_Entry", "opt", "opt")
		tcWebApi_Commit("WebCurSet_Entry")
		tcWebApi_Commit("usbRestore_Entry")
	elseif request_Form("backupflg") = "3" then
		tcWebApi_set("WebCurSet_Entry", "opt", "opt")
		tcWebApi_set("usbRestore_Entry", "autorestore", "autorestoreflag")
		tcWebApi_Commit("WebCurSet_Entry")
		tcWebApi_Commit("usbRestore_Entry")
		tcWebApi_Save()
	end if
%>		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<!-- <SCRIPT language=JavaScript type=text/javascript>
<% if Request_Form("rebootflag") = "1" then %>
<% if Request_Form("isCUCSupport") = "1" then %>
	setTimeout("doRefresh()",80*1000);
<% else %>
	setTimeout("doRefresh()",35*1000);
<% end if %>
	document.writeln("设备重启中，请等待……");
<% end if %>
<% if Request_Form("defaultflag") = "1" then %>
<% if Request_Form("isCUCSupport") = "1" then %>
	setTimeout("doRefresh()",80*1000);
<% else %>
	setTimeout("doRefresh()",35*1000);
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
	document.writeln("设备重启中，以便恢复出厂配置，请等待……");
<% else %>
	document.writeln("设备重启中，以便重置AP，请等待……");
<% end if %>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
<% if Request_Form("defaultflag2") = "1" then %>
<% if Request_Form("isCUCSupport") = "1" then %>
	setTimeout("doRefresh()",80*1000);
<% else %>
	setTimeout("doRefresh()",35*1000);
<% end if %>
	document.writeln("设备重启中，以便恢复默认配置，请等待……");
<% end if %>
<% end if %>
</SCRIPT> -->
<HEAD>
<TITLE>设备管理</TITLE>
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
<% if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then %>
<% if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then %>
<SCRIPT language=JavaScript type=text/javascript src="/cgi-bin/showusb.cgi"></SCRIPT>
<% end if %>
<% end if %>
<SCRIPT language=JavaScript type=text/javascript>
function doRefresh()
{
	location.href='/cgi-bin/logout.cgi';
}

// 如果设备在重启，则弹窗
var rebootEnable = "<% tcWebApi_get("System_Entry","reboot_type","s") %>";
if (rebootEnable == 1) {
    setTimeout(function () {
        showLoading(60, "upgrade", "设备正在重启，请耐心等待……");
    }, 1000);
    setTimeout(doRefresh, 61*1000);
}
else if (rebootEnable == 7) {
    setTimeout(function () {
        showLoading(60, "upgrade", "设备正在恢复出厂设置，请耐心等待……");
    }, 1000);
    setTimeout(doRefresh, 61*1000);
}

function usbRestore()
{
	if(document.USBForm.usbRestoreFlag.checked == true){
		document.USBForm.autorestoreflag.value = "1";
	}else{
		document.USBForm.autorestoreflag.value = "0";
	}
	document.USBForm.backupflg.value = "3";
	document.USBForm.opt.value = "0";
	document.USBForm.submit();
}
function usbConfResult()
{
	document.USBForm.backupflg.value = "0";
	
	if(document.USBForm.autorestoreflag.value =="1")
	{
		document.USBForm.usbRestoreFlag.checked = true;
	}else
	{
		document.USBForm.usbRestoreFlag.checked = false;
	}
	BackupEn();
	
	var str, commit;
	
	commit = false;
	
	if (document.USBForm.rstresult.value == "1")
	{
		str = '配置文件保存成功!';
		alert(str);
		commit = true;
	}
	else if (document.USBForm.rstresult.value == "2")
	{
		str = '配置文件备份失败，请检查USB设备连接是否正常!';
		alert(str);
		commit = true;
	}
	else if(document.USBForm.rstresult.value == "3")
	{
		str = 'USB设备空间不足!';
		alert(str);
		commit = true;
	}
	else if(document.USBForm.rstresult.value == "4")
	{
		confirm("已有同名文件存在，单击确定删除后备份,取消退出备份", function(ret){
			if(!ret){
				document.USBForm.opt.value = "3";
				document.USBForm.backupflg.value = "2";
				document.USBForm.submit();
			}else{
				document.USBForm.opt.value = "2";
				document.USBForm.backupflg.value = "2";
				document.USBForm.submit();
			}
		});
	}
	else if(document.USBForm.rstresult.value == "7")
	{
		str = '备份文件已损坏!';
		alert(str);
		commit = true;
	}
	else if(document.USBForm.rstresult.value == "8")
	{
		str = '配置文件保存失败!';
		alert(str);
		commit = true;
	}
	if(commit){
		document.USBForm.opt.value = "3";
		document.USBForm.backupflg.value = "2";
		document.USBForm.submit();
	}
}
function SetUserType()
{
/*
	var curUserType = top.curUser;
	//current user check 
	if (curUserType == '0') 
	{
		getElement('usbconf').style.display = "none";
		getElement('clearlog').style.display = "none";
	}
	else if (curUserType == '1') 
	{
		getElement('usbconf').style.display = "none";
		getElement('clearlog').style.display = "none";
		getElement('restoredefault0').style.display = "none";
		getElement('restoredefault1').style.display = "none";
		getElement('restoredefault2').style.display = "none";
	}
*/
}
function BackupEn()
{
	if(document.USBForm.ClDevType.value == "N/A")
	{
		document.USBForm.usbConfBtn.disabled = true;
	}
	else if (document.USBForm.ClDevType.value == "无USB设备")
	{
		document.USBForm.usbConfBtn.disabled = true;
	}
	else
	{
		document.USBForm.usbConfBtn.disabled = false;
	}
}
</SCRIPT>
<SCRIPT language=JavaScript type=text/javascript>
function LoadFrame()
{
	document.ResetForm.rebootflag.value = "0";
    setEnable();
    setLightEnable();
	<% if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then %>
	<% if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then %>
	/*usbConfResult();*/
	<% end if %>
	<% end if %>
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function setEnable()
{
	var enChecked = getCheckVal('enableRebootTimer');
	if (enChecked == '1')
	{
		document.RebootTimerForm.Enable_Flag.value = "1";
	}
	else
	{
		document.RebootTimerForm.Enable_Flag.value = "0";
	}
}
function setLightEnable()
{
	var enChecked = getCheckVal('enableLight');
	if (enChecked == '1')
	{
		document.LightForm.LightEnable_Flag.value = "off";
	}
	else
	{
		document.LightForm.LightEnable_Flag.value = "on";
	}
}
function backupToUSB()
{
	
	document.USBForm.backupflg.value = "1";
	document.USBForm.opt.value = "1";
	document.USBForm.submit();
}
function ReFactoryboot()
{
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
	confirm("您确认要恢复出厂配置？", function(ret){ if(ret)
<% else %>
	confirm("您确认要重置AP？", function(ret){ if(ret)
<% end if %>
	{
		document.DefaultForm.defaultflag.value = "1";
		document.DefaultForm.restoreflag2.value = "7";
        setTimeout(function() {
            $("form[name='DefaultForm']").submit();
        }, 1000);
	}});
}
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
function ReDefaultboot()
{
	confirm("您确认要恢复默认配置？", function(ret){ 
        if(ret)
        {
            document.DefaultForm.defaultflag2.value = "1";
            document.DefaultForm.restoreflag22.value = "2";
            setTimeout(function() {
                $("form[name='DefaultForm']").submit();
            }, 1000);
        }
    });
}
<% end if %>
function Reboot()
{
	confirm("确认重启？", function(ret) {
        if(ret)
        {
            document.ResetForm.rebootflag.value = "1";
            document.ResetForm.restoreFlag.value = "1";
            setTimeout(function() {
                $("form[name='ResetForm']").submit();
            }, 1000);
        }
    });
}

function SubmitForm()
{
	var	Form = document.RebootTimerForm;
	Form.rebootTimerSave_Flag.value = "1";
   $("form[name='RebootTimerForm']").submit();
}

function SubmitForm2()
{
	var	Form = document.LightForm;
	Form.LightSave_Flag.value = "1";
   $("form[name='LightForm']").submit();
}

var cfg_menu_list  = new Array('设备重启', '恢复配置', '定时重启', '指示灯控制');
var cfg_cookie_name = 'mag-reset-menu';
init_l_menu();
</SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR >
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('USBForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<div class="header">
	<div class="logo_img"></div>
	<div class="in_line"></div>
	<div class="in_device">
		<span class="td_model">
			<SCRIPT> 
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
		<input id="Selected_Menu" type="hidden" value="管理->设备管理" name="Selected_Menu">
	</div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
<TBODY>
	<TR>
		<TD class="header">
		<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2 >
		<TBODY>
			<TR>
				<TD id=MenuArea_L1 ></TD>
				</TR>
		</TBODY>
		</TABLE>
		</TD>
	</TR>

	<TR>
		<TD class="content">
        <TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0 >
		<TBODY>
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD">
					<li name="DeviceRestart" id="设备重启">设备重启</li>
					<li name="RecoverCnf" id="恢复配置">恢复配置</li>
                    <li name="RebootTimer" id="定时重启">定时重启</li>
                    <li name="LightCnf" id="指示灯控制">指示灯控制</li>
					</ul>
				</TD>
				<SCRIPT>
				    MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height='100%'>
                    <TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top" id='设备重启_item' class="hide">
						<FORM id="ResetForm" name="ResetForm" action="/cgi-bin/mag-reset.asp" method="post">
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">设备重启</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
							<TR>
								<TD class='w-10'></TD>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
								<TBODY>
                                    <TR>
                                        <div class="contentTxt" style="width: 100%;margin: 0 0 24px 8px;">单击此钮可以重启设备。</div>
                                    </TR>
									<TR>
										<TD>
                                        <INPUT type="button" value="设备重启"  name="btnReboot" onclick="Reboot();" class="BtnBCnl" style="width: 230px;margin-left: 200px;">
										<INPUT type="hidden" name="rebootflag" value="0"> 
										<INPUT type="HIDDEN" name="restoreFlag" value="0">
										<INPUT type="hidden" NAME="isCUCSupport" value="<%if tcwebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>" >
										</TD>
									</TR>
								</TBODY>
								</TABLE>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</FORM>
						</TD>
					</TR>
					<DIV id="clearlog" >
					<TR id="clearlog2"  style="display:none">
						<TD width=7 background=/img/panel3.gif ></TD>
						<TD>
						<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
						<TBODY>
							<TR>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
								<TBODY>
									<TR>
										<TD style='text-align:center'>
										<INPUT onclick='confirm("您确认要清除所有日志记录？", function(ret){ if(ret) {location.replace("clearsyslog.cgi");}});' type=button value="清除日志记录" name=button > 
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
					</DIV>
					<TR id="restoredefault0" name="restoredefault0">
						<TD width=7 background=/img/panel3.gif >　</TD>
						<TD valign="top" class="hide" id='恢复配置_item'>
						<FORM id="DefaultForm" name="DefaultForm" action="/cgi-bin/mag-reset.asp" method="post">
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">恢复配置</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
							<TR>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
								<TBODY>
									<TR>
										<TD style='text-align:center'>
										<INPUT type="button" value="恢复默认配置"  name="buttondefaultbak2"  onClick="ReDefaultboot();" style="width: 230px;">
										<INPUT type="hidden" name="defaultflag2" value="0">
										<INPUT type="hidden" name="restoreflag22" value="0">
										<INPUT type="hidden" NAME="isCUCSupport" value="<%if tcwebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>" ></TD>
									</TR>
								</TBODY>
								</TABLE>
								</TD>
							</TR>
<% end if %>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>								
							<TR>
								<TD>&nbsp;</TD>
							</TR>		
<% end if %>			
							<TR>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
								<TBODY>
                                    <TR>
                                        <div class="contentTxt" style="width: 100%;margin: 0 0 24px 8px;">单击此钮可以恢复出厂配置或者默认配置，执行操作时设备会自动重启。</div>
                                    </TR>
									<TR>
										<TD>
                                        <INPUT type="button" value="恢复配置" name="buttondefaultbak" class="BtnBCnl"  onClick="ReFactoryboot();" style="width: 230px;margin-left: 200px;">
										<INPUT type="hidden" name="defaultflag" value="0">
										<INPUT type="hidden" name="restoreflag2" value="0">
										<INPUT type="hidden" NAME="isCUCSupport" value="<%if tcwebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>" >
										</TD>
									</TR>
								</TBODY>
								</TABLE>
								</TD>
							</TR>
<% end if %>							
						</TBODY>
						</TABLE>
						</FORM>
						</TD>
					</TR>

                    <TR>
                        <TD width=7 background=/img/panel3.gif >　</TD>
						<TD valign="top" id='定时重启_item' class="hide">
						<FORM id="RebootTimerForm" name="RebootTimerForm" action="/cgi-bin/mag-reset.asp" method="post">
                            <input type="hidden" name="Enable_Flag" value="<% tcWebApi_get("System_RebootSchedule","enable","s") %>" >
                            <INPUT TYPE="HIDDEN" NAME="rebootTimerSave_Flag" VALUE="0">

                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">定时重启</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
						<TR>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
								<TBODY>
                                    <TR>
                                        <TD><div class="form-text">定时重启开关</div></TD>
                                        <TD>
                                        <input class="input-onoff" id="enableRebootTimer" onclick="setEnable()" type="checkbox" name="enableRebootTimer" <%if tcWebApi_get("System_RebootSchedule","enable","h") = "1" then asp_Write("checked") end if%> >
            				            </TD>
                                    </TR>
                                    <TR>
										<TD><div class="form-text">星期</div></TD>
										<TD >
										<SELECT id="Day" size="1" name="Day"></SELECT>
										<SCRIPT language="JavaScript" type='text/javascript'>
                                            var day = '<% tcWebApi_get("System_RebootSchedule","week","s") %>';
                                            var optname = new Array('星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日');
                                            var optvalue = new Array("2", "4", "8", "16", "32", "64", "1");

                                            with (getElById('Day'))
                                            {
                                                for( i=0; i< optname.length; i++)
                                                {
                                                    var opt = new Option(optname[i], optvalue[i]);
                                                    if ( day == optvalue[i] )
                                                    {
                                                        opt.setAttribute("selected", true);
                                                    }
                                                    options.add ( opt );
                                                }
                                            }
										</SCRIPT>					  
										</TD>
									</TR>
                                    <TR>
										<TD><div class="form-text">时间</div></TD>
										<TD>
										<SELECT id="Hour" size="1" name="Hour" ></SELECT>
										<SCRIPT language="JavaScript" type='text/javascript'>
                                            var hour = '<% tcWebApi_get("System_RebootSchedule","hour","s") %>';
                                            var hourList = new Array();
                                            for (var i = 0; i < 24; i++) {
                                                if (i < 10) {
                                                    hourList[i] = "0" + i;
                                                }
                                                else {
                                                    hourList[i] = "" + i;
                                                }
                                            }

                                            with (getElById('Hour'))
                                            {
                                                for( i=0; i< hourList.length; i++)
                                                {
                                                    var opt = new Option(hourList[i], hourList[i]);
                                                    if ( hour == hourList[i] )
                                                    {
                                                        opt.setAttribute("selected", true);
                                                    }
                                                    options.add ( opt );
                                                }
                                            }
										</SCRIPT>					  
                                        <span style="vertical-align: super;margin: 0 5px;">:</span>
                                        <SELECT id="Minute" size="1" name="Minute" ></SELECT>
										<SCRIPT language="JavaScript" type='text/javascript'>
                                            var minute = '<% tcWebApi_get("System_RebootSchedule","minute","s") %>';
                                            var minuteList = new Array();
                                            for (var i = 0; i < 60; i++) {
                                                if (i < 10) {
                                                    minuteList[i] = "0" + i;
                                                }
                                                else {
                                                    minuteList[i] = "" + i;
                                                }
                                            }

                                            with (getElById('Minute'))
                                            {
                                                for( i=0; i< minuteList.length; i++)
                                                {
                                                    var opt = new Option(minuteList[i], minuteList[i]);
                                                    if ( minute == minuteList[i] )
                                                    {
                                                        opt.setAttribute("selected", true);
                                                    }
                                                    options.add ( opt );
                                                }
                                            }
										</SCRIPT>					  
                                        </TD>
									</TR>
                                    <tr>
                                        <td colspan="2">
                                            <P style="margin-top: 32px;margin-left: 182px;">
                                                <input type="button" id="btnOK" onclick="SubmitForm()" value="保 存">
                                            </P>
                                        </td>
                                    </tr>
								</TBODY>
								</TABLE>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</FORM>
						</TD>
                    </TR>

                    <TR>
                        <TD width=7 background=/img/panel3.gif ></TD>
						<TD valign="top" id='指示灯控制_item' class="hide">
						<FORM id="LightForm" name="LightForm" action="/cgi-bin/mag-reset.asp" method="post">
                            <input type="hidden" name="LightEnable_Flag" value="<% tcWebApi_get("Sys_Entry","ledStatus","s") %>" >
                            <INPUT TYPE="HIDDEN" NAME="LightSave_Flag" VALUE="0">

                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">指示灯控制</div>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD>
                                        <div class="title-line"></div>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD>
                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
                                        <TBODY>
                                            <TR>
                                                <TD style="width: 0;"><div class="form-text">关闭指示灯</div></TD>
                                                <TD>
                                                <input class="input-onoff" id=enableLight onclick="setLightEnable()" type="checkbox" name="enableLight" <%if tcWebApi_get("Sys_Entry","ledStatus","h") = "off" then asp_Write("checked") end if%> >
                                                </TD>
                                            </TR>
                                            <tr>
                                                <td colspan="2">
                                                    <P style="margin-top: 32px;margin-left: 182px;">
                                                        <input type="button" id="btnOK" onclick="SubmitForm2()" value="保 存">
                                                    </P>
                                                </td>
                                            </tr>
                                        </TBODY>
                                        </TABLE>
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
		</TD>
	</TR>
</TBODY>
</TABLE>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT>
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