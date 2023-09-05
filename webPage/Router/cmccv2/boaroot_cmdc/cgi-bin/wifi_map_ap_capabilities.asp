<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>EasyMesh AP Capabilities</TITLE>
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
					<ul class="TRD">
						<li class="TSD" name="EasyMesh_AP_Capabilities_item_title" id="EasyMesh_AP_Capabilities_item_title">EasyMesh AP Capabilities</li>
					</ul>
				</TD>
				<TD class='w-828'>
					<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top">
							<div id="EasyMesh_AP_Capabilities_item">
								<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
									<TBODY>
									<TR>
										<TD>
											<div id="maincontent" class="container">
													<div width="auto" id="ap_db_display"></div>
													<script type="text/javascript">
															
															var max_cellspan = 2;
															
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
												    
															function draw_ap_db_table(jsTopoInfo)
															{
															    var topoInfoArr = jsTopoInfo['topology information'];
															    if(!(topoInfoArr instanceof Array))
															    {
															        console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
															        return;
															    }
															    
															    for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
															    {
															    		var obj_1905 = topoInfoArr[idx_1905];
															      	if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']))
															      	{
															      			continue;
															      	}
															      	obj_1905 = prep_bssinfo(obj_1905);
															      	
															      	var ap_db_tbl = document.createElement("TABLE");
															        ap_db_tbl.setAttribute("height", "100%");
															        ap_db_tbl.setAttribute("cellSpacing", "0");
															        ap_db_tbl.setAttribute("cellPadding", "0");
															        ap_db_tbl.setAttribute("border", "1");
															        
															        var ap_db = {};
															        ap_db["Radio Info"] = topoInfoArr[idx_1905]['Radio Info'];
															        
															        var dev1905div = document.createElement("div");
															        dev1905div.setAttribute("class", "table1_head");
															        var dev1905fb = document.createElement("b");
															        var dev1905a = document.createElement("A");
															        var dev1905text = document.createTextNode("Radio Info of 1905 Device - " + (idx_1905 + 1));
															        dev1905a.setAttribute("href", "#");
															        dev1905a.appendChild(dev1905text);
															        dev1905fb.appendChild(dev1905a);
															        dev1905div.appendChild(dev1905fb);
															        document.getElementById("ap_db_display").appendChild(dev1905div);
															        
															        set_max_cellspan(ap_db);
															        obj_loop(ap_db_tbl, null, ap_db);
															        
															        document.getElementById("ap_db_display").appendChild(ap_db_tbl);
															    }
															}
															
															function checkWebStatus()
															{
																	location.href = '/cgi-bin/wifi_map_ap_capabilities.asp';
															}
															
															function get_ap_db_cb(rsp)
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
															            document.getElementById("ap_db_display").innerHTML = "";
															            draw_ap_db_table(jsTopoInfo);
															        }
															        else
															        {
															            console.log("Failed to get AP DB!\nStatus: ",r.status);
															        }
															        setTimeout(checkWebStatus, 10000);
															    }
															    catch(e)
															    {
															        console.log("Incorrect response! Failed to get AP DB!",e.name,e.message);
															        setTimeout(checkWebStatus, 10000);
															    }
															}
															
															function get_ap_db()
															{
															  	document.getElementById("ap_db_display").innerHTML = "";
																	var x_response = JSO_get_runtime_topology();
																	get_ap_db_cb(x_response);
															}
															
															function LoadFrame()
															{
																var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
																set_action(query_string);
															}
															
															get_ap_db();
													</script>
											</div>
										</TD>	
									</TR>
									<TR>
										<TD colspan='2'>
											<P style="display: none; align=center">
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
</BODY>
</HTML>
