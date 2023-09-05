<%
if Request_Form("wifi_flag") = "1" then 

	TCWebApi_set("WLan_Common","power_consumption_wifi","wifienable_flag")
	TCWebApi_set("WLan_Common", "switch_id", "switch_id")
	TCWebApi_commit("WLan11ac_Common")
	TCWebApi_save()
	
end if
if Request_Form("lan_flag") = "1" then 

	TCWebApi_set("WLan_Common","power_consumption_lan","lanenable_flag")
	TCWebApi_set("WLan_Common", "switch_id", "switch_id")
	TCWebApi_commit("WLan11ac_Common")
	TCWebApi_save()
	
end if
if Request_Form("power_mode_flag") = "1" then 

	TCWebApi_set("WLan_Common","power_consumption_1T1R","powermodeenable_flag")
	TCWebApi_set("WLan_Common", "switch_id", "switch_id")
	TCWebApi_commit("WLan11ac_Common")
	TCWebApi_save()
	
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>pa_mode</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
  <TBODY>
  <TR>
		<TD class="header">
  		<TABLE cellSpacing=0 cellPadding=0 border=0 class="tbl_nav">
    	<TBODY>
      	<TR>
        	<TD>&nbsp;</TD>
        	<TD vAlign=top align=right>
        		<TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
            <TBODY>
              <TR>
                <TD class="td_model" align=left>

                </TD>
                <TD class=welcom>

                  	<INPUT id=Selected_Menu type=hidden value="" name=Selected_Menu></TD>
              </TR>
            </TBODY>
          	</TABLE>
          </TD>
	      </TR>
	    </TBODY>
	  	</TABLE>
	  	<TABLE cellSpacing="0" cellPadding="0" border="0" style="position: absolute ; z-index:999 ; margin:-25 0 0 25"><tbody><tr><td><img src="/img/qr.png" width="100" height="100"></td></tr></tbody></TABLE>
		  <TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
		    <TBODY>
		      <TR>
		        <TD id=MenuArea_L1></TD>
		      </TR>
		      <TR>
		        <TD id=MenuArea_L2></TD>
		      </TR>
		    </TBODY>
		  </TABLE>
    </TD>
   </TR>
   
  <TR>
    <TD class="content">
<SCRIPT language=JavaScript type=text/javascript>

function LoadFrame()
{
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

var switch_wifi = 0;
var switch_lan = 0;
var switch_1T1R = 0;
function setWifi()
{
	with (getElById('ConfigForm'))
	{
		if (enableWifi.checked == true)
			wifienable_flag.value = "Yes";
		else
			wifienable_flag.value = "No";
			
		if (wifienable_flag.value != wifienable_old.value)
		{
			wifi_flag.value = "1";
			switch_wifi = 1;
		}
		else
		{
			wifi_flag.value = "0";
			switch_wifi = 0;
		}
	}
}

function setLan()
{
	with (getElById('ConfigForm'))
	{
		if (enableLan.checked == true)
			lanenable_flag.value = "Yes";
		else
			lanenable_flag.value = "No";
		
		if (lanenable_flag.value != lanenable_old.value)
		{
			lan_flag.value = "1";
			switch_lan = 1;
		}
		else
		{
			lan_flag.value = "0";
			switch_lan = 0;
		}
	}
}

function setPowerMode()
{
	with (getElById('ConfigForm'))
	{
		if (enablePowerMode.checked == true)
			powermodeenable_flag.value = "Yes";
		else
			powermodeenable_flag.value = "No";
		
		if (powermodeenable_flag.value != powermodeenable_old.value)
		{
			power_mode_flag.value = "1";
			switch_1T1R = 1;
		}
		else
		{
			power_mode_flag.value = "0";
			switch_1T1R = 0;
		}
	}
}

function btnCommit()
{
	var cform = document.ConfigForm;
	var switch_idx = 0;
	
	if (1 == switch_wifi)
	{
			switch_idx = parseInt(switch_idx) + 1;
			switch_wifi = 0;
	}
	if (1 == switch_lan)
	{
			switch_idx = parseInt(switch_idx) + 2;
			switch_lan = 0;
	}
	if (1 == switch_1T1R)
	{
			switch_idx = parseInt(switch_idx) + 4;
			switch_1T1R = 0;
	}
	cform.switch_id.value = switch_idx;
	alert(cform.switch_id.value);
	cform.submit();
}
</SCRIPT>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR >
            <TD class="Item_T" rowspan="3">
		 <ul class="TRD"><li  class="TSD">pa_mode管理</li></ul>
	   </TD>
            <TD width="828px">
<TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
                <TBODY>
                  <TR>
                    <TD valign='top'></TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
          <TR>
            <TD width=7 background=/img/panel3.gif>　</TD>
            <TD></TD>
          </TR>
        <TR>
          <TD valign="top">
            <FORM name="ConfigForm" action="/cgi-bin/pa_mode.asp" method="post">
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                     <input type="hidden" name="wifi_flag" value="0">
										 <input type="hidden" name="wifienable_old" value="<% tcWebApi_get("WLan_Common","power_consumption_wifi","s") %>">
										 <input type="hidden" name="wifienable_flag" value="<% tcWebApi_get("WLan_Common","power_consumption_wifi","s") %>">
                     <input type="hidden" name="lan_flag" value="0">
										 <input type="hidden" name="lanenable_old" value="<% tcWebApi_get("WLan_Common","power_consumption_lan","s") %>">
										 <input type="hidden" name="lanenable_flag" value="<% tcWebApi_get("WLan_Common","power_consumption_lan","s") %>">
                     <input type="hidden" name="power_mode_flag" value="0">
										 <input type="hidden" name="powermodeenable_old" value="<% tcWebApi_get("WLan_Common","power_consumption_1T1R","s") %>">
										 <input type="hidden" name="powermodeenable_flag" value="<% tcWebApi_get("WLan_Common","power_consumption_1T1R","s") %>">
                     <input type="hidden" name="switch_id" value="0">
               	</TD>
                <TD width=10>&nbsp;</TD></TR>
                 <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
								功耗测试-5G：启用<INPUT id="enableWifi" onclick="setWifi()" type="checkbox" name="enableWifi" <%if tcWebApi_get("WLan_Common","power_consumption_wifi","h") = "Yes" then asp_Write("checked") end if%>>
								</TD>
                <TD width=10>&nbsp;</TD>
                  </TR>
                <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
								功耗测试-LAN：启用<INPUT id="enableLan" onclick="setLan()" type="checkbox" name="enableLan" <%if tcWebApi_get("WLan_Common","power_consumption_lan","h") = "Yes" then asp_Write("checked") end if%>>
								</TD>
                <TD width=10>&nbsp;</TD>
                </TR>
                <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
								功耗测试-1T1R：启用<INPUT id="enablePowerMode" onclick="setPowerMode()" type="checkbox" name="enablePowerMode" <%if tcWebApi_get("WLan_Common","power_consumption_1T1R","h") = "Yes" then asp_Write("checked") end if%>>
								</TD>
                <TD width=10>&nbsp;</TD>
                </TR>
                  </TBODY>
                </TABLE>
              </FORM></TD>
       </TR>
        <TR>
              <td class="smtb"></td>
              <td colspan="2">
                <P align=center>
            <IMG id="btnOK" onclick="btnCommit()" 
            src="/img/ok.gif" border="0">
            &nbsp;&nbsp;<IMG 
            id="btnCancel" onclick="RefreshPage()" src="/img/cancel.gif" 
           border="0"> </P>
             </P></td>
        </TR>
        </TBODY>
      </TABLE></TD>
  </TR>
    <!-- copyright bottom -->
    <script language=JavaScript type=text/javascript>
        printCopyRightBottom();
    </script>
 </TBODY>
</TABLE>
</BODY>
</HTML>
