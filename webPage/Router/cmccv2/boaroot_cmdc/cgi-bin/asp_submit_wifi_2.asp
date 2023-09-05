<%
if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then
if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then
	tcWebApi_constSet("WebCurSet_Entry", "wlan_id", "0")
end if
	if tcWebApi_get("WebCustom_Entry", "isSSIDChineseSupported", "h") = "Yes" then
	tcWebApi_constSet("WebCurSet_Entry", "currRadio", "0")
	end if 
end if
if tcWebApi_get("WebCurSet_Entry", "CurrentAccess", "h") = "1" then	
if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then	
	tcWebApi_constSet("WebCurSet_Entry", "wlan_id", "0")
end if
end if

If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_id","0")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "CANADA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "COLOMBIA" then	
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "DOMINICAN REPUBLIC" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "GUATEMALA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "MEXICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "NORWAY" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PANAMA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PUERTO RICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UNITED STATES" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")		
	else
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion1")
	end if
End If

if Request_Form("Save_Flag") = "1" then
	if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then	
		TCWebApi_set("WLan_Common", "HT_TxStream", "TxStream_Action")	
		TCWebApi_set("WLan_Common", "HT_RxStream", "RxStream_Action")	
	end if	
	TCWebApi_set("WLan_Common", "APOn", "hwlEnbl")
	if tcwebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then 
        TCWebApi_set("WLan_Entry","WirelessMode", "hwlgMode")
    else
        TCWebApi_set("WLan_Common","WirelessMode", "hwlgMode")
    end if
	if tcWebApi_get("WLan_Common", "rt_device", "h") = "7615" then	
		TCWebApi_set("WLan_Common", "ITxBfEn", "WLanITxBfEn")
		TCWebApi_set("WLan_Common", "ETxBfEnCond", "WLanETxBfEnCond")
		TCWebApi_set("WLan_Common", "ETxBfIncapable", "WLanETxBfIncapable")
	end if	
	TCWebApi_set("WLan_Common", "Channel", "wlChannel")
	TCWebApi_set("WLan_Entry", "HT_RATE", "wlRate")
	TCWebApi_set("WLan_Common", "TxPowerLevel", "wlTxPwr")
	TCWebApi_set("WLan_Common", "BeaconPeriod", "wls_beaint")
	TCWebApi_set("WLan_Common", "DtimPeriod", "wls_dtim_int")
	TCWebApi_set("WLan_Common", "HT_BW", "ht_bw")
if Request_Form("ht_bw") = "0" then
		tcWebApi_constSet("WLan_Common", "HT_EXTCHA", "0")
	else
		TCWebApi_set("WLan_Common","HT_EXTCHA","HT_EXTCHA")
end if
	TCWebApi_set("WLan_Common", "HT_BSSCoexistence", "bwControlhidden")
	TCWebApi_set("WLan_Common", "HT_GI", "giControl")	
	TCWebApi_set("WLan_Entry", "HideSSID", "hwlHide")
if tcWebApi_get("WebCustom_Entry", "isSSIDChineseSupported", "h") = "Yes" then	
	TCWebApi_JsonHook("set_ssidname_info", "", "wlSsid")
else
	TCWebApi_set("WLan_Entry", "SSID", "wlSsid")
end if
	if tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) <> "Yes" then
		TCWebApi_set("WLan_Entry","HT_MCS","wlMcs")
	end if 
	TCWebApi_set("WLan_Entry", "EnableSSID", "henableSsid")
	if tcwebApi_get("WebCustom_Entry", "isMaxStaNumSupported", "h") = "Yes" then
		TCWebApi_set("WLan_Entry", "MaxStaNum", "wlAssociateNum")
	end if
	TCWebApi_set("WLan_Entry", "AuthMode", "hwlAuthMode")
	TCWebApi_set("WLan_Entry", "WPAPSK", "wlWpaPsk")
	TCWebApi_set("WLan_Entry", "WEPAuthType", "wlWep")
	'TCWebApi_set("WLan_Entry", "AuthKeyLen", "wlKeyBit")
	TCWebApi_set("WLan_Entry", "EncrypType", "wlWpa")
	TCWebApi_set("WLan_Entry", "DefaultKeyID", "wlKeyIndex")
	TCWebApi_set("WLan_Entry", "Key1Str", "hwlKeys0")
	TCWebApi_set("WLan_Entry", "Key2Str", "hwlKeys1")
	TCWebApi_set("WLan_Entry", "Key3Str", "hwlKeys2")
	TCWebApi_set("WLan_Entry", "Key4Str", "hwlKeys3")
	if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then
		TCWebApi_set("Wlan_Entry4", "AuthMode", "auth_2")
    	TCWebApi_set("Wlan_Entry4", "WPAPSK", "wlWpaPsk")
	end if
	If tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan_Common", "TWTSupport", "TWTSupport")
		TCWebApi_set("Wlan_Common", "MuOfdmaDlEnable", "WlanMuOfdmaDlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuOfdmaUlEnable", "WlanMuOfdmaUlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuMimoDlEnable", "WlanMuMimoDlEnable_flag")
		TCWebApi_set("Wlan_Common", "MuMimoUlEnable", "WlanMuMimoUlEnable_flag")
		TCWebApi_set("Wlan_Common", "SREnable", "WlanSREnable_flag")
	End if
	If tcwebApi_get("WebCustom_Entry","is11AXEnhanceModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan_Common", "IndividualTWTSupport", "IndividualTWTSupport_flag")
		TCWebApi_set("Wlan_Common", "HELDPCE", "HELDPC_flag")
		TCWebApi_set("Wlan_Common", "SpatialReuse", "SpatialReuse_flag")		
		TCWebApi_set("Wlan_Common", "BSSColorNum", "BSSColorNum_flag")
		TCWebApi_set("Wlan_Common", "RTS", "RTS_flag")
		TCWebApi_set("Wlan_Common", "CBSSIDMaxIndex", "CBSSIDMaxIndex_flag")
	End if
	if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then	
		tcWebApi_constSet("alinkmgr_Entry", "SyncCode", "-1")
	end if
	if tcWebApi_get("WebCurSet_Entry", "wlan_id", "h") = "0" then	
		if Request_Form("WpsActive") = "0" then 
			TCWebApi_set("WLan_Entry0", "WPSConfMode", "WpsConfModeNone")
		else
			if Request_Form("hWpsStart") = "1" then 
				tcWebApi_constSet("WebCurSet_Entry", "web_runwps", "1")
				if Request_Form("isInWPSing") = tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") then
					TCWebApi_set("Info_WLan", "WPSActiveStatus", "hWpsStart")
					TCWebApi_set("WLan_Entry0", "WPSConfMode", "WpsConfModeAll")
					TCWebApi_set("WLan_Entry0", "WPSMode", "hWPSMode")
					if Request_form("hWPSMode") = "0" then
						TCWebApi_set("WLan_Entry0", "enrolleePinCode", "pinvalue")
					end if
				end if
				if Request_Form("isInWPSing") = tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") then
					TCWebApi_set("Info_WLan", "WPSActiveStatus", "hWpsStart")
					TCWebApi_set("WLan_Entry0", "WPSConfMode", "WpsConfModeAll")
					TCWebApi_set("WLan_Entry0", "WPSMode", "hWPSMode")
					if Request_form("hWPSMode") = "0" then
						TCWebApi_set("WLan_Entry0", "enrolleePinCode", "pinvalue")
					end if
				end if
			else
				if tcWebApi_get("Info_WLan", "wlanWPStimerRunning", "h") = "0" then
					TCWebApi_set("Info_WLan", "WPSActiveStatus", "hWpsStart")
					TCWebApi_set("WLan_Entry0", "WPSConfMode", "WpsConfModeAll")
					TCWebApi_set("WLan_Entry0", "WPSMode", "hWPSMode")
					if Request_form("hWPSMode") = "0" then
						TCWebApi_set("WLan_Entry0", "enrolleePinCode", "pinvalue")
					end if
				end if
				if tcWebApi_get("Info_WLan", "wlanWPStimerRunning_0", "h") = "0" then
					TCWebApi_set("Info_WLan", "WPSActiveStatus", "hWpsStart")
					TCWebApi_set("WLan_Entry0", "WPSConfMode", "WpsConfModeAll")
					TCWebApi_set("WLan_Entry0", "WPSMode", "hWPSMode")
					if Request_form("hWPSMode") = "0" then
						TCWebApi_set("WLan_Entry0", "enrolleePinCode", "pinvalue")
					end if
				end if
			end if
		end if
	end if
	if Request_Form("hWpsStart") = "1" then
		tcWebApi_commit("Wlan_Entry0")
	else
		TCWebApi_commit("WLan_Entry")
		if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then
			tcWebApi_commit("Wlan_Entry4")
		end if
	end if
	tcWebApi_save()
end if
If Request_Form("isWPSSupported") = "1" then
	If Request_Form("WpsGenerate") = "1" then
		TCWebApi_set("Info_WLan", "WPSGenPinCode", "WpsGenerate")
		TCWebApi_set("WLan_Entry0", "WPSMode", "hWPSMode")
		TCWebApi_commit("WLan_Entry0")
	end if
end if
if Request_Form("wlanShareCommit") = "1" then
	tcWebApi_set("WlanShare_Entry0", "UserId", "wlan_shareuserid")
	tcWebApi_commit("WlanShare_Entry0")
	tcWebApi_commit("WlanShare")
	tcWebApi_save()
end if
if Request_Form("hWpsStart") <> "1" then 
	tcWebApi_get("Info_WLan", "Test", "h")
	tcWebApi_constSet("WebCurSet_Entry", "info_wlan_read", "1")
end if

TCWebApi_set("WebCurSet_Entry","wlan_id", "recover_wlan_id")
TCWebApi_set("Wlan_Common","recover_wlan_id", "recover_wlan_id")
%> 
