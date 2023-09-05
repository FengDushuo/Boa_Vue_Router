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

<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
var cfg_menu_list  = new Array('DDNS配置', '高级NAT配置', 'UPnP配置', '宽带电话设置', 'IGMP设置');
<% else %>
var cfg_menu_list  = new Array('高级NAT配置', 'IPTV设置','IGMP设置','MESH配置帮助');
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
			智能家庭路由器
		</span>
	</div>
	<div class="in_welcom" >
        <span>您好！</span>
        <a onclick="top.location.href='/'">
            <span>返回主页</span>
        </a>
		<input id="Selected_Menu" type="hidden" value="帮助->应用" name="Selected_Menu">
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
                <li name="DDNSCnf" id="DDNS配置" class="TSD">DDNS配置</li>
<% end if %>
                <li name="AdvancedNATCnf" id="高级NAT配置">高级NAT配置</li>
                <li name="IGMPSet" id="IPTV设置">IPTV设置</li>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
                <li name="UPnPCnf" id="UPnP配置">UPnP配置</li>
                <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
                <li name="VOIPSet" id="宽带电话设置">宽带电话设置</li>
                <% end if %>
<% end if %>
                <li name="IGMPSet" id="IGMP设置">IGMP设置</li>
                <li name="Selected_MESH" id="MESH配置帮助">MESH基础配置帮助</li>
              </ul>
            </TD>
            <SCRIPT language=javascript>
            MakeMenu(getElById ('Selected_Menu').value);
            </SCRIPT>
            <TD valign="top">
              <table name='DDNSCnf_item' id='DDNS配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appDDNS id=appDDNS>
                    <TD>
                        <div class="advanceTitle">DDNS配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appDDNS_4 id=appDDNS_4>
                  <td class="advanceContent">
                      <li class="helpTxt">启用开关：使用该操作，启动或关闭DDNS功能，设置完成后，界面上显示新的DDNS状态.</li>
                      <li class="helpTxt">DDNS设置：使用该操作，对DDNS相关参数进行设置，设置完成后，界面上显示新的DDNS状态.</li>
                    </td>
                </tr>
              </table>
              <table name='AdvancedNATSet_item' id='高级NAT配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appAdnat id=appAdnat>
                    <TD>
                        <div class="advanceTitle">高级NAT配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appAdnat_4 id=appAdnat_4>
                  <td class="advanceContent">
                      <li class="helpTxt">ALG启用开关：使用该操作，启动或关闭各个ALG功能，设置完成后，界面上显示新的各个ALG状态。</li>
                      <li class="helpTxt">DMZ设置：使用该操作，对DMZ相关参数进行设置，设置完成后，界面上显示新的DMZ状态。</li>
                    </td>
                </tr>
              </table>
              <table name='IGMPSet_item' id='IPTV设置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appAdnat id=appAdnat>
                    <TD>
                        <div class="advanceTitle">IPTV设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appAdnat_4 id=appAdnat_4>
                  <td class="advanceContent">
                      <li class="helpTxt">IPTV打开和关闭</li>
                      
                    </td>
                </tr>
              </table>
              <table name='UPnPSet_item' id='UPnP配置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appUPNP id=appUPNP>
                    <TD>
                        <div class="advanceTitle">UPnP配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appUPNP_4 id=appUPNP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">通过复选框配置UPnP的使能状态。选中复选框即能使UPnP业务生效，否则UPnP业务将禁用。</li>
                    </td>
                </tr>
              </table>
              <table name='VOIPSet_item' id='宽带电话设置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appVoip id=appVoip>
                    <TD>
                        <div class="advanceTitle">宽带电话设置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appVoip_4 id=appVoip_4>
                  <td class="advanceContent">
                      <li class="helpTxt">修改SIP参数：点击“应用”按钮保存参数设置。 </li>
                      <li class="helpTxt">Outbound服务器地址：ISP提供的外发代理服务器的地址，如果为空或者为0.0.0.0，外发代理服务器将不启用。</li>
                      <li class="helpTxt">Outbound服务器端口号：SIP外发代理服务器的UDP端口，如果设置为空或者0，将使用默认值5060。</li>
                      <li class="helpTxt">备用Outbound服务器地址：ISP提供的备用外发代理服务器的地址，如果为空或者为0.0.0.0，备用外发代理服务器将不启用。</li>
                      <li class="helpTxt">备用Outbound服务器端口号：SIP备用外发代理服务器的UDP端口，如果设置为空或者0，将使用默认值5060。</li>
                      <li class="helpTxt">主用服务器地址：ISP提供的SIP代理服务器的地址，如果为空或者为0.0.0.0，SIP代理服务器将不启用。</li>
                      <li class="helpTxt">主用端口号：SIP代理服务器的UDP端口，如果设置为空或者0，将使用默认值5060。</li>
                      <li class="helpTxt">备用服务器地址：ISP提供的SIP备用代理服务器的地址，如果为空或者为0.0.0.0，SIP备用代理服务器将不启用。</li>
                      <li class="helpTxt">备用端口号：SIP备用代理服务器的UDP端口，如果设置为空或者0，将使用默认值5060。</li>
                      <li class="helpTxt">本地端口：本地SIP的UDP端口号，默认为5060。</li>
                      <li class="helpTxt">数图：指示语音业务的拨号方案。</li>
                      <li class="helpTxt">数图匹配模式：包含最大匹配和最小匹配。</li>
                      <li class="helpTxt">国家及地区：指示当前语音业务的国家和地区。</li>
                      <li class="helpTxt">信令端口：指示在呼叫信令选择的网络端口。</li>
                      <li class="helpTxt">媒体端口：指示在呼叫媒体选择的网络端口。</li>
                    </td>
                </tr>
              </table>
              <table name='IGMPSet_item' id='IGMP设置_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appIGMP id=appIGMP>
                    <TD>
                        <div class="advanceTitle">用户侧信息</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appIGMP_4 id=appIGMP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">IGMP/MLD Snooping设置：使用该操作，启用或者停用IGMP/MLD Snooping功能，设置完成后，界面上显示IGMP/MLD Snooping设置状态。</li>
                      <li class="helpTxt">IGMP/MLD Proxy使能设置：使用该操作，启用或者停用IGMP/MLD Proxy功能，设置完成后，界面上显示IGMP/MLD Proxy使能状态。</li>
                      <li class="helpTxt">IGMP/MLD Proxy设置：使用该操作，启用或者停用每条WAN连接IGMP/MLD Proxy功能，设置完成后，界面上显示每条WAN连接的IGMP/MLD Proxy设置状态。</li>
                    </td>
                </tr>
              </table>
              <table name='Selected_MESH_item' id='MESH配置帮助_item' class='hide hlp-table' style="width: 714px;margin: 30px auto;">
                <TR name=appIGMP id=appIGMP>
                    <TD>
                        <div class="advanceTitle">MESH组网</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <tr name=appIGMP_4 id=appIGMP_4>
                  <td class="advanceContent">
                      <li class="helpTxt">（1）基础设置</li>
                      <li class="helpTxt">Mesh配置，开启，关闭Mesh功能，以及Mesh角色配置</li>
                      <li class="helpTxt">（2）MESH组网拓扑图</li>
                      <li class="helpTxt">显示设备当前Mesh拓扑</li>
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
