<%
If request_Form("VoIP_basic_flag")="1" then
	tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "1")
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
		tcWebApi_set("VoIPBasic_Common", "SIPProtocol", "sipMode")
		tcWebApi_set("VoIPAdvanced_Common", "VoIPRegion", "localeName")
		tcWebApi_set("VoIPAdvanced_Common","CurIFName","ifName")
		tcWebApi_set("VoIPAdvanced_Common","CurIFIndex","curSetIndex")
		tcWebApi_set("VoIPAdvanced_Common", "SIPDomain", "dareSipDomain")
		tcWebApi_set("VoIPBasic_Common", "RegistrarServer", "regAddr")
		tcWebApi_set("VoIPBasic_Common", "RegistrarServerPort", "regPort")
		tcWebApi_set("VoIPBasic_Common", "SBRegistrarServer", "regAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBRegistrarServerPort", "regPort2")	
		tcWebApi_set("VoIPBasic_Entry0", "Enable", "lineEnabled0")	
		tcWebApi_set("VoIPBasic_Entry0", "SIPAuthenticationName", "authName0")	
		tcWebApi_set("VoIPBasic_Entry0", "SIPDisplayName", "authName0")	
		tcWebApi_set("VoIPBasic_Common", "SIPProxyAddr", "proxyAddr")
		tcWebApi_set("VoIPBasic_Common", "SIPProxyPort", "proxyPort")
		tcWebApi_set("VoIPBasic_Common", "SBSIPProxyAddr", "proxyAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBSIPProxyPort", "proxyPort2")
		tcWebApi_set("VoIPBasic_Common", "SIPOutboundProxyAddr", "obProxyAddr")
		tcWebApi_set("VoIPBasic_Common", "SIPOutboundProxyPort", "obProxyPort")
		tcWebApi_set("VoIPBasic_Common", "SBOutboundProxyAddr", "obProxyAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBOutboundProxyPort", "obProxyPort2")	
		
		tcWebApi_set("VoIPBasic_Entry0", "SIPPassword", "password0")	
		If tcWebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then
			tcWebApi_set("VoIPBasic_Entry1", "Enable", "lineEnabled1")
			tcWebApi_set("VoIPBasic_Entry1", "SIPAuthenticationName", "authName1")
			tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayName", "authName1")
			tcWebApi_set("VoIPBasic_Entry1", "SIPPassword", "password1")		
		End If		
		if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "IMSSIP" then
			tcWebApi_set("VoIPBasic_Entry0", "SIPDisplayName", "extension0")
			tcWebApi_set("VoIPBasic_Entry0", "SIPDisplayNumber", "dispName0")
			If tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") <> "Yes"  then
			tcWebApi_constSet("VoIPAdvanced_Common", "SubscribeType", "1")
			End if
			If tcWebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then
				tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayName", "extension1")
				tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayNumber", "dispName1")
			End If		
		end if	
		if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then
			If tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") <> "Yes"  then
			tcWebApi_constSet("VoIPAdvanced_Common", "SubscribeType", "0")
			End If
		end if	

if Request_Form("isMultiDigitMap") = "1" then
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap1", "DigitMap1")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap2", "DigitMap2")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap3", "DigitMap3")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap4", "DigitMap4")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap5", "DigitMap5")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap6", "DigitMap6")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap7", "DigitMap7")	
	tcWebApi_set("VoIPDigitMap_Entry", "DigitMap8", "DigitMap8")	
else
	tcWebApi_set("VoIPAdvanced_Common", "DialPlan", "dialPlan")
end if
	tcWebApi_set("VoIPBasic_Common", "SC_ACCT_SIP_SESSION_TIMER", "sessionTimer")
	tcWebApi_set("VoIPAdvanced_Common", "RegisterRetryInterval", "regRetryInt")
	tcWebApi_set("VoIPAdvanced_Common", "RegistrationExpire", "regExpTmr")	
	tcWebApi_set("VoIPCodecs_PVC0_Entry0", "priority", "codecList0")
	tcWebApi_set("VoIPCodecs_PVC1_Entry0", "priority", "codecList1")
	tcWebApi_set("VoIPCodecs_PVC0_Entry1", "priority", "codecList2")
	tcWebApi_set("VoIPCodecs_PVC1_Entry1", "priority", "codecList3")
	tcWebApi_set("VoIPCodecs_PVC0_Entry2", "priority", "codecList4")
	tcWebApi_set("VoIPCodecs_PVC1_Entry2", "priority", "codecList5")
	tcWebApi_set("VoIPCodecs_PVC0_Entry3", "priority", "codecList6")
	tcWebApi_set("VoIPCodecs_PVC1_Entry3", "priority", "codecList7")
	tcWebApi_set("VoIPCodecs_PVC0_Entry0", "SIPPacketizationTime", "voicePtime0")
	tcWebApi_set("VoIPCodecs_PVC0_Entry1", "SIPPacketizationTime", "voicePtime2")
	tcWebApi_set("VoIPCodecs_PVC0_Entry2", "SIPPacketizationTime", "voicePtime4")
	tcWebApi_set("VoIPCodecs_PVC0_Entry3", "SIPPacketizationTime", "voicePtime6")
	tcWebApi_set("VoIPCodecs_PVC0_Entry4", "SIPPacketizationTime", "voicePtime8")
	tcWebApi_set("VoIPCodecs_PVC0_Entry0", "Enable", "enable0")
	tcWebApi_set("VoIPCodecs_PVC0_Entry1", "Enable", "enable1")
	tcWebApi_set("VoIPCodecs_PVC0_Entry2", "Enable", "enable2")
	tcWebApi_set("VoIPCodecs_PVC0_Entry3", "Enable", "enable3")
	
		tcWebApi_set("VoIPDigitMap_Entry", "DigitMapEnable", "DigitMapEnableFlag")
		tcWebApi_commit("VoIPBasic")
		tcWebApi_save()
	end if
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>VOIP设置</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<SCRIPT language=javascript>
<%
If request_Form("VoIP_basic_flag")="1" then
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") <> "1"  then
		asp_write("alert('宽带电话通话中，不能保存，请通话结束后再保存。');")
	end if
end if
%>
	var voiptype=document.location.search.toString();
	<% if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "H.248"  then %>
		if(voiptype.slice(10) != "SIP" && voiptype.slice(10) != "IMSSIP")
			location.replace("/cgi-bin/app-VoIP248.asp");
	<% end if %>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
var maxLines = '2';
<% else %>
var maxLines = '1';
<% end if %>

var sm = "<%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then asp_Write("1") else asp_Write("0") end if %>";

<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
function getDigitMapValue()
{
    if(document.getElementById("DigitMap1").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value;
   	}
   	else if(document.getElementById("DigitMap2").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + document.getElementById("DigitMap2").value;
   	}else if(document.getElementById("DigitMap3").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value;
   	}else if(document.getElementById("DigitMap4").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value +
   																								document.getElementById("DigitMap4").value;
   	}else if(document.getElementById("DigitMap5").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value +
   																								document.getElementById("DigitMap4").value +
   																								document.getElementById("DigitMap5").value;
   	}else if(document.getElementById("DigitMap6").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value +
   																								document.getElementById("DigitMap4").value + 
   																								document.getElementById("DigitMap5").value +
   																								document.getElementById("DigitMap6").value;
   	}else if(document.getElementById("DigitMap7").value.length < 512){
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value +
   																								document.getElementById("DigitMap4").value +
   																								document.getElementById("DigitMap5").value + 
   																								document.getElementById("DigitMap6").value +
   																								document.getElementById("DigitMap7").value;
   	}else{
   		document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
   																								document.getElementById("DigitMap2").value +
   																								document.getElementById("DigitMap3").value +
   																								document.getElementById("DigitMap4").value +
   																								document.getElementById("DigitMap5").value + 
   																								document.getElementById("DigitMap6").value + 
   																								document.getElementById("DigitMap7").value +
   																								document.getElementById("DigitMap8").value;
   	}

}
function setDigitMapValue()
{
		var len = document.getElementById("dialPlan").value.length;
		var num = len/512;

		if(len > 4096){
			alert("拨号规则的最大长度不能超过4096！！！");
			return -1;
		}
		
		if(num < 1){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value;
			document.getElementById("DigitMap2").value = "";
		}else if(num < 2){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512);		
   		document.getElementById("DigitMap3").value = "";
		}else if(num < 3){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2);
   		document.getElementById("DigitMap4").value = "";
		}else if(num < 4){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
   		document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3);
   		document.getElementById("DigitMap5").value = "";
		}else if(num < 5){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
   		document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
   		document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4);
   		document.getElementById("DigitMap6").value = "";
		}else if(num < 6){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
   		document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
   		document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
   		document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5);
   		document.getElementById("DigitMap7").value = "";
		}else if(num < 7){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
   		document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
   		document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
   		document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5,512*6);
   		document.getElementById("DigitMap7").value = document.getElementById("dialPlan").value.substring(512*6);
   		document.getElementById("DigitMap8").value = "";
		}else if(num <= 8){
   		document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
   		document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
   		document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
   		document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
   		document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
   		document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5,512*6);
   		document.getElementById("DigitMap7").value = document.getElementById("dialPlan").value.substring(512*6,512*7);
   		document.getElementById("DigitMap8").value = document.getElementById("dialPlan").value.substring(512*7);
		}

   return 0;
}
<%end if%>

function SetEditStatus()
{
    var dispalyFlag = "<%tcWebApi_get("VoIPBasic_Common","VoIPConfig","s")%>";
    if (dispalyFlag == "OMCI")
    {
	    var inputArray = document.getElementsByTagName("input");
	    for (var i = 0; i < inputArray.length; i++)
	    {
	        inputArray[i].setAttribute("disabled","disabled"); 
	    }
	
        var selectArray = document.getElementsByTagName("select");
	    for (var j = 0; j < selectArray.length; j++)
	    {
	        selectArray[j].setAttribute("disabled","disabled"); 
	    }
		
		var textArray = document.getElementsByTagName("textarea");
		for (var k = 0; k < textArray.length; k++)
	    {
	        textArray[k].setAttribute("disabled","disabled"); 
	    }
    }	
}

function LoadFrame() {

   generatePerLineTable();
   CheckPriority();
   with ( document.ConfigForm ) 
   {
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
	   	if(voiptype != "")
	   	{
	   		selectOption();
	   	}
<% end if %>
      enableEditBoxes();
	   <% if tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") = "Yes" then%>
	   	extension0.disabled=true;
	   	dispName0.disabled=true;
	   	authName0.disabled=true;
	   	password0.disabled=true;
	   <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	   	extension1.disabled=true;
	   	dispName1.disabled=true;
	   	authName1.disabled=true;
	   	password1.disabled=true;
	   <% end if %>
	   <% end if %>
   } 
   
<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
   getDigitMapValue();
<%end if%>
	   CheckDigitMapEnable(getElById('cb_DigitMapEnable'));
	   getElById('txt_DigitMap').value=getElById('dialPlan').value;
	   
<% if tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") = "Yes"  then %>	
<% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
	   getElById('txt_DigitMap').disabled = true;
<% end if %>
   <% end if %>

   SetEditStatus();
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
	
function showRegisterState(port)
{
	var Status = '';
	var LineEnable='';
	var RegFailReason = '';
	
	if ( 1 == port ){
      Status = "<% tcWebAPI_get("InfoVoIP_Entry0", "Status", "s") %>";
      LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry0", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "Enable", "s") else asp_Write("") end if %>';
      RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry0", "RegFailReason", "s") %>";
	}
  <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	else if ( 2 == port ){
      Status = "<% tcWebAPI_get("InfoVoIP_Entry1", "Status", "s") %>";
      LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry1", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "Enable", "s") else asp_Write("") end if %>';
      RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry1", "RegFailReason", "s") %>";
  }
  <% end if %>
	else
      return;
	if(LineEnable == 'No'){
			return '去使能';
	};
	if ( Status == 'Up' )
			return '已注册';
	else if ( Status == 'Initializing' )
			return '初始化中';
	else if ( Status == 'Registering' )
			return '注册中';
	else if ( Status == 'Unregistering' )
			return '未注册';
	else if ( Status == 'Quiescent' )
			return '停止的';
	else if ( Status == 'Disabled' )
			return '去使能';
	else if ( Status == 'Error' ){
		switch ( parseInt(RegFailReason) ){
			case 2:
			case 3:
				voiptatus = '网络(SBC)不可达';
				break;
			case 4:
				voiptatus = '鉴权失败';
				break;
			case 6:
				voiptatus = '业务通道异常';
				break;				
			default:
				voiptatus = '故障';
				break;
		}
		return voiptatus;		
		}
	else if ( Status == 'Testing' )
			return '测试中';
	else
			return '--';
}
	
function generatePerLineTable()
{
  // Generate the table
   if (document.body.innerHTML) {
      var tableHtmlOutput = "<table id='perLineTable1' border='1' class='tblTransList' ><tbody id='perLineTbody1'>";

      // Codec rows
      tableHtmlOutput += "<b>VoIP语音编码配置</b><br>";
      tableHtmlOutput += "<tr>";
      tableHtmlOutput += "<td align=center><b>编解码方式</b></td>"
      tableHtmlOutput += "<td align=center><b>使能</b></td>"
      tableHtmlOutput += "<td align=center><b>打包时长(ms)</b></td>"
      tableHtmlOutput += "<td align=center><b>优先级(1-5)</b></td>"
	  tableHtmlOutput += "<tr><td><% tcWebApi_get("VoIPCodecs_PVC0_Entry0", "codec", "s") %><\/td>"

      tableHtmlOutput += "<td align=center><input type='checkbox' onClick='changeEditStatus(this)' size=10 id=\'codecsEnable0\' name=\'codecsEnable0\' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "Enable", "h") = "Yes" then asp_Write("checked") end if %>></td>";
      var selectOptions00 = Array();
      selectOptions00[0] = "<option value=10 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "SIPPacketizationTime", "h") = "10" then  asp_Write("selected") end if %>>" + 10;
      selectOptions00[1] = "<option value=20 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "SIPPacketizationTime", "h") = "20" then  asp_Write("selected") end if %>>" + 20;
      selectOptions00[2] = "<option value=30 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "SIPPacketizationTime", "h") = "30" then  asp_Write("selected") end if %>>" + 30;
      tableHtmlOutput += "<td align=center><select name='voicePtime0' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions00.join("") + "<\/select></td>";
		  var selectOptions0 = Array();
		  selectOptions0[0] = "<option value = 1>" + "1";
		  selectOptions0[1] = "<option value = 2>" + "2";
		  selectOptions0[2] = "<option value = 3>" + "3";
		  selectOptions0[3] = "<option value = 4>" + "4";
		  selectOptions0[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  width=180><select name='codecList0' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions0.join("") + "<\/select></td>";

			<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		  var selectOptions1 = Array();
		  selectOptions1[0] = "<option value = 1>" + "1";
		  selectOptions1[1] = "<option value = 2>" + "2";
		  selectOptions1[2] = "<option value = 3>" + "3";
		  selectOptions1[3] = "<option value = 4>" + "4";
		  selectOptions1[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  width=180><select name='codecList1' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions1.join("") + "<\/select></td>"; 
		  <% end if %>
		  tableHtmlOutput += "</tr>";

		  tableHtmlOutput += "<tr><td ><% tcWebApi_get("VoIPCodecs_PVC0_Entry1", "codec", "s") %><\/td>"
		  
		  tableHtmlOutput += "<td align=center><input type='checkbox' onClick='changeEditStatus(this)' size=10 id=\'codecsEnable1\' name=\'codecsEnable1\' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "Enable", "h") = "Yes" then asp_Write("checked") end if %>></td>";
      var selectOptions22 = Array();
      selectOptions22[0] = "<option value=10 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "SIPPacketizationTime", "h") = "10" then  asp_Write("selected") end if %>>" + 10;
      selectOptions22[1] = "<option value=20 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "SIPPacketizationTime", "h") = "20" then  asp_Write("selected") end if %>>" + 20;
      selectOptions22[2] = "<option value=30 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "SIPPacketizationTime", "h") = "30" then  asp_Write("selected") end if %>>" + 30;
      tableHtmlOutput += "<td align=center><select name='voicePtime2' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions22.join("") + "<\/select></td>";
		  var selectOptions2 = Array();
		  selectOptions2[0] = "<option value = 1>" + "1";
		  selectOptions2[1] = "<option value = 2>" + "2";
		  selectOptions2[2] = "<option value = 3>" + "3";
		  selectOptions2[3] = "<option value = 4>" + "4";
		  selectOptions2[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList2' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions2.join("") + "<\/select></td>";

			<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		  var selectOptions3 = Array();
		  selectOptions3[0] = "<option value = 1>" + "1";
		  selectOptions3[1] = "<option value = 2>" + "2";
		  selectOptions3[2] = "<option value = 3>" + "3";
		  selectOptions3[3] = "<option value = 4>" + "4";
		  selectOptions3[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList3' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions3.join("") + "<\/select></td>";  
		  <% end if %>
		  tableHtmlOutput += "</tr>";

		  tableHtmlOutput += "<tr><td ><% tcWebApi_get("VoIPCodecs_PVC0_Entry2", "codec", "s") %><\/td>"
		  tableHtmlOutput += "<td align=center><input type='checkbox' onClick='changeEditStatus(this)' size=10 id=\'codecsEnable2\' name=\'codecsEnable2\' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "Enable", "h") = "Yes" then asp_Write("checked") end if %>></td>";
      var selectOptions44 = Array();
      selectOptions44[0] = "<option value=10 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "SIPPacketizationTime", "h") = "10" then  asp_Write("selected") end if %>>" + 10;
      selectOptions44[1] = "<option value=20 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "SIPPacketizationTime", "h") = "20" then  asp_Write("selected") end if %>>" + 20;
      selectOptions44[2] = "<option value=30 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "SIPPacketizationTime", "h") = "30" then  asp_Write("selected") end if %>>" + 30;
      tableHtmlOutput += "<td align=center><select name='voicePtime4' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions44.join("") + "<\/select></td>";
		  var selectOptions4 = Array();
		  selectOptions4[0] = "<option value = 1>" + "1";
		  selectOptions4[1] = "<option value = 2>" + "2";
		  selectOptions4[2] = "<option value = 3>" + "3";
		  selectOptions4[3] = "<option value = 4>" + "4";
		  selectOptions4[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList4' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions4.join("") + "<\/select></td>";

			<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		  var selectOptions5 = Array();
		  selectOptions5[0] = "<option value = 1>" + "1";
		  selectOptions5[1] = "<option value = 2>" + "2";
		  selectOptions5[2] = "<option value = 3>" + "3";
		  selectOptions5[3] = "<option value = 4>" + "4";
		  selectOptions5[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList5' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions5.join("") + "<\/select></td>";
		  <% end if %> 
		  tableHtmlOutput += "</tr>"; 
  
		  tableHtmlOutput += "<tr><td ><% tcWebApi_get("VoIPCodecs_PVC0_Entry3", "codec", "s") %><\/td>"
		  tableHtmlOutput += "<td align=center><input type='checkbox' onClick='changeEditStatus(this)' size=10 id=\'codecsEnable3\' name=\'codecsEnable3\' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "Enable", "h") = "Yes" then asp_Write("checked") end if %>></td>";
      var selectOptions66 = Array();
      selectOptions66[0] = "<option value=10 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "SIPPacketizationTime", "h") = "10" then  asp_Write("selected") end if %>>" + 10;
      selectOptions66[1] = "<option value=20 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "SIPPacketizationTime", "h") = "20" then  asp_Write("selected") end if %>>" + 20;
      selectOptions66[2] = "<option value=30 <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "SIPPacketizationTime", "h") = "30" then  asp_Write("selected") end if %>>" + 30;
      tableHtmlOutput += "<td align=center><select name='voicePtime6' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "Enable", "h") = "Yes" then asp_Write("") else asp_Write("disabled") end if %>>" + selectOptions66.join("") + "<\/select></td>";
		  var selectOptions6 = Array();
		  selectOptions6[0] = "<option value = 1>" + "1";
		  selectOptions6[1] = "<option value = 2>" + "2";
		  selectOptions6[2] = "<option value = 3>" + "3";
		  selectOptions6[3] = "<option value = 4>" + "4";
		  selectOptions6[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList6' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions6.join("") + "<\/select></td>";

			<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		  var selectOptions7 = Array();
		  selectOptions7[0] = "<option value = 1>" + "1";
		  selectOptions7[1] = "<option value = 2>" + "2";
		  selectOptions7[2] = "<option value = 3>" + "3";
		  selectOptions7[3] = "<option value = 4>" + "4";
		  selectOptions7[4] = "<option value = 5>" + "5";
		  tableHtmlOutput += "<td align=center  ><select name='codecList7' <%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "Enable", "h") <> "Yes" then asp_Write("disabled") end if %>>" + selectOptions7.join("") + "<\/select></td>";  
		  <% end if %>
		  tableHtmlOutput += "</tr>"; 
		  

      tableHtmlOutput += "</tbody></table>";

      //////////////////////////////////////////
      //   new table 
      //////////////////////////////////////////
      /*tableHtmlOutput += "<table  cellpadding='10' cellspacing='10' border='0'><tbody>";
      tableHtmlOutput += "<tr><td align=center>";
      tableHtmlOutput += "<input type=\'button\' onClick=\'btnApplySip()\' value=\'应用\' ID=\'ApplyButtonCodec\'>" + "&nbsp";
      tableHtmlOutput += "<input type=\'button\' onClick=\'RefreshPage()\' value=\'取消\' ID=\'CancelButtonCodec\'>";
      
      tableHtmlOutput += "</td></tr>";
      //End of table
      tableHtmlOutput += "</tbody></table>";*/
      
      //////////////////////////////////////////
      //   new table for basic parameters of user
      //////////////////////////////////////////
      
      tableHtmlOutput += "<br>";
      tableHtmlOutput += "<b>用户基本参数</b><br>";
      tableHtmlOutput += "<table id='perLineTable2' border='1' class='tblTransList' ><tbody id='perLineTbody2'>";
      
      // Line row
      tableHtmlOutput += "<tr>";
      tableHtmlOutput += "<td align=center><b>编号</b></td>"
      tableHtmlOutput += "<td align=center><b>注册用户名</b></td>"
      tableHtmlOutput += "<td align=center><b>鉴权用户名</b></td>"
      tableHtmlOutput += "<td align=center><b>密码</b></td>"
      tableHtmlOutput += "</tr>";
      
      
      //var data = "<input type='text' size=20 maxlength=64 name=\'number\' value=\'1\'>";
      tableHtmlOutput += "<td align=center style='width:120px'> 1 </td>";

	  	var line1number = '<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPDisplayName", "s") else asp_Write("") end if %>'
      if(line1number == '')
		  {
				line1number = '<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "s") else asp_Write("") end if %>';
		  }
	  	var data = "<input type='text' size=20 maxlength=64 name=\'extension0\' value =" + line1number + ">";
	  	tableHtmlOutput += "<td align=center>" + data + "</td>";
      
      var data = "<input type='text' size=20 maxlength=128 name=\'authName0\' value=\'<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPAuthenticationName", "s") else asp_Write("") end if %>\'>";
      tableHtmlOutput += "<td align=center>" + data + "</td>";
      
      var data = "<input type='Password' size=20 maxlength=128 name=\'password0\' value=\'<%if tcWebAPI_get("VoIPBasic_Entry0", "SIPPassword", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "SIPPassword", "s") else asp_Write("") end if %>\'>";
      tableHtmlOutput += "<td align=center>" + data + "</td>";
      
      <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
      tableHtmlOutput += "</tr>";
      tableHtmlOutput += "<tr>";
			tableHtmlOutput += "<td align=center style='width:120px'> 2 </td>";

      var data = "<input type='text' size=20 maxlength=64 name=\'extension1\' value=\'<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPDisplayName", "s") else asp_Write("") end if %>\'>";
      tableHtmlOutput += "<td align=center>" + data + "</td>";

      var data = "<input type='text' size=20 maxlength=128 name=\'authName1\' value=\'<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "s") else asp_Write("") end if %>\'>";
      tableHtmlOutput += "<td align=center>" + data + "</td>";

      var data = "<input type='Password' size=20 maxlength=128 name=\'password1\' value=\'<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPPassword", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPPassword", "s") else asp_Write("") end if %>\'>";
      tableHtmlOutput += "<td align=center>" + data + "</td>";
      <% end if %>
      
      tableHtmlOutput += "</tr>";
      //End of table
      tableHtmlOutput += "</tbody></table>"; 
      
      //////////////////////////////////////////
      //   new table 

      tableHtmlOutput += "<table  cellpadding='10' cellspacing='10' border='0'><tbody>";
      tableHtmlOutput += "<tr><td align=center>";
      
	  	tableHtmlOutput += "<input class='BtnAdd' type=\'button\' onClick=\'btnApplySip()\' value=\'应用\' ID=\'AddButtonUser\'>" + "&nbsp";
      tableHtmlOutput += "<input class='BtnDel' type=\'button\' onClick=\'RefreshPage()\' value=\'取消\' ID=\'DeleteButtonUser\'>";      
      tableHtmlOutput += "</td></tr>";
      //End of table
      tableHtmlOutput += "</tbody></table>";   

      document.getElementById("perLineTablePlaceholder1").innerHTML = tableHtmlOutput;
   } else {
      alert("Cannot create per line table in this browser.");
   }
	
}

function btnAddAcount()
{
}

function btnDeleteAcount()
{
}

function enableEditBoxes()
{
   if ( sm == "1" )
   {  	
   }
    else
    {
    	document.getElementById('edit_dareSipDomain').style.display = ""; 	
    }
}	

function applyClickBasic()
{
}	

function applyClickAdvanced()
{
   var loc = "app-VoIP_Adv.asp";
   var code = "location='" + loc + " '";
   eval(code);
}

function proClick(obj) {
    var idx = obj.selectedIndex;
    var val = obj.options[idx].value;
    if ( val == "SIP" )
    {
    	sm = '1';
    }
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
    else if ( val == "H.248" )
    {
    	location.replace("/cgi-bin/app-VoIP248.asp?isLocation=1");
    }
<% end if %>
    else
    {
    	sm = '0';	
    }
    
    enableEditBoxes();
}

function curIndexUpdate()
{
	var pvc_counts = <% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>;
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue", "s") %>";
	var indexArrayStr = "<% tcWebApi_get("WanInfo_Common", "ValidIFIndex", "s") %>";
	var Wan_WanName = vArrayStr.split(',');
	var Voip_WanIndex = indexArrayStr.split(',');

	for (var i = 0;i < pvc_counts;i++)
	{
		if(Wan_WanName[i]==document.ConfigForm.ifName.value) 
		{
			document.ConfigForm.curSetIndex.value = Voip_WanIndex[i]; 
		}
	}
}

function printInterfaceListBox()
{
	var pvc_counts = <% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>;
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "CycleValue", "s") %>";
	var Voip_WanName = "<% tcWebApi_get("VoIPAdvanced_Common", "CurIFName", "s") %>";
	var Wan_WanName = vArrayStr.split(',');
	
	for (var i = 0;i < pvc_counts;i++)
	{
		if (Wan_WanName[i].indexOf('_VOICE_') > -1 && Wan_WanName[i].indexOf('_R_') > -1)
		{
			if(Wan_WanName[i]==Voip_WanName) 
			{
				document.writeln("<option value=\"" + Wan_WanName[i] + "\" selected>"+Wan_WanName[i]+"");
		}	
			else
				document.writeln("<option value=\"" + Wan_WanName[i] + "\">"+Wan_WanName[i]+"");
		}	
	}

	curIndexUpdate();
}

function printLocaleListBox()
{
//	 var locList = ',,,,,,,,,,,,,,,,,,,,,,,,';	
     document.writeln("<option value=\"AUS-AUSTRAILIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "AUS-AUSTRAILIA" then  asp_Write("selected") end if %>> AUS-AUSTRAILIA" );
     document.writeln("<option value=\"BEL-BELIGIUM\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "BEL-BELIGIUM" then  asp_Write("selected") end if %>> BEL-BELIGIUM" );
     document.writeln("<option value=\"BRA-BRAZIL\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "BRA-BRAZIL" then  asp_Write("selected") end if %>> BRA-BRAZIL" );
     document.writeln("<option value=\"CHL-CHILE\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHL-CHILE" then  asp_Write("selected") end if %>> CHL-CHILE" );
     document.writeln("<option value=\"CHN-CHINA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHN-CHINA" then  asp_Write("selected") end if %>> CHN-CHINA" );
     document.writeln("<option value=\"CZH-CZECH\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CZH-CZECH" then  asp_Write("selected") end if %>> CZH-CZECH" );
     document.writeln("<option value=\"DNK-DENMARK\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "DNK-DENMARK" then  asp_Write("selected") end if %>> DNK-DENMARK" );
     document.writeln("<option value=\"ETS-ETSI\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ETS-ETSI" then  asp_Write("selected") end if %>> ETS-ETSI" );
     document.writeln("<option value=\"FIN-FINLAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "FIN-FINLAND" then  asp_Write("selected") end if %>> FIN-FINLAND" );
     document.writeln("<option value=\"FRA-FRANCE\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "FRA-FRANCE" then  asp_Write("selected") end if %>> FRA-FRANCE" );
     document.writeln("<option value=\"DEU-GERMANY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "DEU-GERMANY" then  asp_Write("selected") end if %>> DEU-GERMANY" );
     document.writeln("<option value=\"HUN-HUNGARY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "HUN-HUNGARY" then  asp_Write("selected") end if %>> HUN-HUNGARY" );
     document.writeln("<option value=\"IND-INDIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "IND-INDIA" then  asp_Write("selected") end if %>> IND-INDIA" );
     document.writeln("<option value=\"ITA-ITALY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ITA-ITALY" then  asp_Write("selected") end if %>> ITA-ITALY" );
     document.writeln("<option value=\"JPN-JAPAN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "JPN-JAPAN" then  asp_Write("selected") end if %>> JPN-JAPAN" );
     document.writeln("<option value=\"RUS-RUSSIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "RUS-RUSSIA" then  asp_Write("selected") end if %>> RUS-RUSSIA" );     
     document.writeln("<option value=\"NLD-NETHERLANDS\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NLD-NETHERLANDS" then  asp_Write("selected") end if %>> NLD-NETHERLANDS" );
     document.writeln("<option value=\"NZL-NEWZEALAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NZL-NEWZEALAND" then  asp_Write("selected") end if %>> NZL-NEWZEALAND" );
     document.writeln("<option value=\"USA-NORTHAMERICA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "USA-NORTHAMERICA" then  asp_Write("selected") end if %>> USA-NORTHAMERICA" );
     document.writeln("<option value=\"ESP-SPAIN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ESP-SPAIN" then  asp_Write("selected") end if %>> ESP-SPAIN" );
     document.writeln("<option value=\"SWE-SWEDEN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "SWE-SWEDEN" then  asp_Write("selected") end if %>> SWE-SWEDEN" );
     document.writeln("<option value=\"NOR-NORWAY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NOR-NORWAY" then  asp_Write("selected") end if %>> NOR-NORWAY" );
     document.writeln("<option value=\"CHE-SWITZERLAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHE-SWITZERLAND" then  asp_Write("selected") end if %>> CHE-SWITZERLAND" );
     document.writeln("<option value=\"T57-TR57\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "T57-TR57" then  asp_Write("selected") end if %>> T57-TR57" );
     document.writeln("<option value=\"GBR-UK\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "GBR-UK" then  asp_Write("selected") end if %>> GBR-UK" );
     document.writeln("<option value=\"TWN-TAIWAN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "TWN-TAIWAN" then  asp_Write("selected") end if %>> TWN-TAIWAN" );
     
}

function limitNum(o)
{
	if (o.value != "")
	{
		if (!isInteger(o.value))
		{
			alert('"' + o.value + '"' + '只能输入数字.');	
			window.setTimeout( function(){ o.focus(); }, 0);
		}
	}
}

function checkPort(o)
{
	if (o.value != "")
	{
		if (!isInteger(o.value) || !isValidPort(o.value))
		{
			alert('"' + o.value + '"' + '是无效端口.');	
			window.setTimeout( function(){ o.focus(); }, 0);
		}
	}
}
function isValidIPV6(str)
{
	var pattern = new RegExp("^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:)|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}(:[0-9A-Fa-f]{1,4}){1,2})|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){1,3})|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){1,4})|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){1,5})|([0-9A-Fa-f]{1,4}:(:[0-9A-Fa-f]{1,4}){1,6})|(:(:[0-9A-Fa-f]{1,4}){1,7})|(([0-9A-Fa-f]{1,4}:){6}(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){5}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){0,1}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){0,2}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){0,3}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|([0-9A-Fa-f]{1,4}:(:[0-9A-Fa-f]{1,4}){0,4}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3})|(:(:[0-9A-Fa-f]{1,4}){0,5}:(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}))$");
	return pattern.test(str);
}

function btnApplySip() 
{
   setCodecsFlag();
   with ( document.ConfigForm )
   {
       var regDigitMap = /[^0-9\[\]\-\|\.\*#xXABCDTLStlsEF]/g;
			
			if (regAddr.value != "")
			{
				if (regPort.value == "")
				{
					alert('注册服务器端口端口号不能为空.');
					return;
				}
				if(regAddr.value.match(":"))
				{
					var result = isValidIPV6(regAddr.value);
					if(result != true){
						alert('注册服务器地址不合法.');
						return;
					}
				}
			}
			else
			{
				if (regPort.value != "")
				{
					alert('注册服务器地址不能为空.');
					return;
				}
			}
			if (regAddr2.value != "")
			{
				if(regAddr2.value.match(":"))
				{
					var result = isValidIPV6(regAddr2.value);
					if(result != true){
					    alert('备用注册服务器地址不合法.');
					    return;
					}
				}
			}
/*
			if (regAddr2.value != "")
			{
				if (regPort2.value == "")
				{
					alert('备用注册服务器端口号不能为空.');
					return;
				}
			}
			else
			{
				if (regPort2.value != "")
				{
					alert('备用注册服务器地址不能为空.');
					return;
				}
			}	

			if (proxyAddr.value != "")
			{
				if (proxyPort.value == "")
				{
					alert('代理服务器端口号不能为空.');
					return;
				}
			}
			else
			{
				if (proxyPort.value != "")
				{
					alert('代理服务器地址不能为空.');
					return;
				}
			}	
*/	
			if (obProxyAddr.value != "")
			{
				if (obProxyPort.value == "")
				{
					alert('出局代理服务器端口号不能为空.');
					return;
				}
				if(obProxyAddr.value.match(":"))
				{
					var result = isValidIPV6(obProxyAddr.value);
					if(result != true){
					    alert('出局代理服务器地址不合法.');
					    return;
					}
				}
			}
			else
			{
				if (obProxyPort.value != "")
				{
					alert('出局代理服务器地址不能为空.');
					return;
				}
			}
			if (obProxyAddr2.value != "")
			{
				if(obProxyAddr2.value.match(":"))
				{
					var result = isValidIPV6(obProxyAddr2.value);
					if(result != true){
					    alert('备用出局代理服务器地址不合法.');
					    return;
					}
				}
			}
/*			
			if (obProxyAddr2.value != "")
			{
				if (obProxyPort2.value == "")
				{
					alert('备用出局代理服务器端口号不能为空.');
					return;
				}
			}
			else
			{
				if (obProxyPort2.value != "")
				{
					alert('备用出局代理服务器地址不能为空.');
					return;
				}
			}	
*/
			if (dareSipDomain.value != "")
			{
				if(dareSipDomain.value.match(":"))
				{
					var result = isValidIPV6(dareSipDomain.value);
					if(result != true){
					    alert('域名属性服务器地址不合法.');
					    return;
					}
				}
			}
		if (cb_DigitMapEnable.checked){		
			if(regDigitMap.test(getElById('txt_DigitMap').value)){
				alert("普通数图中有不合法字符!");
				return;
			}
			getElById('dialPlan').value=getElById('txt_DigitMap').value;
		}
		
<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
    var ret = -1;
    
    ret = setDigitMapValue();
    if(ret < 0)
    	return;
<% end if %>
		
		if (cb_DigitMapEnable.checked)
		{
			DigitMapEnableFlag.value = "1";
		}
		
		var s_sipMode = getSelectVal('sipMode');
		
		if ( 'SIP' == s_sipMode || 'IMSSIP' == s_sipMode )
		{
			if ( 0 != extension0.value.length || 0 != authName0.value.length
				|| 0 != password0.value.length )
			{
				if ( 0 == extension0.value.length )
				{
							alert('注册用户名不能为空.');
							return;
				}
				
				if ( 0 == authName0.value.length )
				{
							alert('鉴权用户名不能为空.');
							return;
				}
				
				if ( 'SIP' == s_sipMode )
				{
					if ( extension0.value != authName0.value )
					{
								alert('注册用户名和鉴权用户名需一致.');
								return;
					}
				}
			}
			
		<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
			if ( 0 != extension1.value.length || 0 != authName1.value.length
				|| 0 != password1.value.length )
			{
				if ( 0 == extension1.value.length )
				{
							alert('注册用户名不能为空.');
							return;
				}
				
				if ( 0 == authName1.value.length )
				{
							alert('鉴权用户名不能为空.');
							return;
				}
				
				if ( 'SIP' == s_sipMode )
				{
					if ( extension1.value != authName1.value )
					{
								alert('注册用户名和鉴权用户名需一致.');
								return;
					}
				}
			}
		<% end if %>
		}

		VoIP_basic_flag.value = 1;
		parent.voipType = "SIP";
		submit();						
   }
}

<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
function selectOption()
{
	with (document.ConfigForm)
	{
		for(i = 0;i<3;i++)
		{
			if(sipMode.options[i].value == voiptype.slice(10))
			{
				sipMode.options[i].selected = true;
			}
		}

		if ( voiptype.slice(10) == "SIP" )
		{
				sm = '1';
		}
 		else if(voiptype.slice(10) == "IMSSIP")
		{
				sm = '0';
		}
	}
}
<% end if %>

function CheckDigitMapEnable(cbCtl)
{   
	if (cbCtl.checked == true)
	{
		setDisplay('sec_DigitMap',1);
	}
	else
	{
		setDisplay('sec_DigitMap',0);
	}
}


function CheckPriority()
{
		var temp1=new Array(5);
		var temp2=new Array(5);
		temp1[0] = "<%if tcWebApi_get("VoIPCodecs_PVC0_Entry0", "priority", "h") <> "N/A" then tcWebAPI_get("VoIPCodecs_PVC0_Entry0", "priority", "s") else asp_Write("0") end if %>";
	    temp1[1] = "<%if tcWebApi_get("VoIPCodecs_PVC0_Entry1", "priority", "h") <> "N/A" then tcWebAPI_get("VoIPCodecs_PVC0_Entry1", "priority", "s") else asp_Write("0") end if %>";
	    temp1[2] = 	"<%if tcWebApi_get("VoIPCodecs_PVC0_Entry2", "priority", "h") <> "N/A" then tcWebAPI_get("VoIPCodecs_PVC0_Entry2", "priority", "s") else asp_Write("0") end if %>";
	    temp1[3] = 	"<%if tcWebApi_get("VoIPCodecs_PVC0_Entry3", "priority", "h") <> "N/A" then tcWebAPI_get("VoIPCodecs_PVC0_Entry3", "priority", "s") else asp_Write("0") end if %>";
	    temp1[4] = 	"<%if tcWebApi_get("VoIPCodecs_PVC0_Entry4", "priority", "h") <> "N/A" then tcWebAPI_get("VoIPCodecs_PVC0_Entry4", "priority", "s") else asp_Write("0") end if %>";
	  
	  
	  for(i=0;i<5;i++)
	  {
		var count=parseInt(temp1[i]);
		if(count>0)
		{
			temp2[i]=count-1+"";
		}
		else
		{
			temp2[i]="0";
		}
	  }
	  getElementByName("codecList0").selectedIndex =    temp2[0];
	  getElementByName("codecList2").selectedIndex = 	temp2[1];
	  getElementByName("codecList4").selectedIndex = 	temp2[2];
	  getElementByName("codecList6").selectedIndex = 	temp2[3];
	 // getElementByName("codecList8").selectedIndex = 	temp2[4];
	  <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
	  getElementByName("codecList1").selectedIndex =    temp2[0];
	  getElementByName("codecList3").selectedIndex = 	temp2[1];
	  getElementByName("codecList5").selectedIndex = 	temp2[2];
	  getElementByName("codecList7").selectedIndex = 	temp2[3];
	 // getElementByName("codecList9").selectedIndex = 	temp2[4];
      <% end if %>
}	

function setCodecsFlag()
{
    if(document.getElementById("codecsEnable0").checked)
	{
	    document.ConfigForm.enable0.value = "Yes";
	}
	else
	{
		document.ConfigForm.enable0.value = "No";
	}
	
	  if(document.getElementById("codecsEnable1").checked)
	{
	    document.ConfigForm.enable1.value = "Yes";
	}
	else
	{
		document.ConfigForm.enable1.value = "No";
	}
	
	  if(document.getElementById("codecsEnable2").checked)
	{
	    document.ConfigForm.enable2.value = "Yes";
	}
	else
	{
		document.ConfigForm.enable2.value = "No";
	}
	  if(document.getElementById("codecsEnable3").checked)
	{
	    document.ConfigForm.enable3.value = "Yes";
	}
	else
	{
		document.ConfigForm.enable3.value = "No";
	}
	//  if(document.getElementById("codecsEnable4").checked)
	//{
	//    document.ConfigForm.enable4.value = "Yes";
	//}
	//else
	//{
	//	document.ConfigForm.enable4.value = "No";
	//}
}

function changeEditStatus(obj)
{
	if (obj.checked)
	{
		if (obj.id == "codecsEnable0")
		{
			getElementByName("voicePtime0").disabled = false;
			getElementByName("codecList0").disabled = false;
			
		}
		else if (obj.id == "codecsEnable1")
		{
			getElementByName("voicePtime2").disabled = false;
			getElementByName("codecList2").disabled = false;
			
		}
		else if (obj.id == "codecsEnable2")
		{
			getElementByName("voicePtime4").disabled = false;
			getElementByName("codecList4").disabled = false;
			
		}
		else if (obj.id == "codecsEnable3")
		{
			getElementByName("voicePtime6").disabled = false;
			getElementByName("codecList6").disabled = false;
			
		}
		//else if (obj.id == "codecsEnable4")
		//{
		//	getElementByName("voicePtime8").disabled = false;
		//	getElementByName("codecList8").disabled = false;
		//	
		//}
	}
	else
	{
		if (obj.id == "codecsEnable0")
		{
			getElementByName("voicePtime0").disabled = true;
			getElementByName("codecList0").disabled = true;
			
		}
		else if (obj.id == "codecsEnable1")
		{
			getElementByName("voicePtime2").disabled = true;
			getElementByName("codecList2").disabled = true;
			
		}
		else if (obj.id == "codecsEnable2")
		{
			getElementByName("voicePtime4").disabled = true;
			getElementByName("codecList4").disabled = true;
			
		}
		else if (obj.id == "codecsEnable3")
		{
			getElementByName("voicePtime6").disabled = true;
			getElementByName("codecList6").disabled = true;
			
		}
		//else if (obj.id == "codecsEnable4")
		//{
		//	getElementByName("voicePtime8").disabled = true;
		//	getElementByName("codecList8").disabled = true;
		//	
		//}		
	}
}

</SCRIPT>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);if(getElById('ConfigForm') != null)LoadFrame();FinishLoad();" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=808 align=center border=0 class="major">
  <TBODY>
  <tr>
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
                <TD class=welcom>
                		<span>欢迎您！</span> 
                		<SPAN class=curUserName>&nbsp;</SPAN>
                		<A onclick=DoLogout() href="/cgi-bin/logout.cgi" target=_top>
                			 <SPAN name=logout class=logout>退出</SPAN>
                		</A>
                  	<INPUT id=Selected_Menu type=hidden value="应用->宽带电话设置" name=Selected_Menu></TD>
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
  </tr>
  <tr>
  	<td class="content">
  		<table height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
  			<tbody>
  				<td class="Item_T" rowspan="6">
          	<ul class="TRD">
				<li id="V_voip_1" onClick="applyClickBasic()" class="TSD">宽带电话基本设置</li>
             <li id="V_voip_2" onClick="applyClickAdvanced()">宽带电话高级设置</li>
          	</ul>
          </td>
          
          <td width="828px">

            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=7 background=/img/panel3.gif>　</TD>
                <TD>
                  <FORM id=ConfigForm name="ConfigForm" action="/cgi-bin/app-VoIP.asp" method="post">
                 		<DIV id=pptp>
                  		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
										     <TBODY>
							                <TR>
							                    <TD>
							                    </TD>
							                </TR>
							                <TR>
							                    <TD class=table1_head>
							                    	<B>
							                        接口基本参数
							                      </B>
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
								        <TABLE border=0 cellSpacing=1 cellPadding=0 width="98%">
								            <TBODY>
								                <TR>
								                    <TD width="35%" align=left>
								                        协议:
								                    </TD>
								                    <TD width="65%" colSpan=2 align=left>
										                        <select name="sipMode" id="sipMode" onChange="proClick(this)">
						                                    <option value="IMSSIP" <%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "IMSSIP" then asp_Write("selected") end if %>>IMSSIP</option>
																								<option value="SIP" <%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then asp_Write("selected") end if %>>SIP</option>
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
						                                    <option value="H.248" >H.248</option>
<%end if%>
						                                </select>
<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
								                       若切换语音协议,请重启.
<%end if%>
								                    </TD>
								                </TR>
									               <tr ID="edit_obProxyAddr">
									                  <td>Outbound代理服务器地址:</td>
									                  <td><input type='text' name='obProxyAddr' VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPOutboundProxyAddr", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPOutboundProxyAddr", "s") else asp_Write("") end if %>"> (IP或域名)</td>
									               </tr>
									               <tr ID="edit_obProxyPort">
									                  <td>Outbound代理服务器端口号:</td>
									                  <td><input type='text' name='obProxyPort' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPOutboundProxyPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPOutboundProxyPort", "s") else asp_Write("") end if %>"> (1-65535)</td>
									               </tr>
									               <tr ID="edit_obProxyAddr2">
									                  <td>备用Outbound代理服务器:</td>
									                  <td><input type='text' name='obProxyAddr2' VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBOutboundProxyAddr", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBOutboundProxyAddr", "s") else asp_Write("") end if %>"> (IP或域名)</td>
									               </tr>
									               <tr ID="edit_obProxyPort2">
									                  <td>备用Outbound代理服务器端口号:</td>
									                  <td><input type='text' name='obProxyPort2' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBOutboundProxyPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBOutboundProxyPort", "s") else asp_Write("") end if %>"> (1-65535)</td>
									               </tr>
									               <tr>
									                  <td>Registrar服务器地址:</td>
									                  <td><input type='text' name='regAddr' VALUE="<%if tcWebApi_get("VoIPBasic_Common", "RegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServer", "s") else asp_Write("") end if %>"> (IP或域名)</td>
									               </tr>
									               <tr>
									                  <td>Registrar服务器端口号:</td>
									                  <td><input type='text' name='regPort' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "RegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServerPort", "s") else asp_Write("") end if %>"> (1-65535)</td>
									               </tr>
									               <tr ID="edit_regAddr2">
									                  <td>备用Registrar服务器:</td>
									                  <td><input type='text' name='regAddr2' VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServer", "s") else asp_Write("") end if %>"> (IP或域名)</td>
									               </tr>
									               <tr ID="edit_regPort2">
									                  <td>备用Registrar服务器端口号:</td>
									                  <td><input type='text' name='regPort2' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServerPort", "s") else asp_Write("") end if %>"> (1-65535)</td>
									               </tr>
									               <tr ID="edit_dareSipDomain">
									                  <td width="35%">域名属性:</td>
									                  <td width="65%"><input type='text' name='dareSipDomain' VALUE="<%if tcWebApi_get("VoIPAdvanced_Common", "SIPDomain", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "SIPDomain", "s") else asp_Write("") end if %>"> (IP或域名)</td>
									               </tr>
									               <tr ID="transportProtocol">
									                  <td width="35%">传输协议:</td>
									                  <td width="65%">
									                  	<select name="transport" size="1">
												    	            <option value="UDP" <%if tcWebApi_get("VoIPBasic_Common", "SIPTransportProtocol", "h") = "UDP" then asp_Write("selected") end if %>>
																         	UDP
																         	<option value="TCP" <%if tcWebApi_get("VoIPBasic_Common", "SIPTransportProtocol", "h") = "TCP" then asp_Write("selected") end if %>>
																         	TCP
												    	        </select>
									                  </td>
									               </tr>
									    									               
									               <tr ID="enable_DigitMap">
									                  <td>使能数图:</td>
									                  <td><input type="checkbox" size=10 id="cb_DigitMapEnable" name="cb_DigitMapEnable" <%if tcWebApi_get("VoIPDigitMap_Entry", "DigitMapEnable", "h") = "1" then asp_Write("checked") end if %> onclick="CheckDigitMapEnable(this)"></td>
									               </tr>
												   <tr id="sec_DigitMap">
                                                      <td align="center" colSpan="2">
													  <textarea id="txt_DigitMap" name="txt_DigitMap" rows="4" maxlength="4096" wrap="OFF" style="WIDTH:90%"></textarea>
													  </td>
                                                   </tr> 
									               
								                   <TR style="display:none">
								                       <TD align=left>
								                        拨号规则:
								                        </TD>
								                        <TD align=left>
								                    	
<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
								                    	<input type='text' name='dialPlan' id='dialPlan' value="">
<% else %>
								                    	<input type='text' name='dialPlan' value="<%if tcWebApi_get("VoIPAdvanced_Common", "DialPlan", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "DialPlan", "s") else asp_Write("") end if %>">
<%end if%>
								                        </TD>
								                   </TR>
								                 <tr id="sesstimer">
									                  <td>会话更新周期:</td>
									                  <td>
									                  	<input type='text' name='sessionTimer' onblur="limitNum(this)" value="<%if tcWebApi_get("VoIPBasic_Common", "SC_ACCT_SIP_SESSION_TIMER", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SC_ACCT_SIP_SESSION_TIMER", "s") else asp_Write("") end if %>">
									                  	&nbsp;(单位:秒)
									                  </td>
									               </tr>
									               <TR>
								                    <TD>注册重试的间隔时间:
								                    </TD>
								                    <TD>
								                    	<input type="text" name="regRetryInt" onblur="limitNum(this)" value="<%if tcWebApi_get("VoIPAdvanced_Common", "RegisterRetryInterval", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "RegisterRetryInterval", "s") else asp_Write("") end if %>">
								                      &nbsp;(单位:秒)(1~65534)
								                    </TD>
								                </TR>
								                <TR>
								                    <TD>
								                        注册周期:
								                    </TD>
								                    <TD width="65%" colSpan=2 align=left>
										                   <input type="text" name="regExpTmr" onblur="limitNum(this)" value="<%if tcWebApi_get("VoIPAdvanced_Common", "RegistrationExpire", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "RegistrationExpire", "s") else asp_Write("") end if %>">
								                       &nbsp;(单位:秒)(1~65534)
								                    </TD>
								                </TR>
								                
								                <!--tr>
								                	  <td>
								                       <input type="button" onClick="btnApplySip()" value="应用" ID="ApplyButtonBasic">&nbsp;
                                                                                    <input type="button" onClick="RefreshPage()" value="取消" ID="CancelButtonBasic">
                                                                                   </td>
                                                                                 </tr -->
									             </TBODY>
										        </TABLE>
										        <BR>
										        <div id="perLineTablePlaceholder1">
										        
										        </div>
										        <TABLE border=0 cellSpacing=1 cellPadding=0 width="98%">
										        	<tr>
										        		<td height="10">
										        		</td>
										        	</tr>
										        	<tr>
					                        <td align="center">
					                        	 <input type='hidden' name="VoIP_basic_flag" value="0">
												 <input type='hidden' value='0' name="DigitMapEnableFlag">
												 <input type='hidden' name="enable0" value="No">
												 <input type='hidden' name="enable1" value="No">
												 <input type='hidden' name="enable2" value="No">
												 <input type='hidden' name="enable3" value="No">
												 <input type='hidden' name="enable4" value="No">

                                                 <input type="hidden" name="isMultiDigitMap" value="<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
                                                 <% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
                                                 <input type='hidden' id='DigitMap1' name="DigitMap1" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap1", "s")%>">
                                                 <input type='hidden' id='DigitMap2' name="DigitMap2" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap2", "s")%>">
                                                 <input type='hidden' id='DigitMap3' name="DigitMap3" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap3", "s")%>">
                                                 <input type='hidden' id='DigitMap4' name="DigitMap4" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap4", "s")%>">
                                                 <input type='hidden' id='DigitMap5' name="DigitMap5" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap5", "s")%>">
                                                 <input type='hidden' id='DigitMap6' name="DigitMap6" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap6", "s")%>">
                                                 <input type='hidden' id='DigitMap7' name="DigitMap7" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap7", "s")%>">
                                                 <input type='hidden' id='DigitMap8' name="DigitMap8" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap8", "s")%>">
																								<% end if %>
																		<input type='hidden' name="lineEnabled0" value="Yes">
																		<input type='hidden' name="lineEnabled1" value="Yes">
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
	
<script language="JavaScript">


	
</script>    
</TBODY></TABLE></BODY></HTML>
