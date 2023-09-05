<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>VERSION</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<div class="header">
	<div class="logo_img"></div>
	<div class="in_line"></div>
	<div class="in_device">
		<span class="td_model">
			<SCRIPT language=javascript> 
				document.write("<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s") %>"); 
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
		<input id="Selected_Menu" type="hidden" value="" name="Selected_Menu">
	</div>
</div>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 class="major">
  <TBODY>
  <TR>
		<TD class="header">
		  <TABLE cellSpacing=0 cellPadding=0 border=0 id=table2>
		    <TBODY>
		      <TR>
		        <TD id=MenuArea_L1>&nbsp;</TD>
		      </TR>
		    </TBODY>
		  </TABLE>
    </TD>
   </TR>
   
  <TR>
    <TD class="content">
<SCRIPT language=JavaScript type=text/javascript>
function LoadFrame()
{
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}
</SCRIPT>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
       <TBODY>
        <TR height="10">
         <TD id="MenuArea_L2">
           <ul class="TRD"><li class="TSD">研发版本信息</li></ul>
         </TD>
          	<TD valign="top">
				<div class="table-outer" style="margin-left: 16px;width: 90%;">
                    <TABLE class="statblList" border="1" name="tabVerMsg">
						<TBODY>
							<TR>
								<TD class=table_title width="20%">客户固件版本</TD>
								<TD> 
								<script language=JavaScript type=text/javascript>
									var result = "<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") %>";
									if((result != "N/A") && (result != ""))
										document.write(result);
									else
										document.write("V9.2.00");
								</script>
								&nbsp;
								</TD>
							</TR>
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
							<TR>
								<TD class=table_title>厂商固件版本</TD>
								<TD > 
								<script language=JavaScript type=text/javascript>
									var upgradeVersion = "<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") %>";
									document.write(upgradeVersion);
								</script>
								&nbsp;
								</TD>
							</TR>
<% else %>
							<TR>
								<TD class=table_title>厂商固件版本</TD>
								<TD > 
								<script language=JavaScript type=text/javascript>
									function getNowFormatDate(seperator)
									{
										var now = new Date();
										var year = now.getFullYear();
										var month = now.getMonth() + 1;
										var strdate = now.getDate();
										
										if ( month >= 1 && month <= 9 )
										{
											month = "0" + month;
										}
										if ( strdate >= 0 && strdate <= 9 )
										{
											strdate = "0" + strdate;
										}

										var seperator1 = "_";
										if ( seperator != "" )
											seperator1 = seperator;
										
										var currentdate = year + seperator1 + month + seperator1 + strdate;
										return currentdate.substring(year.toString().length - 2);
									}
									
									var deviceVendor = "<%tcWebApi_get("DeviceInfo_devParaStatic","deviceVendor","s") %>";
									var productClass = "<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s") %>";
									var verArea = "<%tcWebApi_get("DeviceInfo_devParaStatic","ZoneCode","s") %>";
									var upgradeVersion = "<%tcWebApi_get("DeviceInfo_devParaStatic","UpgradeVersion","s") %>";
									var verTime = "<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSwVersionTime","s") %>";
									
									if ( deviceVendor == "N/A" || deviceVendor == "" || deviceVendor == "ECONET" )
										deviceVendor = "EN";
										
									if ( productClass == "N/A" || productClass == "" )
										productClass = "AX3000F";
										
									if ( verArea == "N/A" || verArea == "" )
										verArea = "GV";
										
									if ( verTime == "N/A" || verTime == "" )
										verTime = getNowFormatDate("_");
									else
										verTime = verTime.slice(2, 4) + "_" + verTime.slice(4, 6) + "_" + verTime.slice(6, 8); /* verTime:20190101235959 */
										
									if ( upgradeVersion == "N/A" || upgradeVersion == "" )
										upgradeVersion = "001";
										
									var result = productClass+"_FW_"+verArea+"_"+verTime+"_"+upgradeVersion;
									document.write(result);
								</script>
								&nbsp;
								</TD>
							</TR>
<% end if %>
							<TR>
								<TD class=table_title>区域码</TD>
								<TD > 
								<script language=JavaScript type=text/javascript>
									var verArea = "<%tcWebApi_get("DeviceInfo_devParaStatic","ZoneCode","s") %>";
									if ( verArea != "N/A" && verArea != "" )
										document.write(verArea);
									else
										document.write("GV");
								</script>
								&nbsp;
								</TD>
							</TR>
						</TBODY>
						</TABLE>
                </div>
          	</TD>
          </TR>
        </TBODY>
      </TABLE></TD>
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
