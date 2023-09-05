<%
if Request_Form("javatest_flag") = "1" then 

	TCWebApi_set("WebCustom_Entry","javatest","javatestenable_flag")
	TCWebApi_commit("WebCustom_Entry")
	TCWebApi_commit("CMCCInfo_Entry1")
	TCWebApi_save()
	
end if
if Request_Form("apitest_flag") = "1" then 
	TCWebApi_set("CMCCInfo_Entry0","APIEnable","apitestenable_flag")
	TCWebApi_commit("CMCCInfo_Entry0")
	TCWebApi_save()
end if
%>
<%
if Request_Form("wifitest_flag") = "1" then 

	TCWebApi_set("CMCCInfo_Entry3","24gwifitest","wifitest24genable_flag")	
	TCWebApi_set("CMCCInfo_Entry3","5gwifitest","wifitest5genable_flag")
	TCWebApi_commit("CMCCInfo_Entry3")
	TCWebApi_save()	
end if
%>
<%
if Request_Form("hashmode_flag") = "1" then 
	TCWebApi_set("WebCurSet_HiddenSwitch","hashmodeswitch","hashmodeenable_flag")
	TCWebApi_commit("WebCurSet_HiddenSwitch")
end if
%>
<%
if Request_Form("jvmbench_flag") = "1" then 
	TCWebApi_set("CMCCInfo_Entry2","jvmbench","jvmbench_enable_flag")
	TCWebApi_commit("CMCCInfo_Entry2")
end if
%>
<%
if Request_Form("icmpv6_flag") = "1" then 
	TCWebApi_set("WebCurSet_HiddenSwitch","icmpv6","icmpv6_enable_flag")
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
function setJavaTest()
{
	with (getElById('ConfigForm'))
	{
		if (enablejavatest.checked == true)
			javatestenable_flag.value = "Yes";
		else
			javatestenable_flag.value = "No";
	}
}

function setapiTest()
{
	with (getElById('ConfigForm'))
	{
		if (enableapitest.checked == true)
			apitestenable_flag.value = "Yes";
		else
			apitestenable_flag.value = "No";
	}
}

function setWifiTest1()
{
	with (getElById('ConfigForm'))
	{
		if (enable24gwifitest.checked == true)
			wifitest24genable_flag.value = "Yes";
		else
			wifitest24genable_flag.value = "No";
	}
}

function setWifiTest2()
{
	with (getElById('ConfigForm'))
	{
		if (enable5gwifitest.checked == true)
			wifitest5genable_flag.value = "Yes";
		else
			wifitest5genable_flag.value = "No";
	}
}

function setHashModeSwitch()
{
	with (getElById('ConfigForm'))
	{
		if (enablehashswitch.checked == true)
			hashmodeenable_flag.value = "Yes";
		else
			hashmodeenable_flag.value = "No";
	}
}

function set_jvmbench()
{
	with (getElById('ConfigForm'))
	{
		if (enablejvmbench.checked == true)
			jvmbench_enable_flag.value = "Yes";
		else
			jvmbench_enable_flag.value = "No";
	}
}

function setICMPv6enable()
{
	with (getElById('ConfigForm'))
	{
		if (enableicmpv6.checked == true)
			icmpv6_enable_flag.value = "Yes";
		else
			icmpv6_enable_flag.value = "No";
	}
}

function btn1Commit()
{
	var cform = document.ConfigForm;
	cform.javatest_flag.value = "1";
	cform.submit();
}

function btn2Commit()
{
	var cform = document.ConfigForm;
	cform.wifitest_flag.value = "1";
	cform.submit();
}

function btn3Commit()
{
	var cform = document.ConfigForm;
	cform.apitest_flag.value = "1";
	cform.submit();
}

function btn4Commit()
{
	var cform = document.ConfigForm;
	cform.hashmode_flag.value = "1";
	cform.submit();
}
function btn5Commit()
{
	var cform = document.ConfigForm;
	cform.icmpv6_flag.value = "1";
	cform.submit();
}
function btn6Commit()
{
	var cform = document.ConfigForm;
	cform.jvmbench_flag.value = "1";
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
			<li class="TSD">≈‹∑÷≤‚ ‘∫Õwifi≤‚ ‘</li>
		</ul>
	</TD>
	<TD width=7 bgColor=#FAFAFA></TD>
	<TD class='w-828' height="20"></TD>
	</TR>
	<TR>
	<TD width="7" background="/img/panel3.gif"></TD>
	<TD valign="top">
		<FORM name="ConfigForm" action="/cgi-bin/cmcc_test.asp" method="post">
             <input type="hidden" name="javatest_flag" value="0">
             <input type="hidden" name="wifitest_flag" value="0">
			 <input type="hidden" name="javatestenable_flag" value="<% tcWebApi_get("WebCustom_Entry","javatest","s") %>">
			 <input type="hidden" name="wifitest24genable_flag" value="<% tcWebApi_get("CMCCInfo_Entry3","24gwifitest","s") %>">
			 <input type="hidden" name="wifitest5genable_flag" value="<% tcWebApi_get("CMCCInfo_Entry3","5gwifitest","s") %>">
			 <input type="hidden" name="apitest_flag" value="0">
			 <input type="hidden" name="apitestenable_flag" value="<% tcWebApi_get("CMCCInfo_Entry0","APIEnable","s") %>">
			 <input type="hidden" name="hashmode_flag" value="0">
			 <input type="hidden" name="hashmodeenable_flag" value="<% tcWebApi_get("WebCurSet_HiddenSwitch","hashmodeswitch","s") %>">
			 <input type="hidden" name="jvmbench_flag" value="0">
			 <input type="hidden" name="jvmbench_enable_flag" value="<% tcWebApi_get("CMCCInfo_Entry2","jvmbench","s") %>">
                         <input type="hidden" name="icmpv6_flag" value="0">
			 <input type="hidden" name="icmpv6_enable_flag" value="<% tcWebApi_get("WebCurSet_HiddenSwitch","icmpv6","s") %>">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">≈‹∑÷≤‚ ‘: ∆Ù”√</TD>
		<TD><INPUT id="enablejavatest" onclick="setJavaTest()" type="checkbox" name="enablejavatest" <%if tcWebApi_get("WebCustom_Entry","javatest","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn1OK" onclick="btn1Commit()" src="/img/ok.gif" border="0"></TD></TR>
		<TR><TD colspan="4"><HR></TR></TD>
		<TR>
		<TD class='w-130' style="text-align: right;">2.4Gwifi≤‚ ‘: ∆Ù”√</TD>
		<TD><INPUT id="enable24gwifitest" onclick="setWifiTest1()" type="checkbox" name="enable24gwifitest" <%if tcWebApi_get("CMCCInfo_Entry3","24gwifitest","h") = "Yes" then asp_Write("checked") end if%>></TD>
		<TD class='w-130' style="text-align: right;">5Gwifi≤‚ ‘: ∆Ù”√</TD>
		<TD><INPUT id="enable5gwifitest" onclick="setWifiTest2()" type="checkbox" name="enable5gwifitest" <%if tcWebApi_get("CMCCInfo_Entry3","5gwifitest","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn2OK" onclick="btn2Commit()" src="/img/ok.gif" border="0"></TD></TR>
		</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">API Throuhput Test: ∆Ù”√</TD>
		<TD><INPUT id="enableapitest" onclick="setapiTest()" type="checkbox" name="enableapitest" <%if tcWebApi_get("CMCCInfo_Entry0","APIEnable","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn3OK" onclick="btn3Commit()" src="/img/ok.gif" border="0"></TD></TR>
		</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">Hash Mode Switch: ∆Ù”√</TD>
		<TD><INPUT id="enablehashswitch" onclick="setHashModeSwitch()" type="checkbox" name="hashmodeswitch" <%if tcWebApi_get("WebCurSet_HiddenSwitch","hashmodeswitch","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn4OK" onclick="btn4Commit()" src="/img/ok.gif" border="0"></TD></TR>
		</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">jvmbench switch</TD>
		<TD><INPUT id="enablejvmbench" onclick="set_jvmbench()" type="checkbox" name="enablejvmbench" <%if tcWebApi_get("CMCCInfo_Entry2","jvmbench","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn6OK" onclick="btn6Commit()" src="/img/ok.gif" border="0"></TD></TR>
		</TBODY>
		</TABLE>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
		<TR><TD>&nbsp;</TD></TR>
		<TR>
		<TD class='w-130' style="text-align: right;">ICMPV6¥Ú¡˜: ∆Ù”√</TD>
		<TD><INPUT id="enableicmpv6" onclick="setICMPv6enable()" type="checkbox" name="enableicmpv6" <%if tcWebApi_get("WebCurSet_HiddenSwitch","icmpv6","h") = "Yes" then asp_Write("checked") end if%>></TD>
		</TR>
		<TR><TD class='w-130' style="text-align: right;"><IMG id="btn5OK" onclick="btn5Commit()" src="/img/ok.gif" border="0"></TD></TR>
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
