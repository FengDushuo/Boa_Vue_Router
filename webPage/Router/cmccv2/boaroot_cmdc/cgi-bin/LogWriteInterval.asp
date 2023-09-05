<%
if Request_Form("logInterval_flag") = "1" then 

	TCWebApi_set("WebCurSet_Entry","LogWriteInterval","logWriteInterval")
	tcWebApi_constSet("WebCurSet_Entry","LogWriteFlag","1")
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_save()	
end if
%>

<%
if Request_Form("multicastDiscard_flag") = "1" then 

	TCWebApi_set("WebCurSet_HiddenSwitch","multicastDiscard","multicastDiscardenable_flag") 
	TCWebApi_commit("WebCurSet_HiddenSwitch")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>Cmcc_test</TITLE>
	<META http-equiv=Content-Language content=zh-cn>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
	<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
	<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<SCRIPT language=JavaScript type=text/javascript>

function setmulticastDiscard()
{
	with (getElById('ConfigForm'))
	{
		if (multicastDiscard.checked == true)
			multicastDiscardenable_flag.value = "Yes";
		else
			multicastDiscardenable_flag.value = "No";
	}
}

function btn1Commit()
{
	var cform = document.ConfigForm;
	cform.logInterval_flag.value = "1";
	cform.submit();
}

function btn2Commit()
{
	var cform = document.ConfigForm;
	cform.multicastDiscard_flag.value = "1";
	cform.submit();
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
			<li class="TSD">日志周期</li>
		</ul>
	</TD>
	<TD width=7 bgColor=#FAFAFA></TD>
	<TD class='w-828' height="20"></TD>
	</TR>
	<TR>
	<TD width="7" background="/img/panel3.gif"></TD>
	<TD valign="top">
		<FORM name="ConfigForm" action="/cgi-bin/LogWriteInterval.asp" method="post">
             <input type="hidden" name="logInterval_flag" value="0">
             <input type="hidden" name="multicastDiscard_flag" value="0">
			 <input type="hidden" name="multicastDiscardenable_flag" value="<% tcWebApi_get("WebCurSet_HiddenSwitch","multicastDiscard","s") %>">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">日志写入周期</TD>
		<TD><INPUT id=logWriteInterval type=text maxLength=35 
                        size=15 name=logWriteInterval></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn1OK" onclick="btn1Commit()" src="/img/ok.gif" border="0"></TD></TR>
		<TR><TD colspan="4"><HR></TR></TD>
		</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">丢弃lan2组播报文</TD>
		<TD><INPUT id="multicastDiscard" onclick="setmulticastDiscard()" type="checkbox" name="multicastDiscard" <%if tcWebApi_get("WebCurSet_HiddenSwitch","multicastDiscard","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn3OK" onclick="btn2Commit()" src="/img/ok.gif" border="0"></TD></TR>
		</TBODY>
		</TABLE>
		</FORM>
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
