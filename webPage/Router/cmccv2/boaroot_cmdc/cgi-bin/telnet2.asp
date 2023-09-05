<%
if Request_Form("telnet_flag") = "1" then 

	TCWebApi_set("Account_TelnetEntry","Active","telnetenable_flag")
	TCWebApi_commit("Account_TelnetEntry")
	TCWebApi_save()
	
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Telnet</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<div class="header">
  <div class="logo_img"></div>
  <div class="in_line"></div>
  <div class="in_device">
    <span class="td_model">
      CMCC R3s-3
    </span>
    <br>
    <span class="in_info">
      智能组网终端
    </span>
  </div>
  <div class="in_welcom">
    <span>欢迎您！</span> <span class=curUserName>&nbsp;</span>
    <a onclick=DoLogout() href="/cgi-bin/logout.cgi">
    <span>退出</span>
    </a>
    <input id="Selected_Menu" type="hidden" value="" name="Selected_Menu">
  </div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
  <TBODY>
  <TR>
		<TD class="header">
		  <TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
		    <TBODY>
		      <TR>
		        <TD id=MenuArea_L1>&nbsp;</TD>
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

function setTelnet()
{
	with (getElById('ConfigForm'))
	{
		if (enabletelnet.checked == true)
			telnetenable_flag.value = "Yes";
		else
			telnetenable_flag.value = "No";
	}
}

function btnCommit()
{
	var cform = document.ConfigForm;
	cform.telnet_flag.value = "1";
	cform.submit();
}
</SCRIPT>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR >
            <TD id="MenuArea_L2">
		 <ul class="TRD"><li  class="TSD">Telnet管理</li></ul>
	   </TD>
          <TD valign="top">
            <FORM name="ConfigForm" action="/cgi-bin/telnet2.asp" method="post">
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <input type="hidden" name="telnet_flag" value="0">
              <input type="hidden" name="telnetenable_flag" value="<% tcWebApi_get("Account_TelnetEntry","Active","s") %>">
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
				Telnet设置: 启用<INPUT id="enabletelnet" onclick="setTelnet()" type="checkbox" name="enabletelnet" <%if tcWebApi_get("Account_TelnetEntry","Active","h") = "Yes" then asp_Write("checked") end if%>>
				</TD>
                <TD width=10>&nbsp;</TD>
                    </TR>
                    <tr>
                      <td colspan="2">
                      <P align=center>
                        <input type="button" id="btnOK" onclick="btnCommit()" value="确定">
                        &nbsp;&nbsp;
                        <input type="button" id="btnCancel" name="btnCancel" onclick="RefreshPage()" value="取消">
                      </P>
                      </td>
                    </tr>
                  </TBODY>
                </TABLE>
              </FORM>
          </TD>
       </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
 </TBODY>
</TABLE>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY>
</HTML>
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>
