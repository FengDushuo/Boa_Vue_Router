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

<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
var cfg_menu_list  = new Array('DDNS����', '�߼�NAT����', 'UPnP����', '����绰����', 'IGMP����');
<% else %>
var cfg_menu_list  = new Array('�߼�NAT����', 'IPTV����','IGMP����','MESH���ð���');
<% end if %>
var cfg_cookie_name = 'help-app-menu';
init_l_menu();
</script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FormLoad()" onunload=DoUnload() marginheight="0" marginwidth="0">
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
		<input id="Selected_Menu" type="hidden" value="����->Ӧ��" name="Selected_Menu">
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
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="DDNSCnf" id="DDNS����" class="TSD">DDNS����</li>
<% end if %>
                <li name="AdvancedNATCnf" id="�߼�NAT����">�߼�NAT����</li>
                <li name="IGMPSet" id="IPTV����">IPTV����</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="UPnPCnf" id="UPnP����">UPnP����</li>
                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                <li name="VOIPSet" id="����绰����">����绰����</li>
                <% end if %>
<% end if %>
                <li name="IGMPSet" id="IGMP����">IGMP����</li>
                <li name="Selected_MESH" id="MESH���ð���">MESH�������ð���</li>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='DDNSCnf_item' id='DDNS����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appDDNS id=appDDNS>
                    <TD>
                        <div class="advanceTitle">DDNS����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appDDNS_4 id=appDDNS_4>
                  <td class="advanceContent">
                      <li class="helpTxt">���ÿ��أ�ʹ�øò�����������ر�DDNS���ܣ�������ɺ󣬽�������ʾ�µ�DDNS״̬.</li>
                      <li class="helpTxt">DDNS���ã�ʹ�øò�������DDNS��ز����������ã�������ɺ󣬽�������ʾ�µ�DDNS״̬.</li>
                    </td>
                </tr>
              </table>
              <table name='AdvancedNATSet_item' id='�߼�NAT����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appAdnat id=appAdnat>
                    <TD>
                        <div class="advanceTitle">�߼�NAT����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appAdnat_4 id=appAdnat_4>
                  <td class="advanceContent">
                      <li class="helpTxt">ALG���ÿ��أ�ʹ�øò�����������رո���ALG���ܣ�������ɺ󣬽�������ʾ�µĸ���ALG״̬��</li>
                      <li class="helpTxt">DMZ���ã�ʹ�øò�������DMZ��ز����������ã�������ɺ󣬽�������ʾ�µ�DMZ״̬��</li>
                    </td>
                </tr>
              </table>
              <table name='IGMPSet_item' id='IPTV����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appAdnat id=appAdnat>
                    <TD>
                        <div class="advanceTitle">IPTV����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appAdnat_4 id=appAdnat_4>
                  <td class="advanceContent">
                      <li class="helpTxt">IPTV�򿪺͹ر�</li>
                      
                    </td>
                </tr>
              </table>
              <table name='UPnPSet_item' id='UPnP����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appUPNP id=appUPNP>
                    <TD>
                        <div class="advanceTitle">UPnP����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appUPNP_4 id=appUPNP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">ͨ����ѡ������UPnP��ʹ��״̬��ѡ�и�ѡ����ʹUPnPҵ����Ч������UPnPҵ�񽫽��á�</li>
                    </td>
                </tr>
              </table>
              <table name='VOIPSet_item' id='����绰����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appVoip id=appVoip>
                    <TD>
                        <div class="advanceTitle">����绰����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appVoip_4 id=appVoip_4>
                  <td class="advanceContent">
                      <li class="helpTxt">�޸�SIP�����������Ӧ�á���ť����������á� </li>
                      <li class="helpTxt">Outbound��������ַ��ISP�ṩ���ⷢ����������ĵ�ַ�����Ϊ�ջ���Ϊ0.0.0.0���ⷢ����������������á�</li>
                      <li class="helpTxt">Outbound�������˿ںţ�SIP�ⷢ�����������UDP�˿ڣ��������Ϊ�ջ���0����ʹ��Ĭ��ֵ5060��</li>
                      <li class="helpTxt">����Outbound��������ַ��ISP�ṩ�ı����ⷢ����������ĵ�ַ�����Ϊ�ջ���Ϊ0.0.0.0�������ⷢ����������������á�</li>
                      <li class="helpTxt">����Outbound�������˿ںţ�SIP�����ⷢ�����������UDP�˿ڣ��������Ϊ�ջ���0����ʹ��Ĭ��ֵ5060��</li>
                      <li class="helpTxt">���÷�������ַ��ISP�ṩ��SIP����������ĵ�ַ�����Ϊ�ջ���Ϊ0.0.0.0��SIP����������������á�</li>
                      <li class="helpTxt">���ö˿ںţ�SIP�����������UDP�˿ڣ��������Ϊ�ջ���0����ʹ��Ĭ��ֵ5060��</li>
                      <li class="helpTxt">���÷�������ַ��ISP�ṩ��SIP���ô���������ĵ�ַ�����Ϊ�ջ���Ϊ0.0.0.0��SIP���ô���������������á�</li>
                      <li class="helpTxt">���ö˿ںţ�SIP���ô����������UDP�˿ڣ��������Ϊ�ջ���0����ʹ��Ĭ��ֵ5060��</li>
                      <li class="helpTxt">���ض˿ڣ�����SIP��UDP�˿ںţ�Ĭ��Ϊ5060��</li>
                      <li class="helpTxt">��ͼ��ָʾ����ҵ��Ĳ��ŷ�����</li>
                      <li class="helpTxt">��ͼƥ��ģʽ���������ƥ�����Сƥ�䡣</li>
                      <li class="helpTxt">���Ҽ�������ָʾ��ǰ����ҵ��Ĺ��Һ͵�����</li>
                      <li class="helpTxt">����˿ڣ�ָʾ�ں�������ѡ�������˿ڡ�</li>
                      <li class="helpTxt">ý��˿ڣ�ָʾ�ں���ý��ѡ�������˿ڡ�</li>
                    </td>
                </tr>
              </table>
              <table name='IGMPSet_item' id='IGMP����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appIGMP id=appIGMP>
                    <TD>
                        <div class="advanceTitle">�û�����Ϣ</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appIGMP_4 id=appIGMP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">IGMP/MLD Snooping���ã�ʹ�øò��������û���ͣ��IGMP/MLD Snooping���ܣ�������ɺ󣬽�������ʾIGMP/MLD Snooping����״̬��</li>
                      <li class="helpTxt">IGMP/MLD Proxyʹ�����ã�ʹ�øò��������û���ͣ��IGMP/MLD Proxy���ܣ�������ɺ󣬽�������ʾIGMP/MLD Proxyʹ��״̬��</li>
                      <li class="helpTxt">IGMP/MLD Proxy���ã�ʹ�øò��������û���ͣ��ÿ��WAN����IGMP/MLD Proxy���ܣ�������ɺ󣬽�������ʾÿ��WAN���ӵ�IGMP/MLD Proxy����״̬��</li>
                    </td>
                </tr>
              </table>
              <table name='Selected_MESH_item' id='MESH���ð���_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appIGMP id=appIGMP>
                    <TD>
                        <div class="advanceTitle">MESH����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appIGMP_4 id=appIGMP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">��1����������</li>
                      <li class="helpTxt">Mesh���ã��������ر�Mesh���ܣ��Լ�Mesh��ɫ����</li>
                      <li class="helpTxt">��2��MESH��������ͼ</li>
                      <li class="helpTxt">��ʾ�豸��ǰMesh����</li>
                    </td>
                </tr>
              </table>
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
