<%
if Request_Form("Save_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Entry","Active","EnableMac_Flag")
	TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
	TCWebApi_set("IpMacFilter_Entry","MacName","Name")
	TCWebApi_set("IpMacFilter_Entry","MacAddr","SourceMACAddress")
	TCWebAPI_set("IpMacFilter_Entry","Interface","Interface_Flag")
	TCWebAPI_set("IpMacFilter_Entry","Direction","Direction_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>添加MAC过滤</TITLE>
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
<SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
<script language="JavaScript" type="text/JavaScript">
<% if Request_Form("Save_Flag") = "1" then %>
	location.replace("/cgi-bin/sec-macfilter.asp");
<%end if%>
</script>
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
			智能组网终端
		</span>
	</div>
	<div class="in_welcom">
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="安全->MAC过滤" name="Selected_Menu">
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
    	<TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        	<TR>
        		 <TD id="MenuArea_L2">
               <ul class="TRD">
                   <li class="TSD">MAC过滤</li>
               </ul>
	    			</TD>
					<SCRIPT language=javascript>
					MakeMenu(getElById ('Selected_Menu').value);
					</SCRIPT>
					<TD valign="top">
            <TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
             <TBODY>
             		<TR>
            			<TD width=7 background=/img/panel3.gif>　</TD>
            			<TD valign="top" style="padding: 0;">
            				<script language="JavaScript" type="text/javascript">
var MacFilterRuleIndex = 0;
var MacFilterRule = new Array();
	
function LoadFrame()
{
	with (getElById('ConfigForm'))
	{
		Save_Flag.value = "0";
	}
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function CheckForm(type)
{
var macvalue = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>'
                  		
var rsp = JSON.parse(macvalue);
var mac_list = rsp.data;
with (getElById('ConfigForm'))
{
if (Name.length > 31)
{
alert("过滤名称不能超过31个字符!")
return false;
}
/*for (i = 0; i < MacFilter.length - 1; i++)
{
if (MacFilter[i][1] == Name.value)
{
alert('过滤名称不能重复！');
return false;
}
}*/
if (Name.value == '')
{
alert("过滤名称不能为空");
return false;
}
if (isValidName(Name.value) == false)
{
alert("过滤名称不正确");
return false;
}
if (SourceMACAddress.value == '')
{
alert("MAC地址不正确");
return false;
}
if (isValidMacAddress(SourceMACAddress.value) == false )
{
alert('MAC地址 "' + SourceMACAddress.value + '" 不正确,正确格式为(AA:BB:CC:DD:EE:FF)');
return false;
}
for(var i=0;i<mac_list.length;i++)
{
	/*
	if(Name.value == MacFilterRule[i].Name)
	{
		alert("相同的过滤名称已存在！");
		return false;		
	}*/
	if(SourceMACAddress.value.toLowerCase() == mac_list[i]['MacAddr'].toLowerCase())
	{
		alert("相同的过滤MAC地址已存在！");
		return false;		
	}
}
}
return true;
}
function AddSubmitParam(SubmitForm,type)
{
SubmitForm.addForm('ConfigForm','x');
SubmitForm.setAction('addcfg.cgi?x=InternetGatewayDevice.X_ATP_Security.MacFilter'
+ '&RequestFile=html/security/macfilter.asp');
}
function Cancel()
{
	location.replace('sec-macfilter.asp');
}
</script>
<script language="javascript" for="document" event="onkeydown">
if(event.keyCode==13)
{
SubmitForm();
return false;
}
</script>
            				<FORM name="ConfigForm" action="/cgi-bin/sec-addmacfilter.asp" method="post">
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                                    <TBODY>
                                        <TR>
                                            <TD>
                                                <div class="advanceTitle">添加MAC过滤规则</div>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD>
                                                <div class="title-line"></div>
                                            </TD>
                                        </TR>
				              <TR>
				              	<TD>

                    <input type="hidden" name="Save_Flag" value="0">
                    <input type="hidden" name="EnableMac_Flag" value="Yes">
                    <input type="hidden" name="curNum" value="<% tcWebApi_get("IpMacFilter","add_macnum","s") %>">
                    <input type="hidden" name="RuleType_Flag" value="MAC">
					<input type="hidden" name="Direction_Flag" value="Incoming">
                    <input type="hidden" name="IpMacType_Flag" value="Mac">
                    <input type="hidden" name="Actionflag" value="Add">
                    <input type="hidden" name="Interface_Flag" value="br0"> 
                    <script language="JavaScript" type="text/JavaScript">

function btnSubmit()
{
	var Form = document.ConfigForm;
	if(CheckForm(0) == false)
		return;
	Form.Save_Flag.value = "1";
	Form.submit();
}		
</script>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td><div class="form-text">过滤规则名称</div></td>
<td><input type='text' name="Name" id="Name" maxlength='31'></td>
</tr>
<tr>
<td><div class="form-text">MAC地址</div></td>
<td><input type='text' name="SourceMACAddress" id="SourceMACAddress" maxlength='17'><span>（格式：AA:BB:CC:DD:EE:FF）</span></td>
</tr>
<tr>
<td style="display:none"><br>使能
<input type='checkbox' id="Enable" name="Enable" checked></td>
</tr>
</table>
<br><br>
</TD>
				              </TR>
				                      	<TR>
						          <TD colspan='2'>
                                    <P style="margin-left: 182px;">
                                        <input type="button" id="btnOK" onclick="btnSubmit()" value="确 定">
						                <input type="button" id="btnCancel" style="margin-left: 24px;" name="btnCancel" onclick="Cancel()" value="返 回"> 
                                    </p>
						          </TD>
					        	</TR>
            				 </TBODY>
										</TABLE>
            				</FORM>
            			</TD>
            		</TR>
             </TBODY>
						</TABLE></TD>	

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
