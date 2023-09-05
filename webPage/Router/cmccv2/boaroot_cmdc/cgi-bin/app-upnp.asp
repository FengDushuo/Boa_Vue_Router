<%
if Request_Form("Upnp_Flag") = "1" then
	TCWebApi_set("Upnpd_Entry","Active","Enable_Flag")
	TCWebApi_set("Upnpd_Entry","autoconf","AutoConfig_Flag")	
	TCWebApi_commit("Upnpd_Entry")
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>UPNP配置</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
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
                		<span>型号: </span> 
                		<span> 
                			<SCRIPT language=javascript> document.write(top.ModelName); </SCRIPT>
                		</span>
                </TD>
                <TD class=welcom>
                		<span>欢迎您！</span> 
                		<SPAN class=curUserName>&nbsp;</SPAN>
                		<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
                			 <SPAN name=logout class=logout>退出</SPAN>
                		</A>
                  	<INPUT id=Selected_Menu type=hidden value="应用->UPnP配置" name=Selected_Menu></TD>
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
  	<SCRIPT language=javascript>
		MakeMenu(getElById ('Selected_Menu').value);
	</SCRIPT>
    </TD>
  </TR>

  <TR>
      <TD class="content">
    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
          <TD class="Item_T" >
	       <ul class="TRD">
              	     <li name="UPNPSet" id="UPNP配置" class="TSD">UPNP配置</li>
	       </ul>
	  </TD>
        <TD class='w-828'>
	  <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
	  <TBODY>
          <TR>
            <TD width=7 background=/img/panel3.gif>　</TD>
            <TD valign="top">
            <FORM name="ConfigForm" action="/cgi-bin/app-upnp.asp" method="post">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD >&nbsp;</TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD>启用UPnP
                      <INPUT id=Enable type=checkbox name="Enable" <%if tcWebApi_get("Upnpd_Entry","Active","h") = "Yes" then asp_Write("checked") end if%>></TD>
                      </TR>
                      </TBODY></TABLE></TD>
                <TD class='w-100'>&nbsp;</TD></TR>
              <TR>
                <TD class='w-10'>&nbsp;</TD>
                <TD><input type="hidden" name="Upnp_Flag" value="0">
                	<input type="hidden" name="AutoConfig_Flag" value="<% tcWebApi_get("Upnpd_Entry","autoconf","s") %>">
                          <input type="hidden" name="Enable_Flag" value="<% tcWebApi_get("Upnpd_Entry","Active","s") %>"> 
                          <script language=JavaScript type=text/javascript>
function LoadFrame()
{
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function CheckForm()
{
	return true;
}
function btnSaveUpnp()
{
	if(document.ConfigForm.Enable.checked)
	{
		document.ConfigForm.Enable_Flag.value = "Yes";
		document.ConfigForm.AutoConfig_Flag.value = "1";
	}
	else
	{
		document.ConfigForm.Enable_Flag.value = "No";
		document.ConfigForm.AutoConfig_Flag.value = "0";
	}
	document.ConfigForm.Upnp_Flag.value = "1";
	document.ConfigForm.submit();
}
</script>
         </TD>
                <TD class='w-10'>&nbsp;</TD>
                    </TR>
                    <TR>
                      <TD class='w-10'>&nbsp;</TD>
                      <TD></TD>
                      <TD class='w-10'>&nbsp;</TD>
                    </TR>
                  </TBODY>
                </TABLE>
              </FORM></TD>
    </TR>
    <TR>
        <TD colspan="2">
            <P align=center><IMG id=btnOK onclick="btnSaveUpnp()"
            src="/img/ok.gif"  border=0>&nbsp;&nbsp;<IMG 
            id=btnCancel onclick="RefreshPage()" src="/img/cancel.gif" 
             border=0> </P></TD>
    </TR>
   </TBODY>
    </TABLE>
   </TD>
   </TR>
  </TBODY>
    </TABLE></TD>
  </TR>
    <!-- copyright bottom -->
    <script language=JavaScript type=text/javascript>
        printCopyRightBottom();
    </script>
</TBODY></TABLE></BODY></HTML>
