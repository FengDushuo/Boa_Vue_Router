<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Զ�̹���״̬</TITLE>
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
			���������ն�
		</span>
	</div>
	<div class="in_welcom">
		<span>���ã�</span>
		<a onclick="top.location.href='/'">
		<span>������ҳ</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="״̬->Զ�̹���״̬" name="Selected_Menu">
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
var cfg_menu_list  = new Array( '��������', 'ҵ�������·�״̬' );
<% else %>
var cfg_menu_list  = new Array( 'WOLINK״̬' );
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
					<li name="InteractionEstablish" id="��������">��������</li>
					<li name="OperationStatus" id="ҵ�������·�״̬">ҵ�������·�״̬</li>
<% else %>
					<li name="ANDLINKStatus" id="WOLINK״̬">WOLINK״̬</li>
<% end if %>	
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<TD valign="top">
                    <div style="display:none;" id="��������_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">��������</div>
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
                                                    <TD class=table_title width="20%">�����ϱ�Inform���</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
                                                            switch(result)
                                                            {
                                                                case "0":
                                                                    document.writeln("δ�ϱ���e���ն�����������");
                                                                    break;
                                                                case "1":
                                                                    document.writeln("δ�ϱ�����Զ�̹���WAN���ӣ�");
                                                                    break;
                                                                case "2":
                                                                    document.writeln("δ�ϱ���Զ�̹���WAN����δ��Ч��");
                                                                    break;
                                                                case "3":
                                                                    document.writeln("δ�ϱ����޹���ͨ��DNS��Ϣ��");
                                                                    break;
                                                                case "4":
                                                                    document.writeln("δ�ϱ�����ACS���ò�����");
                                                                    break;
                                                                case "5":
                                                                    document.writeln("δ�ϱ���ACS��������ʧ�ܣ�");
                                                                    break;
                                                                case "6":
                                                                    document.writeln("�ϱ��޻�Ӧ");
                                                                    break;
                                                                case "7":
                                                                    document.writeln("�ϱ������ж�"); 
                                                                    break;
                                                                case "8":
                                                                    document.writeln("�ϱ��ɹ�");
                                                                    break;
                                                                 default:
                                                                    document.writeln("N/A");
                                                                    break;			
                                                            }						
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR> 
                                                    <TD class=table_title width="20%">����RMS�����������</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var result = "<%TCWebApi_get("Cwmp_Entry","AcsConnStatus","s")%>";
                                                            switch(result)
                                                            {
                                                                case "0":
                                                                    document.writeln("δ�յ�Զ����������");
                                                                    break;
                                                                case "1":
                                                                    document.writeln("RMS�����Զ�����ӹ����ж�");
                                                                    break;
                                                                case "2":
                                                                    document.writeln("RMS�����Զ�����ӹ��̳ɹ�");
                                                                    break;
                                                                 default:
                                                                    document.writeln("δ�յ�Զ����������");
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
                    <div style="display:none;" id="ҵ�������·�״̬_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">ҵ�������·�״̬</div>
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
                                                    <TD class=table_title width="20%">ҵ�������·�״̬</TD>
                                                    <TD>
                                                        <SCRIPT language=javascript>
                                                            var rstatus = "<%tcWebApi_get("deviceAccount_Entry","registerStatus","s") %>";
                                                            var rresult = "<%tcWebApi_get("deviceAccount_Entry","registerResult","s") %>";
                                                            if(rstatus=="0" && rresult == "99")
                                                            {
                                                                document.write('δ�յ�Զ��ҵ������');
                                                            }
                                                            else if(rstatus=="0" && rresult == "0")
                                                            {
                                                                document.write('���ڽ���RMS�����Զ��ҵ������');
                                                            }
                                                            else if(rstatus=="0" && rresult == "1")
                                                            {
                                                                document.write('ҵ�����óɹ�');
                                                            }
                                                            else if(rstatus=="5" && rresult == "0")
                                                            {
                                                                document.write('ҵ�����óɹ�');
                                                            }
                                                            else if(rstatus=="0" && rresult == "2")
                                                            {
                                                                document.write('ҵ������ʧ��');
                                                            }
                                                            else
                                                            {
                                                                document.write('δ�յ�Զ��ҵ������');
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
                    <div style="display:none;" id="WOLINK״̬_item">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">WOLINK״̬</div>
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
                                                    <TD class=table_title width="20%">�豸�����ӿ�</TD>
                                                    <TD>
                                                        <script language=JavaScript type=text/javascript>
                                                            var workmode = "<%tcWebApi_get("alinkmgr_Entry","currMode","s") %>";
                                                            if(workmode == "IF6Mode")
                                                                document.write("IF6");
                                                            else if(workmode == "IF3Mode")
                                                                document.write("IF3");
                                                            else
                                                                document.write("δ֪����ģʽ�ӿ�");
                                                        </script>
                                                    </TD>
                                                </TR>
                                                <TR>
                                                    <TD class=table_title>����״̬</TD>
                                                    <TD>
                                                        <SCRIPT language=JavaScript type=text/javascript>
                                                            var result = "<%tcWebApi_get("wolink_Common","Status","s") %>";
                                                                if(result != "N/A" && (result != ""))
                                                                {
                                                                    switch(result)
                                                                    {	
                                                                        case "-10":
                                                                            document.write("����ע��");
                                                                            break;
                                                                        case "0":
                                                                            document.write("ע��ɹ�");
                                                                            break;
                                                                        case "-1":
                                                                            document.write("ע��ʧ��");
                                                                            break;
                                                                        case "2":
                                                                            document.write("��֤�ɹ�");
                                                                            break;
                                                                        case "-2":
                                                                            document.write("��֤ʧ��");
                                                                            break;
                                                                        case "-3":
                                                                            document.write("����ע��");
                                                                            break;
                                                                        case "-5":
                                                                            document.write("���ؾ���");
                                                                            break;
                                                                        default:
                                                                            document.write("δ����");
                                                                            break;			
                                                                    }						
                                                                }
                                                                else
                                                                    document.write("δ����");
                                                        </SCRIPT>
                                                    </TD>
                                                </TR>
                                                <TR style="display:none;">
                                                    <TD class=table_title>�������ʹ���</TD>
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
                                                    <TD class=table_title>WOLINK�汾</TD>
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
                                                    <TD class=table_title>ʡƽ̨��ַ</TD>
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