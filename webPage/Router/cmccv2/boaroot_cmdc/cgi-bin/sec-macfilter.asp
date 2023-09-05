<%
if Request_Form("Mac_Flag") = "3" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","DeleteIndex","delnum")
	TCWebApi_set("IpMacFilter_Common","DelOnly","DelOnlyFlag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Mac_Flag") ="2" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ActiveMac","EnMacFilter_Flag")
	TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()
elseif Request_Form("Mac_Flag") ="4" then
	TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
	TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
	TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
	TCWebApi_commit("IpMacFilter_Entry")
	TCWebApi_save()	
end if	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>MAC过滤</TITLE>
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
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                            <TBODY>
                                <TR>
                                    <TD>
                                        <div class="advanceTitle">MAC过滤</div>
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
            				<FORM name="ConfigForm" action="/cgi-bin/sec-macfilter.asp" method="post">
            				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				              <TBODY>
				              <TR>
                                    <td>
                                        <div class="form-text" style="display: inline-block;width: 174px;">MAC过滤开关</div></td>
                                        <td>
                                        <INPUT class="input-onoff" id=isFilter onclick="selFilter(this)" type="checkbox" name="isFilter" <%if tcWebApi_get("IpMacFilter_Common","ActiveMac","h") = "1" then asp_Write("checked") end if%>></P>
                                        <input type="hidden" name="ListType_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>">
                                        <input type="hidden" name="Mac_Flag" value="0">
                                        <input type="hidden" name="delnum" value="">
                                        <input type="hidden" name="EnMacFilter_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s") %>">
                                        <input type="hidden" name="mac_num" value="<% tcWebApi_get("IpMacFilter","mac_num","s") %>">
                                        <input type="hidden" name="Actionflag" value="Del">
                                        <input type="hidden" name="IpMacType_Flag" value="Mac">
                                        <input type="hidden" name="DelOnlyFlag" value="Yes">
                                        <script language="JavaScript" type="text/JavaScript">
                                        var enableFilter = "<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s") %>";
                                        console.log(enableFilter)
                                        var Mode = "<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>";
                                        var state;
                                        function stMacFilter(domain,Name,MACAddress,Enable)
                                        {
                                        this.domain = domain;
                                        this.Name = Name;
                                        this.MACAddress = MACAddress;
                                        this.Enable = Enable;
                                        }
                                        var MacFilter = new Array(null);

                                        function addClick()
                                        {
                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                            if(parseInt(document.ConfigForm.mac_num.value) >= 40)
                                        <% else %>
                                            if(parseInt(document.ConfigForm.mac_num.value) >= 32)
                                        <% end if %>
                                            {
                                        <% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") <> "Yes" then %>
                                                alert('最大可存储40条MAC过滤规则!')
                                        <% else %>
                                                alert('最大可存储32条MAC过滤规则!')
                                        <% end if %>
                                                return;
                                            }
                                            location.replace('sec-addmacfilter.asp');
                                        }
                                        function removeClick(rml)
                                        {
                                            document.ConfigForm.Actionflag.value = "Del";
                                            document.ConfigForm.Mac_Flag.value = "3";
                                            document.ConfigForm.submit();
                                        /*if (rml == null)
                                        return;
                                        var Form = new webSubmitForm();
                                        var k;
                                        if (rml.length > 0)
                                        {
                                        for (k = 0; k < rml.length; k++)
                                        {
                                        if ( rml[k].checked == true )
                                        {
                                        Form.addParameter(rml[k].value,'');
                                        }
                                        }
                                        }
                                        else if ( rml.checked == true )
                                        {
                                        Form.addParameter(rml.value,'');
                                        }
                                        Form.setAction('del.cgi?RequestFile=html/security/macfilter.asp');
                                        Form.submit();*/
                                        }
                                        function LoadFrame()
                                        {
                                            document.ConfigForm.delnum.value = "";
                                            document.ConfigForm.Mac_Flag.value = "0";
                                            if (enableFilter != 1)
                                        {
                                        getElById("FilterInfo").style.display = "none";
                                        }
                                        var FilterMode = getElById("FilterMode");
                                        var FilterInfo = getElById("FilterInfo");
                                        if (Mode == "Black")
                                        {
                                        FilterMode[0].checked = true;
                                        state = false;
                                        }
                                        else
                                        {
                                        FilterMode[1].checked = true;
                                        state = true;
                                        }
                                        if (enableFilter == 1)
                                        {
                                        var FilterOption = getElById("isFilter");
                                        FilterOption.checked = true;
                                        }
										var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
										set_action(query_string);
                                        }
                                        function selFilter(filter)
                                        {
                                            if (filter.checked)
                                            {
                                                confirm("是否开启MAC过滤？", function(ret){ if(!ret) 
                                                    {
                                                        filter.checked = false;
                                                        $('.tblMain').trigger('click');
                                                        return;
                                                    }else{
                                                        getElement('FilterInfo').style.display = "";
                                                        if (enableFilter != 1)
                                                        {
                                                            with (getElById('ConfigForm'))
                                                            {
                                                            btnAdd.disabled = true;
                                                            btnRemove.disabled = true;
                                                            FilterMode[0].disabled = true;
                                                            FilterMode[1].disabled = true;
                                                            }
                                                        }
                                                    }
                                                    SubmitForm();
                                                    });
                                            }
                                            else
                                            {
                                                confirm("是否禁用MAC过滤？", function(ret){ if(!ret) 
                                                    {
                                                        filter.checked = true;
                                                        $('.tblMain').trigger('click');
                                                        return;
                                                    }else{
                                                        FilterInfo.style.display = "none";
                                                    }
                                                    SubmitForm();
                                                    });
                                            }
                                        }
                                        function ChangeMode()
                                        {
                                            //var Form = new webSubmitForm();
                                            var	Form = document.ConfigForm;
                                            var FilterMode = getElById("FilterMode");
                                            var isFilter = getElById("isFilter");
                                            if (FilterMode[0].checked == true && state)
                                            {
                                                confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为黑名单？", function(ret){ if(ret)
                                                {
                                                    state = false;
                                                    Form.ListType_Flag.value = "Black";
                                                    Form.Mac_Flag.value = "4";
                                                    Form.Actionflag.value = "Mod";
                                                    Form.submit();
                                                //Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',0);
                                                }
                                                else
                                                {
                                                    FilterMode[0].checked = false;
                                                    FilterMode[1].checked = true;
                                                    $('.tblMain').trigger('click');
                                                    return;
                                                }});
                                            }
                                            else if (FilterMode[1].checked == true && !state)
                                            {
                                                confirm("改变过滤模式将切换所有过滤规则，您是否真的要改变过滤模式为白名单？", function(ret){ if(ret)
                                                {
                                                    state = true;
                                                    Form.ListType_Flag.value = "White";
                                                    Form.Mac_Flag.value = "4";
                                                    Form.Actionflag.value = "Mod";
                                                    Form.submit();
                                                    //Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',1);
                                                }
                                                else
                                                {
                                                    FilterMode[0].checked = true;
                                                    FilterMode[1].checked = false;
                                                    $('.tblMain').trigger('click');
                                                    return;
                                                }});
                                            }
                                            //Form.setAction('set.cgi?RequestFile=html/security/macfilter.asp');
                                            //Form.submit();
                                        }
                                        function SubmitForm()
                                        {
                                            var FilterMode = getElById("FilterMode");
                                            if (
                                            (Mode !== "Black" && FilterMode[0].checked == true) ||
                                            (Mode === "Black" && FilterMode[1].checked == true)
                                            ){
                                                ChangeMode();
                                            } else {
                                                var Form = document.ConfigForm;
                                                Form.Actionflag.value = "Add";
                                                Form.Mac_Flag.value = "2";
                                                if(Form.isFilter.checked)
                                                    Form.EnMacFilter_Flag.value = "1";
                                                else Form.EnMacFilter_Flag.value = "0";
                                                
                                                if(Form.ListType_Flag.value == "N/A" || Form.ListType_Flag.value == "" || Form.ListType_Flag.value == "undefined")
                                                    Form.ListType_Flag.value = "Black"
                                                Form.submit();
                                            }
                                        /*var Form = new webSubmitForm();
                                        Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterRight',getCheckVal('isFilter'));
                                        Form.addParameter('InternetGatewayDevice.X_ATP_Security.MacFilterPolicy',getRadioVal('FilterMode'));
                                        Form.setAction('set.cgi?RequestFile=html/security/macfilter.asp');
                                        Form.submit();*/
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
                                            var f = document.ConfigForm;
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
                                        </script>
                                    </td>
                                </tr>
                            </TBODY>
                            </TABLE>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                    <td>
                            <DIV id=FilterInfo>
                                <div class="form-text" style="display: inline-block;width: 174px;margin-bottom: 32px;">过滤模式</div><INPUT id=FilterMode onclick="ChangeMode()" type="radio" value="0" name="FilterMode" <%if tcWebApi_get("IpMacFilter_Common","ListTypeMac","h") = "Black" then asp_Write("checked")  end if%>> <span style="margin-right: 20px;">黑名单</span>
                            <INPUT id=FilterMode onclick="ChangeMode()" type="radio" value="1" name="FilterMode" <%if tcWebApi_get("IpMacFilter_Common","ListTypeMac","h") = "White" then asp_Write("checked")  end if%>> <span>白名单</span> 
									<TABLE>
										<TR>
											<TD align="left" class="table-outer">
												<TABLE class="tblList2 autoList">
                                                    <thead>
                                                        <TR class="trStyle2">
                                                            <TD class="tdWidth2" width="25%">过滤规则名称</TD>
                                                            <TD class="tdWidth2" width="35%">MAC地址</TD>
                                                            <TD class="tdWidth2" width="20%">使能</TD>
                                                            <TD class="tdWidth2" width="20%">删除</TD>
                                                        </TR>
                                                    </thead>
                                                <tbody>
                                                <SCRIPT language=JavaScript type=text/javascript>
                                                    var macvalue = '<% tcWebApi_JsonHook("get_macfilter_info", "action", "area") %>'
			                  		
														var rsp = JSON.parse(macvalue);
														var mac_list = rsp.data;
														for(var i = 0; i < mac_list.length; i++)
														{
															document.write('<TR align="center">');
															document.write('<TD align="center" width="25%">' + mac_list[i]['MacName'] + '&nbsp;</TD>');
															document.write('<TD align="center" width="35%">' + mac_list[i]['MacAddr'] + '&nbsp;</TD>');
															if(mac_list[i]['Active'] == "Yes")
																document.write('<TD align="center" width="20%">' + "启用" + '&nbsp;</TD>');
															else
																document.write('<TD align="center" width="20%">' + "禁用" + '&nbsp;</TD>');
															document.write('<TD width="20%"><input type="checkbox" id="rml" name="rml" onclick="doDel(' + mac_list[i]['Index'] + ')" value="' + mac_list[i]['Index'] + '"></TD>');
															document.write('</TR>');	
														}
			                  	                </SCRIPT>
                                            </tbody>
                  			            </TABLE>
											</TD>	
										</TR>
										<TR>
											<TD align="left">
                                                <P style="margin-top: 32px;margin-left: 182px;">
                                                    <INPUT class="BtnAdd" id=btnAdd onclick="addClick()" type=button value="添 加"> 
                                                    <INPUT class="BtnAdd" id=btnRemove style="margin-left: 24px;" onclick="removeClick(this.form.rml)" type=button value="删 除">
                                                </P> 
											</TD>		
										</TR>
								</TABLE>  
                  </DIV>
                </TD>
				              </TR>
				                      	<TR class="hide">
						          <TD colspan='2'>
						            <P align=center>
						                   <input type="button" id="btnOK" onclick="SubmitForm()" value="确定">
						                    &nbsp;&nbsp;
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
