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

var cfg_menu_list  = new Array('��������������', '����ǽ', 'MAC����', '�˿ڹ���', 'Э�����');
var cfg_cookie_name = 'help-sec-menu';
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
		<input id="Selected_Menu" type="hidden" value="����->��ȫ" name="Selected_Menu">
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
                <li name="WANAccessSet" id="��������������" class="TSD">��������������</li>
                <li name="FireWall" id="����ǽ">����ǽ</li>
                <li name="MACFilter" id="MAC����">MAC����</li>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <li name="Portfilter" id="�˿ڹ���">�˿ڹ���</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="PortocolFilter" id="Э�����">Э�����</li>
<% end if %>
                <% end if %>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='WANAccessSet_item' id='��������������_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityURL id=securityURL>
                    <TD>
                        <div class="advanceTitle">��������������</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">���ù��������ˣ�������رչ��������ʹ��ܣ�Ĭ��Ϊ���رա���������ɺ󣬽�������ʾ�µĹ���������״̬�� </li>
                        <li class="helpTxt">����ģʽ�������������򡰰�������������������ģʽ���޸Ĺ��˵�ǰ�Ĺ���ģʽ��</li>
                        <li class="helpTxt">URL��������ȷ��URL�����һ��URL�������б��С�</li>
                      <li class="helpTxt">�����б���ʾ�Ѿ����˵�URL�б�</li>
                      <li class="helpTxt">��ǰ�Ĺ����б�Ϊ������ʱ�������б��е�URL���󽫱����ˣ���ǰ�����б�Ϊ������ʱ��ֻ�й����б��е�URL���󱻽��ܡ�</li>
                    </td>
                </tr>
              </table>
              <table name='Firewall_item' id='����ǽ_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityFirewall id=securityFirewall>
                    <TD>
                        <div class="advanceTitle">����ǽ</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">��ȫ�������ã�ʹ�øò��������Խ�����ǽ�ȼ�����Ϊ���ߡ������С��򡰵͡���������ɺ󣬽�������ʾ�µķ���ǽ״̬��</li>
                    </td>
                </tr>
              </table>
              <table name='MACFilter_item' id='MAC����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityMAC id=securityMAC>
                    <TD>
                        <div class="advanceTitle">MAC����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">���ù�����MAC���ˣ�������رչ��������ʹ��ܣ�Ĭ��Ϊ���رա���������ɺ󣬽�������ʾ�µĹ���������״̬��</li>
                        <li class="helpTxt">����ģʽ�������������򡰰����������˲����޸ĵ�ǰ�Ĺ���ģʽ��</li>
                        <li class="helpTxt">MAC��ַ��������ȷ��MAC��ַ�����һ��MAC��ַ�������б��С�</li>
                      <li class="helpTxt">�����б���ʾ�Ѿ����˵�MAC��ַ�б�</li>
                      <li class="helpTxt">��ǰ�Ĺ����б�Ϊ������ʱ�����й����б��е�MAC��ַ��PC���޷�����Internet���磻��ǰ����ģʽΪ������ʱ�����й����б��е�MAC��ַ��PC�ſ��Է���Internet���磻�����Ǻ��������ǰ�������LAN���PC�����Է������ء�</li>
                    </td>
                </tr>
              </table>
              <table name='PortFilter_item' id='�˿ڹ���_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityPort id=securityPort>
                    <TD>
                        <div class="advanceTitle">�˿ڹ���</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">���ù������˿ڹ��ˣ�������رչ��������ʹ��ܣ�Ĭ��Ϊ���رա���������ɺ󣬽�������ʾ�µĹ���������״̬��</li>
                        <li class="helpTxt">����ģʽ�������������򡰰����������˲����޸ĵ�ǰ�Ĺ���ģʽ��</li>
                        <li class="helpTxt">����ӡ������һ�����˹��򵽹�����������ɾ������ɾ��һ�������ѡ�еĹ��˹���</li>
                      <li class="helpTxt">�����б���ʾ��ǰ�Ĺ�������б�</li>
                      <li class="helpTxt">��ǰ�Ĺ���ģʽΪ������ʱ�����Ϲ����б�����һ����������ݰ����޷�ͨ�����أ���ǰ����ģʽΪ������ʱ�����Ϲ����б��й�������ݰ��ſ���ͨ�����أ������Ǻ��������ǰ�����,LAN���PC�����Է������ء�</li>
                      <li class="helpTxt">���˹�������á��������ơ����ɽ���Э�顱����ԴIP��ʼ��ַ������ԴIP������ַ������Դ�˿ڡ�����Ŀ��IP��ʼ��ַ������Ŀ��IP������ַ������Ŀ�Ķ˿ڡ���Ϊ���������������á� </li>
                    </td>
                </tr>
              </table>
              <table name='ProtocolFilter_item' id='Э�����_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR>
                    <TD>
                        <div class="advanceTitle">Э�����</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                  	<ul>
                      <li class="helpTxt">������Ҫ���˵�Э�����ͣ�ƥ���Э�����ͱ��Ľ�������</li>
                    </ul>
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
