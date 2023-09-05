<%		  
if Request_Form("alg_Flag") = "1" then
	TCWebApi_set("ALGSwitch_Entry","L2TPSW","L2TPSW_Flag")
	TCWebApi_set("ALGSwitch_Entry","IPSECSW","IPSecSW_Flag")
	TCWebApi_set("ALGSwitch_Entry","H323SW","H323SW_Flag")
	TCWebApi_set("ALGSwitch_Entry","RTSPSW","RTSPSW_Flag")
	TCWebApi_set("ALGSwitch_Entry","SIPSW","SIPSW_Flag")	
	TCWebApi_set("ALGSwitch_Entry","FTPSW","FTPSW_Flag")
	TCWebApi_set("ALGSwitch_Entry","PPTPSW","PPTPSW_Flag")
	TCWebApi_commit("ALGSwitch_Entry")	
	tcWebApi_save()
end if

if Request_Form("DMZ_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","DMZEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","dmz_ifidx","DMZEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_set("Dmz_Entry","IFName","DMZInterface")
	TCWebApi_set("Dmz_Entry","Active","EnableDMZ_Flag")
	
	if Request_Form("isAutoDMZSupported") = "1" then
		TCWebApi_set("Dmz_Common","UpdateDMZ_Active","AutoDMZ_Flag")
		TCWebApi_set("Dmz_Entry","AutoDMZ_Flag","AutoDMZ_Flag")
	end if
	
	TCWebApi_set("Dmz_Entry","DMZ_IP","DMZHostIPAddress")
	TCWebApi_commit("Dmz_Entry")
	tcWebApi_save()
end if

if Request_Form("VirServer_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","virServ_id","VirServCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_set("VirServer_Entry","IFName","PortMappingInterface")
	TCWebApi_unset("VirServer_Entry_Entry")
	TCWebApi_commit("VirServer_Entry_Entry")	
	TCWebApi_set("VirServer_Entry_Entry","Active","EnableVirServer_Flag")
	TCWebApi_set("VirServer_Entry_Entry","Protocal","PortMappingProtocol")
	TCWebApi_set("VirServer_Entry_Entry","SrcIP","RemoteHost")
	TCWebApi_set("VirServer_Entry_Entry","STARTPORT","ExternalPort")
	TCWebApi_set("VirServer_Entry_Entry","ENDPORT","InternalPort")
	TCWebApi_set("VirServer_Entry_Entry","LOCALIP","InternalClient")
	TCWebApi_set("VirServer_Entry_Entry","MapName","PortMappingDescription")	
	TCWebApi_commit("VirServer_Entry_Entry")
	tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "2" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")	
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	if Request_Form("hVirServEntry0") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry1") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
			TCWebApi_unset("VirServer_Entry_Entry")	
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry2") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")	
	end if
	if Request_Form("hVirServEntry3") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry4") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry5") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry6") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry7") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if	
	if Request_Form("hVirServEntry8") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
			TCWebApi_unset("VirServer_Entry_Entry")	
			TCWebApi_commit("VirServer_Entry_Entry")
	end if	
	if Request_Form("hVirServEntry9") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if											
	tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "3" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>高级NAT配置</TITLE>
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
		<input id="Selected_Menu" type="hidden" value="应用->高级NAT配置" name="Selected_Menu">
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
	var VirServEntryIndex = 0;
	var VirSerIdleEntryIndex = 0;
	var VirSerIdleFlag = 0;
	var WanInfo = new Array();
	var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryName = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryValue = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vEntryIndex = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vActive = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var vNATENABLE = vArrayStr.split(',');
	
	//sort
	vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
	vEntryValue = SortUtil.SortMyArray( vEntryValue );
	vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
	vActive = SortUtil.SortMyArray( vActive );
	vNATENABLE = SortUtil.SortMyArray( vNATENABLE );
	
	nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
	var vDMZActive = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
	var vDMZIP = vArrayStr.split(',');
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","AutoDMZ_Flag","s") %>";
	var vDMZAuto = vArrayStr.split(',');
	
	//sort
	vDMZActive = SortUtil.SortMyArray( vDMZActive );
	vDMZIP = SortUtil.SortMyArray( vDMZIP );
	vDMZAuto = SortUtil.SortMyArray( vDMZAuto );
		
	for (i = 0; i < nEntryNum; i++)
	{
		WanInfo[i] = new stWanInfo(vEntryValue[i],vEntryName[i],vActive[i],vNATENABLE[i],vEntryName[i],vEntryName[i],vDMZActive[i],vDMZIP[i],vDMZAuto[i]);
	}
	
function stAlg(domain,L2TPEnable,IPSECEnable,H323Enable,RTSPEnable,SIPEnable,FTPEnable,PPTPEnable)
{
	this.domain = domain;
	if(L2TPEnable == "on")
		this.L2TPEnable = 1;
	else
		this.L2TPEnable = 0;
	if(IPSECEnable == "on")
		this.IPSECEnable = 1;
	else
		this.IPSECEnable = 0;
	if(H323Enable == "on")
		this.H323Enable = 1;
	else
		this.H323Enable = 0;
	if(RTSPEnable == "on")
		this.RTSPEnable = 1;
	else
		this.RTSPEnable = 0;
	if(SIPEnable == "on")
		this.SIPEnable = 1;
	else
		this.SIPEnable = 0;
	if(FTPEnable == "on")
		this.FTPEnable = 1;
	else
		this.FTPEnable = 0;	
	if(PPTPEnable == "on")
		this.PPTPEnable = 1;
	else
		this.PPTPEnable = 0;	
}
var algArray = 
new Array
(
	new stAlg("domain","<% tcWebApi_get("ALGSwitch_Entry","L2TPSW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","IPSECSW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","H323SW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","RTSPSW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","SIPSW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","FTPSW","s") %>","<% tcWebApi_get("ALGSwitch_Entry","PPTPSW","s") %>"),
	null
);
var alg = algArray[0];
var WanIndex = -1;
function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,ServiceList,DMZEnable,DMZIP,DMZAuto)
{
	this.domain = domain;
	this.key = this.domain;
	this.Name = Name;
	this.ConnectionType = ConnectionType;
	this.ServiceList = ServiceList;
	if(DMZAuto == "1")
		this.AutoDMZ_Flag = 1;
	else
		this.AutoDMZ_Flag = 0;
	if(DMZEnable == "Yes")
		this.DMZEnable = 1;
	else
		this.DMZEnable = 0;
	this.DMZIP = DMZIP;
	if(Enable == "Yes")
		this.Enable = 1;
	else
		this.Enable = 0;
	if(NATEnabled == "Enable")
		this.NATEnabled = 1;
	else
		this.NATEnabled = 0;		
	this.CntStatus = '';
}

function stPortMap(domain,ProtMapEnabled,Protocol,RemoteHost,ExPort,InPort,InClient,Description)
{
	domain = ""+domain;	
	this.domain = domain;
	this.key = this.domain;
	this.ProtMapEnabled = ProtMapEnabled;
	this.Protocol = Protocol;
	this.RemoteHost = RemoteHost;
	this.ExPort = ExPort;
	this.InPort = InPort;
	this.InClient = InClient;
	this.Description = Description;
	var index = domain.lastIndexOf('PortMapping');
	this.interface = domain.substr(0,index - 1);
	this.interface = domain;
	this.NATEnabled = '';
	this.Enable = '';
}

var PortMapping = new Array();
var indexPortMapping = 0;
var MAX_VIRSERVER_NUM = 10;

nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatActive = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatProtocal = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatSrcIP = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatSTARTPORT = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatENDPORT = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatLOCALIP = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatMapName = vArrayStr.split(',');

for (j = 0; j < MAX_VIRSERVER_NUM; j++)
{
	if(vNatActive[j] == "Yes" || vNatActive[j] == "No")
	{
		PortMapping[indexPortMapping] = new stPortMap(j,vNatActive[j],vNatProtocal[j],vNatSrcIP[j],vNatSTARTPORT[j],vNatENDPORT[j],vNatLOCALIP[j],vNatMapName[j]);
		indexPortMapping++;
	}
	else if(0 == VirSerIdleFlag){
		VirSerIdleEntryIndex = j;
		VirSerIdleFlag = 1;
	}
}

function hidesipPortInfo(hide)
{
	var status = 'visible';
	if ( hide == 1 )
	status = 'hidden';
	if (document.getElementById)  
	{
		document.getElementById('sipproxyport').style.visibility = status;
	}
	else
	{
		if (document.layers == false) 
		getElement('sipproxyport').style.visibility = status;
	}
}
function hideSiproxdInfo(hide) {
	var status = 'visible';
	if ( hide == 1 )
	status = 'hidden';
	if (document.getElementById)  
	{
		document.getElementById('sipproxdInfo').style.visibility = status;
		document.getElementById('applybutton').style.visibility = status;
	}
	else {
		if (document.layers) { 
			if ( hide == 1 )
				form1.Siproxd.value = '';
			else
				form1.Siproxd.value = enblSiproxd;
		}
		else  
		{
			getElement('sipproxdInfo').style.visibility = status;
			getElement('applybutton').style.visibility = status;
		}
	}
}
function dmzClick()
{
	if(getCheckVal('DMZEnable') == 0)
	{
		setText('DMZHostIPAddress', "");
		<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
		setCheck('AutoDMZEnable',0);
		document.dmzForm.AutoDMZEnable.disabled = true;
		<%End If%>
		document.dmzForm.DMZHostIPAddress.disabled = true;
	}
	else
	{	
		<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
		document.dmzForm.AutoDMZEnable.disabled = false;
		<%End If%>
		document.dmzForm.DMZHostIPAddress.value = vDMZIP[0] === 'N/A' ? '' : vDMZIP[0];
		document.dmzForm.DMZHostIPAddress.disabled = false;
	}
}
function AutodmzClick()
{
	if(getCheckVal('AutoDMZEnable') == 0)
	{
		document.dmzForm.DMZHostIPAddress.disabled = false;
	}
	else
	{
		document.dmzForm.DMZHostIPAddress.disabled = true;
	}
}

function isOptionValid(portValue)
{
	if(isPlusInteger(portValue) == false)
	{
		alert('端口不正确');
		return false;
	}
	if(isValidPort(portValue) == false)
	{
		alert('端口不正确');
		return false;
	}
	return true;
}
function CheckForm(type)
{
	switch (type)
	{
	case 1:
		break;
	case 2:
		return CheckDMZ();
		break;
	case 3:
		return CheckPortMapping();
		break;
	case 4:
		with(getElById('PortMappingForm'))
		{
			var rml = getElById('rml');
			if (rml == null)
			{
				return false;
			}
		}
	}
	return true;
}
function CheckAlg()
{
	for (var i = 0; i < WanInfo.length; i++)
	{
		if (getSelectVal('SIPWanPath') == WanInfo[i].key)
		{
			break;
		}
	}
	if (isOptionValid(getValue('SIPPort')) == false)
	{
		alert('SIP端口不正确！');
		return false;
	}
	if (getCheckVal('SIPEnable') == 1 && WanIndex > -1)
	{
		if (WanInfo[WanIndex].NATEnabled == 0 
		|| WanInfo[WanIndex].ConnectionType.indexOf('_B_')>-1)		
		{
			confirm('注意：该条WAN连接已失效，修改SIP配置并不能生效，你是否确认要修改该配置?', function(ret){
				return ret;
			});
		}else{
			return true;
		}
	}else{
		return true;
	}
}
function CheckDMZ()
{
	var i = 0;
	var bWANinterface = false;
	for (i = 0; i < WanInfo.length; i++)
	{
		if((WanInfo[i].ServiceList.indexOf('_TR069_')<0) || (WanInfo[i].ServiceList.indexOf('_INTERNET_')>-1))
		{
			bWANinterface = true;
		}
	}
	if (bWANinterface == false)
	{
		alert('当前无可用的WAN连接，请添加WAN连接后再进行配置！');
		return false;
	}
	with (getElById('dmzForm'))
	{
		<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
		if (getCheckVal('AutoDMZEnable') == 1)
			return true;
		<%End If%>
		if (getCheckVal('DMZEnable') == 1)
		{
			if (getValue('DMZHostIPAddress') == "")
			{
				alert('请输入DMZ地址。');
				return false;
			}
			else if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
			||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
			{
				alert('DMZ地址不正确。');
				return false;
			}
		}
		else if (getCheckVal('DMZEnable') == 0 && getValue('DMZHostIPAddress') != "")
		{
			if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
			||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
			{
				alert('DMZ地址不正确。');
				return false;
			}
		}
	}
	return true;
}
function CheckPortMapping()
{
	if(VirServEntryIndex >= 10)
	{
		alert('每个接口上最大可存储10条虚拟主机规则!')
		return false;
	}
	if(PortMapping.length >= 32)
	{
		alert('最大可存储32条虚拟主机规则!')
		return false;
	}
	if (WanInfo.length == 0)
	{
		alert('当前无可用的WAN连接，请添加WAN连接后再进行配置！');
		return false;
	}
	with (getElById('PortMappingForm') )
	{
		if (RemoteHost.value != "")
		{
			if (isValidIpAddress(RemoteHost.value) == false)
			{
				alert('源IP地址格式不正确！');
				return false;
			}
			else if ((isLoopIpAddress(getValue('RemoteHost'))==true)||(isBroadcastIpAddress(getValue('RemoteHost'))==true)
			||(isNtwkSgmtIpAddress(getValue('RemoteHost'))==true))
			{
				alert('源IP地址不正确！');
				return false;
			}
		}
		if (ExternalPort.value == "")
		{
			alert('开始端口号不正确。' );
			return false;
		}
		if (InternalPort.value == "")
		{
			alert('结束端口号不正确。' );
			return false;
		}
		if (InternalClient.value == "")
		{

		}
		else if(isAbcIpAddress(InternalClient.value) == false ||(isBroadcastIpAddress(getValue('InternalClient'))==true)
		||(isNtwkSgmtIpAddress(getValue('InternalClient'))==true)){
			alert('主机地址不正确。' );
			return false;
		}
		if (PortMappingDescription.value == "")
		{
			alert('规则名称不正确，请重新输入!' );
			return false;
		}
		if (isValidPort(ExternalPort.value) == false )
		{
			alert('开始端口号不正确。' );
			return false;
		}
		if (isValidPort(InternalPort.value) == false )
		{
			alert('结束端口号不正确。' );
			return false;
		}
		if (isValidName(PortMappingDescription.value) == false)
		{
			alert('名字不正确。');
			return false;
		}
		if (ExternalPort.value > InternalPort.value)
		{
			alert('结束端口号须大于或等于开始端口号。');
			return false;		
		}
		for (i = 0; i < PortMapping.length; i++)
		{
			if (PortMapping[i].Description == PortMappingDescription.value)
			{
				alert('此规则名称已被使用。');
				return false;
			}
			if (PortMapping[i].Protocol == PortMappingProtocol.value
			&& PortMapping[i].ExPort == ExternalPort.value
			&& PortMapping[i].InPort == InternalPort.value
			&& PortMapping[i].RemoteHost == RemoteHost.value
			&& PortMapping[i].InClient == InternalClient.value)
			{
				alert('已存在相同规则！');
				return false;
			}
			if (!((PortMapping[i].Protocol == 'TCP'&& PortMappingProtocol.value == 'UDP')
			||(PortMapping[i].Protocol == 'UDP'&& PortMappingProtocol.value == 'TCP'))
			&&PortMapping[i].RemoteHost == RemoteHost.value
			&&(ExternalPort.value <= PortMapping[i].InPort && InternalPort.value >= PortMapping[i].ExPort)
			)
			{
				alert('与之前规则存在端口重复部分！');
				return false;			
			}			
		}
		/*
		if ( "21" == getValue("ExternalPort"))
		{
			return confirm('警告:如果网关当前FTP服务端口为(21)，配置该端口映射规则将改变网关的FTP服务端口为(2121),您确认要添加?');
		}
		else if ( "23" == getValue("ExternalPort") )
		{
			return confirm('警告:如果网关当前TELNET服务端口为(23)，配置该端口映射规则可能会改变网关的TELNET端口为(2323),您确认要添加?');
		}
		else if ( "80" == getValue("ExternalPort") )
		{
			return confirm('警告:如果网关当前HTTP服务端口为(80). 配置该端口映射规则可能会改变网关的web端口为8080,您确认要添加?');
		}
		*/
	}
	return true;
}
function RemovePortMapping(Form, CheckTag)
{
	var rml = getElById(CheckTag);
	var i;
	if (rml.length > 0)
	{
		for (i = 0; i < rml.length; i++)
		{
			if (rml[i].checked == true)
			{
				//Form.addParameter(rml[i].value,'');
				var ctlName = "hVirServEntry"+i;
				setText(ctlName,rml[i].value);
			}
		}
	}
	else if (rml.checked == true)
	{
		//Form.addParameter(rml.value,'');
		var ctlName = "hVirServEntry0";
		setText(ctlName,rml.value);		
	}
}
function LoadFrame()
{
	setCheck('L2TPEnable',alg.L2TPEnable);
	setCheck('IPSECEnable',alg.IPSECEnable);
	setCheck('H323Enable',alg.H323Enable);
	setCheck('RTSPEnable',alg.RTSPEnable);
	setCheck('SIPEnable',alg.SIPEnable);
	setCheck('FTPEnable',alg.FTPEnable);
	setCheck('PPTPEnable',alg.PPTPEnable);
	ShowDMZ();

    if(alg.L2TPEnable && alg.IPSECEnable && alg.H323Enable &&
     alg.RTSPEnable && alg.SIPEnable && alg.FTPEnable && alg.PPTPEnable)
        setCheck('Enable',1);
	else
        setCheck('Enable',0);

	setSelect('PortMappingInterface',getEntryValue(<% tcWebApi_get("WebCurSet_Entry","nat_ifidx","s") %>));
	if(document.ConfigForm.isVirServerSupported.value == 1){	
		ShowPortMapping();
	}
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
function ShowPortMapping()
{
	var Interface = getElById('PortMappingInterface');
	var index = Interface.selectedIndex;
	setDisable('btn1',1);
	if (index >0)
	{
		var PortMpId = Interface.options[index].id;
		index = PortMpId.substr(PortMpId.indexOf('_') + 1);
		if (Interface.length > 1)
		{
			if (WanInfo[index].Enable == 0 || WanInfo[index].NATEnabled == 0)
			{
				setDisable('btn1',1);
			}
			else
			{
				setDisable('btn1',0);
			}
		}
		var html = '<table border="1" class="tblList">'
		+ '<tr align="middle">'
		+  '<td width="9%" class="table_title">协议</td>'
		/*+  '<td width="13%" class="table_title">源IP地址</td>'*/
		+  '<td width="16%" class="table_title">开始端口号</td>'
		+  '<td width="16%" class="table_title">结束端口号</td>'
		+  '<td width="13%" class="table_title">内部主机</td>'
		+  '<td width="15%" class="table_title">映射名字</td>'
		+  '<td width="10%" class="table_title">使能</td>'
		+  '<td width="10%" class="table_title">删除</td>'
		+ '</tr>'
		VirServEntryIndex = 0;
		for (i = 0; i < PortMapping.length; i++)
		{
			//if (PortMapping[i].domain.indexOf(getSelectVal('PortMappingInterface'))	> -1)
			{
				html += '<TR align="middle">'
				html +=  '<TD align="center">' + getDisplayText(PortMapping[i].Protocol,10) + '&nbsp;</TD>';
				/*html += '<TD align="center">' + getDisplayText(PortMapping[i].RemoteHost,8) + '&nbsp;</TD>';*/
				html += '<TD align="center">' + getDisplayText(PortMapping[i].ExPort,5) + '&nbsp;</TD>';
				html += '<TD align="center">' + getDisplayText(PortMapping[i].InPort,5) + '&nbsp;</TD>';
				html += '<TD align="center">' + getDisplayText(PortMapping[i].InClient,10) + '&nbsp;</TD>';
				html += '<TD align="center">' + getDisplayText(PortMapping[i].Description,10) + '&nbsp;</TD>';
				if (PortMapping[i].ProtMapEnabled == "Yes")
				{
					html += '<TD align="center">' + '开启' + '&nbsp;</TD>';
				}
				else
				{
					html += '<TD align="center">' + '关闭' + '&nbsp;</TD>';
				}
				html += '<TD align="center"><input type="checkbox" name="rml" value="'
				+ PortMapping[i].domain + '"></TD>';
				html += '</TR>';
				VirServEntryIndex++;
			}
		}
		html += '</table>'
		getElById('portMappingInfo').innerHTML = html;
	}
}
TOTAL_APP = 14;
FIRST_APP = "选择...";
var v = new Array(TOTAL_APP);
v[0] = new cV("Domain Name Server",1);
v[0].e[0] = new iVe("53", "53", "2", "53", "53");
v[1] = new cV("FTP Server",1);
v[1].e[0] = new iVe("21", "21", "1", "21", "21");
v[2] = new cV("IPSEC",1);
v[2].e[0] = new iVe("500", "500", "2", "500", "500");
v[3] = new cV("Mail POP3",1);
v[3].e[0] = new iVe("110", "110", "1", "110", "110");
v[4] = new cV("Mail SMTP",1);
v[4].e[0] = new iVe("25", "25", "1", "25", "25");
v[5] = new cV("PPTP",1);
v[5].e[0] = new iVe("1723", "1723", "1", "1723", "1723");
v[6] = new cV("Real Player 8 Plus",1);
v[6].e[0] = new iVe("7070", "7070", "2", "7070", "7070");
v[7] = new cV("Secure Shell Server",1);
v[7].e[0] = new iVe("22", "22", "1", "22", "22");
v[8] = new cV("Secure Web Server HTTPS",1);
v[8].e[0] = new iVe("443", "443", "1", "443", "443");
v[9] = new cV("SNMP",1);
v[9].e[0] = new iVe("161", "161", "2", "161", "161");
v[10] = new cV("SNMP Trap",1);
v[10].e[0] = new iVe("162", "162", "2", "162", "162");
v[11] = new cV("Telnet Server",1);
v[11].e[0] = new iVe("23", "23", "1", "23", "23");
v[12] = new cV("TFTP",1);
v[12].e[0] = new iVe("69", "69", "2", "69", "69");
v[13] = new cV("Web Server HTTP",1);
v[13].e[0] = new iVe("80", "80", "1", "80", "80");
function cV(name, entryNum)
{
	this.name = name;
	this.eNum = entryNum;
	this.e = new Array(5);
}
function iVe(eStart, eEnd, proto, iStart, iEnd)
{
	this.eStart = eStart;
	this.eEnd = eEnd;
	this.proto = proto;
	this.iStart = iStart;
	this.iEnd = iEnd;
}
function clearAll()
{
}
function trimspace(str)
{
	var strTemp = new String(str);
	while (-1 != strTemp.search(" "))
	{
		strTemp = strTemp.replace(" ", "");
	}
	return strTemp;
}
function appSelect(sName)
{
	clearAll();
	with (getElById('PortMappingForm'))
	{
		if (sName == FIRST_APP)
		{
			return;
		}
		for(i = 0; i < TOTAL_APP; i++)
		{
			if(v[i].name == sName)
			{
				switch (v[i].e[0].proto)
				{
				case '0':
					setSelect('PortMappingProtocol','TCP/UDP');
					break;
				case '1':
					setSelect('PortMappingProtocol','TCP');
					break;
				case '2':
					setSelect('PortMappingProtocol','UDP');
					break;
				}
				RemoteHost.value = "";
				ExternalPort.value = v[i].e[0].eStart;
				InternalPort.value = v[i].e[0].iStart;
				PortMappingDescription.value = trimspace(sName);
			}
		}
	}
}
function radioClick()
{
	if (document.PortMappingForm.radiosrv[0].checked == true)
	{
		with(document.PortMappingForm)
		{
			constsrvName.disabled = true;
		}
	}
	else
	{
		with(document.PortMappingForm)
		{
			constsrvName.disabled = false;
		}
	}
}

function setALGSwitch()
{
	var Form = document.algForm;
	if(Form.Enable.checked) {
        Form.L2TPSW_Flag.value = "on";
        Form.IPSecSW_Flag.value = "on";
        Form.H323SW_Flag.value = "on";
        Form.RTSPSW_Flag.value = "on";
        Form.SIPSW_Flag.value = "on";
        Form.FTPSW_Flag.value = "on";
        Form.PPTPSW_Flag.value = "on";
    }
    else {
        Form.L2TPSW_Flag.value = "off";
        Form.H323SW_Flag.value = "off";
        Form.RTSPSW_Flag.value = "off";
        Form.SIPSW_Flag.value = "off";
        Form.FTPSW_Flag.value = "off";
        Form.PPTPSW_Flag.value = "off";
    }
}
function getEntryIndex(ctl)
{
	for (i = 0; i < nEntryNum; i++)
	{
		if (getSelectVal(ctl) == vEntryValue[i])
			return vEntryIndex[i];
	}
	return 999;
}
function getEntryValue(idx)
{
	for (i = 0; i < nEntryNum; i++)
	{
		if (idx == vEntryIndex[i])
			return vEntryValue[i];
	}
	return 999;
}
function btnSubmit(iMode)
{
	if(CheckForm(iMode) == false)
		return;
	if(iMode == 1)//alg
	{
		setALGSwitch();
		document.algForm.alg_Flag.value = "1";
		//document.algForm.submit();
		$("form[name='algForm']").submit();
	}
	else if(iMode == 2)//dmz
	{
		if(getCheckVal('DMZEnable') == 0)
			document.dmzForm.EnableDMZ_Flag.value = "No";
		else 
			document.dmzForm.EnableDMZ_Flag.value = "Yes";
		
		<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>	
		if(getCheckVal('AutoDMZEnable') == 0)
			document.dmzForm.AutoDMZ_Flag.value = "0";
		else 
			document.dmzForm.AutoDMZ_Flag.value = "1";
		<%End If%>	
		document.dmzForm.DMZ_Flag.value = "1";
		document.dmzForm.DMZEntryCurIndex.value = getEntryIndex('DMZInterface');
		//document.dmzForm.submit();
		$("form[name='dmzForm']").submit();
	}
	else if(iMode == 3)//add
	{
		document.PortMappingForm.VirServCurIndex.value = VirSerIdleEntryIndex;
		document.PortMappingForm.VirServer_Flag.value = "1";
		document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
		//document.PortMappingForm.submit();
		$("form[name='PortMappingForm']").submit();
	}
	else if(iMode == 4)//del
	{
		RemovePortMapping(PortMappingForm,'rml');
		document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
		document.PortMappingForm.VirServer_Flag.value = "2";
		document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
		//document.PortMappingForm.submit();
		$("form[name='PortMappingForm']").submit();
	}
	else if(iMode == 5)//changeIF
	{
		document.PortMappingForm.VirServer_Flag.value = "3";
		document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
		//document.PortMappingForm.submit();
		$("form[name='PortMappingForm']").submit();
	}	
}
function ShowDMZ()
{
	var Interface = getElById('DMZInterface');
	var index = Interface.selectedIndex;
	if (index >=0)
	{
		var DMZId = Interface.options[index].id;
		index = DMZId.substr(DMZId.indexOf('_') + 1);
		if ((index < 0) || (index >= WanInfo.length))
		{
			return;
		}
		setCheck('DMZEnable',WanInfo[index].DMZEnable);
		<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
		setCheck('AutoDMZEnable',WanInfo[index].AutoDMZ_Flag);
		<%End If%>
		setText('DMZHostIPAddress',WanInfo[index].DMZIP);
		if (WanInfo[index].Enable == 0 || WanInfo[index].NATEnabled == 0)
		{
			setDisable('DMZEnable',1);
			<%If tcWebApi_get("Dmz_Common","isAutoDMZSup ported","h") = "Yes" Then%>
			setDisable('AutoDMZEnable',1);
			<%End If%>
			setDisable('DMZHostIPAddress',1);	
		}
		else
		{
			setDisable('DMZEnable',0);
			<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
			setDisable('AutoDMZEnable',0);
			<%End If%>
			setDisable('DMZHostIPAddress',0);
			
			if(WanInfo[index].DMZEnable)
			{	
				document.dmzForm.DMZHostIPAddress.disabled = false;
				<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
				document.dmzForm.AutoDMZEnable.disabled = false;
				if(WanInfo[index].AutoDMZ_Flag)
				{
					document.dmzForm.DMZHostIPAddress.disabled = true;
				}
				else
				{
					document.dmzForm.DMZHostIPAddress.disabled = false;
				}
				<%End If%>
			}
			else
			{
				setText('DMZHostIPAddress', "");
				<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
				document.dmzForm.AutoDMZEnable.disabled = true;
				<%End If%>
				document.dmzForm.DMZHostIPAddress.disabled = true;
			}			
		}
	}
}
function clearAll()
{
}

var cfg_menu_list  = new Array('ALG配置', 'DMZ配置', '虚拟主机配置');
var cfg_cookie_name = 'app-natset-menu';
init_l_menu();
</SCRIPT>

   <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
			<TD id=MenuArea_L2>
	       <ul class="TRD">
              	     <li id="ALG配置">ALG配置</li>
              	     <li id="DMZ配置">DMZ配置</li>
<% if tcWebApi_get("Info_Ether","isVirServerSupported","h")="Yes" then %>
              	     <li id="虚拟主机配置">虚拟主机配置</li>
<% end if %>
	       </ul>
	  </TD>
			<SCRIPT language=javascript>
			MakeMenu(getElById ('Selected_Menu').value);
			</SCRIPT>
			<TD valign="top">
        <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
          <TBODY>                                  
          <TR>
          <TD width=7 background=/img/panel3.gif>　</TD>
          <TD valign="top">
	   <div style="display:none;" id="ALG配置_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">ALG配置</div>
                    </TD>
                </TR>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
                <TD class='w-428'>
                  <FORM id=algForm name="algForm" action="/cgi-bin/app-natset.asp" method="post">
                  <DIV id=pptp>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                        <TD><div class="form-text">使能</div></TD>
                        <TD>
                        <INPUT class="input-onoff" type=checkbox name=Enable>
                        </TD>
                    </TR>
                    <TR class="hide">
                      <TD><div class="form-text">L2TP ALG</div></TD>
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=L2TPEnable>
					  </TD>
					  </TR></TBODY></TABLE></DIV>
                  <DIV id=ipsec class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">IPSec ALG</div></TD>
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=IPSECEnable>
					  </TD>
					  </TR></TBODY></TABLE></DIV>
                  <DIV id=h323 class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">H.323 ALG</div></TD>
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=H323Enable>
					  </TD>
					  </TR></TBODY></TABLE></DIV>
                  <DIV id=rtsp class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">RTSP ALG</div></TD>
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=RTSPEnable>
					  </TD>
					  </TR></TBODY></TABLE>
					</DIV>
                  <DIV id=sipproxdInfo class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">SIP ALG</div></TD>				  
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=SIPEnable>
					  </TD>
					  </TR></TBODY></TABLE>
				  </DIV>
                      <input type="hidden" name="L2TPSW_Flag" value="0">
                      <input type="hidden" name="IPSecSW_Flag" value="0">
                      <input type="hidden" name="H323SW_Flag" value="0">
                      <input type="hidden" name="RTSPSW_Flag" value="0">
                      <input type="hidden" name="SIPSW_Flag" value="0">
                      <input type="hidden" name="FTPSW_Flag" value="0">
                      <input type="hidden" name="alg_Flag" value="0">
                      <input type="hidden" name="PPTPSW_Flag" value="0">
                  <DIV id=ftp class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">FTP ALG</div></TD>  
					  <TD>
					  <INPUT class="input-onoff" type=checkbox name=FTPEnable>
					  </TD>
                      </TR></TBODY></TABLE>
                      </DIV>
                  <DIV id=pptp class="hide">
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><div class="form-text">PPTP ALG</div><!--INPUT class="input-onoff" type=checkbox name=PPTPEnable--> </TD>
					  <TD><INPUT class="input-onoff" type=checkbox name=PPTPEnable></TD>
					</TR>
                    <!-- <tr>
                        <td>
                            <P style="margin-top: 32px;margin-left: 182px;">
                                <INPUT onclick="btnSubmit(1)" type=button value="保 存" name=button3> 
                            </P>
                        </td>
                    </tr> -->
					</TBODY>
					</TABLE>
					</DIV>
                    </FORM>
                  <CENTER>
                  <DIV id=applybutton>
                  </DIV></CENTER>
                        <P style="margin-left: 182px;">
                            <INPUT onclick="btnSubmit(1)" type=button value="保 存" name=button3> 
                        </P>
                  </TD>
              </TR>
              </TBODY></TABLE>
        </div>

       <div style="display:none;" id="DMZ配置_item">
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
            <TBODY>
                <TR>
                    <TD>
                        <div class="advanceTitle">DMZ配置</div>
                    </TD>
                </TR>
                <tr>
                    <td>
                    <div class="advanceTips">
                        <span onclick="showHelp()">页面帮助</span>
                    </div>
                    <div class="helpDesc" style="display: none;">
                        <ul>
                            <li>来自网络侧的报文如果没有端口映射，会被转发到DMZ主机上。 </li>
                            <li>DMZ配置只能在路由模式下进行，若当前上网模式不是路由模式，此功能禁止使用。 </li>
                        </ul>
                    </div>
                </td>
                <TR>
                    <TD>
                        <div class="title-line"></div>
                    </TD>
                </TR>
           <TR>
                <TD>
                  <FORM id=dmzForm name="dmzForm" action="/cgi-bin/app-natset.asp" method="post">
                      <input type="hidden" name="EnableDMZ_Flag" value="0">
                      <input type="hidden" name="DMZ_Flag" value="0">
                      <input type="hidden" name="DMZEntryCurIndex" value="0">
					  <input type="hidden" name="AutoDMZ_Flag" value="0">
					  <input type="hidden" name="isAutoDMZSupported" value="<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if%>">
                      <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
<% if tcWebApi_get("WebCustom_Entry", "isNPUSupported","h") <> "Yes" then %>
					<TR>
<% else %>
					<TR style="display:none;">
<% end if %>
                      <TD width=120><div class="form-text">接口名称</div></TD>
                      <TD><SELECT id=DMZInterface onchange=ShowDMZ() 
                        name=DMZInterface maxlength="15"> 
			<SCRIPT language=JavaScript type=text/javascript>
			var dmzidx = <% tcWebApi_get("WebCurSet_Entry","dmz_ifidx","s") %>;
			var sel = '';
			for (i = 0; i < nEntryNum; i++)
			{
				if ( i == 0 && dmzidx == 999 )
					sel = 'selected';
				else
					sel = ( dmzidx == vEntryIndex[i] ) ? 'selected' : '';

				if((vEntryName[i].indexOf('_TR069_')<0) || (vEntryName[i].indexOf('_INTERNET_')>-1))
				{
					document.write('<option value=' + vEntryValue[i] + ' id=dmz_' + i + '  ' + sel + '>'
					+ vEntryName[i] + '</option>');
				}
			}
			</SCRIPT>
                        </SELECT> </TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">使能</div></TD>
                      <TD><INPUT class="input-onoff" onclick=dmzClick() type=checkbox 
                        name=DMZEnable></TD></TR>
					<%If tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
						<TR>
                            <TD width=120><div class="form-text">AUTO DMZ</div></TD>
                            <TD><input onClick=AutodmzClick() type=checkbox 
                        name=AutoDMZEnable > 
                            </TD>
                          </TR>
					<%End If%>
                    <TR>
                      <TD width=120><div class="form-text">LAN侧IP地址</div></TD>
                      <TD><INPUT maxLength=15 
                    name=DMZHostIPAddress></TD>
                          </TR>
                       </TBODY>
                      </TABLE></FORM>
                  <CENTER>
                  </CENTER>
                  <P style="margin-left: 182px;">
                    <INPUT onclick="btnSubmit(2)" type=button value="保 存" name=button> 
                    </P>
                  </TD>
              </TR>
              </TBODY>
            </TABLE></div>

        <div style="display:none;" id="虚拟主机配置_item">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                <TBODY>
                    <TR>
                        <TD>
                            <div class="advanceTitle">虚拟主机配置</div>
                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <div class="title-line"></div>
                        </TD>
                    </TR>
              <TR>
                <TD>
                  <FORM id=PortMappingForm name="PortMappingForm" action="/cgi-bin/app-natset.asp" method="post">
                  <DIV id=natpm>
	                <input type="hidden" name="VirServer_Flag" value="0"> 
	                <input type="hidden" name="EnableVirServer_Flag" value="Yes">
	                <input type="hidden" name="VirServEntryCurIndex" value="0">
	                <input type="hidden" name="VirServCurIndex" value="0">
	                <input type="hidden" name="hVirServEntry0" value="99">
	                <input type="hidden" name="hVirServEntry1" value="99">
	                <input type="hidden" name="hVirServEntry2" value="99">
	                <input type="hidden" name="hVirServEntry3" value="99">
	                <input type="hidden" name="hVirServEntry4" value="99">
	                <input type="hidden" name="hVirServEntry5" value="99">
	                <input type="hidden" name="hVirServEntry6" value="99">
	                <input type="hidden" name="hVirServEntry7" value="99">
	                <input type="hidden" name="hVirServEntry8" value="99">
	                <input type="hidden" name="hVirServEntry9" value="99">	                
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                              <TD width=120><div class="form-text">接口</div></TD>
                      <TD><SELECT onchange=btnSubmit(5) size=1 
                        name=PortMappingInterface> 
			<SCRIPT language=JavaScript type=text/javascript>
			document.write('<option value="999">' + '' + '</option>');
			for (i = 0; i < nEntryNum; i++)
			{
				if((vEntryName[i].indexOf('_TR069_')<0 || vEntryName[i].indexOf('_INTERNET_')>-1) && (vEntryName[i].indexOf('_R_')>-1))
				{
					document.write('<option value=' + vEntryValue[i] + ' id=portmp_' + i + '>' + vEntryName[i] + '</option>');
				}
			}
			</SCRIPT>
                        </SELECT> </TD></TR>
		 <TR>
             <TD><div class="form-text"><INPUT onclick=radioClick() type=radio CHECKED 
                name=radiosrv><span>自定义</span></div></TD><TD></TD></TR>
                    <TR><TD>
                        <div class="form-text"><INPUT onclick=radioClick() type=radio 
                            name=radiosrv><span>选择应用</span></div></TD><TD>
                        <SELECT disabled onchange=appSelect(this.value) 
                        size=1 name=constsrvName> <OPTION value=FIRST_APP 
                          selected>选择...</OPTION> <OPTION 
                          value="Domain Name Server">Domain Name Server
                          </OPTION> <OPTION value="FTP Server">FTP 
                          Server</OPTION> <OPTION value=IPSEC>IPSEC</OPTION> 
                          <OPTION value="Mail POP3">Mail POP3</OPTION> 
                          <OPTION value="Mail SMTP">Mail SMTP</OPTION> 
                          <OPTION value=PPTP>PPTP</OPTION> <OPTION 
                          value="Real Player 8 Plus">Real Player 8 Plus</OPTION> 
                          <OPTION value="Secure Shell Server">Secure Shell 
                          Server</OPTION> <OPTION 
                          value="Secure Web Server HTTPS">Secure Web Server 
                          HTTPS</OPTION> <OPTION value=SNMP>SNMP</OPTION> 
                          <OPTION value="SNMP Trap">SNMP Trap</OPTION> <OPTION 
                          value="Telnet Server">Telnet Server</OPTION> <OPTION 
                          value=TFTP>TFTP</OPTION> <OPTION 
                          value="Web Server HTTP">Web Server 
                        HTTP</OPTION></SELECT> 
              			</TD></TR>
                    <TR style="DISPLAY: none">
                      <TD width=120><div class="form-text">使能</div></TD>
                      <TD><SELECT size=1 name=PortMappingEnabled> <OPTION 
                          value=1 selected>启用</OPTION> <OPTION 
                          value=0>禁用</OPTION></SELECT> </TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">协议</div></TD>
                      <TD><SELECT size=1 name=PortMappingProtocol> <OPTION 
                          value=TCP selected>TCP</OPTION> <OPTION 
                          value=UDP>UDP</OPTION> <OPTION 
                          value=TCP/UDP>TCP/UDP</OPTION></SELECT> </TD></TR>
                    <TR style="display:none">
                      <TD width=120><div class="form-text">源IP地址</div></TD>
                      <TD><INPUT maxLength=15 name=RemoteHost></TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">开始端口号</div></TD>
                      <TD><INPUT maxLength=5 name=ExternalPort></TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">结束端口号</div></TD>
                      <TD><INPUT maxLength=5 name=InternalPort></TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">内部主机</div></TD>
                      <TD><INPUT maxLength=32 name=InternalClient></TD></TR>
                    <TR>
                      <TD width=120><div class="form-text">映射名字</div></TD>
                      <TD><INPUT maxLength=31 
                    name=PortMappingDescription></TD>
                      </TR>
                    </TBODY>
                   </TABLE>
                  </DIV>
                  </FORM>
                  <DIV id=portMappingInfo></DIV>
                    <center> 
                </center>
                <P style="margin-left: 182px;">
                    <INPUT onclick=btnSubmit(3) type=button value="添 加" class="BtnAdd" name=btn1> 
                    <INPUT onclick=btnSubmit(4) type=button value="删 除" class="BtnAdd" style="margin-left: 48px;" name=btnDel> 
                </P></TD>
                <TD width=10>&nbsp;</TD>
                </TR>
              </TBODY>
            </TABLE></div>
        </TR>
        <TR>
          <TD width=7 background=/img/panel3.gif>　</TD>
          <TD>&nbsp;</TD>
        </TR>
        <TR>
          <TD width=7 background=/img/panel3.gif>　</TD>
          <TD></TD>
        </TR>
        <TR>
          <TD width=7 background=/img/panel3.gif>　</TD>
          <TD></TD></TR></TBODY>
       </TABLE>
      <FORM style="DISPLAY: none" name=ConfigForm action="">
<input type="hidden" name="isVirServerSupported" value="<%if tcWebApi_get("Info_Ether","isVirServerSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if%>">
</FORM></TD>
  </TR> </TBODY>
</TABLE>
</TBODY></TABLE>
<div class="footer">
	<!-- copyright bottom -->
	<SCRIPT language=JavaScript type=text/javascript>
	printCopyRightBottom();
	</SCRIPT>
</div>
</BODY></HTML>
