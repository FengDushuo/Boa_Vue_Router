
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>�������</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<style type='text/css'>
.cus_help {
	width:150px;	
}
</style>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
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
                <TD class="td_model" align=left>
                		<span>�ͺ�: </span> 
                		<span> 
                			<SCRIPT language=javascript> document.write(top.ModelName); </SCRIPT>
                		</span>
                </TD>
                <TD class=welcom>
                    <span>���ã�</span>
                    <a onclick=DoLogout() href="/cgi-bin/logout.cgi">
                    <span>������ҳ</span>
                    </a>
                  	<INPUT id=Selected_Menu type=hidden value="����->�������" name=Selected_Menu></TD>
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
		<SCRIPT language=JavaScript type=text/javascript>
			var cfg_menu_list  = new Array( '�������' , 'AP����');
			var cfg_cookie_name = 'net-wanset-menu';
			init_l_menu();
			
			function LoadFrame()
			{
				linkModeSelect();
				doDNSModeChange();
				var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
				set_action(query_string);
			}
			function linkModeSelect()
			{
				with (getElById('ConfigForm'))
				{
					if (getSelectVal('linkMode') == 'linkIP')
					{
						setDisplay("secDHCPItems", 1);
						setDisplay("secPPPoEItems1", 0);
						setDisplay("secPPPoEItems2", 0);
						setDisplay("secPPPoEItems3", 0);
						setDisplay("secPPPoEItems4", 0);
						setDisplay("secPPPoEItems5", 0);
						alert("linkIP");
					}
					else
					{
						setDisplay("secDHCPItems", 0);
						setDisplay("secPPPoEItems1", 1);
						setDisplay("secPPPoEItems2", 1);
						setDisplay("secPPPoEItems3", 1);
						setDisplay("secPPPoEItems4", 1);
						setDisplay("secPPPoEItems5", 1);
						alert("linkPPP");
					}
				}
			}

			function linkTypeSelect()
			{
				with (getElById('ConfigForm'))
				{
					if (getSelectVal('linkType') == 'LinkContinuity')
					{
						alert("LinkContinuity");
					}
					else
					{
						alert("LinkDiscontinuous");
					}
				}
			}

			function doDNSModeChange()
			{
				if((document.ConfigForm.DSNMode_Selection[0].checked == false) && (document.ConfigForm.DSNMode_Selection[1].checked == false))
				{
					document.ConfigForm.DSNMode_Selection[0].checked = true;
				}
				alert("DNS Change");
			}
			
			function APClickEnble()
			{
				alert("AP change");
			}

		</SCRIPT>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
			<TBODY>
				<TR>
					<TD class="Item_T" rowspan="2">
						<ul class="TRD">
							<li name="InternetSetting" id="�������">�������</li>
							<li name="APSetting" id="AP����">AP����</li>
						</ul>					
					</TD>
					<TD class='w-828'>
					    <TABLE cellSpacing=0 cellPadding=0 border=0 height='100%'>
					      <TBODY>
						      <TR>
						  			<TD width=7 background=/img/panel3.gif>��</TD>
							  	  	<TD vAlign=top>
							  	  		<FORM name=ConfigForm action="/cgi-bin/net-wanset.asp" method="post">
							  	  			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							  	    			<TBODY>
								  	    			<TR>
								  	    				<TD width=10>&nbsp;</TD>
									  	      			<TD>
															<DIV style="display:none;" id="�������_item">
															<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
																<TBODY>
																<TR>
																	<TD width=150>WAN�������ͣ�</TD>
																	<TD>
																		<LABEL> 
																			<SELECT id=linkMode onchange=linkModeSelect() name="linkMode">
																				<OPTION value="linkIP" >DHCP�Զ���ȡ
																				<OPTION value="linkPPP" >PPPoE
																			</SELECT>
																		</LABEL>
																	</TD>
																</TR>
																<TR id=secDHCPItems style="display: none">
																	<TD width=150>�������ƣ�</TD>
																	<TD>
																		<LABEL>
																			<INPUT id=HostName class='input_s1' maxLength=63 size=15 name=HostName value=""> 
																		</LABEL>
																	</TD>
																</TR>
																<TR id=secPPPoEItems1 style="display: none">
																	<TD width=150>�û�����</TD>
																	<TD>
																		<LABEL>
																			<INPUT id=pppUserName class='input_s1' maxLength=63 size=15 name=pppUserName value=""> 
																		</LABEL>
																	</TD>
																</TR>
																<TR id=secPPPoEItems2 style="display: none">
																	<TD>���룺</TD>
																	<TD>
																		<LABEL> 
																			<INPUT id=pppPassword class='input_s1' type=password maxLength=63 size=15 name=pppPassword value="">
																		</LABEL>
																	</TD>
																</TR>
																<TR id=secPPPoEItems3 style="display: none">
																	<TD>��������(AC)��</TD>
																	<TD>
																		<LABEL> 
																			<INPUT id=pppPassword class='input_s1' maxLength=63 size=15 name=pppPassword value="">
																		</LABEL>
																	</TD>
																</TR>
																<TR id=secPPPoEItems4 style="display: none">
																	<TD>����ʱ�䣺</TD>
																	<TD>
																		<LABEL> 
																			<SELECT id=linkType onchange=linkTypeSelect() name="linkType">
																				<OPTION value="LinkContinuity" >����
																				<OPTION value="LinkDiscontinuous" >������
																			</SELECT>
																		</LABEL>
																		<INPUT id=btnContinuityCnt name=btnContinuityCnt type=button value="����"> 
																		<INPUT id=btnDiscontinuousCnt name=btnDiscontinuousCnt type=button value="�Ͽ�����"> 
																	</TD>
																</TR>
																<TR id=secPPPoEItems5 style="display: none">
																	<TD>����ʱ�䣺</TD>
																	<TD>
																		<LABEL> 
																			<INPUT id=FreeTime class='input_s1' maxLength=63 size=15 name=FreeTime value="">
																		</LABEL>
																	</TD>
																</TR>
																<TR>
																	<TD>MTU���ȣ�</TD>
																	<TD>
																		<LABEL> 
																			<INPUT id=MTULenth class='input_s1' maxLength=63 size=15 name=MTULenth value="1500">(1280-1500)�ֽ�
																		</LABEL>
																	</TD>
																</TR>
																<TR>
																	<TD>DNSģʽ:</TD>
																	<TD>
																		<INPUT name="DSNMode_Selection" onclick=doDNSModeChange() type="radio" value="0">�Զ���ȡDNS
																		<INPUT name="DSNMode_Selection" onclick=doDNSModeChange() type="radio" value="1">�ֶ�����DNS
																	</TD>
																</TR>	
																<TR>
																	<TD>��¡MAC��ַ��</TD>
																	<TD>
																		<LABEL> 
																			<INPUT id=MACAdress class='input_s1' maxLength=63 size=15 name=MACAdress value="00:00:00:00:00">
																		</LABEL>
																		<INPUT id=btnCloneMACCnt name=btnCloneMACCnt type=button value="��¡MAC"> 
																		<INPUT id=btnRestoreMACCnt name=btnRestoreMACCnt type=button value="�ָ�Ĭ��MAC"> 
																	</TD>
																</TR>
																<TR>
																	<TD colspan="2">��ʾ:���ú�,�豸�����Զ��л���WAN����ģʽ��</TD>
																</TR>
																</TBODY>
															</TABLE>
															</DIV>
															<DIV style="display:none;" id="AP����_item">
															<TABLE cellSpacing=0 celladding=0 width="100%" border=0>
																<TBODY>
																<TR>
																	<TD><INPUT onclick=APClickEnble() type=checkbox value=ON name=wlEnbl>����APģʽ</TD>
																	<TD>���ú�,�豸���Զ��л���APģʽ,����һ�����ߵ����ж˿�,<BR>����ʵ��LAN��������</TD>
																</TR>
																</TBODY>
															</TABLE>
															</DIV>
									  	      			</TD>
									  	      		</TR>
								  	      		</TBODY>
								  	      	</TABLE>
								  	      </FORM>
							  	    </TD>
						  	  </TR>
					  	  <tr>
					  	  	<td colspan="2">
					  	  		<P align=center>
								<INPUT id=btnSave name=btnSave type=button value="����"> 
					  	  		&nbsp;&nbsp;
								<INPUT id=btnOKApply name=btnOKApply type=button value="����/Ӧ��"> 
					  	  		&nbsp;&nbsp;
								<INPUT id=btnConcel name=btnConcel type=button value="����"> 
					  	  		</P>
					  	  	</td>
					  	  </tr>
					  		</TBODY>
					  	</TABLE>
				  	</TD>
				</TR>
			</TBODY>
		</TABLE>
    </TD>
   </TR>

       </TBODY>
   </TABLE>

</BODY>
</HTML>

