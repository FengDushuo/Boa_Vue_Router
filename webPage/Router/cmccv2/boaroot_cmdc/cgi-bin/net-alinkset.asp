<%
if Request_Form("Save_Flag") = "1" then
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","")
	tcWebApi_constSet("APCli_Common","noNeedScan","1")
	tcWebApi_constSet("APCli_Common","currentRadio","")
	tcWebApi_constSet("APCli_Common","syncFlag","")
	tcWebApi_constSet("APCli_Common","WPSMode","0")
	tcWebApi_constSet("APCli_Common","StartConn","0")
	tcWebApi_constSet("APCli_Entry0","Enable","1")
	tcWebApi_constSet("APCli_Entry0","MACRepeaterEn","1")
	tcWebApi_constSet("APCli_Entry0","AuthMode","OPEN")
	tcWebApi_constSet("APCli_Entry0","EncrypType","None")
	tcWebApi_constSet("APCli_Entry0","SSID","CU-QLINK")
	tcWebApi_constSet("APCli_Entry1","Enable","1")
	tcWebApi_constSet("APCli_Entry1","MACRepeaterEn","1")
	tcWebApi_constSet("APCli_Entry1","AuthMode","OPEN")
	tcWebApi_constSet("APCli_Entry1","EncrypType","None")
	tcWebApi_constSet("APCli_Entry1","SSID","CU-QLINK")
	TCWebApi_commit("APWanInfo_Common")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "2" then
	TCWebApi_set("wolink_common","Active","andlinkEnable")
	TCWebApi_commit("wolink_common")
	if Request_Form("andlinkEnable") = "Yes" then
		tcWebApi_constSet("WanInfo_Common","APAction","Modify")
		TCWebApi_commit("APWanInfo_Common")
	end if
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "3" then
	TCWebApi_set("alinkmgr_Entry","ServerAddr","if6addr")
	TCWebApi_set("alinkmgr_Entry","ServerPort","if6port")
	if Request_Form("andlinkEnable") = "Yes" then
		tcWebApi_constSet("WanInfo_Common","APAction","Modify")
		TCWebApi_commit("alinkmgr_Entry")
		TCWebApi_commit("APWanInfo_Common")
	end if
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "4" then
	TCWebApi_set("alinkmgr_Entry","IF5Server","if5addr")
	TCWebApi_set("alinkmgr_Entry","IF5Port","if5port")
	if Request_Form("andlinkEnable") = "Yes" then
		tcWebApi_constSet("WanInfo_Common","APAction","Modify")
		TCWebApi_commit("alinkmgr_Entry")
		TCWebApi_commit("APWanInfo_Common")
	end if
	TCWebApi_save()
end if

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>WOLINK配置</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<style type='text/css'>
.cus_help {
	width:150px;	
}
</style>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
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
		<input id="Selected_Menu" type="hidden" value="网络->WOLINK配置" name="Selected_Menu"></TD>
	</div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
  <TBODY>
	<TR>
		<TD class="header"><TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
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
	with (getElById('ConfigForm'))
	{
		/* do nothing */
	}
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}


function btnReSet()
{
	document.ConfigForm.Save_Flag.value = "1";
	document.ConfigForm.submit();
}

var cfg_menu_list  = new Array('WOLINK配置');
var cfg_cookie_name = 'net-wanset-menu';
init_l_menu();

</SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
			<TD id=MenuArea_L2>
			  <ul class="TRD">
			  <li name="wlSetting" id="WOLINK配置">WOLINK配置</li>
			  </ul>
			</TD>
			<SCRIPT language=javascript>
			MakeMenu(getElById ('Selected_Menu').value);
			</SCRIPT>
          <TD valign="top">
            <TABLE cellSpacing=0 cellPadding=0 border=0 height='100%'>
              <TBODY>
              <TR>
          <TD width=7 background=/img/panel3.gif>　</TD>
            <TD vAlign=top>
            <FORM name=ConfigForm action="/cgi-bin/net-alinkset.asp" method="post">            
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">WOLINK配置</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
              <TR>
                <TD>
                <script language="JavaScript" type="text/JavaScript">
									function btnSave(saveflag)											
									{
										var heartbeat = "<% tcwebApi_get("alinkmgr_Entry","heartBeatTime","s") %>";
										var EthernetState = "<% tcwebApi_get("WanInfo_Common","EthernetState","s") %>";
										var currmode = "<% tcwebApi_get("alinkmgr_Entry","currMode","s") %>";
										var mesh_enable =  "<% tcwebApi_get("Mesh_dat", "MapEnable", "s") %>";
										
										if ( saveflag == 1 )
										{
											/* andlink enable */
											if ( document.ConfigForm.andlinkEnable.value == "Yes" )
												document.ConfigForm.andlinkEnable.value = "No";
											else
											{
												if(mesh_enable =="1")
												{
													alert("组网功能开启时，不能开启WOLINK功能！");
													return;
												}
												document.ConfigForm.andlinkEnable.value = "Yes";
											}
											document.ConfigForm.Save_Flag.value = "2";
										}
										else if ( saveflag == 2 )
										{
											/* if6 server addr and port */
											/*if ( currmode != "IF6Mode" )
											{
												alert("当前不是IF6工作模式,无法设置IF6参数");
												return;
											}*/
											
											if ( document.ConfigForm.if6addr.value == "" )
											{
												alert("IF6 Server address不能为空");
												return;
											}
											
											if ( false == isValidIPandURLAddr(document.ConfigForm.if6addr.value) )
											{
												alert("IF6 Server address地址不合法");
												return;
											}
											
											if ( document.ConfigForm.if6port.value == ""  )
											{
												alert("IF6 Server port不能为空");
												return;
											}
											
											if ( document.ConfigForm.if6port.value == ""  )
											{
												alert("IF6 Server port不能为空");
												return;
											}
											
											if ( isValidPort(document.ConfigForm.if6port.value) == false )
											{
												alert("IF6 Server port不合法");
												return;
											}
											
											alert("请保证平台地址和端口输入正确");
											document.ConfigForm.Save_Flag.value = "3";
										}												
										else if(saveflag == 3)
										{
											/*if ( currmode != "IF6Mode" && currmode != "IF5Mode")
											{
												alert("当前不是一级平台工作模式,无法设置参数");
												return;
											}*/
											
											if ( document.ConfigForm.if5addr.value == "" )
											{
												alert("一级平台地址不能为空");
												return;
											}
										
											if ( false == isValidIPandURLAddr(document.ConfigForm.if5addr.value) )
											{
												alert("一级平台地址不合法");
												return;
											}
											if ( document.ConfigForm.if5port.value == ""  )
											{
												alert("一级平台端口不能为空");
												return;
											}
											
											if ( isValidPort(document.ConfigForm.if5port.value) == false )
											{
												alert("一级平台端口不合法");
												return;
											}
											alert("请保证平台地址和端口输入正确");
											document.ConfigForm.Save_Flag.value = "4";
										}
										document.ConfigForm.submit();
									}						
						</script>
                      
                        <DIV style="display:none;" id="WOLINK配置_item">
                            <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
								<TBODY>
								<TR style="display:none;">
									<TD width=150><div class="form-text">自动组网</div></TD>
									<TD><INPUT id=btnReSet4 name=btnReSet4 class="secondary" onclick=btnReSet(); type=button value="自动组网"></TD>
									 <input type="hidden" name="Save_Flag" value="0">
								</TR>
								<TR>
									<TD width="20%"><div class="form-text" style="line-height: 42px;">WOLINK模块开关</div></TD>
									<TD>
										<button id=btnSave1 name="btnSave1" onclick="btnSave(1)"><%if tcWebApi_get("wolink_Common","Active","h") <> "Yes" then asp_write("开启WOLINK模块") else asp_write("关闭WOLINK模块") end if%></button>
										<INPUT type="hidden" name="andlinkEnable" value="<%if tcWebApi_get("wolink_Common","Active","h") <> "N/A" then tcWebApi_get("wolink_Common","Active","s") else asp_write("") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">IF6平台地址</div></TD>
									<TD>
										<INPUT id=if6addr name=if6addr value="<%if tcWebApi_get("alinkmgr_Entry","ServerAddr","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","ServerAddr","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">IF6平台端口</div></TD>
									<TD>
										<INPUT maxlength=5 id=if6port name=if6port value="<%if tcWebApi_get("alinkmgr_Entry","ServerPort","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","ServerPort","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD>
										<INPUT id=btnSave2 name=btnSave2 class="enterbtn" onclick=btnSave(2); type=button value="确定">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">一级平台地址</div></TD>
									<TD>
										<INPUT id=if5addr name=if5addr value="<%if tcWebApi_get("alinkmgr_Entry","IF5Server","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","IF5Server","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">一级平台端口</div></TD>
									<TD>
										<INPUT maxlength=5 id=if5port name=if5port value="<%if tcWebApi_get("alinkmgr_Entry","IF5Port","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","IF5Port","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD>
										<INPUT id=btnSave3 name=btnSave3 class="enterbtn" onclick=btnSave(3); type=button value="确定">
									</TD>
								</TR>
								<TBODY>
							</TABLE>
						</DIV>												
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
