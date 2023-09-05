<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>使用帮助</TITLE>
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

var cfg_menu_list  = new Array('广域网访问设置', '防火墙', 'MAC过滤', '端口过滤', '协议过滤');
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
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
        <span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="帮助->安全" name="Selected_Menu">
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
                <li name="WANAccessSet" id="广域网访问设置" class="TSD">广域网访问设置</li>
                <li name="FireWall" id="防火墙">防火墙</li>
                <li name="MACFilter" id="MAC过滤">MAC过滤</li>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <li name="Portfilter" id="端口过滤">端口过滤</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="PortocolFilter" id="协议过滤">协议过滤</li>
<% end if %>
                <% end if %>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='WANAccessSet_item' id='广域网访问设置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityURL id=securityURL>
                    <TD>
                        <div class="advanceTitle">广域网访问设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">启用广域网过滤：启动或关闭广域网访问功能，默认为“关闭”。设置完成后，界面上显示新的广域网访问状态。 </li>
                        <li class="helpTxt">过滤模式：“黑名单”或“白名单”；单击“更改模式”修改过滤当前的过滤模式。</li>
                        <li class="helpTxt">URL：输入正确的URL。添加一条URL到过滤列表中。</li>
                      <li class="helpTxt">过滤列表：显示已经过滤的URL列表。</li>
                      <li class="helpTxt">当前的过滤列表为黑名单时，过滤列表中的URL请求将被过滤；当前过滤列表为白名单时，只有过滤列表中的URL请求被接受。</li>
                    </td>
                </tr>
              </table>
              <table name='Firewall_item' id='防火墙_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityFirewall id=securityFirewall>
                    <TD>
                        <div class="advanceTitle">防火墙</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">安全级别设置：使用该操作，可以将防火墙等级设置为“高”、“中”或“低”。设置完成后，界面上显示新的防火墙状态。</li>
                    </td>
                </tr>
              </table>
              <table name='MACFilter_item' id='MAC过滤_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityMAC id=securityMAC>
                    <TD>
                        <div class="advanceTitle">MAC过滤</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">启用广域网MAC过滤：启动或关闭广域网访问功能，默认为“关闭”。设置完成后，界面上显示新的广域网访问状态。</li>
                        <li class="helpTxt">过滤模式：“黑名单”或“白名单”；此操作修改当前的过滤模式。</li>
                        <li class="helpTxt">MAC地址：输入正确的MAC地址，添加一条MAC地址到过滤列表中。</li>
                      <li class="helpTxt">过滤列表：显示已经过滤的MAC地址列表。</li>
                      <li class="helpTxt">当前的过滤列表为黑名单时，具有过滤列表中的MAC地址的PC将无法访问Internet网络；当前过滤模式为白名单时，具有过滤列表中的MAC地址的PC才可以访问Internet网络；不管是黑名单还是白名单，LAN侧的PC都可以访问网关。</li>
                    </td>
                </tr>
              </table>
              <table name='PortFilter_item' id='端口过滤_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=securityPort id=securityPort>
                    <TD>
                        <div class="advanceTitle">端口过滤</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">启用广域网端口过滤：启动或关闭广域网访问功能，默认为“关闭”。设置完成后，界面上显示新的广域网访问状态。</li>
                        <li class="helpTxt">过滤模式：“黑名单”或“白名单”；此操作修改当前的过滤模式。</li>
                        <li class="helpTxt">“添加”：添加一条过滤规则到过滤名单；“删除”：删除一条或多条选中的过滤规则。</li>
                      <li class="helpTxt">过滤列表：显示当前的规则过滤列表。</li>
                      <li class="helpTxt">当前的过滤模式为黑名单时，符合过滤列表任意一条规则的数据包将无法通过网关；当前过滤模式为白名单时，符合过滤列表中规则的数据包才可以通过网关；不管是黑名单还是白名单,LAN侧的PC都可以访问网关。</li>
                      <li class="helpTxt">过滤规则可设置“过滤名称”，可将“协议”、“源IP起始地址”、“源IP结束地址”、“源端口”、“目的IP起始地址”、“目的IP结束地址”、“目的端口”作为过滤条件进行设置。 </li>
                    </td>
                </tr>
              </table>
              <table name='ProtocolFilter_item' id='协议过滤_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR>
                    <TD>
                        <div class="advanceTitle">协议过滤</div>
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
                      <li class="helpTxt">设置需要过滤的协议类型，匹配的协议类型报文将丢弃。</li>
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
