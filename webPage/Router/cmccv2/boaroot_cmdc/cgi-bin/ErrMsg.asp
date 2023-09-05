<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>内部错误</TITLE>
	<META http-equiv=Content-Language content=zh-cn>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
	<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
	<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
	<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR>		
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
		<TD class="td_model">
			<span>型号: </span> 
			<span> 
			<SCRIPT language=javascript> 
			document.write(top.ModelName); 
			</SCRIPT>
			</span>
		</TD>
		<TD class=welcom>
			<span>欢迎您！</span> 
			<SPAN class=curUserName>&nbsp;</SPAN>
			<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
			<SPAN name=logout class=logout>退出</SPAN>
			</A>
			<INPUT id=Selected_Menu type=hidden value="管理->用户管理" name=Selected_Menu>
		</TD>
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
		<TD class="Item_T" rowspan="3"><ul class="TRD"><li class="TSD">用户管理</li></ul></TD>
		<TD width=7 bgColor=#FAFAFA></TD>
		<TD class='w-828' height="20"></TD>
	</TR>
	<TR>
	<TD width=7 background=/img/panel3.gif></TD>
	<TD valign="top">
		<div class="text-center">
			<P><strong><font color="#FF0000" size="2">原密码输入错误，密码设置失败！</font></strong></P><br>
			<input type="button" id="refbtn" name="refbtn" value="返回重设" onclick="location.href='/cgi-bin/mag-account.asp'">
		</div>	
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
</TBODY>
</TABLE>    
</BODY>
</HTML>

