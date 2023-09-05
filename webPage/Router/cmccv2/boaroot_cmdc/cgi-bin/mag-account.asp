<%
if Request_Form("accountflg")="1" then
	if TCWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
		if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then
			TCWebApi_set("WebCurSet_Entry","CurPage","1")
			TCWebApi_set("Account_Entry1","username","newUsername")
            TCWebApi_set("Account_Entry1","Logged","logged")
            TCWebApi_set("Account_Entry1","Logoff","logoff")
			TCWebApi_commit("Account_Entry1")
			TCWebApi_save()
		elseif tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then
			TCWebApi_set("WebCurSet_Entry","CurPage","1")
			TCWebApi_set("Account_Entry1","username","newUsername")
            TCWebApi_set("Account_Entry0","Logged","logged")
            TCWebApi_set("Account_Entry0","Logoff","logoff")
            TCWebApi_commit("Account_Entry0")
			TCWebApi_commit("Account_Entry1")
			TCWebApi_save()
		end if
	end If
elseif Request_Form("accountflg")="2" then
	if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then
		if Request_Form("oldPassword") = tcWebApi_get("Account_Entry1","web_passwd","h") then
			TCWebApi_set("WebCurSet_Entry","CurPage","1")
			TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")
            TCWebApi_set("Account_Entry0","Logged","logged")
            TCWebApi_set("Account_Entry0","Logoff","logoff")
            TCWebApi_commit("Account_Entry0")
			TCWebApi_commit("Account_Entry1")
			TCWebApi_save()
		else
			TCWebApi_set("WebCurSet_Entry","CurPage","2")
		end if
	elseif TCWebApi_get("WebCustom_Entry","isNPUSupported","h" ) = "Yes" then
        TCWebApi_set("WebCurSet_Entry","CurPage","1")
        TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")
        TCWebApi_set("Account_Entry1","Logged","logged")
        TCWebApi_set("Account_Entry1","Logoff","logoff")
        TCWebApi_commit("Account_Entry1")
        TCWebApi_save()
	else
		TCWebApi_set("WebCurSet_Entry","CurPage","1")
		TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")
        TCWebApi_set("Account_Entry1","Logged","logged")
        TCWebApi_set("Account_Entry1","Logoff","logoff")
		TCWebApi_commit("Account_Entry1")
		TCWebApi_save()
	end If
else
	TCWebApi_set("WebCurSet_Entry","CurPage","0")
end If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>用户管理</TITLE>
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
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload=DoUnload() marginheight="0" marginwidth="0">
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
		<input id="Selected_Menu" type="hidden" value="管理->用户管理" name="Selected_Menu">
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

  <TR>
    <TD class="content">
<SCRIPT language=JavaScript type=text/javascript>
var signal = "<% tcWebApi_get("WebCurSet_Entry","CurPage","s") %>";

function LoadFrame()
{	
		with (getElById('ConfigForm'))
		{
			accountflg.value = "0";
			if((0 != parseInt(signal)) && (signal != "N/A"))
			{
				var istate = parseInt(signal);
				if(1 == istate)
				{
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
					alert("修改成功，将跳转到登录页面！", function(ret){
						window.location.href="/cgi-bin/logout.cgi";
					});

<% else %>
					if (curUserName == sptUserName){
						var tdResultElement = getElement('stResult');
						tdResultElement.innerHTML = '<P><strong><font color="#0000FF" size="2">密码修改成功！</font></strong></P>';
					}
					else{
						alert("修改成功，将跳转到登录页面！", function(ret){
							window.location.href="/cgi-bin/index2.asp";
						});
					}
<% end if %>
				}
				else{
					window.location.href="/cgi-bin/ErrMsg.asp";
				}
			}
		}
		var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
		set_action(query_string);
}
	
	function CheckForm_user()
	{	
	var user_val = document.ConfigForm.newUsername.value;
		if ( user_val == "")
		{
			alert("新用户名不能为空 ！");
			return false;
		}
		if (user_val.indexOf(" ") != -1)
		{
			alert("新用户名不能包含空格 ！");
			return false;
		}
		if ( user_val.length > 31 )
		{
			alert("新用户名不能长度大于31！");
			return false;
		}
		if ( escape(user_val).indexOf("%u") != -1 )
		{
			alert("新密码不能包含中文字符 ！")
			return false;
		}
		if ( user_val.indexOf(";") != -1 || user_val.indexOf(":") != -1)
		{
			alert("新用户名不能包含:或者;");
			return false;
		}
		return true;	
	}
	function CheckForm_pwd()
	{
		var str = "";
		var i, ch;
		/*
		var rule = /^(?![A-Za-z]+$)(?![A-Za-z\d]+$)(?![A-Za-z\W]+$)(?![\d\W]+$)\S{8,31}$/;
		
		if(!rule.test(document.ConfigForm.newPassword.value))
		{
			alert("新密码长度大于31或者长度小于8或者不包含数字、字母和特殊字符三种 ！");
			return false;
		}
		*/
		if (document.ConfigForm.newPassword.value == "")
		{
			alert("密码为8~63个字符,由英文、数字和特殊字符组成如!@#$%等，不能包含中文字符和空格");
			return false;
		}
		
		str = document.ConfigForm.newPassword.value;
		if ( str.length < 8 || str.length > 63 )
		{
			alert("密码为8~63个字符,由英文、数字和特殊字符组成如!@#$%等，不能包含中文字符和空格");
			return false;
		}
		
		if ( str.length >= 8 && str.length < 64 )
		{
			if ( str.match(/[^\x00-\xff]/g) )
			{
				alert("密码为8~63个字符,由英文、数字和特殊字符组成如!@#$%等，不能包含中文字符和空格");
				return false;
			} 
			else 
			{
				for ( i = 0; i < str.length; i++ )
				{
					if ( str.charAt(i) == ' ' )
					{
						break;
					}
				}
				if( i != str.length)
				{
					alert("密码为8~63个字符,由英文、数字和特殊字符组成如!@#$%等，不能包含中文字符和空格");
					return false;
				}
			}
		}
		
		if ( escape(str).indexOf("%u") != -1 )
		{
			alert("密码为8~63个字符,由英文、数字和特殊字符组成如!@#$%等，不能包含中文字符和空格")
			return false;
		}
		
		if (document.ConfigForm.cfmPassword.value != document.ConfigForm.newPassword.value)
		{
			alert("确认密码不匹配！");
			return false;
		}
		return true;
	}
		
	function OnOK_user()
	{
		if (CheckForm_user())
		{
			document.ConfigForm.accountflg.value = "1";
			document.ConfigForm.submit();
		}
	}
	function OnOK_pwd()
	{
		if (CheckForm_pwd())
		{
			confirm("修改账号成功后，需要使用新密码重新登录！", function(ret){
			if(ret){
				document.ConfigForm.accountflg.value = "2";
				document.ConfigForm.submit();
			}
			else
				return;
			});
		}
	}
</SCRIPT>

      <TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
			<TD id=MenuArea_L2>
				<ul class="TRD">
				<li id=UserManagement class="TSD">用户管理</li>
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
                                <div class="advanceTitle">用户管理</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
                        <TR>
            <TD width=7 background=/img/panel3.gif>　</TD>
          <TD valign="top">
            <FORM name=ConfigForm action="/cgi-bin/mag-account.asp" method="post">
			<INPUT TYPE="HIDDEN" NAME="name0" VALUE="<%TCWebApi_get("Account_Entry0","username","s")%>">
			<INPUT TYPE="HIDDEN" NAME="name1" VALUE="<%TCWebApi_get("Account_Entry1","username","s")%>">
			<INPUT TYPE="HIDDEN" NAME="name2" VALUE="<%TCWebApi_get("Account_Entry2","username","s")%>">
            <INPUT TYPE="HIDDEN" NAME="logged" VALUE="0">
            <INPUT TYPE="HIDDEN" NAME="logoff" VALUE="1">
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class='w-10'>&nbsp;</TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR id=secUsername>
                      <TD class='w-110'><div class="form-text">用户名</div></TD>
                      <TD>
												<!--<SELECT id=oldUsername style="WIDTH: 115px"  size=1 name=oldUsername>--> 
												<SCRIPT language=JavaScript type=text/javascript>
												<% if TCWebApi_get("Account_Entry0","Logged","h") = "1" then %>
												if ( document.ConfigForm.name0.value != "" )
												{
													/* document.write('<option value="' + document.ConfigForm.name0.value + '" >' + document.ConfigForm.name0.value); */
													document.write('<div class="form-text">' + document.ConfigForm.name0.value + '</div>');
												}
												<% end if %>
												<% if TCWebApi_get("Account_Entry1","Logged","h") = "1" then %>
												if(document.ConfigForm.name1.value != "")
												{
													/* document.write('<option value="' + document.ConfigForm.name1.value + '" selected>' + document.ConfigForm.name1.value); */
													document.write('<div class="form-text">' + document.ConfigForm.name1.value + '</div>');
												}
												<% end if %>
												/*
												if ( document.ConfigForm.name2.value != "" )
												{
													document.write('<option value="' + document.ConfigForm.name2.value + '" >' + document.ConfigForm.name2.value);
												}
												*/
												</SCRIPT>
                        <!--</SELECT>-->
                       </TD>
                    </TR>
										<TR id=trNewUsername name=trNewUsername>
										<TD><div class="form-text">新用户名</div></TD>
										<TD><INPUT id=newUsername maxLength=35 size=15 name=newUsername></TD>
										<script language="JavaScript" type="text/JavaScript">
										/* setDisplay("trNewUsername", 0); */
										if (curUserName == sptUserName)
										{
											setDisplay("TroldPassword", 0);
										}
										</script></TD>
										</TR>
										<TR>
										<TD colspan='2'>
											<P style="margin: 32px 0 22px 182px">
												<INPUT id="btnOK0" name="btnOK0" onclick="OnOK_user();" type="button" value="保 存">
											</P>
										  </TD>										
										</TR>
                    <TR id=TroldPassword name=TroldPassword style="display: none;">
                      <TD><div class="form-text">旧密码</div></TD>
                      <TD><INPUT id=oldPassword type=password maxLength=35 
                        size=15 name=oldPassword></TD>
                    </TR>
                    <TR>
                      <TD><div class="form-text">新密码</div></TD>
                      <TD><INPUT id=newPassword type=password maxLength=35 
                        size=15 name=newPassword>
					<script language="JavaScript" type="text/JavaScript">
					/* setDisplay("trNewUsername", 0); */
					if (curUserName == sptUserName)
					{
						setDisplay("TroldPassword", 0);
					}
					</script></TD>
                    </TR>
                    <TR>
                      <TD><div class="form-text">确认新密码</div></TD>
                      <TD><INPUT id=cfmPassword type=password maxLength=35 
                        size=15 name=cfmPassword></TD>
					</TR>
                    <TR>
					<TD colspan='2'>
						<P style="margin-top: 32px;margin-left: 182px;">
							<INPUT id="btnOK1" name="btnOK1" onclick="OnOK_pwd();" type="button" value="保 存">
						</P>
					  </TD>						
                    </TR>
                   </TBODY>
                   </TABLE>
                   <BR></TD>
                <TD class='w-10'>&nbsp;</TD>
              </TR>
              <TR>
                <TD class='w-10'>&nbsp;</TD>
                <TD><DIV id=stResult style="FONT-SIZE: 13px"></DIV></TD>
				<INPUT TYPE="HIDDEN" NAME="accountflg" VALUE="0">
                <TD class='w-10'>&nbsp;</TD>
              </TR>
             </TBODY>
             </TABLE>
             </FORM></TD>
        </TR>
        <TR>
  
        </TR>
	</TBODY>
	</TABLE>
    </TD>
   </TR>			
   </TBODY>
   </TABLE></TD>
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
