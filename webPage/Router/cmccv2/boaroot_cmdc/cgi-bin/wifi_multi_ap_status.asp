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
							<li class="cbi-tab-disabled" id="map-cfg-tab-action">
								<a href="/cgi-bin/wifi_multi_ap_action.asp">Action</a>
							</li>
							<li class="cbi-tab" id="map-cfg-tab-status">
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
											                    <input type="hidden" name="__activeTab" id="__activeTab" value="status">
																							<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																							<table class="cbi-section-table" id="map-cfg-status" style="display:none">
																								<TBODY>
																									<tbody id="map-cfg-status-details">
																										<tr>
																											<td>AL_MAC</td>
																											<td>
																												<span id="al_mac"></span>
																											</td>
																											<td></td>
																										</tr>
																										<tbody id="map-cfg-status-sta-steering-progress" style="display: none">
																										<tr>
																											<td>STA Steering Progress</td>
																											<td>
																												<span id="sta-steering-progress"></span>
																											</td>
																											<td></td>
																										</tr>
																										<tr>
																											<td>Station Back-haul Interface</td>
																											<td>
																												<ul id="sta-bh-inf-ul"></ul>
																											</td>
																											<td></td>
																										</tr>
																										</tbody>
																										<tr>
																											<td style="vertical-align:middle">AP Back-haul Interface List</td>
																											<td>
																												<ul id="ap-bh-inf-list-ul"></ul>
																											</td>
																											<td></td>
																										</tr>
																										<tr>
																											<td style="vertical-align:middle">AP Front-haul Interface List</td>
																											<td>
																												<ul id="ap-fh-inf-list-ul"></ul>
																											</td>
																											<td></td>
																										</tr>
																										<tr>
																											<td>Runtime Topology</td>
																											<td colspan="2">
																											<input type="button" id="display-runtime-topology-btn" onClick="displayRuntimeTopology()" class="cbi-section-table-button" value="Display Runtime Topology" />
																											</td>
																										</tr>
																										<tr>
																											<td>AP Capabilities</td>
																											<td colspan="2">
																											<input type="button" id="ap-db-btn" onClick="displayApCapabilities()" class="cbi-section-table-button" value="Display AP Capabilities" />
																											</td>
																										</tr>
																										<tr>
																											<td>Client Capabilities</td>
																											<td colspan="2">
																												<input type="button" id="client-db-btn" onClick="displayClientCapabilities()" class="cbi-section-table-button" value="Display Client Capabilities" />
																											</td>
																										</tr>
																										<tr>
																											<td>Front-haul status per BSS</td>
																											<td colspan="2">
																												<input type="button" id="disp-fh-status-bss" onClick="dispFhStatusBss()" class="cbi-section-table-button" value="Display Front-haul Status per BSS" />
																											</td>
																										</tr>
																										<tr>
																											<td>Back-haul Link Metrics at Controller</td>
																											<td colspan="2">
																												<input type="button" id="disp-bh-link-metrics-ctrler" onClick="dispBhLinkMetricsCtrler()" class="cbi-section-table-button" value="Display Back-haul Link Metrics at Controller" />
																											</td>
																										</tr>
																									</tbody>
																								</TBODY>
																							</table>
																							<% end if %><!-- Mesh_mapdcfg.MapEnable=1  -->
																			</div>
											
											                <SCRIPT language=JavaScript type=text/javascript>
																					
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																					var get_device_role_timer_id;
																					var get_al_mac_timer_id;
																					var get_sta_steering_progress_timer_id;
																					var get_bh_connection_status_timer_id;
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

																					function JSO_get_sta_steering_progress()
																					{
																						<% if tcWebApi_get("Mesh_Common","DeviceRole","h") = "2"  then %>
																						var ret = "<% tcWebApi_MeshJsonHook("mesh_get_sta_steering_progress") %>";
																						<% end if %>
																						return ret;
																					}

																					function JSO_get_sta_bh_interface()
																					{
																						<% if tcWebApi_get("Mesh_Common","DeviceRole","h") = "2"  then %>
																						var ret = "<% tcWebApi_MeshJsonHook("mesh_get_sta_bh_interface") %>";
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
																											case "get_al_mac":
																												X_Res = JSO_get_al_mac();
																												break;
																											case "get_sta_steering_progress":
																												X_Res = JSO_get_sta_steering_progress();
																												break;
																											case "get_sta_bh_interface":
																												X_Res = JSO_get_sta_bh_interface();
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
																					function clearAllTimers()
																					{
																					    clearTimeout(get_device_role_timer_id);
																					    get_device_role_timer_id = null;
																					    clearTimeout(get_al_mac_timer_id);
																					    get_al_mac_timer_id = null;
																					<% if tcWebApi_get("Mesh_common", "DeviceRole", "h") = "2" then %>
																						clearTimeout(get_sta_steering_progress_timer_id);
																						get_sta_steering_progress_timer_id = null;
																						clearTimeout(get_bh_connection_status_timer_id);
																						get_bh_connection_status_timer_id = null;
																					<% end if %>
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
																					                    document.getElementById("map-cfg-tab-action").style.display = "none";
																					                    document.getElementById("map-cfg-tab-status").style.display = "none";
																					                    document.getElementById("map-cfg-status").style.display = "none";
																					                    document.getElementById("map-cfg-status-sta-steering-progress").style.display = "none";
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
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
																					                    document.getElementById("map-cfg-status").style.display = "";
																					                    document.getElementById("map-cfg-status-sta-steering-progress").style.display = "none";
																					                    break;
																					                case 2: // Agent
																					                    document.getElementById("map-cfg-tab-adv").style.display = "none";
																					                    document.getElementById("map-cfg-tab-action").style.display = "";
																					                    document.getElementById("map-cfg-tab-status").style.display = "";
																					                    document.getElementById("map-cfg-status").style.display = "";
																					                    document.getElementById("map-cfg-status-sta-steering-progress").style.display = "";
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
																					
																					function getAlMac()
																					{
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
																					                document.getElementById("al_mac").innerHTML = r['al_mac'];
																					            }
																					            else
																					            {
																					                console.log("Incorrect AL-MAC received!",r['status'],r['al_mac']);
																					                if(document.getElementById("__activeTab").value == "status")
																					                {
																					                    get_al_mac_timer_id = setTimeout(getAlMac,1000);
																					                }
																					            }
																					        }
																					        catch(e)
																					        {
																					            console.log("Incorrect response received for get AL-MAC request!");
																					            if(document.getElementById("__activeTab").value == "status")
																					            {
																					                get_al_mac_timer_id = setTimeout(getAlMac,1000);
																					            }
																					        }
																					    }
																					}
																					
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

																					function dispFhStatusBss()
																					{
											    										location.href = '/cgi-bin/wifi_map_bssinfo.asp';
																					}

																					function dispBhLinkMetricsCtrler()
																					{
											    										location.href = '/cgi-bin/wifi_map_bh_link_metrics.asp';
																					}

																					function displayClientCapabilities()
																					{
											    										location.href = '/cgi-bin/wifi_map_client_capabilities.asp';
																					}
																					
																					function displayApCapabilities()
																					{
											    										location.href = '/cgi-bin/wifi_map_ap_capabilities.asp';
																					}

																					function get_sta_steering_progress()
																					{
																						var XHR_type = 'get_sta_steering_progress';
																						var x_response = getX_Response(XHR_type);
																						{
																							try
																							{
																								var rsp = JSON.parse(x_response);
																								if(rsp.status == "SUCCESS")
																								{
																									document.getElementById("sta-steering-progress").innerHTML = rsp['sta_steering_info'];
																								}
																								else
																								{
																									console.log("Failed to get STA Steering Progress!\nStatus: ",rsp.status);
																								}
																								if(document.getElementById("__activeTab").value == "status")
																								{
																									get_sta_steering_progress_timer_id = setTimeout(checkWebStatus, 5000);
																								}
																							}
																							catch(e)
																							{
																								console.log("Incorrect response!\nFailed to get STA Steering Progress!");
																								if(document.getElementById("__activeTab").value == "status")
																								{
																									get_sta_steering_progress_timer_id = setTimeout(checkWebStatus, 5000);
																								}
																							}
																						}
																					}

																					function get_sta_bh_interface()
																					{
																						<% if tcWebApi_get("WebCustom_Entry","isInsideAgentSupport","h") = "Yes"  then %>
																						var devRole = "2";
																						<% else %>
																						var devRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
																						<% end if %>
																						var staBhInfUl = document.getElementById("sta-bh-inf-ul");
																						staBhInfUl.innerHTML = "";
																						if((devRole == "Agent") || ("2" == devRole))
																						{
																							var XHR_type = 'get_sta_bh_interface';
																							var x_response = getX_Response(XHR_type);
																							{
																								try
																								{
																									var rsp = JSON.parse(x_response);
																									if(rsp.status == "SUCCESS")
																									{
																										staBhInfUl.parentNode.parentNode.style.display = "";
																										var sta_bh_inf_arr = rsp.staBhInfStr.split(";");
																										for(var idx=0; idx < sta_bh_inf_arr.length; idx++)
																										{
																											if(sta_bh_inf_arr[idx] == "")
																											{
																												continue;
																											}
																											var l = document.createElement("LI");
																											var t = document.createTextNode(sta_bh_inf_arr[idx]);
																											l.appendChild(t);
																											staBhInfUl.appendChild(l);
																										}
																									}
																									else
																									{
																										console.log("Failed to get STA BH Interface!\nStatus: ",rsp.status);
																										if(document.getElementById("__activeTab").value == "status")
																										{
																											setTimeout(checkWebStatus, 5000);
																										}
																									}
																								}
																								catch(e)
																								{
																									console.log("Incorrect response!\nFailed to get STA BH Interface!");
																									if(document.getElementById("__activeTab").value == "status")
																									{
																										setTimeout(checkWebStatus, 5000);
																									}
																								}
																							}
																						}
																						else
																						{
																							staBhInfUl.parentNode.parentNode.style.display = "none";
																						}
																					}
                        
																					function get_ap_bh_inf_list()
																					{
																							var apBhInfList = document.getElementById("ap-bh-inf-list-ul");
																							apBhInfList.innerHTML = "";
																							
																							var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_bh_inf_list") %>";
																							{
																									try
																									{
																											var rsp = JSON.parse(x_response);
																											if(rsp.status == "SUCCESS")
																											{
																													var ap_bh_inf_list_arr = rsp.apBhInfListStr.split(";");
																													for(var idx=0; idx < ap_bh_inf_list_arr.length; idx++)
																													{
																															if(ap_bh_inf_list_arr[idx] == "")
																															{
																																	continue;
																															}
																															var l = document.createElement("LI");
																															var t = document.createTextNode(ap_bh_inf_list_arr[idx]);
																															l.appendChild(t);
																															apBhInfList.appendChild(l);
																													}
																											}
																											else
																											{
																													console.log("Failed to get AP BH Interface list!\nStatus: ",rsp.status);
																													if(document.getElementById("__activeTab").value == "status")
																													{
																															setTimeout(checkWebStatus, 5000);
																													}
																											}
																									}
																									catch(e)
																									{
																											console.log("Incorrect response!\nFailed to get AP BH Interface list!");
																											if(document.getElementById("__activeTab").value == "status")
																											{
																													setTimeout(checkWebStatus, 5000);
																											}
																									}
																							}
																					}
																					
																					function get_ap_fh_inf_list()
																					{
																					    var apFhInfList = document.getElementById("ap-fh-inf-list-ul");
																					    apFhInfList.innerHTML = "";
																					    
																							var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_fh_inf_list") %>";
																							{
																					          try
																					          {
																					              var rsp = JSON.parse(x_response);
																					              if(rsp.status == "SUCCESS")
																					              {
																					                  var ap_fh_inf_list_arr = rsp.apFhInfListStr.split(";");
																					                  for(var idx=0; idx < ap_fh_inf_list_arr.length; idx++)
																					                  {
																					                      if(ap_fh_inf_list_arr[idx] == "")
																					                      {
																					                          continue;
																					                      }
																					                      var l = document.createElement("LI");
																					                      var t = document.createTextNode(ap_fh_inf_list_arr[idx]);
																					                      l.appendChild(t);
																					                      apFhInfList.appendChild(l);
																					                  }
																					              }
																					              else
																					              {
																					                  console.log("Failed to get AP FH Interface list!\nStatus: ",rsp.status);
																					                  if(document.getElementById("__activeTab").value == "status")
																					                  {
																					                  	setTimeout(checkWebStatus, 5000);
																					                  }
																					              }
																					          }
																					          catch(e)
																					          {
																					              console.log("Incorrect response!\nFailed to get AP FH Interface list!");
																					              if(document.getElementById("__activeTab").value == "status")
																					              {
																					              	setTimeout(checkWebStatus, 5000);
																					              }
																					          }
																					     }
																					}
																					<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
																					
																					function hi_status()
																					{
																					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
																					    clearAllTimers();
																					    getAlMac();
																					    <% if tcWebApi_get("Mesh_common", "DeviceRole", "h") = "2" then %>
																					    get_sta_steering_progress();
																					    get_sta_bh_interface();
																					    <% end if %>
																					    get_ap_bh_inf_list();
																					    get_ap_fh_inf_list();
																					<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
																					}
																					
																					function checkWebStatus()
																					{
																							location.href = '/cgi-bin/wifi_multi_ap_status.asp';
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
																					    get_apply_status();
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
																					    hi_status();
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
												<IMG id=btnOK name="BUTTON" src="/img/ok.gif" border=0>&nbsp;&nbsp;
												<IMG id=btnCancel src="/img/cancel.gif" border=0>
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
