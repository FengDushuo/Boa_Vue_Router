{
    <% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
    "wpsTimerRunningData" : "<% tcWebApi_get("Info_WLan11ac", "wlanWPStimerRunning_0", "s") %>"
    <% end if %>
}