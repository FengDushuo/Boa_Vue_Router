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
<TITLE>WOLINK����</TITLE>
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
			���������ն�
		</span>
	</div>
	<div class="in_welcom" >
		<span>���ã�</span>
		<a onclick="top.location.href='/'">
		<span>������ҳ</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="����->WOLINK����" name="Selected_Menu"></TD>
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

var cfg_menu_list  = new Array('WOLINK����');
var cfg_cookie_name = 'net-wanset-menu';
init_l_menu();

</SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
			<TD id=MenuArea_L2>
			  <ul class="TRD">
			  <li name="wlSetting" id="WOLINK����">WOLINK����</li>
			  </ul>
			</TD>
			<SCRIPT language=javascript>
			MakeMenu(getElById ('Selected_Menu').value);
			</SCRIPT>
          <TD valign="top">
            <TABLE cellSpacing=0 cellPadding=0 border=0 height='100%'>
              <TBODY>
              <TR>
          <TD width=7 background=/img/panel3.gif>��</TD>
            <TD vAlign=top>
            <FORM name=ConfigForm action="/cgi-bin/net-alinkset.asp" method="post">            
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">WOLINK����</div>
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
													alert("�������ܿ���ʱ�����ܿ���WOLINK���ܣ�");
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
												alert("��ǰ����IF6����ģʽ,�޷�����IF6����");
												return;
											}*/
											
											if ( document.ConfigForm.if6addr.value == "" )
											{
												alert("IF6 Server address����Ϊ��");
												return;
											}
											
											if ( false == isValidIPandURLAddr(document.ConfigForm.if6addr.value) )
											{
												alert("IF6 Server address��ַ���Ϸ�");
												return;
											}
											
											if ( document.ConfigForm.if6port.value == ""  )
											{
												alert("IF6 Server port����Ϊ��");
												return;
											}
											
											if ( document.ConfigForm.if6port.value == ""  )
											{
												alert("IF6 Server port����Ϊ��");
												return;
											}
											
											if ( isValidPort(document.ConfigForm.if6port.value) == false )
											{
												alert("IF6 Server port���Ϸ�");
												return;
											}
											
											alert("�뱣֤ƽ̨��ַ�Ͷ˿�������ȷ");
											document.ConfigForm.Save_Flag.value = "3";
										}												
										else if(saveflag == 3)
										{
											/*if ( currmode != "IF6Mode" && currmode != "IF5Mode")
											{
												alert("��ǰ����һ��ƽ̨����ģʽ,�޷����ò���");
												return;
											}*/
											
											if ( document.ConfigForm.if5addr.value == "" )
											{
												alert("һ��ƽ̨��ַ����Ϊ��");
												return;
											}
										
											if ( false == isValidIPandURLAddr(document.ConfigForm.if5addr.value) )
											{
												alert("һ��ƽ̨��ַ���Ϸ�");
												return;
											}
											if ( document.ConfigForm.if5port.value == ""  )
											{
												alert("һ��ƽ̨�˿ڲ���Ϊ��");
												return;
											}
											
											if ( isValidPort(document.ConfigForm.if5port.value) == false )
											{
												alert("һ��ƽ̨�˿ڲ��Ϸ�");
												return;
											}
											alert("�뱣֤ƽ̨��ַ�Ͷ˿�������ȷ");
											document.ConfigForm.Save_Flag.value = "4";
										}
										document.ConfigForm.submit();
									}						
						</script>
                      
                        <DIV style="display:none;" id="WOLINK����_item">
                            <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
								<TBODY>
								<TR style="display:none;">
									<TD width=150><div class="form-text">�Զ�����</div></TD>
									<TD><INPUT id=btnReSet4 name=btnReSet4 class="secondary" onclick=btnReSet(); type=button value="�Զ�����"></TD>
									 <input type="hidden" name="Save_Flag" value="0">
								</TR>
								<TR>
									<TD width="20%"><div class="form-text" style="line-height: 42px;">WOLINKģ�鿪��</div></TD>
									<TD>
										<button id=btnSave1 name="btnSave1" onclick="btnSave(1)"><%if tcWebApi_get("wolink_Common","Active","h") <> "Yes" then asp_write("����WOLINKģ��") else asp_write("�ر�WOLINKģ��") end if%></button>
										<INPUT type="hidden" name="andlinkEnable" value="<%if tcWebApi_get("wolink_Common","Active","h") <> "N/A" then tcWebApi_get("wolink_Common","Active","s") else asp_write("") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">IF6ƽ̨��ַ</div></TD>
									<TD>
										<INPUT id=if6addr name=if6addr value="<%if tcWebApi_get("alinkmgr_Entry","ServerAddr","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","ServerAddr","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">IF6ƽ̨�˿�</div></TD>
									<TD>
										<INPUT maxlength=5 id=if6port name=if6port value="<%if tcWebApi_get("alinkmgr_Entry","ServerPort","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","ServerPort","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD>
										<INPUT id=btnSave2 name=btnSave2 class="enterbtn" onclick=btnSave(2); type=button value="ȷ��">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">һ��ƽ̨��ַ</div></TD>
									<TD>
										<INPUT id=if5addr name=if5addr value="<%if tcWebApi_get("alinkmgr_Entry","IF5Server","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","IF5Server","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD><div class="form-text">һ��ƽ̨�˿�</div></TD>
									<TD>
										<INPUT maxlength=5 id=if5port name=if5port value="<%if tcWebApi_get("alinkmgr_Entry","IF5Port","h") <> "N/A" then tcWebApi_get("alinkmgr_Entry","IF5Port","s") end if%>">
									</TD>
								</TR>
								<TR style="display:none;">
									<TD>
										<INPUT id=btnSave3 name=btnSave3 class="enterbtn" onclick=btnSave(3); type=button value="ȷ��">
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
