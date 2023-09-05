<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>Wi-Fi����</TITLE>
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
<script>
    function doRefresh()
    {
        location.href='/cgi-bin/logout.cgi';
    }

    var rebootEnable = "<% tcWebApi_get("System_Entry","reboot_type","s") %>";
    if (rebootEnable == 1) {
        setTimeout(function () {
            showLoading(60, "upgrade", "�豸���������������ĵȴ�����");
        }, 1000);
        setTimeout(doRefresh, 61*1000);
    }
</script>
<style>
@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
    .click.input_eye {
        top: -20px;
    }
}
table.major td.content {
    height: 0;
    min-height: 703px;
}
.system {
  margin-left: 25px;
}

.left-system {
  float: left;
  text-align: left;
  min-width: 100px;
  font-size: 14px;
  font-family: MicrosoftYaHei;
  color: #3f414a;
  letter-spacing: 1px;
  line-height: 30px;
}

.right-system {
  float: left;
  font-size: 14px;
  font-family: MicrosoftYaHei;
  color: #3f414a;
  line-height: 19px;
  letter-spacing: 1px;
  margin-left: 14px;
}

.form-group {
  height: 30px;
  margin-bottom: 12px;
}

.separate-line {
  margin: 0 0 23px 257px;
  width: 480px;
  height: 1px;
  background: rgba(0, 0, 0, 0.1);
}

#same input[type="button"].input-onoff.button-on,
#same .input-checkbox.input-onoff.checkbox-on {
  float: left;
  top: -6px;
  left: -10px;
  background-size: 50% !important;
  background: url(../img/checkbox-checked.png) center no-repeat;
}

#same input[type="button"].input-onoff,
#same input[type="button"].input-onoff.button-off,
#same .input-checkbox.input-onoff {
float: left;
  top: -6px;
  left: -10px;
  background-size: 50% !important;
  background: url(../img/checkbox-unchecked.png) center no-repeat;
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
			���ܼ�ͥ·����
		</span>
	</div>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
    <FORM name=RebootForm action="/cgi-bin/wifi_page.asp" method="post">
        <INPUT type="HIDDEN" name="rebootflag" value="0">
        <INPUT type="HIDDEN" name="restoreFlag" value="<% tcWebApi_get("System_Entry","reboot_type","s") %>">

        <script>
            function Reboot()
            {
                confirm("ȷ��������", function(ret) {
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
                <span>�����豸</span>
            </div>
            <div class="fl" style="margin-left: 24px;font-size: 0;" onclick="location.href='/cgi-bin/logout.cgi'">
                <img src="../img/icon_drop_out.png">
                <a>�˳�</a>
            </div>
		<input id="Selected_Menu" type="hidden" value="Wi-Fi����" name="Selected_Menu">
	</div>
</FORM>
<% else %>
	<div class="in_welcom" >
		<span>���ã�</span>
		<a onclick="top.location.href='/'">
		<span>������ҳ</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="����->Wi-Fi��������" name="Selected_Menu"></TD>
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
                    var changeTimer2 = null,
                        changeTimer5 = null,
                        changeTimer3 = null;
                    var enable = "<% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>";
                    var meshEbl = "<% tcWebApi_get("Mesh_dat", "MapEnable", "s") %>";
                    var devRole = "<% tcWebApi_get("Info_Mesh","DeviceRole","s") %>";

                    function LoadFrame()
                    {
                        scmSelect.init($('body'));
                        scmRadio.init($('body'));
                        scmCheckbox.init($('body'));
                        showBandSteering();
                        showWifiBackup();

                        if(meshEbl == 1 && devRole == 2) {
                            wlSsid.disabled = true;
                            wlWpaPsk.disabled = true;
                            ESSID.disabled = true;
                            Ssid.disabled = true;
                            PreSharedKey1.disabled = true;
                            WpaPsk.disabled = true;
                            setDisplay('same', 0);
                        }
						var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
						set_action(query_string);
                    }

                    function showBandSteering() {
                        var bandSteer = getCheckVal('bandSteering');
                        if ( bandSteer == 1 )
                        {
                            document.ConfigForm.enableBandSteering.value = "1";
                            setDisplay('bandSteer_open', 1);
                            setDisplay('bandSteer_close', 0);
                        }
                        else
                        {
                            document.ConfigForm.enableBandSteering.value = "0";
                            setDisplay('bandSteer_open', 0);
                            setDisplay('bandSteer_close', 1);
                        }
                    }

                    function clickBandSteering() {
                        var bandSteer = getCheckVal('bandSteering');
                        if ( bandSteer == 1 )
                        {
                            setText('enableBandSteering', 1);
                            setText('Flag', 4);
                            document.ConfigForm.ssid_2.value = document.ConfigForm.ssid_2.value + "_Wi-Fi5";
                        }
                        else
                        {
                            setText('enableBandSteering', 0);
                            setText('Flag', 5);
                            document.ConfigForm.ssid_5.value = document.ConfigForm.ssid_2.value + "-5G_Wi-Fi5";
                            document.ConfigForm.ssid_2.value = document.ConfigForm.ssid_2.value + "_Wi-Fi5";
                        }
                        setText('Save_Flag', 3);
                        
                        ajax_submit(25);
                    }

                    function showWifiBackup() {
                        var bandSteer = getCheckVal('bandSteering');
                        var enable = getCheckVal('wifiBackupEnable');
                        if ( enable == 1 )
                        {
                            document.ConfigForm.enableWifiBackup.value = "1";
                            setDisplay('backupPwd', 1);
                            if (bandSteer == 1) {
                                setDisplay('wifi_2_backup', 0);
                                setDisplay('wifi_5_backup', 0);
                                setDisplay('wifi_backup', 1);
                                <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then %>
                                    setDisplay('backupPwd', 0);
                                <% end if %>
                            }
                            else {
                                setDisplay('wifi_2_backup', 1);
                                setDisplay('wifi_5_backup', 1);
                                setDisplay('wifi_backup', 0);
                                <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then %>
                                    <% if tcWebApi_get("Wlan11ac_Entry0","AuthMode","h") = "OPEN" then %>
                                        setDisplay('backupPwd', 0);
                                    <% end if %>
                                <% end if %>
                            }
                        }
                        else
                        {
                            document.ConfigForm.enableWifiBackup.value = "0";
                            setDisplay('backupPwd', 0);
                            setDisplay('wifi_2_backup', 0);
                            setDisplay('wifi_5_backup', 0);
                            setDisplay('wifi_backup', 0);
                        }
                    }

                    function clickWifiBackup() {
                        var enable = getCheckVal('wifiBackupEnable');
                        if ( enable == 1 )
                        {
                            var Enbl_2 = "<% tcWebApi_get("WLan_Common","APOn","s") %>";
                            var Enbl_5 = "<% tcWebApi_get("WLan11ac_Common","APOn","s") %>";
                            if (Enbl_2 == 0 && Enbl_5 == 0) {
                                alert("��ǰWi-Fi���ڹر�״̬�����Ƚ�Wi-Fi�򿪺��ٿ�������Wi-Fi��");
                                return false;
                            }
                            setText('enableWifiBackup', 1);
                            setText('enableSSID', 1);
                            document.ConfigForm.ssid_2.value = document.ConfigForm.ssid_2.value + "_Wi-Fi5";
                            document.ConfigForm.ssid_5.value = document.ConfigForm.ssid_5.value + "_Wi-Fi5";

                            var auth_2 = "<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>";
                            var auth_5 = "<% tcWebApi_get("Wlan11ac_Entry0","AuthMode","s") %>";
                            document.ConfigForm.auth_2.value = auth_2 == 'OPEN' ? 'OPEN' : "WPAPSKWPA2PSK";
                            document.ConfigForm.auth_5.value = auth_5 == 'OPEN' ? 'OPEN' : "WPAPSKWPA2PSK";
                        }
                        else
                        {
                            setText('enableWifiBackup', 0);
                            setText('enableSSID', 0);
                        }
                        setText('Save_Flag', 3);
                        setText('Flag', 3);
                        ajax_submit(10);
                    }

                    function ClickEnble(EnbleCl) {
                        if ( EnbleCl.checked == true )
                        {
                            setText('wifiEnbl', 1);
                        }
                        else
                        {
                            setText('wifiEnbl', 0);
                        }
                        setText('Save_Flag', 6);
                        setText('Flag', 6);
                        ajax_submit(10);
                    }

                    function wl2ClickEnble(wl2EnbleCl)
                    {   
                        if ( wl2EnbleCl.checked == true )
                        {
                            setText('hwlEnbl', 1);
                        }
                        else
                        {
                            setText('hwlEnbl', 0);
                        }
                        setText('Save_Flag', 4);
                        setText('Flag', 4);
                        ajax_submit(10);
                    }

                    function wl5ClickEnble(wl5EnbleCl)
                    {   
                        if ( wl5EnbleCl.checked == true )
                        {
                            setText('wlan_APenable', 1);
                        }
                        else
                        {
                            setText('wlan_APenable', 0);
                        }
                        setText('Save_Flag', 5);
                        setText('Flag', 5);
                        ajax_submit(10);
                    }

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

                    function doshowStrongChange2(value) {
                        changeTimer2 = setTimeout(function() {
                            strength_label2.style.display = "";
                            var password_strength = checkPWStrength(value);
                            switch (password_strength) {
                                case 0:
                                    strength_label2.style.display = "none";
                                    break;
                                case 1:
                                    $("#strength_label2 span")[0].innerText = "��";
                                    break;
                                case 2:
                                    $("#strength_label2 span")[0].innerText = "��";
                                    break;
                                case 3:
                                case 4:
                                    $("#strength_label2 span")[0].innerText = "��";
                                    break;
                            }
                        }, 200);
                    }
                    
                    function doshowStrongChange5(value) {
                        changeTimer5 = setTimeout(function() {
                            strength_label5.style.display = "";
                            var password_strength = checkPWStrength(value);
                            switch (password_strength) {
                                case 0:
                                    strength_label5.style.display = "none";
                                    break;
                                case 1:
                                    $("#strength_label5 span")[0].innerText = "��";
                                    break;
                                case 2:
                                    $("#strength_label5 span")[0].innerText = "��";
                                    break;
                                case 3:
                                case 4:
                                    $("#strength_label5 span")[0].innerText = "��";
                                    break;
                            }
                        }, 200);
                    }

                    function doshowStrongChange3(value) {
                        changeTimer3 = setTimeout(function() {
                            strength_label3.style.display = "";
                            var password_strength = checkPWStrength(value);
                            switch (password_strength) {
                                case 0:
                                    strength_label3.style.display = "none";
                                    break;
                                case 1:
                                    $("#strength_label3 span")[0].innerText = "��";
                                    break;
                                case 2:
                                    $("#strength_label3 span")[0].innerText = "��";
                                    break;
                                case 3:
                                case 4:
                                    $("#strength_label3 span")[0].innerText = "��";
                                    break;
                            }
                        }, 200);
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

                    function SubmitForm() {
                        var bandSteer = getCheckVal('bandSteering');
                        if ( bandSteer == 1 )
                        {
                            var ssid = getValue('Ssid');
                            if ( ssid == '' )
                            {
                                alert('Wi-Fi���Ʋ���Ϊ�գ�');
                                return false;
                            }
                            if ( !checkSSID(ssid) )
                            {
                                alert("Wi-Fi���Ʋ��ܳ���28���ֽڣ����������룡");
                                return false;
                            }
                            // var the_substring = ssid.substring(0, 5);
                            // if(the_substring != 'CMCC-')
                            // {
                            //     alert('Wi-Fi����Ӧ������"CMCC-"��ͷ���ַ�����');
                            //     return true;
                            // }
                            var value = getValue('WpaPsk');
                            if ( isValidWPAPskKey(value) == false ) {
                                alert('Wi-Fi����ӦΪ8��63λASCII�ַ�����64λ16�����������������룡');
                                return false;
                            }
                            setText('Save_Flag', 2);
                            setText('Flag', 2);
                            document.ConfigForm.ssid_2.value = document.ConfigForm.Ssid.value + "_Wi-Fi5";
                        }
                        else
                        {
                            var ssid_2 = getValue('wlSsid'),
                                ssid_5 = getValue('ESSID');
                            if ( ssid_2 == '' )
                            {
                                alert('2.4G Wi-Fi���Ʋ���Ϊ�գ�');
                                return false;
                            }
                            if ( !checkSSID(ssid_2) )
                            {
                                alert("2.4G Wi-Fi���Ʋ��ܳ���20���ַ���10�����֣����������룡");
                                return false;
                            }
                            if ( ssid_5 == '' )
                            {
                                alert('5G Wi-Fi���Ʋ���Ϊ�գ�');
                                return false;
                            }
                            if ( !checkSSID(ssid_5) )
                            {
                                alert("5G Wi-Fi���Ʋ��ܳ���20���ַ���10�����֣����������룡");
                                return false;
                            }
                            // var the_substring_2 = ssid_2.substring(0, 5),
                            //     the_substring_5 = ssid_5.substring(0, 5);
                            // if(the_substring_2 != 'CMCC-' || the_substring_5 != 'CMCC-')
                            // {
                            //     alert('Wi-Fi����Ӧ������"CMCC-"��ͷ���ַ�����');
                            //     return true;
                            // }

                            var value_2 = getValue('wlWpaPsk'),
                                value_5 = getValue('PreSharedKey1');
                            if ( isValidWPAPskKey(value_2) == false ) {
                                alert('2.4G Wi-Fi����ӦΪ8��63λASCII�ַ�����64λ16�����������������룡');
                                return false;
                            }
                            if ( isValidWPAPskKey(value_5) == false ) {
                                alert('5G Wi-Fi����ӦΪ8��63λASCII�ַ�����64λ16�����������������룡');
                                return false;
                            }
                            setText('Save_Flag', 1);
                            setText('Flag', 1);
                            document.ConfigForm.ssid_2.value = document.ConfigForm.wlSsid.value + "_Wi-Fi5";
                            document.ConfigForm.ssid_5.value = document.ConfigForm.ESSID.value + "_Wi-Fi5";
                        }
                        
                        ajax_submit(10);
                    }

                    function ajax_submit(time) {
                        var params=$('form').serialize(); //��form����Ĳ����Զ���װΪ��������

                        $.ajax({  
                            type: "GET",   //�ύ�ķ���
                            url: "/cgi-bin/asp_submit_wifi.asp", //�ύ�ĵ�ַ  
                            async: true,
                            data: params,
                            dataType: "text",
                            success: function(data) {
                                showLoading(time, "upgrade1");
                            },
                            error: function(error) {
                                showLoading(3, "upgrade1", "����ʧ�ܣ������ԡ���");
                            }
                        });
                    }

                </script>
				<FORM name=ConfigForm action="/cgi-bin/wifi_page.asp" method="post">
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
                                    <li class="TSD">Wi-Fi��������</li>
                                    </ul>
                                </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById ('Selected_Menu').value);
                                </SCRIPT>			
                                <TD valign="top">
<% end if %>
                                
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 257px;">
                                        <tbody>
                                            <TR>
                                                <TD>
                                                    <INPUT TYPE="HIDDEN" NAME="Flag" value="0">
                                                    <INPUT TYPE="HIDDEN" NAME="enableBandSteering" value="<% tcWebApi_get("Mesh_EnableConf", "BandSteeringEnable", "s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="set" value="set">
                                                    <INPUT TYPE="HIDDEN" NAME="cancel" value="cancel">
                                                    <INPUT TYPE="HIDDEN" NAME="wifiEnbl" value="0">
                                                    <INPUT TYPE="HIDDEN" NAME="hwlEnbl" value="0">
                                                    <INPUT TYPE="HIDDEN" NAME="wlan_APenable" value="<% tcWebApi_get("WLan11ac_Common","APOn","s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="enableWifiBackup" value="<% tcWebApi_get("Wlan_Common", "IS_WIFI5_BACKUP", "s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="enableSSID" value="<% tcWebApi_get("Wlan_Entry4", "EnableSSID", "s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="ssid_2" value="<% tcWebApi_get("WLan_Entry0", "SSID", "s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="auth_2" value="">
                                                    <INPUT TYPE="HIDDEN" NAME="ssid_5" value="<% tcWebApi_get("Wlan11ac_Entry0", "SSID", "s") %>">
                                                    <INPUT TYPE="HIDDEN" NAME="auth_5" value="">
                                                    <INPUT TYPE="HIDDEN" NAME="same_pwd_2" value="0">
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD><P class="font-weight">˫Ƶ��һ</P></TD>
                                                <TD>
                                                    <INPUT class="input-onoff" type=checkbox id="bandSteering" name="bandSteering" onclick="clickBandSteering()" <% if tcWebApi_get("Mesh_EnableConf","BandSteeringEnable","h") = "1" then asp_Write("checked") end if %>>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD></TD>
                                                <TD><div class="font-help" style="margin: 5px 0px 16px; width: 260px;">2.4G��5G����ϲ���ʾ��ͬ���ź�ǿ���£���ѡ�ٶȸ����5G���硣</div></TD>
                                            </TR>
                                        </tbody>
                                    </TABLE>
                                    <div class="separate-line"></div>
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 257px;" id="bandSteer_close">
                                        <tbody>
                                            <TR>
                                                <TD class='w-130'><div class="font-weight" style="color: #0CCFA8;">2.4G Wi-Fi</div></TD>
                                                <TD><INPUT class="input-onoff" name=wl2Enbl onclick=wl2ClickEnble(this) type=checkbox value=ON  <% if tcWebApi_get("WLan_Common","APOn","h") = "1" then asp_Write("checked") end if %> >
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD><INPUT tyepe="text" id=wlSsid size=10 name=wlSsid value="<% If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if %>"></TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD>
                                                    <span id="inpsw1" style="position: relative;">
                                                    <INPUT type=password maxLength=65 id=wlWpaPsk name=wlWpaPsk style="padding-right: 42px;" value='<% if tcWebApi_get("WLan_Entry0", "WPAPSK", "h") <> "N/A" then tcWebApi_get("WLan_Entry0", "WPAPSK", "s") end if %>' onkeyup="doshowStrongChange2(this.value)" <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then asp_Write("disabled") end if %>>
                                                    <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw2" data-flag=0></div>
                                                    <% else %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw2" data-flag=0 onclick="doshowpswChange2()"></div>
                                                    <% end if %>
                                                    </span>
                                                    <% if TCWebApi_get("WebCurSet_Entry", "IsSupportWIFIShowPSW", "h") = "1" then %>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        function doshowpswChange2() 
                                                        {
                                                            clearTimeout(changeTimer2);
                                                            with (getElById('ConfigForm')){
                                                                var flag = getElById('cb_enablshowpsw2').getAttribute('data-flag');
                                                                if (flag==0) {
                                                                    getElById("wlWpaPsk").setAttribute("type", "text");
                                                                    getElById("cb_enablshowpsw2").setAttribute("data-flag", "1");
                                                                }
                                                                else {
                                                                    getElById("wlWpaPsk").setAttribute("type", "password");
                                                                    getElById("cb_enablshowpsw2").setAttribute("data-flag", "0");
                                                                }
                                                            }
                                                        }
                                                    </script>
                                                    <% end if %>
                                                </TD>
                                            </TR>
                                            <TR id="strength_label2" style="display: none;">
                                                <TD></TD>
                                                <TD class='w-130'><P class="pwd-tips" style="height: 30px;line-height: 30px;">����ǿ�ȣ�<span></span></P></TD>
                                            </TR>
                                            <TR>
                                                <TD><div style="height: 32px;"></div></TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><div class="font-weight">5G Wi-Fi</div></TD>
                                                <TD><INPUT class="input-onoff" name=wl5Enbl onclick=wl5ClickEnble(this) type=checkbox value=ON  <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %> >
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD><INPUT TYPE="TEXT" id="ESSID" NAME="ESSID" MAXLENGTH="32" VALUE="<% If tcWebApi_get("Wlan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry0","SSID","s") end if %>"></TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD>
                                                    <span id="inpsw2" style="position: relative;"><INPUT TYPE="PASSWORD" ID="PreSharedKey1" NAME="PreSharedKey1" SIZE="48" MAXLENGTH="64"  style="padding-right: 42px;" onkeyup="doshowStrongChange5(this.value)" VALUE="<% If tcWebApi_get("Wlan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("Wlan11ac_Entry0","WPAPSK","s") end if %>" <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then asp_Write("disabled") end if %>>
                                                    <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw5" data-flag=0></div>
                                                    <% else %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw5" data-flag=0 onclick="doshowpswChange5()"></div>
                                                    <% end if %>
                                                    </span>

													<%if TCWebApi_get("WebCurSet_Entry","IsSupportWIFIShowPSW","h" ) = "1" then%>
													<script language="JavaScript" type="text/JavaScript">
													
													function doshowpswChange5() {
                                                        clearTimeout(changeTimer5);
														with (getElById('ConfigForm')){
                                                            var flag = getElById('cb_enablshowpsw5').getAttribute('data-flag');
															if (flag==0) {
                                                                getElById("PreSharedKey1").setAttribute("type", "text");
                                                                getElById("cb_enablshowpsw5").setAttribute("data-flag", "1");
                                                            }
                                                            else {
                                                                getElById("PreSharedKey1").setAttribute("type", "password");
                                                                getElById("cb_enablshowpsw5").setAttribute("data-flag", "0");
                                                            }
														}
													}
													
													</script>
													<%end if%>
												</TD>
                                            </TR>
                                            <TR id="strength_label5" style="display: none;">
                                                <TD></TD>
                                                <TD class='w-130'><P class="pwd-tips" style="height: 30px;line-height: 30px;">����ǿ�ȣ�<span></span></P></TD>
                                            </TR>
                                            <TR id="same">
                                                <TD></TD>
                                                <TD>
                                                    <INPUT id='samePwd' class="input-onoff" type=checkbox name='samePwd' onclick="clickSame(PreSharedKey1, wlWpaPsk)">
                                                    <span style="margin-left: -10px;color: #3F414A;">5G ʹ��2.4G Wi-Fi����</span>
                                                </TD>
                                            </TR>
                                            <script>
                                                function clickSame(PreSharedKey1, wlWpaPsk) {
                                                    if ( getElById('samePwd').checked == true )
                                                    {
                                                        PreSharedKey1.disabled = true;
                                                        PreSharedKey1.value = wlWpaPsk.value;
                                                        document.ConfigForm.same_pwd_2.value = 1;
                                                    }
                                                    else
                                                    {
                                                        PreSharedKey1.disabled = false;
                                                        document.ConfigForm.same_pwd_2.value = 0;
                                                    }
                                                }
                                            </script>
                                        </tbody>
                                    </TABLE>

                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 257px;" id="bandSteer_open">
                                        <tbody>
                                            <TR>
                                                <TD><div class="font-weight">Wi-Fi����</div></TD>
                                                <TD>
                                                    <INPUT class="input-onoff" name=Enbl onclick=ClickEnble(this) type=checkbox value=ON>
                                                </TD>
                                                <script>
                                                    var Enbl_2 = "<% tcWebApi_get("WLan_Common","APOn","s") %>";
                                                    var Enbl_5 = "<% tcWebApi_get("WLan11ac_Common","APOn","s") %>";
                                                    if(Enbl_2 == 1 || Enbl_5 == 1) {
                                                        var enable_2 = "<% tcWebApi_get("WLan_Entry0","EnableSSID","s") %>";
                                                        var enable_5 = "<% tcWebApi_get("Wlan11ac_Entry0","EnableSSID","s") %>";
                                                        if((Enbl_2 == 1 && enable_2 == 1) || (Enbl_5 == 1 && enable_5 == 1)) {
                                                            getElById('Enbl').checked = true;
                                                        }
                                                    }
                                                </script>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD><INPUT tyepe="text" id=Ssid size=10 name=Ssid value="<% If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if %>"></TD>
                                            </TR>
                                            <TR>
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD>
                                                    <span id="inpsw3" style="position: relative;">
                                                    <INPUT type=password maxLength=65 id=WpaPsk name=WpaPsk style="padding-right: 42px;" value='<% if tcWebApi_get("WLan_Entry0", "WPAPSK", "h") <> "N/A" then tcWebApi_get("WLan_Entry0", "WPAPSK", "s") end if %>' onkeyup="doshowStrongChange3(this.value)" <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then asp_Write("disabled") end if %>>
                                                    <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw" data-flag=0></div>
                                                    <% else %>
                                                    <div class="input_eye eye-pwd" id="cb_enablshowpsw" data-flag=0 onclick="doshowpswChange3()"></div>
                                                    <% end if %>
                                                    </span>
                                                    <% if TCWebApi_get("WebCurSet_Entry", "IsSupportWIFIShowPSW", "h") = "1" then %>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        function doshowpswChange3() 
                                                        {
                                                            clearTimeout(changeTimer3);
                                                            with (getElById('ConfigForm')){
                                                                var flag = getElById('cb_enablshowpsw').getAttribute('data-flag');
                                                                if (flag==0) {
                                                                    getElById("WpaPsk").setAttribute("type", "text");
                                                                    getElById("cb_enablshowpsw").setAttribute("data-flag", "1");
                                                                }
                                                                else {
                                                                    getElById("WpaPsk").setAttribute("type", "password");
                                                                    getElById("cb_enablshowpsw").setAttribute("data-flag", "0");
                                                                }
                                                            }
                                                        }
                                                    </script>
                                                    <% end if %>
                                                </TD>
                                            </TR>
                                            <TR id="strength_label3" style="display: none;">
                                                <TD></TD>
                                                <TD class='w-130'><P class="pwd-tips" style="height: 30px;line-height: 30px;">����ǿ�ȣ�<span></span></P></TD>
                                            </TR>
                                        </tbody>
                                    </TABLE>

                                    <div class="separate-line" style="margin-top: 12px;"></div>
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 58%;margin: 23px 0 0 257px;">
                                        <tbody>
                                            <TR>
                                                <TD><P class="font-weight" style="width: 72px;">Wi-Fi 5��������</P></TD>
                                                <TD><INPUT class="input-onoff" type=checkbox name=wifiBackupEnable id=wifiBackupEnable onclick="clickWifiBackup()" <% if tcWebApi_get("Wlan_Common","IS_WIFI5_BACKUP","h") = "1" then asp_Write("checked") end if %>></TD>
                                            </TR>
                                            <TR>
                                                <TD></TD>
                                                <TD><div class="font-help" style="width: 375px; margin-top: 6px;">һЩ���豸֧��Wi-Fi6Ч�����ã����ܳ���ɨ�費��Wi-Fi�źš����Ӳ���Wi-Fi������������˿��ؾ��ܼ�����һ����豸��</div></TD>
                                            </TR>
                                            <TR id="wifi_2_backup">
                                                <TD class='w-130'><P class="form-text" style="margin-bottom: 0;">2.4G ����</P></TD>
                                                <TD><P class="form-text" style="margin-left: 0;margin-bottom: 0;"><% tcWebApi_get("Wlan_Entry4", "SSID", "s") %></P></TD>
                                            </TR>
                                            <TR id="wifi_5_backup">
                                                <TD class='w-130'><P class="form-text">5G ����</P></TD>
                                                <TD><P class="form-text" style="margin-left: 0;"><% tcWebApi_get("Wlan11ac_Entry3", "SSID", "s") %></P></TD>
                                            </TR>
                                            <TR id="wifi_backup">
                                                <TD class='w-130'><P class="form-text">Wi-Fi����</P></TD>
                                                <TD><P class="form-text" style="margin-left: 0;"><% tcWebApi_get("Wlan_Entry4", "SSID", "s") %></P></TD>
                                            </TR>
                                            <TR id="backupPwd" style="display: none;">
                                                <TD class='w-130'></TD>
                                                <TD><div class="font-help" style="width: 375px;">����wifi5��wifi���ֳ���21λ���Զ���ȡ������ȫ��׺</div></TD>
                                            </TR>
                                            <TR>
                                                <TD colspan='2'>
                                                    <P style="margin: 32px 0px 60px 142px;">
                                                        <input type="hidden" name="Save_Flag" id='Save_Flag' value="0">
                                                        <BUTTON id="btnOK" onclick="SubmitForm()" type="button" name="btnOK">�� ��</BUTTON>
                                                    </P>
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