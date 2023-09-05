<%
if Request_Form("PortFilterType") <> "" then
	TCWebApi_set("WebCurSet_Entry","ipfilter_id","PortFilterType")
end if

if Request_Form("Save_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Entry","Interface","WanInterfaceFlag")	
	TCWebApi_set("IpMacFilter_Entry","Direction","Direction_Flag")
	TCWebApi_set("IpMacFilter_Entry","Active","EnableIP_Flag")
	TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
	TCWebApi_set("IpMacFilter_Entry","IPName","Name")
	TCWebApi_set("IpMacFilter_Entry","Protocol","Protocol")
	
	TCWebApi_set("IpMacFilter_Entry","SrcIPAddr","SourceIPStart")
	TCWebApi_set("IpMacFilter_Entry","SrcIPMask","SourceIpMask")
	TCWebApi_set("IpMacFilter_Entry","SrcPort","SourcePortStart")

	TCWebApi_set("IpMacFilter_Entry","DesIPAddr","DestIPStart")
	TCWebApi_set("IpMacFilter_Entry","DesIPMask","DestIpMask")
	TCWebApi_set("IpMacFilter_Entry","DesPort","DestPortStart")
	if TCWebApi_get("WebCustom_Entry","isCMCCSupported","h" ) = "Yes" then
		TCWebApi_set("IpMacFilter_Entry","SrcIPEndAddr","SourceIPEnd")
		TCWebApi_set("IpMacFilter_Entry","DesIPEndAddr","DestIPEnd")
		TCWebApi_set("IpMacFilter_Entry","SrcPortEnd","SourcePortEnd")
		TCWebApi_set("IpMacFilter_Entry","DesPortEnd","DestPortEnd")
	end if
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
	
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>端口过滤</TITLE>
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
<script language="JavaScript" type="text/javascript">
<% if Request_Form("Save_Flag") = "1" then %>
	location.replace("/cgi-bin/sec-portfilter.asp");
<%end if%>
</script> 	
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
			智能组网终端
		</span>
	</div>
	<div class="in_welcom" >
		<span>您好！</span>
		<a onclick="top.location.href='/'">
		<span>返回主页</span>
		</a>
		<input id="Selected_Menu" type="hidden" value="安全->端口过滤" name="Selected_Menu">
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
                   <li class="TSD">端口过滤</li>
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
            				<FORM name="ConfigForm" id="ConfigForm" action="/cgi-bin/sec-addportfilter.asp" method="post">
            				                      <input type="hidden" name="PortFilterType">
                      <input type="hidden" name="IpMacType_Flag" value="IpUp">
                      <input type="hidden" name="Save_Flag" value="0">
                      <input type="hidden" name="curNum" value="<% tcWebApi_get("WebCurSet_Entry","ipfilter_id","s") %>">
                      <input type="hidden" name="Direction_Flag" value="<% tcWebApi_get("IpMacFilter_Entry","Direction","s") %>">
                      <input type="hidden" name="EnableIP_Flag" value="Yes">
                      <input type="hidden" name="RuleType_Flag" value="IP">
                      <input type="hidden" name="Current_Flag" value="0">
                      <input type="hidden" name="WanInterfaceFlag" value="br0">
                      <input type="hidden" name="IpType_Flag" value="IpUp">
                      <input type="hidden" name="Actionflag" value="Add">
                      <script language="JavaScript" type="text/javascript">
var DomainName = document.ConfigForm.curNum.value;
/*if (top.preAddDomain != '')
{
DomainName = top.preAddDomain;
top.preAddDomain = '';
}
else
{
DomainName = 'InternetGatewayDevice.X_ATP_Security.IpFilterOut';
}*/
function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,CntStatus,IPv6Enabled)
{
this.domain = domain;
this.Name = Name;
this.Enable = Enable;
this.NATEnabled = NATEnabled;
this.ConnectionType = ConnectionType;
this.CntStatus = CntStatus;
this.IPv6Enabled = IPv6Enabled;
}
var WanIP  = new Array(new stWanInfo("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1","1_TR069_R_8_46","1","0","IP_Routed","PendingDisconnect","0"),null);
var WanPPP = new Array(null);
var WanInfo = new Array();
var i;
for (i = 0; i < WanIP.length-1; i++)
{
WanInfo[i] = WanIP[i];
}
for (j = 0; j < WanPPP.length-1; i++,j++)
{
WanInfo[i] =  WanPPP[j];
}
var FliterType;
if (DomainName <= 79)
{
	FliterType = 'out';//up filter
}
else
{
	FliterType = 'in';//down filter
}
function LoadFrame()
{
	var typeFLAG = GetQueryString('typeFlag');
	document.ConfigForm.Save_Flag.value = "0";
	if (FliterType== "out")
	{
		document.ConfigForm.Current_Flag.value = "out";
		setDisplay('interface',0);
		ChangeInface();		
	}
	else if (FliterType== "in")
	{
		document.ConfigForm.Current_Flag.value = "in";
		setDisplay('interface',1);
		ChangeInface();
	}
	if ( typeFLAG )
		document.ConfigForm.IpMacType_Flag.value = typeFLAG;
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function checkForm()
{
	//var	IPNames = new Array(8);
	var vnumber = 0;
	/*IPNames[0] = "<% tcWebApi_get("IpMacFilter_Entry0","IPName","s") %>";
	IPNames[1] = "<% tcWebApi_get("IpMacFilter_Entry1","IPName","s") %>";
	IPNames[2] = "<% tcWebApi_get("IpMacFilter_Entry2","IPName","s") %>";
	IPNames[3] = "<% tcWebApi_get("IpMacFilter_Entry3","IPName","s") %>";
	IPNames[4] = "<% tcWebApi_get("IpMacFilter_Entry4","IPName","s") %>";
	IPNames[5] = "<% tcWebApi_get("IpMacFilter_Entry5","IPName","s") %>";
	IPNames[6] = "<% tcWebApi_get("IpMacFilter_Entry6","IPName","s") %>";
	IPNames[7] = "<% tcWebApi_get("IpMacFilter_Entry7","IPName","s") %>";*/
	
	if(document.ConfigForm.Current_Flag.value == "out")
	{
		/*
		if(parseInt(vnumber)>=40)
		{
			alert("过滤规则数达到上限！");
			return false;	
		}

		if (document.ConfigForm.Name.value == IPNames[0] || document.ConfigForm.Name.value == IPNames[1] || document.ConfigForm.Name.value == IPNames[2] || document.ConfigForm.Name.value == IPNames[3] )
		{
			 alert("过滤名称不能重复！");
			 return false;			 	
		}*/
		
		if (document.ConfigForm.Protocol.value == "" && document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value == "" && document.ConfigForm.SourcePortStart.value == "" &&
			document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIpMask.value == "" && document.ConfigForm.DestPortStart.value == "")
		{
			 alert("过滤规则至少要配置一项参数！");
			 return false;			 	
		}
	}
		
	if(document.ConfigForm.Current_Flag.value == "in")
	{
		/*
		if(parseInt(vnumber)>=40)
		{
			alert("过滤规则数达到上限！");
			return false;		
		}
	
		if (document.ConfigForm.Name.value == IPNames[4] || document.ConfigForm.Name.value == IPNames[5] || document.ConfigForm.Name.value == IPNames[6] || document.ConfigForm.Name.value == IPNames[7] )
		{
			 alert("过滤名称不能重复！");
			 return false;			 	
		}*/
		
		if (document.ConfigForm.Protocol.value == "" && document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value == "" && document.ConfigForm.SourcePortStart.value == "" &&
			document.ConfigForm.DestPortStart.value == "")
		{
			 alert("过滤规则至少要配置除目的地址外的其他参数！");
			 return false;			 	
		}
		
		if (document.ConfigForm.WanPath.value.length == 0)
		{
			alert('当前没有可使用的WAN连接！');
			return false;
		}	
	}
	
	if (document.ConfigForm.Name.value == '' || document.ConfigForm.Name.value.length > 31 	)
	{
		alert("过滤名称不正确");
		return false;
	}
	if (isValidName(document.ConfigForm.Name.value) == false)
	{
		alert("过滤名称不正确");
		return false;
	}
	
	if (document.ConfigForm.SourceIPStart.value != ""  && document.ConfigForm.SourceIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.SourceIPStart.value) == false))
	{
		//if (isGlobalIpv6Address(document.ConfigForm.SourceIPStart.value) == false)
		{
			alert('IPv4源起始地址 "' + document.ConfigForm.SourceIPStart.value + '" 不正确');
			return false;
		}
	}
<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>	
	if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIPEnd.value != "" )
	{
		msg = 'IPv4结束源地址不为空时，必须配置IPv4源起始地址';
		alert(msg);
		return false;
	}
	if (document.ConfigForm.SourceIPEnd.value != ""  && document.ConfigForm.SourceIPEnd.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.SourceIPEnd.value) == false))
	{
		//if (isGlobalIpv6Address(document.ConfigForm.SourceIPEnd.value) == false)
		{
			alert('IPv4源结束地址 "' + document.ConfigForm.SourceIPEnd.value + '" 不正确');
			return false;
		}
	}
<% end if %>	
	if (document.ConfigForm.SourceIpMask.value != "" && document.ConfigForm.SourceIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.SourceIpMask.value) == false))
	{
			alert('IPv4源子网掩码"' + document.ConfigForm.SourceIpMask.value + '" 不正确');
			return false;
	}
	
	if (document.ConfigForm.DestIPStart.value != ""  && document.ConfigForm.DestIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.DestIPStart.value) == false))
	{
		//if (isGlobalIpv6Address(document.ConfigForm.DestIPStart.value) == false)
		{
			alert('IPv4目的起始地址 "' + document.ConfigForm.DestIPStart.value + '" 不正确');
			return false;
		}
	}
<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>	
	if (document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIPEnd.value != "" )
	{
		msg = 'IPv4目的结束地址不为空时，必须配置IPv4目的起始地址';
		alert(msg);
		return false;
	}
	if (document.ConfigForm.DestIPEnd.value != ""  && document.ConfigForm.DestIPEnd.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.DestIPEnd.value) == false))
	{
		//if (isGlobalIpv6Address(document.ConfigForm.DestIPEnd.value) == false)
		{
			alert('IPv4目的结束地址 "' + document.ConfigForm.DestIPEnd.value + '" 不正确');
			return false;
		}
	}
<% end if %>		
	if (document.ConfigForm.DestIpMask.value != "" && document.ConfigForm.DestIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.DestIpMask.value) == false))
	{
		alert('IPv4目的子网掩码"' + document.ConfigForm.DestIpMask.value + '" 不正确');
		return false;
	}
	
	if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value != "" )
	{
		msg = 'IPv4源子网掩码不为空时，必须配置IPv4源地址';
		alert(msg);
		return false;
	}
	
	if (document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIpMask.value != "" )
	{
		msg = 'IPv4目的子网掩码不为空时，必须配置IPv4目的地址';
		alert(msg);
		return false;
	}
	
	if (document.ConfigForm.SourcePortStart.value != "" || document.ConfigForm.DestPortStart.value != "")
	{
			//if (document.ConfigForm.Protocol.selectedIndex == 0 || document.ConfigForm.Protocol.selectedIndex == 4)
			if (document.ConfigForm.Protocol.selectedIndex == 3)
			{		
				msg = '只有TCP或UDP协议才能设置端口';
				alert(msg);
				return false;
			}
	}
	
	if (document.ConfigForm.SourcePortStart.value != "" && document.ConfigForm.SourcePortStart.value != "0" && isValidPort(document.ConfigForm.SourcePortStart.value) == false )
	{
		msg = '源端口 "' + document.ConfigForm.SourcePortStart.value + '" 不正确';
		alert(msg);
		return false;
	}
<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>	
	if (document.ConfigForm.SourcePortStart.value == "" && document.ConfigForm.SourcePortEnd.value != "" )
	{
		msg = '结束源端口不为空时，必须配置起始源端口';
		alert(msg);
		return false;
	}
	if (document.ConfigForm.SourcePortEnd.value != "" && document.ConfigForm.SourcePortEnd.value != "0" && isValidPort(document.ConfigForm.SourcePortEnd.value) == false )
	{
		msg = '结束源端口 "' + document.ConfigForm.SourcePortEnd.value + '" 不正确';
		alert(msg);
		return false;
	}
	if(document.ConfigForm.SourcePortStart.value != "" && document.ConfigForm.SourcePortEnd.value != "" && parseInt(document.ConfigForm.SourcePortEnd.value) < parseInt(document.ConfigForm.SourcePortStart.value)){
		msg = '结束源端口不能小于起始端口';
		alert(msg);
		return false;		
	}
<% end if %>
	if (document.ConfigForm.DestPortStart.value != "" && document.ConfigForm.DestPortStart.value != "0" && isValidPort(document.ConfigForm.DestPortStart.value) == false )
	{
		msg = '目的端口 "' + document.ConfigForm.DestPortStart.value + '" 不正确';
		alert(msg);
		return false;
	}
<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>	
	if (document.ConfigForm.DestPortStart.value == "" && document.ConfigForm.DestPortEnd.value != "" )
	{
		msg = '结束目的端口不为空时，必须配置起始目的端口';
		alert(msg);
		return false;
	}
	if (document.ConfigForm.DestPortEnd.value != "" && document.ConfigForm.DestPortEnd.value != "0" && isValidPort(document.ConfigForm.DestPortEnd.value) == false )
	{
		msg = '结束目的端口 "' + document.ConfigForm.DestPortEnd.value + '" 不正确';
		alert(msg);
		return false;
	}
	if(document.ConfigForm.DestPortStart.value != "" && document.ConfigForm.DestPortEnd.value != "" && parseInt(document.ConfigForm.DestPortEnd.value) < parseInt(document.ConfigForm.DestPortStart.value)){
		msg = '结束目的端口不能小于起始端口';
		alert(msg);
		return false;		
	}
<% end if %>
	if(document.ConfigForm.Current_Flag.value == "in")
	{
      	var portInvalue = '<% tcWebApi_JsonHook("get_portfilterIn_info", "action", "area") %>'
		var rsp = JSON.parse(portInvalue);
		var portIn_list = rsp.data;
		for(var i=0;i<portIn_list.length;i++)
		{
			/*
			if (document.ConfigForm.Name.value == portFilterIn[i].IPName)
			{
				alert("相同的过滤名称已存在！");
				return false;
			}*/
			if (document.ConfigForm.Protocol.value == portIn_list[i]['Protocol'] &&
			document.ConfigForm.SourceIPStart.value == portIn_list[i]['SrcIPAddr'] &&
			document.ConfigForm.SourceIpMask.value == portIn_list[i]['SrcIPMask'] &&
			document.ConfigForm.SourcePortStart.value == portIn_list[i]['SrcPort'] &&
			document.ConfigForm.DestIPStart.value == portIn_list[i]['DesIPAddr'] &&
			document.ConfigForm.DestIpMask.value == portIn_list[i]['DesIPMask'] &&
			document.ConfigForm.DestPortStart.value == portIn_list[i]['DesPort'] &&
			document.ConfigForm.WanPath.value == portIn_list[i]['Interface'])
			{
				alert("相同的过滤规则已存在！");
				return false;
			}
		}
	}
	else	//out
	{
      	var portOutvalue = '<% tcWebApi_JsonHook("get_portfilterOut_info", "action", "area") %>'
		var rsp = JSON.parse(portOutvalue);
		var portOut_list = rsp.data;
		for(var i=0;i<portOut_list.length;i++)
		{
			/*
			if (document.ConfigForm.Name.value == portFilterOut[i].IPName)
			{
				alert("相同的过滤名称已存在！");
				return false;
			}*/
			if (document.ConfigForm.Protocol.value == portOut_list[i]['Protocol'] &&
			document.ConfigForm.SourceIPStart.value == portOut_list[i]['SrcIPAddr'] &&
			document.ConfigForm.SourceIpMask.value == portOut_list[i]['SrcIPMask'] &&
			document.ConfigForm.SourcePortStart.value == portOut_list[i]['SrcPort'] &&
			document.ConfigForm.DestIPStart.value == portOut_list[i]['DesIPAddr'] &&
			document.ConfigForm.DestIpMask.value == portOut_list[i]['DesIPMask'] &&
			document.ConfigForm.DestPortStart.value == portOut_list[i]['DesPort'])		
			{
				alert("相同的过滤规则已存在！");
				return false;
			}
		}
	}
	
	return true;
}

function btnSaveIP()
{
	var Form = document.ConfigForm;	

	if (checkForm() != false)
	{
		if(Form.Current_Flag.value == "in")
		{
		Form.curNum.value = "<% tcWebApi_get("IpMacFilter","add_ipdownnum","s") %>";
		Form.IpType_Flag.value = "IpDown";
		Form.Direction_Flag.value = "Incoming";
		Form.WanInterfaceFlag.value =  Form.WanPath.value;
		}
		else
		{
		Form.curNum.value = "<% tcWebApi_get("IpMacFilter","add_ipupnum","s") %>";
		Form.Direction_Flag.value = "Outgoing";
		Form.IpType_Flag.value = "IpUp";
		//Form.WanInterfaceFlag.value =  Form.WanPath.value;		
		}
		Form.Save_Flag.value = "1";
		Form.submit();
	}
}
function Cancel()
{
	location.replace('/cgi-bin/sec-portfilter.asp');
}
</script>
                      <script language="JavaScript" type="text/JavaScript">
var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var vEntryName = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var vEntryValue = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var WANEnNAT = vArrayStr.split(',');

		vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );

		vEntryValue = SortUtil.SortMyArray( vEntryValue );
		WANEnNAT = SortUtil.SortMyArray( WANEnNAT );

function ChangeInface()
{
	var index = getElById('WanPath').selectedIndex;
	if (index > -1)
	{
		for (i = 0; i < WANEnNAT.length-1; i++)
		{
			if (vEntryValue[i] == getSelectVal('WanPath'))
			{
				break;
			}
		}
		if (WANEnNAT[i] == "Disabled")
		{
			getElById('NatState').innerHTML = '禁用';
		}
		else
		{
			getElById('NatState').innerHTML = '启用';
		}
	}
}
</script>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
    <TBODY>
        <TR>
            <TD>
                <div class="advanceTitle">添加端口过滤规则</div>
            </TD>
        </TR>
        <TR>
            <TD>
                <div class="title-line"></div>
            </TD>
        </TR>
<TR>
				              <TR>
				              	<TD> <table border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td><div class="form-text">过滤规则名称</div></td>
                        <td><input type='text' size="18" name="Name" maxLength=31></td>
                      </tr>
                      <tr style="display:none"> 
                        <td><div class="form-text">使能</div></td>
                        <td> <input type='checkbox' size="18" name="Enable" checked maxLength=16></td>
                      </tr>
                      <tr> 
                        <td><div class="form-text">协议</div></td>
                        <td><select name='Protocol' size="1">
                            <!-- <option value="">  -->
                            <option value="TCP/UDP">TCP/UDP 
                            <option value="TCP">TCP 
                            <option value="UDP">UDP 
                            <option value="ICMP">ICMP </select></td>
                      </tr>
                      <tr> 
                        <td><div class="form-text">源IPv4地址</div></td>
                        <td><input type='text' size="20" name="SourceIPStart" maxLength=15></td>
                      </tr>
                      <tr <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>style="display:none"<% end if %>> 
                        <td><div class="form-text">源子网掩码</div></td>
                        <td><input type='text' size="20" name="SourceIpMask" maxLength=15></td>
                      </tr>
                      <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>
                      <tr> 
                        <td><div class="form-text">结束源IPv4地址</div></td>
                        <td><input type='text' size="20" name="SourceIPEnd" maxLength=15></td>
                      </tr>                      
                      <% end if %>
                      <tr> 
                        <td><div class="form-text">源端口</div></td>
                        <td> <input type='text' size="20" name="SourcePortStart" maxLength=11></td>
                      </tr>
                      <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>
                      <tr> 
                        <td><div class="form-text">结束源端口</div></td>
                        <td><input type='text' size="20" name="SourcePortEnd" maxLength=15></td>
                      </tr>                      
                      <% end if %>
                      <tr> 
                        <td><div class="form-text">目的IPv4地址</div></td>
                        <td> <input type='text' size="20" name="DestIPStart" maxLength=15></td>
                      </tr>
                      <tr <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>style="display:none"<% end if %>> 
                        <td><div class="form-text">目的子网掩码</div></td>
                        <td><input type='text' size="20" name="DestIpMask" maxLength=15></td>
                      </tr>
                      <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>
                      <tr> 
                        <td><div class="form-text">结束目的IPv4地址</div></td>
                        <td><input type='text' size="20" name="DestIPEnd" maxLength=15></td>
                      </tr>                      
                      <% end if %>
                      <tr> 
                        <td><div class="form-text">目的端口</div></td>
                        <td><input type='text' size="20" name="DestPortStart" maxLength=11></td>
                      </tr>
                      <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") = "Yes" then %>
                      <tr> 
                        <td><div class="form-text">结束目的端口</div></td>
                        <td><input type='text' size="20" name="DestPortEnd" maxLength=15></td>
                      </tr>                      
                      <% end if %>
                    </table>
                    <div id='interface' style="display:none;"> 
                      <table width="400"  border="0" cellpadding="0" cellspacing="0">
                        <tr> 
                          <td width="79"><div class="form-text">接口</div></td>
                          <td width="321"> <select name="WanPath" size="1" onChange="ChangeInface()">
                              <script language="JavaScript" type="text/javascript">
							for (i = 0; i < nEntryNum; i++)
							{
								document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
							}
							  
							</script>
                            </select></td>
                        </tr>
                        <tr> 
                          <td  width="79" height="23"><div class="form-text">NAT状态</div></td>
                          <td><div id="NatState">&nbsp;</div></td>
                        </tr>
                      </table>
                    </div>
                    </form>
                            </td>
              </tr>
              <tr>
                <td>
                    <P style="margin: 32px 0 0 182px;">
                        <input type="button" id="btnOK" onclick="btnSaveIP()" value="确 定">
                        <input type="button" id="btnCancel" style="margin-left: 24px;" name="btnCancel" onclick="Cancel()" value="返 回"> 
                    </p>
                  </td>
              </tr>
            </table>
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
