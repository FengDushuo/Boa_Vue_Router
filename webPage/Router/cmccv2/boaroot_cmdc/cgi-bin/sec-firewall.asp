<%
if Request_Form("Fire_Flag") = "1" then

	TCWebApi_unset("Firewall_Entry")
	TCWebApi_set("Firewall_Entry","firewall_status","EnableFire_Flag")
	TCWebApi_set("Firewall_Entry","spi_status","SPIFW_Flag")
	
	TCWebApi_set("Firewall_Entry","firewall_level","SecurityLevel")
	
	TCWebApi_commit("Firewall_Entry")
	TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>防火墙</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
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
		<input id="Selected_Menu" type="hidden" value="安全->防火墙" name="Selected_Menu">
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
    	<script language=JavaScript type=text/javascript>
var FltsecLevel = '1'
var AttackProtectEnable = '1'


function ChoseLevel(o)
{
	if(o.checked)
	{
		var radioID = o.getAttribute("id").toString();
		var index = radioID.substr(radioID.length-1,1);
		document.getElementById("SecLevel").selectedIndex = parseInt(index)-1;
	}

}

function LoadFrame()
{
	with (getElById('ConfigForm'))
	{
		setAttackProtect();
		/*if (curUserName != sptUserName)
		{
			getElement('protectatack1').style.display = "none";
			getElement('protectatack2').style.display = "none";
			getElement('protectatack3').style.display = "none";
		}*/
	}
	
	autoRefreshMainTable("mainTableSet");
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function RefreshPage1()
{
	if(getCheckVal('enableAttackProtect') == 0)
	{
	document.ConfigForm.EnableFire_Flag.value = "0";
	}
	else
	{
	document.ConfigForm.EnableFire_Flag.value = "1";
	}
	$("form[name='ConfigForm']").submit();
}

function SubmitForm()
{
	var	Form = document.ConfigForm;
	Form.Fire_Flag.value = "1";
	/*if(1==iMode)
	{
		$("form[name='ConfigForm']").submit();
	}
	else if (2 == iMode)
	{
		$("form[name='ConfigForm1']").submit();
	}*/
   //     Form.submit();
   $("form[name='ConfigForm']").submit();
}

function ChangeLevel()
{
	var selIndex=document.getElementById("SecLevel").selectedIndex;
	var radioIndex=parseInt(selIndex)+1;
	document.getElementById("firewallLevel"+radioIndex).click();
}

function setAttackProtect()
{
	var attackChecked = getCheckVal('enableAttackProtect');
	if (attackChecked == '1')
	{
		document.ConfigForm.EnableFire_Flag.value = "1";
	}
	else
	{
		document.ConfigForm.EnableFire_Flag.value = "0";
	}
}

var cfg_menu_list  = new Array('安全级', '攻击保护设置');
var cfg_cookie_name = 'firewall-menu';
init_l_menu();

</script>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
          <td id="MenuArea_L2">
        	 <ul class="TRD">
            <li name="SecurityLev" id="安全级">安全级</li>
            <li name="AttackProtectSet" id="攻击保护设置">攻击保护设置</li>
           </ul>
          </td>
		  <SCRIPT language=javascript>
		  MakeMenu(getElById ('Selected_Menu').value);
		  </SCRIPT>
		  <TD valign="top">
   <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
     <tbody>
      <tr>
       <td valign="top">
       	<FORM name="ConfigForm" action="/cgi-bin/sec-firewall.asp" method="post">
       	<div id="安全级_item" class="hide secLevel">
		  	<input type="hidden" name="Fire_Flag" value="0">
			<input type="hidden" name="SPIFW_Flag" value="0">
	                <input type="hidden" name="EnableFire_Flag" value="<% tcWebApi_get("Firewall_Entry","firewall_status","s") %>">
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                        <TBODY>
                            <TR>
                                <TD>
                                    <div class="advanceTitle">安全级</div>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
                            <TR>
                    <td>
                        <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                            <tbody>
                                <tr>
                                    <td><div class="form-text">防火墙等级配置</div></td>
                                    <td>
                                        <SELECT id="SecLevel" onchange="ChangeLevel()" size=1 name="SecurityLevel">
                                            <option value="low" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "low" then asp_Write("selected") end if%>>低级</option>
                                            <option value="medium" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "medium" then asp_Write("selected") end if%>>中级</option>
                                                    <option value="high" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "high" then asp_Write("selected") end if%>>高级</option>
                                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input id="firewallLevel1" type="radio" onclick="ChoseLevel(this)" name="firewallLevel" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "low" then asp_Write("checked") end if%>>
                                        Tear Drop分片攻击，LAND攻击，无IP泛洪，Ping超长包攻击，源IP欺骗
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input id="firewallLevel2" type="radio" onclick="ChoseLevel(this)" name="firewallLevel" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "medium" then asp_Write("checked") end if%>>
                                        端口扫描，SYN 泛洪攻击，Smurf攻击
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input id="firewallLevel3" type="radio" onclick="ChoseLevel(this)" name="firewallLevel" <%if tcWebApi_get("Firewall_Entry","firewall_level","h") = "high" then asp_Write("checked") end if%>>
                                        WAN侧Ping攻击，WAN侧的无效数据包
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
          </tr>			
          <tr>
            <td colspan="2">
                <P style="margin-top: 32px;margin-left: 182px;">
                    <input type="button" id="btnOK" onclick="SubmitForm()" value="保 存">
                </P>
            </td>
          </tr>
        </tr>
        </tbody>
        </table>
        </div>

        <div id="攻击保护设置_item" class="hide attackProtect">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                <TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">攻击保护设置</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
                    <TR>
            <TD>
            	<table cellSpacing=0 cellPadding=0 width="100%" border=0>
            		<tbody>
            			<tr>
            				<td><div class="form-text">攻击保护设置</div></td>
                            <td>
		  	              <input class="input-onoff" id=enableAttackProtect onclick="setAttackProtect()" type="checkbox" name="enableAttackProtect" <%if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_Write("checked") end if%>>
            				</td>
            			</tr>
            		</tbody>
            	</table>
            </TD>
          </TR>
          <tr>
            <td colspan="2">
                <P style="margin-top: 32px;margin-left: 182px;">
                    <input type="button" id="btnOK0" onclick="SubmitForm()" value="保 存">
                </P>
            </td>
          </tr>
              </TBODY>
            </TABLE>
        </div>
        </form>
        </td>
     </tr>
        
				</TBODY></TABLE></TD>
				
          </tbody>
       </table>
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
