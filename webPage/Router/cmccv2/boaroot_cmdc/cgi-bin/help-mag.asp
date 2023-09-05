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
var cfg_menu_list  = new Array('用户管理', '升级管理','设备管理', '日志文件管理','终端管理');
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
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
        <span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="帮助->管理" name="Selected_Menu">
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
                <li name="UserManagement" id="用户管理" class="TSD">用户管理</li>
                <li name="UpgradeManagement" id="升级管理">升级管理</li>
                <li name="DeviceManagement" id="设备管理">设备管理</li>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <li name="LogFileManagemet" id="日志文件管理">日志文件管理</li>
                <% end if %>
                <li name="TerminalManagemet" id="终端管理">终端管理</li>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='UserManagement_item' id='用户管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageUser id=manageUser>
                    <TD>
                        <div class="advanceTitle">用户管理</div>
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
                      <li class="helpTxt">密码设置：使用维护帐号登录后，可以修改用户管理帐号的密码，而不需要校验原密码。</li>
                    </td>
                </tr>
                <% end if %>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">用户管理帐号和密码设置：使用用户管理帐号登录后,可修改用户管理帐号的密码，需要校验原密码。 </li>
                    </td>
                  </tr>
                </table>
                <table name='UpgradeManagement_item' id='升级管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                  <TR name=manageEquip id=manageEquip>
                      <TD>
                          <div class="advanceTitle">升级管理</div>
                      </TD>
                  </TR>
                  <TR>
                      <TD>
                          <div class="title-line"></div>
                      </TD>
                  </TR>
                  <tr>
                    <td class="advanceContent">
                        <li class="helpTxt">网关系统软件升级，系统软件更新需要约两分钟时间，请勿在更新中关机，系统软件更新后系统将自动重新启动。</li>
                    </td>
                </tr>
              </table>
              <table name='DeviceManagement_item' id='设备管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageEquip id=manageEquip>
                    <TD>
                        <div class="advanceTitle">设备管理</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">设备重启：使用该操作，重新启动网关。</li>
                      <li class="helpTxt">恢复配置：恢复默认配置和恢复出厂配置功能。</li>
                   </td>
                </tr>
              </table>
              <table name='LogFileManagement_item' id='日志文件管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageSyslog id=manageSyslog>
                    <TD>
                        <div class="advanceTitle">日志文件管理</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=manageSyslog_1 id=manageSyslog_1>
                  <td class="advanceContent">
                      <li class="helpTxt">日志写入等级设置：可以启用或者禁用写入日志文件。在启用写入日志文件的情况下，可以设置写入和显示日志文件的等级。</li>
                      <li class="helpTxt">日志：显示当前等级下的日志内容。</li>
                      <li class="helpTxt">维护上报结束：当维护人员在维护中使用了维护账号时，通过该界面操作通知ITMS更新维护账号的密码。</li>
                      </td>
                </tr>
              </table>
              <table name='TerminalManagemet_item' id='终端管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=manageSyslog id=manageSyslog>
                    <TD>
                        <div class="advanceTitle">终端管理</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=manageSyslog_1 id=manageSyslog_1>
                  <td class="advanceContent">
                      <li class="helpTxt">可以看见在线设备，在线时长以及是否允许上网</li>
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
