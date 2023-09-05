<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>fota升级</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/stylemain.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 
<script language="javascript" src="/JS/polyfill.min.js"></script>
<script language="javascript" src="/JS/popup.js"></script>
<script language="javascript" src="/JS/scm_select.js"></script>
<script language="javascript" src="/JS/scm_radio.js"></script>
<script language="javascript" src="/JS/scm_checkbox.js"></script>
<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
    <style>
        body {
            background: #fff;
        }

        #MenuArea_L1 span {
            height: 30px;
            font-size: 18px;
            font-family: MicrosoftYaHei-Bold, MicrosoftYaHei;
            color: #2e7bff;
            line-height: 22px;
            padding-left: 8px;
            letter-spacing: 0.64px;
            font-weight: 600;
            float: left;
        }

        #MenuArea_L1 a{
            font-size: 14px;
            font-family: MicrosoftYaHei;
            line-height: 24px;
            cursor: pointer;
            float: right;
            height: 22px;
            border-bottom: 1px solid;
            color: #2e7bff;
        }

        #MenuArea_L2 {
            display: none;
        }

        table.major {
            width: 800px;
        }

        table.major td.content {
            height: 260px;
        }

        .form-text {
            font-size: 16px;
        }

        input[type="button"].input-onoff, input[type="button"].input-onoff.button-off, .input-checkbox.input-onoff {
            top: 12px;
            left: 24px;
        }

        .header .in_welcom a {
            color: #2e7bff;
            font-size: 14px;
            font-family: MicrosoftYaHei;
            line-height: 24px;
            cursor: pointer;
            float: right;
            height: 22px;
            border-bottom: 1px solid;
        }
    </style>
</HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0  
onunload=DoUnload() marginheight="0" marginwidth="0">
<div class="header">
  <div class="in_welcom">
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
		        <TD id=MenuArea_L1>
                    <span>在线升级</span>
                    <a onclick=DoLogout() href="/cgi-bin/logout.cgi">回到登录页面</a>
                </TD>
		      </TR>
		    </TBODY>
		  </TABLE>
    </TD>
   </TR>
   
  <TR>
    <TD class="content">
        <SCRIPT language=JavaScript type=text/javascript>
        var timer = null,
            new_size = 0;

        //把字节转换成正常文件大小
        function getFileSize (size) {
            if (!size) return "";
            var num = 1024.00; //byte
            if (size < num)
                return size + "B";
            if (size < Math.pow(num, 2))
                return (size / num).toFixed(2) + "KB"; //kb
            if (size < Math.pow(num, 3))
                return (size / Math.pow(num, 2)).toFixed(2) + "MB"; //M
            if (size < Math.pow(num, 4))
                return (size / Math.pow(num, 3)).toFixed(2) + "G"; //G
            return (size / Math.pow(num, 4)).toFixed(2) + "T"; //T
        }

        // 检测更新
        function check_upload_ver() {
            var value = '<% tcWebApi_JsonHook("get_fota_info", "0", "") %>';
            var list = JSON.parse(value);

            if (list.flag != 0) {
                new_size = parseInt(list.size);
                getElById("new_ver_size").innerText = getFileSize(new_size);
                getElById("new_ver").innerText = list.new_version;
                setDisplay("new_size_p", 1);
                setDisplay("new_ver_p", 1);
                getElById("upgrade").disabled = false;
            }
            else {
                getElById("new_ver").innerText = "当前已是最新版本";
                setDisplay("new_ver_p", 1);
            }
        }

        // 开始下载最新版本
        function downloadFile_start () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/fotaTimer4.asp", //提交的地址 
                async: true,
                dataType: 'text',
                success: function(data) {
                    if(data.indexOf("value") != -1) {
                        var indexStart = data.indexOf("<script>"),
                            indexEnd = data.indexOf("<\/script>");
                        data = data.substring(indexStart + 8, indexEnd);
                        eval(data);
                        var list = JSON.parse(value);
                        if (list.result == 1) {
                            getElById("progressTab").style.display = "";
                            getElById("upgradeTab").style.display = "none";

                            downloadFile();
                            timer = setInterval(function () {
                                downloadFile();
                            }, 1000);
                        }
                        else {
                            alert("下载失败！");
                            clearInterval(timer);
                            return;
                        }
                    }
                },
                error: function(error) {
                    alert("下载失败！");
                    return;
                }
            });
        }

        // 显示下载进度
        function downloadFile () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/fotaTimer6.asp", //提交的地址  
                async: true,
                dataType: 'text',
                success: function(data) {
                    if(data.indexOf("value") != -1) {
                        var indexStart = data.indexOf("<script>"),
                            indexEnd = data.indexOf("<\/script>");
                        data = data.substring(indexStart + 8, indexEnd);
                        eval(data);
                        var list = JSON.parse(value);
                        var downloadsize = list.downloadsize,
                            percent = ((downloadsize / new_size) * 100).toFixed(2);
                        getElById("process-bar").style.width = percent + "%";
                        if (percent >= 100) {
                            clearInterval(timer);
                            upgradeStart();
                        }
                    }
                },
                error: function(error) {
                    clearInterval(timer);
                    alert("下载失败！");
                    return;
                }
            });
        }

        // 开始升级
        function upgradeStart () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/fotaTimer8.asp", //提交的地址  
                async: true,
                dataType: 'text',
                success: function(data) {
                    if(data.indexOf("value") != -1) {
                        var indexStart = data.indexOf("<script>"),
                            indexEnd = data.indexOf("<\/script>");
                        data = data.substring(indexStart + 8, indexEnd);
                        eval(data);
                        var list = JSON.parse(value);
                        if (list.result == 1) {
                            upgrade();
                        }
                        else {
                            alert("升级失败！");
                            return;
                        }
                    }
                },
                error: function(error) {
                    alert("升级失败！");
                    return;
                }
            });
        }

        // 显示升级进度
        function upgrade () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/fotaTimer10.asp", //提交的地址  
                async: true,
                dataType: 'text',
                success: function(data) {
                   setTimeout(function () {
                       alert("设备正在升级，请等待……", "empty", "upgrade", "../img/loading.png");
                   }, 200);
                    timer = setInterval(function () {
                        self.upgrade_result_get();
                    }, 1000);
                },
                error: function(error) {
                    clearInterval(timer);
                    alert("升级失败！");
                    return;
                }
            });
        }

        function upgrade_result_get () {
            $.ajax({  
                type: "GET",   //提交的方法
                url: "/cgi-bin/fotaTimer10.asp", //提交的地址  
                async: true,
                dataType: 'text',
                success: function(data) {
                    if(data.indexOf("value") != -1) {
                        var indexStart = data.indexOf("<script>"),
                            indexEnd = data.indexOf("<\/script>");
                        data = data.substring(indexStart + 8, indexEnd);
                        eval(data);
                        var list = JSON.parse(value);
                        if (list.progress == 100) {
                            clearInterval(timer);
                            alert("升级成功！", "empty", "upgrade", "../img/success.png");
                            setTimeout(function() {
                                location.href="/cgi-bin/logout.cgi";
                            }, 3000);
                        }
                    }
                },
                error: function(error) {
                    clearInterval(timer);
                    alert("升级失败！");
                    return;
                }
            });
        }

        </SCRIPT>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
        <TBODY>
        <TR>
            <TD id="MenuArea_L2">
		 <ul class="TRD"><li  class="TSD">fota升级</li></ul>
	   </TD>
          <TD valign="top" style="background: whitesmoke;">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 id="upgradeTab">
              <TBODY>
              <TR>
                <TD><img src="../img/router_color.png" style="margin: 38px 0 0 107px;float: left;width: 81px;height: 72px"></TD>
                <TD>
                    <div style="margin-left: 30px;float: left;position: relative;">
                        <div class="contentTxt" style="width: 320px;margin-top: 30px;">
                            <p style="margin-bottom: 0;">当前版本：<%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if %></p>
                            <p id="new_size_p" style="margin-bottom: 0;color: #2e7bff;display: none;">新版本大小：<span id="new_ver_size"></span></p>
                            <p id="new_ver_p" style="margin-bottom: 0;color: #2e7bff;display: none;">新版本：<span id="new_ver"></span></p>
                        </div>
                        <INPUT id=checkUpdate name=btnCancel onclick=check_upload_ver() type=button style="position: absolute;left: 270px;top: 23px;" value="检测更新">
                    </div>
				</TD>
              </TR>
              <TR>
                  <TD></TD>
                  <TD>
                    <P style="margin: 60px 0 0 103px;">
                        <INPUT onclick='downloadFile_start()' type=button style="width: 160px;" value="升 级" id="upgrade" name="upgrade" disabled>
                    </P>
                  </TD>
              </TR>
            </TBODY>
        </TABLE>

        <!--下载进度部分-->
        <TABLE cellPadding=0 width="100%" border=0 id="progressTab" style="display: none;"> 
            <TBODY>
                <TR>
                    <TD>
                        <div style="width: 75%;margin: 50px 0 0 12.2%;">
                            <label style="margin-bottom: 12px;">升级文件下载进度</label>
                            <div class="progress">
                                <div class="progress-bar upload_progress" role="progressbar" aria-valuenow="60"
                                    aria-valuemin="0" aria-valuemax="100" id="process-bar">
                                </div>
                            </div>
                        </div>
                    </TD>
                </TR>
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
<script language="javascript">
	scmSelect.init($('body'));
	scmRadio.init($('body'));
	scmCheckbox.init($('body'));
</script>
