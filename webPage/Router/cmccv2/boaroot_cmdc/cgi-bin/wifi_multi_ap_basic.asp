<%
if Request_Form("Save_Flag") = "1" then
	if Request_Form("SaveAll_Flag") = "1" then

		if Request_Form("MapEnable") = "1" then
			TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","1")
			TCWebApi_Set("Mesh_common", "SteerEnable", "SteerEnable")
			TCWebApi_Set("Mesh_common", "DeviceRole", "DeviceRole")
			TCWebApi_Set("Info_Mesh", "DeviceRole", "DeviceRole")

			if Request_Form("DeviceRole") = "2" then
				TCWebApi_Set("Mesh_mapdcfg", "BhPriority2G", "BhPriority2G")
				TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GL", "BhPriority5GL")
				TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GH", "BhPriority5GL")
			end if
			if Request_Form("CleanApclibh_Flag") = "1" then
				TCWebApi_constSet("Mesh_common", "CleanApclibhFlag","1")
			end if
			if Request_Form("Change_Flag") = "1" then
				TCWebApi_constSet("Mesh_common", "ReinitWifiFlag","1")
				TCWebApi_commit("Mesh_dat")
			if Request_Form("MeshTriggerFlag") = "1" then
				TCWebApi_commit("Mesh_common")
			end if
			end if
		else
			TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","0")

			TCWebApi_commit("Mesh_dat")
		end if

	else
		if Request_Form("Action_Flag") = "1" then

			if Request_Form("resetToDefaultEasyMesh_Flag") = "1" then
				TCWebApi_constSet("Mesh_action", "load_default_setting", "1")
				TCWebApi_commit("Mesh_action")
			end if
			
			if Request_Form("MapEnable") = "1" then
				if Request_Form("wifi_trigger_onboarding_Flag") = "1" then
					if Request_Form("ether_trigger_onboarding_Flag") = "0" then	
						TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "1")
						TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "0")
						TCWebApi_commit("Mesh_action")
					end if
				end if
				if Request_Form("wifi_trigger_onboarding_Flag") = "0" then
					if Request_Form("ether_trigger_onboarding_Flag") = "1" then	
						TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "0")
						TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "1")
						TCWebApi_commit("Mesh_action")
					end if
				end if

			end if

		end if
	end if

	TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>EasyMesh</TITLE>
	<META http-equiv=Content-Language content=zh-cn >
	<META http-equiv=Content-Type content="text/html; charset=gb2312" >
	<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet >
	<SCRIPT language=javascript src="/JS/menu.js" ></SCRIPT>
	<SCRIPT language=javascript src="/JS/util.js" ></SCRIPT>
	<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
	<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT>
	<script language="javascript" src="/JS/polyfill.min.js"></script>
	<script language="javascript" src="/JS/popup.js"></script>
	<script language="javascript" src="/JS/scm_select.js"></script>
	<script language="javascript" src="/JS/scm_radio.js"></script>
	<script language="javascript" src="/JS/scm_checkbox.js"></script>
	<SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
	<style>
		a {
			text-decoration:none;
		}
	</style>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR >
    <script>
        var cfg_menu_list = new Array('基本配置', '拓扑图');
        var cfg_cookie_name = 'net-wlanadvance-menu';
        init_l_menu();
    </script>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0" >
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
			智能组网终端
		</span>
	</div>
	<div class="in_welcom">
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="应用->组网" name="Selected_Menu">
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
			<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain app">
			<TBODY>
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD" style="list-style:none">
							<li class="cbi-tab TSD" id="map-cfg-tab-basic">基础设置</li>
                            <li class="cbi-tab-runtime" id="map-cfg-tab-runtime" onClick="displayRuntimeTopology()">拓扑图</li>
<% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") <> "1" then %>
							<li class="cbi-tab-disabled" id="map-cfg-tab-adv" style="display:none" onclick="location.href = '/cgi-bin/wifi_multi_ap_advanced.asp';">Advanced</li>
							<li class="cbi-tab-disabled" id="map-cfg-tab-action" style="display:none" onclick="location.href = '/cgi-bin/wifi_multi_ap_action.asp';">Action</li>
							<li class="cbi-tab-disabled" id="map-cfg-tab-status" style="display:none" onclick="location.href = '/cgi-bin/wifi_multi_ap_status.asp';">Status</li>		
<% end if %>
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<td valign="top">
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
					        <TR>
                                <TD width=7 background=/img/panel3.gif>　</TD>
                                <TD valign="top" id="EasyMesh_item" class="hide">
                                        <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
                                            <TBODY>
                                                <TR>
                                                    <TD>
                                                        <div class="advanceTitle">基础设置</div>
                                                    </TD>
                                                </TR>
                                                <TR>
                                                    <TD>
                                                        <div class="title-line"></div>
                                                    </TD>
                                                </TR>
                                            <TR>
                                                <TD>
                                                    <FORM style="DISPLAY: none" name=ConfigForm></FORM>
                                                    <div id="maincontent" class="container">
                                                        <div id="l1datNot">
                                                            <% if tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" then %>
                                                                <fieldset class="cbi-section">
                                                            <legend class="alert-message error">l1profile.dat file is not available!</legend>
                                                        </fieldset>
                                                    <% end if %>
                                                        </div>
                                                        <div id="l1datYes">
                                                            
                                                                <% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "No" then %>
                                                        <div id="isMapSupportedNo">
                                                            <fieldset class="cbi-section">
                                                                <legend class="alert-message error">EasyMesh feature is not supported for this platform!</legend>
                                                            </fieldset>
                                                        </div>
                                                        <% else %>
                                                                <div id="isMapSupportedYes">
                                                                    
                                                                        <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "N/A" then %>
                                                            <div id="isMapCfgSupportedNo">
                                                                <fieldset class="cbi-section">
                                                                    <legend class="alert-message error">Profile settings file is not available!</legend>
                                                                </fieldset>
                                                            </div>
                                                                        <% else %>
                                                                        <div id="isMapCfgSupportedYes">
                                                                                    <div id="map_cfgs_loading_div" style="display: none">
                                                                                            <div class="alert-message" id="BusyMsg" style="display:none">
                                                                                                    <img src="/img/loading.png" alt="" style="vertical-align:middle" />
                                                                                                    <p class="form-text">请耐心等待系统进行配置......</p>
                                                                                                    <p class="form-text">在两分钟之后再尝试刷新页面</p>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="alert-message" id="LOADING_MULTI_AP" style="display:none;">
                                                                                            <img src="/img/loading.png" alt="" style="vertical-align:middle" />
                                                                                            <p class="form-text">Please wait.</p>
                                                                                    </div>
                                                                                    <div id="map_validate_controller_settings_error_div" style="display: none">
                                                                                            <div id="map_validate_controller_rssith_error_msg" style="display: none" class="alert-message error">
                                                                                                <p class="form-text">RSSI Threshold is incorrect!</p>
                                                                                            <div id="map_validate_controller_channelth_error_msg" style="display: none" class="alert-message error">
                                                                                                <p class="form-text">2G/5G Channel Utilization Threshold is incorrect!</p>
                                                                                            <div id="map_validate_controller_error_msg" class="alert-message error">
                                                                                                <p class="form-text">Please enter an integer number!</p>
                                                                                    </div>
                                                                    <div id="MULTI_AP_SETTINGS">
                                                                        <input type="hidden" name="__activeTab" id="__activeTab" value="basic">
                                                                        <form method="post" name="cbi" action="/cgi-bin/wifi_multi_ap_basic.asp" onsubmit="return validate_all()" autocomplete="off">
                                                                                <input type="hidden" name="SaveAll_Flag" value="0" />
                                                                                <input type="hidden" name="Save_Flag" value="0" />
                                                                                <input type="hidden" name="Action_Flag" value="0" />
                                                                                <input type="hidden" name="resetToDefaultEasyMesh_Flag" value="0" />
                                                                                <input type="hidden" name="wifi_trigger_onboarding_Flag" value="0" />
                                                                                <input type="hidden" name="ether_trigger_onboarding_Flag" value="0" />
                                                                                <input type="hidden" name="MeshTriggerFlag" value="<% tcWebApi_get("Mesh_Common","MeshTriggerFlag","s") %>" />
                                                                                    <input type="hidden" name="Change_Flag" value="0" />
                                                                                    <input type="hidden" name="CleanApclibh_Flag" value="0" />

                                                                                    <table class="cbi-section-table" id="map-cfg-basic">
                                                                                        <TBODY>
                                                                                            <tbody id="map-cfg-basic-meshenable-setting">
                                                                                                <tr>
                                                                                                    <td><div class="form-text">组网开关</div></td>
                                                                                                    <td colspan="2">
                                                                                                    <input type="radio" style="width: auto" name="MapEnable" id="MapEnableOn" value="1" onchange="MapEnableClick(1)" <% if tcWebApi_get("APWanInfo_Common", "FixedAPMode", "h") = "APClient" then %> onClick="test()" <% else %> onClick="this.blur();" <% end if %> <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %> checked="checked"<% end if %> /> 开启
                                                                                                    <input type="radio" style="width: auto" name="MapEnable" id="MapEnableOff" value="0" onchange="MapEnableClick(0)" onClick="this.blur();" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "0" then %> checked="checked"<% end if %> /> 关闭
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                            
                                                                                            <div id="appliedMapEnableDiffNA_MapEnableYes_basic">
                                                                                                        <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                                        <% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
                                                                                                            <tbody id="map-cfg-basic-devicerole-setting" style="display:none">
                                                                                                        <% else %>
                                                                                                        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>
                                                                                                            <tbody id="map-cfg-basic-devicerole-setting">
                                                                                                        <% else %>
                                                                                                            <tbody id="map-cfg-basic-devicerole-setting"  style="display:none">
                                                                                                        <% end if %>
                                                                                                        <% end if %>
                                                                                <tr>
                                                                                    <td><div class="form-text">设备角色</div></td>
                                                                                    <td>
                                                                                        <select name="DeviceRole" id="DeviceRole" size="1" onchange="deviceRoleOnChange(this.value)">
                                                                                            <option value="0" <%if tcWebApi_get("Mesh_common","DeviceRole","h")="0" then asp_Write("selected") end if %>>自适应</option>
                                                                                            <option value="1" <%if tcWebApi_get("Mesh_common","DeviceRole","h")="1" then asp_Write("selected") end if %>>主AP</option>
                                                                                            <option value="2" <%if tcWebApi_get("Mesh_common","DeviceRole","h")="2" then asp_Write("selected") end if %>>从AP</option>
                                                                                        </select>
                                                                                    </td>
                                                                                    <td></td>
                                                                                </tr>
                                                                                <TR>
                                                                                    <TD><div class="form-text">当前角色</div></TD> 
                                                                                    <TD>
                                                                                    <% if tcWebApi_get("Info_Mesh", "DeviceRole", "h") = "1" then %>
                                                                                        <INPUT TYPE="TEXT" ID="CurrentDeviceRole" NAME="CurrentDeviceRole" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="主AP" disabled >
                                                                                    <% end if %>
                                                                                    <% if tcWebApi_get("Info_Mesh", "DeviceRole", "h") = "2" then %>
                                                                                        <INPUT TYPE="TEXT" ID="CurrentDeviceRole" NAME="CurrentDeviceRole" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="从AP" disabled >
                                                                                    <% end if %>
                                                                                    <% if tcWebApi_get("Info_Mesh", "DeviceRole", "h") = "0" then %>
                                                                                        <INPUT TYPE="TEXT" ID="CurrentDeviceRole" NAME="CurrentDeviceRole" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="自适应" disabled >
                                                                                    <% end if %>
                                                                                    </TD>
                                                                                </TR>
                                                                                </tbody>
                                                                                <tbody id="map-cfg-basic-detail-setting" <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>style="display:none"<% end if %> >
                                                                                <tr>
                                                                                    <td>Current Device Role</td>
                                                                                    <td>
                                                                                        <span><strong id="current-dev-role">Not configured</strong></span>
                                                                                    </td>
                                                                                    <td></td>
                                                                                </tr>
                                                                                <tbody id="map-cfg-back-haul-connection-status-settings" style="display:none">
                                                                                <tr>
                                                                                    <td>Back-haul Connection Status </td>
                                                                                    <td>
                                                                                        <span id="back-haul-connection-status"></span>
                                                                                    </td>
                                                                                    <td></td>
                                                                                </tr>
                                                                                </tbody>
                                                                                <tbody id="map-cfg-basic-dev-role-configured-settings" style="display:none">
                                                                                    <tr <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>style="display:none"<% end if %>>
                                                                                            <td>Steering</td>
                                                                                        <td colspan="2">
                                                                                                    <input type="radio" style="width: auto" name="SteerEnable" id="SteerEnable" value="1" <% if tcWebApi_get("Mesh_common", "SteerEnable", "h") = "1" then %> checked="checked"<% end if %> /> Enable
                                                                                                    <input type="radio" style="width: auto" name="SteerEnable" id="SteerEnable" value="0" <% if tcWebApi_get("Mesh_common", "SteerEnable", "h") <> "1" then %> checked="checked"<% end if %> /> Disable
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                                <tr <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>style="display:none"<% end if %> >
                                                                                    <td>Reset EasyMesh Settings to default</td>
                                                                                    <td colspan="2">
                                                                                        <input type="button" id="resetMap" onClick="resetToDefaultEasyMesh()" class="cbi-section-table-button" value="Load Default Settings" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tbody id="map-cfg-basic-ap-onboarding" >
                                                                                <tr>
                                                                                    <td rowspan="2" style="vertical-align:middle"><div class="form-text">一键组网</div></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <input type="button" id="multi-ap-on-board-btn" onClick="triggerMultiApOnBoarding()" class="cbi-section-table-button" value="启动组网" />
                                                                                    </td>
                                                                                </tr>
                                                                                

                                                                                </tbody>
                                                                                <tr id="current-dev-role-during-not-configured-msg" <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>style="display:none"<% end if %>>
                                                                                                <td class="alert-message" colspan="3">
                                                                                        <strong>
                                                                                            Other EasyMesh related settings will be displayed once Device Role is configured.
                                                                                        </strong>
                                                                                    </td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </TBODY>
                                                                            <% end if %>
                                                                            </div><!-- appliedMapEnableDiffNA_MapEnableYes_basic -->
                                                                            </table>
                                                                        </form>
                                                                    </div>
                                                    
                                                                    <SCRIPT language=JavaScript type=text/javascript>
                                                                                            
                                                                                            var webReloadFlag = 0;
                                                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                            var get_device_role_timer_id;
                                                                                            <% end if %>
                                                                                            
                                                                                            function JSO_Only_Status(staType)
                                                                                            {
                                                                                                    var ret = ' { ' + 
                                                                                                        '"status": "' + staType + '"' + 
                                                                                                        ' } ';
                                                                                                    return ret;
                                                                                            }
                                                                                            
                                                                                            function JSO_get_apply_status()
                                                                                            {
                                                                                                    var staType = 'DONE';
                                                                                                    var webstate = "<% tcWebApi_get("Mesh_common","ReinitWifiFlag","s") %>";
                                                                                                    
                                                                                                    if(1 == webstate)
                                                                                                    {
                                                                                                            staType = 'ON_PROGRESS';
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                            staType = 'DONE';
                                                                                                    }
                                                                                                    
                                                                                                    var ret = JSO_Only_Status(staType);
                                                                                                    return ret;
                                                                                            }

                                                                                            function JSO_get_al_mac()
                                                                                            {
                                                                                                    var ret = '';
                                                                                                    var al_mac = '';
                                                                                                    al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
                                                                                                    
                                                                                            <% if al_mac <> "N/A" then %>
                                                                                                    ret = ' { ';
                                                                                                    ret = ret + '"status": "SUCCESS",';
                                                                                                    ret = ret + '"al_mac": "' + al_mac + '"';
                                                                                                    ret = ret + ' } ';
                                                                                            <% end if %>
                                                                                                    return ret;
                                                                                            }
                                                                                            
                                                                                            function JSO_get_device_role()
                                                                                            {
                                                                                                    var ret = '';
                                                                                                    <% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
                                                                                                    var mapDevRole = "2";
                                                                                                    <% else %>
                                                                                                    var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
                                                                                                    <% end if %>
                                                                                                    
                                                                                            <% if mapDevRole <> "N/A" then %>
                                                                                                    ret = '{ ';
                                                                                                    ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
                                                                                                    ret = ret + ' }';
                                                                                            <% end if %>
                                                                                                    return ret;
                                                                                            }

                                                                                            function JSO_get_runtime_topology()
                                                                                            {
                                                                                                var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
                                                                                                ret = ret.replace(/\'/g,'\\\\u0022');
                                                                                                ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g,'\\\\u0022WPAPSK\\\\u0022:');
                                                                                                return ret;
                                                                                            }
                                                                                            
                                                                                            function getX_Response(type)
                                                                                            {
                                                                                                    var X_Res='';
                                                                                                    try
                                                                                                    {
                                                                                                            switch(type)
                                                                                                            {
                                                                                                                    case "get_apply_status":
                                                                                                                        X_Res = JSO_get_apply_status();
                                                                                                                        break;
                                                                                                                    case "get_device_role":
                                                                                                                        X_Res = JSO_get_device_role();
                                                                                                                        break;
                                                                                                                    case "get_al_mac":
                                                                                                                        X_Res = JSO_get_al_mac();
                                                                                                                        break;
                                                                                                                    case "get_runtime_topology":
                                                                                                                        X_Res = JSO_get_runtime_topology();
                                                                                                                        break;
                                                                                                                    default:
                                                                                                                        break;
                                                                                                            }
                                                                                                    }
                                                                                                    catch(e)
                                                                                                    {
                                                                                                            X_Res='';
                                                                                                    }
                                                                                                    
                                                                                                    return X_Res;
                                                                                            }
                                                                                            
                                                                                            function test()
                                                                                            {
                                                                                                alert("无线中继模式下组网功能不能开启！", function(ret){
                                                                                                    RefreshPage();;
                                                                                                })
                                                                                                return;
                                                                                            }
                                                                                            
                                                                                            function MapEnableClick(_val)
                                                                                            {
                                                                                                <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") <> "1" then %>
                                                                                                    if(_val)
                                                                                                    {
                                                                                                            document.getElementById("map-cfg-basic-detail-setting").style.display = "";
                                                                                                            document.getElementById("map-cfg-basic-ap-onboarding").style.display = "";
                                                                                                            document.getElementById("map-cfg-tab-adv").style.display = "";
                                                                                                            document.getElementById("map-cfg-tab-action").style.display = "";
                                                                                                            document.getElementById("map-cfg-tab-status").style.display = "";
                                                                                                            
                                                                                                            var devRole = document.getElementById("current-dev-role").innerHTML;
                                                                                                            switch(devRole)
                                                                                                    {
                                                                                                            case "Not Configured": // Auto
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
                                                                                                                document.getElementById("map-cfg-tab-adv").style.display = "none";
                                                                                                                    break;
                                                                                                            case "Controller": // Controller
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
                                                                                                                    break;
                                                                                                            case "Agent": // Agent
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-adv").style.display = "none";
                                                                                                                    break;
                                                                                                            default:
                                                                                                                    break;
                                                                                                    }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                            document.getElementById("map-cfg-basic-detail-setting").style.display = "";
                                                                                                            document.getElementById("map-cfg-basic-ap-onboarding").style.display = "none";
                                                                                                            document.getElementById("map-cfg-tab-adv").style.display = "none";
                                                                                                            document.getElementById("map-cfg-tab-action").style.display = "none";
                                                                                                            document.getElementById("map-cfg-tab-status").style.display = "none";
                                                                                                            
                                                                                                            document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
                                                                                                            document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
                                                                                                    }
                                                                                                <% end if %>
                                                                                            }
                                                                                            
                                                                                            function validate_all()
                                                                                            {
                                                                                                var devRole = document.getElementById("DeviceRole");
                                                                                                var mapEnableRadio = document.getElementById("MapEnableOn");
                                                                                                if(devRole.type == "radio" && (!(mapEnableRadio.checked)))
                                                                                                {
                                                                                                    alert("Please click on Enable radio button of EasyMesh.");
                                                                                                    return false;
                                                                                                }
                                                                                                
                                                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                                    if(devRole.type != "select-one")
                                                                                                    {
                                                                                                        alert("Unknown Device Role Type!");
                                                                                                        return false;
                                                                                                    }
                                                                                                    var curDevRole = document.getElementById("current-dev-role").innerHTML;
                                                                                                    if (devRole.selectedIndex == 0)
                                                                                                    {
                                                                                                        if (curDevRole == "Not configured")
                                                                                                        {
                                                                                                            devRole.selectedIndex = 0;
                                                                                                        }
                                                                                                        if(curDevRole == "Controller")
                                                                                                        {
                                                                                                            devRole.selectedIndex = 1;
                                                                                                        }
                                                                                                        else if(curDevRole == "Agent")
                                                                                                        {
                                                                                                            devRole.selectedIndex = 2;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            alert("Invalid Device role!\n");
                                                                                                            return false;
                                                                                                        }
                                                                                                    }
                                                                                                    if(curDevRole == "Controller")
                                                                                                    {
                                                                                                        if(!validateControllerSettings())
                                                                                                        {
                                                                                                            return false;
                                                                                                        }
                                                                                                    }
                                                                                            <% end if %>/* Mesh_mapdcfg.MapEnable=1 */

                                                                                                document.getElementById("LOADING_MULTI_AP").style.display = "";
                                                                                                document.getElementById("MULTI_AP_SETTINGS").style.display = "none";
                                                                                                return true;
                                                                                            }
                                                                                            
                                                                                            function resetToDefaultEasyMesh()
                                                                                            {
                                                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                                    clearAllTimers();
                                                                                            <% end if %>
                                                                                                    setText('resetToDefaultEasyMesh_Flag', 1);
                                                                                                    setText('Action_Flag', 1);
                                                                                                    formSubmit(0);
                                                                                            }
                                                                                            
        <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                            function validateControllerSettings()
                                                                                            {
                                                                                                if (!validateApSteerRssiTh() ||
                                                                                                    !validateChannelUtilizationTh())
                                                                                                {
                                                                                                    return false;
                                                                                                }
                                                                                                return true;
                                                                                            }
                                                                                            
                                                                                            function validateApSteerRssiTh()
                                                                                            {
                                                                                                var apSteerRssiTh = "<% tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") %>";
                                                                                                if (apSteerRssiTh == "" ||
                                                                                                    isNaN(apSteerRssiTh) ||
                                                                                                    !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
                                                                                                    parseInt(apSteerRssiTh) > 0 ||
                                                                                                    parseInt(apSteerRssiTh) < -90)
                                                                                                {
                                                                                                    alert("RSSI Threshold is incorrect!\nPlease enter an integer number between 0 to -90 inclusive.");
                                                                                                }
                                                                                                return true;
                                                                                            }
                                                                                            
                                                                                            function validateChannelUtilizationTh()
                                                                                            {
                                                                                                var channelUtilTh2G = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") %>";
                                                                                                var channelUtilTh5GL = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") %>";
                                                                                                var channelUtilTh5GH = channelUtilTh5GL;

                                                                                                if (channelUtilTh2G == "" ||
                                                                                                    isNaN(channelUtilTh2G) ||
                                                                                                    !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
                                                                                                    parseInt(channelUtilTh2G) < 0 ||
                                                                                                    parseInt(channelUtilTh2G) > 100)
                                                                                                {
                                                                                                    alert("2G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
                                                                                                }
                                                                                                if (channelUtilTh5GL == "" ||
                                                                                                    isNaN(channelUtilTh5GL) ||
                                                                                                    !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
                                                                                                    parseInt(channelUtilTh5GL) < 0 ||
                                                                                                    parseInt(channelUtilTh5GL) > 100)
                                                                                                {
                                                                                                    alert("5G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
                                                                                                }
                                                                                                return true;
                                                                                            }

                                                                                            function set_controller_validate_msg()
                                                                                            {
                                                                                                var apSteerRssiTh = "<% tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") %>";
                                                                                                var channelUtilTh2G = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") %>";
                                                                                                var channelUtilTh5GL = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") %>";
                                                                                                var setting_error_msg_div = document.getElementById("map_validate_controller_settings_error_div");
                                                                                                var rssi_error_msg_div = document.getElementById("map_validate_controller_rssith_error_msg");
                                                                                                var radio_error_msg_div = document.getElementById("map_validate_controller_channelth_error_msg");

                                                                                                setting_error_msg_div.style.display = "none";
                                                                                                rssi_error_msg_div.style.display = "none";
                                                                                                radio_error_msg_div.style.display = "none";
                                                                                                
                                                                                                if (apSteerRssiTh == "" ||
                                                                                                    isNaN(apSteerRssiTh) ||
                                                                                                    !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
                                                                                                    parseInt(apSteerRssiTh) > 0 ||
                                                                                                    parseInt(apSteerRssiTh) < -90)
                                                                                                {
                                                                                                    setting_error_msg_div.style.display = "";
                                                                                                    rssi_error_msg_div.style.display = "";
                                                                                                }
                                                                                                if (channelUtilTh2G == "" ||
                                                                                                    isNaN(channelUtilTh2G) ||
                                                                                                    !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
                                                                                                    parseInt(channelUtilTh2G) < 0 ||
                                                                                                    parseInt(channelUtilTh2G) > 100)
                                                                                                {
                                                                                                    setting_error_msg_div.style.display = "";
                                                                                                    radio_error_msg_div.style.display = "";
                                                                                                }
                                                                                                if (channelUtilTh5GL == "" ||
                                                                                                    isNaN(channelUtilTh5GL) ||
                                                                                                    !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
                                                                                                    parseInt(channelUtilTh5GL) < 0 ||
                                                                                                    parseInt(channelUtilTh5GL) > 100)
                                                                                                {
                                                                                                    setting_error_msg_div.style.display = "";
                                                                                                    radio_error_msg_div.style.display = "";
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            function clearAllTimers()
                                                                                            {
                                                                                                clearTimeout(get_device_role_timer_id);
                                                                                                get_device_role_timer_id = null;
                                                                                                clearTimeout(get_apply_status);
                                                                                            }

                                                                                            function update_displayed_bh_connect_status(obj_1905)
                                                                                            {
                                                                                                var bhConStatus = document.getElementById("back-haul-connection-status");
                                                                                                if(!obj_1905.hasOwnProperty('BH Info'))
                                                                                                {
                                                                                                    console.log("Topology does not have BH Info Property!",obj_1905);
                                                                                                    bhConStatus.innerHTML = "Disconnected";
                                                                                                    return;
                                                                                                }
                                                                                                
                                                                                                console.log("Topology BH Info:  ! ", obj_1905['BH Info']);
                                                                                                if(obj_1905['BH Info'].length == 0)
                                                                                                {
                                                                                                    console.log("Topology does not have Backhaul Medium Type Property! ", obj_1905['BH Info'].length);
                                                                                                    bhConStatus.innerHTML = "Disconnected";
                                                                                                    return;
                                                                                                }
                                                                                                
                                                                                                var bhInfo = obj_1905['BH Info'][0];
                                                                                                console.log("update_displayed_bh_connect_status ['Backhaul Medium Type']:  ", bhInfo['Backhaul Medium Type']);
                                                                                                if ( bhInfo['Backhaul Medium Type'] == "Ethernet")
                                                                                                {
                                                                                                    bhConStatus.innerHTML = "Ethernet (If you want to use Wi-Fi connection, please plug out the ethernet cable)";
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    bhConStatus.innerHTML = bhInfo['Backhaul Medium Type'];
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            function find_own_topo_info_by_role(devRole, jsTopoInfo, alMac)
                                                                                            {
                                                                                                var tree_info = [];
                                                                                                var topoInfoArr = jsTopoInfo['topology information'];
                                                                                                var bhConStatus = document.getElementById("back-haul-connection-status");
                                                                                                
                                                                                                if(!(topoInfoArr instanceof Array))
                                                                                                {
                                                                                                    console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
                                                                                                    bhConStatus.innerHTML = "Disconnected";
                                                                                                    return;
                                                                                                }
                                                                                                
                                                                                                for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
                                                                                                { 
                                                                                                    var obj_1905 = topoInfoArr[idx_1905];
                                                                                                    if (obj_1905.hasOwnProperty('AL MAC') && (obj_1905['AL MAC'].toUpperCase() == alMac.toUpperCase()))
                                                                                                    {
                                                                                                        update_displayed_bh_connect_status(obj_1905);
                                                                                                        return;
                                                                                                    }
                                                                                                }
                                                                                                
                                                                                                bhConStatus.innerHTML = "Disconnected";
                                                                                                console.log(alMac," AL-MAC NOT FOUND in Topology! Topology: ",jsTopoInfo);
                                                                                            }

                                                                                            function get_al_mac_by_role(devRole, jsTopoInfo)
                                                                                            {
                                                                                                var bhConStatus = document.getElementById("back-haul-connection-status");
                                                                                                var XHR_type = '';
                                                                                                XHR_type = 'get_al_mac';
                                                                                                
                                                                                                var x_response = getX_Response(XHR_type);
                                                                                                {
                                                                                                    try
                                                                                                    {
                                                                                                        var r = JSON.parse(x_response);
                                                                                                        var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
                                                                                                        if (r['status'] == "SUCCESS" && mac_reg_exp.test(r['al_mac'])) 
                                                                                                        {
                                                                                                            find_own_topo_info_by_role(devRole, jsTopoInfo, r['al_mac']);
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            console.log("Incorrect AL-MAC received!",r['status'],r['al_mac']);
                                                                                                            bhConStatus.innerHTML = "Disconnected";
                                                                                                        }
                                                                                                    }
                                                                                                    catch(e)
                                                                                                    {
                                                                                                        console.log("Incorrect response received for get AL-MAC request!",e.name,e.message); 
                                                                                                        bhConStatus.innerHTML = "Disconnected";
                                                                                                    }
                                                                                                }
                                                                                            }

                                                                                            function get_bh_connection_status()
                                                                                            {
                                                                                                var devRole = document.getElementById("current-dev-role").innerHTML;
                                                                                                var bhConStatus = document.getElementById("back-haul-connection-status");
                                                                                                if(devRole == "Agent")
                                                                                                {
                                                                                                    var XHR_type = 'get_runtime_topology';
                                                                                                    var x_response = getX_Response(XHR_type);
                                                                                                    {
                                                                                                        try
                                                                                                        {
                                                                                                            var r = JSON.parse(x_response);
                                                                                                            if(r.status == "SUCCESS")
                                                                                                            {
                                                                                                                console.log("get_bh_connection_status get topo ");
                                                                                                                var tmp_jsTopoInfo = r.luaTopologyInfo;
                                                                                                    tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
                                                                                                    tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
                                                                                                var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
                                                                                                                get_al_mac_by_role(devRole, jsTopoInfo);
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                console.log("get_bh_connection_status() Failed to get Topology Info!\nStatus: ",r.status);
                                                                                                                bhConStatus.innerHTML = "Disconnected";
                                                                                                            }
                                                                                                        }
                                                                                                        catch(e)
                                                                                                        {
                                                                                                            console.log("get_bh_connection_status() Incorrect response! Failed to get Topology Info!",e.name,e.message);
                                                                                                            bhConStatus.innerHTML = "Disconnected";
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    bhConStatus.innerHTML = "Disconnected";
                                                                                                    console.log("get_bh_connection_status not agent ");
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            function getDeviceRole()
                                                                                            {
                                                                                                    var XHR_type = 'get_device_role';
                                                                                                    var x_response = getX_Response(XHR_type);
                                                                                                {
                                                                                                    try
                                                                                                    {
                                                                                                        var devRoleObj = JSON.parse(x_response);
                                                                                                        var devRole = parseInt(devRoleObj.mapDevRole);
                                                                                                        if(isNaN(devRole))
                                                                                                        {
                                                                                                            console.log("Incorrect Device Role",devRole);
                                                                                                            devRole = 0;
                                                                                                        }
                                                                                                        switch(devRole)
                                                                                                        {
                                                                                                            case 0: // Auto
                                                                                                                
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
                                                                                                                
                                                                                                                document.getElementById("current-dev-role").innerHTML = "Not Configured";
        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") <> "1" then %>
                                                                                                                                    document.getElementById("current-dev-role-during-not-configured-msg").style.display = "";
                                                                                                                                    document.getElementById("map-cfg-tab-adv").style.display = "none";
                                                                                                                document.getElementById("map-cfg-adv").style.display = "none";
                                                                                                                document.getElementById("map-cfg-tab-action").style.display = "none";
                                                                                                                document.getElementById("map-cfg-action").style.display = "none";
                                                                                                                document.getElementById("map-cfg-tab-status").style.display = "none";
                                                                                                                document.getElementById("map-cfg-status").style.display = "none";
                                                                                                                                    
        <% end if %>
                                                                                                                clearTimeout(get_device_role_timer_id);
                                                                                                                get_device_role_timer_id = null;
                                                                                                                if(document.getElementById("__activeTab").value == "basic")
                                                                                                                {
                                                                                                                    get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
                                                                                                                }
                                                                                                                    break;
                                                                                                            case 1: // Controller
                                                                                                                document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-adv").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-action").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-status").style.display = "";
        <% end if %>
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
                                                                                                                document.getElementById("current-dev-role").innerHTML = "Controller";
                                                                                                                    break;
                                                                                                            case 2: // Agent
                                                                                                                document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>
                                                                                                                document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-adv").style.display = "none";
                                                                                                                document.getElementById("map-cfg-tab-action").style.display = "";
                                                                                                                document.getElementById("map-cfg-tab-status").style.display = "";
                                                                                                                document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "";
        <% end if %>
                                                                                                                document.getElementById("current-dev-role").innerHTML = "Agent";
                                                                                                                get_bh_connection_status();
                                                                                                                    break;
                                                                                                            default:
                                                                                                                console.log("Invalid device role received: ",devRole);
                                                                                                                    break;
                                                                                                        }
                                                                                                    }
                                                                                                    catch(e)
                                                                                                    {
                                                                                                        console.log("Incorrect response received for get device role request!");
                                                                                                        clearTimeout(get_device_role_timer_id);
                                                                                                        get_device_role_timer_id = null;
                                                                                                        if(document.getElementById("__activeTab").value == "basic")
                                                                                                        {
                                                                                                            get_device_role_timer_id = setTimeout(getDeviceRole, 5000);
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            function deviceRoleOnChange(devRole)
                                                                                            {
                                                                                                devRole = parseInt(devRole);
                                                                                                switch(devRole)
                                                                                                {
                                                                                                    case 0: // Controller
                                                                                                        document.getElementById("DeviceRole").selectedIndex = devRole;
                                                                                                        clearTimeout(get_device_role_timer_id);
                                                                                                        get_device_role_timer_id = null;
                                                                                                            break;
                                                                                                    case 1: // Controller
                                                                                                        document.getElementById("DeviceRole").selectedIndex = devRole;
                                                                                                        clearTimeout(get_device_role_timer_id);
                                                                                                        get_device_role_timer_id = null;
                                                                                                            break;
                                                                                                    case 2: // Agent
                                                                                                        document.getElementById("DeviceRole").selectedIndex = devRole;
                                                                                                        clearTimeout(get_device_role_timer_id);
                                                                                                        get_device_role_timer_id = null;
                                                                                                            break;
                                                                                                    default:
                                                                                                        console.log("Invalid device role selected: ",devRole);
                                                                                                            break;
                                                                                                }
                                                                                            }
                                                                                                                                                                                
                                                                                            function triggerMultiApOnBoarding()
                                                                                            {
                                                                                                    /*Only Wi-Fi On-boarding*/
                                                                                                    var bh_val = 1;
                                                                                                    if(0 == bh_val)
                                                                                                    {
                                                                                                            setText('wifi_trigger_onboarding_Flag', 0);
                                                                                                            setText('ether_trigger_onboarding_Flag', 1);
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                            setText('wifi_trigger_onboarding_Flag', 1);
                                                                                                            setText('ether_trigger_onboarding_Flag', 0);
                                                                                                    }
                                                                                                    setText('Action_Flag', 1);
                                                                                                    formSubmit(0);
                                                                                            }
                                                                                            
                                                                                            <% end if %>/* Mesh_mapdcfg.MapEnable=1 */
                                                                                            
                                                                                            function checkWebStatus()
                                                                                            {
                                                                                                    location.href = '/cgi-bin/wifi_multi_ap_basic.asp';
                                                                                            }
                                                                                            
                                                                                            function get_apply_status_cb(rsp)
                                                                                            {
                                                                                                    webReloadFlag = 0;
                                                                                                    clearTimeout(checkWebStatus);
                                                                                                try
                                                                                                {
                                                                                                    var r = JSON.parse(rsp);
                                                                                                }
                                                                                                catch(e)
                                                                                                {
                                                                                                    return;
                                                                                                }
                                                                                                if(r.status == "ON_PROGRESS")
                                                                                                {
                                                                                                    var altmsg ="Device is applying the saved settings now!\n" +
                                                                                                        "It is recommended to wait until all the saved settings are applied.\n";
                                                                                                    //alert(altmsg);
                                                                                                    
                                                                                                    document.getElementById('map_cfgs_loading_div').style.display = '';
                                                                                                    document.getElementById('BusyMsg').style.display = '';
                                                                                                    document.getElementById('LOADING_MULTI_AP').style.display = 'none';
                                                                                                    document.getElementById('MULTI_AP_SETTINGS').style.display = 'none';
                                                                                                    document.getElementById('map-cfg-tab-basic').style.display = 'none';
        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") <> "1" then %>
                                                                                                    document.getElementById('map-cfg-tab-adv').style.display = 'none';
                                                                                                    document.getElementById('map-cfg-tab-action').style.display = 'none';
                                                                                                    document.getElementById('map-cfg-tab-status').style.display = 'none';
        <% end if %>
                                                                                                            document.getElementById('map-cfg-tab-runtime').style.display = 'none';
                                                                                                    webReloadFlag = 1;
                                                                                                    setTimeout(checkWebStatus, 5000);
                                                                                                }
                                                                                            }
                                                                                            
                                                                                            function get_apply_status()
                                                                                            {
                                                                                                    var XHR_type = 'get_apply_status';
                                                                                                    var x_response = getX_Response(XHR_type);
                                                                                                    {
                                                                                                            get_apply_status_cb(x_response);
                                                                                                    }
                                                                                            }

                                                                                            function LoadMapFrame()
                                                                                            {
                                                                                                    get_apply_status();
                                                                                                    if(webReloadFlag)
                                                                                                    {
                                                                                                        return;
                                                                                                    }
                                                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                                                    <% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
                                                                                                    var deviceRole = "2";
                                                                                                    <% else %>
                                                                                                    var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
                                                                                                    <% end if %>
                                                                                                if(deviceRole == "")
                                                                                                {
                                                                                                        deviceRoleOnChange("0");
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                        deviceRoleOnChange(deviceRole);
                                                                                                        if(deviceRole != "0")
                                                                                                        {
                                                                                                            getDeviceRole();
                                                                                                                if(deviceRole == "1")
                                                                                                                {
                                                                                                            //		set_controller_validate_msg();
                                                                                                                }
                                                                                                        }
                                                                                                }
                                                                                            <% end if %>/* Mesh_mapdcfg.MapEnable=1 */
                                                                                            }
                                                                                            
        <% if tcWebApi_get("Mesh_Common","CmccApMeshFlag","h") = "1" then %>
                                                                                            function displayRuntimeTopology()
                                                                                            {
                                                                                                    var dev_role = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
                                                                                                    if(dev_role != "0" && dev_role != "1")
                                                                                                    {
                                                                                                            alert("Device Role is not configured yet!\nPlease configure the Device Role.");
                                                                                                            return;
                                                                                                    }
                                                                                                    location.href = '/cgi-bin/wifi_map_runtime_topology.asp';
                                                                                            }
        <% end if %>
                                                                    </script>
                                                        </div><!-- isMapCfgSupportedYes -->
                                                        <% end if %>
                                                            </div><!-- isMapSupportedYes -->
                                                            <% end if %>
                                                        </div><!-- l1datYes -->
                                                    </div>
                                                </TD>	
                                            </TR>
                                            <TR>
                                                <TD colspan='2' id="cbi-btnsave_cancel-pel">
                                                    <P style="margin-top: 32px;margin-left: 182px;">
                                                        <input type="button" id="btnOK" name="BUTTON" onclick='btnSave()' value="保 存">
                                                    </P>
                                                </TD>
                                            </TR>
                                            </TBODY>
                                        </TABLE>
                                </TD>
                            </TR>

                            <TR>
                                <TD width=7 background=/img/panel3.gif>　</TD>
                                <TD valign="top" id='Topo_item' class="hide">
                                    <TABLE cellSpacing=0 celladding=0 width="100%" border=0>
                                        <TBODY>
                                            <TR>
                                                <TD>
                                                    <div class="advanceTitle">拓扑图</div>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD>
                                                    <div class="title-line"></div>
                                                </TD>
                                            </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
					        </TR>
					    </TBODY>
					</TABLE>
				</TD>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
	</TR>
	</TBODY>
</TABLE>
<SCRIPT language=JavaScript type=text/javascript>
function formSubmit(saveAll)
{
		if(document.cbi != null)
		{
				if(saveAll)
				{
						setText('SaveAll_Flag', 1);
				}
				else
				{
						setText('SaveAll_Flag', 0);
				}
				setText('Save_Flag', 1);
				document.cbi.submit();
		}
}

function btnSave()
{
		if(document.cbi != null)
		{
<% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") <> "Yes"  then %>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				var DeviceRole=<% tcWebApi_get("Mesh_common","DeviceRole","s") %>;
				var devRole = document.getElementById("DeviceRole");
				if ((devRole.value != DeviceRole))
				{
					setText('Change_Flag', 1);
					setText('CleanApclibh_Flag', 1);
					setText('MeshTriggerFlag', 1);
				}
<% else %>
				setText('Change_Flag', 1);
<% end if %>
<% end if %>
				formSubmit(1);
		}
}

function LoadFrame ()
{
		var isl1datSupported = 1;

<% if tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" then %>
		isl1datSupported = 0;
<% end if %>

		if(isl1datSupported)
		{
				setDisplay('l1datNot',0);
				setDisplay('l1datYes',1);

<% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
				LoadMapFrame();
<% end if end if %>
		}
		else
		{
				setDisplay('l1datNot',1);
				setDisplay('l1datYes',0);
		}
		var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
		set_action(query_string);
}
</SCRIPT>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY>
</HTML>
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>
