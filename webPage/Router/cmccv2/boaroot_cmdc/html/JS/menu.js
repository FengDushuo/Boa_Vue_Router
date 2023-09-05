// JavaScript Document
var curUserName = parent.curUser;
if (typeof(curUserName) == "undefined")
	curUserName = '0';
var vPageMap =  parent.pageMap;
if (typeof(vPageMap) == "undefined")
	top.window.location.href="/cgi-bin/content.asp";
var sysUserName = '1';
var sptUserName = '0';
var ctcqdUserName = 'ctcqd';
var bandRegName = 'regAcc';
var usrUserName = 0;
var iCount = 0;
var MenuArray = new Array();
var Count = 0;
var MenuArray_0 = new Array();
//QS->0
//Sta->1
if(vPageMap[1][0] == '1'){
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "主 页", "/cgi-bin/index.asp", "");
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "上网设置", "/cgi-bin/wan_page.asp", "");
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "Wi-Fi设置", "/cgi-bin/wifi_page.asp", "");
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "终端管理", "/cgi-bin/terminal_page.asp", "");
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "Mesh管理", "/cgi-bin/mesh_page.asp", "");
    MenuArray_0[Count++] = new MenuNodeConstruction(1, "更 多", "/cgi-bin/more_setup.asp", "");
	if(vPageMap[1][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "状态", "/cgi-bin/sta-device.asp", "");
	else if(vPageMap[1][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "状态", "/cgi-bin/sta-network.asp", "");
	else if(vPageMap[1][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "状态", "/cgi-bin/sta-user.asp", "");
	else if(vPageMap[1][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "状态", "/cgi-bin/sta-VoIP.asp", "");	
	else if(vPageMap[1][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "状态", "/cgi-bin/sta-acs.asp", "");							
}
if(vPageMap[1][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "设备信息", "/cgi-bin/sta-device.asp", "");
if(vPageMap[1][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "网络侧信息", "/cgi-bin/sta-network.asp", "");
if(vPageMap[1][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "用户侧信息", "/cgi-bin/sta-user.asp", "");
if(vPageMap[1][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "宽带语音信息", "/cgi-bin/sta-VoIP.asp", "");
//if(vPageMap[1][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "远程管理状态", "/cgi-bin/sta-acs.asp", "");
//Net->2
if(vPageMap[2][0] == '1'){
	if(1)
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/wan_page.asp", "");		
	else if(vPageMap[2][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-wanset.asp", "");
	else if(vPageMap[2][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-binding.asp", "");
	else if(vPageMap[2][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-dhcp.asp", "");
	else if(vPageMap[2][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-qos.asp", "");
	else if(vPageMap[2][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-wlan.asp", "");
    else if(vPageMap[2][12] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-wlanadvance.asp", "");
	else if(vPageMap[2][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-tr069.asp", "");
	else if(vPageMap[2][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-phoneapp.asp", "");
	else if(vPageMap[2][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-time.asp", "");
	else if(vPageMap[2][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-routeset.asp", "");										
	else if(vPageMap[2][11] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "网络", "/cgi-bin/net-alinkset.asp", "");
}
if(1)
	MenuArray[iCount++] = new MenuNodeConstruction(2, "上网设置", "/cgi-bin/wan_page.asp", "");
if(vPageMap[2][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "宽带设置", "/cgi-bin/net-wanset.asp", "");
if(vPageMap[2][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "绑定配置", "/cgi-bin/net-binding.asp", "");
if(vPageMap[2][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "LAN侧地址配置", "/cgi-bin/net-dhcp.asp", "");
if(vPageMap[2][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "QoS", "/cgi-bin/net-qos.asp", "");
if(vPageMap[2][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 2.4G配置", "/cgi-bin/net-wlan.asp", "");
if(vPageMap[2][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 5G配置", "/cgi-bin/net-wlan11ac.asp", "");
if(1)
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Wi-Fi基本设置", "/cgi-bin/wifi_page.asp", "");
if(vPageMap[2][12] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Wi-Fi高级设置", "/cgi-bin/net-wlanadvance.asp", "");
if(vPageMap[2][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "远程管理", "/cgi-bin/net-tr069.asp", "");
if(vPageMap[2][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "手机连接管理", "/cgi-bin/net-phoneapp.asp", "");
if(vPageMap[2][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "时间管理", "/cgi-bin/net-time.asp", "");
if(vPageMap[2][8] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "路由配置", "/cgi-bin/net-routeset.asp", "");
//if(vPageMap[2][11] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WOLINK配置", "/cgi-bin/net-alinkset.asp", "");
//Sec->3
if(vPageMap[3][0] == '1'){
	if(vPageMap[3][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "安全", "/cgi-bin/sec-urlfilter.asp", "");
	else if(vPageMap[3][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "安全", "/cgi-bin/sec-firewall.asp", "");
	else if(vPageMap[3][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "安全", "/cgi-bin/sec-macfilter.asp", "");
	else if(vPageMap[3][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "安全", "/cgi-bin/sec-portfilter.asp", "");				
	else if(vPageMap[3][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "安全", "/cgi-bin/sec-protocolfilter.asp", "");
}
if(vPageMap[3][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "URL过滤", "/cgi-bin/sec-urlfilter.asp", "");
if(vPageMap[3][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "防火墙", "/cgi-bin/sec-firewall.asp", "");
if(vPageMap[3][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "MAC过滤", "/cgi-bin/sec-macfilter.asp", "");
if(vPageMap[3][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "端口过滤", "/cgi-bin/sec-portfilter.asp", "");
if(vPageMap[3][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "协议过滤", "/cgi-bin/sec-protocolfilter.asp", "");
		
//App->4
if(vPageMap[4][0] == '1'){
	if(vPageMap[4][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-ddns.asp", "");
	else if(vPageMap[4][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-natset.asp", "");
	else if(vPageMap[4][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-upnp.asp", "");
	else if(vPageMap[4][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-VoIP.asp", "");
    else if(vPageMap[4][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-iptv.asp", "");
	else if(vPageMap[4][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-igmpset.asp", "");
	else if(vPageMap[4][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-daily.asp", "");						
	else if(vPageMap[4][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/app-parentcontrol.asp", "");					
	else if(vPageMap[4][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/wifi_multi_ap.asp", "");
    else if(vPageMap[4][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "应用", "/cgi-bin/wifi_multi_topo.asp", "");	
}
if(vPageMap[4][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "DDNS配置", "/cgi-bin/app-ddns.asp", "");
if(vPageMap[4][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "高级NAT配置", "/cgi-bin/app-natset.asp", "");
if(vPageMap[4][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "UPnP配置", "/cgi-bin/app-upnp.asp", "");
if(vPageMap[4][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "宽带电话设置", "/cgi-bin/app-VoIP.asp", "");
if(vPageMap[4][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "IPTV设置", "/cgi-bin/app-iptv.asp", "");
if(vPageMap[4][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "IGMP设置", "/cgi-bin/app-igmpset.asp", "");
if(vPageMap[4][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "家庭存储", "/cgi-bin/app-daily.asp", "");
if(vPageMap[4][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "家长模式", "/cgi-bin/app-parentcontrol.asp", "");
if(vPageMap[4][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "MESH基本配置", "/cgi-bin/wifi_multi_ap.asp", "");
if(1)
	MenuArray[iCount++] = new MenuNodeConstruction(2, "MESH基础配置", "/cgi-bin/mesh_page.asp", "");
if(vPageMap[4][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "MESH拓扑图", "/cgi-bin/wifi_multi_topo.asp", "");
//Mag->5
if(vPageMap[5][0] == '1'){
	if(vPageMap[5][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "管理", "/cgi-bin/mag-account.asp", "");
	else if(vPageMap[5][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "管理", "/cgi-bin/upgrade.asp", "");
	else if(vPageMap[5][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "管理", "/cgi-bin/mag-reset.asp", "");
	else if(vPageMap[5][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "管理", "/cgi-bin/mag-syslogmanage.asp", "");		
}
if(vPageMap[5][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "用户管理", "/cgi-bin/mag-account.asp", "");
if(vPageMap[5][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "升级管理", "/cgi-bin/upgrade.asp", "");
if(vPageMap[5][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "设备管理", "/cgi-bin/mag-reset.asp", "");
if(vPageMap[5][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "日志文件管理", "/cgi-bin/mag-syslogmanage.asp", "");
if(1)
	MenuArray[iCount++] = new MenuNodeConstruction(2, "终端管理", "/cgi-bin/terminal_page.asp", "");

//Diag->6
if(vPageMap[6][0] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(1, "诊断", "/cgi-bin/diag-quickdiagnose.asp", "");
if(vPageMap[6][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "网络诊断", "/cgi-bin/diag-quickdiagnose.asp", "");
//Help->7
if(vPageMap[7][0] == '1')
{
	if(vPageMap[7][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-sta.asp", "");
	else if(vPageMap[7][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-net.asp", "");
	else if(vPageMap[7][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-sec.asp", "");		
	else if(vPageMap[7][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-app.asp", "");		
	else if(vPageMap[7][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-mag.asp", "");		
	else if(vPageMap[7][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "帮助", "/cgi-bin/help-diag.asp", "");	
}
if(vPageMap[7][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "状态", "/cgi-bin/help-sta.asp", "");
if(vPageMap[7][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "网络", "/cgi-bin/help-net.asp", "");
if(vPageMap[7][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "安全", "/cgi-bin/help-sec.asp", "");
if(vPageMap[7][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "应用", "/cgi-bin/help-app.asp", "");
if(vPageMap[7][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "管理", "/cgi-bin/help-mag.asp", "");
if(vPageMap[7][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "诊断", "/cgi-bin/help-diag.asp", "");

MenuArray_0[Count++] = new MenuNodeConstruction(0, "", "", "");
MenuArray[iCount++] = new MenuNodeConstruction(0, "", "", "");

function MenuNodeConstruction(Level, Text, Link, Target)
{
    this.Level = Level;
    this.Text = Text;
    this.Link = Link;
    this.Target = Target;
}

function MakeMenu(Selected_Menu)
{
	var Menu = Selected_Menu.split("->");
    if(Menu[1]) {
        MakeMenu_L2(Menu[1], MakeMenu_L1(Menu[0]));
    }
	else {
        MakeMenu_L0(Menu[0]);
    }
}

function MakeMenu_L0(Menu_Text) {
    var Menu_L2_Start;
	
	var mMenuClass;
	
	var Code = '<table border="0" cellpadding="0" cellspacing="0">';
	
	Code += '<tr>';
	for (iCount = 0; MenuArray_0[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage_0(\'' + iCount + '\')';
		if (MenuArray_0[iCount].Level == 1)
		{
			var menu_link = MenuArray_0[iCount].Link;
			var x = menu_link.lastIndexOf("/");
			var y = menu_link.indexOf(".asp");
			var menu_name = menu_link.substring(x+1,y);
			if (MenuArray_0[iCount].Text != Menu_Text)
			{
				Code += '<td><a href="javascript:' + str + '" target="' + MenuArray_0[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L1_Link">' + MenuArray_0[iCount].Text + '</a></td>';
			}
			else
			{
				Code += '<td><a href="javascript:' + str + '" target="' + MenuArray_0[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L1_Active">' + MenuArray_0[iCount].Text + '</a></td>';     // selected
			}
		}
	}
	Code += '</tr>';
	
	Code += '</table>';
	getElement('MenuArea_L1').innerHTML = Code;
	return Menu_L2_Start;
}

function MakeMenu_L1(Menu_Text)
{
	var Menu_L2_Start;
	
	var mMenuClass;
	
	var Code = '<table border="0" cellpadding="0" cellspacing="0">';
	
	//Code += '<tr>';
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				if(MenuArray[iCount].Text == "状态")
				{				
					mMenuClass = "navStatNormal";
				}
				else if(MenuArray[iCount].Text == "网络")
				{				
					mMenuClass = "navNetNormal";
				}
				else if(MenuArray[iCount].Text == "安全")
				{				
					mMenuClass = "navSafeNormal";
				}
				else if(MenuArray[iCount].Text == "应用")
				{				
					mMenuClass = "navAppNormal";
				}
				else if(MenuArray[iCount].Text == "管理")
				{				
					mMenuClass = "navMagNormal";
				}
				else if(MenuArray[iCount].Text == "诊断")
				{				
					mMenuClass = "navDiagNormal";
				}
				else if(MenuArray[iCount].Text == "帮助")
				{				
					mMenuClass = "navHelpNormal";
				}
				else
				{				
					mMenuClass = "navStatNormal";
				}
				//Code += '<td class="' + mMenuClass + '"><div class="CCK" onClick="' + str + '"></div></td>';
			}
			else
			{
				if(MenuArray[iCount].Text == "状态")
				{				
					mMenuClass = "navStatSelected";
				}
				else if(MenuArray[iCount].Text == "网络")
				{				
					mMenuClass = "navNetSelected";
				}
				else if(MenuArray[iCount].Text == "安全")
				{				
					mMenuClass = "navSafeSelected";
				}
				else if(MenuArray[iCount].Text == "应用")
				{				
					mMenuClass = "navAppSelected";
				}
				else if(MenuArray[iCount].Text == "管理")
				{				
					mMenuClass = "navMagSelected";
				}
				else if(MenuArray[iCount].Text == "诊断")
				{				
					mMenuClass = "navDiagSelected";
				}
				else if(MenuArray[iCount].Text == "帮助")
				{				
					mMenuClass = "navHelpSelected";
				}
				else
				{				
					mMenuClass = "navStatSelected";
				}
				//Code += '<td class="' + mMenuClass + '"></td>';
			}
		}
	}
	//Code += '</tr>';
	
	Code += '<tr>';
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 1)
		{
			var menu_link = MenuArray[iCount].Link;
			var x = menu_link.lastIndexOf("/");
			var y = menu_link.indexOf(".asp");
			var menu_name = menu_link.substring(x+1,y);
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L1_Link">' + MenuArray[iCount].Text + '</a></td>';
			}
			else
			{
				Code += '<td><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L1_Active">' + MenuArray[iCount].Text + '</a></td>';     // selected
			}
		}
	}
	Code += '</tr>';
	
	//Code += '<tr>';	
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				//Code += '<td class="navNormal"></td>';
			}
			else
			{
				Menu_L2_Start = iCount + 1;
				//Code += '<td class="navSelected"></td>';
				//Code += '<td class="navNormal"></td>';
			}
		}
	}
	//Code += '</tr>';
	
	Code += '</table>';
	getElement('MenuArea_L1').innerHTML = Code;
	return Menu_L2_Start;
}

function LoadPage_0(strIndex)
{
	var index = parseInt(strIndex);
	location = MenuArray_0[index].Link;
}

function LoadPage(strIndex)
{
	var index = parseInt(strIndex);
	location = MenuArray[index].Link;
}

function MakeMenu_L2(Menu_Text, Start)
{
	var innerHTML = getElement('MenuArea_L2').innerHTML;
	var Code = '<table border="0" cellpadding="0" cellspacing="0"><tr><td>';
	for (var iCount = Start; (MenuArray[iCount].Level != 0) && (MenuArray[iCount].Level != 1); iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		//Code += '&nbsp;&nbsp;';
		if (MenuArray[iCount].Level == 2)
		{
			var menu_link = MenuArray[iCount].Link;
			var x = menu_link.lastIndexOf("/");
			var y = menu_link.indexOf(".asp");
			var menu_name = menu_link.substring(x+1,y);
			if (MenuArray[iCount].Text != Menu_Text)
			{				
				Code += '<a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L2_Link"> ' + MenuArray[iCount].Text + ' </a>';
			}
			else
			{
				Code += '<a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" id=' + menu_name + '  name=' + menu_name + ' class="Menu_L2_Active"> ' + MenuArray[iCount].Text + ' </a>';
				Code += innerHTML;
			}
		}
		//Code += '&nbsp;&nbsp;';
	}
	Code += '</td></tr></table>';
	getElement('MenuArea_L2').innerHTML = Code;
}
 
function DisplayLocation(Selected_Menu)
{
	// $('.footer').before('<div class="qrcode"></div>');
}

function sub_menu_disp( l_menu, m_menu )
{
	var menu_list  = m_menu;
	var idx = 0;
	var menu_obj = '';

	for ( idx = 0; idx < menu_list.length; idx ++ )
	{
		menu_obj = '#' + menu_list[idx] + '_item';
		if ( menu_list[idx] == l_menu )
			$(menu_obj).show();
		else
			$(menu_obj).hide();
	}
}

function init_l_menu()
{
	$( document ).ready( function()
	{
		var cookie_menu = _getC(cfg_cookie_name);
		var menu_selected = cfg_menu_list[0];		
		if ( 0 != cookie_menu.length )
		{
			menu_selected = cookie_menu;
			_delC(cfg_cookie_name);
		}
		/* select menu and show page */
		var menu_obj = '#' + menu_selected;
		$(menu_obj).addClass( 'TSD' );
		sub_menu_disp(menu_selected, cfg_menu_list);

		$( 'ul.TRD li' ).click( function() {
			$( 'ul.TRD li' ).removeClass( 'TSD' );
			$( this ).addClass( 'TSD' );
			var l_menu = $(this).attr('id');
			sub_menu_disp(l_menu, cfg_menu_list);
		});
		
		/* add hook for submit action. */
		$('form').submit( function(e)
		{
			menu_selected_update();
		});

		if ( 'function' == typeof(page_ready) )
		{
				page_ready();
		}
	});
}

function menu_selected_update()
{
	$( 'ul.TRD li' ).each( function(idx, ele) 
	{
			if ( $( this ).hasClass( 'TSD' ) )
			{
				var l_menu = $(this).attr('id');
				_setC(cfg_cookie_name, l_menu);
			}
	});
}

function _setC( _name, _value )
{
	var _cookie = _name + '=' + _value + ';path=/;';
	document.cookie = _cookie;
}

function _getC( _name )
{
	var _search = _name + "=";

	if ( document.cookie.length > 0 ) 
	{
		var _offset = document.cookie.indexOf(_search);
		if ( _offset >= 0 ) 
		{
			_offset += _search.length;
			var end = document.cookie.indexOf(";", _offset);
			if ( end < 0 )
				end = document.cookie.length;
			return unescape( document.cookie.substring(_offset, end) );
		}
	}
	
	return '';
}

function _delC( _name )
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 10000);  
	document.cookie = _name + "=del;expires=" + exp.toGMTString();
	document.cookie = _name + "=del;expires=" + exp.toGMTString() + ";path=/;";  
}

function cancelClick()
{
	menu_selected_update();
	location.href = document.location.href;
}

function placeholderSupport()
{
    return 'placeholder' in document.createElement('input'); //textarea也是支持的
}

function iePlaceHolder()
{
	if( !placeholderSupport() )
	{
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
			}
		}).blur(function() {
			var input = $(this);
			if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				input.val(input.attr('placeholder'));
			}
		}).blur();
	};

	return 0;	
}