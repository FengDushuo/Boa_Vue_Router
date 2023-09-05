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

var cfg_menu_list  = new Array('设备信息', '网络侧信息', '用户侧信息', '远程管理状态', '宽带语音信息', '远程管理状态');
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
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
        <span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="帮助->状态" name="Selected_Menu">
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
	                <li name="DeviceInfo" id="设备信息" class="TSD">设备信息</li>
	                <li name="InternetInfo" id="网络侧信息">网络侧信息</li>
	                <li name="UserInfo" id="用户侧信息">用户侧信息</li>
	                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
	                <li name="VOIPInfo" id="宽带语音信息">宽带语音信息</li>
	                <% end if %>
	                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
	                <li name="RemoteManagementSta" id="远程管理状态">远程管理状态</li>
	                <% end if %>
              	</ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table id='设备信息_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                        <TR name=statusEquip id=statusEquip>
                            <TD>
                                <div class="advanceTitle">设备信息</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
                <tr>
                  <td class="advanceContent">
                    <li class="helpTxt">显示设备型号，设备标识号，硬件版本，软件版本等信息。</li>
                </td>
                </tr>
              </table>
              <table id='网络侧信息_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusNetwork id=statusNetwork>
                    <TD>
                        <div class="advanceTitle">网络侧信息</div>
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
                      <li id=statusNetwork_1 class="helpTxt">连接信息显示网络侧连接状态，各条PVC的IP地址、子网掩码，默认网关，DNS服务器信息。</li>
                      <li id=statusNetwork_2 class="helpTxt">PON信息显示PON的链路连接状态，链路性能统计，光模块信息。 </li>
<% else %>
                      <li id=statusNetwork_1 class="helpTxt">显示软件工作模式；局域网络信息显示IP地址，子网掩码，MAC地址；广域网络信息显示各条PVC的IP地址、子网掩码，默认网关，DNS服务器信息。</li>
<% end if %>
                    </td>
                </tr>
              </table>
              <table id='用户侧信息_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusUser id=statusUser>
                    <TD>
                        <div class="advanceTitle">用户侧信息</div>
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
                        <li id=statusUser_1 class="helpTxt">WLAN接口信息显示无线网络连接状态，信道，各个SSID的统计信息、SSID、认证方式和加密状态等；LAN接口信息显示网关IP地址，MAC地址，每个LAN口的状态、收发包和字节数。</li>
                        <% else %>
                        <li id=statusUser_1 class="helpTxt">LAN接口信息显示网关IP地址，MAC地址，每个LAN口的状态、收发包和字节数。</li>
                        <% end if %>
<% else %>
                        <li id=statusUser_1 class="helpTxt">WAN接口信息显示WAN接入类型，WAN接口连接状态，WAN接口数据统计信息。</li>
                        <li id=statusUser_2 class="helpTxt">LAN接口信息显示局域网设置的信息，IP地址，子网掩码，IP地址池，连接状态，发送和接收数据信息，客户端信息。</li>
                        <li id=statusUser_3 class="helpTxt">WLAN接口信息显示WLAN开关状态，频率带宽，工作信道信息，WLAN接口信息，包括接口数据统计信息，加密与认证方式，接口连接的客户端信息。</li>
<% end if %>
                    </td>
                </tr>
              </table>
              <table id='宽带语音信息_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                <TR name=statusVoip id=statusVoip>
                    <TD>
                        <div class="advanceTitle">宽带语音信息</div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=statusVoip_1 class="helpTxt">宽带语音信息包括业务注册状态和电话号码；业务状态包括已注册和未注册等状态；电话号码显示注册的电话号码。</li>
                    </td>
                </tr>
                <% end if %>
              </table>
              <table id='远程管理状态_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=statusACS id=statusACS>
                    <TD>
                        <div class="advanceTitle">远程管理状态</div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                      <li id=statusACS_1 class="helpTxt">显示交互建立情况、业务配置下发状态，交互建立包括主动上报Inform情况以及接受RMS连接请求情况。</li>
<% else %>
                      <li id=statusACS_1 class="helpTxt">显示WOLINK远程管理状态。</li>
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
