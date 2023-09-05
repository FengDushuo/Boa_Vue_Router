<%
if Request_Form("Snoop_Flag") = "1" then
	TCWebApi_set("Lan_IgmpSnoop","igmpsnoopEnable","SnoopActive")
	tcWebApi_set("Lan_IgmpSnoop","mldsnoopEnable","MldSnoopActive")
    tcWebApi_set("Lan_IgmpSnoop","igmpsnoopAge","snooping_timeout")
	TCWebApi_commit("Lan_IgmpSnoop")
	tcWebApi_save()
end if

if Request_Form("Proxy_Flag") = "1" then
	TCWebApi_set("IGMPproxy_Entry","Active","ProxyActive")	
	TCWebApi_set("IGMPproxy_Entry","UpstreamIF","WanIF")
	TCWebApi_commit("IGMPproxy_Entry")
	TCWebApi_set("MLDproxy_Entry","Active","MldProxyActive")	
	TCWebApi_set("MLDproxy_Entry","UpstreamIF","MldWanIF")
	TCWebApi_commit("MLDproxy_Entry")	
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>IGMP/MLD设置</TITLE>
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
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
    <style>
        .tblMain table td {
            width: 30%;
        }
    </style>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
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
		<input id="Selected_Menu" type="hidden" value="应用->IGMP设置" name="Selected_Menu">
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

<SCRIPT language=JavaScript type=text/javascript>
	var vIgmpProxy = new Array(new stIGMPCfg("domain","<% tcWebApi_get("IGMPproxy_Entry","Active","s") %>","<% tcWebApi_get("IGMPproxy_Entry","UpstreamIF","s") %>","IGMPVersion","<% tcWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","s") %>"),null);
	var igmp = vIgmpProxy[0];
	var igmpif_find = false;
	var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	// num 0
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryName = vArrayStr.split(',');
<%
tcWebApi_constSet("WebCurSet_Entry", "waninfo_cycle_read", "1")
%>
	// num 1
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue_1","s") %>";
	var vEntryValue = vArrayStr.split(',');
	// num 6
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue_6","s") %>";
	var Wan_IPVERSION = vArrayStr.split(',');

<%
tcWebApi_constSet("WebCurSet_Entry", "waninfo_cycle_read", "0")
%>
	var igmpif_bridge = false, mld_bridge = false;
	
	vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );

	vEntryValue = SortUtil.SortMyArray( vEntryValue );	
	Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );	
	
	function stIGMPCfg(domain,ProxyEnable,WanIF, IGMPVersion, SnoopingEnable)
	{
		this.domain = domain;
		if(ProxyEnable == "Yes")
			this.ProxyEnable = 1;
		else
			this.ProxyEnable = 0;
		this.WanIF = WanIF;
		this.IGMPVersion = IGMPVersion;
		if(SnoopingEnable == "Yes")
			this.SnoopingEnable = 1;
		else
			this.SnoopingEnable = 0;	
	}
	function LoadFrame()
	{
		with ( document.forms[0])
		{
			setCheck('chkIgmpSnp',igmp.SnoopingEnable);

			setCheck('chkIgmpProxy',igmp.ProxyEnable);
			setDisplay('IgmpProxyTab',igmp.ProxyEnable);
			if(igmp.WanIF != 'N/A')
			{					
				for (i = 0; i < nEntryNum; i++)
				{				
					if((vEntryValue[i] == igmp.WanIF) && (vEntryName[i].indexOf('_B_')>-1))
					{
						igmpif_bridge = true;			
						break;
					}
				}	
				if(igmpif_bridge)
					setSelect('WanIF',"");
				else
					setSelect('WanIF',igmp.WanIF);
			}
			
			var mld_active_str = "<% tcWebApi_get("MLDproxy_Entry","Active","s") %>";
			var mld_enable = ( mld_active_str == "Yes" ) ? 1 : 0;
			setCheck('chkMldProxy', mld_enable);
			setDisplay('MldProxyTab', mld_enable);
			
			var mld_wanif = "<% tcWebApi_get("MLDproxy_Entry","UpstreamIF","s") %>";
			if( 'N/A' != mld_wanif )
			{					
				for (i = 0; i < nEntryNum; i++)
				{				
					if((vEntryValue[i] == mld_wanif) && (vEntryName[i].indexOf('_B_')>-1))
					{
						mld_bridge = true;			
						break;
					}
				}	
				if ( mld_bridge )
					setSelect('MldWanIF', "");
				else
					setSelect('MldWanIF', mld_wanif);
			}
			
		}
		scmSelect.init($('body'));
		scmRadio.init($('body'));
		scmCheckbox.init($('body'));
		var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
		set_action(query_string);
	}

    function CheckTimeout(value)
    {
        var TemLen = parseInt(value);
        if ( true == isNaN(TemLen) || TemLen > 604800 || TemLen < 1)
        {
            return false;
        }
        return true;
    }

	function btnSubmit(iType)
	{
		if(0 == iType)
		{
            if(!CheckTimeout(snooping_timeout.value)) {
                alert('转发条目老化时间："' + snooping_timeout.value + '" 不合法！');
			    return false;
            }
			if(document.SnoopForm.chkIgmpSnp.checked)
				document.SnoopForm.SnoopActive.value = "Yes";
			else 
				document.SnoopForm.SnoopActive.value = "No";
<% if tcwebApi_get("WebCustom_Entry","isSnoopSeperationSupported","h")="Yes" then %>
			if(document.SnoopForm.chkMldSnp.checked)
				document.SnoopForm.MldSnoopActive.value = "Yes";
			else 
				document.SnoopForm.MldSnoopActive.value = "No";			
<% end if %>

			document.SnoopForm.Snoop_Flag.value = "1";
			document.SnoopForm.submit();
		}
		else if(1 == iType)
		{	
			if(document.ConfigForm.chkIgmpProxy.checked)
				document.ConfigForm.ProxyActive.value = "Yes";
			else 
				document.ConfigForm.ProxyActive.value = "No";
				
				
			if(document.ConfigForm.chkMldProxy.checked)
				document.ConfigForm.MldProxyActive.value = "Yes";
			else 
				document.ConfigForm.MldProxyActive.value = "No";
				
			document.ConfigForm.Proxy_Flag.value = "1";
			document.ConfigForm.submit();
		}
	}
	function ChangeEnabIgmp()
	{
		setDisplay('IgmpProxyTab',getCheckVal('chkIgmpProxy'));
	}
	
	function ChangeEnabMld()
	{
		setDisplay('MldProxyTab',getCheckVal('chkMldProxy'));
	}
</SCRIPT>
    <TR>
      <TD class="content">
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
          <TD id="MenuArea_L2">
		  <ul class="TRD">
              	     <li name="IGMPSet" id="IGMP设置" class="TSD">IGMP设置</li>
		  </ul>
	  </TD>
	  <SCRIPT language=javascript>
	  MakeMenu(getElById ('Selected_Menu').value);
	  </SCRIPT>
          <TD valign="top">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                <TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">IGMP设置</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
              <TR>
                <TD>
		  <FORM name="SnoopForm" action="/cgi-bin/app-igmpset.asp" method="post" style="padding: 0;">                          
			<input type="hidden" name="Snoop_Flag" value="0">			
			<input type="hidden" name="SnoopActive" value="0">	
			<input type="hidden" name="MldSnoopActive" value="No">			  
                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <TBODY>
                    <TR>
                      <TD>
<% if tcwebApi_get("WebCustom_Entry","isSnoopSeperationSupported","h")="Yes" then %>
                        <div class="form-text">IGMP Snooping</div>
<% else %>
                        <div class="form-text">IGMP/MLD Snooping</div>
<% end if %>
                       </TD>
				  <TD>
				  <INPUT class="input-onoff" type=checkbox name=chkIgmpSnp>
				  </TD>
                </TR>
                <TR>
                    <TD class='w-130'>
                        <div class="form-text">转发条目老化时间</div>
                    </TD>
                    <TD><INPUT TYPE="TEXT" id="snooping_timeout" NAME="snooping_timeout" MAXLENGTH="32" VALUE="<% If tcWebApi_get("Lan_IgmpSnoop","igmpsnoopAge","h") <> "N/A" then tcWebApi_get("Lan_IgmpSnoop","igmpsnoopAge","s") end if %>">
                    (1 - 604800) 秒
                    </TD>
                </TR>
                </TBODY></TABLE><BR>
<% if tcwebApi_get("WebCustom_Entry","isSnoopSeperationSupported","h")="Yes" then %>
                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">MLD Snooping</div>
                       </TD>
				  <TD>
				  <INPUT type=checkbox <%if tcWebApi_get("Lan_IgmpSnoop","mldsnoopEnable","h") = "Yes" then asp_Write("checked") end if%>
                  name=chkMldSnp>
				  </TD>
                      </TR></TBODY></TABLE><BR>
<% end if %>
                  </FORM>
                  <CENTER>
                  </CENTER>
                  <P style="margin-left: 216px;">
                    <INPUT onclick='btnSubmit(0)' type=button value="保 存" name=applySnp> 
                </P></TD>
                </TR>
              </TBODY></TABLE>
	<FORM name="ConfigForm" action="/cgi-bin/app-igmpset.asp" method="post">
	<input type="hidden" name="Proxy_Flag" value="0">
	<input type="hidden" name="ProxyActive" value="0">
	<input type="hidden" name="MldProxyActive" id="MldProxyActive" value="0">
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
        <TBODY>
              <TR>
                <TD>
                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">IGMP Proxy</div>
                      </TD>
					  <TD>
					  <INPUT class="input-onoff" id=chkIgmpProxy onclick=ChangeEnabIgmp() type=checkbox name=chkIgmpProxy>
					  </TD>
                     </TR></TBODY>
                  </TABLE>
                  <CENTER>
                  <TABLE border="0" width="100%" id=IgmpProxyTab name="IgmpProxyTab">
                    <TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<TR>
<% else %>
					<TR style="display:none;">
<% end if %>
												<TD class='w-70'><div class="form-text">WAN接口</div></TD>
	                      <TD><SELECT id=WanIF name=WanIF maxlength="15"> 
													<SCRIPT language=JavaScript type=text/javascript>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
													document.write('<option value="">' + ' ' + '</option>');
<% end if %>
													for (i = 0; i < nEntryNum; i++)
													{
														if(( vEntryName[i].indexOf('_INTERNET_')<0 && vEntryName[i].indexOf('_OTHER_')<0 && vEntryName[i].indexOf('_IPTV_')<0 ) || (vEntryName[i].indexOf('_B_')>-1)
															|| Wan_IPVERSION[i].indexOf('IPv4') < 0 )
															continue;
														document.write('<option value=' + vEntryValue[i] + '>'
														+ vEntryName[i] + '</option>');
													}
													</SCRIPT>
					                </SELECT>
					              </TD>                    
		    					 </TR>
                    </TBODY>
                    </TABLE>
                    
								<TABLE border="0" cellpadding="0" cellspacing="0" width="100%">
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">MLD Proxy</div>
                      </TD>
					  <TD>
					  <INPUT class="input-onoff" id=chkMldProxy onclick=ChangeEnabMld() type=checkbox name=chkMldProxy >
					  </TD>
                     </TR></TBODY>
                  </TABLE>
                  <CENTER>
                  <TABLE border="0" width="100%" id=MldProxyTab name="MldProxyTab">
                    <TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<TR>
<% else %>
					<TR style="display:none;">
<% end if %>
												<TD class='w-70'><div class="form-text">WAN接口</div></TD>
	                      <TD><SELECT id=MldWanIF name=MldWanIF maxlength="15"> 
													<SCRIPT language=JavaScript type=text/javascript>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
													document.write('<option value="">' + ' ' + '</option>');
<% end if %>
													for (i = 0; i < nEntryNum; i++)
													{
														if(( vEntryName[i].indexOf('_INTERNET_')<0 && vEntryName[i].indexOf('_OTHER_')<0 && vEntryName[i].indexOf('_IPTV_')<0 ) || (vEntryName[i].indexOf('_B_')>-1)
														|| Wan_IPVERSION[i].indexOf('IPv6') < 0 )
															continue;
														document.write('<option value=' + vEntryValue[i] + '>'
														+ vEntryName[i] + '</option>');
													}
													</SCRIPT>
					                </SELECT>
					              </TD>                    
		    					 </TR>
                    </TBODY>
                    </TABLE>
                    </FORM></CENTER>
                    <TABLE border="0" width="100%">
                        <tr>
                            <td>
                                <P style="margin-top: 32px;margin-left: 216px;">
                                    <INPUT onclick='btnSubmit(1)' type=button value="保 存" name=applyProxy> 
                                  </P>
                            </td>
                        </tr>
                    </TABLE>
                  </TD>
            </TR></TBODY></TABLE>
        </TD>
        </TR></TBODY></TABLE>
   </TD></TR>
</TBODY>
</TABLE>
</TBODY></TABLE>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY></HTML>
