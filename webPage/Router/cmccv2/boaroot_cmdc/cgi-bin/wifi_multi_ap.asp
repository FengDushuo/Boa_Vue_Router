<%
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
<HTML>
<HEAD>
    <TITLE>EasyMesh基本配置</TITLE>
    <META http-equiv=Content-Language content=zh-cn>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
    <SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
    <SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
    <SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
    <SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT>
    <script language="javascript" src="/JS/polyfill.min.js"></script>
    <script language="javascript" src="/JS/popup.js"></script>
    <script language="javascript" src="/JS/scm_select.js"></script>
    <script language="javascript" src="/JS/scm_radio.js"></script>
    <script language="javascript" src="/JS/scm_checkbox.js"></script>
    <SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
    <META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<script>
    // var cfg_menu_list = new Array('基础配置', '拓扑图');
    var cfg_menu_list = new Array('基础配置');
    var cfg_cookie_name = 'wifi_multi_ap-menu';
    init_l_menu();
</script>

<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0
    onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();LoadFrame()"
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
                智能组网终端
            </span>
        </div>
        <div class="in_welcom" >
            <span>您好！</span>
            <a onclick="top.location.href='/'">
                <span>返回主页</span>
            </a>
            <input id="Selected_Menu" type="hidden" value="应用->MESH基本配置" name="Selected_Menu">
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
                    <TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                            <TR>
                                <TD id="MenuArea_L2">
                                    <ul class="TRD">
                                        <li name="map-cfg-tab-basic" id="基础配置">基础配置</li>
                                        <!-- <li name="map-cfg-tab-runtime" id="拓扑图">拓扑图</li> -->
                                    </ul>
                                </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById('Selected_Menu').value);
                                </SCRIPT>
                                <TD valign="top">
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height='100%'>
                                        <TBODY>
                                            <TR>
                                                <TD width=7 background=/img/panel3.gif>　</TD>
                                                <TD valign="top" id='基础配置_item' class="hide">
                                                    <script>
                                                        function LoadFrame() {
                                                            MapEnable();
															var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
															set_action(query_string);
                                                        }

                                                        function MapEnableClick() {
                                                            var _val = getCheckVal('Mapenable');
                                                            if (_val == 1) {
                                                                document.basicForm.Enable_Flag.value = "1";
                                                            }
                                                            else {
                                                                document.basicForm.Enable_Flag.value = "0";
                                                            }
                                                        }

                                                        function MapEnable() {
                                                            var _val = getCheckVal('Mapenable');
                                                            if (_val == 1) {
                                                                document.basicForm.Enable_Flag.value = "1";
                                                                document.getElementById("device_role").style.display = "";
                                                                document.getElementById("trigger_btn").style.display = "";
                                                                document.getElementById("trigger_btn_tips").style.display = "";
                                                            }
                                                            else {
                                                                document.basicForm.Enable_Flag.value = "0";
                                                                document.getElementById("device_role").style.display = "none";
                                                                document.getElementById("trigger_btn").style.display = "none";
                                                                document.getElementById("trigger_btn_tips").style.display = "none";
                                                            }
                                                        }

                                                        function btnSave() {
                                                            if (document.basicForm != null) {
                                                            <% if tcWebApi_get("APWanInfo_Common","FixedAPMode","h")="APClient" then %>
                                                                var _val = getCheckVal('Mapenable');
                                                                if (_val == 1) {
                                                                    alert("当前上网模式为中继模式，请切换为其他模式后再开启MESH！");
                                                                    return;
                                                                }
                                                            <% end if %>
                                                                
                                                            <% if tcWebApi_get("WebCustom_Entry", "isInsideAgentSupport", "h") <> "Yes"  then %>
                                                            <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>

                                                            <% else %>
                                                                    setText('Change_Flag', 1);
                                                            <% end if %>
                                                            <% end if %>
                                                                setText('SaveAll_Flag', 1);
                                                                document.basicForm.submit();
                                                            }
                                                        }
                                                    </script>
                                                    <FORM id="basicForm" name="basicForm" action="/cgi-bin/wifi_multi_ap.asp" method="post">
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

                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                                            style="width: 714px;margin: 30px auto;">
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
                                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%"
                                                                            border=0>
                                                                            <TBODY>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">MESH配置开关</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <input class="input-onoff" id=Mapenable onclick="MapEnableClick()" type="checkbox" name="Mapenable" <%if tcWebApi_get("Mesh_dat","MapEnable","h")="1" then asp_Write("checked") end if%>>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR id="device_role">
                                                                                    <TD>
                                                                                        <div class="form-text">当前角色</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <script>
                                                                                            var devRole = "<% tcWebApi_get("Info_Mesh","DeviceRole","s") %>";
                                                                                            if (!devRole) {
                                                                                                console.log("Incorrect Device Role", devRole);
                                                                                                document.write("");
                                                                                            }
                                                                                            switch (parseInt(devRole)) {
                                                                                                case 0: // Auto
                                                                                                    document.write("自动");
                                                                                                    break;
                                                                                                case 1: // Controller
                                                                                                    document.write("Controller");
                                                                                                    break;
                                                                                                case 2: // Agent
                                                                                                    document.write("Agent");
                                                                                                    break;
                                                                                                default:
                                                                                                    document.write("");
                                                                                                    break;
                                                                                            }
                                                                                        </script>
                                                                                    </TD>
                                                                                </TR>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <P
                                                                                            style="margin-top: 32px;margin-left: 182px;">
                                                                                            <input type="button" id="btnOK" onclick="btnSave()" value="保 存">
                                                                                        </P>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trigger_btn">
                                                                                    <td colspan="2">
                                                                                        <P
                                                                                            style="margin-top: 45px;margin-left: 182px;">
                                                                                            <input type="button" id="btnOK" style="margin-bottom: 5px;" onclick="triggerMultiApOnBoarding()" value="开始组网">
                                                                                        </P>
                                                                                    </td>
                                                                                </tr>
                                                                                <TR id="trigger_btn_tips">
                                                                                    <TD></TD>
                                                                                    <TD>
                                                                                        <p class="font-help" style="width: 250px;text-align: center;margin: 0;">点击按钮开始触发MESH组网</p>
                                                                                    </TD>
                                                                                </TR>
                                                                            </TBODY>
                                                                        </TABLE>

                                                                        <script>

                                                                            function getX_Response(type) {
                                                                                var X_Res = '';
                                                                                try {
                                                                                    switch (type) {
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
                                                                                catch (e) {
                                                                                    X_Res = '';
                                                                                }

                                                                                return X_Res;
                                                                            }

                                                                            function JSO_get_runtime_topology() {
                                                                                var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
                                                                                ret = ret.replace(/\'/g, '\\\\u0022');
                                                                                ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g, '\\\\u0022WPAPSK\\\\u0022:');
                                                                                return ret;
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
                                                                                document.basicForm.submit();
                                                                            }
                                                                        </script>
                                                                    </TD>
                                                                </TR>
                                                            </TBODY>
                                                        </TABLE>
                                                    </FORM>
                                                </TD>
                                            </TR>

                                            <TR>
                                                <TD width=7 background=/img/panel3.gif>　</TD>
                                                <TD valign="top" id='拓扑图_item' class="hide">
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