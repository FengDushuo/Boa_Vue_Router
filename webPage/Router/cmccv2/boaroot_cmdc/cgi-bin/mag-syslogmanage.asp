<%
If Request_Form("loglevelchange")="1" then 
	TCWebApi_set("SysLog_Entry","WriteLevel","loglevel")
	TCWebApi_set("SysLog_Entry","LogEnable","EnableLog_Flag")
	TCWebApi_set("SysLog_Entry","clearLog","logclear")
	TCWebApi_commit("SysLog_Entry")
	TCWebApi_save()
End If
%>

<%
if Request_form("frameloglevel") <> "" then
		TCWebApi_set("SysLog_Entry","DisplayLevel","frameloglevel")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>日志文件管理</TITLE>
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
<SCRIPT language=javascript>

function SubmitChange(){
	document.ConfigForm.loglevelchange.value = "1"; 
	document.ConfigForm.loglevel.value = document.ConfigForm.Level.value;
	document.ConfigForm.submit();
}

function Back_Syslog()
{
   var cfg = '/syslog.txt';
	 var code ;
	 if (document.ConfigForm.logenable.value == "Yes")
	 {
	     code = 'location.assign("'+cfg+'")';
	     eval(code);
	 }
}

function Clear_Syslog()
{
	document.ConfigForm.loglevelchange.value = "1";
	document.ConfigForm.logclear.value = "Yes"; 
	$("form[name='ConfigForm']").submit();
}

function levelChange(value){
	document.ConfigForm.frameloglevel.value=value;
	$("form[name='ConfigForm']").submit();
}

var cfg_menu_list  = new Array( '设置', '日志查看' );
var cfg_cookie_name = 'mag-syslogmanage-menu';
init_l_menu();
</SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
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
		<span class="in_info">
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="管理->日志文件管理" name="Selected_Menu">
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
function LoadFrame()
{
	return;
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function SetLogEnbl()
{
	var logChecked = getCheckVal('Enable');
	if (logChecked == '1')
	{
		document.ConfigForm.EnableLog_Flag.value = "Yes";
		alert("注意:长期开启日志将减少网关寿命!");
	}
	else
	{
		document.ConfigForm.EnableLog_Flag.value = "No";
	}
	
	/*if(Enable.checked)
	{
	alert("注意:长期开启日志将减少网关寿命!");
	Enable = 'on';
	}
	else
	Enable = 'off';*/
}
</SCRIPT>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
		<FORM name="ConfigForm" action="/cgi-bin/mag-syslogmanage.asp" method="post" >
		
		<INPUT TYPE="HIDDEN" NAME="loglevel" VALUE="<%TCWebApi_get("SysLog_Entry","WriteLevel","s")%>">
		<INPUT TYPE="HIDDEN" NAME="loglevelchange" VALUE="0">
		<INPUT TYPE="HIDDEN" NAME="logenablechange" VALUE="0">
		<INPUT TYPE="HIDDEN" NAME="logclear" VALUE="0">
		<INPUT TYPE="HIDDEN" NAME="logenable" VALUE="<% TCWebApi_get("SysLog_Entry","LogEnable","s") %>">
		<INPUT TYPE="HIDDEN" NAME="frameloglevel">
		
		<TBODY>
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD">
					<li name="Set" id="设置">日志设置</li>
					<li name="LogReview" id="日志查看">日志查看</li>
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top" style="padding: 0 0 40px 0;">
				<TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
				<TBODY>
					<TR>
						<TD vAlign=top>
						<DIV id='设置_item' class='hide'>
						<input type="hidden" name="EnableLog_Flag" value="<% tcWebApi_get("SysLog_Entry","LogEnable","s") %>">
						<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 10px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">日志设置</div>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD>
                                        <div class="title-line"></div>
                                    </TD>
                                </TR>
							<TR>
								<TD>
								<TABLE width="100%" cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD class='w-130'><div class="form-text">日志</div></TD>
										<!--TD-->
										<TD><INPUT class="input-onoff" id="Enable" onclick=SetLogEnbl() type=checkbox name="Enable" <% If TCWebApi_get("SysLog_Entry","LogEnable","h") = "Yes" then asp_Write("checked") end if %>></TD>
										<!--INPUT type="radio"  name="Enable" VALUE="No" <% If TCWebApi_get("SysLog_Entry","LogEnable","h") = "No" then asp_Write("checked") end if %> -->

										<!--INPUT onclick="SetLogEnbl()" value="Yes" type="radio" name="Enable" <% If TCWebApi_get("SysLog_Entry","LogEnable","h") = "Yes" then asp_Write("checked") end if %>-->
										<!--/TD-->
									</TR>
								</TBODY>
								</TABLE>
								<TABLE width="100%" cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD class='w-130'><div class="form-text">日志等级</div></TD>
										<TD >
										<SELECT id="Level" size="1" name="Level" > 		  
										<SCRIPT language="JavaScript" type='text/javascript'>
										var agearr = new Array(8);
										agearr[0]="紧急";
										agearr[1]="警报";
										agearr[2]="重要";
										agearr[3]="错误";
										agearr[4]="警告";
										agearr[5]="注意";
										agearr[6]="通知";
										agearr[7]="调试";

										for(i=0;i<8;i++)
										{
											if(document.ConfigForm.loglevel.value == i)
											{
												document.ConfigForm.Level[i]=new Option(agearr[i],i,false,false);
												document.ConfigForm.Level[i].selected=true;
											}
											else
											{
												if(agearr[i] == "紧急")
												{
													document.ConfigForm.Level[i]=new Option(agearr[i],i,false,false);
													document.ConfigForm.Level[i].selected=true;
												}
												else		
												{
													document.ConfigForm.Level[i]=new Option(agearr[i],i,false,false);
													document.ConfigForm.Level[i].selected=false;
												}
											}
										}
										</SCRIPT>					  
										</SELECT>
										</TD>
									</TR>
								</TBODY>
								</TABLE>
								<DIV id=srvInfo style="DISPLAY: none">
								<TABLE width="100%" cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD class='w-130'><div class="form-text">服务器IP地址</div></TD>
										<TD><INPUT id=MainServer maxLength=15 size=15 name=MainServer></TD>
									</TR>
									<TR>
										<TD><div class="form-text">服务器UDP端口</div></TD>
										<TD><INPUT maxLength=5 size=5 name=MainServerPort></TD>
									</TR>
								</TBODY>
								</TABLE>
								</DIV>
								<P></P>
								</TD>
								<TD width=10>&nbsp;</TD>
							</TR>
							<TR>
								<TD colspan="2">
								<P style="margin-top: 32px;margin-left: 182px;">
								<input type="button" id="btnOK" onclick='SubmitChange()' value="保 存">
								</P>
								</TD>
							</TR>
						</TBODY>
						</TABLE>
						</DIV>
						<DIV id='日志查看_item' class='hide'>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 10px auto;">
                                <TBODY>
                                    <TR>
                                        <TD>
                                            <div class="advanceTitle">日志查看</div>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD>
                                            <div class="title-line"></div>
                                        </TD>
                                    </TR>
							<TR>
								<TD class='w-10'>&nbsp;</TD>
								<TD><iframe src="/cgi-bin/syslog.cgi" frameborder="0" scrolling="no" width="100%" height="580" align=left></iframe></TD>
							</TR>
							<TR>
								<TD colspan="2">
								<P align=center style="margin-top: 32px;">
								<input type="button" value="保存日志" name="SysLogSave"  onClick="Back_Syslog()" >
								<input type="button" value="清除日志" name="SysLogClear" style="margin-left: 24px;" onClick="Clear_Syslog()" class="BtnBCnl">          
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
				</TD>
			</TR>			  
		</TBODY>
		</form> 		  
		</TABLE>
		</TD>
	</TR>
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
