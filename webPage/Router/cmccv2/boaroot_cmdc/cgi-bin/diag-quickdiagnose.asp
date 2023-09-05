<script language=JavaScript type=text/javascript>
var doManaulRep = 0;
</script>
<%
If Request_Form("ping_commitflag") = "1" then
	TCWebApi_set("WebCurSet_Entry","diag_pvc","ping_curSetIndex") 
	TCWebApi_set("Diagnostic_PVC","PingOtherIPaddr","ipaddress")
	TCWebApi_set("Diagnostic_PVC","PingOtherType","ping_PingOtherType") 
	TCWebApi_set("Diagnostic_PVC","PingOtherTimes","Repetitions") 
	TCWebApi_set("Diagnostic_PVC","TestType","ping_TestType")
	TCWebApi_set("Diagnostic_PVC","AddRoute","AddRoute_Ping")	
	TCWebApi_commit("Diagnostic_PVC")
	TCWebApi_commit("WebCurSet_Entry")
	
elseif Request_Form("Tracert_commitflag") = "1" then
	TCWebApi_set("WebCurSet_Entry","diag_pvc","Tracert_curSetIndex") 
	TCWebApi_set("Diagnostic_PVC","TraceIPaddr","ipaddress1")
	TCWebApi_set("Diagnostic_PVC","TestType","Tracert_TestType")
	TCWebApi_set("Diagnostic_PVC","AddRoute","AddRoute_Tracert")
	TCWebApi_commit("Diagnostic_PVC")
	TCWebApi_commit("WebCurSet_Entry")
	
elseif Request_Form("manual_commitflag") = "1" then
	TCWebApi_set("Cwmp_Entry","Manual_Inform","ManualInform")
	TCWebApi_commit("Cwmp_Entry")
	asp_Write("<script language=JavaScript type=text/javascript>doManaulRep=1;</script>")
	TCWebApi_unset("Diagnostic_PVC")

elseif Request_Form("report_commitflag") = "1" then
	TCWebApi_set("MonitorCollector_Common","Enable","reportvalue") 
	TCWebApi_commit("MonitorCollector")
	TCWebApi_set("PppoeEmulatorBridge_Entry","Enable","reportvalue") 
	TCWebApi_commit("PppoeEmulatorBridge")
else
	TCWebApi_unset("Diagnostic_PVC")
End If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>网络诊断</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<style type="text/css">
.hidden
{
	display:none;
}
</style>
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
	<div class="in_welcom" >
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="诊断->网络诊断" name="Selected_Menu">
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
	var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryName = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryValue = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryIndex = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vNasName = vArrayStr.split(',');
	
	//sort
	vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
	vEntryValue = SortUtil.SortMyArray( vEntryValue );		
	vEntryIndex = SortUtil.SortMyArray( vEntryIndex );	
	vNasName = SortUtil.SortMyArray( vNasName );			
	
	var slIFNnme = "<% tcWebApi_get("Diagnostic_PVC","AddRoute","s") %>";			
	function listCreate(l_flag)
	{
			for (i = 0; i < nEntryNum; i++)
			{
<% if TCWebApi_get("VoIPBasic_Common","VoIPConfig","h" ) = "OMCI" then %>
				if( vEntryName[i].indexOf('VOICE') >= 0 ){
					continue;
				}
<% end if%>
				if(vEntryName[i].indexOf('_R_') > 0){
				if(slIFNnme == vEntryValue[i])
				{
					document.write('<option value=' + vEntryValue[i] + ' selected>'	+ vEntryName[i] + '</option>');
				}
				else
				{
					document.write('<option value=' + vEntryValue[i] + '>'	+ vEntryName[i] + '</option>');
				}
				}
			}
	}	 
	
	function inValidIPAddr(Address)
	{
		var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits;
		var i;
		
		if(address == null) { 
			return false;
		}
		
		digits = address[0].split(".");
		for(i=0; i < 4; i++)
		{
			if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
			{ 
				return false;
			}
		}
		return true;
	}
	
	function isValidUrlName(url)
	{
		var i=0;
		var invalidArray = new Array();
		invalidArray[i++] = "www";
		invalidArray[i++] = "com";
		invalidArray[i++] = "org";
		invalidArray[i++] = "net";
		invalidArray[i++] = "edu";
		invalidArray[i++] = "www.";
		invalidArray[i++] = ".com";
		invalidArray[i++] = ".org";
		invalidArray[i++] = ".net";
		invalidArray[i++] = ".edu";
		if (isValidAscii(url) != '')
		{
			return false;
		}
		for (i = 0; i < url.length; i++)
		{
			if (url.charAt(i) == '\\')
			{
				return false;
			}
		}
		if (url == "")
		{
			return false;
		}
		if (url.length < 3)
		{
			return false;
		}
		for(j=0; j< invalidArray.length; j++)
		{
			if (url == invalidArray[j])
			{
				return false;
			}
		}
		return true;
	} 

	function LoadFrame()
	{
		var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
		set_action(query_string);
	}
	
	function startPing()
	{
		var ip_text = document.PingForm.ipaddress.value;
		var ip_calltimes = document.PingForm.Repetitions.value;
		if ((ip_calltimes > 10) || (ip_calltimes < 1) || (!isInteger(ip_calltimes)))
		{
			alert('重复次数非法! 请重新输入!');
			return false;
		}
	   if(inValidIPAddr(ip_text) || isValidUrlName(ip_text) )
		{
			setDisplay('PingResult', 0);
			document.PingForm.ping_PingOtherType.value = "Yes";
			document.PingForm.ping_commitflag.value = "1";
			document.PingForm.ping_TestType.value = "2";
			document.PingForm.AddRoute_Ping.value=getElById('pingCurrInterface').value;		          
			document.PingForm.submit();
		}
		else
		{
			alert("目的地址非法! 请重新输入!");
			return false;
		}
	}
	
	function startTracert()
	{
		var tracert_text = document.TracertForm.ipaddress1.value;
	
		if(inValidIPAddr(tracert_text) || isValidUrlName(tracert_text))
		{
			setDisplay('TracertResults', 0);
			document.TracertForm.Tracert_commitflag.value = "1";
			document.TracertForm.Tracert_TestType.value = "3";
			document.TracertForm.AddRoute_Tracert.value=getElById('tracertCurrInterface').value;
			$("form[name='TracertForm']").submit();
		}
		else
		{
			alert("目的地址非法! 请重新输入!");
			return false;
		}
	}

	function startInform()
	{
		document.ReportForm.manual_commitflag.value = "1";
		document.cookie = "DiagnosticPageStatus=1";
		$("form[name='ReportForm']").submit();
	}
<% if tcWebApi_get("WebCustom_Entry","isCTMONITORCOLLECTORSupported","h") = "Yes" then %>			
	function report()
	{
		document.closeReportForm.report_commitflag.value = "1";
		$("form[name='closeReportForm']").submit();
	}
<% end if %>

var cfg_menu_list  = new Array( 'Ping测试', 'Tracert测试', 'Inform手动上报', '智能诊断系统' );
var cfg_cookie_name = 'diag-quickdiagnose-menu';
init_l_menu();	
</SCRIPT>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
		<TBODY>
			<TR>
				<TD id=MenuArea_L2>
					<ul class="TRD">
					<li name="PINGTest" id="Ping测试">Ping测试</li>
					<li name="TracertTest" id="Tracert测试">Tracert测试</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<li name="InformManualRep" id="Inform手动上报">Inform手动上报</li>
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isCTMONITORCOLLECTORSupported", "h") = "Yes"  then %>
              		<li name="IntelligentDiagSys" id="智能诊断系统">智能诊断系统</li>
<% end if %>
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top">
				<div style="display:none;" id="PING测试_item">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">Ping测试</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
					<TR>
						<TD width=12>&nbsp;</TD>
						<TD width=480>
						<FORM id="PingForm" name="PingForm" action="/cgi-bin/diag-quickdiagnose.asp" method="post">
						
							<input type="hidden" name="ping_TestType" value="<%TCWebApi_get("Diagnostic_PVC","TestType","s")%>">
							<input type="hidden" name="ping_curSetIndex" value="0">
							<input type="hidden" name="ping_commitflag" value="0">
							<input type="hidden" name="ping_PingOtherType" value="<%TCWebApi_get("Diagnostic_PVC","PingOtherType","s")%>">
							<input type="hidden" name="AddRoute_Ping" value="">

							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
								<TR>
									<TD><div class="form-text">重复次数</div></TD>
                                    <TD>
                                        <LABEL><input id="Repetitions" name="Repetitions" value= "<% If TCWebApi_get("Diagnostic_PVC","PingOtherTimes","h") <> "N/A" then TCWebApi_get("Diagnostic_PVC","PingOtherTimes","s") end if %>" > </LABEL>(1-10次)
                                    </TD>
								</TR>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
								<TR>
<% else %>
								<TR style="display:none;">
<% end if %>
									<TD><div class="form-text">接口选择</div></TD>
                                    <TD>
									<SELECT id="pingCurrInterface" size="1" name="pingCurrInterface" > 
									<SCRIPT language=javascript>
										listCreate(1);
									</SCRIPT>
									</SELECT> 
									</TD>
								</TR>
								<TR>
									<TD><div class="form-text">目的地址</div></TD>
                                    <TD>
									<LABEL><INPUT id="ipaddress" name="ipaddress" value="<% If TCWebApi_get("Diagnostic_PVC","PingOtherIPaddr","h") <> "N/A"  then TCWebApi_get("Diagnostic_PVC","PingOtherIPaddr","s") end if %>" > </LABEL>
									</TD>
								</TR>
                                <tr>
                                    <TD></TD>
                                    <td>
                                        <P style="margin-top: 32px;">
                                            <INPUT onclick="startPing()" type="button" value="开 始" name="btnPing">
                                        </P>
                                    </td>
                                </tr>
							</TBODY>
							</TABLE>
							<DIV id=PingResult>
							<SCRIPT language=javascript>
								if (document.PingForm.ping_TestType.value == "2")
								{
									var result = "<%TCWebApi_get("Diagnostic_PVC","PingOther","s")%>";
									if(result == "PASS")
									{								
										document.writeln("<iframe src='/cgi-bin/getPingResult.cgi' frameborder='0' style='width:642px;height: 380px;border: 1px solid rgba(31, 57, 94, 0.5);margin-top: 20px;overflow-y: auto;'></iframe>" );
									}
									else
									{
										document.writeln("<div class=\"diag-box\"><div class=\"inner-txt\">Ping测试失败！</div></div>");
									}
								}
								else
								{
									document.PingForm.ipaddress.value = "";
									document.PingForm.Repetitions.value = "";
								}
							</SCRIPT>
							</DIV>
						</FORM>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</div>
				<div style="display:none;" id="Tracert测试_item">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">Tracert测试</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
					<TR>
						<TD width=12>&nbsp;</TD>
						<TD>
						<FORM id="TracertForm" name="TracertForm" action="/cgi-bin/diag-quickdiagnose.asp" method="post">
						
							<input type="hidden" name="Tracert_TestType" value="<%TCWebApi_get("Diagnostic_PVC","TestType","s")%>">
							<input type="hidden" name="Tracert_curSetIndex" value="0">
							<input type="hidden" name="Tracert_commitflag" value="0">
							<input type="hidden" name="Tracert_Ressult" value="<%TCWebApi_get("Diagnostic_PVC","TraceResult","s")%>">
							<input type="hidden" name="Tracert_PingOtherType" value="<%TCWebApi_get("Diagnostic_PVC","PingOtherType","s")%>">
							<input type="hidden" name="AddRoute_Tracert" value="">
							
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
								<TR>
<% else %>
								<TR style="display:none;">
<% end if %>
									<TD><div class="form-text">接口选择</div></TD>
                                    <TD>
									<SELECT id="tracertCurrInterface" size="1" name="tracertCurrInterface"> 
									<SCRIPT language=javascript>
										listCreate(2);
									</SCRIPT>
									</SELECT> 
									</TD>
								</TR>
								<TR>
									<TD><div class="form-text">目的地址</div></TD>
                                    <TD>
									<LABEL><input id="ipaddress1" name="ipaddress1" value="<% If TCWebApi_get("Diagnostic_PVC","TraceIPaddr","h") <> "N/A" then TCWebApi_get("Diagnostic_PVC","TraceIPaddr","s") end if %>" ></LABEL> 
									</TD>
								</TR>
                                <tr>
                                    <TD></TD>
                                    <td>
                                        <P style="margin-top: 32px;">
                                            <input onclick="startTracert()" type="button" value="开 始" name="btnTracert">
                                        </P>
                                    </td>
                                </tr>
							</TBODY>
							</TABLE>
							<DIV id="TracertResults" name="" font-size:9px;>
							<SCRIPT language=javascript>
								if (document.TracertForm.Tracert_TestType.value == "3")
								{
									var result = "<%TCWebApi_get("Diagnostic_PVC","TraceResult","s")%>" ;
									if (result == "PASS")
									{	
                                        document.writeln("<iframe src='/cgi-bin/getTracentResult.cgi' frameborder='0' style='width:642px;height: 380px;border: 1px solid rgba(31, 57, 94, 0.5);margin-top: 20px;overflow-y: auto;'></iframe>" );
									}
									else
									{
										document.writeln("<div class=\"diag-box\"><div class=\"inner-txt\">Tracert测试失败！</div></div>");
									}
								}
								else
								{
									document.TracertForm.ipaddress1.value = "";
								}
							</SCRIPT>
							</DIV>
						</FORM>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</div>
		    	<div style="display:none;" id="Inform手动上报_item">
				<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD width=12>&nbsp;</TD>
						<TD>
						<FORM id="ReportForm" name="ReportForm" action="/cgi-bin/diag-quickdiagnose.asp" method="post">
						
							<input type="hidden" name="ManualInform" value="1">
							<input type="hidden" name="manual_commitflag" value="0">

							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
								<TR>
									<TD><STRONG>Inform手动上报</STRONG></TD>
								</TR>
								<TR>
									<TD><INPUT onclick="startInform()" type="button" value="手动上报" name="btninform"></TD>
								</TR>
							</TBODY>
							</TABLE>
							<P>
							<P>
							<P>
							<DIV id=InformResults name="InformResults">
							<SCRIPT language=javascript>
								function printResult()
								{
									var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
									switch(result)
									{
										case "0":
											document.writeln("Inform手动上报测试结果:未上报（智能网关正在启动）");
											break;
										case "1":
											document.writeln("Inform手动上报测试结果:未上报（无远程管理WAN连接）");
											break;
										case "2":
											document.writeln("Inform手动上报测试结果:未上报（远程管理WAN连接未生效）");
											break;
										case "3":
											document.writeln("Inform手动上报测试结果:未上报（无管理通道DNS信息）");
											break;
										case "4":
											document.writeln("Inform手动上报测试结果:未上报（无省级数字家庭管理平台配置参数）");
											break;
										case "5":
											document.writeln("Inform手动上报测试结果:未上报（省级数字家庭管理平台域名解析失败）");
											break;
										case "6":
											document.writeln("Inform手动上报测试结果:上报无回应");
											break;
										case "7":
											document.writeln("Inform手动上报测试结果:上报过程中断");
											break;
										case "8":
											document.writeln("Inform手动上报测试结果:上报成功");
											break;
										default:
											document.writeln("Inform手动上报测试结果:无结果");
											break;			
									}	
								}

								function printWaitMsg()
								{
									document.writeln("<B><font color='#FF0000' size='-1'>正在手动上报,请稍等...</font></B>");
								}

								function refreshPage()
								{
									document.cookie = "DiagnosticPageStatus=2";
									$("form[name='ReportForm']").submit();
								}

								function disableCtl()
								{		   
									setDisable("Repetitions",1);
									setDisable("pingCurrInterface",1);
									setDisable("ipaddress",1);
									setDisable("btnPing",1);
									setDisable("tracertCurrInterface",1);
									setDisable("ipaddress1",1);
									setDisable("btnTracert",1);
									setDisable("btninform",1);
								}

								function getPageStatus()
								{
									if(document.cookie.length > 0)
									{
										tstart = document.cookie.indexOf("DiagnosticPageStatus=");
										if( tstart != -1)
										{
											tstart += 21;
											tend = document.cookie.indexOf(";",tstart);
											if(tend == -1) tend = document.cookie.length;
												return document.cookie.substring(tstart,tend);
										}
									}
								}

								var pst = getPageStatus();
								if (pst == "1" && doManaulRep)
								{
									printWaitMsg();
									disableCtl();
									setTimeout(refreshPage,15000);						
								}
								else if(pst =="2")
								{
									printResult();
									document.cookie = "DiagnosticPageStatus=3";
								}
							</SCRIPT>
							</DIV>
						</FORM>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</div>	
<% if tcWebApi_get("WebCustom_Entry", "isCTMONITORCOLLECTORSupported", "h") = "Yes"  then %>
				<div style="display:none;" id="智能诊断系统_item">
				<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD width=12>&nbsp;</TD>
						<TD>
						<FORM id="closeReportForm" name="closeReportForm" action="/cgi-bin/diag-quickdiagnose.asp" method="post"> 
						
							<input type="hidden" name="report_commitflag" value="0">
							<input type="hidden" name="reportvalue" value="0">
							
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
								<TR>
									<TD><STRONG>智能诊断系统URL</STRONG></TD>
									<TD><input type="text" disabled=true" name="url" id="url" value="<%if tcWebApi_get("MonitorCollector_Common","reportUrl","h") <> "N/A" then tcWebApi_get("MonitorCollector_Common","reportUrl","s") end if%>"></TD>
								</TR>
							</TBODY>
							</TABLE>
							<BR>
							<LABEL>点击关闭上报按钮,e家终端将关闭向智能诊断系统上传状态信息 </LABEL>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
								<TR>
									<TD>当前状态：<% If TCWebApi_get("MonitorCollector_Common","Enable","h") = "1" then asp_Write("打开") else asp_Write("关闭") end if %></TD>
									<TD width=10>&nbsp;</TD>
								</TR>
								<TR>
									<TD colspan="2" align="center">
										<input type="button" name="closereport" id="closereport" value="关闭上报" onclick="report()">
									</TD>
								</TR>
							</TBODY>
							</TABLE>   
							<BR>
						</FORM>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</div>
<% end if %>
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
