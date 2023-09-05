<%
if tcWebApi_get("WebCustom_Entry","isNPUSupported", "h") = "Yes" then	
if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then	
	tcWebApi_constSet("WebCurSet_Entry", "wlan_ac_id", "0")
end if
	if tcWebApi_get("WebCustom_Entry","isSSIDChineseSupported", "h") = "Yes" then	
	tcWebApi_constSet("WebCurSet_Entry", "currRadio", "1")
	end if
end if

if tcWebApi_get("WebCurSet_Entry","CurrentAccess", "h") = "1" then	
if tcWebApi_get("Mesh_Common","CmccApMeshFlag", "h") <> "1" then	
	tcWebApi_constSet("WebCurSet_Entry", "wlan_ac_id", "0")
end if
end if

If Request_Form("wlanWEPFlag")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","0")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	TCWebApi_set("WLan11ac_Common","APOn","wlan_APon")
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
    TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
    if tcwebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then
        TCWebApi_set("Wlan11ac_Entry","WirelessMode","WirelessMode")
    else
        TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
    end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		If Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if	
			If tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			End if
		End if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then 
		TCWebApi_set("Wlan11ac_Entry","HT_MCS","WLANMCS")
		end if 
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("Wlan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("Wlan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("Wlan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
	
	TCWebApi_set("WLan11ac_Common","BasicRate","BasicRate_Value1")

if tcWebApi_get("WebCustom_Entry","isSSIDChineseSupported", "h") = "Yes" then	
	TCWebApi_JsonHook("set_ssidname_info","","ESSID")
else
	TCWebApi_set("Wlan11ac_Entry","SSID","ESSID")
end if
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
	TCWebApi_set("Wlan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("Wlan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
	end if
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("Wlan11ac_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("Wlan11ac_Entry","AccessPolicy","WLAN_FltAction")
	end if
	if Request_Form("isWPSSupported") = "1" then
	if Request_Form("SSID_INDEX") = "0" then
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("Wlan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("Wlan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("Wlan11ac_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("Wlan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if
	end if
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC0","WLANFLT_MAC1")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC1","WLANFLT_MAC2")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC2","WLANFLT_MAC3")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC3","WLANFLT_MAC4")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC4","WLANFLT_MAC5")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC5","WLANFLT_MAC6")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC6","WLANFLT_MAC7")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC7","WLANFLT_MAC8")

	TCWebApi_set("Wlan11ac_Entry","AuthMode","WEP_Selection")
	if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
		TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_5")
	end if 
	if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then	
		tcWebApi_constSet("alinkmgr_Entry", "SyncCode", "-1")
	end if

    tcWebApi_commit("Wlan11ac_Entry")
	if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
		tcWebApi_commit("Wlan11ac_Entry3")
	end if 
	TCWebApi_save()
end if

If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","0")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "ARGENTINA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "ARMENIA" then	
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "AUSTRIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "AZERBAIJAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "BELGIUM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BELIZE" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BOLIVIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BRAZIL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BRUNEI DARUSSALAM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BULGARIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "CHINA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
	elseif Request_Form("Countries_Channels") = "CROATIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "CYPRUS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "CZECH REPUBLIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "DENMARK" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "EGYPT" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "ESTONIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "FINLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "FRANCE" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")	
	elseif Request_Form("Countries_Channels") = "GEORGIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "GERMANY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "GREECE" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "HUNGARY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ICELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "INDONESIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "IRAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "IRELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ITALY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "JAPAN" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand9")
	elseif Request_Form("Countries_Channels") = "KOREA DEMOCRATIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "KOREA REPUBLIC" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "LATVIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LITHUANIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LUXEMBOURG" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "MONACO" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "NETHERLANDS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PERU" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "PHILIPPINES" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "POLAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PORTUGAL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SLOVAKIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SLOVENIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SOUTH AFRICA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SPAIN" then             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SWEDEN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SWITZERLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "TRINIDAD AND TOBAGO" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TUNISIA" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TURKEY" then  
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "UNITED KINGDOM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")	
	elseif Request_Form("Countries_Channels") = "URUGUAY" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "VENEZUELA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	else
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
	end if
	TCWebApi_save()
End If
IF Request_Form("wlanWEPFlag")="2" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","0")
	TCWebApi_save()
End if
If Request_Form("wlanWEPFlag")="3" Then
	if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then
		TCWebApi_set("WLan11ac_Common","HT_TxStream","TxStream_Action")	
		TCWebApi_set("WLan11ac_Common","HT_RxStream","RxStream_Action")		
	end if
	tcWebApi_set("WLan11ac_Common","TxPower","wlTxPwr")
	TCWebApi_set("Wlan11ac_Entry","AuthMode","WEP_Selection")	
    tcWebApi_commit("Wlan11ac_Entry")
	if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
		TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_5")
		tcWebApi_commit("Wlan11ac_Entry3")
	end if 

	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","0")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "CHINA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
	end if
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	TCWebApi_set("WLan11ac_Common","APOn","wlan_APon")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
  TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
    if tcwebApi_get("WebCustom_Entry","isWirelessModeEntrySupported","h") = "Yes" then
		TCWebApi_set("Wlan11ac_Entry","WirelessMode","WirelessMode")
	else
	    TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
	end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		if Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if
			if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			end if
		end if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		if tcWebApi_get("WebCustom_Entry", "is11AXModeSupported", "h") <> "Yes" then 
			TCWebApi_set("Wlan11ac_Entry","HT_MCS","WLANMCS")
		end if 
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("Wlan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("Wlan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")

	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("Wlan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")	
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
if tcWebApi_get("WebCustom_Entry","isSSIDChineseSupported", "h") = "Yes" then	
	TCWebApi_JsonHook("set_ssidname_info","","ESSID")
else
	TCWebApi_set("Wlan11ac_Entry","SSID","ESSID")
end if
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")	
	TCWebApi_set("Wlan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("Wlan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
	end if

	if Request_Form("isDot1XSupported")  = "1" then
		if Request_Form("WEP_Selection")  = "Radius-WEP64" then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter1")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","radiusSVR_IP1")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","radiusSVR_Port1")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","radiusSVR_Key1")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP1")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port1")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key1")
			end if
		elseif Request_Form("WEP_Selection")  = "Radius-WEP128"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter2")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","radiusSVR_IP2")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","radiusSVR_Port2")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","radiusSVR_Key2")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP2")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port2")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key2")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter3")
			TCWebApi_set("Wlan11ac_Entry","RekeyInterval","WPARekeyInter3")			
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","radiusSVR_IP3")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","radiusSVR_Port3")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","radiusSVR_Key3")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP3")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port3")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key3")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA2"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter4")
			TCWebApi_set("Wlan11ac_Entry","RekeyInterval","WPARekeyInter4")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","radiusSVR_IP4")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","radiusSVR_Port4")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","radiusSVR_Key4")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP4")				
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port4")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key4")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
			TCWebApi_set("WLan11ac_Common","session_timeout_interval","radiusSVR_ReAuthInter5")
			TCWebApi_set("Wlan11ac_Entry","RekeyInterval","WPARekeyInter5")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","radiusSVR_IP5")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","radiusSVR_Port5")
			TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","radiusSVR_Key5")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","bakradiusSVR_IP5")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","bakradiusSVR_Port5")
				TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","bakradiusSVR_Key5")
			end if
		end if	
	end if	
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("Wlan11ac_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("Wlan11ac_Entry","AccessPolicy","WLAN_FltAction")
	end if
	if Request_Form("isWPSSupported") = "1" then	
	if Request_Form("SSID_INDEX") = "0" then
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("Wlan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("Wlan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("Wlan11ac_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("Wlan11ac_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if	
	end if		
	if Request_Form("isWDSSupported") = "1" then
		TCWebApi_set("WLan11ac_WDS","WdsEnable","WLAN_WDS_Active")
		if Request_form("WLAN_WDS_Active") = "1" then
			if Request_Form("WEP_Selection") = "OPEN" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_NONE")
			elseif Request_Form("WEP_Selection") = "WEP-64Bits"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "WEP-128Bits" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "Radius-WEP64" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "Radius-WEP128" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "WPAPSK" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2PSK" then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPAPSKWPA2PSK"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA1WPA2"  then
				TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan11ac_WDS","WdsKey","WDS_Key")
			end if
				
			TCWebApi_set("WLan11ac_WDS","Wds_MAC0","WLANWDS_PEER_MAC1")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC1","WLANWDS_PEER_MAC2")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC2","WLANWDS_PEER_MAC3")
			TCWebApi_set("WLan11ac_WDS","Wds_MAC3","WLANWDS_PEER_MAC4")
		end if
	end if			
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC0","WLANFLT_MAC1")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC1","WLANFLT_MAC2")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC2","WLANFLT_MAC3")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC3","WLANFLT_MAC4")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC4","WLANFLT_MAC5")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC5","WLANFLT_MAC6")	
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC6","WLANFLT_MAC7")		
	TCWebApi_set("Wlan11ac_Entry","WLan_MAC7","WLANFLT_MAC8")	
	if Request_Form("WEP_Selection") = "WEP-64Bits"  then
		TCWebApi_set("Wlan11ac_Entry","WEPAuthType","WEP_TypeSelection1")
		TCWebApi_set("Wlan11ac_Entry","DefaultKeyID","DefWEPKey3")
		TCWebApi_set("Wlan11ac_Entry","Key1Str","WEP_Key13")	
		TCWebApi_set("Wlan11ac_Entry","Key2Str","WEP_Key23")		
		TCWebApi_set("Wlan11ac_Entry","Key3Str","WEP_Key33")		
		TCWebApi_set("Wlan11ac_Entry","Key4Str","WEP_Key43")
	elseif Request_Form("WEP_Selection")  = "WEP-128Bits" then
		TCWebApi_set("Wlan11ac_Entry","WEPAuthType","WEP_TypeSelection2")
		TCWebApi_set("Wlan11ac_Entry","DefaultKeyID","DefWEPKey4")
		TCWebApi_set("Wlan11ac_Entry","Key1Str","WEP_Key14")	
		TCWebApi_set("Wlan11ac_Entry","Key2Str","WEP_Key24")		
		TCWebApi_set("Wlan11ac_Entry","Key3Str","WEP_Key34")		
		TCWebApi_set("Wlan11ac_Entry","Key4Str","WEP_Key44")
	elseif Request_Form("WEP_Selection")  = "Radius-WEP64" then
		TCWebApi_set("Wlan11ac_Entry","DefaultKeyID","DefWEPKey1")
		TCWebApi_set("Wlan11ac_Entry","Key1Str","WEP_Key11")	
		TCWebApi_set("Wlan11ac_Entry","Key2Str","WEP_Key21")		
		TCWebApi_set("Wlan11ac_Entry","Key3Str","WEP_Key31")		
		TCWebApi_set("Wlan11ac_Entry","Key4Str","WEP_Key41")				
	elseif Request_Form("WEP_Selection")  = "Radius-WEP128" then
		TCWebApi_set("Wlan11ac_Entry","DefaultKeyID","DefWEPKey2")
		TCWebApi_set("Wlan11ac_Entry","Key1Str","WEP_Key12")	
		TCWebApi_set("Wlan11ac_Entry","Key2Str","WEP_Key22")		
		TCWebApi_set("Wlan11ac_Entry","Key3Str","WEP_Key32")		
		TCWebApi_set("Wlan11ac_Entry","Key4Str","WEP_Key42")
	elseif Request_Form("WEP_Selection")  = "WPAPSK" then
		TCWebApi_set("Wlan11ac_Entry","WPAPSK","PreSharedKey2")
		if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
			TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey2")
		end if 
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection5")
		TCWebApi_set("Wlan11ac_Entry","RekeyInterval","keyRenewalInterval2")
	elseif Request_Form("WEP_Selection")  = "WPA2PSK" then
		TCWebApi_set("Wlan11ac_Entry","WPAPSK","PreSharedKey1")
		if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
			TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey1")
		end if 
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection4")
		TCWebApi_set("Wlan11ac_Entry","RekeyInterval","keyRenewalInterval1")
	elseif Request_Form("WEP_Selection")  = "WPAPSKWPA2PSK"  then
		TCWebApi_set("Wlan11ac_Entry","WPAPSK","PreSharedKey3")
		if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
			TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey3")
		end if 
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection6")
		TCWebApi_set("Wlan11ac_Entry","RekeyInterval","keyRenewalInterval3")
	elseif Request_Form("WEP_Selection")  = "WPA"  then
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection1")
	elseif Request_Form("WEP_Selection")  = "WPA2"  then
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection2")
	elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
		TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection3")
	end if

	If tcwebApi_get("WebCustom_Entry","isWPA3ModeSupported","h" ) = "Yes" then
		if Request_Form("WEP_Selection")  = "WPA2PSKWPA3PSK"  then
			TCWebApi_set("Wlan11ac_Entry","WPAPSK","PreSharedKey_WPA2WPA3")
			if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
				TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey_WPA2WPA3")
			end if 
			TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection_WPA2WPA3")
			TCWebApi_set("Wlan11ac_Entry","RekeyInterval","keyRenewalInterval_WPA2WPA3")
		elseif Request_Form("WEP_Selection")  = "WPA3PSK"  then
			TCWebApi_set("Wlan11ac_Entry","WPAPSK","PreSharedKey_WPA3")
			if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
				TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey_WPA3")
			end if 
			TCWebApi_set("Wlan11ac_Entry","EncrypType","TKIP_Selection_WPA3")
			TCWebApi_set("Wlan11ac_Entry","RekeyInterval","keyRenewalInterval_WPA3")
		end if
		If tcwebApi_get("Info_WLan11ac","isDot1XSupported","h" ) = "Yes" then
			if Request_Form("WEP_Selection")  = "WPA3"  then
				TCWebApi_set("Wlan11ac_Entry","EncrypType","WPA3_TKIP_Selection1")
				TCWebApi_set("WLan11ac_Common","session_timeout_interval","WPA3_radiusSVR_ReAuthInter3")
				TCWebApi_set("Wlan11ac_Entry","RekeyInterval","WPA3_WPARekeyInter")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","WPA3_radiusSVR_IP")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","WPA3_radiusSVR_Port")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","WPA3_radiusSVR_Key")
				if Request_Form("isDot1XEnhanceSupported") = "1" then
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","WPA3_bakradiusSVR_IP")
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","WPA3_bakradiusSVR_Port")
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","WPA3_bakradiusSVR_Key")
				end if
			elseif Request_Form("WEP_Selection")  = "WPA3-192Bit"  then
				TCWebApi_set("Wlan11ac_Entry","EncrypType","WPA3_192Bit_TKIP_Selection1")
				TCWebApi_set("WLan11ac_Common","session_timeout_interval","WPA3_192Bit_radiusSVR_ReAuthInter")
				TCWebApi_set("Wlan11ac_Entry","RekeyInterval","WPA3_192Bit_WPARekeyInter")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Server","WPA3_192Bit_radiusSVR_IP")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Port","WPA3_192Bit_radiusSVR_Port")
				TCWebApi_set("Wlan11ac_Entry","RADIUS_Key","WPA3_192Bit_radiusSVR_Key")
				if Request_Form("isDot1XEnhanceSupported") = "1" then
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Server","WPA3_192Bit_bakradiusSVR_IP")
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Port","WPA3_192Bit_bakradiusSVR_Port")
					TCWebApi_set("Wlan11ac_Entry","BAK_RADIUS_Key","WPA3_192Bit_bakradiusSVR_Key")
				end if
			end if 
		end if 
	end if
	If tcwebApi_get("WebCustom_Entry","is11AXModeSupported","h" ) = "Yes" then
		TCWebApi_set("WLan11ac_Common", "TWTSupport", "TWTSupport_flag")
		TCWebApi_set("WLan11ac_Common", "MuOfdmaDlEnable", "Wlan11acMuOfdmaDlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuOfdmaUlEnable", "Wlan11acMuOfdmaUlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuMimoDlEnable", "Wlan11acMuMimoDlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "MuMimoUlEnable", "Wlan11acMuMimoUlEnable_flag")
		TCWebApi_set("WLan11ac_Common", "SREnable", "Wlan11acSREnable_flag")
	End if	
	If tcwebApi_get("WebCustom_Entry","is11AXEnhanceModeSupported","h" ) = "Yes" then
		TCWebApi_set("Wlan11ac_Common", "BSSColorNum", "BSSColorNum_flag")
		TCWebApi_set("Wlan11ac_Common", "RTS", "RTS_flag")
		TCWebApi_set("Wlan11ac_Common", "CBSSIDMaxIndex", "CBSSIDMaxIndex_flag")
		TCWebApi_set("Wlan11ac_Common", "IndividualTWTSupport", "IndividualTWTSupport_flag")
		TCWebApi_set("Wlan11ac_Common", "HELDPCE", "HELDPC_flag")
		TCWebApi_set("Wlan11ac_Common", "SpatialReuse", "SpatialReuse_flag")
	End if	

	if Request_Form("isWPSSupported") = "1" then
	TCWebApi_set("Wlan11ac_Entry","WPSConfStatus","WPSConfigured")
	end if		
	if tcWebApi_get("WebCustom_Entry", "isNPUSupported", "h") = "Yes" then	
		tcWebApi_constSet("alinkmgr_Entry", "SyncCode", "-1")
	end if

	if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then
		tcWebApi_commit("Wlan11ac_Entry3")
	end if 
	TCWebApi_save()
	tcWebApi_commit("Wlan11ac_Entry")	
End If
if Request_Form("isWDSSupported") = "1" then
	If Request_Form("wlanWEPFlag")="4" Then
		TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
	End If
	TCWebApi_save()
End If
if Request_Form("isWPSSupported") = "1" then
    If Request_Form("WpsStart")="1" Then
        tcWebApi_constSet("WebCurSet_Entry", "web_runacwps", "1")
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
end if

if Request_Form("WpsStart") <> "1" Then
	tcWebApi_get("Info_WLan11ac", "Test", "h")
	tcWebApi_constSet("WebCurSet_Entry", "info_wlan11ac_read", "1")
end if

%>
