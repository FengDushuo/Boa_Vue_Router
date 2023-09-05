<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
    <TITLE>家长模式</TITLE>
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

<style>
    .newcheck input[type="checkbox"],
    .input-checkbox {
        margin-left: -12px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-style: hidden;
    }

    .tableLi:hover {
        background: rgb(229, 244, 255);
        cursor: pointer;
    }

    .editMore .title {
        color: #2e7bff;
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 1px;
        margin-bottom: 20px;
    }

    .editTime .title,
    .editControl .title,
    .editNetwork .title {
        margin-left: 23px;
        line-height: 30px;
    }

    .editContent .todayTitle {
        font-size: 14px;
        color: #2e7bff;
        line-height: 24px;
        letter-spacing: 1px;
        margin-right: 12px;
    }

    input[type="button"].input-onoff.button-on,
    .input-checkbox.input-onoff.checkbox-on,
    input[type="button"].input-onoff,
    input[type="button"].input-onoff.button-off,
    .input-checkbox.input-onoff {
        vertical-align: text-top;
    }

    .list input[type="button"].input-onoff.button-on,
    .list .input-checkbox.input-onoff.checkbox-on,
    .list input[type="button"].input-onoff,
    .list input[type="button"].input-onoff.button-off,
    .list .input-checkbox.input-onoff {
        top: 0;
    }

    .editMore .more.protect {
        color: #65e7af;
        margin-right: 48px;
    }

    .editTop {
        height: 127px;
    }

    .editMore .btn-before {
        color: #787e7e;
        position: relative;
        display: block;
        height: 30px;
        line-height: 30px;
        text-align: right;
        letter-spacing: 1px;
    }

    .editMore .btn-before.more::after {
        content: "";
        width: 30px;
        height: 30px;
        background: url(../img/icon_fold.png) center center no-repeat;
        position: absolute;
        top: 0;
        right: -37px;
        border: none;
    }

    .timeContent {
        width: 100%;
        height: 161px;
        border-radius: 8px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .timeContent li {
        list-style: none;
        height: 53px;
        line-height: 53px;
        padding: 0 23px;
        overflow: hidden;
    }

    .timeContent li:not(:last-child) {
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .timeContent li .day {
        font-size: 14px;
        color: #3f414a;
        float: left;
    }

    .timeContent li .timeL {
        font-size: 0;
        color: #2e7bff;
        float: right;
    }

    input[type="text"] {
        margin-bottom: 0;
    }

    .btn-red {
        width: 200px;
        height: 40px;
        border-radius: 20px;
        font-size: 16px;
        font-family: MicrosoftYaHei;
        letter-spacing: 2px;
        color: #f03e4f;
        background-color: #fff;
        border: 1px solid #f03e4f;
    }

    .btn-more {
        width: 69px;
        height: 28px;
        line-height: 15px;
        letter-spacing: 0.57px;
        border-radius: 14px;
    }

    .add_img {
        background: url(../img/add.png) center center no-repeat;
        width: 24px;
        height: 24px;
        vertical-align: middle;
        cursor: pointer;
    }

    select,
    .select-list {
        width: 70px;
        margin-bottom: 0;
    }

    .select-list.select-open .select-list-options {
        width: 70px;
    }

    .timeD select,
    .timeD .select-list {
        width: 154px;
    }

    .timeD .select-list.select-open .select-list-options {
        width: 154px;
    }

    .editControl .control_mode {
        margin-bottom: 16px;
        width: 100%;
        margin-left: 23px;
        margin-top: 32px;
    }

    .editControl .wrap,
    .editNetwork .wrap {
        width: 100%;
        border-radius: 8px;
        border: 1px solid rgba(0, 0, 0, 0.1);
    }

    .editTime .more,
    .editControl .more,
    .editNetwork .more {
        cursor: pointer;
    }
</style>

<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 leftMargin=0 topMargin=0
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
            <input id="Selected_Menu" type="hidden" value="应用->家长模式" name="Selected_Menu">
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

            <SCRIPT language=JavaScript type=text/javascript>
                    function LoadFrame()
                    {
                        with ( document.forms[0])
                        {
                            scmSelect.init($('body'));
                            scmRadio.init($('body'));
                            scmCheckbox.init($('body'));
                            setEnable();
							var query_string="?post_par=<%TCWebApi_get("PostPar_Entry","PostParValue","s")%>";
							set_action(query_string);
                        }
                    }

                    function setEnable()
                    {
                        var enChecked = getCheckVal('chParEnable');
                        if (enChecked == '1')
                        {
                            document.ConfigForm.Enable.value = "1";
                            setDisplay('tabList', 1);
                        }
                        else
                        {
                            document.ConfigForm.Enable.value = "0";
                            setDisplay('tabList', 0);
                        }
                    }

                    function enter_setting() {
                        setDisplay('basic_info', 0);
                        setDisplay('more_info', 1);
                    }

                    function return_index() {
                        setDisplay('more_info', 0);
                        setDisplay('basic_info', 1);
                    }

                    function btnSubmit()
                    {
                        var	vForm = document.ConfigForm;
                        var enChecked = getCheckVal('chIptvEnable');
                        vForm.OperatorStyle.value = "Modify"; //modify
                        vForm.iptvSave_Flag.value = "1";
                        vForm.submit();
                    }
                    
                </SCRIPT>
            <TR>
                <TD class="content">
                    <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0 class="tblMain">
                        <TBODY>
                            <TR>
                                <TD id="MenuArea_L2">
                                    <ul class="TRD">
                                        <li name="IGMPSet" id="家长模式" class="TSD">家长模式</li>
                                    </ul>
                                </TD>
                                <SCRIPT language=javascript>
                                    MakeMenu(getElById('Selected_Menu').value);
                                </SCRIPT>
                                <TD valign="top">
                                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                                        style="width: 714px;margin: 30px auto;">
                                        <TBODY>
                                            <TR>
                                                <TD>
                                                    <div class="advanceTitle">家长模式</div>
                                                </TD>
                                            </TR>
                                            <tr>
                                                <td>
                                                    <div class="advanceTips">
                                                        <span onclick="showHelp()">页面帮助</span>
                                                    </div>
                                                    <div class="helpDesc" style="display: none;">
                                                        <p style="padding-left: 9px;">
                                                            开启家长模式后，您可以根据需求查看连接该路由器网络下的终端设备上网状态，并可对其上网时段、时长及内容进行设置。家长模式可以帮助孩子培养正确的上网习惯，保障孩子的身心健康。
                                                        </p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <TR>
                                                <TD>
                                                    <div class="title-line"></div>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD>
                                                    <FORM name="ConfigForm" action="/cgi-bin/app-parentcontrol.asp"
                                                        method="post" style="padding: 0;">
                                                        <input type="hidden" name="Enable" value="0">
                                                        <input type="hidden" name="wanMode" value="Route">
                                                        <input type="hidden" name="serviceList" value="IPTV">
                                                        <input type="hidden" name="linkMode" value="linkIP">
                                                        <input type="hidden" name="IPVersionValue" value="IPv4">
                                                        <input type="hidden" name="VLANMode" value="<% tcWebApi_get("
                                                            WanInfo_WanPVC", "VLANMode" , "s" ) %>">
                                                        <input type="hidden" name="v8021P" value="0">
                                                        <input type="hidden" name="v8021PClick" value="No">
                                                        <input type="hidden" name="WanCurrIFIdx" value="2">
                                                        <input type="hidden" name="curSetIndex" value="8">
                                                        <input type="hidden" name="WanActive" value="Yes">
                                                        <INPUT type="hidden" name="dnsDHCP" value="0">

                                                        <input type="hidden" name="ENCAP" value="1483 Bridged IP LLC">
                                                        <input type="hidden" name="BandActive" value="N/A">
                                                        <input type="hidden" name="LAN4" value="No">
                                                        <input type="hidden" name="SSID1" value="No">
                                                        <input type="hidden" name="SSID2" value="No">
                                                        <input type="hidden" name="SSID3" value="No">
                                                        <input type="hidden" name="SSID4" value="No">
                                                        <input type="hidden" name="SSIAC1" value="No">
                                                        <input type="hidden" name="SSIAC2" value="No">
                                                        <input type="hidden" name="SSIAC3" value="No">
                                                        <input type="hidden" name="SSIAC4" value="No">
                                                        <input type="hidden" name="MTU" value="1500">
                                                        <input type="hidden" name="ISP" value="0">
                                                        <input type="hidden" name="dot1pData" value="0">
                                                        <input type="hidden" name="dot1p" value="Yes">
                                                        <input type="hidden" name="dot1q" value="Yes">
                                                        <input type="hidden" name="NATENABLE" value="Enable">
                                                        <input type="hidden" name="IGMPproxy" value="No">
                                                        <input type="hidden" name="EPONEnable" value="Yes">
                                                        <input type="hidden" name="GPONEnable" value="Yes">
                                                        <input type="hidden" name="DsliteEnable" value="No">
                                                        <input type="hidden" name="PDEnable" value="No">
                                                        <input type="hidden" name="DHCPv6PD" value="No">
                                                        <input type="hidden" name="PDOrigin" value="None">
                                                        <input type="hidden" name="DHCPEnable" value="0">
                                                        <input type="hidden" name="BridgeInterface" value="No">

                                                        <input type="hidden" name="iptvSave_Flag" value="0">
                                                        <input type="hidden" name="OperatorStyle" value="Add">

                                                        <div id="basic_info">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <TBODY>
                                                                    <TR>
                                                                        <TD>
                                                                            <div class="form-text">家长模式</div>
                                                                        </TD>
                                                                        <TD>
                                                                            <INPUT class="input-onoff" type=checkbox
                                                                                name=chParEnable onclick="setEnable()">
                                                                        </TD>
                                                                    </TR>
                                                                </TBODY>
                                                            </TABLE>

                                                            <div id="tabList" style="margin-bottom: 80px;">
                                                                <div class="advanceTitle"
                                                                    style="margin-top: 24px;padding-left: 12px;font-size: 16px;">
                                                                    已设置列表</div>
                                                                <div class="table-outer" style="margin-top: 8px;">
                                                                    <div class="wrap" id="wrap3">
                                                                        <ul>
                                                                            <li class="tableLi"
                                                                                onclick="enter_setting()">
                                                                                <div class="left-name">
                                                                                    <div class="control-name">000</div>
                                                                                    <em class="img-edit"
                                                                                        style="cursor: pointer;margin-left: 6px;"
                                                                                        data-flag="0"
                                                                                        data-toggle="modal"
                                                                                        data-target="#changeDevicenameModal"
                                                                                        onclick="change_device_name()"></em>
                                                                                </div>
                                                                                <div class="right-on list">
                                                                                    <span class="btn-before"
                                                                                        style="vertical-align: -webkit-baseline-middle;">一键断网开启</span>
                                                                                    <INPUT class="input-onoff"
                                                                                        type=checkbox name=disconnect_today
                                                                                        onclick="change_disconnect_enable()">
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>

                                                                <div class="advanceTitle"
                                                                    style="margin-top: 24px;padding-left: 12px;;font-size: 16px;">
                                                                    未设置列表</div>
                                                                <div class="table-outer" style="margin-top: 8px;">
                                                                    <div class="wrap" id="wrap4">
                                                                        <ul>
                                                                            <li class="tableLi"
                                                                                onclick="enter_setting()">
                                                                                <div class="left-name">
                                                                                    <div class="control-name">111</div>
                                                                                    <em class="img-edit"
                                                                                        style="cursor: pointer;margin-left: 6px;"
                                                                                        data-flag="0"
                                                                                        data-toggle="modal"
                                                                                        data-target="#changeDevicenameModal"
                                                                                        onclick="change_device_name()"></em>
                                                                                </div>
                                                                                <div class="right-on">
                                                                                    <span class="btn-before"
                                                                                        style="color: #787E7E;vertical-align: super;">未设置</span>
                                                                                    <em class="img-edit goto"></em>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div id="more_info" class="editMore" style="display: none;">
                                                            <table class="editTop">
                                                                <TR>
                                                                    <TD style="display: flex;align-items: center;">
                                                                        <img src="../img/home_page/icon_wdsb_nor.png"
                                                                            alt="">
                                                                        <div class="editContent">
                                                                            <h2 class="title"
                                                                                style="margin-top: 70px;margin-left: 12px;">
                                                                                小孩学习ipad</h2>
                                                                            <div>
                                                                                <span class="todayTitle">当日一键断网</span>
                                                                                <INPUT class="input-onoff" type=checkbox
                                                                                    name=disconnect_today_item
                                                                                    onclick="change_disconnect_enable()" <%if
                                                                                    tcWebApi_get("WanInfo_WanIF","Active","h")="Yes"
                                                                                    then asp_Write("checked") end if%>>
                                                                            </div>
                                                                            <div class="font-help"
                                                                                style="width: 340px;">
                                                                                启用该功能后，终端当天内无法连接网络，次日恢复连网。</div>
                                                                        </div>
                                                                    </TD>
                                                                    <TD>
                                                                        <div style="float: right;">
                                                                            <span
                                                                                class="btn-before more protect">保护中</span>
                                                                            <INPUT id=btnCancel0 name=btnCancel0
                                                                                style="margin-right: 23px;"
                                                                                onclick=onCancel(); type=button
                                                                                value="恢复初始设置">
                                                                        </div>
                                                                    </TD>
                                                                </TR>
                                                            </table>

                                                            <div class="title-line"></div>
                                                            <!-- 上网时长统计 -->
                                                            <div class="editTime">
                                                                <div class="clearfix"
                                                                    style="height: 30px;margin-right: 23px;">
                                                                    <h2 class="title fl"
                                                                        style="text-align: left;margin-left: 23px;">
                                                                        上网时长统计
                                                                    </h2>
                                                                    <span class="btn-before more"
                                                                        onclick="view_more_time()">查看更多</span>
                                                                </div>
                                                                <div style="text-align: center;">
                                                                    <h2 class="title">
                                                                        <span>今日</span>
                                                                        <p style="display: inline-block;">
                                                                            <!-- <span>
                                                                                <span style="font-size: 36px;margin: 0 10px;">1</span><span>天</span>
                                                                            </span> -->
                                                                            <span>
                                                                                <span
                                                                                    style="font-size: 36px;margin: 0 10px;">3</span><span>小时</span>
                                                                            </span>
                                                                            <span>
                                                                                <span
                                                                                    style="font-size: 36px;margin: 0 10px;">45</span><span>分钟</span>
                                                                            </span>
                                                                        </p>
                                                                    </h2>
                                                                </div>
                                                                <ul class="timeContent">
                                                                    <li>
                                                                        <span class="day">昨日</span>
                                                                        <div class="timeL">
                                                                            <span>22小时</span>
                                                                            <span>34分钟</span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <span class="day">今日</span>
                                                                        <div class="timeL">
                                                                            <span>2小时</span>
                                                                            <span>30分钟</span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <span class="day">过去7日</span>
                                                                        <div class="timeL">
                                                                            <span>2天</span>
                                                                            <span>12小时</span>
                                                                            <span>23分钟</span>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="title-line"></div>
                                                            <!-- 访问控制 -->
                                                            <div class="editControl">
                                                                <div
                                                                    style="height: 30px;margin-right: 23px;display: flex;justify-content: space-between;align-items: center;">
                                                                    <h2 class="title">访问控制</h2>
                                                                    <div>
                                                                        <!-- <span class="btn-before"
                                                                            style="color: #BDC4C3;text-align: center;">未设置</span> -->
                                                                        <span class="btn-before"
                                                                            style="color: #3F414A;text-align: center;">已设置2个黑名单地址</span>
                                                                    </div>
                                                                    <span class="btn-before more"
                                                                        onclick="view_more_control()">更多设置</span>
                                                                </div>
                                                                <div v-show="control_flag">
                                                                    <div class="control_mode">
                                                                        <label for="radio1">
                                                                            <INPUT id=dhcpSrvType onclick="typeClick()"
                                                                                type=radio value="0" name="dhcpSrvType"
                                                                                <%if
                                                                                tcWebApi_get("Lan_Dhcp","type","h")="0"
                                                                                then asp_Write("checked") end if %>>
                                                                            <span
                                                                                style="color: #3F414A;font-size: 14px;">黑名单（不允许访问列表中的内容）</span>
                                                                        </label>
                                                                        <label for="radio2" style="margin-left: 96px;">
                                                                            <INPUT id="dhcpSrvType"
                                                                                onclick="typeClick()" type=radio
                                                                                value="1" name="dhcpSrvType" <%if
                                                                                tcWebApi_get("Lan_Dhcp","type","h")="1"
                                                                                then asp_Write("checked") end if %>>
                                                                            <span
                                                                                style="color: #3F414A;font-size: 14px;">白名单（只允许访问列表中的内容）</span>
                                                                        </label>
                                                                    </div>
                                                                    <div class="wrap" style="max-height: none;">
                                                                        <table>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 15%;"></th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 65%;height: 48px;color: #2E7BFF;">
                                                                                        地址列表
                                                                                    </th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 20%;">
                                                                                        <button class="add_img"
                                                                                            onclick="url_add"></button>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr class="trStyle2">
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 15%;">
                                                                                        序号</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 65%;">
                                                                                        名称</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 20%;">
                                                                                        操作</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <!-- 白名单 -->
                                                                            <tbody>
                                                                                <tr class="trStyle3">
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 15%;">1
                                                                                    </td>
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 65%;">
                                                                                        <INPUT TYPE="TEXT" NAME="url"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="baidu.com">
                                                                                    </td>
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 20%;">
                                                                                        <button class="btn-red btn-more"
                                                                                            onclick="url_del()">删除</button>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                            <!-- 黑名单 -->
                                                                            <tbody>
                                                                                <tr class="trStyle3">
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 15%;">1
                                                                                    </td>
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 65%;">
                                                                                        <INPUT TYPE="TEXT" NAME="url"
                                                                                            MAXLENGTH="32"
                                                                                            VALUE="baidu.com">
                                                                                    </td>
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 20%;">
                                                                                        <button class="btn-red btn-more"
                                                                                            onclick="url_del()">删除</button>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                            <!-- 添加数据 -->
                                                                            <tbody id="addList">

                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                    <div style="margin: 24px 0;text-align: center;">
                                                                        <button class="btn btn-basic"
                                                                            style="width: 250px;" onclick="url_save()">保
                                                                            存</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="title-line"></div>
                                                            <!-- 上网时段 -->
                                                            <div class="editNetwork">
                                                                <div
                                                                    style="margin-right: 23px;display: flex;justify-content: space-between;align-items: center;">
                                                                    <h2 class="title ">上网时段</h2>
                                                                    <div>
                                                                        <span class="btn-before"
                                                                            style="color: #BDC4C3;text-align: center;">未设置</span>
                                                                    </div>
                                                                    <span class="btn-before more"
                                                                        onclick="view_more_network()">更多设置</span>
                                                                </div>
                                                                <div v-show="network_flag" style="margin-top: 24px;">
                                                                    <div class="wrap" style="max-height: none;">
                                                                        <table>
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 10%;"></th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;"></th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;height: 48px;color: #2E7BFF;">
                                                                                        可上网时段设置
                                                                                    </th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;"></th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 15%;">
                                                                                        <button class="add_img"
                                                                                            onclick="per_add()"></button>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr class="trStyle2">
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 10%;">
                                                                                        序号</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;">
                                                                                        开始时间</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;">
                                                                                        结束时间</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 25%;">
                                                                                        重复规则</th>
                                                                                    <th class="tdWidth2"
                                                                                        style="width: 15%;">
                                                                                        操作</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr class="trStyle3">
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 10%;">1
                                                                                    </td>
                                                                                    <td class="tdWidth3 timeS"
                                                                                        style="width: 25%;">
                                                                                        <SELECT id="startHour" size="1"
                                                                                            name="startHour"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var hour = '<% tcWebApi_get("System_RebootSchedule","hour","s") %>';
                                                                                                var hourList = new Array();
                                                                                                for (var i = 0; i < 24; i++) {
                                                                                                    if (i < 10) {
                                                                                                        hourList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        hourList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('startHour')) {
                                                                                                    for (i = 0; i < hourList.length; i++) {
                                                                                                        var opt = new Option(hourList[i], hourList[i]);
                                                                                                        if (hour == hourList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                        <span
                                                                                            style="vertical-align: super;margin: 0 5px;">:</span>
                                                                                        <SELECT id="startMinute"
                                                                                            size="1"
                                                                                            name="startMinute"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var minute = '<% tcWebApi_get("System_RebootSchedule","minute","s") %>';
                                                                                                var minuteList = new Array();
                                                                                                for (var i = 0; i < 60; i++) {
                                                                                                    if (i < 10) {
                                                                                                        minuteList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        minuteList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('startMinute')) {
                                                                                                    for (i = 0; i < minuteList.length; i++) {
                                                                                                        var opt = new Option(minuteList[i], minuteList[i]);
                                                                                                        if (minute == minuteList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </td>
                                                                                    <td class="tdWidth3 timeS"
                                                                                        style="width: 25%;">
                                                                                        <SELECT id="endHour" size="1"
                                                                                            name="endHour"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var hour = '<% tcWebApi_get("System_RebootSchedule","hour","s") %>';
                                                                                                var hourList = new Array();
                                                                                                for (var i = 0; i < 24; i++) {
                                                                                                    if (i < 10) {
                                                                                                        hourList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        hourList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('endHour')) {
                                                                                                    for (i = 0; i < hourList.length; i++) {
                                                                                                        var opt = new Option(hourList[i], hourList[i]);
                                                                                                        if (hour == hourList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                        <span
                                                                                            style="vertical-align: super;margin: 0 5px;">:</span>
                                                                                        <SELECT id="endMinute" size="1"
                                                                                            name="endMinute"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var minute = '<% tcWebApi_get("System_RebootSchedule","minute","s") %>';
                                                                                                var minuteList = new Array();
                                                                                                for (var i = 0; i < 60; i++) {
                                                                                                    if (i < 10) {
                                                                                                        minuteList[i] = "0" + i;
                                                                                                    }
                                                                                                    else {
                                                                                                        minuteList[i] = "" + i;
                                                                                                    }
                                                                                                }

                                                                                                with (getElById('endMinute')) {
                                                                                                    for (i = 0; i < minuteList.length; i++) {
                                                                                                        var opt = new Option(minuteList[i], minuteList[i]);
                                                                                                        if (minute == minuteList[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </td>
                                                                                    <td class="tdWidth3 timeD"
                                                                                        style="width: 25%;">
                                                                                        <SELECT id="Day" size="1"
                                                                                            name="Day"></SELECT>
                                                                                        <SCRIPT language="JavaScript"
                                                                                            type='text/javascript'>
                                                                                                var day = '<% tcWebApi_get("System_RebootSchedule","week","s") %>';
                                                                                                var optname = new Array('星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日');
                                                                                                var optvalue = new Array("2", "4", "8", "16", "32", "64", "1");

                                                                                                with (getElById('Day')) {
                                                                                                    for (i = 0; i < optname.length; i++) {
                                                                                                        var opt = new Option(optname[i], optvalue[i]);
                                                                                                        if (day == optvalue[i]) {
                                                                                                            opt.setAttribute("selected", true);
                                                                                                        }
                                                                                                        options.add(opt);
                                                                                                    }
                                                                                                }
                                                                                            </SCRIPT>
                                                                                    </td>
                                                                                    <td class="tdWidth3"
                                                                                        style="width: 15%;">
                                                                                        <button
                                                                                            class="btn-red btn-more">删除</button>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                            <!-- 添加数据 -->
                                                                            <tbody id="addList2">

                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                    <div style="margin: 24px 0;text-align: center;">
                                                                        <button class="btn btn-basic"
                                                                            style="width: 250px;" onclick="per_save()">保
                                                                            存</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="title-line"></div>
                                                            <div class="btn-groups"
                                                                style="width: 466px;margin: 48px auto 80px;">
                                                                <button class="btn btn-white"
                                                                    style="width: 200px;margin-right: 48px;"
                                                                    onclick="return_index()">返回设备列表</button>
                                                                <button class="btn-red"
                                                                    onclick="reset_single">移出已设置列表</button>
                                                            </div>
                                                        </div>
                                                    </FORM>
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
    </TD>
    </TR>
    </TBODY>
    </TABLE>
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