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

var cfg_menu_list  = new Array('�豸��Ϣ', '�������Ϣ', '�û�����Ϣ', 'Զ�̹���״̬', '���������Ϣ', 'Զ�̹���״̬');
var cfg_cookie_name = 'help-sta-menu';
init_l_menu();

</script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FormLoad()" 
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
			���ܼ�ͥ·����
		</span>
	</div>
	<div class="in_welcom" >
        <span>���ã�</span>
		<a onclick="top.location.href='/'">
		<span>������ҳ</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="����->״̬" name="Selected_Menu">
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
    <TD class="content"><TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
          <TR>
            <TD id=MenuArea_L2>
            		<ul class="TRD">
	                <li name="DeviceInfo" id="�豸��Ϣ" class="TSD">�豸��Ϣ</li>
	                <li name="InternetInfo" id="�������Ϣ">�������Ϣ</li>
	                <li name="UserInfo" id="�û�����Ϣ">�û�����Ϣ</li>
	                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
	                <li name="VOIPInfo" id="���������Ϣ">���������Ϣ</li>
	                <% end if %>
	                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
	                <li name="RemoteManagementSta" id="Զ�̹���״̬">Զ�̹���״̬</li>
	                <% end if %>
              	</ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table id='�豸��Ϣ_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                        <TR name=statusEquip id=statusEquip>
                            <TD>
                                <div class="advanceTitle">�豸��Ϣ</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
                <tr>
                  <td class="advanceContent">
                    <li class="helpTxt">��ʾ�豸�ͺţ��豸��ʶ�ţ�Ӳ���汾������汾����Ϣ��</li>
                </td>
                </tr>
              </table>
              <table id='�������Ϣ_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusNetwork id=statusNetwork>
                    <TD>
                        <div class="advanceTitle">�������Ϣ</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                      <li id=statusNetwork_1 class="helpTxt">������Ϣ��ʾ���������״̬������PVC��IP��ַ���������룬Ĭ�����أ�DNS��������Ϣ��</li>
                      <li id=statusNetwork_2 class="helpTxt">PON��Ϣ��ʾPON����·����״̬����·����ͳ�ƣ���ģ����Ϣ�� </li>
<% else %>
                      <li id=statusNetwork_1 class="helpTxt">��ʾ�������ģʽ������������Ϣ��ʾIP��ַ���������룬MAC��ַ������������Ϣ��ʾ����PVC��IP��ַ���������룬Ĭ�����أ�DNS��������Ϣ��</li>
<% end if %>
                    </td>
                </tr>
              </table>
              <table id='�û�����Ϣ_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusUser id=statusUser>
                    <TD>
                        <div class="advanceTitle">�û�����Ϣ</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                        <% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
                        <li id=statusUser_1 class="helpTxt">WLAN�ӿ���Ϣ��ʾ������������״̬���ŵ�������SSID��ͳ����Ϣ��SSID����֤��ʽ�ͼ���״̬�ȣ�LAN�ӿ���Ϣ��ʾ����IP��ַ��MAC��ַ��ÿ��LAN�ڵ�״̬���շ������ֽ�����</li>
                        <% else %>
                        <li id=statusUser_1 class="helpTxt">LAN�ӿ���Ϣ��ʾ����IP��ַ��MAC��ַ��ÿ��LAN�ڵ�״̬���շ������ֽ�����</li>
                        <% end if %>
<% else %>
                        <li id=statusUser_1 class="helpTxt">WAN�ӿ���Ϣ��ʾWAN�������ͣ�WAN�ӿ�����״̬��WAN�ӿ�����ͳ����Ϣ��</li>
                        <li id=statusUser_2 class="helpTxt">LAN�ӿ���Ϣ��ʾ���������õ���Ϣ��IP��ַ���������룬IP��ַ�أ�����״̬�����ͺͽ���������Ϣ���ͻ�����Ϣ��</li>
                        <li id=statusUser_3 class="helpTxt">WLAN�ӿ���Ϣ��ʾWLAN����״̬��Ƶ�ʴ��������ŵ���Ϣ��WLAN�ӿ���Ϣ�������ӿ�����ͳ����Ϣ����������֤��ʽ���ӿ����ӵĿͻ�����Ϣ��</li>
<% end if %>
                    </td>
                </tr>
              </table>
              <table id='���������Ϣ_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                <TR name=statusVoip id=statusVoip>
                    <TD>
                        <div class="advanceTitle">���������Ϣ</div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=statusVoip_1 class="helpTxt">���������Ϣ����ҵ��ע��״̬�͵绰���룻ҵ��״̬������ע���δע���״̬���绰������ʾע��ĵ绰���롣</li>
                    </td>
                </tr>
                <% end if %>
              </table>
              <table id='Զ�̹���״̬_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusACS id=statusACS>
                    <TD>
                        <div class="advanceTitle">Զ�̹���״̬</div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                      <li id=statusACS_1 class="helpTxt">��ʾ�������������ҵ�������·�״̬�������������������ϱ�Inform����Լ�����RMS�������������</li>
<% else %>
                      <li id=statusACS_1 class="helpTxt">��ʾWOLINKԶ�̹���״̬��</li>
<% end if %>
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
