<%
if Request_Form("postflag") = "1" then
	tcWebApi_constSet("WebCustom_Entry","web_upgrade","1")
	TCWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
	TCWebApi_commit("System_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") <> "SUCCESS" then%>
<HEAD>
<TITLE>FW Upgrade</TITLE>
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
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0 onload="DisplayLocation(getElement('Selected_Menu').value);if(getElById('ConfigForm') != null)LoadFrame()" onunload=DoUnload() marginheight="0" marginwidth="0">
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
		<input id="Selected_Menu" type="hidden" value="管理->升级管理" name="Selected_Menu">
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

function LoadFrame()
{
	var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
	set_action(query_string);
}

function handleFile () {
    var file = document.getElementById("file"),
        fileName = document.getElementById("text");
    fileName.innerText = file.files[0] ? file.files[0].name : _("file_text");
}

var upload_progress = 0;
function updateProgress(progress) {
    if (progress.lengthComputable) {
        console.log("loaded:" + progress.loaded, "total:" + progress.total);
        upload_progress = (progress.loaded / progress.total) * 100;
        console.log("upload_progress:" + upload_progress);
        upload_style.style.width = upload_progress + "%";
        if (upload_progress == 100) {
            console.log("文件上传成功！");
        }
    }
}

function checkUpgrade() {
    alert("升级成功！", "empty", "upgrade", "../img/success.png");
    setTimeout(function() {
        location.href='/cgi-bin/logout.cgi';
    }, 3000);
}

function hidenProgress() 
{
    upgradeFileSel.style.display = '';
    upgradeInfo.style.display = '';
    progress_box.style.display = 'none';
}

function btnCommit()
{
	var form=document.ConfigForm;
	var string3 = form.FW_UploadFile.value.search(/romfile/);
<% if tcWebApi_get("WebCustom_Entry", "isSMSupport","h") = "Yes" then %>
	var string4 = form.FW_UploadFile.value.search(/tclinux/);
<% else %>
	var string4 = form.FW_UploadFile.value.search(/bdota/);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
	// var string5 = form.FW_UploadFile.value.search(/tclinux_allinone/);
<%end if %>
<% if tcwebApi_get("WebCustom_Entry","isNPUSupported","h") = "Yes" then %>
	var productClass = "<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s") %>";
	if ( productClass == "N/A" || productClass == "" )
		productClass = "AN";
	var index_chk = form.FW_UploadFile.value.indexOf(productClass);
<%end if %>

	if (form.FW_UploadFile.value=="") {
		alert("你必须选择一个升级文件！");
	}
	else {
		if ((form.upload_type[1].checked) && (string4 >= 0)) {
            confirm("升级后设备将自动重启，确定升级吗？", function(ret) {
                if(ret)
                {
                    upgradeFileSel.style.display = 'none';
                    upgradeInfo.style.display = 'none';
                    progress_box.style.display = '';

                    var file_data = new FormData(document.getElementById('upgradeForm'));
                    $.ajax({  
                        type: "POST",   //提交的方法
                        url: "/cgi-bin/upgrade.asp", //提交的地址  
                        data: file_data,// 序列化表单值  
                        processData: false,
                        dataType: 'text',
                        contentType: false, //必须false才会自动加上正确的Content-Type
                        //这里我们先拿到jQuery产生的 XMLHttpRequest对象，为其增加 progress 事件绑定，然后再返回交给ajax使用
                        xhr: function () {
                            var xhr = $.ajaxSettings.xhr();
                            if (xhr.upload) {
                                console.log("xhr.upload")
                                xhr.upload.onprogress = function (progress) {
                                    updateProgress(progress);
                                };
                                xhr.upload.onloadstart = function () {
                                    console.log('started...');
                                };
                            }
                            return xhr;
                        },
                        success: function(data) {
                            $.ajax({  
                                type: "GET",   //提交的方法
                                url: "/cgi-bin/upgradeTimer.asp", //提交的地址  
                                async: true,
                                dataType: 'text',
                                success: function(data) {
                                    if(data.indexOf("status") != -1) {
                                        var indexStart = data.indexOf("<script>"),
                                            indexEnd = data.indexOf("<\/script>");
                                        data = data.substring(indexStart + 8, indexEnd);
                                        eval(data);
                                        if (status == "SUCCESS") {
                                            alert("文件上传成功, 正在升级，请不要断电或重启！", "empty", "upgrade", "../img/loading.png");
                                            setTimeout(checkUpgrade, 120*1000);
                                        }
                                        else {
                                            alert("升级失败，请重试！");
                                            hidenProgress();
                                        }
                                    }
                                    else
                                    {
                                        alert("文件上传成功, 正在升级，请不要断电或重启！", "empty", "upgrade", "../img/loading.png");
                                        setTimeout(checkUpgrade, 120*1000);
                                    }
                                },
                                error: function(error) {
                                    alert("升级失败，请重试！");
                                    hidenProgress();
                                }
                            });
                        },
                        error: function(request) {
                            alert("文件上传失败，请重试！");
                            hidenProgress();
                        }
                    });
                }
            });
		}
		else if ((form.upload_type[0].checked) && (string3 >= 0)) {
			form.uiStatus.value = "上传中，请稍等……";
			form.postflag.value = "1";
			form.submit();
		}
		else
			alert("文件格式错误！");
	}
}
function backup_settings()
{
	var cfg = '/romfile.cfg';
	var code = 'location.assign("' + cfg + '")';
	eval(code);
}
</SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
          <TR >
	    <TD id="MenuArea_L2">
             <ul class="TRD">
              <li  class="TSD">升级管理</li>
             </ul>
            </TD>
			<SCRIPT language=javascript>
			MakeMenu(getElById ('Selected_Menu').value);
			</SCRIPT>
            <TD valign="top">
            <FORM ENCTYPE="multipart/form-data" name="ConfigForm" id="upgradeForm" method="post">
              <INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
              <INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
              <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="width: 714px;margin: 30px auto;">
                    <TBODY>
                        <TR>
                            <TD>
                                <div class="advanceTitle">升级管理</div>
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <div class="title-line"></div>
                            </TD>
                        </TR>
                        <TR id="upgradeFileSel">
                <TD width=12></TD>
                <TD align="center">
						<input name="upload_type" type="radio" value="1" CHECKED> <span style="margin-right: 20px;">配置文件</span>
                        <input name="upload_type" type="radio" value="4" > <span style="margin-right: 98px;">固件</span>
<% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
						<input name="upload_type" type="radio" value="5"> <span>tclinux_allinone</span>
<%end if %>
               	</TD>
            </TR>
            <tr id="upgradeInfo">
                <td>
                    <img src="../img/router_color.png" style="float: left;width: 62px;height: 57px;">
                        <div style="margin: -12px 0 0 14px;float: left;">
                            <div class="contentTxt" style="width: 185px;">
                                <p style="margin-bottom: 0;">当前版本</p>
                                <p style="margin-bottom: 0;">
                                    <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if %>
                                </p>
                            </div>
                        </div>
                        <div style="margin: 16px 0 0 -8px;float: left">
                            <form method="post" id="filename" name="filename" enctype="multipart/form-data">
                                <label for="file" class="file_table">
                                    <div id="text" class="contentTxt">未选择文件</div>
                                    <input type="file" id="file" name="FW_UploadFile" size="30" maxlength="128" required style="display: none;" onchange="handleFile()" />
                                    <div style="margin-top: 22px;">
                                        <div class="select-btn">选择文件</div>
                                        <input type="button" value="配置文件备份" onClick="backup_settings()" style='width:120px;margin-left: -347px;' class="SetBtn" >
                                        <INPUT onclick="btnCommit()" id=btnOK name=btnOK style="width: 140px;margin-left: 251px;" type=button value="升 级">
                                        <INPUT TYPE="TEXT" DISABLED="DISABLED" NAME="uiStatus" SIZE="55" MAXLENGTH="55" VALUE="<% if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then asp_Write("") elseif tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then asp_Write("升级失败，请重新操作！") end if%>" class="InputTextWarning">
                                    </div>
                                </label>
                            </form>
                        </div>
                    </td>
                </TR>
			  <TR>
                <TD width="447">
                    <div id="progress_box" style="width: 75%; margin: 50px auto;display: none;">
                        <label style="margin-bottom: 12px;color: #21252B;font-size: 16px;">文件上传进度</label>
                        <div class="progress">
                            <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" class="progress-bar upload_progress" id="upload_style"></div>
                        </div>
                    </div>
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
<%else%>
<HEAD><meta http-equiv="Refresh" content="115"; url="upgrade.asp"></HEAD>
<BODY><font color=red>文件上传成功, 正在擦写Flash升级中……</font></BODY>
<%end if%>
</HTML>
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>