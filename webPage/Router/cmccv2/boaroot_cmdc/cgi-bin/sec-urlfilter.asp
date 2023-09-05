<%
if Request_Form("Save_Flag") = "1" then
	TCWebApi_set("UrlFilter_Common","Action","Actionflag")
	TCWebApi_set("WebCurSet_Entry","url_filter_id","add_num")
	TCWebApi_set("UrlFilter_Entry","Activate","EnableUrlFilterFlag")
	TCWebApi_set("UrlFilter_Entry","URL","urlitem")
	
	TCWebApi_commit("UrlFilter")
	TCWebApi_save()
elseif Request_Form("Save_Flag") ="2" then
	TCWebApi_set("UrlFilter_Common","Action","Actionflag")
	TCWebApi_set("UrlFilter_Common","Activate","EnableUrlFilterFlag")
    TCWebApi_set("UrlFilter_Common","Filter_Policy","FilterType")
	TCWebApi_commit("UrlFilter")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "3" then
	TCWebApi_set("UrlFilter_Common","Action","Actionflag")
	TCWebApi_set("UrlFilter_Common","DeleteIndex","delnum")
	TCWebApi_commit("UrlFilter")
	TCWebApi_save()
elseif Request_Form("Save_Flag") = "4" then
	TCWebApi_set("UrlFilter_Common","Action","Actionflag")
	TCWebApi_set("UrlFilter_Common","Filter_Policy","FilterPolicy")
	TCWebApi_commit("UrlFilter")
	TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>URL过滤</TITLE>
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
			<input id="Selected_Menu" type="hidden" value="安全->URL过滤" name="Selected_Menu">
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
				<TD id=MenuArea_L2>
					<ul class="TRD">
					<li class="TSD">URL过滤</li>
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
                                    <div class="advanceTitle">URL过滤</div>
                                </TD>
                            </TR>
                            <tr>
                                <td>
                                <div class="advanceTips">
                                    <span onclick="showHelp()">页面帮助</span>
                                </div>
                                <div class="helpDesc" style="display: none;">
                                    <ul>
                                        <li>设置URL过滤模式以及过滤名单，可设置100条。</li>
                                        <li>单击“添加”按钮增加一条URL到对应的URL列表；单击“删除”按钮删除一条URL。</li>
                                        <li>URL不要带http://或https://前缀，URL长度不能超过63个字符。</li>
                                    </ul>
                                </div>
                            </td>
                            </tr>
                            <TR>
                                <TD>
                                    <div class="title-line"></div>
                                </TD>
                            </TR>
             		<TR>
            			<TD width=7 background=/img/panel3.gif>　</TD>
            			<TD valign="top">
            				<FORM name="UrlFilterForm" action="/cgi-bin/sec-urlfilter.asp" method="post">
            				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="margin-top: -40px;">
				              <TBODY>
				              <TR>
				              	<TD> 
                            <input type="hidden" name="Save_Flag" value="0">
                            <input type="hidden" name="Actionflag" value="Del">
                            <input type="hidden" name="EnableUrlFilterFlag" value="<% tcWebApi_get("UrlFilter_Common","Activate","s") %>">
                            <input type="hidden" name="FilterType" value="0">
                            <input type="hidden" name="delnum" value="">
                            <input type="hidden" name="add_num" value="<% tcWebApi_get("UrlFilter","add_num","s") %>">
                            <input type="hidden" name="Url_num" value="<% tcWebApi_get("UrlFilter","Url_num","s") %>">
                            <script language="JavaScript" type="text/JavaScript">
var urlfltpolicy = "<% tcWebApi_get("UrlFilter_Common","Filter_Policy","s") %>";
var enbl = "<% tcWebApi_get("UrlFilter_Common","Activate","s") %>";
var urllistIndex = 0;
var urllist = new Array();
var state = enbl;
function isValidUrlName(url)
{
var i=0;
var invalidArray = new Array();
invalidArray[i++] = "www";
invalidArray[i++] = "com";
invalidArray[i++] = "org";
invalidArray[i++] = "net";
invalidArray[i++] = "edu";
invalidArray[i++] = "www.";
invalidArray[i++] = ".com";
invalidArray[i++] = ".org";
invalidArray[i++] = ".net";
invalidArray[i++] = ".edu";
if (isValidAscii(url) != '')
{
return false;
}
for (i = 0; i < url.length; i++)
{
if (url.charAt(i) == '\\')
{
return false;
}
}
if (url == "")
{
return false;
}
if (url.length < 3)
{
return false;
}
for(j=0; j< invalidArray.length; j++)
{
if (url == invalidArray[j])
{
return false;
}
}
return true;
}
function btnAdd()
{
//var SubmitForm = new webSubmitForm();
	with ( document.forms[0] )
	{
		if(Url_num.value >= 100)
		{
			alert("最多能设置100条记录!")
			return;
		}
		if (urlitem.value.length > 63)
		{
			alert("URL长度不能超过63个字符!")
			return;
		}
		if(isValidUrlName(urlitem.value) == false)
		{
			alert("非法的URL格式，请重新输入.")
			return;
		}
		var str = urlitem.value;
		var i;
		if (-1 != (i = str.indexOf("http")))
		{
			if(-1 != str.indexOf("https"))
				str = str.substring(i+8);
			else str = str.substring(i+7);
		}
		var patt = new RegExp("^[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\\.?$");
		if(false == patt.test(str))
		{
			alert("非法的URL格式，请重新输入.")
			return;
		}	
		urlitem.value = str;
		for(k = 0; k < urllistIndex; k++)
		{
			if(urllist[k].UrlPath.toLowerCase() == str.toLowerCase())
			{
				alert("相同的URL过滤规则已存在！");
				return;
			}
		}
//SubmitForm.addParameter('x.Url',str);
		
	}
//SubmitForm.setAction('addcfg.cgi?x=InternetGatewayDevice.X_ATP_Security.UrlFilter&'
//+ 'RequestFile=html/security/urlfilter.asp');
//SubmitForm.submit();
	var	vForm = document.forms[0];
	vForm.Actionflag.value = "Add";
	vForm.Save_Flag.value = "1";
	vForm.submit();
}
function btnRemove(rml)
{
	/*if (rml == null)
	{
		alert("rml is null")
		return;
	}
	//var SubmitForm = new webSubmitForm();
	with (document.forms[0])
	{
		if (rml.length > 0)
		{
			var i;
			for (i = 0; i < rml.length; i++)
			{
				if (rml[i].checked == true)
				{
					//SubmitForm.addParameter(rml[i].value,'');
					curUrlfilter.value = rml[i].value - 1;
				}
			}
		}
		else if (rml.checked == true)
		{
			//SubmitForm.addParameter(rml.value,'');
			curUrlfilter.value = rml[i].value - 1;
		}
	}*/
	//SubmitForm.setAction('del.cgi?RequestFile=html/security/urlfilter.asp');
	//SubmitForm.submit();
	
	document.UrlFilterForm.Actionflag.value = "Del";
	document.UrlFilterForm.Save_Flag.value = "3";
	document.UrlFilterForm.submit();
}
function LoadFrame()
{
	var vForm = document.UrlFilterForm;
	vForm.Save_Flag.value = "0";
	vForm.delnum.value = "";
	setCheck('enableFilter',enbl);
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
//setRadio('FilterPolicy',urlfltpolicy);
}
function SubmitForm()
{
/*var SubmitForm = new webSubmitForm();
if (state == "0" && getCheckVal("enableFilter") == 1)
{
SubmitForm.addParameter('InternetGatewayDevice.X_ATP_Security.X_ATP_UrlFilterEnabled',1);
}
if (state == "1" && getCheckVal("enableFilter") == 0)
{
SubmitForm.addParameter('InternetGatewayDevice.X_ATP_Security.X_ATP_UrlFilterEnabled',0);
}
SubmitForm.setAction('set.cgi?RequestFile=html/security/urlfilter.asp');
SubmitForm.submit();*/
	var vForm = document.UrlFilterForm;
	vForm.Save_Flag.value = "2";
	document.UrlFilterForm.Actionflag.value = "Status";
	if(vForm.enableFilter.checked)
		vForm.EnableUrlFilterFlag.value = "1";
	else vForm.EnableUrlFilterFlag.value = "0";
	vForm.submit();
	
}
function cliEnableBox(checkBox)
{
	if (checkBox.checked == true)
	{
		//if (document.UrlFilterForm.EnableUrlFilterFlag.value == "1")
			//setDisplay("Filter",1);
			confirm("是否启用URL过滤？", function(ret){ if(!ret) 
                {
                    enableFilter.checked = false;
                    $('.tblMain').trigger('click');
                    return;
                }
                else{
                    if (document.UrlFilterForm.EnableUrlFilterFlag.value == "1")
                        setDisplay("Filter",1);
                }
                SubmitForm();
			});		
	}
	else
	{
		//setDisplay("Filter",0);
		confirm("是否关闭URL过滤？", function(ret){ if(!ret) 
			{
                enableFilter.checked = true;
				$('.tblMain').trigger('click');
				return;
			}else{
				setDisplay("Filter",0);
			}
			SubmitForm();
			});			
	}
}
function ChangePolicy()
{
	if (urlfltpolicy == getRadioVal('FilterPolicy'))
		return;
	//var Form = new webSubmitForm();
	var FilterMode = getElById("FilterPolicy");
	if (FilterMode[0].checked == true)
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为黑名单？", function(ret){ if(ret) 
		{
			//state = false;
			//Form.addParameter('InternetGatewayDevice.X_ATP_Security.X_ATP_UrlFilterPolicy',0);
				document.UrlFilterForm.Actionflag.value = "Filter";
				document.UrlFilterForm.Save_Flag.value = "4";
				document.UrlFilterForm.submit();
		}
		else
		{
			FilterMode[0].checked = false;
			FilterMode[1].checked = true;
			$('.tblMain').trigger('click');
			return;
		}});
	}
	else if (FilterMode[1].checked == true )
	{
		confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为白名单？", function(ret){ if(ret) 
		{
			//state = true;
			//Form.addParameter('InternetGatewayDevice.X_ATP_Security.X_ATP_UrlFilterPolicy',1);
				document.UrlFilterForm.Actionflag.value = "Filter";
				document.UrlFilterForm.Save_Flag.value = "4";
				document.UrlFilterForm.submit();
		}
		else
		{
			FilterMode[0].checked = true;
			FilterMode[1].checked = false;
			$('.tblMain').trigger('click');
			return;
		}});
	}
	//Form.setAction('set.cgi?RequestFile=html/security/urlfilter.asp');
	//Form.submit();
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
function doDel(i)
{
	var f = document.UrlFilterForm;
	var tempstr;
	var rml = document.getElementsByName('rml');
	if (rml == null)
		return;
	if(rml.length>0)
	{
		for(var n=0;n<(rml.length);n++)
		{
			if(rml[n].value == i){
				if(rml[n].checked)
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
function stUrlFilter(domain,UrlPath)
{
this.domain = domain;
this.UrlPath = UrlPath;
}

							</script>
                            </TD>
                            </TR>
                            </TBODY>
                            </TABLE>
                          <TABLE>
                    <TBODY>
                    <TR>
                        <td><div class="form-text">URL过滤</div></td>
                      <TD>
                          <INPUT class="input-onoff" id=enableFilter onclick="cliEnableBox(this)" type=checkbox name="enableFilter" <%if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then asp_Write("checked") end if%>>
                        </TD></TR></TBODY></TABLE>
                        <DIV id=Filter>
                  <SCRIPT language=JavaScript type=text/javascript>
                    setDisplay('Filter',enbl);
                    if(urlfltpolicy == "0")
                    {
                    document.write('<div class="form-text" style="display: inline-block;width: 174px;">当前的过滤列表为</div>黑名单\n');
                    }
                    else if(urlfltpolicy == "1")
                    {
                    document.write('<div class="form-text" style="display: inline-block;width: 174px;">当前的过滤列表为</div>白名单\n');
                    }
                </SCRIPT>
                <div>
                <div class="form-text" style="display: inline-block;width: 174px;">过滤模式</div><INPUT id=FilterPolicy onclick="ChangePolicy()" type=radio value="0" name="FilterPolicy" <%if tcWebApi_get("UrlFilter_Common","Filter_Policy","h") = "0" then asp_Write("checked")  end if%>> <span style="margin-right: 20px;">黑名单</span>
				  <INPUT id=FilterPolicy onclick="ChangePolicy()" type=radio value="1" name="FilterPolicy" <%if tcWebApi_get("UrlFilter_Common","Filter_Policy","h") = "1" then asp_Write("checked") end if%>> <span>白名单</span>
                        </DIV>
                  <DIV id=dnsdomain>
                      <div class="form-text" style="display: inline-block;width: 174px;">URL</div>
					<INPUT onkeydown="if(event.keyCode==13)return false" maxLength=31 size=30 name="urlitem"> 
                  </DIV>
					<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
                  <DIV id=ddnsInfo>
				  <iframe id="urlfilterlist" src="/cgi-bin/sec_urlfilterlist.cgi" frameborder="0" width="100%"></iframe>
				  <table>
						<tr>
							<td class="table-outer" style = "display:none">
								<table width="100%" name="tblURLList" class="tblList">
									<tr class="trStyle2">
										<TD class="tdWidth2" style="width: 20%!important;">序号</TD>
										<TD class="tdWidth2" style="width: 60%!important;">URL</TD>
										<TD class="tdWidth2" style="width: 20%!important;">删除</TD>
									</tr>
									<SCRIPT language=JavaScript type=text/javascript>
										var urlValue = '<% tcWebApi_JsonHook("get_urlfilter_info", "action", "area") %>';
										var rsp = JSON.parse(urlValue);
										var url_list = rsp.data;
										for(var i = 0; i < url_list.length; i++)
										{
											document.write('<TR class="trStyle3">');
											document.write('<TD class="tdWidth3" style="width: 20%!important;">');
                                            document.write(parseInt(i + 1));
											document.write('</TD><TD class="tdWidth3" style="width: 60%!important;">' + url_list[i]['URL'] + '&nbsp;</TD>');
											document.write('<TD class="tdWidth3" style="width: 20%!important;"><input type="checkbox" id="rml" name="rml" onclick="doDel(' + url_list[i]['Index'] + ')" value="' + url_list[i]['Index'] + '"></TD>');
											document.write('</TR>');
											urllist[urllistIndex] = new stUrlFilter("domain", url_list[i]['URL']);
											urllistIndex = urllistIndex + 1;
										}
										
									</SCRIPT>
								</table>
							</td>
						</tr>
                  </DIV>
					<% end if %>
                    <P style="margin: 32px 0 32px 182px;">
                        <INPUT onclick="btnAdd()" style="width: 140px;" id=buttonAdd name=buttonAdd type=button value=" 添 加 ">
                        <INPUT onclick='btnRemove(this.form.rml)' id=buttonDel name=buttonDel style="margin-left: 24px;width: 140px;" type=button value=" 删 除 ">
                    </P> 
                  </DIV>
				  </table>
                  </TD>
				              </TR>
							  <TR class="hide">
								  <TD colspan='2'>
									  <P align=center>
										  <INPUT id="btnOK" name="btnOK" onclick="SubmitForm();" type="button" value="确定">
										  <INPUT id="btnCancel" name="btnCancel" onclick="RefreshPage();" type="button" value="取消"> 
									  </P>
								  </TD>
							  </TR>
            				 </TBODY>
										</TABLE>
            				</FORM>
            			</TD>
            		</TR>
             </TBODY>
						</TABLE>
                    </FORM>
                    </TD>	
        	</TR>
        </TBODY>
			</TABLE>
    </TD>
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
