<%
if Request_Form("Save_Flag") = "1" then
	if Request_Form("SaveAll_Flag") = "1" then
		if Request_Form("MapEnable") = "1" then
			TCWebApi_constSet("Mesh_dat", "MapEnable","1")
			
			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_2G", "CUOverloadTh_2G");
			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_L", "CUOverloadTh_5G_L")
			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_H", "CUOverloadTh_5G_L")

			TCWebApi_Set("Mesh_mapdcfg", "APSteerRssiTh", "APSteerRssiTh")
			TCWebApi_constSet("Mesh_common", "ReinitWifiFlag","1")

			TCWebApi_commit("Mesh_dat")
			if Request_Form("MeshTriggerFlag") = "1" then
				TCWebApi_commit("Mesh_common")
			end if
		end if
	else
		if Request_Form("Action_Flag") = "1" then
			
			if Request_Form("MapEnable") = "1" then
				if Request_Form("apply_channel_utilization_th_Flag") = "1" then
						TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_2G", "CUOverloadTh_2G");
						TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_L", "CUOverloadTh_5G_L")
						TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_H", "CUOverloadTh_5G_L")
						
						TCWebApi_commit("Mesh_steercfg")
				end if

				if Request_Form("apply_ap_steer_rssi_th_Flag") = "1" then
						TCWebApi_Set("Mesh_mapdcfg", "APSteerRssiTh", "APSteerRssiTh")

						TCWebApi_commit("Mesh_mapdcfg")
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
	<SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR >
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0" >
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
	<TBODY>
	<TR>
		<TD class="header">
			<TABLE cellSpacing=0 cellPadding=0 border=0 class="tbl_nav">
			<TBODY>
			<TR>
			<TD>&nbsp;</TD>
			<TD vAlign=top align=right>
				<TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
				<TBODY>
				<TR>
				<TD class="td_model">
				<span>ù?ù: </span> 
				<span> 
				<SCRIPT language=javascript> 
					document.write(top.ModelName); 
				</SCRIPT>
				</span>
				</TD>
				<TD class=welcom>
				<span>ùù?ùùùù</span> 
				<SPAN class=curUserName>&nbsp;</SPAN>
				<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
				<SPAN name=logout class=logout>ù?ù</SPAN>
				</A>
				<INPUT id=Selected_Menu type=hidden value="?ùù->EasyMesh" name=Selected_Menu>
				</TD>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			</TR>
			</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
			<TBODY>
			<TR>
			<TD id=MenuArea_L1></TD>
			</TR>
			<TR>
			<TD id=MenuArea_L2></TD>
			</TR>
			</TBODY>
			</TABLE>
			<SCRIPT language=javascript>
			MakeMenu(getElById ('Selected_Menu').value);
			</SCRIPT>
		</TD>
	</TR>  
	<TR>
		<TD class="content">	
			<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
			<TBODY>
			<TR>
				<TD class="Item_T" rowspan="7">
					<ul class="cbi-tabmenu">
							<li class="cbi-tab-disabled" id="map-cfg-tab-basic">
								<a href="/cgi-bin/wifi_multi_ap_basic.asp">Basic</a>
							</li>
							<li class="cbi-tab" id="map-cfg-tab-adv">
								<a href="/cgi-bin/wifi_multi_ap_advanced.asp">Advanced</a>
							</li>
							<li class="cbi-tab-disabled" id="map-cfg-tab-action">
								<a href="/cgi-bin/wifi_multi_ap_action.asp">Action</a>
							</li>
							<li class="cbi-tab-disabled" id="map-cfg-tab-status">
								<a href="/cgi-bin/wifi_multi_ap_status.asp">Status</a>
							</li>
					</ul>
				</TD>
				<TD class='w-828'>
					<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>ùù</TD>
						<TD valign="top">
							<div id="EasyMesh_item">
								<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
									<TBODY>
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
																	<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
																	<big><strong>Please wait while the settings are being applied.</strong></big><br/>
																	<big><strong>After about 2 minutes, manually refresh the page.</strong></big>
																</div>
															</div>
															<div class="alert-message" id="LOADING_MULTI_AP" style="display:none;">
																<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
																<big><strong>Please wait.</strong></big>
															</div>
															<div id="map_validate_controller_settings_error_div" style="display: none">
																<div id="map_validate_controller_rssith_error_msg" style="display: none" class="alert-message error"><big><strong>RSSI Threshold is incorrect!</big></strong></div>
																<div id="map_validate_controller_channelth_error_msg" style="display: none" class="alert-message error"><big><strong>2G/5G Channel Utilization Threshold is incorrect!</big></strong></div>
																<div id="map_validate_controller_error_msg" class="alert-message error"><big><strong>Please enter an integer number !</big></strong></div>
															</div>
											                <div id="MULTI_AP_SETTINGS">
											                    <input type="hidden" name="__activeTab" id="__activeTab" value="adv">
											                    <form method="post" name="cbi" action="/cgi-bin/wifi_multi_ap_advanced.asp" onsubmit="return validate_all()" autocomplete="off">
													                    <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>" />
											                    		<input type="hidden" name="SaveAll_Flag" value="0" />
											                    		<input type="hidden" name="Save_Flag" value="0" />
											                    		<input type="hidden" name="Action_Flag" value="0" />
											                    		<input type="hidden" name="apply_channel_utilization_th_Flag" value="0" />
											                    		<input type="hidden" name="apply_ap_steer_rssi_th_Flag" value="0" />
											                    		<input type="hidden" name="MeshTriggerFlag" value="<% tcWebApi_get("Mesh_Common","MeshTriggerFlag","s") %>" />
											                    		
											                    <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
											                        <table class="cbi-section-table" id="map-cfg-adv" style="display: none">
											                          <tbody id="map-cfg-adv-controller-settings">
											                              <tr>
											                                  <td>BSS Configurations Renew</td>
											                                  <td>
											                                      <input type="button" value="Configure BSS" onClick="configBss()" class="cbi-section-table-button"/>
											                                  </td>
											                                  <td></td>
											                              </tr>
											                              <tr>
											                                  <td rowspan="3"  style="vertical-align:middle">Channel Utilization Threshold</td>
											                                  <td>
											                                      <span>2G</span>
											                                  </td>
											                                  <td>
											                                  		<input type="text" id="CUOverloadTh_2G" name="CUOverloadTh_2G" value="<% if tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") end if %>" />
											                                      <span> Range: 0 to 100 Unit: Percentage</span>
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td>
											                                      <span>5G</span>
											                                  </td>
											                                  <td>
											                                  		<input type="text" id="CUOverloadTh_5G_L" name="CUOverloadTh_5G_L" value="<% if tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") end if %>" />
											                                      <span> Range: 0 to 100 Unit: Percentage</span>
											                                      <input type="hidden" id="CUOverloadTh_5G_H" name="CUOverloadTh_5G_H" value="<% if tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_H","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_H","s") end if %>" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td colspan="2">
											                                    <button id="apply-channel-utilization-th-btn" onClick="applyChannelUtilizationTh()" class="cbi-section-table-button">Apply Channel Utilization Threshold</button>
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td rowspan="2"  style="vertical-align:middle">AP Steering RSSI Threshold</td>
											                                  <td>
											                                  		<input type="text" id="APSteerRssiTh" name="APSteerRssiTh" value="<% if tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","h" ) <> "N/A" then tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") end if %>" />
											                                      <span> Range: -90 to 0 Unit: dbm</span>
											                                  </td>
											                                  <td></td>
											                              </tr>
											                              <tr>
											                                  <td colspan="2">
											                                      <button id="apply-rssi-th-btn" onClick="applyRssiTh()" class="cbi-section-table-button">Apply RSSI Threshold</button>
											                                  </td>
											                              </tr>
											                          </tbody>
											                        </table>
											                    <% end if %><!-- Mesh_mapdcfg.MapEnable=1  -->
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
																					
																					function JSO_get_device_role()
																					{
																							var ret = '';
																							var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
																					<% if mapDevRole <> "N/A" then %>
																							ret = '{ ';
																							ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
																							ret = ret + ' }';
																					<% end if %>
																							return ret;
																					}
																					
																					function JSO_apply_channel_utilization_th()
																					{
																					 		var staType = 'SUCCESS';
																							var ret = JSO_Only_Status(staType);
																							
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
																											case "apply_channel_utilization_th":
																												X_Res = JSO_apply_channel_utilization_th();
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
																					
																					function validate_all()
																					{
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																						var curDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
																						curDevRole = parseInt(curDevRole);

																						switch(curDevRole)
																					    {
																					        case 1: // Controller
																								break;
																					        case 2: // Agent
																								break;
																					        default:
																								return false;
																					    }

																						if(curDevRole == 1)
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
																					    var apSteerRssiTh = document.getElementById("APSteerRssiTh").value;
																					    if (apSteerRssiTh == "" ||
																					        isNaN(apSteerRssiTh) ||
																					        !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
																					        parseInt(apSteerRssiTh) > 0 ||
																					        parseInt(apSteerRssiTh) < -90)
																					    {
																					        alert("RSSI Threshold is incorrect!\nPlease enter an integer number between 0 to -90 inclusive.");
																					        document.getElementById("APSteerRssiTh").focus();
																					        document.getElementById("APSteerRssiTh").select();
																					        return false;
																					    }
																					    return true;
																					}
																					
																					function validateChannelUtilizationTh()
																					{
																					    var channelUtilTh2G = document.getElementById("CUOverloadTh_2G").value;
																					    var channelUtilTh5GL = document.getElementById("CUOverloadTh_5G_L").value;
																					    var channelUtilTh5GH = channelUtilTh5GL;
																					    
																					    if (channelUtilTh2G == "" ||
																					        isNaN(channelUtilTh2G) ||
																					        !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
																					        parseInt(channelUtilTh2G) < 0 ||
																					        parseInt(channelUtilTh2G) > 100)
																					    {
																					        alert("2G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
																					        document.getElementById("CUOverloadTh_2G").focus();
																					        document.getElementById("CUOverloadTh_2G").select();
																					        return false;
																					    }
																					    if (channelUtilTh5GL == "" ||
																					        isNaN(channelUtilTh5GL) ||
																					        !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
																					        parseInt(channelUtilTh5GL) < 0 ||
																					        parseInt(channelUtilTh5GL) > 100)
																					    {
																					        alert("5G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
																					        document.getElementById("CUOverloadTh_5G_L").focus();
																					        document.getElementById("CUOverloadTh_5G_L").select();
																					        return false;
																					    }
																					    return true;
																					}

																					function set_controller_validate_msg()
																					{
																						var apSteerRssiTh = document.getElementById("APSteerRssiTh").value;
																						var channelUtilTh2G = document.getElementById("CUOverloadTh_2G").value;
																						var channelUtilTh5GL = document.getElementById("CUOverloadTh_5G_L").value;

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
																					                    document.getElementById("map-cfg-tab-adv").style.display = "none";
																					                    document.getElementById("map-cfg-adv").style.display = "none";
																					                    document.getElementById("map-cfg-tab-action").style.display = "none";
																					                    document.getElementById("map-cfg-tab-status").style.display = "none";
																					                    clearTimeout(get_device_role_timer_id);
																					                    get_device_role_timer_id = null;
																					                    if(document.getElementById("__activeTab").value == "basic")
																					                    {
																					                        get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
																					                    }
																					                		break;
																					                case 1: // Controller
																					                    document.getElementById("map-cfg-tab-adv").style.display = "";
																					                    document.getElementById("map-cfg-adv").style.display = "";
																					                    document.getElementById("map-cfg-adv-controller-settings").style.display = "";
																					                    document.getElementById("map-cfg-tab-action").style.display = "";
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
																					                		break;
																					                case 2: // Agent
																					                    document.getElementById("map-cfg-tab-adv").style.display = "none";
																					                    document.getElementById("map-cfg-adv").style.display = "";
																					                    document.getElementById("map-cfg-adv-controller-settings").style.display = "none";
																					                    document.getElementById("map-cfg-tab-action").style.display = "";
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
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
																					
																					function applyChannelUtilizationTh()
																					{
																					    if(!validateChannelUtilizationTh())
																					    {
																					        return;
																					    }
																					    
																					    setText('apply_channel_utilization_th_Flag', 1);
																							setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function applyRssiTh()
																					{
																					    if(!validateApSteerRssiTh())
																					    {
																					        return;
																					    }
																					    
																					    setText('apply_ap_steer_rssi_th_Flag', 1);
																							setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function configBss()
																					{
																					    location.href = '/cgi-bin/wifi_map_bss_cfg_renew.asp';
																					}
																					<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
																					
																					function checkWebStatus()
																					{
																							location.href = '/cgi-bin/wifi_multi_ap_advanced.asp';
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
																					        document.getElementById('map-cfg-tab-adv').style.display = 'none';
																					        document.getElementById('map-cfg-tab-action').style.display = 'none';
																					        document.getElementById('map-cfg-tab-status').style.display = 'none';
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
																					
																					function LoadMapFrame ()
																					{
																						get_apply_status();
																						if(webReloadFlag)
																						{
																							return;
																						}
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																							var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
																					    if(deviceRole == "")
																					    {
																					    		deviceRole = "0";
																					    }
																					    
																					    if(deviceRole != "0")
																					    {
																					    		getDeviceRole();
																								if(deviceRole == "1")
																								{
																									set_controller_validate_msg();
																								}
																					    }
																					<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
																					}
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
											<P align=center>
												<IMG id=btnOK name="BUTTON" onclick='btnSave()' src="/img/ok.gif" border=0>&nbsp;&nbsp;
												<IMG id=btnCancel onclick='RefreshPage()' src="/img/cancel.gif" border=0>
											</P>
										</TD>
									</TR>
									</TBODY>
								</TABLE>
							</div>
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
	<SCRIPT language=JavaScript type=text/javascript>
		<!-- copyright bottom -->
		printCopyRightBottom();
	</SCRIPT>
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
</BODY>
</HTML>
