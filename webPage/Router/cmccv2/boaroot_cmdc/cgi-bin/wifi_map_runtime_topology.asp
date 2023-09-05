<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>EasyMesh Run-time Topology Display</TITLE>
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
	<SCRIPT language=javascript src="/JS/vis.js"></SCRIPT>
	<SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
	<style>
		a {
			text-decoration:none;
		}
	</style>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR >
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
			<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
			<TBODY>
			<TR>
				<TD id="MenuArea_L2">
					<ul class="TRD">
						<li class="cbi-tab" id="map-cfg-tab-basic" onclick="location.href = '/cgi-bin/wifi_multi_ap_basic.asp';">基础设置</li>
						<li class="TSD" name="EasyMesh_Run_time_Topology_Display_li" id="EasyMesh_Run_time_Topology_Display_li">组网拓扑图</li>
					</ul>
				</TD>
				<SCRIPT language=javascript>
				MakeMenu(getElById ('Selected_Menu').value);
				</SCRIPT>
				<td valign="top">
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">时间管理</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top">
							<div id="EasyMesh_Run_time_Topology_Display_item">
								<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
									<TBODY>
									<TR>
										<TD>
											<div id="maincontent" class="container">
												<div class="alert-message" id="getTopoInfoMsgDiv">
								    			<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
								    			<big><strong>Retrieving EasyMesh Run-time Topology Information!</strong></big>
												</div>
												<div class="alert-message error" style="display:none">
								    			<span><strong id="topoErrMsgDiv"></strong></span>
												</div>
												<div id="display_tree_vis" style="display:none; width: 80%; height: 600px;"></div>
												<button id="toggle_disp_tree_vis_detail_btn" class="input-large" onclick="toggle_disp_tree_vis_detail()" disabled="disabled">刷新组网拓扑图</button>
												
												<div id="display_all_1905_dev_info_div" style="display:none"></div>
												<button id="toggle_all_1905_dev_info_btn" class="input-large" onclick="toggle_disp_dev_table(this)" disabled="disabled">显示组网信息详情</button>
					
												<form method="post" name="cbi" action="/cgi-bin/wifi_map_runtime_topology.asp" autocomplete="off">
														<input type="hidden" name="Save_Flag" id="Save_Flag" value="0" />
														<div name="div_runtime_topology" id="div_runtime_topology" style="display:none"></div>
												</form>
												<script type="text/javascript">
														
														var max_cellspan = 2;
														
														if(typeof String.prototype.startsWith != 'function')
														{
																String.prototype.startsWith = function(prefix)
																{
																		return this.slice(0, prefix.length) == prefix;
																}
														}
														
														function toggle_disp_tree_vis_detail()
														{
																//window.open("/cgi-bin/wifi_map_get_run_time_topology_detail.asp","runtime_topology_detail","toolbar=no,menubar=no,height=400, width=800,location=0,left=200,top=200");
																setTimeout(get_run_time_topology_submit, 0);
														}
					
														function JSO_get_runtime_topology()
														{
																var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
																ret = ret.replace(/\'/g,'\\\\u0022');
																ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g,'\\\\u0022WPAPSK\\\\u0022:');
																return ret;
														}
														
														function set_max_cellspan(o)
												    {
												        for(var k in o)
												        {
												            var v = o[k];
												            if (v instanceof Array)
												            {
												                max_cellspan++;
												                for(var a_idx=0; a_idx < v.length; a_idx++)
												                {
												                    if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
												                    {
												                        set_max_cellspan(v[a_idx]);
												                    }
												                    else
												                    {
												                        console.log("set_max_cellspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
												                    }
												                }
												            }
												            else if(((typeof v) == "object") && v != null)
												            {
												                set_max_cellspan(v);
												            }
												        }
												    }
												    
												    function set_rowspan(o)
												    {
												        var rowspan = 0;
												        for(var k in o)
												        {
												            var v = o[k];
												            if (v instanceof Array)
												            {
												                for(var a_idx=0; a_idx < v.length; a_idx++)
												                {
												                    if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
												                    {
												                        rowspan = rowspan + set_rowspan(v[a_idx]);
												                    }
												                    else
												                    {
												                        console.log("set_rowspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
												                    }
												                }
												            }
												            else if(((typeof v) == "object") && v != null)
												            {
												                rowspan = rowspan + set_rowspan(v);
												            }
												            else
												            {
												                rowspan++;
												            }
												        }
												        return rowspan;
												    }
												    
												    function obj_loop(table_id, row, o)
												    {
												        var cell;
												        for(var k in o)
												        {
												            var v = o[k];
												            if (v instanceof Array)
												            {
												                arr_loop(table_id, k, v);
												            }
												            else if(((typeof v) == "object") && v != null)
												            {
												                obj_loop(table_id, row, v);
												            }
												            else
												            {
												                if(row == null)
												                {
												                    row = table_id.insertRow(-1);
												                }
												                cell = row.insertCell(-1);
												                cell.innerHTML = k;
												          if(k == "Device role")
												          {
												              v = get_dev_role_string(v);
												          }
												                cell = row.insertCell(-1);
												                cell.colSpan = max_cellspan - row.cells.length + 1;
												                cell.innerHTML = v;
												                row = null;
												            }
												        }
												    }
												    
												    function arr_loop(table_id, k, a)
												    {
												        var row, cell;
												        for(var a_idx=0; a_idx < a.length; a_idx++)
												        {
												            var v = a[a_idx];
												            if(((typeof v) == "object") && v != null)
												            {
												                row = table_id.insertRow(-1);
												                cell = row.insertCell(-1);
												                cell.rowSpan = set_rowspan(v);
												                cell.style.verticalAlign  = "middle";
												                cell.innerHTML = "<strong>" + k + ' - ' + (a_idx + 1) + "</strong>";
												                obj_loop(table_id, row, v);
												            }
												            else
												            {
												                console.log("Incorrect Topology: Array element is not an object!",a);
												            }
												        }
												    }
												    
												    function prep_bssinfo(dev1905Obj)
												    {
												    		var tag_dev1905Obj = dev1905Obj;
												        for(var radIdx=0; radIdx < tag_dev1905Obj['Radio Info'].length; radIdx++)
												        {
												            for(var bssIdx=0; bssIdx < tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
												            {
												            		var Security_val = '';
												            		if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Security'))
												            		{
												            				Security_val = tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Security'];
												            				if(Security_val == '0001')
												            				{
												            						if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Encryption'))
												            						{
												            								tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Encryption'] = '0001';
												            						}
												            						if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('WPAPSK'))
												            						{
												            								tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['WPAPSK'] = '';
												            						}
												            				}
												            		}
												            }
												        }
												        return tag_dev1905Obj;
												    }
												    
												    function draw_topology_table(jsTopoInfo)
												    {
												        var tree_info = [];
												        var tree_info_count = 0;
												        var topoInfoArr = jsTopoInfo['topology information'];
												        if(!(topoInfoArr instanceof Array))
												        {
												            console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
												            return;
												        }
												        
												        for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
												        {
												            var obj_1905 = topoInfoArr[idx_1905];
												            if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']) || !obj_1905.hasOwnProperty('IP'))
												            {
												            		continue;
												            }
												            obj_1905 = prep_bssinfo(obj_1905);
												            
												            var dev1905tbl = document.createElement("TABLE");
												            dev1905tbl.setAttribute("class", "cbi-section-table");
												            var dev1905fset = document.createElement("div");
												            dev1905fset.setAttribute("class", "table1_head");
												            var dev1905legend = document.createElement("p");
												            var dev1905a = document.createElement("A");
												            var dev1905text = document.createTextNode("1905 Device - " + (idx_1905 + 1));
												            dev1905a.setAttribute("href", "#");
												            dev1905a.appendChild(dev1905text);
												            dev1905legend.appendChild(dev1905a);
												            dev1905fset.appendChild(dev1905legend);
												            document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905fset);
												            
												            set_max_cellspan(obj_1905);
												            obj_loop(dev1905tbl, null, obj_1905);
												            tree_info[tree_info_count] = prep_tree_info(obj_1905);
												            
												            document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905tbl);
												            tree_info_count++;
												        }
												        tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
												        disp_topology_vis(tree_info);
												    }
												    <% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
												    function prep_tree_info(dev1905Obj)
												    {
												        var node = {};
												        node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
												        node["alMac"] = dev1905Obj['AL MAC'];
														node["ip"] = dev1905Obj['IP'];
												        node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
												        node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
												        node["wifistaInfo"] = {};
												        node["ethstaInfo"] = {};
												        node["devInfo"] = {};
												        
												        for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
												        {
												            for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
												            {
												                if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
												                {
												                    for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
												                    {
												                        var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
																								var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
																								if (node["wifistaInfo"].hasOwnProperty(ssid))
																								{
																									node["wifistaInfo"][ssid].push(staMac);
																								}
																								else
																								{
																									node["wifistaInfo"][ssid] = Array(staMac);
																								}
												                    }
												                }
												            }
												        }
												        
												        for(var cliIdex = 0; cliIdex < dev1905Obj['Other Clients Info'].length; cliIdex++)
												        {
												        		if (dev1905Obj['Other Clients Info'][cliIdex].hasOwnProperty('Client Address'))
												        		{
												        			var cliAdd = dev1905Obj['Other Clients Info'][cliIdex]['Client Address'];
												        			var medium = dev1905Obj['Other Clients Info'][cliIdex]['Medium'];
												        			if (node["ethstaInfo"].hasOwnProperty(medium))
																			{
																				node["ethstaInfo"][medium].push(cliAdd);
																			}
																			else
																			{
																				node["ethstaInfo"][medium] = Array(cliAdd);
																			}
												        		}
												        }
												        for(var bhIdx = 0; bhIdx < dev1905Obj['BH Info'].length; bhIdx++)
												        {
																if (dev1905Obj['BH Info'][bhIdx].hasOwnProperty('Backhaul Medium Type'))
												        		{
																	var conadd = dev1905Obj['BH Info'][bhIdx]['connected iface addr'];
												        			var dev_medium = dev1905Obj['BH Info'][bhIdx]['Backhaul Medium Type'];
												        			if (node["devInfo"].hasOwnProperty(conadd))
																	{
																		node["devInfo"][conadd].push(dev_medium);
																	}
																	else
																	{
																		node["devInfo"][conadd] = Array(dev_medium);
																	}
												        		}
												        }
												        return node;
												    }
												    <% else %>
												     function prep_tree_info(dev1905Obj)
												    {
												        var node = {};
												        node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
												        node["alMac"] = dev1905Obj['AL MAC'];
														node["ip"] = dev1905Obj['IP'];
												        node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
												        node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
												        node["staInfo"] = {};
												        
												        for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
												        {
												            for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
												            {
												                if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
												                {
												                    for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
												                    {
												                        var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
																		var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
																		if (node["staInfo"].hasOwnProperty(ssid))
																		{
																			node["staInfo"][ssid].push(staMac);
																		}
																		else
																		{
																			node["staInfo"][ssid] = Array(staMac);
																		}
												                    }
												                }
												            }
												        }
												        return node;
												    }
												    <% end if %>
												    function get_agent_connection_type(tree_info, nIdx)
												    {
												        if(tree_info[nIdx]['devRole'] == "Agent")
												         {
												            for(var conadd in tree_info[nIdx]['devInfo'])
											                  {
											                    var bhIdx;
											                    for(var bhIdx=0; bhIdx < tree_info[nIdx]['devInfo'][conadd].length; bhIdx++)
											                       {
											                        if(tree_info[nIdx]['devInfo'][conadd][bhIdx] == "")
											                            return '';
											                        return '\n' + 'Medium - ' + tree_info[nIdx]['devInfo'][conadd][bhIdx];
											                       }
											                  }
											             }
												        return '';
												    }
												    function get_uplink_tree_info(tree_info, mac)
												    {
												        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
												        {
												            if(tree_info[nIdx]['alMac'] == mac)
												            {
																var agentConType = get_agent_connection_type(tree_info, nIdx);
																<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
												                return '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"';
																<% else %>
																return '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"';
																<% end if %>
												            }
												        }
												        return "";
												    }
												    <% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
												    function disp_topology_vis(tree_info)
												    {
												        var div = document.getElementById("display_tree_vis");
												        div.style.display = "";
												        var topoErrMsg = document.getElementById("topoErrMsgDiv");
												        topoErrMsg.innerHTML = "";
												        var str = "";
												        var numStaPerDev = 0;
												        console.log("TREE INFO VIS = ",tree_info);
												        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
												       	{
												       	  var agentConType = get_agent_connection_type(tree_info, nIdx);
											            if (tree_info[nIdx]['devRole'] == "Agent")
											            {
											                var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
											                if(upLinkNodeStr != "")
											                {
																<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
																str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + '->' + upLinkNodeStr + " ";
																<% else %>
																str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + '->' + upLinkNodeStr + " ";
																<% end if %>
											                  
											                }
											                else
											                {
											                    console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
											                    topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
											                    topoErrMsg.style.display = "";
											                }
											            }
											            for(var ssid in tree_info[nIdx]['wifistaInfo'])
											            {
											                var staIdx;
											                for(var staIdx=0; staIdx < tree_info[nIdx]['wifistaInfo'][ssid].length; staIdx++)
											                {
																<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
															 	 var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
											                    if(mac1stOctet & 0x02)
											                    {
											                        continue;
											                    }
											                    str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + " ";
											                    numStaPerDev += 1;
																<% else %>
															 	 var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
											                    if(mac1stOctet & 0x02)
											                    {
											                        continue;
											                    }
											                    str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + " ";
											                    numStaPerDev += 1;
																<% end if %>											                  
											                }
											            }
											            
											            for(var medium in tree_info[nIdx]['ethstaInfo'])
											            {
											                var ethstaIdx;
											                for(var ethstaIdx=0; ethstaIdx < tree_info[nIdx]['ethstaInfo'][medium].length; ethstaIdx++)
											                {
											                   
																<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
															  	var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
											                    if(mac1stOctet & 0x02)
											                    {
											                        continue;
											                    }
											                    str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n'  + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + " ";
											                    numStaPerDev += 1;
																<% else %>
															 	var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
											                    if(mac1stOctet & 0x02)
											                    {
											                        continue;
											                    }
											                    str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + agentConType + '"' + " ";
											                    numStaPerDev += 1;
																<% end if %>
											                }
											            }
											            
											            if (numStaPerDev == 0 && tree_info.length == 1 &&
											                (tree_info[nIdx]['devRole'] == "Controller" ||
											                tree_info[nIdx]['devRole'] == "Agent"))
											            {
															<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
															str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
															<% else %>
															str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
															<% end if %>
											              
											            }
											        }
												        console.log("TREE INFO str = ",str);
												        
												        var NewDOTstring = "dinetwork{"+str+"}";
												        
												        var parsedData = vis.network.convertDot(NewDOTstring);
												        
												        for(var count=0;count<parsedData.nodes.length;count++)
												        {
												            console.log("NODE LABEL = ",parsedData.nodes[count].label);
												            if(parsedData.nodes[count].label.startsWith('Agent'))
												            {
												                parsedData.nodes[count].color='Orange';
												            }
												            else if(parsedData.nodes[count].label.startsWith('STA'))
												            {
												                parsedData.nodes[count].color='Green';
												            }
												            else
												            {
												                parsedData.nodes[count].shape='box';
												            }
												        }
												        
												        var data = {
												          nodes: parsedData.nodes,
												          edges: parsedData.edges
												        }
												        var options = parsedData.options;
												        
												        // create a network
												        var network = new vis.Network(div, data, options);
												        network.setSize('600px','600px');
												    }
												    <% else %>
												    function disp_topology_vis(tree_info)
												    {
												        var div = document.getElementById("display_tree_vis");
												        div.style.display = "";
												        var topoErrMsg = document.getElementById("topoErrMsgDiv");
												        topoErrMsg.innerHTML = "";
												        var str = "";
												        var numStaPerDev = 0;
												        console.log("TREE INFO VIS = ",tree_info);
												        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
												       	{
												            if (tree_info[nIdx]['devRole'] == "Agent")
												            {
												                var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
												                if(upLinkNodeStr != "")
												                {
																	<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
																	str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
																	<% else %>
																	str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
																	<% end if %>
												                }
												                else
												                {
												                    console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
												                    topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
												                    topoErrMsg.style.display = "";
												                }
												            }
												            for(var ssid in tree_info[nIdx]['staInfo'])
												            {
												                var staIdx;
												                for(var staIdx=0; staIdx < tree_info[nIdx]['staInfo'][ssid].length; staIdx++)
												                {
																	<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
																    var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
												                    if(mac1stOctet & 0x02)
												                    {
												                        continue;
												                    }
												                    str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
																	<% else %>
																    var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
												                    if(mac1stOctet & 0x02)
												                    {
												                        continue;
												                    }
												                    str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
																	<% end if %>											                   
												                    numStaPerDev += 1;
												                }
												            }
												            
												            if (numStaPerDev == 0 && tree_info.length == 1 &&
												                (tree_info[nIdx]['devRole'] == "Controller" ||
												                tree_info[nIdx]['devRole'] == "Agent"))
												            {
																<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
															   str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
																<% else %>
															   str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
																<% end if %>
												            }
												        }
												        console.log("TREE INFO str = ",str);
												        
												        var NewDOTstring = "dinetwork{"+str+"}";
												        
												        var parsedData = vis.network.convertDot(NewDOTstring);
												        
												        for(var count=0;count<parsedData.nodes.length;count++)
												        {
												            console.log("NODE LABEL = ",parsedData.nodes[count].label);
												            if(parsedData.nodes[count].label.startsWith('Agent'))
												            {
												                parsedData.nodes[count].color='Orange';
												            }
												            else if(parsedData.nodes[count].label.startsWith('STA'))
												            {
												                parsedData.nodes[count].color='Green';
												            }
												            else
												            {
												                parsedData.nodes[count].shape='box';
												            }
												        }
												        
												        var data = {
												          nodes: parsedData.nodes,
												          edges: parsedData.edges
												        }
												        var options = parsedData.options;
												        
												        // create a network
												        var network = new vis.Network(div, data, options);
												        network.setSize('600px','600px');
												    }
												    <% end if %>
												    function toggle_disp_dev_table(btn)
												    {
												        var div = document.getElementById("display_all_1905_dev_info_div");
												        var btn_str = btn.innerHTML;
												        if(btn_str.startsWith('显示'))
												        {
												            btn.innerHTML = '隐藏组网信息详情';
												            div.style.display = "";
												            if(div.children.length == 0)
												            {
												                div.innerHTML = "";
												                var b = document.createElement("BIG");
												                var s = document.createElement("STRONG");
												                s.setAttribute("class", "alert-message");
												                var t = document.createTextNode("Run-time topology information has not been received yet! Please wait.");
												                s.appendChild(t);
												                b.appendChild(s);
												                div.appendChild(b);
												            }
												        }
												        else
												        {
												            btn.innerHTML = '显示组网信息详情';
												            div.style.display = "none";
												        }
												    }
												    
												    function get_dev_role_string(devRole)
												    {
												        switch(parseInt(devRole))
												        {
												            case 1:
												                return 'Controller';
												            case 2:
												                return 'Agent';
												            default:
												                return 'Not Configured';
												        }
												    }
												    
												    function get_run_time_topology_submit()
												    {
												    		location.href = '/cgi-bin/wifi_map_runtime_topology.asp';
												    }
												    
												    function get_run_time_topology_cb(rsp)
												    {
												        try
												        {
												            var r = JSON.parse(rsp);
												            if(r.status == "SUCCESS")
												            {
												            		var tmp_jsTopoInfo = r.luaTopologyInfo;
												            		tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
												            		tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
												                var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
												                document.getElementById("display_all_1905_dev_info_div").innerHTML = "";
												                document.getElementById("display_tree_vis").innerHTML = "";
												                draw_topology_table(jsTopoInfo);
												            }
												            else
												            {
												                console.log("Failed to get Topology Info!\nStatus: ",r.status);
												            }
												            //setTimeout(get_run_time_topology_submit, 15000);
												        }
												        catch(e)
												        {
												            console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
												            setTimeout(get_run_time_topology_submit, 15000);
												        }
												    }
												    
														function get_run_time_topology()
												    {
												        document.getElementById("topoErrMsgDiv").style.display = "none";
												        document.getElementById("display_all_1905_dev_info_div").style.display = "none";
												        document.getElementById("display_tree_vis").style.display = "none";
												        document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = true;
												        document.getElementById("toggle_all_1905_dev_info_btn").disabled = true;
												        document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = '显示组网信息详情';
												        document.getElementById("getTopoInfoMsgDiv").style.display = "";
												        
												        var x_response = JSO_get_runtime_topology();
												        document.getElementById('getTopoInfoMsgDiv').style.display = 'none';
												        get_run_time_topology_cb(x_response);
												        document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = false;
												        document.getElementById("toggle_all_1905_dev_info_btn").disabled = false;
												    }
												    
												    function  LoadFrame()
														{
															var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
															set_action(query_string);
														}
														
														get_run_time_topology();
												</script>
											</div>
										</TD>	
									</TR>
									<TR>
										<TD colspan='2'>
											<P style="display:none; align:center">
												<input type="button" id="btnOK" name="BUTTON" onclick='doSave()' value="确定">&nbsp;&nbsp;
												<input type="button" id="btnCancel" name="btnCancel" onclick='RefreshPage()' value="取消">
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
