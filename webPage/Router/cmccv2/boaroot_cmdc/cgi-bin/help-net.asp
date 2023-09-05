<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>使用帮助</TITLE>
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

var cfg_menu_list  = new Array(<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>'宽带设置', '绑定配置', 'LAN侧地址配置', <% end if %>'WLAN网络配置', 'WLAN5G网络配置', '远程管理', 'QoS', '时间管理','WOLINK配置');
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
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
        <span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="帮助->网络" name="Selected_Menu">
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
                <li name="InternetSet" id="宽带设置" class="TSD">宽带设置</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="BandingSet" id="绑定配置">绑定配置</li>
<% end if %>
                <li name="LANAddressSet" id="LAN侧地址配置">LAN侧地址配置</li>
                <% end if %>
                <% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
                <li name="WLANSet" id="WLAN网络配置">WLAN网络配置</li>
                <% end if %>
                <% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
                <li name="WLAN5GCnf" id="WLAN5G网络配置">WLAN5G网络配置</li>
                <% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="RemoteManagement" id="远程管理">远程管理</li>
<% end if %>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li id="QoS">QoS</li>
<% end if %>
                <li name="TimeManagement" id="时间管理">时间管理</li>
                <li name="wlSetting" id="WOLINK配置">WOLINK配置</li>
                <!-- <li name="RouteSet" id="路由配置">路由配置</li> -->
                <% end if %>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='InternetSet_item' id='宽带设置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle">宽带设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">宽带设置：对宽带连接进行相关参数设置,设置完成后,界面上显示相应的状态。</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                        <li class="helpTxt">WAN连接：单击“新建连接”添加一条WAN连接；单击“删除连接”删除本连接。</li>
                        <li class="helpTxt">启用：让该条PVC生效。</li>
                        <li id=ntwk_cfgWan_1 class="helpTxt">启用绑定：可以把各个LAN口、各个SSID和对应的WAN口绑定。</li>
                        <li class="helpTxt">模式：分成Route、Bridge两种模式。Route模式下有三种连接模式DHCP（从ISP处得到一个IP地址）、Static（经ISP配置一个静态的IP给你）、PPPoE。Bridge模式可以将设备配置成介于LAN和ISP之间的网桥设备，它可以使得两个或多个网络的通信就像处在同一LAN物理连接上。</li>
<% end if %>
                        <li class="helpTxt">链接方式：包括通过IP方式建立链接和通过PPP方式建立链接两种。根据实际的网络需要选择建立链接的方式。</li>
                        <li class="helpTxt">IP协议版本：设置链接使用的IP版本，通常使用IPv4版本，也可以通过选择IPv6来支持IPv6。如果选择IPv4/v6方式，则同时使用IPv4和IPv6两种IP版本。</li>
                        <li class="helpTxt">PPPoE：ISP将提供帐号，填入包括如下信息：用户名、密码、服务名称，并配置拨号方式。该模式系统将通过PPPoE动态获得IP。 </li>
                        <li class="helpTxt">DHCP：设备将从ISP通过DHCP自动获得IP。 </li>
                        <li class="helpTxt">Static：由ISP配置一个静态的IP地址。需要输入的信息包括：IP地址，子网掩码，首选DNS服务器及备用DNS服务器等，IP地址必须输入正确的格式，4个IP字节之间由“.”号分开(x.x.x.x)，例如：192.168.0.100。</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                        <li id=ntwk_cfgWan_2 class="helpTxt">支持802.1q、802.1p、NAT、IGMP Proxy。</li>
                        <li id=ntwk_cfgWan_3 class="helpTxt">服务类别：UBR Without PCR、UBR With PCR、CBR、Non-Real Time VBR、Realtime VBR。</li>
<% end if %>
                        <li class="helpTxt">IPv6 WAN信息获取方式：可以通过DHCP或者SLAAC两种方式动态的获取IPv6的地址，也可以静态设置IPv6的地址，根据具体的网络情况进行设置。</li>
                    </td>
                </tr>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") = "Yes" then %>
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">2.4G中继设置/5G中继设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">2.4G中继设置/5G中继设置：对中继上行WLAN连接进行相关参数设置,设置完成后,界面上显示相应的状态。</li>
                        <li class="helpTxt">中继上行WLAN SSID：中继上行SSID名称。</li>
                        <li class="helpTxt">手动设置中继上行WLAN安全参数：选择是否手动设置中继上行WLAN安全参数。</li>
                        <li class="helpTxt">加密方式：中继上行安全设置，支持开放系统、WEP、WPA-PSK、WPA2-PSK等认证方式和对应的加密方式。</li>
                        <li class="helpTxt">WLAN下行与WLAN中继上行使用相同的无线配置：选择是否同步WLAN下行与WLAN中继上行无线配置。</li>
                        <li class="helpTxt">WPS方式添加组网：使用WPS方式添加组网。</li>
                    </td>
                </tr>
                <TR name=ntwk_cfgWan id=ntwk_cfgWan>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">AP设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li>启用AP设置：选择是否启用AP设置。</li>
                    </td>
                </tr>
<% end if %>
              </table>
              <table name='BandingSet_item' id='绑定配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgBind id=ntwk_cfgBind>
                    <TD>
                        <div class="advanceTitle">绑定配置</div>
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
                      <li>绑定配置可以设置用户LAN口和WAN口的绑定方式，支持端口绑定和端口+VLAN绑定两种方式。如果是端口绑定，对应端口的数据从绑定的WAN口出去；如果是端口
                        +VLAN绑定，对应端口且带绑定VLAN的数据才会从绑定的WAN口出去。端口加VLAN绑定以m1/n1 VLAN对方式配置，其中m1代表用户侧的VLAN，n1代表出接口的VLAN，
                        多组VLAN对以分号分开。</li>
                    </ul></td>
                </tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr><td>&nbsp;</td></tr>
              </table>
              <table name='LANAddressSet_item' id='LAN侧地址配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgDHCP id=ntwk_cfgDHCP>
                    <TD>
                        <div class="advanceTitle">LAN侧地址配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=ntwk_cfgDHCP_1 id=ntwk_cfgDHCP_1>
                  <td class="advanceContent">
                      <li class="helpTxt">IPv4配置：默认为“启用DHCP”。使用该操作,对DHCP相关参数进行设置,设置完成后，界面上显示新的DHCP状态。可以配置租约时间（1分钟、1小时、1天、1周），DHCP工作模式（DHCP 
                        Server和DHCP relay）。</li>
                      <li class="helpTxt">IPv6配置：可以配置是否开启对LAN侧的RA服务，让LAN侧设备可以通过RA方式获取IPv6的地址，同时也可以设置让LAN侧通过DHCP方式获取IPv6的地址。</li>
                    </td>
                </tr>
              </table>
              <table name='WLANCnf_item' id='WLAN网络配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWLAN id=ntwk_cfgWLAN>
                    <TD>
                        <div class="advanceTitle">WLAN参数配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN_1 class="helpTxt">使能无线：开启或关闭WLAN</li>
                      <li id=ntwk_cfgWLAN_2 class="helpTxt">模式选择：可选择802.11b、802.11g、802.11n、802.11b/g混合以及802.11b/g/n混合模式</li>
                      <li id=ntwk_cfgWLAN_3 class="helpTxt">信道选择：根据网络设置从列表中选择恰当的信道。为避免信号干扰，应对每个AP分配不同的信道，建议使用自动信道选择模式。</li>
                      <li id=ntwk_cfgWLAN_4 class="helpTxt">发送功率强度：设定无线射频模块使用的发射功率。 </li>
                      <li id=ntwk_cfgWLAN_5 class="helpTxt">SSID索引：设定当前所配置的SSID的序号。</li>
                      <li id=ntwk_cfgWLAN_6 class="helpTxt">SSID：设置SSID名称。可以输入任意字符，长度不能超过32个字符，区分大小写。</li>
                      <li id=ntwk_cfgWLAN_7 class="helpTxt">速率：选择无线连接工作速率，其中的自动速率根据信道环境，自动选择合适的最大速率。</li>
                      <li id=ntwk_cfgWLAN_8 class="helpTxt">频带宽度：选择无线网络在802.11n模式下的频道带宽。</li>
                      <li id=ntwk_cfgWLAN_9 class="helpTxt">保护间隔：选择无线网络在802.11n模式下的保护时间间隔。</li>
                      <li id=ntwk_cfgWLAN_10 class="helpTxt">SSID使能：选择是否使能当前的SSID。</li>
                      <li id=ntwk_cfgWLAN_11 class="helpTxt">广播取消：是否使能对应SSID的广播取消功能，如果使能，则网关不会对外广播SSID。</li>
                      <li id=ntwk_cfgWLAN_12 class="helpTxt">安全设置：可对SSID设置安全参数，网关支持开放系统、WEP、WPA-PSK、WPA2-PSK、WPA-PSK/WPA2-PSK等认证方式和对应的加密方式。</li>
                      <li id=ntwk_cfgWLAN_13 class="helpTxt">WPA 预认证共享密钥：设置共享密钥。</li>
                      <li id=ntwk_cfgWLAN_14 class="helpTxt">WPA 加密：选择加密方法。</li>
                    </td>
                </tr>
                <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
                <TR name=ntwk_cfgWLAN2 id=ntwk_cfgWLAN2>
                    <TD>
                        <div class="advanceTitle" style="margin-top: 32px;">WLAN共享配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN2_1 class="helpTxt">WLAN共享功能绑定信息配置。</li>
                    </td>
                </tr>
                <% end if %>
              </table>
              <table name='WLAN5GCnf_item' id='WLAN5G网络配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgWLAN5G id=ntwk_cfgWLAN5G>
                    <TD>
                        <div class="advanceTitle">WLAN参数配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li id=ntwk_cfgWLAN5G_1 class="helpTxt">使能无线：开启或关闭WLAN</li>
                      <li id=ntwk_cfgWLAN5G_2 class="helpTxt">模式选择：可选择802.11a、802.11n/a混合以及802.11ac/n/a混合模式</li>
                      <li id=ntwk_cfgWLAN5G_3 class="helpTxt">信道选择：根据网络设置从列表中选择恰当的信道。为避免信号干扰,应对每个AP分配不同的信道，建议使用自动信道选择模式。</li>
                      <li id=ntwk_cfgWLAN5G_4 class="helpTxt">发送功率强度：设定无线射频模块使用的发射功率。 </li>
                      <li id=ntwk_cfgWLAN5G_5 class="helpTxt">SSID索引： 设定当前所配置的SSID的序号。</li>
                      <li id=ntwk_cfgWLAN5G_6 class="helpTxt">SSID： 设置SSID名称。可以输入任意字符,长度不能超过32个字符,区分大小写。</li>
                      <li id=ntwk_cfgWLAN5G_7 class="helpTxt">速率： 选择无线连接工作速率，其中的自动速率根据信道环境，自动选择合适的最大速率。</li>
                      <li id=ntwk_cfgWLAN5G_8 class="helpTxt">频带宽度：选择无线网络在802.11n模式下的频道带宽。</li>
                      <li id=ntwk_cfgWLAN5G_9 class="helpTxt">保护间隔：选择无线网络在802.11n模式下的保护时间间隔。</li>
                      <li id=ntwk_cfgWLAN5G_10 class="helpTxt">SSID使能：选择是否使能当前的SSID。</li>
                      <li id=ntwk_cfgWLAN5G_11 class="helpTxt">广播取消：是否使能对应SSID的广播取消功能，如果使能，则网关不会对外广播SSID。</li>
                      <li id=ntwk_cfgWLAN5G_12 class="helpTxt">安全设置：可对SSID设置安全参数，网关支持开放系统、WEP、WPA-PSK、WPA2-PSK、WPA-PSK/WPA2-PSK等认证方式和对应的加密方式。</li>
                      <li id=ntwk_cfgWLAN5G_13 class="helpTxt">WPA 预认证共享密钥：设置共享密钥。</li>
                      <li id=ntwk_cfgWLAN5G_14 class="helpTxt">WPA 加密：选择加密方法。</li>
                    </td>
                </tr>
              </table>
              <table name='RemoteManagement_item' id='远程管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgRemoteManage id=ntwk_cfgRemoteManage>
                    <TD>
                        <div class="advanceTitle">远程管理</div>
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
                      <li class="helpTxt">用于设置省级数字家庭管理平台服务器的URL或者IP地址，RMS认证网关的用户名和密码，以及网关认证RMS的用户名和密码。</li>
                      <li class="helpTxt">还可以配置网关是否发送周期性上报报文，以及上报报文的周期。另外还可以进行证书认证的启用或禁用。</li>
                      <% end if %>
                      <li class="helpTxt">认证注册。</li>
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
                      <li class="helpTxt">上行QoS配置：Qos开关和模板选择配置。</li>
                      <li class="helpTxt">限速配置：上下行基于端口、VLAN和IP段限速配置。</li>
                    </td>
                </tr>
              </table>
              <table name='TimeManagement_item' id='时间管理_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgSNTP id=ntwk_cfgSNTP>
                    <TD>
                        <div class="advanceTitle">时间管理</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">SNTP设置：默认为“启用SNTP”。启用SNTP，对SNTP的相关参数进行设置，设置完成后，界面上显示新的SNTP配置。</li>
                        <li class="helpTxt">服务器即可设置域名也可设置IP地址，如果想选择列表框以外的SNTP服务器，在列表框中选择“Other”，在后面输入SNTP服务器的域名或IP地址。 </li>
                        <li class="helpTxt">时间区域列表框允许你选择所在地的时间区域。</li>
                      </ul>
                    </td>
                </tr>
              </table>
              <table name='wlSetting_item' id='WOLINK配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgSNTP id=ntwk_cfgSNTP>
                    <TD>
                        <div class="advanceTitle">WOLINK配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                        <li class="helpTxt">WOLINK打开和关闭</li>
                      </ul>
                    </td>
                </tr>
              </table>
              <!-- <table name='RouteSet_item' id='路由配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=ntwk_cfgRoute id=ntwk_cfgRoute>
                    <TD>
                        <div class="advanceTitle">路由配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr>
                  <td class="advanceContent">
                      <li class="helpTxt">静态路由：设置目的网络地址、子网掩码、网关地址和接口。其中网关地址和接口至少选择一项。</li>
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
