<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>EasyMesh Back-haul Link Metrics at Controller</TITLE>
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
						<li class="TSD" name="EasyMesh_Back_haul_Link_Metrics_li" id="EasyMesh_Back_haul_Link_Metrics_li">EasyMesh Back-haul Link Metrics at Controller</li>
					</ul>
				</TD>
				<TD class='w-828'>
					<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top">
							<div id="EasyMesh_Back_haul_Link_Metrics_item">
								<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
									<TBODY>
									<TR>
										<TD>
												<div id="maincontent" class="container">
													<div class="alert-message" id="get_bh_link_metrics_msg_div">
														<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
														<big><strong>Retrieving Back-haul Link Metrics at Controller!</strong></big>
													</div>
													<div class="alert-message error" style="display:none">
														<span><strong id="bh_link_metrics_err_msg_div"></strong></span>
													</div>
													<div id="bh_link_metrics_display"></div>
						
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
													    	
															function draw_bh_link_metrics_table(jsTopoInfo)
															{
															    var topoInfoArr = jsTopoInfo['topology information'];
															    if(!(topoInfoArr instanceof Array))
															    {
															        console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
															        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															        document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Incorrect TopologyInfo: Value of topology information is not an Array!<br /> UI will retry in a short while.";
															        document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "";
															        return;
															    }
															    var idx_1905;
															    for(idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
															    {
															        var obj_1905 = topoInfoArr[idx_1905];
															        if(!obj_1905.hasOwnProperty('Device role') ||
															            parseInt(obj_1905['Device role']) != 1)
															        {
															            continue;
															        }
															        if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']))
															        {
															        		continue;
															        }
															        if(!obj_1905.hasOwnProperty('backhaul link metrics'))
															        {
															            console.log("No backhaul link metrics in Controller's Topology Information! Topology:",obj_1905);
															            document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															            document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "No backhaul link metrics in Controller's Topology Information!<br /> UI will retry in a short while.";
															            document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "";
															            return;
															        }
															        obj_1905 = prep_bssinfo(obj_1905);
															        
															        var bhMetricsDb = {};
															        bhMetricsDb['backhaul link metrics'] = obj_1905['backhaul link metrics'];
															        
															        var bh_link_metrics_tbl = document.createElement("TABLE");
															        bh_link_metrics_tbl.setAttribute("class", "cbi-section-table");
															        var dev1905div = document.createElement("div");
															        dev1905div.setAttribute("class", "table1_head");
															        var dev1905fb = document.createElement("b");
															        var dev1905a = document.createElement("A");
															        var dev1905text = document.createTextNode("Back-haul Link Metrics at Controller with AL-MAC " + obj_1905['AL MAC']);
															        dev1905a.setAttribute("href", "#");
															        dev1905a.appendChild(dev1905text);
															        dev1905fb.appendChild(dev1905a);
															        dev1905div.appendChild(dev1905fb);
															        document.getElementById("bh_link_metrics_display").appendChild(dev1905div);
															        
															        set_max_cellspan(bhMetricsDb);
															        obj_loop(bh_link_metrics_tbl, null, bhMetricsDb);
															        
															        document.getElementById("bh_link_metrics_display").appendChild(bh_link_metrics_tbl);
															        document.getElementById("bh_link_metrics_display").style.display = "";
															        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															        break;
															    }
															    if(idx_1905 == topoInfoArr.length)
															    {
															        console.log("No Controller found in Topology Information!",topoInfoArr);
															        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															        document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "No Controller found in Topology Information!<br /> UI will retry in a short while.";
															        document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "";
															        return;
															    }
															}
															
															function checkWebStatus()
															{
																	location.href = '/cgi-bin/wifi_map_bh_link_metrics.asp';
															}
															
															function get_run_time_topology()
															{
															    var x_response = JSO_get_runtime_topology();
															    {
															        try
															        {
															            var r = JSON.parse(x_response);
															            if(r.status == "SUCCESS")
															            {
															            		var tmp_jsTopoInfo = r['luaTopologyInfo'];
															        				tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
															        				tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
															            		var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
															                draw_bh_link_metrics_table(jsTopoInfo);
															            }
															            else
															            {
															                console.log("Failed to get Topology Info!\nStatus: ",r.status);
															                document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															                document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Failed to get Topology Info!<br />Status: " + r.status + "<br /> UI will retry in a short while.";
															                document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "";
															            }
															        }
															        catch(e)
															        {
															            console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
															            document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
															            document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Incorrect response! Failed to get Topology Info!<br />" + e.name + " " + e.message + "<br /> UI will retry in a short while.";
															            document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "";
															        }
															        finally
															        {
															            setTimeout(checkWebStatus, 60000);
															        }
															    }
															}
																														
															function get_bh_link_metrics()
															{
															    document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "";
															    document.getElementById("bh_link_metrics_err_msg_div").parentNode.parentNode.style.display = "none";
															    document.getElementById("bh_link_metrics_display").style.display = "none";
															    document.getElementById("bh_link_metrics_display").innerHTML = "";
															    document.getElementById("get_bh_link_metrics_msg_div").style.display = "";
															    
															    get_run_time_topology();
															}
															
															function  LoadFrame()
															{
																var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
																set_action(query_string);
															}
															
															get_bh_link_metrics();
													</script>
												</div>
										</TD>	
									</TR>
									<TR>
										<TD colspan='2'>
											<P style="display: none; align:center">
												<IMG id=btnOK name="BUTTON" onclick='doSave()' src="/img/ok.gif" border=0>&nbsp;&nbsp;
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
</BODY>
</HTML>
