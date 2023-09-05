<%
if Request_Form("formcommit") = "1" then
	if Request_Form("entryidx") = "0" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P0","filterProtocolValue")
	elseif Request_Form("entryidx") = "1" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P1","filterProtocolValue")
	elseif Request_Form("entryidx") = "2" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P2","filterProtocolValue")
	elseif Request_Form("entryidx") = "3" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P3","filterProtocolValue")
	elseif Request_Form("entryidx") = "4" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P4","filterProtocolValue")	
	elseif Request_Form("entryidx") = "5" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P5","filterProtocolValue")		
	elseif Request_Form("entryidx") = "6" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P6","filterProtocolValue")		
	elseif Request_Form("entryidx") = "7" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P7","filterProtocolValue")	
	elseif Request_Form("entryidx") = "8" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P8","filterProtocolValue")
	elseif Request_Form("entryidx") = "9" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P9","filterProtocolValue")
	elseif Request_Form("entryidx") = "10" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P10","filterProtocolValue")
	elseif Request_Form("entryidx") = "11" then
		TCWebApi_set("IpMacFilter_EtherTypeFilter","P11","filterProtocolValue")
	end if
	TCWebApi_commit("IpMacFilter_EtherTypeFilter")
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>协议过滤</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<SCRIPT language=JavaScript type=text/javascript>
function LoadFrame()
{
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function ModifyInstance(index)
{
  var lanmode = LanArray[index -1].Mode;
  var proV = LanArray[index -1].FilterP;

  document.getElementById("TableUrlInfo").style.display = "block";
    
  if(proV.indexOf('IPv4oE')>=0)
  	setCheck("cbIPv4oE" ,1);
  else
  	setCheck("cbIPv4oE" ,0);
  if(proV.indexOf('PPPoE')>=0)
  	setCheck("cbPPPoE" ,1);
  else
  	setCheck("cbPPPoE" ,0);  	
  if(proV.indexOf('ARP')>=0)
  	setCheck("cbARP" ,1);
  else
  	setCheck("cbARP" ,0);
  if(proV.indexOf('IPv6oE')>=0)
  	setCheck("cbIPv6oE" ,1);
  else
  	setCheck("cbIPv6oE" ,0);
}
 
function setControl(index) 
{ 
	var identi = "";

	selectIndex = index;
	if (index < -1)
		return;

	identi = index > 4 ? (index > 8 ? "SSIDAC"+(index-8) : "SSID"+(index-4)) : "LAN"+index;
	document.getElementById("PortId").innerHTML = identi;

	return ModifyInstance(index);
}

function FilterPInfoClass(vP)
{
    this.FilterP = ( 'N/A' == vP ) ? '' : vP;
}

var LanArray = new Array(
new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P0","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P1","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P2","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P3","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P4","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P5","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P6","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P7","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P8","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P9","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P10","s") %>')
, new FilterPInfoClass('<% tcWebApi_get("IpMacFilter_EtherTypeFilter","P11","s") %>')
,null);

function setListdisplay()
{
	var ssidNum = parseInt('<% tcWebApi_get("WLan_Common","BssidNum","s") %>');
	var ssidacNum = parseInt('<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>');
	var ctlID= "";

    <% if tcWebApi_get("WebCustom_Entry","isCT1PORTSupported","h") = "Yes" then %>
						   setDisplay('record_2', 0);
    <% end if %>
	<% if tcWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") = "Yes" then %>
						   setDisplay('record_3', 0);
						   setDisplay('record_4', 0);
	<% end if %>
	<% if tcWebApi_get("WebCustom_Entry","isWLanSupported","h" ) <> "Yes" then %>
							for (var i = 5; i <= 8; i++){
								ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
	<% else %>
							for (var i = 4 + ssidNum + 1 ; i <= 8; i++){
								ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
	<% end if %>

	<% if tcWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) <> "Yes" then %>
							for (var i = 9; i <= 12; i++){
								ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
	<% else %>	
							for (var i = 8 + ssidacNum + 1; i <= 12; i++){
								ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
	<% end if %>
		
}

function CreateList()
{     
  var HtmlCode = "";
  var Lan_Indenti1 = "LAN";
  var Lan_Indenti2 = "SSID";
  var Lan_Indenti3 = "SSIDAC";
  var Lan = "";
  var LanCnt = 4;
  var LanWire = 4;
  var SSIDWire = 4;
  var ctlID= "";

  for (var i = 1; i <= 12; i++)
  {  
	if(i <= LanWire)
		Lan = Lan_Indenti1 + i;
	else if(i <= LanWire + SSIDWire)
		Lan = Lan_Indenti2 + (i - LanWire);
	else
		Lan = Lan_Indenti3 + (i - LanWire - SSIDWire);

    HtmlCode += '<tr id= "record_' + i +'" align = "center" class="table1_01" onclick="selectLine(this.id); " >';
    HtmlCode += '<td >' + Lan + '</td>';      
    if(LanArray[i-1].FilterP == "")
    {
        HtmlCode += '<td></td>';
	}
    else
    {
        HtmlCode += '<td style="word-break:break-all;word-wrap:break-word;">' + LanArray[i-1].FilterP + '</td>'; 
    }
     
    HtmlCode += '</tr>'      
  }
  return HtmlCode;    
}

//用户点击了取消按钮后的代码逻辑
function OnCancelButtonClick()
{
    document.getElementById("TableUrlInfo").style.display = "none";
    return false;
}

function getEntryIndex(portid)
{
	switch ( portid )
	{
		case 'LAN1':
		case 'LAN2':
		case 'LAN3':
		case 'LAN4':
			return parseInt(portid.substring(3, 4)) - 1;
		case 'SSID1':
		case 'SSID2':
		case 'SSID3':
		case 'SSID4':
			return parseInt(portid.substring(4, 5)) + 3;
		case 'SSIDAC1':
		case 'SSIDAC2':
		case 'SSIDAC3':
		case 'SSIDAC4':
			return parseInt(portid.substring(6, 7)) + 7;
		default:
			return -1;
	}
}

function OnApplyButtonClick()
{
		var entryidx = 0;
		var PortId = getElementById("PortId").innerHTML;
		var proV = '';

		entryidx = getEntryIndex(PortId);
		if ( entryidx < 0 )	{
			alert('Invalid entry!')
			return false;	
		}
		document.forms[0].entryidx.value = entryidx;
		document.forms[0].formcommit.value = 1;
		
		if (getCheckVal('cbIPv4oE') == 1)
			proV = 'IPv4oE';
		if (getCheckVal('cbPPPoE') == 1){
			if(proV == '')
				proV = 'PPPoE';
			else
				proV = proV + ',PPPoE';
		}
		if (getCheckVal('cbARP') == 1){
			if(proV == '')
				proV = 'ARP';
			else
				proV = proV + ',ARP';
		}
		if (getCheckVal('cbIPv6oE') == 1){
			if(proV == '')
				proV = 'IPv6oE';
			else
				proV = proV + ',IPv6oE';
		}
		document.forms[0].filterProtocolValue.value = proV;
		document.forms[0].submit();
		return true;
}
</SCRIPT>   
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" onunload=DoUnload() marginheight="0" marginwidth="0">
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
                			<SCRIPT language=javascript> document.write(top.ModelName); </SCRIPT>
                		</span>
                </TD>
                <TD class=welcom >
                    <span>您好！</span>
                    <a onclick="top.location.href='/'">
                    <span>返回主页</span>
                    </a>
                		<INPUT id=Selected_Menu type=hidden value="安全->协议过滤" name=Selected_Menu></TD>
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
    	<TABLE class="tblMain" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        	<TR>
        		 <TD class="Item_T" >
               <ul class="TRD">
                   <li class="TSD">协议过滤</li>
               </ul>
	    			</TD>
	    			 <TD class='w-828'>
            <TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
             <TBODY>
             		<TR>
            			<TD width=7 background=/img/panel3.gif>　</TD>
            			<TD valign="top">
<FORM name="ConfigForm" action="/cgi-bin/sec-protocolfilter.asp" method="post">
						<!--解释头-->
						<div id="PromptPanel">					  
						</div>

					<!--TODO:在这里加入你的具体页面展现-->
					  <table class="table1_bg" border="0" cellspacing="1" style="margin-left: 5px;" width="98%">
					    <tr class="table1_title">
						       <td width="10%">端口</td>
						       <td width="75%">过滤的协议</td>
						  </tr>    
						    <script>
						   document.write(CreateList()); 
						   setListdisplay();
						   </script>
					 </table>

					 <!--Apply和Cancel按钮-->
					  <div id="TableUrlInfo" style="display:none">					
					  <table cellspacing="1" cellpadding="0" class="table1_bg" style="margin-left: 5px;" width="98%">					  
					    <tr class="trTabConfigure">  
					    <td align= left width=25% class="table1_left">端口<td  class="table1_right"> <div id="PortId"></div></td> </td>
					    </tr>
					</table>

					  <div id="BindVlanRow">
					  <table cellspacing="1" cellpadding="0" class="table1_bg" style="margin-left: 5px;" width="98%">
					    <tr class="trTabConfigure"><td width="25%"  align=left class="table1_left">协议</td><td class="table1_right">
					    	<INPUT id=cbIPv4oE type=checkbox name="cbIPv4oE">IPv4oE
					    	<INPUT id=cbPPPoE type=checkbox name="cbPPPoE">PPPoE
					    	<INPUT id=cbARP type=checkbox name="cbARP">ARP
					    	<INPUT id=cbIPv6oE type=checkbox name="cbIPv6oE">IPv6oE</td></tr>
					  </table>
					  </div>
					  <table id="ConfigPanelButtons" width="100%" cellspacing="1" class="table1_button">
					    <tr>
					        <td width="25%">
					        </td>
					        <td class="table1_submit" style="padding-left: 5px">
					        		<input type='hidden' value='0' name='entryidx'>
					        		<input type='hidden' value='0' name='formcommit'>
					        		<input type='hidden' value='' name='filterProtocolValue'>
					            <input id="ButtonApply"  type="button" value="应用" onclick="javascript:return OnApplyButtonClick();" class="submit" />
					            <input id="ButtonCancel" type="button" value="取消" onclick="javascript:OnCancelButtonClick();" class="submit" />
					        </td>
					    </tr>
					  </table>
					</div>
            </FORM>
            			</TD>
            		</TR>
             </TBODY>
						</TABLE></TD>	

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
