<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if

if Request_Form("Action_Flag") = "1" then

	if Request_Form("resetToDefaultEasyMesh_Flag") = "1" then
		TCWebApi_constSet("Mesh_action", "load_default_setting", "1")
		TCWebApi_commit("Mesh_action")
	end if
			
	if Request_Form("Enable_Flag") = "1" then
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

    TCWebApi_save()
end if

if Request_Form("SaveAll_Flag") = "1" then

    if Request_Form("Enable_Flag") = "1" then
        TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","1")
        TCWebApi_Set("Mesh_dat", "MapEnable","Enable_Flag")
		TCWebApi_Set("Mesh_common", "SteerEnable", "SteerEnable")
		TCWebApi_Set("Mesh_common", "DeviceRole", "DeviceRole")
		TCWebApi_Set("Info_Mesh", "DeviceRole", "DeviceRole")
    
        TCWebApi_commit("Mesh_dat")

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
        TCWebApi_Set("Mesh_dat", "MapEnable","Enable_Flag")

		TCWebApi_commit("Mesh_dat")
	end if

    TCWebApi_save()
end if      
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>Mesh管理</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
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
<script>
    function doRefresh()
    {
        location.href='/cgi-bin/logout.cgi';
    }

    var rebootEnable = "<% tcWebApi_get("System_Entry","reboot_type","s") %>";
    if (rebootEnable == 1) {
        setTimeout(function () {
            showLoading(60, "upgrade", "设备正在重启，请耐心等待……");
        }, 1000);
        setTimeout(doRefresh, 61*1000);
    }
</script>
<style>
    table.major td.content {
        height: 528px;
    }
    a {
	    text-decoration:none;
	}
    table {
        border-collapse: collapse;
        border-style: hidden;
    }
    .more {
        width: 100%;
        height: 24px;
        font-size: 14px;
        color: #787E7E;
        line-height: 24px;
        letter-spacing: 1px;
        text-align: right;
    }
</style>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
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
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
	<FORM name=RebootForm action="/cgi-bin/mesh_page.asp" method="post">
        <INPUT type="HIDDEN" name="rebootflag" value="0">
        <INPUT type="HIDDEN" name="restoreFlag" value="<% tcWebApi_get("System_Entry","reboot_type","s") %>">

        <script>
            function Reboot()
            {
                confirm("确认重启？", function(ret) {
                    if(ret)
                    {
                        document.RebootForm.rebootflag.value = "1";
                        document.RebootForm.restoreFlag.value = "1";
                        setTimeout(function() {
                            document.RebootForm.submit();
                        }, 1000);
                    }
                });
            }
            </script>
        <div class="in_welcom">
            <div class="fl" style="font-size: 0;" onclick="Reboot()">
                <img src="../img/icon_reboot.png">
                <span>重启设备</span>
            </div>
            <div class="fl" style="margin-left: 24px;font-size: 0;" onclick="location.href='/cgi-bin/logout.cgi'">
                <img src="../img/icon_drop_out.png">
                <a>退出</a>
            </div>
		<input id="Selected_Menu" type="hidden" value="Mesh管理" name="Selected_Menu">
	</div>
</FORM>
<% else %>
<div class="in_welcom" >
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="应用->MESH基础配置" name="Selected_Menu"></TD>
</div>


<% end if %>
</div>
<br/>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
	<TBODY>
		<TR>
			<TD class="header" style="height: 50px;">
				<TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
					<TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
							<TR id="MenuArea_L0">
								<TD id=MenuArea_L1></TD>
                        	</TR>
<% else %>
							<TD id=MenuArea_L1></TD>
<% end if %>
					</TBODY>
				</TABLE>
			</TD>
		</TR>  
		<TR>
			<TD class="content">
                <script>
                    var mesh_info = [];
                    function LoadFrame() {
                        MapEnable();
                    }

                    function MapEnableClick() {
                        var _val = getCheckVal('Mapenable');
                        if (_val == 1) {
                            <% if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then %>
                                var _val = getCheckVal('Mapenable');
                                if (_val == 1) {
                                    alert("当前上网模式为中继模式，请切换为其他模式后再开启MESH！");
                                    return;
                                }
                            <% end if %>
                            document.ConfigForm.Enable_Flag.value = "1";
                        }
                        else {
                            document.ConfigForm.Enable_Flag.value = "0";
                        }
                        <% if tcWebApi_get("WebCustom_Entry", "isInsideAgentSupport", "h") <> "Yes"  then %>
                        <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>

                        <% else %>
                            setText('Change_Flag', 1);
                        <% end if %>
                        <% end if %>
                        setText('SaveAll_Flag', 1);
                        document.ConfigForm.submit();
						var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
						set_action(query_string);
                    }

                    function MapEnable() {
                        var _val = getCheckVal('Mapenable');
                        if (_val == 1) {
                            document.ConfigForm.Enable_Flag.value = "1";
                            document.getElementById("device_role").style.display = "";
                            document.getElementById("trigger_title").style.display = "";
                            document.getElementById("trigger_btn").style.display = "";
                        }
                        else {
                            document.ConfigForm.Enable_Flag.value = "0";
                            document.getElementById("device_role").style.display = "none";
                            document.getElementById("trigger_title").style.display = "none";
                            document.getElementById("trigger_btn").style.display = "none";
                        }
                    }

                    function triggerMultiApOnBoarding() {
                        /*Only Wi-Fi On-boarding*/
                        var bh_val = 1;
                        if (0 == bh_val) {
                            setText('wifi_trigger_onboarding_Flag', 0);
                            setText('ether_trigger_onboarding_Flag', 1);
                        }
                        else {
                            setText('wifi_trigger_onboarding_Flag', 1);
                            setText('ether_trigger_onboarding_Flag', 0);
                        }
                        setText('Action_Flag', 1);
                        document.ConfigForm.submit();
                    }

                    /*检查数据是否重复*/
                    function checkSameMac(list, type, mac) {
                        mac = mac.toLocaleLowerCase();
                        var ret = null;
                        var arr = [];
                        for (var i = 0; i < list.length; i++) {
                            arr.push(list[i][type].toLocaleLowerCase());
                        }
                        ret = arr.indexOf(mac);
                        if (ret === -1) { //不重复
                            return {};
                        }
                        else {
                            return list[ret];
                        }
                    }
                </script>
                <FORM name=ConfigForm action="/cgi-bin/mesh_page.asp" method="post">
                    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
                        <TBODY>
                            <TR>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById ('Selected_Menu').value);
                                </SCRIPT>			
                                <TD valign="bottom">
<% else %>
		                                <TD id=MenuArea_L2>
                                    <ul class="TRD">
                                    <li class="TSD">MESH基础配置</li>
                                    </ul>
							    </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById ('Selected_Menu').value);
                                </SCRIPT>			
                                <TD valign="top">					
<% end if %>

                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 220px;">
                                        <tbody>
                                            <TR>
                                                <TD>
                                                    <input type="hidden" name="Enable_Flag" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>">
                                                    <input type="hidden" name="SaveAll_Flag" value="0" />
                                                    <input type="hidden" name="Action_Flag" value="0" />
                                                    <input type="hidden" name="SteerEnable" value="<% tcWebApi_get("Mesh_common", "SteerEnable", "s") %>" /> 
                                                    <input type="hidden" name="DeviceRole" value="<% tcWebApi_get("Info_Mesh", "DeviceRole", "s") %>" /> 
                                                    <input type="hidden" name="resetToDefaultEasyMesh_Flag" value="0" />
                                                    <input type="hidden" name="wifi_trigger_onboarding_Flag" value="0" />
                                                    <input type="hidden" name="ether_trigger_onboarding_Flag" value="0" />
                                                    <input type="hidden" name="MeshTriggerFlag" value="<% tcWebApi_get("Mesh_Common","MeshTriggerFlag","s") %>" />
                                                    <input type="hidden" name="Change_Flag" value="0" />
                                                    <input type="hidden" name="CleanApclibh_Flag" value="0" />
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD><P class="font-weight">Mesh组网</P></TD>
                                                <TD>
                                                    <input class="input-onoff" id=Mapenable onclick="MapEnableClick()" type="checkbox" name="Mapenable" <%if tcWebApi_get("Mesh_dat","MapEnable","h")="1" then asp_Write("checked") end if%>>
                                                </TD>
                                            </TR>
                                        </tbody>
                                    </TABLE>
                                    <div style="width: 580px;margin: 23px 0 0 220px;">
                                        <p class="font-help" style="width: 100%;margin-left: 12px;">开关开启后，短按（0.2-3秒）1次Link键触发Mesh组网。</p>
                                        <div class="advanceTips" style="margin-left: 14px;">
                                            <span onclick="showHelp()">页面帮助</span>
                                        </div>
                                        <div class="helpDesc" style="display: none;padding-left: 30px;">
                                            <div class="help-title">支持有线组网和无线组网两种方式，在拓扑里面可以查看Mesh组网状态。</div>
                                            <div class="help-title">一、有线组网方式：</div>
                                            <div class="help-title" style="text-indent: 15px;">用网线将从路由器的WAN口连接到主路由器的任一LAN口，30秒内，分别按下主路由器和从路由器面板上的LINK按键，待从路由器的指示灯变为绿色常亮，即表明组网成功。</div>
                                            <div class="help-title">二、无线组网方式</div>
                                            <div class="help-title" style="text-indent: 15px;">30秒内，分别按下主路由器和从路由器面板上的LINK按键，当从路由器指示灯从绿色闪烁变为绿色常亮，即表明组网成功。</div>
                                        </div>
                                    </div>
                                    <TABLE  id="info_show" cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 220px;display: none;">
                                        <tbody>
                                            <TR id="device_role">
                                                <TD colspan="2" style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
                                                    <div class="font-weight" style="margin-bottom: 24px;">当前组网角色：
                                                        <script>
                                                            var devRole = "<% tcWebApi_get("Info_Mesh","DeviceRole","s") %>";
                                                            if (!devRole) {
                                                                console.log("Incorrect Device Role", devRole);
                                                                document.write("");
                                                            }
                                                            switch (parseInt(devRole)) {
                                                                case 0: // Auto
                                                                    document.write("自适应");
                                                                    break;
                                                                case 1: // Controller
                                                                    document.write("主路由");
                                                                    break;
                                                                case 2: // Agent
                                                                    document.write("从路由");
                                                                    break;
                                                                default:
                                                                    document.write("");
                                                                    break;
                                                            }
                                                        </script>
                                                    </div>
                                                </TD>
                                            </TR>
                                            <TR id="trigger_title">
                                                <TD colspan="2">
                                                    <div class="font-weight" style="margin-top: 16px;">Mesh组网拓扑图</div>
                                                    </TD>
                                            </tr>
                                            <tr id="trigger_btn">
                                                <td colspan="2">
                                                    <div style="text-align: center;">
                                                        <img src="../img/mesh_btn.png" alt="">
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- <tr id="trigger_btn">
                                                <td colspan="2">
                                                    <P
                                                        style="margin-top: 45px;margin-left: 142px;">
                                                        <input type="button" id="btnOK" style="margin-bottom: 5px;" onclick="triggerMultiApOnBoarding()" value="开始组网">
                                                    </P>
                                                </td>
                                            </tr>
                                            <TR id="trigger_btn_tips">
                                                <TD></TD>
                                                <TD>
                                                    <p class="font-help" style="width: 254px;text-align: center;margin: 0;">点击按钮开始触发MESH组网</p>
                                                </TD>
                                            </TR> -->
                                            <TR>
                                                <TD>
                                                    <div id="maincontent" class="container">
                                                        <div class="alert-message" id="getTopoInfoMsgDiv">
                                                        </div>
                                                        <div class="alert-message error" style="display:none">
                                                        <span><strong id="topoErrMsgDiv"></strong></span>
                                                        </div>
                                                        <button id="toggle_all_1905_dev_info_btn" class="input-large hide" onclick="toggle_disp_dev_table(this)" style="margin-left: 24px;" disabled="disabled">显示组网信息详细信息</button>
                                                        <div id="display_tree_vis" style="width: 80%; height: 600px;">
                                                        </div>
                                                        <p id="more-txt" class="more" style="padding-left: 40px;cursor: pointer;text-align: center;margin-bottom: 60px;display: none;">点击查看更多</p>
                                                        <div id="display_dev_info_div" style="margin-bottom: 81px;margin-left: -69px;width: 120%;display: none;">
                                                            <p class="more" style="text-align: right;">点击路由即可查看对应下挂设备信息</p>
                                                            <div class="table-outer" style="margin-top: 8px;">
                                                                <table>
                                                                    <thead>
                                                                        <tr class="trStyle2">
                                                                            <th class="tdWidth2" style="width: 30%;">设备名称</th>
                                                                            <th class="tdWidth2" style="width: 15%;">连接方式</th>
                                                                            <th class="tdWidth2" style="width: 15%;">连接质量</th>
                                                                            <th class="tdWidth2" style="width: 20%;">IP地址</th>
                                                                            <th class="tdWidth2" style="width: 20%;">MAC地址</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="dev_info_list">
                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div id="display_all_1905_dev_info_div" style="display:none"></div>
                            
                                                        <form method="post" name="cbi" action="/cgi-bin/wifi_multi_topology.asp" autocomplete="off">
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
                                                                    
                                                                    var dev1905div = document.createElement("DIV");
                                                                    dev1905div.setAttribute("class", "table-outer");
                                                                    var dev1905tbl = document.createElement("TABLE");
                                                                    dev1905tbl.setAttribute("class", "cbi-section-table");
                                                                    dev1905div.appendChild(dev1905tbl);
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
                                                                    
                                                                    document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905div);
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
                                                                node["iP"] = dev1905Obj['IP'];
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
                                                                                                        var rfBand = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]["Medium"];
                                                                                                        if (node["wifistaInfo"].hasOwnProperty(ssid))
                                                                                                        {
                                                                                                            node["wifistaInfo"][rfBand].push(staMac);
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            node["wifistaInfo"][rfBand] = Array(staMac);
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
                                                                node["iP"] = dev1905Obj['IP'];
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
                                                            function get_uplink_tree_info(tree_info, mac)
                                                            {
                                                                for(var nIdx=0; nIdx < tree_info.length; nIdx++)
                                                                {
                                                                    if(tree_info[nIdx]['alMac'] == mac)
                                                                    {
                                                                        <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                        return '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
                                                                        <% else %>
                                                                        return '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
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
                                                                mesh_info.push(tree_info[nIdx]);
                                                                if (tree_info[nIdx]['devRole'] == "Agent")
                                                                {
                                                                    var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
                                                                    if(upLinkNodeStr != "")
                                                                    {
                                                                        <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                        str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
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
                                                                for(var ssid in tree_info[nIdx]['wifistaInfo'])
                                                                {
                                                                    var staIdx;
                                                                    for(var staIdx=0; staIdx < tree_info[nIdx]['wifistaInfo'][ssid].length; staIdx++)
                                                                    {
                                                                        // <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                        // var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
                                                                        // str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                        // numStaPerDev += 1;
                                                                        // <% else %>
                                                                        // var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
                                                                        // str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                        // numStaPerDev += 1;
                                                                        // <% end if %>
                                                                    }
                                                                }
                                                                
                                                                for(var medium in tree_info[nIdx]['ethstaInfo'])
                                                                {
                                                                    var ethstaIdx;
                                                                    for(var ethstaIdx=0; ethstaIdx < tree_info[nIdx]['ethstaInfo'][medium].length; ethstaIdx++)
                                                                    {
                                                                        // <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                        // var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
                                                                        // str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n'  + "IP " + tree_info[nIdx]['iP'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                        // numStaPerDev += 1;
                                                                        // <% else %>
                                                                        // var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
                                                                        // str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                        // numStaPerDev += 1;
                                                                        // <% end if %>
                                                                    }
                                                                }
                                                                
                                                                if (numStaPerDev == 0 && tree_info.length == 1 &&
                                                                    (tree_info[nIdx]['devRole'] == "Controller" ||
                                                                    tree_info[nIdx]['devRole'] == "Agent"))
                                                                {
                                                                    <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                    str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                    <% else %>
                                                                    str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                    <% end if %>
                                                                }
                                                            }
                                                                console.log("TREE INFO str = ",str);
                                                                
                                                                var NewDOTstring = "dinetwork{"+str+"}";
                                                                var agentCount = 0;
                                                                
                                                                var parsedData = vis.network.convertDot(NewDOTstring);
                    
                                                                for(var count=0;count<parsedData.nodes.length;count++)
                                                                {
                                                                    console.log("NODE LABEL = ",parsedData.nodes[count].label);

                                                                    if(parsedData.nodes.length == 1) {
                                                                        if(parsedData.nodes[count].label.startsWith('Controller')) {
                                                                            // 使用图片作为节点
                                                                            parsedData.nodes[count].shape = "image";
                                                                            // 图片URL
                                                                            parsedData.nodes[count].image="../img/zj2.png";
                                                                            parsedData.nodes[count].x = 0;
                                                                            parsedData.nodes[count].y = -150;
                                                                            parsedData.nodes[count].physics = false;
                                                                            // 边框宽度
                                                                            parsedData.nodes[count].borderWidth = 30;
                                                                            // 选中后的边框宽度
                                                                            parsedData.nodes[count].borderWidthSelected = 30;
                                                                        }
                                                                        else if(parsedData.nodes[count].label.startsWith('Agent'))
                                                                        {
                                                                            parsedData.nodes[count].shape = "image";
                                                                            parsedData.nodes[count].image="../img/agent2.png";
                                                                            parsedData.nodes[count].x = 0;
                                                                            parsedData.nodes[count].y = -150;
                                                                            parsedData.nodes[count].physics = false;
                                                                            parsedData.nodes[count].borderWidth = 10;
                                                                            parsedData.nodes[count].borderWidthSelected = 10;
                                                                        }
                                                                        parsedData.nodes[count].font = {
                                                                            size: 10
                                                                        };
                                                                    }
                                                                    else {
                                                                        if(parsedData.nodes[count].label.startsWith('Controller')) {
                                                                            // 使用图片作为节点
                                                                            parsedData.nodes[count].shape = "image";
                                                                            // 图片URL
                                                                            parsedData.nodes[count].image="../img/zj.png";
                                                                            parsedData.nodes[count].x = 0;
                                                                            parsedData.nodes[count].y = -500;
                                                                            parsedData.nodes[count].physics = false;
                                                                            // 边框宽度
                                                                            parsedData.nodes[count].borderWidth = 30;
                                                                            // 选中后的边框宽度
                                                                            parsedData.nodes[count].borderWidthSelected = 30;
                                                                        }
                                                                        else if(parsedData.nodes[count].label.startsWith('Agent'))
                                                                        {
                                                                            parsedData.nodes[count].shape = "image";
                                                                            parsedData.nodes[count].image="../img/agent.png";
                                                                            parsedData.nodes[count].x = 0 + 150*agentCount;
                                                                            parsedData.nodes[count].y = 0;
                                                                            parsedData.nodes[count].borderWidth = 10;
                                                                            parsedData.nodes[count].borderWidthSelected = 10;
                                                                            agentCount++;
                                                                        }
                                                                        // 标签颜色
                                                                        parsedData.nodes[count].font = {
                                                                            color: "#3F414A",
                                                                        };
                                                                    }
                                                                    
                                                                    // 标签文本使用mac
                                                                    parsedData.nodes[count].label = parsedData.nodes[count].label.split(' - ')[1];
                                                                    
                                                                    parsedData.nodes[count].color = {
                                                                        border: '#fff', //边框色
                                                                        background: '#fff', //背景色
                                                                        // 点击选中的颜色
                                                                        highlight: {
                                                                            border: '#fff',
                                                                            background: '#fff',
                                                                        }
                                                                    };
                                                                    // 绘制节点形状
                                                                    parsedData.nodes[count].shapeProperties = {
                                                                        useImageSize: true, //使用图像的大小
                                                                        useBorderWithImage: true //绘制背景边框，颜色用上面的color对象
                                                                    };
                                                                    // 点击节点标签不加粗
                                                                    parsedData.nodes[count].labelHighlightBold = false;
                                                                }

                                                                for(var j=0;j<parsedData.edges.length;j++) {
                                                                    // 保持直线
                                                                    parsedData.nodes[j].smooth = {
                                                                        enabled: false
                                                                    };
                                                                    // 连线非箭头等
                                                                    parsedData.edges[j].arrows = "";
                                                                    parsedData.edges[j].color = "#4AC549";
                                                                    // 长度
                                                                    parsedData.edges[j].length = 150;
                                                                }

                                                                var data = {
                                                                    nodes: parsedData.nodes,
                                                                    edges: parsedData.edges
                                                                }
                                                                var options = parsedData.options;
                                                                options.interaction = {
                                                                        dragNodes: false, //是否能拖动节点
                                                                        dragView: false, //是否能拖动画布
                                                                        zoomView: false, //是否能缩放画布
                                                                        selectConnectedEdges: false //连接线不再高亮
                                                                    }
                                                                
                                                                // create a network
                                                                var network = new vis.Network(div, data, options);
                                                                network.setSize('600px','600px');
                                                                network.on('click', function(properties) {
                                                                    properties.event.preventDefault();
					                                                properties.event.stopPropagation();
                                                                    setTimeout(function() {
                                                                        var arr = properties.nodes[0].split(" - "),
                                                                        click_role = arr[0].split('|')[0],
                                                                        click_mac = arr[1];
                                                                        var obj = checkSameMac(mesh_info, "alMac", click_mac),
                                                                            deviceList = [];
                                                                            console.log(click_role, click_mac)
                                                                        if(click_role == "Controller") {
                                                                            for(var nAl = 0; nAl < mesh_info.length; nAl++) {
                                                                                var item = mesh_info[nAl];
                                                                                // 找到所有的子机
                                                                                if(item.devRole == "Agent") {
                                                                                    deviceList.push({
                                                                                        type: "Agent",
                                                                                        mac: item.alMac
                                                                                    });
                                                                                }
                                                                                // 找到所有的下挂设备
                                                                                if(item.ethstaInfo.Ethernet) {
                                                                                    for(var nE = 0; nE < item.ethstaInfo.Ethernet.length; nE++) {
                                                                                        deviceList.push({
                                                                                            type: "LAN",
                                                                                            mac: item.ethstaInfo.Ethernet[nE]
                                                                                        });
                                                                                    }
                                                                                }
                                                                                if(item.wifistaInfo) {
                                                                                    for(var key in item.wifistaInfo) {
                                                                                        for(var nW = 0; nW < item.wifistaInfo[key].length; nW++) {
                                                                                            deviceList.push({
                                                                                                type: key + "Hz",
                                                                                                mac: item.wifistaInfo[key][nW]
                                                                                            });
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }   
                                                                        }
                                                                        else if(click_role == "Agent") {
                                                                            for(var nAl = 0; nAl < mesh_info.length; nAl++) {
                                                                                var item = mesh_info[nAl];
                                                                                // 找到所有的下挂设备
                                                                                if(item.alMac == click_mac) {
                                                                                    if(item.ethstaInfo.Ethernet) {
                                                                                        for(var nE = 0; nE < item.ethstaInfo.Ethernet.length; nE++) {
                                                                                            deviceList.push({
                                                                                                type: "LAN",
                                                                                                mac: item.ethstaInfo.Ethernet[nE]
                                                                                            });
                                                                                        }
                                                                                    }
                                                                                    if(item.wifistaInfo) {
                                                                                        for(var key in item.wifistaInfo) {
                                                                                            for(var nW = 0; nW < item.wifistaInfo[key].length; nW++) {
                                                                                                deviceList.push({
                                                                                                    type: key + "Hz",
                                                                                                    mac: item.wifistaInfo[key][nW]
                                                                                                });
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                // 找到所有的子机
                                                                                else if(item.UplinkAlMac == click_mac) {
                                                                                    deviceList.push(item.alMac);
                                                                                    // 每个子机的下挂设备
                                                                                    if(item.ethstaInfo.Ethernet) {
                                                                                        for(var nE = 0; nE < item.ethstaInfo.Ethernet.length; nE++) {
                                                                                            deviceList.push({
                                                                                                type: "LAN",
                                                                                                mac: item.ethstaInfo.Ethernet[nE]
                                                                                            });
                                                                                        }
                                                                                    }
                                                                                    if(item.wifistaInfo) {
                                                                                        for(var key in item.wifistaInfo) {
                                                                                            for(var nW = 0; nW < item.wifistaInfo[key].length; nW++) {
                                                                                                deviceList.push({
                                                                                                    type: key + "Hz",
                                                                                                    mac: item.wifistaInfo[key][nW]
                                                                                                });
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        show_deviceList_tab(deviceList, mesh_info);
                                                                    }, 300);
                                                                });
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
                                                                    mesh_info.push(tree_info[nIdx]);
                                                                    if (tree_info[nIdx]['devRole'] == "Agent")
                                                                    {
                                                                        var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
                                                                        if(upLinkNodeStr != "")
                                                                        {
                                                                            <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                            str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
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
                                                                            // <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                            // var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
                                                                            // str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                            // <% else %>
                                                                            // var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
                                                                            // str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                            // <% end if %>											                   
                                                                            // numStaPerDev += 1;
                                                                        }
                                                                    }
                                                                    
                                                                    if (numStaPerDev == 0 && tree_info.length == 1 &&
                                                                        (tree_info[nIdx]['devRole'] == "Controller" ||
                                                                        tree_info[nIdx]['devRole'] == "Agent"))
                                                                    {
                                                                        <% if tcWebApi_get("mesh_common","DeviceRole","h") = "1"  then %>
                                                                        str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                            <% else %>
                                                                        str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['iP'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
                                                                            <% end if %>
                                                                    }
                                                                }
                                                                console.log("TREE INFO str = ",str);
                                                                
                                                                var NewDOTstring = "dinetwork{"+str+"}";
                                                                
                                                                var parsedData = vis.network.convertDot(NewDOTstring);
                                                                
                                                                for(var count=0;count<parsedData.nodes.length;count++)
                                                                {
                                                                    console.log("NODE LABEL = ",parsedData.nodes[count].label);
                                                                    if(parsedData.nodes[count].label.startsWith('Controller')) {
                                                                        // 使用图片作为节点
                                                                        parsedData.nodes[count].shape = "image";
                                                                        // 图片URL
                                                                        parsedData.nodes[count].image="../img/zj.png";
                                                                        parsedData.nodes[count].x = 0;
                                                                        parsedData.nodes[count].y = -500;
                                                                        parsedData.nodes[count].physics = false;
                                                                        // 边框宽度
                                                                        parsedData.nodes[count].borderWidth = 30;
                                                                        // 选中后的边框宽度
                                                                        parsedData.nodes[count].borderWidthSelected = 30;
                                                                    }
                                                                    else if(parsedData.nodes[count].label.startsWith('Agent'))
                                                                    {
                                                                        parsedData.nodes[count].shape = "image";
                                                                        parsedData.nodes[count].image="../img/agent.png";
                                                                        parsedData.nodes[count].x = 0 + 150*agentCount;
                                                                        parsedData.nodes[count].y = 0;
                                                                        parsedData.nodes[count].borderWidth = 10;
                                                                        parsedData.nodes[count].borderWidthSelected = 10;
                                                                        agentCount++;
                                                                    }
                                                                    else if(parsedData.nodes[count].label.startsWith('STA'))
                                                                    {
                                                                        parsedData.nodes[count].color='Green';
                                                                    }
                                                                    else
                                                                    {
                                                                        parsedData.nodes[count].shape='box';
                                                                    }
                                                                    // 标签文本使用mac
                                                                    parsedData.nodes[count].label = parsedData.nodes[count].label.split(' - ')[1];
                                                                    // 标签颜色
                                                                    parsedData.nodes[count].font = {
                                                                        color: "#3F414A"
                                                                    };
                                                                    parsedData.nodes[count].color = {
                                                                        border: '#fff', //边框色
                                                                        background: '#fff', //背景色
                                                                        // 点击选中的颜色
                                                                        highlight: {
                                                                            border: '#fff',
                                                                            background: '#fff',
                                                                        }
                                                                    };
                                                                    // 绘制节点形状
                                                                    parsedData.nodes[count].shapeProperties = {
                                                                        useImageSize: true, //使用图像的大小
                                                                        useBorderWithImage: true //绘制背景边框，颜色用上面的color对象
                                                                    };
                                                                    // 点击节点标签不加粗
                                                                    parsedData.nodes[count].labelHighlightBold = false;
                                                                }

                                                                for(var j=0;j<parsedData.edges.length;j++) {
                                                                    // 保持直线
                                                                    parsedData.nodes[j].smooth = {
                                                                        enabled: false
                                                                    };
                                                                    // 连线非箭头等
                                                                    parsedData.edges[j].arrows = "";
                                                                    parsedData.edges[j].color = "#4AC549";
                                                                    // 长度
                                                                    parsedData.edges[j].length = 150;
                                                                }

                                                                var data = {
                                                                    nodes: parsedData.nodes,
                                                                    edges: parsedData.edges
                                                                }
                                                                var options = parsedData.options;
                                                                options.interaction = {
                                                                    dragNodes: false, //是否能拖动节点
                                                                    dragView: false, //是否能拖动画布
                                                                    zoomView: false, //是否能缩放画布
                                                                    selectConnectedEdges: false //连接线不再高亮
                                                                }
                                                                
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
                                                                        var s = document.createElement("p");
                                                                        s.setAttribute("class", "form-text");
                                                                        var t = document.createTextNode("未获取到拓扑信息。");
                                                                        s.appendChild(t);
                                                                        div.appendChild(s);
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    btn.innerHTML = '显示组网信息详情';
                                                                    div.style.display = "none";
                                                                }
                                                            }

                                                            function show_deviceList_tab(deviceList, mesh_info) {
                                                                var value = '<% tcWebApi_JsonHook("get_online_lanhost_info", "action", "area") %>'
                                                                var rsp = JSON.parse(value);
                                                                var staList = rsp.data;
                                                                var htmlStr = "";
                                                                for(var i = 0; i < deviceList.length; i++) {
                                                                    for(var j = 0; j < staList.length; j++) {
                                                                        if(staList[j].MAC == deviceList[i].mac) {
                                                                            deviceList[i].ip = staList[j].IP;
                                                                            deviceList[i].name = staList[j].HostName;
                                                                            htmlStr += `
                                                                                <tr class="trStyle3">
                                                                                    <td class="tdWidth3" style="max-width: 215px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 30%;">${deviceList[i].name ? deviceList[i].name : "anoymous"}</td>
                                                                                    <td class="tdWidth3" style="width: 15%;">${deviceList[i].type == "LAN" ? "有线" : deviceList[i].type}</td>
                                                                                    <td class="tdWidth3" style="width: 15%;">优秀</td>
                                                                                    <td class="tdWidth3" style="width: 20%;">${deviceList[i].ip}</td>
                                                                                    <td class="tdWidth3" style="width: 20%;">${deviceList[i].mac}</td>
                                                                                </tr>
                                                                            `;
                                                                        }
                                                                    }
                                                                    
                                                                }
                                                                $("#dev_info_list").html(htmlStr);
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
                                                                location.href = '/cgi-bin/mesh_page.asp';
                                                            }
                                                            
                                                            function get_run_time_topology_cb(rsp)
                                                            {
                                                                try
                                                                {
                                                                    var r = JSON.parse(rsp);
                                                                    if(r.status == "SUCCESS")
                                                                    {
                                                                        // document.getElementById("more-txt").style.display = "";
                                                                        // document.getElementById("display_dev_info_div").style.display = "";
                                                                        document.getElementById("trigger_btn").style.display = "none";
                                                                        document.getElementById("display_tree_vis").style.display = "";
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
                                                                        document.getElementById("trigger_btn").style.display = "";
                                                                        document.getElementById("display_tree_vis").style.display = "none";
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
                                                                document.getElementById("toggle_all_1905_dev_info_btn").disabled = true;
                                                                document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = '显示组网信息详情';
                                                                document.getElementById("getTopoInfoMsgDiv").style.display = "";
                                                                
                                                                var x_response = JSO_get_runtime_topology();
                                                                document.getElementById('getTopoInfoMsgDiv').style.display = 'none';
                                                                get_run_time_topology_cb(x_response);
                                                                document.getElementById("toggle_all_1905_dev_info_btn").disabled = false;
                                                            }

                                                            function LoadFrame()
                                                            {

                                                            }
                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
                                                                document.getElementById("info_show").style.display = "";
                                                                get_run_time_topology();
                                                            <% end if %>
                                                        </script>
                                                    </div>
                                                </TD>	
                                            </TR>
                                        </tbody>
                                    </TABLE>
                                </TD>
                            </TR>
                        </TBODY>
                    </TABLE>
                </FORM>
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
<script language="javascript">
    scmSelect.init($('body'));
    scmRadio.init($('body'));
    scmCheckbox.init($('body'));
</script>