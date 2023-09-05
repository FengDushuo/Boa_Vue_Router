<%
if Request_Form("Wan_Flag") = "1" then

	TCWebApi_unset("WanInfo_WanIF")
	TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
	if Request_Form("VLANMode") = "TAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlan")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "v8021P")
			TCWebApi_set("WanInfo_WanIF", "v8021PEnable", "v8021PClick")
	elseif Request_Form("VLANMode") = "UNTAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanUNTAG")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	elseif Request_Form("VLANMode") = "TRANSPARENT" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanTRANSPARENT")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	end if
	TCWebApi_set("WanInfo_WanPVC","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanPVC","ENCAP","EnCAPFlag")
	if TCWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
		tcWebApi_constSet("WanInfo_WanIF","Active","Yes")
		tcWebApi_constSet("APWanInfo_Common","FixedAPMode","Route")
	else
		TCWebApi_set("WanInfo_WanIF","Active","WanActive")
	end if
	TCWebApi_set("WanInfo_WanIF","ServiceList","serviceList")
	TCWebApi_set("WanInfo_WanIF","BandActive","bindflag")
	TCWebApi_set("WanInfo_WanIF","LAN1","bindlan1")
	if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then
	TCWebApi_set("WanInfo_WanIF","LAN2","bindlan2")
	end if
	if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then
	TCWebApi_set("WanInfo_WanIF","LAN3","bindlan3")
	TCWebApi_set("WanInfo_WanIF","LAN4","bindlan4")
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSID1","bindwireless1")
	TCWebApi_set("WanInfo_WanIF","SSID2","bindwireless2")
	TCWebApi_set("WanInfo_WanIF","SSID3","bindwireless3")
	TCWebApi_set("WanInfo_WanIF","SSID4","bindwireless4")
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSIDAC1","bindwirelessac1")
	TCWebApi_set("WanInfo_WanIF","SSIDAC2","bindwirelessac2")
	TCWebApi_set("WanInfo_WanIF","SSIDAC3","bindwirelessac3")
	TCWebApi_set("WanInfo_WanIF","SSIDAC4","bindwirelessac4")
	end if
	TCWebApi_set("WanInfo_WanIF","WanMode","wanMode")
	TCWebApi_set("WanInfo_WanIF","LinkMode","linkMode")
	if Request_Form("wanMode") = "Route" then
		TCWebApi_set("WanInfo_WanIF","MTU","MTU")
		if Request_Form("linkMode") = "linkPPP" then
			TCWebApi_set("WanInfo_WanIF","PPPGETIP","PPPGetIpFlag")
			TCWebApi_set("WanInfo_WanIF","CONNECTION","ConnectionFlag")
			TCWebApi_set("WanInfo_WanIF","USERNAME","pppUserName")
			TCWebApi_set("WanInfo_WanIF","PASSWORD","pppPassword")
            TCWebApi_set("WanInfo_WanIF","MannualdnsEnable","dnsDHCP")
            if Request_Form("dnsDHCP") = "1" then
                TCWebApi_set("WanInfo_WanIF","DNS","dns1")
                TCWebApi_set("WanInfo_WanIF","SecDNS","dns2")
                TCWebApi_set("WanInfo_WanIF","ThirdDNS","third_dns3")
            end if
			TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
			if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then
				tcWebApi_set("WanInfo_WanIF","CONNECTION","ppp_DialMethod")
				if Request_Form("ppp_DialMethod") = "Connect_on_Demand" then
					tcWebApi_set("WanInfo_WanIF","CLOSEIFIDLE","pppondemand_idletime")
				end if
			end if
		end if
	elseif Request_Form("wanMode") = "Bridge" then
			TCWebApi_set("WanInfo_WanIF","BridgeMode","bridgeMode")
			TCWebApi_set("WanInfo_WanIF","DHCPRealy","dhcprelay")
	end if
	
	TCWebApi_set("WanInfo_WanIF","IPVERSION","IPVersionValue")
	TCWebApi_set("WanInfo_WanIF","ISP","ISPTypeValue")
	
	TCWebApi_set("WanInfo_WanIF","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanIF","dot1q","vlanId")
	if Request_Form("vlanId") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","VLANID","vlan")
	end if
	TCWebApi_set("WanInfo_WanIF","dot1p","vlanPri")
	if Request_Form("vlanPri") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","dot1pData","v8021P")
	end if
	tcWebApi_set("WanInfo_WanIF", "DOT1P", "v8021P")
	if Request_Form("MulVIDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","MulticastVID","MulticastVID")
	end if

	TCWebApi_set("WanInfo_WanIF","NATENABLE","nat")
	TCWebApi_set("WanInfo_WanIF","IGMPproxy","enblIgmp")
	
	if Request_Form("IPVersionValue") <> "IPv6" then
		if Request_Form("linkMode") = "linkIP" then
			if Request_Form("IpMode") = "Static" then
				TCWebApi_set("WanInfo_WanIF","IPADDR","wanIpAddress")
				TCWebApi_set("WanInfo_WanIF","NETMASK","wanSubnetMask")
				TCWebApi_set("WanInfo_WanIF","GATEWAY","defaultGateway")
				TCWebApi_set("WanInfo_WanIF","DNS","dnsPrimary")
				TCWebApi_set("WanInfo_WanIF","SecDNS","dnsSecondary")
                TCWebApi_set("WanInfo_WanIF","MannualdnsEnable","dnsDHCP")
            else
                TCWebApi_set("WanInfo_WanIF","MannualdnsEnable","dnsDHCP")
                if Request_Form("dnsDHCP") = "1" then
                    TCWebApi_set("WanInfo_WanIF","DNS","dns1")
                    TCWebApi_set("WanInfo_WanIF","SecDNS","dns2")
                    TCWebApi_set("WanInfo_WanIF","ThirdDNS","third_dns3")
                end if
			end if
		end if
	end if

	if Request_Form("IPVersionValue") <> "IPv4" then
			TCWebApi_set("WanInfo_WanIF","DHCPv6","pppv6Mode")
			TCWebApi_set("WanInfo_WanIF","GW6_Manual","Disable_Flag")
		if Request_Form("IdIpv6AddrType") = "Static" then
			TCWebApi_set("WanInfo_WanIF","IPADDR6","IdIpv6Addr")
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
			TCWebApi_set("WanInfo_WanIF","PREFIX6","IdIpv6PrefixLen")
			TCWebApi_set("WanInfo_WanIF","DNS6","IdIpv6Dns1")
			TCWebApi_set("WanInfo_WanIF","SecDNS6","IdIpv6Dns2")
		elseif Request_Form("IdIpv6AddrType") = "DHCP" then
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
		end if
	end if
	
	TCWebApi_set("WanInfo_WanIF","IFIdx","WanCurrIFIdx")
	if Request_Form("OperatorStyle") = "Add" then
		TCWebApi_set("Wan_Common","LatestIFIdx","WanCurrIFIdx")
		TCWebApi_set("WanInfo_WanPVC", "EPONEnable", "xponstate")
		TCWebApi_set("WanInfo_WanPVC", "GPONEnable", "xponstate")
	end if

	if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then
		if Request_Form("dsliteUsed") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","enabledslite")
			TCWebApi_set("WanInfo_WanIF","DsliteMode","dslitemode")
			if Request_Form("dslitemode") = "1" then
					TCWebApi_set("WanInfo_WanIF","DsliteAddr","dsliteaddress")
			end if
		else
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","dsliteDisabled")
		end if
	end if

	if Request_Form("PDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","PDEnable","enablepd")
	else
		TCWebApi_set("WanInfo_WanIF","PDEnable","PDDisabled")
	end if

	if Request_Form("pdmodeUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmode")
		if Request_Form("pdmode") = "No" then
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeStatic")			
			TCWebApi_set("WanInfo_WanIF", "PDPrefix", "pdprefix")
			TCWebApi_set("WanInfo_WanIF", "PrefixPltime", "pdprefixptime")
			TCWebApi_set("WanInfo_WanIF", "PrefixVltime", "pdprefixvtime")
		else
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeAuto")
		end if
	else
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmodeDisabled")
		TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeNone")
	end if
	
	if tcwebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPEnable", "enable_dhcp")
	end if
	
	if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "wanhwaddress")
	end if

	if tcWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyDisabled")
		tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user_zero")
		tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
		if Request_Form("ppp_proxy_biUsed") = "Yes" then
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_mode")
			if Request_Form("ppp_proxy_bi_mode") = "1" then
				tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyEnabled")
				tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user")
			elseif Request_Form("ppp_proxy_bi_mode") = "2" then
				tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiEnabled")
			end if
		else
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_disable")
		end if
	else		
		if Request_Form("pppbiUsed") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","enablepppbi")
		else
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
		end if
	end if

	if Request_Form("OperatorStyle") <> "Add" then
		tcWebApi_set("WanInfo_WanIF","Option60Enable1","Option60Enable1")
		tcWebApi_set("WanInfo_WanIF","Option60Enable2","Option60Enable2")
		tcWebApi_set("WanInfo_WanIF","Option60Enable3","Option60Enable3")
		tcWebApi_set("WanInfo_WanIF","Option60Enable4","Option60Enable4")

		tcWebApi_set("WanInfo_WanIF","Option60Type1","Option60Type1")
		tcWebApi_set("WanInfo_WanIF","Option60Type2","Option60Type2")
		tcWebApi_set("WanInfo_WanIF","Option60Type3","Option60Type3")
		tcWebApi_set("WanInfo_WanIF","Option60Type4","Option60Type4")

		tcWebApi_set("WanInfo_WanIF","Option60ValueMode1","Option60ValueMode1")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode2","Option60ValueMode2")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode3","Option60ValueMode3")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode4","Option60ValueMode4")

		tcWebApi_set("WanInfo_WanIF","Option60Value1","Option60Value1")
		tcWebApi_set("WanInfo_WanIF","Option60Value2","Option60Value2")
		tcWebApi_set("WanInfo_WanIF","Option60Value3","Option60Value3")
		tcWebApi_set("WanInfo_WanIF","Option60Value4","Option60Value4")
	end if

	if tcWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "maccloneAddress")
	end if

	TCWebApi_commit("WanInfo_WanPVC")
	TCWebApi_save()
elseif Request_Form("Wan_Flag") = "3" then
	 TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
	 TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
	 TCWebApi_commit("WanInfo_WanPVC")
	 if Request_Form("DelTR069_Flag") = "1" then
	 	tcWebApi_unset("XPON_IPHost0")
	 end if
	 TCWebApi_set("WanInfo_Common","CurIFIndex","afterdeleteFlag")
	 TCWebApi_save()
elseif Request_Form("Wan_Flag") = "4" then
	 TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
	 TCWebApi_commit("WanInfo_WanIF")
	 TCWebApi_save()
elseif Request_Form("Wan_Flag") = "5" then
    if Request_Form("rfBand") = "0" then
	    tcWebApi_constSet("apcli_Common","currentRadio","0")
    else
        tcWebApi_constSet("apcli_Common","currentRadio","1")
    end if
	tcWebApi_constSet("apcli_Common","syncFlag","2")
	tcWebApi_constSet("apcli_Common","noNeedScan","0")
	tcWebApi_constSet("apcli_Common","WPSMode","0")
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","APClient")

    if Request_Form("rfBand") = "0" then
        TCWebApi_set("apcli_entry0","SSID","wlanssid")
        TCWebApi_set("apcli_entry0","Enable","MSEnbl")
        TCWebApi_set("apcli_entry0","AuthMode","SecurMode")
        TCWebApi_set("apcli_entry0","WPAPSK","connectPWD")
        TCWebApi_set("apcli_entry0","EncrypType","EncrypType")
        TCWebApi_set("apcli_entry0","needSync","SyncWlCFG_2")
        TCWebApi_set("apcli_entry0","Signal","Signal")
        TCWebApi_set("apcli_entry0","Connecting","Connecting")
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
    else
        TCWebApi_set("apcli_entry1","SSID","wlanssid")
        TCWebApi_set("apcli_entry1","Enable","MSEnbl")
        TCWebApi_set("apcli_entry1","AuthMode","SecurMode")
        TCWebApi_set("apcli_entry1","WPAPSK","connectPWD")
        TCWebApi_set("apcli_entry1","EncrypType","EncrypType")
        TCWebApi_set("apcli_entry1","needSync","SyncWlCFG_5")
        TCWebApi_set("apcli_entry1","Signal","Signal")
        TCWebApi_set("apcli_entry1","Connecting","Connecting")
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
    end if
elseif Request_Form("Wan_Flag") = "6" then
	if Request_Form("rfBand") = "0" then
	    tcWebApi_constSet("apcli_Common","currentRadio","0")
    else
        tcWebApi_constSet("apcli_Common","currentRadio","1")
    end if
	tcWebApi_constSet("apcli_Common","syncFlag","2")
	tcWebApi_constSet("apcli_Common","noNeedScan","0")
	tcWebApi_constSet("apcli_Common","WPSMode","0")
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","APClient")

    if Request_Form("rfBand") = "0" then
        TCWebApi_set("apcli_entry0","SSID","wlanssid")
        TCWebApi_set("apcli_entry0","Enable","MSEnbl")
        TCWebApi_set("apcli_entry0","WPAPSK","connectPWD")
        TCWebApi_set("apcli_entry0","needSync","SyncWlCFG_2")
        TCWebApi_set("apcli_entry0","Connecting","Connecting")
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
    else
        TCWebApi_set("apcli_entry1","SSID","wlanssid")
        TCWebApi_set("apcli_entry1","Enable","MSEnbl")
        TCWebApi_set("apcli_entry1","WPAPSK","connectPWD")
        TCWebApi_set("apcli_entry1","needSync","SyncWlCFG_5")
        TCWebApi_set("apcli_entry1","Connecting","Connecting")
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
    end if
elseif Request_Form("Wan_Flag") = "7" then
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","APClient")
	tcWebApi_constSet("apcli_Common","noNeedScan","1")
	tcWebApi_constSet("apcli_Common","currentRadio","0")
	tcWebApi_constSet("apcli_Common","syncFlag","2")
	tcWebApi_constSet("apcli_Common","WPSMode","1")
	tcWebApi_constSet("apcli_Common","WPSConnCnt","0")
	TCWebApi_commit("APWanInfo_Common")

	TCWebApi_save()
elseif Request_Form("Wan_Flag") = "8" then
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","APClient")
	tcWebApi_constSet("apcli_Common","noNeedScan","1")
	tcWebApi_constSet("apcli_Common","currentRadio","1")
	tcWebApi_constSet("apcli_Common","syncFlag","2")
	tcWebApi_constSet("apcli_Common","WPSMode","1")
	tcWebApi_constSet("apcli_Common","WPSConnCnt","0")
	TCWebApi_commit("APWanInfo_Common")

	TCWebApi_save()
elseif Request_Form("Wan_Flag") = "9" then
	tcWebApi_constSet("APWanInfo_Common","FixedAPMode","Bridge")

    if tcWebApi_get("WebCustom_Entry","isIPTVPortBindSupported","h" ) = "Yes" then
        TCWebApi_set("APWanInfo_IPTVInfo", "VLANID", "iptvVlanid_s3")
        tcWebApi_JsonHook("set_ap_iptv_info", "iptvEbl_h3", "iptvportbind_h3")
    end if
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
    elseif Request_Form("Wan_Flag") = "10" then
        tcWebApi_constSet("APWanInfo_Common","FixedAPMode","Bridge")
        TCWebApi_commit("APWanInfo_Common")
        TCWebApi_save()
end if

tcWebApi_get("WanInfo_WanIF", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "wanif_read", "1")

tcWebApi_get("WanInfo_WanPVC", "Test", "h")
tcWebApi_constSet("WebCurSet_Entry", "wanpvc_read", "1")
%>