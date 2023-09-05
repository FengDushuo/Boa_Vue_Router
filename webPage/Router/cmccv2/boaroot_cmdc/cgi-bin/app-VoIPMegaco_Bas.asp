<%
If request_Form("VoIP_h248_flag")="1" then
tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "1")
	if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h")= "Yes" then
	if tcWebApi_get("VoIPBasic_Entry0", "Enable", "h") = "Yes"  then
		if tcWebApi_get("VoIPSysParam_Entry0", "SC_LINE_INFO_STATUS", "h") <> "N/A"  then
			if tcWebApi_get("VoIPSysParam_Entry0", "SC_LINE_INFO_STATUS", "h") <> "Idle"  then
			tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "0")
			end if
		end if
	end if
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
		if tcWebApi_get("VoIPBasic_Entry1", "Enable", "h") = "Yes"  then
			if tcWebApi_get("VoIPSysParam_Entry1", "SC_LINE_INFO_STATUS", "h") <> "N/A"  then
				if tcWebApi_get("VoIPSysParam_Entry1", "SC_LINE_INFO_STATUS", "h") <> "Idle"  then
				tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "0")
				end if
			end if
		end if
	end if
	end if
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
		if tcWebApi_get("InfoVoIPH248_Entry0", "lineInfoStatus", "h") <> "N/A" then
			if tcWebApi_get("InfoVoIPH248_Entry0", "lineInfoStatus", "h") <> "Idle"  then
				tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "0")
			end if
		end if
	end if
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
		if tcWebApi_get("VoIPBasic_Common", "VoIPLine2Enable", "h") = "Yes"  then
			if tcWebApi_get("InfoVoIPH248_Entry1", "lineInfoStatus", "h") <> "N/A" then
				if tcWebApi_get("InfoVoIPH248_Entry1", "lineInfoStatus", "h") <> "Idle"  then
					tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "0")
				end if
			end if
		end if
	end if
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
	if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then
		tcWebApi_set("VoIPBasic_Common", "SIPProtocol", "VoIPMode")
		tcWebApi_commit("VoIPBasic")
	End if
	tcWebApi_set("VoIPH248_Common", "DeviceIDType", "mgidselect")	
	tcWebApi_set("VoIPH248_Common", "DeviceID", "mymgname")	
	tcWebApi_set("VoIPH248_Common", "MediaGatewayPort", "mymgport")
	tcWebApi_set("VoIPH248_Common", "MediaGatewayControler", "mymgcip")
	tcWebApi_set("VoIPH248_Common", "MediaGatewayControlerPort", "mymgcport")
	tcWebApi_set("VoIPH248_Common", "SBMediaGatewayControler", "mybkmgcip")	
	tcWebApi_set("VoIPH248_Common", "SBMediaGatewayControlerPort", "mybkmgcport")	
	tcWebApi_set("VoIPH248_Common", "RTPPrefix", "mgRTPPrefix")	
	tcWebApi_set("VoIPH248_Common", "EphemeralTermIDAddLen", "mgEpTermIDLen")	
	tcWebApi_set("VoIPH248_Common", "EphemeralTermIDUniform", "mgEpTermIDUniform")	
	tcWebApi_set("VoIPH248_Common", "EphemeralTermIDStart", "mgEpTermIDStart")	
	tcWebApi_set("VoIPH248_Common", "EphemeralTermIDNum", "mgEpTermIDNum")
	tcWebApi_set("VoIPH248_Common", "MegacoSignalDSCP", "mymgtos")
	tcWebApi_set("VoIPH248_Common", "MegacoRTPDSCP", "mymgtos2")	
	tcWebApi_set("VoIPH248_Entry0", "PhysicalTermID", "mymgterm0")
	tcWebApi_set("VoIPH248_Common", "PhysicalTermIDPrefix", "termidPrefix")		
	tcWebApi_set("VoIPH248_Common", "PhysicalTermIDConfigMethod", "termidMethod")		
	tcWebApi_set("VoIPH248_Common", "PhysicalTermIDStart", "termidStart")		
	If tcWebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then 	
	tcWebApi_set("VoIPH248_Entry1", "PhysicalTermID", "mymgterm1")			
	End If			
	tcWebApi_commit("VoIPH248_Common")
	tcWebApi_commit("VoIPH248")
	tcWebApi_save()
        end if
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<TITLE>VOIP����</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<SCRIPT language="javascript" type = "text/javascript">
<%
If request_Form("VoIP_h248_flag")="1" then
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") <> "1"  then
		asp_write("alert('����绰ͨ���У����ܱ��棬��ͨ���������ٱ��档');")
	end if
end if
%>
function LoadFrame() 
{
	with (document.ConfigForm)
	{

		generatePerLineTable1();
				
		if ("0" == document.getElementById("termid_method").selectedIndex){
			document.getElementById("termidPrefix_table").style.display = "";
			document.getElementById("termidStart_table").style.display = "";	
				
			document.getElementById("perLineTablePlaceholder2").style.display = "none";
		}
		else{			
			document.getElementById("termidPrefix_table").style.display = "none";
			document.getElementById("termidStart_table").style.display = "none";	
			
			document.getElementById("perLineTablePlaceholder2").style.display = "";		
		}
	}
	
	if ( "0" == document.getElementById("mgidtype").selectedIndex){
		document.getElementById("in_h_domain1_val").style.display = "none";
	}
	else{
		document.getElementById("in_h_domain1_val").style.display = "";
	}
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
	
}
		

function generatePerLineTable1()
{
   if (document.body.innerHTML) 
   {
      var tableHtmlOutput = "<tr>";
	  tableHtmlOutput += "<td>";
	  tableHtmlOutput += "<table width='391' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0C0C0' style='border-collapse: collapse'>";
      tableHtmlOutput += "<tr align='left'>";
      tableHtmlOutput += "<td height='25' colspan='3' ><strong id='in_h_resource1'>��Դ</strong></td>";
	  tableHtmlOutput += "</tr>";
	  
	  tableHtmlOutput += "<tr align='center'>";
	  tableHtmlOutput += "<td width='162' height='25' >&nbsp;</td>"
	  	
	 <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	  for (var mgline = 1; mgline <= 2; mgline++) 
	 <% else %>
	  for (var mgline = 1; mgline <= 1; mgline++)
	 <% end if %> 
      {
         var data = "<td width='162' height='25'  id=\'in_h_line" + mgline+ "\'>��·"+mgline+"</td>";
         tableHtmlOutput += data;
      }
	  
	  tableHtmlOutput += "</tr>";
	  tableHtmlOutput += "<tr align='center'>";
	  tableHtmlOutput += "<td height='25'  id='in_h_term1'>�ն�</td>";
	  
  	var data = "<input name=\'mymgterm0\' type='text' id=\'in_h_term1_val0\' value=\'<%if tcWebApi_get("VoIPH248_Entry0", "PhysicalTermID", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Entry0", "PhysicalTermID", "s") else asp_Write("") end if %>\'>";
  	tableHtmlOutput += "<td height='25'>" + data + "</td>";
	<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
  	var data = "<input name=\'mymgterm1\' type='text' id=\'in_h_term1_val1\' value=\'<%if tcWebApi_get("VoIPH248_Entry1", "PhysicalTermID", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Entry1", "PhysicalTermID", "s") else asp_Write("") end if %>\'>";
  	tableHtmlOutput += "<td height='25'>" + data + "</td>";
	<% end if %> 
	  tableHtmlOutput += "</tr>";
	  tableHtmlOutput += "</table>";
	  tableHtmlOutput += "</td>";
	  tableHtmlOutput += "</tr>";  
      
      document.getElementById("perLineTablePlaceholder2").innerHTML = tableHtmlOutput;
   }
   else 
   {
      alert("Cannot create per line table in this browser.");
   }
}		

function applyClickBasic()
{
}	
		
function applyClickAdvanced()
{
   var loc = "app-VoIP248_Adv.asp";
   var code = "location='" + loc + " '";
   eval(code);
}

function isValidIPV6(str)
{
	var pattern = new RegExp("^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:)|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}(:[0-9A-Fa-f]{1,4}){1,2})|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){1,3})|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){1,4})|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){1,5})|([0-9A-Fa-f]{1,4}:(:[0-9A-Fa-f]{1,4}){1,6})|(:(:[0-9A-Fa-f]{1,4}){1,7})|(([0-9A-Fa-f]{1,4}:){6}(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){5}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){0,1}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){0,2}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){0,3}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|([0-9A-Fa-f]{1,4}:(:[0-9A-Fa-f]{1,4}){0,4}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(:(:[0-9A-Fa-f]{1,4}){0,5}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}))$");
	return pattern.test(str);
}

function VoiceApplyBasic()
{
	with (document.ConfigForm)
	{

		if (mymgname.value != "")
		{
								
			if (mgidselect.selectedIndex == "2")
			{
				if (isValidMacAddress(mymgname.value) == false)
				{
					alert('"' + mymgname.value + '"����ЧMAC��ַ.');	
					return;
				}		
			}	
			
		}

		if (mgRTPPrefix.value == "")
		{
			alert('��ʱ�˵�ǰ׺����Ϊ��.');
			return;
		}
				
		var temp = parseInt(mymgtos.value);	
		if (temp < 0 || temp > 63)
		{
			alert('TOS/DSCP �������ȼ��ķ�Χ��0~63.');
			return;
		}
		
		var temp = parseInt(mymgtos2.value);	
		if (temp < 0 || temp > 63)
		{
			alert('TOS/DSCP RTP���ȼ��ķ�Χ��0~63.');
			return;
		}		
		
		if (mymgcip.value != "")
		{
			if (mymgcport.value == "")
			{
				alert('�������˿ںŲ���Ϊ��.');
				return;
			}
			if(mymgcip.value.match(":"))
			{
				var result = isValidIPV6(mymgcip.value);
				if(result != true){
				    alert('��������ַ���Ϸ�.');
				    return;
				}
			}
		}
		else
		{
			if (mymgcport.value != "")
			{
				alert('��������ַ����Ϊ��.');
				return;
			}
		}
		
		if (mybkmgcip.value != "")
		{
			if (mybkmgcport.value == "")
			{
				alert('���÷������˿ںŲ���Ϊ��.');
				return;
			}
			if(mybkmgcip.value.match(":"))
			{
				var result = isValidIPV6(mybkmgcip.value);
				if(result != true){
				    alert('���÷�������ַ���Ϸ�.');
				    return;
				}
			}
		}
		else
		{
			if (mybkmgcport.value != "")
			{
				alert('���÷�������ַ����Ϊ��.');
				return;
			}
		}

		VoIP_h248_flag.value = 1;
		var voipType = "H.248";
	<% if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") <> "H.248"  then %>
			location.replace("/cgi-bin/app-VoIP.asp");
	<% end if %>
		submit();
	}
}

function checkPort(o)
{
	if (o.value != "")
	{
		if (!isInteger(o.value) || !isValidPort(o.value))
		{
			alert('"' + o.value + '"' + '����Ч�˿�.');	
			window.setTimeout( function(){ o.focus(); }, 0);
		}
	}
}

function mgIdSelectChange(o){
  var idx = o.selectedIndex;
  var val = o.options[idx].value;
  
  if ( val == "0" ){
  	document.getElementById("in_h_domain1_val").style.display = "none";
  }
  else{
  	document.getElementById("in_h_domain1_val").style.display = "";
  }
}

function termidMethodSelectChange(o){
  var idx = o.selectedIndex;
  var val = o.options[idx].value;
  
  if ( val == "0" ){
  	document.getElementById("termidPrefix_table").style.display = "";
  	document.getElementById("termidStart_table").style.display = "";
  	
  	document.getElementById("perLineTablePlaceholder2").style.display = "none";
  }
  else{
  	document.getElementById("termidPrefix_table").style.display = "none";
  	document.getElementById("termidStart_table").style.display = "none";
  	
  	document.getElementById("perLineTablePlaceholder2").style.display = "";
  }
}

<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
function voipTypeChg(){
	with (document.ConfigForm)
	{
		if(VoIPMode.options[VoIPMode.selectedIndex].value != "H.248")
		{	
			location.replace('/cgi-bin/app-VoIP.asp'+'?voiptype='+VoIPMode.options[VoIPMode.selectedIndex].value);
		}
	}
}
<%end if%>

</SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 align=center border=0 class="major">
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
                		<span>�ͺ�: </span> 
                		<span> 
                			<SCRIPT language=javascript> document.write(top.ModelName); </SCRIPT>
                		</span>
                </TD>
                <TD class=welcom>
                		<span>��ӭ����</span> 
                		<SPAN class=curUserName>&nbsp;</SPAN>
                		<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
                			 <SPAN name=logout class=logout>�˳�</SPAN>
                		</A>
                  	<INPUT id=Selected_Menu type=hidden value="Ӧ��->����绰����" name=Selected_Menu></TD>
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
  		<table height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
  			<tbody>
  				<td class="Item_T" rowspan="6">
          	<ul class="TRD">
				<li id="V_voip_1" onClick="applyClickBasic()" class="TSD">����绰��������</li>
             <li id="V_voip_2" onClick="applyClickAdvanced()">����绰�߼�����</li>
          	</ul>
          </TD>
          
          <TD width="828px">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=7 background=/img/panel3.gif>��</TD>
                <TD>
                  <FORM id=ConfigForm name="ConfigForm" action="/cgi-bin/app-VoIP248.asp" method="post">
                 		<DIV id=pptp>
                  		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
										     <TBODY>

							                <TR>
							                    <TD class=table1_head>
							                    	<B>
							                        ����绰������������
							                      </B>
							                    </TD>
							                </TR>
							                <TR>
							                    <TD height="10">
							                        
							                    </TD>
							                </TR>
							            </TBODY>
								        </TABLE>
								        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
								            <TBODY>
								                <TR>
								                    <TD height=5></TD>
								                </TR>
								            </TBODY>
							       		</TABLE>
								        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
								            <TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
										<TR>
			                 						<TD align=left width="100">Э��:</td>
			                 						<TD align=left>
			                 							<select onchange="voipTypeChg()" name="VoIPMode">
			                 								<option value="IMSSIP">IMSSIP</option>
			                 								<option value="SIP" >SIP</option>
			                 								<option value="H.248" selected>H.248</option>
			                 							</select>
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
								                       ���л�����Э��,������.
<%end if%>
			                 						</TD>
			                 					</TR>
<% end if %>			                 					
								                <TR>
								                    <TD  align=left>
								                        MGע�᷽ʽ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                  
										                        <select name="mgregselect" id="mg_regist" onchange="" disabled=true>
						                                    <option value="0" <%if tcWebApi_get("VoIPH248_Common", "DeviceRegType", "h") = "0" then asp_Write("selected") end if %>>ROOT</option>
						                                    <option value="1" <%if tcWebApi_get("VoIPH248_Common", "DeviceRegType", "h") = "1" then asp_Write("selected") end if %>>�ս��</option>
						                                </select>
						                       
								                    </TD>
								                </TR>                 					
								                <TR>
								                    <TD  width="35%" align=left>
								                        �ն˱�ʶ����
								                    </TD>
								                    <TD  width="65%" colSpan=2 align=left>
								                  
										                        <select name="mgidselect" id="mgidtype" onchange="mgIdSelectChange(this)">
						                                    <option value="0" <%if tcWebApi_get("VoIPH248_Common", "DeviceIDType", "h") = "0" then asp_Write("selected") end if %>>IP</option>
						                                    <option value="1" <%if tcWebApi_get("VoIPH248_Common", "DeviceIDType", "h") = "1" then asp_Write("selected") end if %>>Domain name</option>             
						                                    <option value="2" <%if tcWebApi_get("VoIPH248_Common", "DeviceIDType", "h") = "2" then asp_Write("selected") end if %>>MAC</option>
						                                </select>
						                            
						                              	<input name="mymgname" type="text" id="in_h_domain1_val" value="<%if tcWebApi_get("VoIPH248_Common", "DeviceID", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "DeviceID", "s") else asp_Write("") end if %>">
						                       
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        MG�˿ں�
								                    </TD>
								                    <TD  colSpan=2 align=left>	
								                        <input name="mymgport" type="text" id="in_h_mg1_val" onblur="checkPort(this)" value="<%if tcWebApi_get("VoIPH248_Common", "MediaGatewayPort", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "MediaGatewayPort", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        ��������ַ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mymgcip" type="text" id="in_h_servaddr1_val" value="<%if tcWebApi_get("VoIPH248_Common", "MediaGatewayControler", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "MediaGatewayControler", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        �������˿ں�
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mymgcport" type="text" id="in_h_servnum1_val" onblur="checkPort(this)" title=an_tos2 value="<%if tcWebApi_get("VoIPH248_Common", "MediaGatewayControlerPort", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "MediaGatewayControlerPort", "s") else asp_Write("") end if %>">
										                </TD>
										            </TR>
								                <TR>
								                    <TD  align=left>
								                        ���÷�������ַ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mybkmgcip" type="text" id="in_h_standbyaddr1_val" value="<%if tcWebApi_get("VoIPH248_Common", "SBMediaGatewayControler", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "SBMediaGatewayControler", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        ���÷������˿ں�
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mybkmgcport" type="text" id="in_h_standbynum1_val" onblur="checkPort(this)" value="<%if tcWebApi_get("VoIPH248_Common", "SBMediaGatewayControlerPort", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "SBMediaGatewayControlerPort", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        ��ʱ�˵�ǰ׺
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mgRTPPrefix" type="text" id="in_h_rtpprefix_val" value="<%if tcWebApi_get("VoIPH248_Common", "RTPPrefix", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "RTPPrefix", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								             		<TR>
								                    <TD  align=left>
								                        ��ʱ�˵��ʶ����
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mgEpTermIDLen" type="text" id="in_h_eptermidlen_val" value="<%if tcWebApi_get("VoIPH248_Common", "EphemeralTermIDAddLen", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "EphemeralTermIDAddLen", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        ��ʱ�˵���ʼֵ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mgEpTermIDStart" type="text" id="in_h_eptermidstart_val" value="<%if tcWebApi_get("VoIPH248_Common", "EphemeralTermIDStart", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "EphemeralTermIDStart", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        ��ʱ�˵���Ŀ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mgEpTermIDNum" type="text" id="in_h_eptermidnum_val" value="<%if tcWebApi_get("VoIPH248_Common", "EphemeralTermIDNum", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "EphemeralTermIDNum", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>								        
								                <TR>
								                    <TD  width="35%" align=left>
								                        ��ʱ�˵���뷽ʽ
								                    </TD>
								                    <TD  width="65%" colSpan=2 align=left>
								                  
										                        <select name="mgEpTermIDUniform" id="mg_uniform" >
						                                    <option value="0" <%if tcWebApi_get("VoIPH248_Common", "EphemeralTermIDUniform", "h") = "0" then asp_Write("selected") end if %>>���뷽ʽ</option>
						                                    <option value="1" <%if tcWebApi_get("VoIPH248_Common", "EphemeralTermIDUniform", "h") = "1" then asp_Write("selected") end if %>>�����뷽ʽ</option>             
						                                </select>
						                            
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        TOS/DSCP���ȼ�(����)
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mymgtos" type="text" id="in_h_tos1_val" value="<%if tcWebApi_get("VoIPH248_Common", "MegacoSignalDSCP", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "MegacoSignalDSCP", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  align=left>
								                        TOS/DSCP���ȼ�(RTP)
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="mymgtos2" type="text" id="in_h_tos2_val" value="<%if tcWebApi_get("VoIPH248_Common", "MegacoRTPDSCP", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "MegacoRTPDSCP", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR>
								                    <TD  width="35%" align=left>
								                        �ն����÷�ʽ
								                    </TD>
								                    <TD  width="65%" colSpan=2 align=left>
								                  
										                        <select name="termidMethod" id="termid_method" onchange="termidMethodSelectChange(this)">
						                                    <option value="0" <%if tcWebApi_get("VoIPH248_Common", "PhysicalTermIDConfigMethod", "h") = "0" then asp_Write("selected") end if %>>ͨ��ģʽ</option>
						                                    <option value="1" <%if tcWebApi_get("VoIPH248_Common", "PhysicalTermIDConfigMethod", "h") = "1" then asp_Write("selected") end if %>>��·ģʽ</option>             
						                                </select>
						                            
								                    </TD>
								                </TR>
								                <TR id="termidPrefix_table">
								                    <TD  align=left>
								                        �ն�ǰ׺
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="termidPrefix" type="text" id="in_h_termidPrefix_val" value="<%if tcWebApi_get("VoIPH248_Common", "PhysicalTermIDPrefix", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "PhysicalTermIDPrefix", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>
								                <TR id="termidStart_table">
								                    <TD  align=left>
								                        �ն���ʼֵ
								                    </TD>
								                    <TD  colSpan=2 align=left>
								                        <input name="termidStart" type="text" id="in_h_termidStart_val" value="<%if tcWebApi_get("VoIPH248_Common", "PhysicalTermIDStart", "h") <> "N/A" then tcWebAPI_get("VoIPH248_Common", "PhysicalTermIDStart", "s") else asp_Write("") end if %>">
								                    </TD>
								                </TR>								         
										          </TBODY>
										        </TABLE>
										        <TABLE border=0 cellSpacing=1 cellPadding=0 width="98%">
										        	<tr>
										        		<td height="5">
										        		</td>
										        	</tr>
										        	<tr>
							                    <td><div class="tableWrapper" id="perLineTablePlaceholder2" ></div></td>
							                </tr> 
							                <tr>
										        		<td height="5">
										        		</td>
										        	</tr>
										        	<tr>
					                        <td align="center">
					                          <input name="VoIP_h248_flag" type="hidden" value="0">
					                          <input name="bt_apply" type="button"  id="VoiceApplyButton"  value="Ӧ��" onClick="VoiceApplyBasic()">
					                        </td>
					                    </tr>
										        </TABLE>
										      </DIV>
                    </FORM>
                  </TD>
                </TR>
              </TBODY>
            </TABLE>
          </td>
  			</tbody>
  	</td>
  </tr>
      

 
  </TBODY></TABLE>
<!-- copyright bottom -->
<script language=JavaScript type=text/javascript>
printCopyRightBottom();
</script>
    </TBODY>
</TABLE>
</BODY>
</HTML>
