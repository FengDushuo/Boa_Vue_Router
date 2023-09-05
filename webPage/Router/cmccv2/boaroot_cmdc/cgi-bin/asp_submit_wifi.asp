<%
if Request_Form("Save_Flag") = "1" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    if tcWebApi_get("WebCustom_Entry", "isSSIDChineseSupported", "h") = "Yes" then
        TCWebApi_JsonHook("set_ssidname_info", "", "wlSsid")
    else
        TCWebApi_set("WLan_Entry0", "SSID", "wlSsid")
    end if
        
    TCWebApi_set("WLan_Entry0", "WPAPSK", "wlWpaPsk")
        
    TCWebApi_commit("WLan_Entry0")

    if tcWebApi_get("WebCustom_Entry", "isSSIDChineseSupported", "h") = "Yes" then  
        TCWebApi_JsonHook("set_ssidname_info","","ESSID")
    else
        TCWebApi_set("Wlan11ac_Entry0","SSID","ESSID")
    end if

    if Request_Form("same_pwd_2") = "1" then
        TCWebApi_set("Wlan11ac_Entry0","WPAPSK","wlWpaPsk")
    else
        TCWebApi_set("Wlan11ac_Entry0","WPAPSK","PreSharedKey1")
    end if
    TCWebApi_commit("Wlan11ac_Entry0")

    if Request_Form("enableWifiBackup") = "1" then
        TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
        TCWebApi_set("Wlan_Entry4", "WPAPSK", "wlWpaPsk")

        TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_5")
        if Request_Form("same_pwd_2") = "1" then
            TCWebApi_set("Wlan11ac_Entry3","WPAPSK","wlWpaPsk")
        else
            TCWebApi_set("Wlan11ac_Entry3","WPAPSK","PreSharedKey1")
        end if
        TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
        TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
        
        tcWebApi_commit("Wlan_Entry4")
        tcWebApi_commit("Wlan11ac_Entry3")
    else
        TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
        TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

        tcWebApi_commit("Wlan_Entry4")
        tcWebApi_commit("Wlan11ac_Entry3")
    end if

    tcWebApi_save()

elseif Request_Form("Save_Flag") ="2" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    if tcWebApi_get("WebCustom_Entry", "isSSIDChineseSupported", "h") = "Yes" then
        TCWebApi_JsonHook("set_ssidname_info", "", "Ssid")
    else
        TCWebApi_set("WLan_Entry0", "SSID", "Ssid")
        TCWebApi_set("Wlan11ac_Entry0", "SSID", "Ssid")
    end if

    TCWebApi_set("WLan_Entry0", "WPAPSK", "WpaPsk")
    TCWebApi_set("Wlan11ac_Entry0", "WPAPSK", "WpaPsk")
    TCWebApi_commit("WLan_Entry0")
    TCWebApi_commit("Wlan11ac_Entry0")

    if Request_Form("enableWifiBackup") = "1" then
        TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
        TCWebApi_set("Wlan_Entry4", "WPAPSK", "WpaPsk")

        TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_2")
        TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "WpaPsk")
        TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
        TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
        
        tcWebApi_commit("Wlan_Entry4")
        tcWebApi_commit("Wlan11ac_Entry3")
    else
        TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
        TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

        tcWebApi_commit("Wlan_Entry4")
        tcWebApi_commit("Wlan11ac_Entry3")
    end if

    tcWebApi_save()

elseif Request_Form("Save_Flag") ="3" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    if tcWebApi_get("Mesh_dat","MapEnable", "h") = "1" then
        if Request_Form("enableBandSteering") = "1" then
            tcWebApi_constSet("Wlan11ac_Common", "Action", "set")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex58", "1")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex24", "1")

            tcWebApi_save()
            tcWebApi_commit("Wlan11ac_Common")

            tcWebApi_set("Mesh_EnableConf", "BandSteeringEnable", "enableBandSteering")
            tcWebApi_commit("Mesh_EnableConf")
            tcWebApi_save()

            tcWebApi_set("Wlan_Common", "IS_WIFI5_BACKUP", "enableWifiBackup")

            if Request_Form("enableWifiBackup") = "1" then
                TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
                TCWebApi_set("Wlan_Entry4", "AuthMode", "auth_2")
                TCWebApi_set("Wlan_Entry4", "WPAPSK", "WpaPsk")

                TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_2")
                TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_2")
                TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "WpaPsk")
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
                
                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            else
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            end if
            
            tcWebApi_save()
        else
            if Request_Form("Flag") = "5" then
            tcWebApi_constSet("Wlan11ac_Common", "Action", "cancel")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex58", "1")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex24", "1")

            tcWebApi_commit("Wlan11ac_Common")
            end if

            tcWebApi_set("Mesh_EnableConf", "BandSteeringEnable", "enableBandSteering")

            tcWebApi_commit("Mesh_EnableConf")
            tcWebApi_save()

            tcWebApi_set("Wlan_Common", "IS_WIFI5_BACKUP", "enableWifiBackup")

            if Request_Form("enableWifiBackup") = "1" then
                TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
                TCWebApi_set("Wlan_Entry4", "AuthMode", "auth_2")
                TCWebApi_set("Wlan_Entry4", "WPAPSK", "WpaPsk")

                TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_5")
                TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_5")
                TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey1")
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
                
                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            else
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            end if

            tcWebApi_save()
        end if
    else 
        if Request_Form("enableBandSteering") = "1" then
            tcWebApi_constSet("Wlan11ac_Common", "Action", "set")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex58", "1")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex24", "1")

            tcWebApi_save()
            tcWebApi_commit("Wlan11ac_Common")

            tcWebApi_set("Mesh_EnableConf", "BandSteeringEnable", "enableBandSteering")
            tcWebApi_commit("Mesh_EnableConf")
            tcWebApi_save()

            tcWebApi_set("Wlan_Common", "IS_WIFI5_BACKUP", "enableWifiBackup")

            if Request_Form("enableWifiBackup") = "1" then
                TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
                TCWebApi_set("Wlan_Entry4", "AuthMode", "auth_2")
                TCWebApi_set("Wlan_Entry4", "WPAPSK", "WpaPsk")

                TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_2")
                TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_2")
                TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "WpaPsk")
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
                
                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            else
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            end if


            tcWebApi_save()
        else
            if Request_Form("Flag") = "5" then
            tcWebApi_constSet("Wlan11ac_Common", "Action", "cancel")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex58", "1")
            tcWebApi_constSet("Wlan11ac_Common", "SSIDIndex24", "1")

            tcWebApi_commit("Wlan11ac_Common")
            end if

            tcWebApi_set("Mesh_EnableConf", "BandSteeringEnable", "enableBandSteering")

            tcWebApi_commit("Mesh_EnableConf")
            tcWebApi_save()

            tcWebApi_set("Wlan_Common", "IS_WIFI5_BACKUP", "enableWifiBackup")

            if Request_Form("enableWifiBackup") = "1" then
                TCWebApi_set("Wlan_Entry4", "SSID", "ssid_2")
                TCWebApi_set("Wlan_Entry4", "AuthMode", "auth_2")
                TCWebApi_set("Wlan_Entry4", "WPAPSK", "WpaPsk")

                TCWebApi_set("Wlan11ac_Entry3", "SSID", "ssid_5")
                TCWebApi_set("Wlan11ac_Entry3", "AuthMode", "auth_5")
                TCWebApi_set("Wlan11ac_Entry3", "WPAPSK", "PreSharedKey1")

                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")
                
                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            else
                TCWebApi_set("Wlan_Entry4", "EnableSSID", "enableSSID")
                TCWebApi_set("Wlan11ac_Entry3", "EnableSSID", "enableSSID")

                tcWebApi_commit("Wlan_Entry4")
                tcWebApi_commit("Wlan11ac_Entry3")
            end if

            tcWebApi_save()
        end if
    end if
elseif Request_Form("Save_Flag") ="4" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    TCWebApi_set("WLan_Common", "APOn", "hwlEnbl")
    TCWebApi_commit("WLan_Entry")
    tcWebApi_save()
elseif Request_Form("Save_Flag") ="5" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
    TCWebApi_commit("WLan11ac_Entry")
    tcWebApi_save()
elseif Request_Form("Save_Flag") ="6" then
    TCWebApi_set("System_Entry","SaveFlag","Flag")
    TCWebApi_set("WLan_Common", "APOn", "wifiEnbl")
    TCWebApi_set("WLan11ac_Common","APOn","wifiEnbl")
    TCWebApi_commit("WLan_Entry")
    TCWebApi_commit("WLan11ac_Entry")
    tcWebApi_save()
end if
%>
