<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>ʹ�ð���</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<script language="JavaScript" type="text/javascript">
var sptUserName = '0'; 
var sysUserName = '1';
var curUserName = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
function FormLoad()
{
}
var cfg_menu_list  = new Array('�û�����', '��������','�豸����', '��־�ļ�����','�ն˹���');
var cfg_cookie_name = 'help-mag-menu';
init_l_menu();
</script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 onload="DisplayLocation(getElement('Selected_Menu').value);FormLoad()" onunload=DoUnload() marginheight="0" marginwidth="0">
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
			���ܼ�ͥ·����
		</span>
	</div>
	<div class="in_welcom" >
        <span>���ã�</span>
		<a onclick="top.location.href='/'">
		<span>������ҳ</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="����->����" name="Selected_Menu">
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
    	<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
          <TR>
            <TD id="MenuArea_L2">
            	<ul class="TRD">
                <li name="UserManagement" id="�û�����" class="TSD">�û�����</li>
                <li name="UpgradeManagement" id="��������">��������</li>
                <li name="DeviceManagement" id="�豸����">�豸����</li>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <li name="LogFileManagemet" id="��־�ļ�����">��־�ļ�����</li>
                <% end if %>
                <li name="TerminalManagemet" id="�ն˹���">�ն˹���</li>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='UserManagement_item' id='�û�����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageUser id=manageUser>
                    <TD>
                        <div class="advanceTitle">�û�����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <tr name=manageUser_2 id=manageUser_2>
                  <td width=20>&nbsp;</td>
                  <td class="advanceContent">
                      <li class="helpTxt">�������ã�ʹ��ά���ʺŵ�¼�󣬿����޸��û������ʺŵ����룬������ҪУ��ԭ���롣</li>
                    </td>
                </tr>
                <% end if %>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">�û������ʺź��������ã�ʹ���û������ʺŵ�¼��,���޸��û������ʺŵ����룬��ҪУ��ԭ���롣 </li>
                    </td>
                  </tr>
                </table>
                <table name='UpgradeManagement_item' id='��������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                  <TR name=manageEquip id=manageEquip>
                      <TD>
                          <div class="advanceTitle">��������</div>
                      </TD>
                  </TR>
                  <TR>
                      <TD>
                          <div class="title-line"></div>
                      </TD>
                  </TR>
                  <tr>
                    <td class="advanceContent">
                        <li class="helpTxt">����ϵͳ���������ϵͳ���������ҪԼ������ʱ�䣬�����ڸ����йػ���ϵͳ������º�ϵͳ���Զ�����������</li>
                    </td>
                </tr>
              </table>
              <table name='DeviceManagement_item' id='�豸����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageEquip id=manageEquip>
                    <TD>
                        <div class="advanceTitle">�豸����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">�豸������ʹ�øò����������������ء�</li>
                      <li class="helpTxt">�ָ����ã��ָ�Ĭ�����úͻָ��������ù��ܡ�</li>
                   </td>
                </tr>
              </table>
              <table name='LogFileManagement_item' id='��־�ļ�����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageSyslog id=manageSyslog>
                    <TD>
                        <div class="advanceTitle">��־�ļ�����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=manageSyslog_1 id=manageSyslog_1>
                  <td class="advanceContent">
                      <li class="helpTxt">��־д��ȼ����ã��������û��߽���д����־�ļ���������д����־�ļ�������£���������д�����ʾ��־�ļ��ĵȼ���</li>
                      <li class="helpTxt">��־����ʾ��ǰ�ȼ��µ���־���ݡ�</li>
                      <li class="helpTxt">ά���ϱ���������ά����Ա��ά����ʹ����ά���˺�ʱ��ͨ���ý������֪ͨITMS����ά���˺ŵ����롣</li>
                      </td>
                </tr>
              </table>
              <table name='TerminalManagemet_item' id='�ն˹���_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageSyslog id=manageSyslog>
                    <TD>
                        <div class="advanceTitle">�ն˹���</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=manageSyslog_1 id=manageSyslog_1>
                  <td class="advanceContent">
                      <li class="helpTxt">���Կ��������豸������ʱ���Լ��Ƿ���������</li>
                    </td>
                </tr>
              </table></TD>
          </TR>
        </TBODY>
      </TABLE></TD>
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
