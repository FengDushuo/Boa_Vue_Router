<%
if Request_Form("Port_Flag") = "5" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ActivePortOut","EnPortFilterOut_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeIpUp","PortListType_Up_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Port_Flag") = "6" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ActivePortIn","EnPortFilterIn_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeIpDown","PortListType_Down_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
	
elseif Request_Form("Port_Flag") = "2" then
	if Request_Form("delnum") <> "" then
		TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
		TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
		TCWebApi_set("IpMacFilter_Common","DeleteIndex","delnum")
	end if
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Port_Flag") = "3" then
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeIpUp","PortListType_Up_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Port_Flag") = "4" then
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeIpDown","PortListType_Down_Flag")
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
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
    <style>
        .autoList {
            border-collapse: collapse;
            border-style: hidden;
        }

        .tblMain table.autoList td {
            border: 1px solid rgba(202, 208, 209, 0.5);
            border-collapse: collapse;
            height: 58px;
        }
    </style>
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
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">端口过滤</div>
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
            				    <SCRIPT language=JavaScript type=text/javascript>
var portFilter = [
["InternetGatewayDevice.X_ATP_Security","<% tcWebApi_get("IpMacFilter_Common","ActivePortOut","s")%>","<% tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","s")%>","<% tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","s")%>","<% tcWebApi_get("IpMacFilter_Common","ActivePortIn","s")%>"],
null
]
var enblFilterOut = portFilter[0][1];
var ModeUp = portFilter[0][2];
var ModeDown = portFilter[0][3];
var enblFilterIn = portFilter[0][4];

function stWanInfo(domain,Name)
{
this.domain = domain;
this.Name = Name;
}
var WanIP  = new Array(null);
var WanPPP = new Array(new stWanInfo("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANPPPConnection.2","1_TR069_INTERNET_R_0_35"),null);
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
function ShowSrcAddr(val,arrMsgInfo)
{
return val + '-' + arrMsgInfo[i][10];
}
function ShowSrcPort(val,arrMsgInfo)
{
return val + '-' + arrMsgInfo[i][11];
}
function ShowDestAddr(val,arrMsgInfo)
{
return val + '-' + arrMsgInfo[i][12];
}
function ShowDestPort(val,arrMsgInfo)
{
return val + '-' + arrMsgInfo[i++][13];
}
function ShowIface(val,arrMsgInfo)

{
for (k = 0; k < WanInfo.length; k++)
{
if (WanInfo[k].domain == arrMsgInfo[i-1][14])
{
return WanInfo[k].Name;
}
}
}
function ShowEnable(val,arrMsgInfo)
{
if (val == 1)
{
return '启用';
}
else
{
return '禁用';
}
}
var FilterOut = new Array(
new Array("html/security/portfilter.asp", "FilterOut", "", "18%", "10%", "14%", "12%", "12%", "12%", "12%","10%",""),
new Array("html/security/addportfilter.asp","", "InternetGatewayDevice.X_ATP_Security.IpFilterOut", "过滤名称", "协议", "源地址", "源端口", "目的地址", "目的端口","使能"),
new Array("", "", "", "", "", "ShowSrcAddr", "ShowSrcPort", "ShowDestAddr", "ShowDestPort","ShowEnable"),

new Array()
);
var FilterIn = new Array(
new Array("html/security/portfilter.asp", "FilterIn", "", "10%", "10%", "14%", "12%", "12%", "12%", "10%", "8%","12%",""),
new Array("html/security/addportfilter.asp","", "InternetGatewayDevice.X_ATP_Security.IpFilterIn", "名称", "协议", "源地址", "源端口", "目的地址", "目的端口","使能","接口"),
new Array("", "", "", "", "", "ShowSrcAddr", "ShowSrcPort", "ShowDestAddr", "ShowDestPort","ShowEnable","ShowIface"),

new Array()
);
var stateUp,stateDown;
function LoadFrame()
{
	document.ConfigForm.delnum.value = "";
	document.ConfigForm.Port_Flag.value = "0";
	var FilterMode = getElById("FilterMode");
	var FilterModeDown = getElById("FilterModeDown");
	var FilterInfo = getElById("FilterOutInfo");
	if (ModeUp == "black")
	{
		FilterMode[0].checked = true;
		stateUp = false;
	}
	else
	{
		FilterMode[1].checked = true;
		stateUp = true;
	}
	
	if (ModeDown == "black")
	{
		FilterModeDown[0].checked = true;
		stateDown = false;
	}
	else
	{
		FilterModeDown[1].checked = true;
		stateDown = true;
	}
	
	setCheck('enblFilterOut',enblFilterOut);
	setCheck('enblFilterIn',enblFilterIn);
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function selFilter(filter,enable,divinfo)
{
	var Form = document.ConfigForm;
	var enableFilter = filter.checked;
	if(0 == enable){
		if (enableFilter == false)
		{
			confirm("是否禁用上行端口过滤？", function(ret){ if(!ret) 
			{
				filter.checked = true;
				Form.Port_Flag.value = "0";
				$('.tblMain').trigger('click');
				return;
			}else{
				Form.Port_Flag.value = "5";
				Form.IpMacType_Flag.value = "IpUp";
				setDisplay(divinfo,enableFilter);
			}
			Form.Actionflag.value = "Mod";
			btnSubmit();
			});
		}
		else
		{
			confirm("是否启用上行端口过滤？", function(ret){ if(!ret)
			{
				filter.checked = false;
				Form.Port_Flag.value = "0";
				$('.tblMain').trigger('click');
				return;
			}else{
				Form.Port_Flag.value = "5";
				Form.IpMacType_Flag.value = "IpUp";
				setDisplay(divinfo,enableFilter);
			}
			Form.Actionflag.value = "Mod";
			btnSubmit();
			});
		}
	}
	else if(1 == enable)
	{
		if (enableFilter == false)
		{
			confirm("是否禁用下行端口过滤？", function(ret){ if(!ret)
			{
				filter.checked = true;
				Form.Port_Flag.value = "0";
				$('.tblMain').trigger('click');
				return;
			}else{
				Form.Port_Flag.value = "6";
				Form.IpMacType_Flag.value = "IpDown";
				setDisplay(divinfo,enableFilter);
			}
			Form.Actionflag.value = "Mod";
			btnSubmit();
			});
		}
		else
		{
			confirm("是否启用下行端口过滤？", function(ret){ if(!ret)
			{
				filter.checked = false;
				Form.Port_Flag.value = "0";
				$('.tblMain').trigger('click');
				return;
			}else{
				Form.Port_Flag.value = "6";
				Form.IpMacType_Flag.value = "IpDown";
				setDisplay(divinfo,enableFilter);
			}
			Form.Actionflag.value = "Mod";
			btnSubmit();
			});
		}
	}
	
}
function ChangeMode()
{
	var FilterMode = getElById("FilterMode");
	var isFilter = getElById("enblFilterOut");
	if (FilterMode[0].checked == true && stateUp)
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为黑名单？", function(ret){ if(ret)
		{
			stateUp = false;
			document.ConfigForm.PortListType_Up_Flag.value="black";
			document.ConfigForm.IpMacType_Flag.value = "IpUp";
			document.ConfigForm.Actionflag.value = "Mod";
			document.ConfigForm.Port_Flag.value = "3";
			document.ConfigForm.submit();
		}
		else
		{
			FilterMode[0].checked = false;
			FilterMode[1].checked = true;
			$('.tblMain').trigger('click');
			return;
		}});
	}
	else if (FilterMode[1].checked == true && !stateUp)
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为白名单？", function(ret){ if(ret)
		{
			stateUp = true;
			document.ConfigForm.PortListType_Up_Flag.value="white";
			document.ConfigForm.IpMacType_Flag.value = "IpUp";
			document.ConfigForm.Actionflag.value = "Mod";
			document.ConfigForm.Port_Flag.value = "3";
			document.ConfigForm.submit();
		}
		else
		{
			FilterMode[0].checked = true;
			FilterMode[1].checked = false;
			$('.tblMain').trigger('click');
			return;
		}});
	}
}

function ChangeModeDown()
{
	var FilterMode = getElById("FilterModeDown");
	var isFilter = getElById("enblFilterIn");
	if (FilterMode[0].checked == true && stateDown)
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为黑名单？", function(ret){ if(ret)
		{
			stateDown = false;
			document.ConfigForm.PortListType_Down_Flag.value="black";
			document.ConfigForm.IpMacType_Flag.value = "IpDown";
			document.ConfigForm.Actionflag.value = "Mod";
			document.ConfigForm.Port_Flag.value = "4";
			document.ConfigForm.submit();
		}
		else
		{
			FilterMode[0].checked = false;
			FilterMode[1].checked = true;
			$('.tblMain').trigger('click');
			return;
		}});
	}
	else if (FilterMode[1].checked == true && !stateDown)
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为白名单？", function(ret){ if(ret)
		{
			stateDown = true;
			document.ConfigForm.PortListType_Down_Flag.value="white";
			document.ConfigForm.IpMacType_Flag.value = "IpDown";
			document.ConfigForm.Actionflag.value = "Mod";
			document.ConfigForm.Port_Flag.value = "4";
			document.ConfigForm.submit();
		}
		else
		{
			FilterMode[0].checked = true;
			FilterMode[1].checked = false;
			$('.tblMain').trigger('click');
			return;
		}});
	}
}
</SCRIPT>
            				<FORM name="ConfigForm" action="/cgi-bin/sec-portfilter.asp" method="post">
            				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				              <TBODY>
				              <TR>
                                <td>
                                    <div class="form-text" style="display: inline-block;width: 174px;">配置上行的端口过滤规则</div></td>
                                    <td>
                          <input type="hidden" name="Port_Flag" value="0">
						  <input type="hidden" name="PortListType_Up_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","s") %>">
						  <input type="hidden" name="PortListType_Down_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","s") %>">
						  <input type="hidden" name="EnPortFilterOut_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActivePortOut","s") %>">
						  <input type="hidden" name="EnPortFilterIn_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActivePortIn","s") %>">
                          <input type="hidden" name="delnum" value="">
                          <input type="hidden" name="Actionflag" value="Mod">
						  <input type="hidden" name="IpMacType_Flag" value="IpUp">
                          <input type="hidden" name="ipup_num" value="<% tcWebApi_get("IpMacFilter","ipup_num","s") %>">
                          <input type="hidden" name="ipdown_num" value="<% tcWebApi_get("IpMacFilter","ipdown_num","s") %>"> 
                          <SCRIPT language=JavaScript src="/JS/printbox.js"></SCRIPT>
						  <script language="JavaScript" type="text/JavaScript">
function addClick(iType)
{
	var Form = document.ConfigForm;
	var FilterType;
	var typeFlag = '&typeFlag=';

	if(iType == 0)
	{
		FilterType = "40";
		if(parseInt(Form.ipup_num.value) >= 40)
		{
			alert("上行端口过滤规则数达到上限！");
			return false;
		}
		typeFlag += 'IpUp';
	}
	else
	{
		FilterType = "80";
		if(parseInt(Form.ipdown_num.value) >= 40)
		{
			alert("下行端口过滤规则数达到上限！");
			return false;
		}
		typeFlag += 'IpDown';
	}
	window.location = '/cgi-bin/sec-addportfilter.asp?PortFilterType='+FilterType+typeFlag;
}
function removeClick(iType)
{
	document.ConfigForm.Port_Flag.value = "2";
	if(0 == iType)
	{
		document.ConfigForm.IpMacType_Flag.value = "IpUp";
	}
	else
	{
		document.ConfigForm.IpMacType_Flag.value = "IpDown";
	}
	document.ConfigForm.Actionflag.value = "Del";
	document.ConfigForm.submit();
}
function	btnSubmit()
{
	var Form = document.ConfigForm;
	if(Form.enblFilterOut.checked)
	{
		Form.EnPortFilterOut_Flag.value = "1";
		if (Form.FilterMode[0].checked)
			Form.PortListType_Up_Flag.value = "black";
		else if (Form.FilterMode[1].checked)
			Form.PortListType_Up_Flag.value = "white";
	}
	else
	{
		Form.EnPortFilterOut_Flag.value = "0";
	}
	if(Form.enblFilterIn.checked)
	{
		Form.EnPortFilterIn_Flag.value = "1";
		if (Form.FilterModeDown[0].checked)
			Form.PortListType_Down_Flag.value = "black";
		else if (Form.FilterModeDown[1].checked)
			Form.PortListType_Down_Flag.value = "white";		
	}
	else
	{
		Form.EnPortFilterIn_Flag.value = "0";		
	}
	Form.submit();
}
function formatstr(sourcestr, searchstr)
{
	var restr;
	var offset = sourcestr.indexOf(searchstr);
	if(offset == -1)
		return null;
	var lenstr = searchstr.toString();	
	restr = sourcestr.substring(0, offset) + sourcestr.substring((offset+parseInt(lenstr.length)+1), sourcestr.length);
	return restr;
}
function doDelOut(i)
{
	var f = document.ConfigForm;
	var tempstr;
	var rmlout = document.getElementsByName('rmlout');
	if (rmlout == null)
		return;
	if(rmlout.length>0)
	{
		for(var n=0;n<(rmlout.length);n++)
		{
			if(rmlout[n].value == i){
				if(rmlout[n].checked)
				{
					tempstr = i + ",";
					f.delnum.value = f.delnum.value + tempstr;
					
				}
				else
				{
					f.delnum.value = formatstr(f.delnum.value,i);
				}
				break;
			}
		}
	}
}
function doDelIn(i)
{
	var f = document.ConfigForm;
	var tempstr;
	var rmlin = document.getElementsByName('rmlin');
	if (rmlin == null)
		return;
	if(rmlin.length>0)
	{
		for(var n=0;n<(rmlin.length);n++)
		{
			if(rmlin[n].value == i){
				if(rmlin[n].checked)
				{
					tempstr = i + ",";
					f.delnum.value = f.delnum.value + tempstr;
					
				}
				else
				{
					f.delnum.value = formatstr(f.delnum.value,i);
				}
				break;
			}
		}
	}
}
</script>
                    <INPUT class="input-onoff" id=enblFilterOut onclick="selFilter(this, 0,'FilterOutInfo')" type=checkbox name="enblFilterOut" <%if tcWebApi_get("IpMacFilter_Common","ActivePortOut","h") = "1" then asp_Write("checked") end if%>>
                    </td>
                </tr>
                </TBODY>
                </TABLE>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                          <td>
                  <DIV id=FilterOutInfo>
                      <div class="form-text" style="display: inline-block;width: 174px;margin-bottom: 32px;">过滤模式</div>
                      <INPUT id=FilterMode onclick="ChangeMode()" type=radio name="FilterMode" <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","h") = "black" then asp_Write("checked") end if%>> <span style="margin-right: 20px;">黑名单</span> 
				    <INPUT id=FilterMode onclick="ChangeMode()" type=radio name="FilterMode" <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","h") = "white" then asp_Write("checked") end if%>> <span>白名单</span> 
                    <SCRIPT language=JavaScript type=text/javascript>
                        setDisplay("FilterOutInfo",enblFilterOut);
                    </SCRIPT>
                            <% if tcWebApi_get("IpMacFilter_Common","ActivePortOut","h") = "1" then %>
					<div class="table-outer">
                        <table class="autoList tC">
                            <thead>
                                <tr class="trStyle2">
                                    <TD align="middle" class='tdWidth2'>过滤名称</TD>
                                    <TD align="middle" class='tdWidth2'>协议</TD>
                                    <TD align="middle" class='tdWidth2'>源地址</TD>
                                    <TD align="middle" class='tdWidth2'>源端口</TD>
                                    <TD align="middle" class='tdWidth2'>目的地址</TD>
                                    <TD align="middle" class='tdWidth2'>目的端口</TD>
                                    <TD align="middle" class='tdWidth2'>使能</TD>
                                    <TD align="middle" class='tdWidth2'>删除</TD>
                                </tr>
                            </thead>
                                <TBODY>
                                <SCRIPT language=JavaScript type=text/javascript>
                                                       
                                 var portOutvalue = '<% tcWebApi_JsonHook("get_portfilterOut_info", "action", "area") %>'
                                var rsp = JSON.parse(portOutvalue);
                                var portOut_list = rsp.data;
                                for(var i = 0; i < portOut_list.length; i++)
                                {
                                    if( portOut_list[i]['Protocol']== "All" || portOut_list[i]['Protocol']== "ALL" )
                                        portOut_list[i]['Protocol'] = "ANY";
                                    document.write('<TR align="center">');
                                    document.write('<TD align="center" style="word-break: break-word;">' + portOut_list[i]['IPName'] + '</TD>');
                                    document.write('<TD align="center">' + portOut_list[i]['Protocol'] + '</TD>');
                                    document.write('<TD align="center" style="line-height: 21px;"><div>' + portOut_list[i]['SrcIPAddr'] + '</div><div>' + portOut_list[i]['SrcIPMask'] + '</div></TD>');
                                    document.write('<TD align="center">' + portOut_list[i]['SrcPort'] + '</TD>');
                                    document.write('<TD align="center" style="line-height: 21px;">' + portOut_list[i]['DesIPAddr'] + '</div><div>' + portOut_list[i]['DesIPMask'] + '</div></TD>');
                                    document.write('<TD align="center">' + portOut_list[i]['DesPort'] + '</TD>');
                                    if(portOut_list[i]['Active'] == "Yes")
                                        document.write('<TD align="center">' + "启用" + '</TD>');
                                    else
                                        document.write('<TD align="center">' + "禁用" + '</TD>');
                                    document.write('<TD><input type="checkbox" id="rmlout" name="rmlout" onclick="doDelOut(' + portOut_list[i]['Index'] + ')" value="' + portOut_list[i]['Index'] + '"></TD>');
                                    document.write('</TR>');	
                                }			          
                        </SCRIPT>
                        </TBODY> 
                        </TABLE>
                    </div>  
<% end if %>
                    <P style="margin-top: 32px;margin-left: 182px;">
                        <INPUT id=btnAdd onclick="addClick(0)" style="width: 140px;" name="btnAddOut" type=button value="添 加"> 
                        <INPUT id=btnRemove onclick="removeClick(0)" style="width: 140px;margin-left: 48px;" name="btnRemoveOut" type=button value="删 除">
                    </P> 
                          </DIV>                            

                          <HR style="margin: 32px 0;">
                          <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                            <TBODY>
                            <TR>
                              <td>
                                  <div class="form-text" style="display: inline-block;width: 174px;">配置下行的端口过滤规则</div></td>
                                  <td>
                                      <INPUT class="input-onoff" id=enblFilterIn  onclick="selFilter(this, 1,'FilterInInfo')" type=checkbox name="enblFilterIn" <%if tcWebApi_get("IpMacFilter_Common","ActivePortIn","h") = "1" then asp_Write("checked") end if%>>
                                        </td>
                                        </TR>
                                        </TBODY>
                                        </TABLE>
                  <DIV id=FilterInInfo>
                    <div class="form-text" style="display: inline-block;width: 174px;margin-bottom: 32px;">过滤模式</div><INPUT id=FilterMode onclick="ChangeModeDown()" type=radio name="FilterModeDown" <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","h") = "black" then asp_Write("checked") end if%>> <span style="margin-right: 20px;">黑名单</span> 
				  <INPUT id=FilterMode onclick="ChangeModeDown()" type=radio name="FilterModeDown" <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","h") = "white" then asp_Write("checked") end if%>> <span>白名单</span> 
                  <SCRIPT language=JavaScript type=text/javascript>
					  setDisplay("FilterInInfo",enblFilterIn);
				  </SCRIPT>
<% if tcWebApi_get("IpMacFilter_Common","ActivePortIn","h") = "1" then %>
            <div class="table-outer">
				<table class="autoList tC">
                        <thead>
						<tr class="trStyle2">
                            <TD align="middle" class='tdWidth2'>过滤名称</TD>
                            <TD align="middle" class='tdWidth2'>协议</TD>
                            <TD align="middle" class='tdWidth2'>源地址</TD>
                            <TD align="middle" class='tdWidth2'>源端口</TD>
                            <TD align="middle" class='tdWidth2'>目的地址</TD>
                            <TD align="middle" class='tdWidth2'>目的端口</TD>
                            <TD align="middle" class='tdWidth2'>使能</TD>
                            <TD align="middle" class='tdWidth2'>删除</TD>
						</tr>
                    </thead>
                    <TBODY>
						<SCRIPT language=JavaScript type=text/javascript>
		                  		var portInvalue = '<% tcWebApi_JsonHook("get_portfilterIn_info", "action", "area") %>'
								var rsp = JSON.parse(portInvalue);
								var portIn_list = rsp.data;
								for(var i = 0; i < portIn_list.length; i++)
								{
                                    if( portIn_list[i]['Protocol']== "All" || portIn_list[i]['Protocol']== "ALL" )
                                        portIn_list[i]['Protocol'] = "ANY";
                                    document.write('<TR align="center">');
                                    document.write('<TD align="center" style="word-break: break-word;">' + portIn_list[i]['IPName'] + '</TD>');
                                    document.write('<TD align="center">' + portIn_list[i]['Protocol'] + '</TD>');
                                    document.write('<TD align="center" style="line-height: 21px;"><div>' + portIn_list[i]['SrcIPAddr'] + '</div><div>' + portIn_list[i]['SrcIPMask'] + '</div></TD>');
                                    document.write('<TD align="center">' + portIn_list[i]['SrcPort'] + '</TD>');
                                    document.write('<TD align="center" style="line-height: 21px;">' + portIn_list[i]['DesIPAddr'] + '</div><div>' + portIn_list[i]['DesIPMask'] + '</div></TD>');
                                    document.write('<TD align="center">' + portIn_list[i]['DesPort'] + '</TD>');
                                    if(portIn_list[i]['Active'] == "Yes")
                                        document.write('<TD align="center">' + "启用" + '</TD>');
                                    else
                                        document.write('<TD align="center">' + "禁用" + '</TD>');
                                    document.write('<TD><input type="checkbox" id="rmlout" name="rmlout" onclick="doDelOut(' + portIn_list[i]['Index'] + ')" value="' + portIn_list[i]['Index'] + '"></TD>');
                                    document.write('</TR>');	
								}
						</SCRIPT>
				</TBODY> 
			</TABLE>  
        </div>
<% end if %>
                            <P style="margin-top: 32px;margin-left: 182px;">
                                <INPUT id=btnAdd onclick="addClick(1)" style="width: 140px;" name="btnAddIn" type=button value="添 加">
                                <INPUT id=btnRemove onclick="removeClick(1)" style="width: 140px;margin-left: 48px;" name="btnRemoveIn" type=button value="删 除">
                            </P> 
                            </p>
                          </DIV>							
						  
                        </TD>
				              </TR>
				                      	<TR class="hide">
						          <TD colspan='2'>
						            <P align=center>
						                   <input type="button" id="btnOK" onclick="btnSubmit()" value="确定">
						                    
						                   <input type="button" id="btnCancel" name="btnCancel" onclick="RefreshPage()" value="取消"> 
						            </P>
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
