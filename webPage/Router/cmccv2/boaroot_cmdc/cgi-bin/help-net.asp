<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>ʹ�ð���</TITLE>
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
<script language="JavaScript" type="text/javascript">
var sptUserName = '0'; 
var sysUserName = '1';
var curUserName = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
function FormLoad()
{
}

var cfg_menu_list  = new Array(<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>'�������', '������', 'LAN���ַ����', <% end if %>'WLAN��������', 'WLAN5G��������', 'Զ�̹���', 'QoS', 'ʱ�����','WOLINK����');
var cfg_cookie_name = 'help-net-menu';
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
    <TD class="content"><TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
          <TR>
            <TD id=MenuArea_L2>
            	<ul class="TRD">
            		<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <li name="InternetSet" id="�������" class="TSD">�������</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="BandingSet" id="������">������</li>
<% end if %>
                <li name="LANAddressSet" id="LAN���ַ����">LAN���ַ����</li>
                <% end if %>
                <% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
                <li name="WLANSet" id="WLAN��������">WLAN��������</li>
                <% end if %>
                <% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
                <li name="WLAN5GCnf" id="WLAN5G��������">WLAN5G��������</li>
                <% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="RemoteManagement" id="Զ�̹���">Զ�̹���</li>
<% end if %>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li id="QoS">QoS</li>
<% end if %>
                <li name="TimeManagement" id="ʱ�����">ʱ�����</li>
                <li name="wlSetting" id="WOLINK����">WOLINK����</li>
                <!-- <li name="RouteSet" id="·������">·������</li> -->
                <% end if %>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='InternetSet_item' id='�������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle">�������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">������ã��Կ�����ӽ�����ز�������,������ɺ�,��������ʾ��Ӧ��״̬��</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                        <li class="helpTxt">WAN���ӣ��������½����ӡ����һ��WAN���ӣ�������ɾ�����ӡ�ɾ�������ӡ�</li>
                        <li class="helpTxt">���ã��ø���PVC��Ч��</li>
                        <li id=ntwk_cfgWan_1 class="helpTxt">���ð󶨣����԰Ѹ���LAN�ڡ�����SSID�Ͷ�Ӧ��WAN�ڰ󶨡�</li>
                        <li class="helpTxt">ģʽ���ֳ�Route��Bridge����ģʽ��Routeģʽ������������ģʽDHCP����ISP���õ�һ��IP��ַ����Static����ISP����һ����̬��IP���㣩��PPPoE��Bridgeģʽ���Խ��豸���óɽ���LAN��ISP֮��������豸��������ʹ���������������ͨ�ž�����ͬһLAN���������ϡ�</li>
<% end if %>
                        <li class="helpTxt">���ӷ�ʽ������ͨ��IP��ʽ�������Ӻ�ͨ��PPP��ʽ�����������֡�����ʵ�ʵ�������Ҫѡ�������ӵķ�ʽ��</li>
                        <li class="helpTxt">IPЭ��汾����������ʹ�õ�IP�汾��ͨ��ʹ��IPv4�汾��Ҳ����ͨ��ѡ��IPv6��֧��IPv6�����ѡ��IPv4/v6��ʽ����ͬʱʹ��IPv4��IPv6����IP�汾��</li>
                        <li class="helpTxt">PPPoE��ISP���ṩ�ʺţ��������������Ϣ���û��������롢�������ƣ������ò��ŷ�ʽ����ģʽϵͳ��ͨ��PPPoE��̬���IP�� </li>
                        <li class="helpTxt">DHCP���豸����ISPͨ��DHCP�Զ����IP�� </li>
                        <li class="helpTxt">Static����ISP����һ����̬��IP��ַ����Ҫ�������Ϣ������IP��ַ���������룬��ѡDNS������������DNS�������ȣ�IP��ַ����������ȷ�ĸ�ʽ��4��IP�ֽ�֮���ɡ�.���ŷֿ�(x.x.x.x)�����磺192.168.0.100��</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                        <li id=ntwk_cfgWan_2 class="helpTxt">֧��802.1q��802.1p��NAT��IGMP Proxy��</li>
                        <li id=ntwk_cfgWan_3 class="helpTxt">�������UBR Without PCR��UBR With PCR��CBR��Non-Real Time VBR��Realtime VBR��</li>
<% end if %>
                        <li class="helpTxt">IPv6 WAN��Ϣ��ȡ��ʽ������ͨ��DHCP����SLAAC���ַ�ʽ��̬�Ļ�ȡIPv6�ĵ�ַ��Ҳ���Ծ�̬����IPv6�ĵ�ַ�����ݾ������������������á�</li>
                    </td>
                </tr>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">2.4G�м�����/5G�м�����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">2.4G�м�����/5G�м����ã����м�����WLAN���ӽ�����ز�������,������ɺ�,��������ʾ��Ӧ��״̬��</li>
                        <li class="helpTxt">�м�����WLAN SSID���м�����SSID���ơ�</li>
                        <li class="helpTxt">�ֶ������м�����WLAN��ȫ������ѡ���Ƿ��ֶ������м�����WLAN��ȫ������</li>
                        <li class="helpTxt">���ܷ�ʽ���м����а�ȫ���ã�֧�ֿ���ϵͳ��WEP��WPA-PSK��WPA2-PSK����֤��ʽ�Ͷ�Ӧ�ļ��ܷ�ʽ��</li>
                        <li class="helpTxt">WLAN������WLAN�м�����ʹ����ͬ���������ã�ѡ���Ƿ�ͬ��WLAN������WLAN�м������������á�</li>
                        <li class="helpTxt">WPS��ʽ���������ʹ��WPS��ʽ���������</li>
                    </td>
                </tr>
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">AP����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li>����AP���ã�ѡ���Ƿ�����AP���á�</li>
                    </td>
                </tr>
<% end if %>
              </table>
              <table name='BandingSet_item' id='������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgBind id=ntwk_cfgBind>
                    <TD>
                        <div class="advanceTitle">������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=ntwk_cfgBind_1 id=ntwk_cfgBind_1>
                  <td width=20>&nbsp;</td>
                  <td class="advanceContent"><ul>
                      <li>�����ÿ��������û�LAN�ں�WAN�ڵİ󶨷�ʽ��֧�ֶ˿ڰ󶨺Ͷ˿�+VLAN�����ַ�ʽ������Ƕ˿ڰ󶨣���Ӧ�˿ڵ����ݴӰ󶨵�WAN�ڳ�ȥ������Ƕ˿�
                        +VLAN�󶨣���Ӧ�˿��Ҵ���VLAN�����ݲŻ�Ӱ󶨵�WAN�ڳ�ȥ���˿ڼ�VLAN����m1/n1 VLAN�Է�ʽ���ã�����m1�����û����VLAN��n1������ӿڵ�VLAN��
                        ����VLAN���Էֺŷֿ���</li>
                    </ul></td>
                </tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
              </table>
              <table name='LANAddressSet_item' id='LAN���ַ����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgDHCP id=ntwk_cfgDHCP>
                    <TD>
                        <div class="advanceTitle">LAN���ַ����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=ntwk_cfgDHCP_1 id=ntwk_cfgDHCP_1>
                  <td class="advanceContent">
                      <li class="helpTxt">IPv4���ã�Ĭ��Ϊ������DHCP����ʹ�øò���,��DHCP��ز�����������,������ɺ󣬽�������ʾ�µ�DHCP״̬������������Լʱ�䣨1���ӡ�1Сʱ��1�졢1�ܣ���DHCP����ģʽ��DHCP 
                        Server��DHCP relay����</li>
                      <li class="helpTxt">IPv6���ã����������Ƿ�����LAN���RA������LAN���豸����ͨ��RA��ʽ��ȡIPv6�ĵ�ַ��ͬʱҲ����������LAN��ͨ��DHCP��ʽ��ȡIPv6�ĵ�ַ��</li>
                    </td>
                </tr>
              </table>
              <table name='WLANCnf_item' id='WLAN��������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWLAN id=ntwk_cfgWLAN>
                    <TD>
                        <div class="advanceTitle">WLAN��������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN_1 class="helpTxt">ʹ�����ߣ�������ر�WLAN</li>
                      <li id=ntwk_cfgWLAN_2 class="helpTxt">ģʽѡ�񣺿�ѡ��802.11b��802.11g��802.11n��802.11b/g����Լ�802.11b/g/n���ģʽ</li>
                      <li id=ntwk_cfgWLAN_3 class="helpTxt">�ŵ�ѡ�񣺸����������ô��б���ѡ��ǡ�����ŵ���Ϊ�����źŸ��ţ�Ӧ��ÿ��AP���䲻ͬ���ŵ�������ʹ���Զ��ŵ�ѡ��ģʽ��</li>
                      <li id=ntwk_cfgWLAN_4 class="helpTxt">���͹���ǿ�ȣ��趨������Ƶģ��ʹ�õķ��书�ʡ� </li>
                      <li id=ntwk_cfgWLAN_5 class="helpTxt">SSID�������趨��ǰ�����õ�SSID����š�</li>
                      <li id=ntwk_cfgWLAN_6 class="helpTxt">SSID������SSID���ơ��������������ַ������Ȳ��ܳ���32���ַ������ִ�Сд��</li>
                      <li id=ntwk_cfgWLAN_7 class="helpTxt">���ʣ�ѡ���������ӹ������ʣ����е��Զ����ʸ����ŵ��������Զ�ѡ����ʵ�������ʡ�</li>
                      <li id=ntwk_cfgWLAN_8 class="helpTxt">Ƶ����ȣ�ѡ������������802.11nģʽ�µ�Ƶ������</li>
                      <li id=ntwk_cfgWLAN_9 class="helpTxt">���������ѡ������������802.11nģʽ�µı���ʱ������</li>
                      <li id=ntwk_cfgWLAN_10 class="helpTxt">SSIDʹ�ܣ�ѡ���Ƿ�ʹ�ܵ�ǰ��SSID��</li>
                      <li id=ntwk_cfgWLAN_11 class="helpTxt">�㲥ȡ�����Ƿ�ʹ�ܶ�ӦSSID�Ĺ㲥ȡ�����ܣ����ʹ�ܣ������ز������㲥SSID��</li>
                      <li id=ntwk_cfgWLAN_12 class="helpTxt">��ȫ���ã��ɶ�SSID���ð�ȫ����������֧�ֿ���ϵͳ��WEP��WPA-PSK��WPA2-PSK��WPA-PSK/WPA2-PSK����֤��ʽ�Ͷ�Ӧ�ļ��ܷ�ʽ��</li>
                      <li id=ntwk_cfgWLAN_13 class="helpTxt">WPA Ԥ��֤������Կ�����ù�����Կ��</li>
                      <li id=ntwk_cfgWLAN_14 class="helpTxt">WPA ���ܣ�ѡ����ܷ�����</li>
                    </td>
                </tr>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <TR name=ntwk_cfgWLAN2 id=ntwk_cfgWLAN2>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">WLAN��������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN2_1 class="helpTxt">WLAN�����ܰ���Ϣ���á�</li>
                    </td>
                </tr>
                <% end if %>
              </table>
              <table name='WLAN5GCnf_item' id='WLAN5G��������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWLAN5G id=ntwk_cfgWLAN5G>
                    <TD>
                        <div class="advanceTitle">WLAN��������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN5G_1 class="helpTxt">ʹ�����ߣ�������ر�WLAN</li>
                      <li id=ntwk_cfgWLAN5G_2 class="helpTxt">ģʽѡ�񣺿�ѡ��802.11a��802.11n/a����Լ�802.11ac/n/a���ģʽ</li>
                      <li id=ntwk_cfgWLAN5G_3 class="helpTxt">�ŵ�ѡ�񣺸����������ô��б���ѡ��ǡ�����ŵ���Ϊ�����źŸ���,Ӧ��ÿ��AP���䲻ͬ���ŵ�������ʹ���Զ��ŵ�ѡ��ģʽ��</li>
                      <li id=ntwk_cfgWLAN5G_4 class="helpTxt">���͹���ǿ�ȣ��趨������Ƶģ��ʹ�õķ��书�ʡ� </li>
                      <li id=ntwk_cfgWLAN5G_5 class="helpTxt">SSID������ �趨��ǰ�����õ�SSID����š�</li>
                      <li id=ntwk_cfgWLAN5G_6 class="helpTxt">SSID�� ����SSID���ơ��������������ַ�,���Ȳ��ܳ���32���ַ�,���ִ�Сд��</li>
                      <li id=ntwk_cfgWLAN5G_7 class="helpTxt">���ʣ� ѡ���������ӹ������ʣ����е��Զ����ʸ����ŵ��������Զ�ѡ����ʵ�������ʡ�</li>
                      <li id=ntwk_cfgWLAN5G_8 class="helpTxt">Ƶ����ȣ�ѡ������������802.11nģʽ�µ�Ƶ������</li>
                      <li id=ntwk_cfgWLAN5G_9 class="helpTxt">���������ѡ������������802.11nģʽ�µı���ʱ������</li>
                      <li id=ntwk_cfgWLAN5G_10 class="helpTxt">SSIDʹ�ܣ�ѡ���Ƿ�ʹ�ܵ�ǰ��SSID��</li>
                      <li id=ntwk_cfgWLAN5G_11 class="helpTxt">�㲥ȡ�����Ƿ�ʹ�ܶ�ӦSSID�Ĺ㲥ȡ�����ܣ����ʹ�ܣ������ز������㲥SSID��</li>
                      <li id=ntwk_cfgWLAN5G_12 class="helpTxt">��ȫ���ã��ɶ�SSID���ð�ȫ����������֧�ֿ���ϵͳ��WEP��WPA-PSK��WPA2-PSK��WPA-PSK/WPA2-PSK����֤��ʽ�Ͷ�Ӧ�ļ��ܷ�ʽ��</li>
                      <li id=ntwk_cfgWLAN5G_13 class="helpTxt">WPA Ԥ��֤������Կ�����ù�����Կ��</li>
                      <li id=ntwk_cfgWLAN5G_14 class="helpTxt">WPA ���ܣ�ѡ����ܷ�����</li>
                    </td>
                </tr>
              </table>
              <table name='RemoteManagement_item' id='Զ�̹���_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgRemoteManage id=ntwk_cfgRemoteManage>
                    <TD>
                        <div class="advanceTitle">Զ�̹���</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=ntwk_cfgRemoteManage_4 id=ntwk_cfgRemoteManage_4>
                  <td class="advanceContent" name='ntwk_cfgRM04' id='ntwk_cfgRM04'>
                  		<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                      <li class="helpTxt">��������ʡ�����ּ�ͥ����ƽ̨��������URL����IP��ַ��RMS��֤���ص��û��������룬�Լ�������֤RMS���û��������롣</li>
                      <li class="helpTxt">���������������Ƿ����������ϱ����ģ��Լ��ϱ����ĵ����ڡ����⻹���Խ���֤����֤�����û���á�</li>
                      <% end if %>
                      <li class="helpTxt">��֤ע�ᡣ</li>
                    </td>
                </tr>
              </table>
              <table id='QoS_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgQoS id=ntwk_cfgQoS>
                    <TD>
                        <div class="advanceTitle">QoS</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=ntwk_cfgQoS_1 id=ntwk_cfgQoS_1>
                  <td class="advanceContent">
                      <li class="helpTxt">����QoS���ã�Qos���غ�ģ��ѡ�����á�</li>
                      <li class="helpTxt">�������ã������л��ڶ˿ڡ�VLAN��IP���������á�</li>
                    </td>
                </tr>
              </table>
              <table name='TimeManagement_item' id='ʱ�����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgSNTP id=ntwk_cfgSNTP>
                    <TD>
                        <div class="advanceTitle">ʱ�����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">SNTP���ã�Ĭ��Ϊ������SNTP��������SNTP����SNTP����ز����������ã�������ɺ󣬽�������ʾ�µ�SNTP���á�</li>
                        <li class="helpTxt">������������������Ҳ������IP��ַ�������ѡ���б�������SNTP�����������б����ѡ��Other�����ں�������SNTP��������������IP��ַ�� </li>
                        <li class="helpTxt">ʱ�������б��������ѡ�����ڵص�ʱ������</li>
                      </ul>
                    </td>
                </tr>
              </table>
              <table name='wlSetting_item' id='WOLINK����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgSNTP id=ntwk_cfgSNTP>
                    <TD>
                        <div class="advanceTitle">WOLINK����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">WOLINK�򿪺͹ر�</li>
                      </ul>
                    </td>
                </tr>
              </table>
              <!-- <table name='RouteSet_item' id='·������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgRoute id=ntwk_cfgRoute>
                    <TD>
                        <div class="advanceTitle">·������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">��̬·�ɣ�����Ŀ�������ַ���������롢���ص�ַ�ͽӿڡ��������ص�ַ�ͽӿ�����ѡ��һ�</li>
                    </td>
                </tr>
              </table> -->
            </TD>
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
