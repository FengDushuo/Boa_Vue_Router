<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>EasyMesh Client Capabilities</TITLE>
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
						<li class="TSD" name="EasyMesh_Client_Capabilities_li" id="EasyMesh_Client_Capabilities_li">EasyMesh Client Capabilities</li>
					</ul>
				</TD>
				<TD class='w-828'>
					<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
					<TR>
						<TD width=7 background=/img/panel3.gif>　</TD>
						<TD valign="top">
							<div id="EasyMesh Client Capabilities_item">
								<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
									<TBODY>
									<TR>
										<TD>
											<div id="maincontent" class="container">
					
												<div id="cli_db_display" style="overflow-x: scroll;"></div>
					
												<script type="text/javascript">
														function JSO_get_client_capabilities()
														{
																var ret = "<% tcWebApi_MeshJsonHook("mesh_get_client_capabilities") %>";
																return ret;
														}
														
														function draw_cli_db_table(g_cli_db)
														{
														    var disp_cli_idx = 1;
														    var cli_db = g_cli_db['cli_db'];
														    var cdb_tbl = document.createElement("TABLE");
														    cdb_tbl.setAttribute("class", "cbi-section-table-scroll");
														    var row, cell, th, th_txt;
														    row = cdb_tbl.insertRow(-1);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("No.");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("MAC");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("BSSID");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Capability");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Phy Mode");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Max. BW 0");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Max. BW 1");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Spatial Streams");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Supported Bands");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    th = document.createElement("TH");
														    th_txt = document.createTextNode("Supported Channels");
														    th.appendChild(th_txt);
														    row.appendChild(th);
														    
														    for(var cli_idx = 0; cli_idx < parseInt(g_cli_db['num_clis']); cli_idx++)
														    {
														        if(cli_db[cli_idx]['BSSID'] == '00:00:00:00:00:00')
														        {
														            continue;
														        }
														        row = cdb_tbl.insertRow(-1);
														        cell = row.insertCell(-1);
														        cell.innerHTML = disp_cli_idx++;
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['MAC'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['BSSID'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Capability'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Phy Mode'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Max. Bandwidth 0'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Max. Bandwidth 1'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Spatial Stream'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Known Band'];
														        cell = row.insertCell(-1);
														        cell.innerHTML = cli_db[cli_idx]['Known Channels'];
														    }
														    if(cdb_tbl.rows.length == 1)
														    {
														        row = cdb_tbl.insertRow(-1);
														        cell = row.insertCell(-1);
														        cell.colSpan = cdb_tbl.rows[0].cells.length;
														        cell.style.textAlign = "center";
														        cell.innerHTML = "Client DB is empty!";
														    }
														    document.getElementById("cli_db_display").appendChild(cdb_tbl);
														}
														
														function checkWebStatus()
														{
																location.href = '/cgi-bin/wifi_map_client_capabilities.asp';
														}
														
														function get_client_db_cb(rsp)
														{
														    try
														    {
														        var r = JSON.parse(rsp);
														        if(r.status == "SUCCESS")
														        {
														            document.getElementById("cli_db_display").innerHTML = "";
														            draw_cli_db_table(r);
														        }
														        else
														        {
														            console.log("Failed to get Client DB!\nStatus: ",r.status);
														        }
														        setTimeout(checkWebStatus, 10000);
														    }
														    catch(e)
														    {
														        console.log("Incorrect response! Failed to get Client DB!",e.name,e.message);
														        setTimeout(checkWebStatus, 10000);
														    }
														}
														
														function get_client_db()
														{
																document.getElementById("cli_db_display").innerHTML = "";
																var x_response = JSO_get_client_capabilities();
																get_client_db_cb(x_response);
														}
														
														function  LoadFrame()
														{
															var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
															set_action(query_string);
														}
														
														get_client_db();
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
