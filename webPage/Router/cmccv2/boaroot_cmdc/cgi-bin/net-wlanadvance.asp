<%
if Request_Form("Mac_Flag") = "3" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","DeleteIndex","delnum")
	TCWebApi_set("IpMacFilter_Common","DelOnly","DelOnlyFlag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Mac_Flag") ="2" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ActiveMac","EnMacFilter_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Mac_Flag") ="4" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()	
end if

if Request_Form("Save_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Entry","Active","EnableMac_Flag")
	TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
	TCWebApi_set("IpMacFilter_Entry","MacAddr","SourceMACAddress")
	TCWebAPI_set("IpMacFilter_Entry","Interface","Interface_Flag")
	TCWebAPI_set("IpMacFilter_Entry","Direction","Direction_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
    TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
end if

if Request_Form("guestSave_Flag") = "1" then
    if Request_Form("GuestEnable_backup") = "1" then
        TCWebApi_set("GuestSSIDInfo_Entry0 ","EnableSSID","SSIDEnable")
        TCWebApi_set("GuestSSIDInfo_Entry1 ","EnableSSID","SSIDEnable")
        TCWebApi_commit("GuestSSIDInfo")
    end if

    if Request_Form("GuestEnable") = "1" then
        if Request_Form("enableBandSteering") = "1" then
            TCWebApi_set("Wlan_Entry2 ","SSID","GuestSSID")
            TCWebApi_set("Wlan11ac_Entry2 ","SSID","GuestSSID")
        else
            TCWebApi_set("Wlan_Entry2 ","SSID","GuestSSID_2")
            TCWebApi_set("Wlan11ac_Entry2 ","SSID","GuestSSID_5")
        end if
        TCWebApi_set("Wlan_Entry2 ","AuthMode","auth_mode")
        TCWebApi_set("Wlan11ac_Entry2 ","AuthMode","auth_mode")
        if Request_Form("auth_mode") = "WPAPSKWPA2PSK" then
            tcWebApi_set("Wlan_Entry2 ","WPAPSK","PreSharedKey")
            tcWebApi_set("Wlan11ac_Entry2 ","WPAPSK","PreSharedKey")
        end if

        TCWebApi_set("GuestSSIDInfo_Entry0 ","SSIDIndex","SSIDIndex_2")
        TCWebApi_set("GuestSSIDInfo_Entry0 ","EnableSSID","GuestEnable")
        TCWebApi_set("GuestSSIDInfo_Entry0 ","PortIsolation","PortIsolation")
        TCWebApi_set("GuestSSIDInfo_Entry0 ","Duration","duration")

        TCWebApi_set("GuestSSIDInfo_Entry1 ","SSIDIndex","SSIDIndex_5")
        TCWebApi_set("GuestSSIDInfo_Entry1 ","EnableSSID","GuestEnable")
        TCWebApi_set("GuestSSIDInfo_Entry1 ","PortIsolation","PortIsolation")
        TCWebApi_set("GuestSSIDInfo_Entry1 ","Duration","duration")
        TCWebApi_commit("GuestSSIDInfo")
    else
        TCWebApi_set("GuestSSIDInfo_Entry0 ","EnableSSID","SSIDEnable")
        TCWebApi_set("GuestSSIDInfo_Entry1 ","EnableSSID","SSIDEnable")
        TCWebApi_commit("GuestSSIDInfo")
    end if
    
	tcWebApi_save()
end if

if Request_Form("wifiTimerSave_Flag") = "1" then
	TCWebApi_set("System_WiFiTiming","Enable","timerEnable_Flag")
	TCWebApi_set("System_WiFiTiming","Start_time","startTime")
	TCWebApi_set("System_WiFiTiming","End_time","endTime")
	TCWebApi_commit("System_WiFiTiming")
	TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
    <TITLE>Wi-Fi高级设置</TITLE>
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
    var cfg_menu_list = new Array('Wi-Fi访问控制', '访客Wi-Fi设置', 'Wi-Fi定时开关');
    // var cfg_menu_list = new Array('Wi-Fi访问控制', 'Wi-Fi定时开关');
    var cfg_cookie_name = 'net-wlanadvance-menu';
    init_l_menu();
</script>

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
        <div class="in_welcom" >
            <span>您好！</span>
            <a onclick="top.location.href='/'">
                <span>返回主页</span>
            </a>
            <input id="Selected_Menu" type="hidden" value="网络->Wi-Fi高级设置" name="Selected_Menu">
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
                                        <li name="wifiControlConf" id="Wi-Fi访问控制">Wi-Fi访问控制</li>
                                        <li name="guestWifiConf" id="访客Wi-Fi设置">访客Wi-Fi设置</li>
                                        <li name="wifiTimerConf" id="Wi-Fi定时开关">Wi-Fi定时开关</li>
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
                                                <TD valign="top" id='Wi-Fi访问控制_item' class="hide">
                                                    <FORM id="ConfigForm" name="ConfigForm"
                                                        action="/cgi-bin/net-wlanadvance.asp" method="post">
                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                                            style="width: 714px;margin: 30px auto;">
                                                            <TBODY>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="advanceTitle">Wi-Fi访问控制</div>
                                                                    </TD>
                                                                </TR>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="title-line"></div>
                                                                    </TD>
                                                                </TR>
                                                                <TR>
                                                                    <input type="hidden" name="Save_Flag" value="0">
                                                                    <input type="hidden" name="EnableMac_Flag" value="Yes">
                                                                    <input type="hidden" name="curNum" value="<% tcWebApi_get("IpMacFilter","add_macnum","s") %>">
                                                                    <input type="hidden" name="RuleType_Flag" value="MAC">
                                                                    <input type="hidden" name="Direction_Flag" value="Incoming">
                                                                    <input type="hidden" name="IpMacType_Flag" value="Mac">
                                                                    <input type="hidden" name="Actionflag" value="Add">
                                                                    <input type="hidden" name="Interface_Flag" value="br0">
                                                                    <TD class='w-10'></TD>
                                                                    <TD>
                                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%"
                                                                            border=0>
                                                                            <TBODY>
                                                                                <TR>
                                                                                    <td>
                                                                                        <div class="form-text"
                                                                                            style="display: inline-block;width: 174px;">
                                                                                            Wi-Fi访问控制</div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <INPUT class="input-onoff"
                                                                                            id=isFilter
                                                                                            onclick="selFilter(this)"
                                                                                            type="checkbox"
                                                                                            name="isFilter" <%if
                                                                                            tcWebApi_get("IpMacFilter_Common","ActiveMac","h")="1"
                                                                                            then asp_Write("checked")
                                                                                            end if%>></P>
                                                                                        <input type="hidden"
                                                                                            name="ListType_Flag"
                                                                                            value="<% tcWebApi_get("
                                                                                            IpMacFilter_Common","ListTypeMac","s")
                                                                                            %>">
                                                                                        <input type="hidden"
                                                                                            name="Mac_Flag" value="0">
                                                                                        <input type="hidden"
                                                                                            name="delnum" value="">
                                                                                        <input type="hidden"
                                                                                            name="EnMacFilter_Flag"
                                                                                            value="<% tcWebApi_get("
                                                                                            IpMacFilter_Common","ActiveMac","s")
                                                                                            %>">
                                                                                        <input type="hidden"
                                                                                            name="mac_num"
                                                                                            value="<% tcWebApi_get("
                                                                                            IpMacFilter","mac_num","s")
                                                                                            %>">
                                                                                        <input type="hidden"
                                                                                            name="DelOnlyFlag"
                                                                                            value="No">
                                                                                        <script language="JavaScript"
                                                                                            type="text/JavaScript">
                                        var enableFilter = "<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s") %>";
                                        var Mode = "<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>";
                                        var state;
                                        function stMacFilter(domain,Name,MACAddress,Enable)
                                        {
                                        this.domain = domain;
                                        this.Name = Name;
                                        this.MACAddress = MACAddress;
                                        this.Enable = Enable;
                                        }
                                        var MacFilter = new Array(null);

                                        function addClick()
                                        {
                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                            if(parseInt(document.ConfigForm.mac_num.value) >= 40)
                                        <% else %>
                                            if(parseInt(document.ConfigForm.mac_num.value) >= 32)
                                        <% end if %>
                                            {
                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                                alert('最大可存储40条过滤规则!')
                                        <% else %>
                                                alert('最大可存储32条过滤规则!')
                                        <% end if %>
                                                return;
                                            }
                                            location.replace('net-addmacfilter.asp');
                                        }

                                        function CheckForm(type)
                                        {
                                            var macvalue = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>'
                                                                    
                                            var rsp = JSON.parse(macvalue);
                                            var mac_list = rsp.data;
                                            with (getElById('ConfigForm'))
                                            {
                                                if (SourceMACAddress.value == '')
                                                {
                                                    alert("MAC地址不正确");
                                                    return false;
                                                }
                                                if (isValidMacAddress(SourceMACAddress.value) == false )
                                                {
                                                    alert('MAC地址 "' + SourceMACAddress.value + '" 不正确,正确格式为(AA:BB:CC:DD:EE:FF)');
                                                    return false;
                                                }
                                                for(var i=0;i<mac_list.length;i++)
                                                {
                                                    if(SourceMACAddress.value.toLowerCase() == mac_list[i]['MacAddr'].toLowerCase())
                                                    {
                                                        alert("相同的过滤MAC地址已存在！");
                                                        return false;		
                                                    }
                                                }
                                            }
                                            return true;
                                        }

                                        function btnSubmit()
                                        {
                                            var Form = document.ConfigForm;
                                            if(CheckForm(0) == false)
                                                return;
                                            Form.Save_Flag.value = "1";
                                            Form.submit();
                                        }

                                        function removeClick(rml)
                                        {
                                            document.ConfigForm.Actionflag.value = "Del";
                                            document.ConfigForm.Mac_Flag.value = "3";
                                            document.ConfigForm.submit();
                                            /*if (rml == null)
                                            return;
                                            var Form = new webSubmitForm();
                                            var k;
                                            if (rml.length > 0)
                                            {
                                            for (k = 0; k < rml.length; k++)
                                            {
                                            if ( rml[k].checked == true )
                                            {
                                            Form.addParameter(rml[k].value,'');
                                            }
                                            }
                                            }
                                            else if ( rml.checked == true )
                                            {
                                            Form.addParameter(rml.value,'');
                                            }
                                            Form.setAction('del.cgi?RequestFile=html/security/macfilter.asp');
                                            Form.submit();*/
                                        }
                                        function LoadFrame()
                                        {
                                            document.ConfigForm.delnum.value = "";
                                            document.ConfigForm.Mac_Flag.value = "0";
                                            if (enableFilter != 1)
                                            {
                                                getElById("FilterInfo").style.display = "none";
                                            }
                                            var FilterMode = getElById("FilterMode");
                                            var FilterInfo = getElById("FilterInfo");
                                            if (Mode == "Black")
                                            {
                                                FilterMode[0].checked = true;
                                                state = false;
                                            }
                                            else
                                            {
                                                FilterMode[1].checked = true;
                                                state = true;
                                            }
                                            if (enableFilter == 1)
                                            {
                                                var FilterOption = getElById("isFilter");
                                                FilterOption.checked = true;
                                            }

                                            with (getElById('wifiTimerForm'))
                                            {
                                                setEnable2();
                                            }
                                            ChangeType();
											var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
											set_action(query_string);
                                        }
                                        function selFilter(filter)
                                        {
                                            if (filter.checked)
                                            {
                                                confirm("是否开启Wi-Fi访问控制？", function(ret){ if(!ret) 
                                                    {
                                                        filter.checked = false;
                                                        $('.tblMain').trigger('click');
                                                        return;
                                                    }else{
                                                        getElement('FilterInfo').style.display = "";
                                                        if (enableFilter != 1)
                                                        {
                                                            with (getElById('ConfigForm'))
                                                            {
                                                            btnAdd.disabled = true;
                                                            btnRemove.disabled = true;
                                                            FilterMode[0].disabled = true;
                                                            FilterMode[1].disabled = true;
                                                            }
                                                        }
                                                    }
                                                    SubmitForm();
                                                    });
                                            }
                                            else
                                            {
                                                confirm("是否禁用Wi-Fi访问控制？", function(ret){ if(!ret) 
                                                    {
                                                        filter.checked = true;
                                                        $('.tblMain').trigger('click');
                                                        return;
                                                    }else{
                                                        FilterInfo.style.display = "none";
                                                    }
                                                    SubmitForm();
                                                    });
                                            }
                                        }
                                        function ChangeMode()
                                        {
                                            //var Form = new webSubmitForm();
                                            var	Form = document.ConfigForm;
                                            var FilterMode = getElById("FilterMode");
                                            var isFilter = getElById("isFilter");
                                            if (FilterMode[0].checked == true && state)
                                            {
                                                confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为黑名单？", function(ret){ if(ret)
                                                {
                                                    state = false;
                                                    Form.ListType_Flag.value = "Black";
                                                    Form.Mac_Flag.value = "4";
                                                    Form.Actionflag.value = "Mod";
                                                    Form.submit();
                                                //Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',0);
                                                }
                                                else
                                                {
                                                    FilterMode[0].checked = false;
                                                    FilterMode[1].checked = true;
                                                    $('.tblMain').trigger('click');
                                                    return;
                                                }});
                                            }
                                            else if (FilterMode[1].checked == true && !state)
                                            {
                                                confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为白名单？", function(ret){ if(ret)
                                                {
                                                    state = true;
                                                    Form.ListType_Flag.value = "White";
                                                    Form.Mac_Flag.value = "4";
                                                    Form.Actionflag.value = "Mod";
                                                    Form.submit();
                                                    //Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',1);
                                                }
                                                else
                                                {
                                                    FilterMode[0].checked = true;
                                                    FilterMode[1].checked = false;
                                                    $('.tblMain').trigger('click');
                                                    return;
                                                }});
                                            }
                                            //Form.setAction('set.cgi?RequestFile=html/security/macfilter.asp');
                                            //Form.submit();
                                        }
                                        function SubmitForm()
                                        {
                                            var FilterMode = getElById("FilterMode");
                                            if (
                                            (Mode !== "Black" && FilterMode[0].checked == true) ||
                                            (Mode === "Black" && FilterMode[1].checked == true)
                                            ){
                                                ChangeMode();
                                            } else {
                                                var Form = document.ConfigForm;
                                                Form.Actionflag.value = "Add";
                                                Form.Mac_Flag.value = "2";
                                                if(Form.isFilter.checked)
                                                    Form.EnMacFilter_Flag.value = "1";
                                                else Form.EnMacFilter_Flag.value = "0";
                                                
                                                if(Form.ListType_Flag.value == "N/A" || Form.ListType_Flag.value == "" || Form.ListType_Flag.value == "undefined")
                                                    Form.ListType_Flag.value = "Black"
                                                Form.submit();
                                            }
                                        /*var Form = new webSubmitForm();
                                        Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterRight',getCheckVal('isFilter'));
                                        Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',getRadioVal('FilterMode'));
                                        Form.setAction('set.cgi?RequestFile=html/security/macfilter.asp');
                                        Form.submit();*/
                                        }

                                        function setEnable1()
                                        {
                                            var	Form = document.GuestWifiForm;
                                            var enChecked = getCheckVal('enableGuestWifi');
                                            if (enChecked == '1')
                                            {
                                                Form.GuestEnable.value = "1";
                                            }
                                            else
                                            {
                                                Form.GuestEnable.value = "0";
                                            }
                                            Form.guestSave_Flag.value = "1";
                                            $("form[name='GuestWifiForm']").submit();
                                        }

                                        function eblLimit()
                                        {
                                            var enChecked = getCheckVal('enableLimit');
                                            if (enChecked == '1')
                                            {
                                                document.GuestWifiForm.limitEnable.value = "1";
                                            }
                                            else
                                            {
                                                document.GuestWifiForm.limitEnable.value = "0";
                                            }
                                        }

                                        function ChangeType()
                                        {
                                            var selIndex=document.getElementById("BeaconType").selectedIndex;
                                            if(selIndex == 0) {
                                                setDisplay('keyText', 1);
                                                document.GuestWifiForm.auth_mode.value = "WPAPSKWPA2PSK";
                                            }
                                            else {
                                                setDisplay('keyText', 0);
                                                document.GuestWifiForm.auth_mode.value = "OPEN";
                                            }
                                        }

                                        function isValidWPAPskKey(val) 
                                        {
                                            var ret = false;
                                            var len = val.length;
                                            var maxSize = 64;
                                            var minSize = 8;
                                            
                                            if ( len >= minSize && len < maxSize )
                                            {
                                                if ( val.match(/[^\x00-\xff]/g) )
                                                {
                                                    ret = false;
                                                } 
                                                else 
                                                {
                                                    for ( i = 0; i < len; i++ )
                                                        if ( val.charAt(i) == ' ' || val.charAt(i) == '`')
                                                        {
                                                            break;
                                                        }
                                                    if ( i == len )
                                                        ret = true;
                                                }
                                            } 
                                            else if ( len == maxSize ) 
                                            {
                                                for ( i = 0; i < maxSize; i++ )
                                                    if ( isHexaDigit(val.charAt(i)) == false )
                                                        break;
                                                    if ( i == maxSize )
                                                        ret = true;
                                            } 
                                            else
                                                ret = false;
                                            
                                            return ret;
                                        }

                                        function SubmitGuest()
                                        {
                                            var	Form = document.GuestWifiForm;
                                            var bandSteer = '<% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>';
                                            if ( bandSteer == 1 )
                                            {
                                                var ssid = getValue('GuestSSID');
                                                if ( ssid == '' )
                                                {
                                                    alert('访客Wi-Fi名称不能为空！');
                                                    return false;
                                                }
                                                if ( !checkSSID(ssid) )
                                                {
                                                    alert("访客Wi-Fi名称不能超过20个字符或10个汉字，请重新输入！");
                                                    return false;
                                                }
                                            }
                                            else
                                            {
                                                var ssid_2 = getValue('GuestSSID_2'),
                                                    ssid_5 = getValue('GuestSSID_5');
                                                if ( ssid_2 == '' )
                                                {
                                                    alert('访客2.4G Wi-Fi名称不能为空！');
                                                    return false;
                                                }
                                                if ( !checkSSID(ssid_2) )
                                                {
                                                    alert("访客2.4G Wi-Fi名称不能超过20个字符或10个汉字，请重新输入！");
                                                    return false;
                                                }
                                                if ( ssid_5 == '' )
                                                {
                                                    alert('访客5G Wi-Fi名称不能为空！');
                                                    return false;
                                                }
                                                if ( !checkSSID(ssid_5) )
                                                {
                                                    alert("访客5G Wi-Fi名称不能超过20个字符或10个汉字，请重新输入！");
                                                    return false;
                                                }
                                            }

                                            var selIndex=document.getElementById("BeaconType").selectedIndex;
                                            if(selIndex == 0) {
                                                var value = getValue('PreSharedKey');
                                                if ( isValidWPAPskKey(value) == false ) {
                                                    alert('访客Wi-Fi密码应为8到63位ASCII字符或者64位16进制数，请重新输入！');
                                                    return false;
                                                }
                                            }
                                            Form.guestSave_Flag.value = "1";
                                            $("form[name='GuestWifiForm']").submit();
                                        }

                                        function setEnable2()
                                        {
                                            var enChecked = getCheckVal('enableWifiTimer');
                                            if (enChecked == '1')
                                            {
                                                document.wifiTimerForm.timerEnable_Flag.value = "1";
                                            }
                                            else
                                            {
                                                document.wifiTimerForm.timerEnable_Flag.value = "0";
                                            }
                                        }

                                        function SubmitTimer() {
                                            var	Form = document.wifiTimerForm;
                                            Form.wifiTimerSave_Flag.value = "1";
                                            Form.startTime.value = getSelectVal('openHour') + ":" + getSelectVal('openMinute');
                                            Form.endTime.value = getSelectVal('closeHour') + ":" + getSelectVal('closeMinute');
                                            $("form[name='wifiTimerForm']").submit();
                                        }

                                        function formatstr(sourcestr, searchstr)
                                        {
                                            var restr;
                                            var offset = sourcestr.indexOf(searchstr);
                                            if(offset == -1)
                                                return null;
                                            var lenstr = searchstr.toString();	
                                            restr = sourcestr.substring(0, offset) + sourcestr.substring((offset+parseInt(lenstr.length)+1), sourcestr.length);
                                            return restr;
                                        }
                                        function doDel(i)
                                        {
                                            var f = document.ConfigForm;
                                            var tempstr;
                                            var rml = document.getElementsByName('rml');
                                            if (rml == null)
                                                return;
                                            if(rml.length>0)
                                            {
                                                for(var n=0;n<(rml.length);n++)
                                                {
                                                    if(rml[n].value == i){
                                                        if(rml[n].checked)
                                                        {
                                                            tempstr = i + ",";
                                                            f.delnum.value = f.delnum.value + tempstr;
                                                            
                                                        }
                                                        else
                                                        {
                                                            f.delnum.value = formatstr(f.delnum.value,i);
                                                        }
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                        </script>
                                                                                    </td>
                                                                                </tr>
                                                                            </TBODY>
                                                                        </TABLE>

                                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%"
                                                                            border=0>
                                                                            <TBODY>
                                                                                <TR>
                                                                                    <td>
                                                                                        <DIV id=FilterInfo>
                                                                                            <div class="form-text"
                                                                                                style="display: inline-block;width: 174px;">
                                                                                                过滤模式</div><INPUT
                                                                                                id=FilterMode
                                                                                                onclick="ChangeMode()"
                                                                                                type="radio" value="0"
                                                                                                name="FilterMode" <%if
                                                                                                tcWebApi_get("IpMacFilter_Common","ListTypeMac","h")="Black"
                                                                                                then
                                                                                                asp_Write("checked") end
                                                                                                if%>> <span
                                                                                                style="margin-right: 20px;">黑名单</span>
                                                                                            <INPUT id=FilterMode
                                                                                                onclick="ChangeMode()"
                                                                                                type="radio" value="1"
                                                                                                name="FilterMode" <%if
                                                                                                tcWebApi_get("IpMacFilter_Common","ListTypeMac","h")="White"
                                                                                                then
                                                                                                asp_Write("checked") end
                                                                                                if%>>
                                                                                            <span>白名单</span>
                                                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                                                <tr>
                                                                                                <td><div class="form-text">MAC地址</div></td>
                                                                                                <td><input type='text' name="SourceMACAddress" id="SourceMACAddress" maxlength='17'><span>（格式：AA:BB:CC:DD:EE:FF）</span></td>
                                                                                                </tr>
                                                                                                <TR>
                                                                                                    <TD colspan='2'>
                                                                                                      <P style="margin: 32px 0 32px 182px;">
                                                                                                          <input type="button" style="width: 140px;" id="btnAdd" onclick="btnSubmit()" value="添 加">
                                                                                                          <INPUT class="BtnAdd" id=btnRemove style="margin-left: 24px;width: 140px;" onclick="removeClick(this.form.rml)" type=button value="删 除"> 
                                                                                                      </p>
                                                                                                    </TD>
                                                                                            </table>
                                                                                            <TABLE>
                                                                                                <TR>
                                                                                                    <TD align="left"
                                                                                                        class="table-outer">
                                                                                                        <TABLE
                                                                                                            class="tblList2 autoList">
                                                                                                            <thead>
                                                                                                                <TR
                                                                                                                    class="trStyle2">
                                                                                                                    <TD class="tdWidth2"
                                                                                                                        width="50%">
                                                                                                                        MAC地址
                                                                                                                    </TD>
                                                                                                                    <TD class="tdWidth2"
                                                                                                                        width="25%">
                                                                                                                        使能
                                                                                                                    </TD>
                                                                                                                    <TD class="tdWidth2"
                                                                                                                        width="25%">
                                                                                                                        删除
                                                                                                                    </TD>
                                                                                                                </TR>
                                                                                                            </thead>
                                                                                                            <tbody>
                                                                                                                <SCRIPT
                                                                                                                    language=JavaScript
                                                                                                                    type=text/javascript>
                                                    var macvalue = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>'
			                  		
														var rsp = JSON.parse(macvalue);
														var mac_list = rsp.data;
														for(var i = 0; i < mac_list.length; i++)
														{
															document.write('<TR align="center">');
															document.write('<TD align="center" width="50%">' + mac_list[i]['MacAddr'] + '&nbsp;</TD>');
															if(mac_list[i]['Active'] == "Yes")
																document.write('<TD align="center" width="25%">' + "启用" + '&nbsp;</TD>');
															else
																document.write('<TD align="center" width="25%">' + "禁用" + '&nbsp;</TD>');
															document.write('<TD width="25%"><input type="checkbox" id="rml" name="rml" onclick="doDel(' + mac_list[i]['Index'] + ')" value="' + mac_list[i]['Index'] + '"></TD>');
															document.write('</TR>');	
														}
			                  	                </SCRIPT>
                                                                                                            </tbody>
                                                                                                        </TABLE>
                                                                                                    </TD>
                                                                                                </TR>
                                                                                            </TABLE>
                                                                                        </DIV>
                                                                                    </TD>
                                                                                </TR>
                                                                            </TBODY>
                                                                        </TABLE>
                                                                    </TD>
                                                                </TR>
                                                            </TBODY>
                                                        </TABLE>
                                                    </FORM>
                                                </TD>
                                            </TR>

                                            <TR>
                                                <TD width=7 background=/img/panel3.gif>　</TD>
                                                <TD valign="top" id='访客Wi-Fi设置_item' class="hide">
                                                    <FORM id="GuestWifiForm" name="GuestWifiForm"
                                                        action="/cgi-bin/net-wlanadvance.asp" method="post">
                                                        <INPUT TYPE="HIDDEN" NAME="enableBandSteering" value="<% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>">
                                                        <input type="hidden" name="GuestEnable_backup" value="<% tcWebApi_get("GuestSSIDInfo_Entry0","EnableSSID","s") %>">
                                                        <input type="hidden" name="GuestEnable" value="<% tcWebApi_get("GuestSSIDInfo_Entry0","EnableSSID","s") %>">
                                                        <input type="hidden" name="auth_mode" value="<% tcWebApi_get("Wlan_Entry2","AuthMode","s") %>">
                                                        <input type="hidden" name="limitEnable" value="<% tcWebApi_get("GuestSSIDInfo_Entry0","limit_enbale","s") %>">
                                                        <INPUT TYPE="HIDDEN" NAME="guestSave_Flag" VALUE="0">
                                                        <INPUT TYPE="HIDDEN" NAME="SSIDEnable" VALUE="2">
                                                        <INPUT TYPE="HIDDEN" NAME="SSIDIndex_2" VALUE="3">
                                                        <INPUT TYPE="HIDDEN" NAME="SSIDIndex_5" VALUE="11">
                                                        <INPUT TYPE="HIDDEN" NAME="PortIsolation" VALUE="1">

                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                                            style="width: 714px;margin: 30px auto;">
                                                            <TBODY>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="advanceTitle">访客Wi-Fi设置</div>
                                                                    </TD>
                                                                </TR>
                                                                <tr>
                                                                    <td>
                                                                    <div class="advanceTips">
                                                                        <span onclick="showHelp()">页面帮助</span>
                                                                    </div>
                                                                    <div class="helpDesc" style="display: none;padding: 0;">
                                                                        <p style="padding-left: 9px;">当您的家中来客时，可以开启访客Wi-Fi功能。这样您家将同时拥有主Wi-Fi和访客Wi-Fi两个独立的Wi-Fi网络。客人虽然可以通过专属Wi-Fi上网，但不能管理您的路由器，也不能访问您家庭网络中的设备。访客Wi-Fi有效保证了您的网络隐私安全。</p>
                                                                    </div>
                                                                </td>
                                                                </tr>
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
                                                                                        <div class="form-text">
                                                                                            访客Wi-Fi</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <input class="input-onoff"
                                                                                            id=enableGuestWifi
                                                                                            onclick="setEnable1()"
                                                                                            type="checkbox"
                                                                                            name="enableGuestWifi" <%if
                                                                                            tcWebApi_get("GuestSSIDInfo_Entry0","EnableSSID","h")="1"
                                                                                            then asp_Write("checked")
                                                                                            end if%>>
                                                                                    </TD>
                                                                                </TR>
                                                                            </TBODY>
                                                                        </TABLE>
                                                                        <% if tcWebApi_get("GuestSSIDInfo_Entry0", "EnableSSID", "h") = "1" then %>
                                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%"
                                                                            border=0>
                                                                            <TBODY>
                                                                                <% if tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "h") = "1" then %>
                                                                                <TR>
                                                                                    <TD class='w-130'>
                                                                                        <div class="form-text">
                                                                                            访客Wi-Fi名称</div>
                                                                                    </TD>
                                                                                    <TD><INPUT TYPE="TEXT"
                                                                                            NAME="GuestSSID"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="<% If tcWebApi_get("
                                                                                            Wlan_Entry2","SSID","h")
                                                                                            <> "N/A" then
                                                                                        tcWebApi_get("Wlan_Entry2","SSID","s")
                                                                                        end if %>"></TD>
                                                                                </TR>
                                                                                <% else %>
                                                                                <TR>
                                                                                    <TD class='w-130'>
                                                                                        <div class="form-text">
                                                                                            访客2.4G Wi-Fi名称</div>
                                                                                    </TD>
                                                                                    <TD><INPUT TYPE="TEXT"
                                                                                            NAME="GuestSSID_2"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="<% If tcWebApi_get("Wlan_Entry2","SSID","h")
                                                                                            <> "N/A" then
                                                                                        tcWebApi_get("Wlan_Entry2","SSID","s")
                                                                                        end if %>"></TD>
                                                                                </TR>
                                                                                <TR>
                                                                                    <TD class='w-130'>
                                                                                        <div class="form-text">
                                                                                            访客5G Wi-Fi名称</div>
                                                                                    </TD>
                                                                                    <TD><INPUT TYPE="TEXT"
                                                                                            NAME="GuestSSID_5"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="<% If tcWebApi_get("Wlan11ac_Entry2","SSID","h") <> "N/A" then tcWebApi_get ("Wlan11ac_Entry2","SSID","s")
                                                                                        end if %>"></TD>
                                                                                </TR>
                                                                                <% end if %>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">开启时长
                                                                                        </div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <SELECT id="duration" size="1"
                                                                                            name="duration"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var duration = '<% tcWebApi_get("GuestSSIDInfo_Entry0","Duration","s") %>';
                                                                                                var optionList = new Array('4小时', '1天', '7天');
                                                                                                var optionvalue = new Array(240, 1440, 10080);

                                                                                                with (getElById('duration')) {
                                                                                                    for (i = 0; i < optionList.length; i++) {
                                                                                                        var opt = new Option(optionList[i], optionvalue[i]);
                                                                                                        if (duration == optionvalue[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">安全</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <SELECT id="BeaconType"
                                                                                            size="1"
                                                                                            name="BeaconType"
                                                                                            onchange="ChangeType()">
                                                                                            <option value="1" <%if tcWebApi_get ("Wlan_Entry2","AuthMode","h") <> "OPEN" then asp_Write("selected") end if%>>加密</option>
                                                                                            <option value="0" <%if tcWebApi_get ("Wlan_Entry2","AuthMode","h")="OPEN" then asp_Write("selected") end if%>>不加密</option>
                                                                                        </SELECT>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR id="keyText">
                                                                                    <TD>
                                                                                        <div class="form-text">访客Wi-Fi密码
                                                                                        </div>
                                                                                    </TD>
                                                                                    <TD><span id="inpsw1"
                                                                                            style="position: relative;"><INPUT
                                                                                                TYPE="PASSWORD"
                                                                                                ID="PreSharedKey"
                                                                                                NAME="PreSharedKey"
                                                                                                SIZE="48" MAXLENGTH="64" onkeyup="doshowStrongChange(this.value)" VALUE='<% If tcWebApi_get ("Wlan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan_Entry2","WPAPSK","s") end if %>'>
                                                                                            <div class="input_eye eye-pwd"
                                                                                                id="cb_enablshowpsw"
                                                                                                data-flag=0
                                                                                                onclick="doshowpswChange()">
                                                                                            </div>
                                                                                        </span>
                                                                                        <%if TCWebApi_get("WebCurSet_Entry", "IsSupportWIFIShowPSW","h")="1" then%>

                                                <script language="JavaScript" type="text/JavaScript">
                                                        var changeTimer = null;

                                                        function checkPWStrength(sValue) {
                                                            var modes = 0;
                                                            if (sValue.length < 1) return modes;
                                                            if (sValue.length < 8) return 1;
                                                            if (/\d/.test(sValue)) modes++;
                                                            if (/[a-z]/.test(sValue)) modes++;
                                                            if (/[A-Z]/.test(sValue)) modes++;
                                                            if (/\W/.test(sValue)) modes++;

                                                            return modes;
                                                        }

                                                        function doshowStrongChange(value) {
                                                            changeTimer = setTimeout(function() {
                                                                strength_label.style.display = "";
                                                                var password_strength = checkPWStrength(value);
                                                                switch (password_strength) {
                                                                    case 0:
                                                                        strength_label.style.display = "none";
                                                                        break;
                                                                    case 1:
                                                                        $("#strength_label span")[0].innerText = "弱";
                                                                        break;
                                                                    case 2:
                                                                        $("#strength_label span")[0].innerText = "中";
                                                                        break;
                                                                    case 3:
                                                                    case 4:
                                                                        $("#strength_label span")[0].innerText = "高";
                                                                        break;
                                                                }
                                                            }, 200);
                                                        }

                                                        function doshowpswChange() {
                                                            clearTimeout(changeTimer);
                                                            with (getElById('GuestWifiForm')){
                                                                var flag = getElById('cb_enablshowpsw').getAttribute('data-flag');
                                                                if (flag==0) {
                                                                    getElById("PreSharedKey").setAttribute("type", "text");
                                                                    getElById("cb_enablshowpsw").setAttribute("data-flag", "1");
                                                                }
                                                                else {
                                                                    getElById("PreSharedKey").setAttribute("type", "password");
                                                                    getElById("cb_enablshowpsw").setAttribute("data-flag", "0");
                                                                }
                                                            }
                                                        }
                                                    </script>
                                                                                            <%end if%>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR id="strength_label" style="display: none;">
                                                                                    <TD></TD>
                                                                                    <TD class='w-130'><P class="pwd-tips" style="height: 30px;line-height: 30px;">密码强度：<span></span></P></TD>
                                                                                </TR>
                                                                                <!-- <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">
                                                                                            网络限速</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <input class="input-onoff"
                                                                                            id=enableGuestWifi
                                                                                            onclick="eblLimit()"
                                                                                            type="checkbox"
                                                                                            name="enableLimit" <%if tcWebApi_get ("GuestSSIDInfo_Entry0 ","limit_enbale","h") ="1" then asp_Write("checked") end if%>>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">
                                                                                            最大下载速度</div>
                                                                                    </TD>
                                                                                    <TD><INPUT TYPE="TEXT"
                                                                                            NAME="GuestLimitMax"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="">
                                                                                        <span>Mbps</span>
                                                                                    </TD>
                                                                                </TR> -->
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <P
                                                                                            style="margin-top: 32px;margin-left: 182px;">
                                                                                            <input type="button"
                                                                                                id="btnOK"
                                                                                                onclick="SubmitGuest()"
                                                                                                value="保 存">
                                                                                        </P>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <p class="time_str"></p>
                                                                                        <script>
                                                                                            // 时间格式转换
                                                                                            function formatSeconds3(seconds) {
                                                                                                var secondTime = 0;
                                                                                                var minuteTime = 0;
                                                                                                var hourTime = 0;
                                                                                                
                                                                                                secondTime = seconds;
                                                                                                if (seconds > 60) {
                                                                                                    minuteTime = parseInt(seconds / 60);
                                                                                                    secondTime = parseInt(seconds % 60);
                                                                                                    if (minuteTime > 60) {
                                                                                                        hourTime = parseInt(minuteTime / 60);
                                                                                                        minuteTime = parseInt(minuteTime % 60);
                                                                                                    }
                                                                                                }
    
                                                                                                var str1 = hourTime ? hourTime : "0",
                                                                                                    str2 = minuteTime ? minuteTime : "0",
                                                                                                    str3 = secondTime ? secondTime : "0";
    
                                                                                                return '<span>剩余时间</span><span class="big">'+str1+'</span><span>小时</span><span class="big">'+str2+'</span><span>分钟</span><span class="big">'+str3+'</span><span>秒</span>';
                                                                                            }
    
                                                                                                var remain = '<% tcWebApi_get("GuestSSIDInfo_Entry0", "RemainDuration", "s") %>';
                                                                                                remain = remain != 'N/A' ? parseInt(remain) : 0;
                                                                                                var htmlStr = formatSeconds3(remain);
                                                                                                $(".time_str").html(htmlStr)
    
                                                                                                var timer = setInterval(function() {
                                                                                                    if(remain == 0) {
                                                                                                        clearInterval(timer);
                                                                                                        return false
                                                                                                    }
                                                                                                    remain --;
                                                                                                    var htmlStr = formatSeconds3(remain);
                                                                                                    $(".time_str").html(htmlStr)
                                                                                                }, 1000);
                                                                                                </script>
                                                                                    </td>
                                                                                </tr>
                                                                                <TR class="hide">
                                                                                    <TD colspan='2'>
                                                                                      <P align=center>
                                                                                             <input type="button" id="btnOK" onclick="SubmitForm()" value="确定">
                                                                                              &nbsp;&nbsp;
                                                                                             <input type="button" id="btnCancel" name="btnCancel" onclick="RefreshPage()" value="取消"> 
                                                                                      </P>
                                                                                    </TD>
                                                                                  </TR>
                                                                            </TBODY>
                                                                        </TABLE>
                                                                        <% end if %>
                                                                    </TD>
                                                                </TR>
                                                            </TBODY>
                                                        </TABLE>
                                                    </FORM>
                                                </TD>
                                            </TR>

                                            <TR>
                                                <TD width=7 background=/img/panel3.gif>　</TD>
                                                <TD valign="top" id='Wi-Fi定时开关_item' class="hide">
                                                    <FORM id="wifiTimerForm" name="wifiTimerForm"
                                                        action="/cgi-bin/net-wlanadvance.asp" method="post">
                                                        <input type="hidden" name="timerEnable_Flag"
                                                            value="<% tcWebApi_get("
                                                            System_WiFiTiming","Enable","s") %>">
                                                        <input type="hidden" name="startTime" value="">
                                                        <input type="hidden" name="endTime" value="">
                                                        <INPUT TYPE="HIDDEN" NAME="wifiTimerSave_Flag" VALUE="0">

                                                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                                            style="width: 714px;margin: 30px auto;">
                                                            <TBODY>
                                                                <TR>
                                                                    <TD>
                                                                        <div class="advanceTitle">Wi-Fi定时开关</div>
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
                                                                                        <div class="form-text">
                                                                                            Wi-Fi定时开关</div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <input class="input-onoff"
                                                                                            id=enableWifiTimer
                                                                                            onclick="setEnable2()"
                                                                                            type="checkbox"
                                                                                            name="enableWifiTimer" <%if
                                                                                            tcWebApi_get("System_WiFiTiming","Enable","h")="1"
                                                                                            then asp_Write("checked")
                                                                                            end if%>>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">关闭时间
                                                                                        </div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <SELECT id="closeHour" size="1"
                                                                                            name="closeHour"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var end_time = '<% tcWebApi_get("System_WiFiTiming","End_time","s") %>';
                                                                                                var hour = end_time.split(":")[0];
                                                                                                var hourList = new Array();
                                                                                                for (var i = 0; i < 24; i++) {
                                                                                                    if (i < 10) {
                                                                                                        hourList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        hourList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('closeHour')) {
                                                                                                    for (i = 0; i < hourList.length; i++) {
                                                                                                        var opt = new Option(hourList[i], hourList[i]);
                                                                                                        if (hour == hourList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                        <span
                                                                                            style="vertical-align: super;margin: 0 5px;">:</span>
                                                                                        <SELECT id="closeMinute"
                                                                                            size="1"
                                                                                            name="closeMinute"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var end_time = '<% tcWebApi_get("System_WiFiTiming","End_time","s") %>';
                                                                                                var minute = end_time.split(":")[1];
                                                                                                var minuteList = new Array();
                                                                                                for (var i = 0; i < 60; i++) {
                                                                                                    if (i < 10) {
                                                                                                        minuteList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        minuteList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('closeMinute')) {
                                                                                                    for (i = 0; i < minuteList.length; i++) {
                                                                                                        var opt = new Option(minuteList[i], minuteList[i]);
                                                                                                        if (minute == minuteList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </TD>
                                                                                </TR>
                                                                                <TR>
                                                                                    <TD>
                                                                                        <div class="form-text">开启时间
                                                                                        </div>
                                                                                    </TD>
                                                                                    <TD>
                                                                                        <SELECT id="openHour" size="1"
                                                                                            name="openHour"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var start_time = '<% tcWebApi_get("System_WiFiTiming","Start_time","s") %>';
                                                                                                var hour = start_time.split(":")[0];
                                                                                                var hourList = new Array();
                                                                                                for (var i = 0; i < 24; i++) {
                                                                                                    if (i < 10) {
                                                                                                        hourList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        hourList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('openHour')) {
                                                                                                    for (i = 0; i < hourList.length; i++) {
                                                                                                        var opt = new Option(hourList[i], hourList[i]);
                                                                                                        if (hour == hourList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                        <span
                                                                                            style="vertical-align: super;margin: 0 5px;">:</span>
                                                                                        <SELECT id="openMinute" size="1"
                                                                                            name="openMinute"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var start_time = '<% tcWebApi_get("System_WiFiTiming","Start_time","s") %>';
                                                                                                var minute = start_time.split(":")[1];
                                                                                                var minuteList = new Array();
                                                                                                for (var i = 0; i < 60; i++) {
                                                                                                    if (i < 10) {
                                                                                                        minuteList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        minuteList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('openMinute')) {
                                                                                                    for (i = 0; i < minuteList.length; i++) {
                                                                                                        var opt = new Option(minuteList[i], minuteList[i]);
                                                                                                        if (minute == minuteList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </TD>
                                                                                </TR>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <P
                                                                                            style="margin-top: 32px;margin-left: 182px;">
                                                                                            <input type="button"
                                                                                                id="btnOK"
                                                                                                onclick="SubmitTimer()"
                                                                                                value="保 存">
                                                                                        </P>
                                                                                    </td>
                                                                                </tr>
                                                                            </TBODY>
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