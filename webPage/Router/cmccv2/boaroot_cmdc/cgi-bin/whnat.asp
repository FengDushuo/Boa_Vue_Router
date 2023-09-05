<%
if Request_Form("whnatFlag") = "1" then 
	TCWebApi_set("WLan_Common", "WHNAT", "whnatEnable")
	TCWebApi_save()
	TCWebApi_commit("WLan")
end if	

if Request_Form("whnatacFlag") = "1" then
	TCWebApi_set("WLan11ac_Common", "WHNAT", "whnatacEnable")
	TCWebApi_save()
	TCWebApi_commit("WLan11ac")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>Whnat</TITLE>
	<META http-equiv=Content-Language content=zh-cn>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
	<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
	<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<SCRIPT language=JavaScript type=text/javascript>
	function doSetWhnat(chk, name)
	{
		if ( "whnat_Enable" == name )
		{
			if ( chk == true )
			{
				document.ConfigForm.whnatEnable.value = 1;
			}
			else
			{
				document.ConfigForm.whnatEnable.value = 0;
			}
			document.ConfigForm.whnatFlag.value = 1;
		}
		else if ( "whnatac_Enable" == name )
		{
			if ( chk == true )
			{
				document.ConfigForm.whnatacEnable.value = 1;
			}
			else
			{
				document.ConfigForm.whnatacEnable.value = 0;
			}
			document.ConfigForm.whnatacFlag.value = 1;
		}
	}
	
	function btnCommit()
	{
		document.ConfigForm.submit();
	}
	</SCRIPT>
</HEAD>
<BODY class="text-center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 onunload=DoUnload() marginheight="0" marginwidth="0">
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
		<TD class="td_model" align=left></TD>
		<TD class=welcom><INPUT id=Selected_Menu type=hidden value="" name=Selected_Menu></TD>
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
	<TR><TD id=MenuArea_L1></TD></TR>
	<TR><TD id=MenuArea_L2></TD></TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<TR>
<TD class="content">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
	<TBODY>
	<TR >
	<TD class="Item_T" rowspan="3">
		<ul class="TRD">
			<li class="TSD">WOE管理</li>
		</ul>
	</TD>
	<TD width=7 bgColor=#FAFAFA></TD>
	<TD class='w-828' height="20"></TD>
	</TR>
	<TR>
	<TD width="7" background="/img/panel3.gif"></TD>
	<TD valign="top">
		<FORM name="ConfigForm" action="/cgi-bin/whnat.asp" method="post">
		<input type="hidden" name="whnatFlag" value="0">
		<input type="hidden" name="whnatacFlag" value="0">
		<input type="hidden" name="whnatEnable" value="0">
		<input type="hidden" name="whnatacEnable" value="0">
		
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">2.4G WHNAT开关 :</TD>
		<TD><INPUT type="checkbox" id="whnat_Enable" name="whnat_Enable" onclick="doSetWhnat(this.checked, this.name)" <%if tcWebApi_get("WLan_Common", "WHNAT", "h") = "1" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR>
		<TD class='w-130' style="text-align: right;">5G WHNAT开关 :</TD>
		<TD><INPUT type="checkbox" id="whnatac_Enable" name="whnatac_Enable" onclick="doSetWhnat(this.checked, this.name)" <%if tcWebApi_get("WLan11ac_Common", "WHNAT", "h") = "1" then asp_Write("checked") end if%>></TD>
		</TR>
		</TBODY>
		</TABLE>
		</FORM>
	</TD>
	</TR>
	<TR>
	<TD colspan="2">
		<P align=center>
		<IMG id="btnOK" onclick="btnCommit()" src="/img/ok.gif" border="0">&nbsp;&nbsp;
		<IMG id="btnCancel" onclick="RefreshPage()" src="/img/cancel.gif" border="0">
		</P>
	</TD>
	</TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<!-- copyright bottom -->
<script language=JavaScript type=text/javascript>
printCopyRightBottom();
</script>
</TBODY>
</TABLE>
</BODY>
</HTML>
