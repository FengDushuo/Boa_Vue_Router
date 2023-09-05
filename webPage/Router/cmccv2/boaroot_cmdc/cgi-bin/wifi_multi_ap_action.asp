<%
if Request_Form("Save_Flag") = "1" then
		if Request_Form("Action_Flag") = "1" then
			if Request_Form("MapEnable") = "1" then
				if Request_Form("trigger_uplink_ap_selection_Flag") = "1" then
						TCWebApi_constSet("Mesh_action", "trigger_uplink_ap_selection", "1")
						TCWebApi_commit("Mesh_action")
				end if
				
				if Request_Form("trigger_channel_planning_Flag") = "1" then
						TCWebApi_constSet("Mesh_action", "trigger_channel_planning", "1")
						TCWebApi_Set("Mesh_actionpara", "channel_planning_channel", "channel_inp")
						TCWebApi_commit("Mesh_action")
				end if
				
				if Request_Form("trigger_channel_force_switching_Flag") = "1" then
						TCWebApi_constSet("Mesh_action", "trigger_channel_force_switching", "1")
						TCWebApi_Set("Mesh_actionpara", "channel_force_al_mac", "targel_al_mac_inp")
						TCWebApi_Set("Mesh_actionpara", "channel_force_2g_channel", "_2g_channel_inp")
						TCWebApi_Set("Mesh_actionpara", "channel_force_5gl_channel", "_5g_channel_inp")
						TCWebApi_constSet("Mesh_actionpara", "channel_force_5gh_channel", "0")
						TCWebApi_commit("Mesh_action")
				end if

				if Request_Form("trigger_mandate_steering_on_agent_Flag") = "1" then
						TCWebApi_Set("Mesh_actionpara", "mandate_steer_sta_mac", "sta_mac_inp")
						TCWebApi_Set("Mesh_actionpara", "mandate_steer_target_bssid", "target_bssid_inp")
						
						TCWebApi_constSet("Mesh_action", "trigger_mandate_steering", "1")
						TCWebApi_commit("Mesh_action")
				end if
				
				if Request_Form("trigger_back_haul_steering_on_agent_Flag") = "1" then
						TCWebApi_Set("Mesh_actionpara", "steer_back_haul_mac", "back_haul_mac_inp")
						TCWebApi_Set("Mesh_actionpara", "steer_back_haul_target_bssid", "back_haul_target_bssid_inp")
						
						TCWebApi_constSet("Mesh_action", "trigger_backhaul_steering", "1")
						TCWebApi_commit("Mesh_action")
				end if
				
				if Request_Form("trigger_wps_fh_agent_Flag") = "1" then
						TCWebApi_Set("Mesh_actionpara", "wps_front_haul_mac", "fh_mac_inp")
						
						TCWebApi_constSet("Mesh_action", "trigger_wps_fh_agent", "1")
						TCWebApi_commit("Mesh_action")
				end if
				if Request_Form("apply_bh_priority_Flag") = "1" then
						TCWebApi_Set("Mesh_mapdcfg", "BhPriority2G", "BhPriority2G")
						TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GL", "BhPriority5GL")
						TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GH", "BhPriority5GL")
						TCWebApi_constSet("Mesh_action", "apply_bh_priority", "1")
						TCWebApi_commit("Mesh_action")
				end if
			end if
		end if
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
				<span>型号: </span> 
				<span> 
				<SCRIPT language=javascript> 
					document.write(top.ModelName); 
				</SCRIPT>
				</span>
				</TD>
				<TD class=welcom>
				<span>欢迎您！</span> 
				<SPAN class=curUserName>&nbsp;</SPAN>
				<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
				<SPAN name=logout class=logout>退出</SPAN>
				</A>
				<INPUT id=Selected_Menu type=hidden value="应用->EasyMesh" name=Selected_Menu>
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
							<li class="cbi-tab-disabled" id="map-cfg-tab-adv">
								<a href="/cgi-bin/wifi_multi_ap_advanced.asp">Advanced</a>
							</li>
							<li class="cbi-tab" id="map-cfg-tab-action">
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
						<TD width=7 background=/img/panel3.gif>　</TD>
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
																							<big><strong>Please wait while the settings are being applied.</strong></big>
																					</div>
																			</div>
																			
																			<div class="alert-message" id="LOADING_MULTI_AP" style="display:none;">
											                    <img src="/img/loading.gif" alt="" style="vertical-align:middle" />
											                    <big><strong>Please wait.</strong></big>
											                </div>
											                <div id="MULTI_AP_SETTINGS">
											                    <input type="hidden" name="__activeTab" id="__activeTab" value="action">
											                    <form method="post" name="cbi" action="/cgi-bin/wifi_multi_ap_action.asp" autocomplete="off">
													                    <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>" />
											                    		<input type="hidden" name="SaveAll_Flag" value="0" />
											                    		<input type="hidden" name="Save_Flag" value="0" />
											                    		<input type="hidden" name="Action_Flag" value="0" />
											                    		<input type="hidden" name="trigger_channel_force_switching_Flag" value="0" />
											                    		<input type="hidden" name="trigger_channel_planning_Flag" value="0" />
											                    		<input type="hidden" name="trigger_uplink_ap_selection_Flag" value="0" />
											                    		<input type="hidden" name="trigger_mandate_steering_on_agent_Flag" value="0" />
											                    		<input type="hidden" name="trigger_back_haul_steering_on_agent_Flag" value="0" />
											                    		<input type="hidden" name="trigger_wps_fh_agent_Flag" value="0" />
											                    		<input type="hidden" name="apply_bh_priority_Flag" value="0" />
											                    		
											                    <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
								                              <table class="cbi-section-table" id="map-cfg-action" style="display:none">
											                        	<tbody id="map-cfg-action-uplink-ap-selection" style="display:none">
											                        			<tr>
											                              		<td>Up-link AP Selection</td>
											                              		<td colspan="2">
											                              		    <input type="button" id="uplink-ap-selection-btn" onclick="triggerUplinkApSelection()" class="cbi-section-table-button" value="Trigger Up-link AP Selection" />
											                              		</td>
											                          		</tr>
											                         	</tbody>
											                          <tbody id="map-cfg-action-controller-atc" style="display:none">
																										<% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
											                          			<tr>
												                        	 			<td rowspan="2" style="vertical-align:middle">Channel Planning</td>
											                                  <td>Channel</td>
											                                  <td>
											                                      <input type="text" id="channel-planning-channel" name="channel_inp" />
											                                  </td>
												                        	 		</tr>
												                              <tr>
												                                  <td colspan="2">
												                                      <input type="button" id="channel-planning-apply" value="Apply Channel setting" onClick="triggerChannelPlanning()" />
												                                  </td>
												                              </tr>
												                              
												                        	 		<tr>
												                        	 			<td rowspan="4" style="vertical-align:middle">Channel Force Switching</td>
											                                  <td>Targel AL-MAC</td>
											                                  <td>
											                                      <input type="text" id="channel-force-switching-targel-al-mac" name="targel_al_mac_inp" />
											                                  </td>
												                        	 		</tr>
												                              <tr>
												                                  <td>2G Channel</td>
												                                  <td>
												                                      <input type="text" id="channel-force-switching-2g-channel" name="_2g_channel_inp" />
												                                  </td>
												                              </tr>
												                              <tr>
												                                  <td>5G Channel</td>
												                                  <td>
												                                      <input type="text" id="channel-force-switching-5g-channel" name="_5g_channel_inp" />
												                                  </td>
												                              </tr>
												                              <tr>
												                                  <td colspan="2">
												                                      <input type="button" id="channel-force-switching-apply" value="Apply Channel setting" onClick="triggerChannelForceSwitching()" />
												                                  </td>
												                              </tr>
												                           <% end if %>  
											                              <tr>
											                                  <td rowspan="3" style="vertical-align:middle">Mandate Steering on Agent</td>
											                                  <td>STA MAC</td>
											                                  <td>
											                                      <input type="text" id="mandate-steering-agent-sta-mac" name="sta_mac_inp" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td>Target BSSID</td>
											                                  <td>
											                                      <input type="text" id="mandate-steering-agent-target-bssid" name="target_bssid_inp" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td colspan="2">
											                                      <input type="button" id="mandate-steering-agent-apply" onClick="triggerMandateSteeringOnAgent()" class="cbi-section-table-button" value="Trigger Mandate Steering on Agent" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td rowspan="3" style="vertical-align:middle">Back-haul Steering</td>
											                                  <td>Back-haul MAC</td>
											                                  <td>
											                                      <input type="text" id="back-haul-steering-mac" name="back_haul_mac_inp" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td>Target BSSID</td>
											                                  <td>
											                                      <input type="text" id="back-haul-steering-target-bssid" name="back_haul_target_bssid_inp" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td colspan="2">
											                                      <input type="button" id="back-haul-steering-apply" onClick="triggerBackHaulSteering()" class="cbi-section-table-button" value="Trigger Back-haul Steering" />
											                                  </td>
											                              </tr>
											                          </tbody>
											                          <tbody id="map-cfg-action-trigger-wpsfhagent" style="display:none">
											                              <tr>
											                                  <td rowspan="2" style="vertical-align:middle">Trigger WPS at front-haul BSS of an Agent</td>
											                                  <td>Front-haul BSS-MAC</td>
											                                  <td>
											                                      <input type="text" id="trigger-wps-fh-agent-al-mac" name="fh_mac_inp" />
											                                  </td>
											                              </tr>
											                              <tr>
											                                  <td colspan="2">
											                                      <input type="button" id="trigger-wps-fh-agent-apply" onClick="triggerWpsFhAgent()" class="cbi-section-table-button" value="Trigger WPS at Front-haul BSS of an Agent" />
											                                  </td>
											                              </tr>
											                          </tbody>
											                          <tbody id="map-cfg-basic-wireless-bh-preference" style="display:none">
									                                  <tr>
									                                  		<td rowspan="4" style="vertical-align:middle">Wireless Back-haul Preference</td>
									                                      <td>
									                                          <span>2G</span>
									                                      </td>
									                                      <td>
									                                          <select name="BhPriority2G" size="1">
									                                          			<option value="0" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "0" then %> selected="selected" <% end if %>>Disable</option>
								                		          				            <option value="1" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "1" then %> selected="selected" <% end if %>>High</option>
								                		          				            <option value="2" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "2" then %> selected="selected" <% end if %>>Medium</option>
								                		          				            <option value="3" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "3" then %> selected="selected" <% end if %>>Low</option>
									                                          </select>
									                                      </td>
									                                  </tr>
									                                  <tr>
									                                      <td>
									                                          <span>5G</span>
									                                      </td>
									                                      <td>
									                                          <select name="BhPriority5GL" size="1">
									                                          			<option value="0" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "0" then %> selected="selected" <% end if %>>Disable</option>
								                		          				            <option value="1" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "1" then %> selected="selected" <% end if %>>High</option>
								                		          				            <option value="2" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "2" then %> selected="selected" <% end if %>>Medium</option>
								                		          				            <option value="3" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "3" then %> selected="selected" <% end if %>>Low</option>
									                                          </select>
									                                      </td>
									                                  </tr>
									                                  <tr>
									                                      <td colspan="2">
									                                        <input type="button" id="apply-bh-priority-btn" onClick="applyBhPriority()" class="cbi-section-table-button" value="Apply Wireless Back-haul Priority" />
									                                      </td>
									                                  </tr>
									                              </tbody>
											                        </table>
											                    <% end if %><!-- Mesh_mapdcfg.MapEnable=1  -->
											                    </form>
											                </div>
											
											                <SCRIPT language=JavaScript type=text/javascript>
																					
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
																							var webstate = "<% tcWebApi_get("Mesh_action","map_action_complete","s") %>";
																							
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
																					
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																					
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
																					                    document.getElementById("map-cfg-tab-action").style.display = "none";
																					                    document.getElementById("map-cfg-action").style.display = "none";
																					                    document.getElementById("map-cfg-tab-status").style.display = "none";
																					        		   			document.getElementById("map-cfg-basic-wireless-bh-preference").style.display = "none";
																					                    clearTimeout(get_device_role_timer_id);
																					                    get_device_role_timer_id = null;
																					                    if(document.getElementById("__activeTab").value == "basic")
																					                    {
																					                        get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
																					                    }
																					                		break;
																					                case 1: // Controller
																					                    document.getElementById("map-cfg-tab-adv").style.display = "";
																					                    document.getElementById("map-cfg-tab-action").style.display = "";
																					                    document.getElementById("map-cfg-action").style.display = "";
																					                    document.getElementById("map-cfg-action-uplink-ap-selection").style.display = "none";
																					                    document.getElementById("map-cfg-action-controller-atc").style.display = "";
																					                    document.getElementById("map-cfg-action-trigger-wpsfhagent").style.display = "";
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
																					        		    		document.getElementById("map-cfg-basic-wireless-bh-preference").style.display = "none";
																					                		break;
																					                case 2: // Agent
																					                    document.getElementById("map-cfg-tab-adv").style.display = "none";
																					                    document.getElementById("map-cfg-tab-action").style.display = "";
																					                    document.getElementById("map-cfg-action").style.display = "";
																					                    <% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
																					                    document.getElementById("map-cfg-action-uplink-ap-selection").style.display = "none";
																					                    <% else %>
																					                    document.getElementById("map-cfg-action-uplink-ap-selection").style.display = "";
																					                    <% end if %>
																					                    document.getElementById("map-cfg-action-controller-atc").style.display = "none";
																					                    document.getElementById("map-cfg-action-trigger-wpsfhagent").style.display = "";
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
																					        		    		<% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
																									        		document.getElementById("map-cfg-basic-wireless-bh-preference").style.display = "none";
																					                    <% else %>
																									        		document.getElementById("map-cfg-basic-wireless-bh-preference").style.display = "";
																					                    <% end if %>
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
																					
																					function triggerMandateSteeringOnAgent()
																					{
																					    var sta_mac_inp = document.getElementById("mandate-steering-agent-sta-mac");
																					    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
																					    if (!mac_reg_exp.test(sta_mac_inp.value)) 
																					    {
																					        alert("Please fill MAC Address of STA in Mandate Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
																					        sta_mac_inp.focus();
																					        sta_mac_inp.select();
																					        return;
																					    }
																					    var target_bssid_inp = document.getElementById("mandate-steering-agent-target-bssid");
																					    if (!mac_reg_exp.test(target_bssid_inp.value)) 
																					    {
																					        alert("Please fill Target BSSID of Mandate Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
																					        target_bssid_inp.focus();
																					        target_bssid_inp.select();
																					        return;
																					    }
																					    
																					    setText('trigger_mandate_steering_on_agent_Flag', 1);
																							setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function triggerBackHaulSteering()
																					{
																					    var back_haul_mac_inp = document.getElementById("back-haul-steering-mac");
																					    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
																					    if (!mac_reg_exp.test(back_haul_mac_inp.value)) 
																					    {
																					        alert("Please fill MAC Address of Back-haul Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
																					        back_haul_mac_inp.focus();
																					        back_haul_mac_inp.select();
																					        return;
																					    }
																					    var back_haul_target_bssid_inp = document.getElementById("back-haul-steering-target-bssid");
																					    if (!mac_reg_exp.test(back_haul_target_bssid_inp.value)) 
																					    {
																					        alert("Please fill Target BSSID of Back-haul Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
																					        back_haul_target_bssid_inp.focus();
																					        back_haul_target_bssid_inp.select();
																					        return;
																					    }
																					    
																					    setText('trigger_back_haul_steering_on_agent_Flag', 1);
																							setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function triggerWpsFhAgent()
																					{
																					    var fh_mac_inp = document.getElementById("trigger-wps-fh-agent-al-mac");
																					    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
																					    if (!mac_reg_exp.test(fh_mac_inp.value)) 
																					    {
																					        alert("Please fill AL-MAC of an Agent in correct format! (XX:XX:XX:XX:XX:XX)");
																					        fh_mac_inp.focus();
																					        fh_mac_inp.select();
																					        return;
																					    }
																					    
																					    setText('trigger_wps_fh_agent_Flag', 1);
																							setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function triggerUplinkApSelection()
																					{
																						 	setText('trigger_uplink_ap_selection_Flag', 1);
																					    setText('Action_Flag', 1);
																					    formSubmit(0);
																					}
																					
																					function triggerChannelPlanning()
																					{
																					 	setText('trigger_channel_planning_Flag', 1);
																					    setText('Action_Flag', 1);
																					    formSubmit(0);																		
																					}
																					
																					function triggerChannelForceSwitching()
																					{
																						var al_mac_inp = document.getElementById("channel-force-switching-targel-al-mac");
																				    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
																				    if (!mac_reg_exp.test(al_mac_inp.value)) 
																				    {
																				        alert("Please fill ALMAC Address of MAP in Mandate Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
																				        al_mac_inp.focus();
																				        al_mac_inp.select();
																				        return;
																				    }
																					    
																						setText('trigger_channel_force_switching_Flag', 1);
																					    setText('Action_Flag', 1);
																					    formSubmit(0);	
																					}
																					
																					function applyBhPriority()
																					{
																							setText('apply_bh_priority_Flag', 1);
																							setText('Action_Flag', 1);
																							formSubmit(0);
																					}
																					<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
																					
																					function checkWebStatus()
																					{
																							location.href = '/cgi-bin/wifi_multi_ap_action.asp';
																					}
																					
																					function get_apply_status_cb(rsp)
																					{
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
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																							<% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
																							var deviceRole = "2";
																							<% else %>
																							var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
																							<% end if %>
																					    if(deviceRole == "")
																					    {
																					    		deviceRole = "0";
																					    }
																					    
																					    if(deviceRole != "0")
																					    {
																					    		getDeviceRole();
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
										<TD colspan='2' id="cbi-btnsave_cancel-pel" style="display: none">
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
