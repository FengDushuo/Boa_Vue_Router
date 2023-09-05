<%

if Request_Form("isWPSSupported") = "1" then
    If Request_Form("WpsStart")="1" Then
        tcWebApi_constSet("WebCurSet_Entry", "web_runacwps", "1")
        if Request_Form("isInWPSing") = tcWebApi_get("Info_WLan11ac", "wlanWPStimerRunning_0", "h") then
            TCWebApi_set("Info_WLan11ac","WPSActiveStatus","WpsStart")
            if Request_Form("UseWPS_Selection") = "1" then
            TCWebApi_set("Wlan11ac_Entry0","WPSConfMode","WpsConfModeAll")
            else
                TCWebApi_set("Wlan11ac_Entry0","WPSConfMode","WpsConfModeNone")
            end if
            if Request_form("WPSMode_Selection") = "0" then
                TCWebApi_set("Wlan11ac_Entry0","enrolleePinCode","WPSEnrolleePINCode")
            end if
            TCWebApi_set("Wlan11ac_Entry0","WPSMode","WPSMode_Selection")
        end if
        TCWebApi_commit("Wlan11ac_Entry0")
	    tcWebApi_save()
    else
        if Request_Form("isInWPSing") = tcWebApi_get("Info_WLan11ac", "wlanWPStimerRunning_0", "h") then
            TCWebApi_set("Info_WLan11ac","WPSActiveStatus","WpsStart")
            if Request_Form("UseWPS_Selection") = "1" then
            TCWebApi_set("Wlan11ac_Entry","WPSConfMode","WpsConfModeAll")
            else
                TCWebApi_set("Wlan11ac_Entry0","WPSConfMode","WpsConfModeNone")
            end if
            if Request_form("WPSMode_Selection") = "0" then
                TCWebApi_set("Wlan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
            end if
            TCWebApi_set("Wlan11ac_Entry","WPSMode","WPSMode_Selection")
        end if
        TCWebApi_commit("Wlan11ac_Entry")
	    tcWebApi_save()
    End If
	
	If Request_Form("WpsOOB")="1" Then
		TCWebApi_set("Info_WLan11ac","WPSOOBActive","WpsOOB")
		tcWebApi_commit("Wlan11ac_Entry")
	end if

	If Request_Form("WpsGenerate") = "1" then
		TCWebApi_set("Info_WLan11ac","WPSGenPinCode","WpsGenerate")
		TCWebApi_commit("Wlan11ac_Entry")
	end if
	TCWebApi_save()
else
	tcWebApi_commit("Wlan11ac_Entry")
end if

if Request_Form("WpsStart") <> "1" Then
	tcWebApi_get("Info_WLan11ac", "Test", "h")
	tcWebApi_constSet("WebCurSet_Entry", "info_wlan11ac_read", "1")
end if

%>
