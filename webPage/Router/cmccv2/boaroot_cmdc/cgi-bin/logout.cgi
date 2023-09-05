#!/bin/sh

echo "Content-Type: text/html \n"
echo ""

echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"><link rel=\"stylesheet\"
href=\"/JS/stylemain.css\" type=\"text/css\"></head>

<SCRIPT language=javascript src="/JS/jquery-1.8.3.min.js"></SCRIPT> 

<script language=\"JavaScript\">
		function delCookie(name)
		{  
			var exp = new Date();  
			exp.setTime(exp.getTime() - 10000);  
			document.cookie = name + \"=del;expires=\" + exp.toGMTString();   
			document.cookie = name + \"=del;expires=\" + exp.toGMTString() + \";path=/;\";  
		}
		delCookie(\"UID\");
		delCookie(\"PSW\");
		delCookie(\"LoginTimes\");
		delCookie(\"LOGFLAG\");
		
		
var params ='{\"login\":\"\",\"password\":\"\",\"logout\":true,\"isRememberPwd\":false}';
                        $.ajax({
                            type: \"PUT\",   //提交的方法
                            url: \"/api/usersession\"  , //提交的地址  
                            async: true,
                            data: params,
							contentType: \"application/json\",
                            dataType: \"json\",
                            success: function(data) {
				top.window.location.href=\"/\";				
                            },
                            error: function(error) {
		top.window.location.href=\"/\";
                            }
                        });
		
		

</script>
<body onload=\"\"><table width=\"580\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" bgcolor=\"#FFFFFF\">"

node_name="WebCurSet_Entry"
attr_name="CurrentAccess"
curUser=`/userfs/bin/tcapi get $node_name $attr_name`
node_name="Account_Entry0"
attr_name="Logged"
ret=`/userfs/bin/tcapi set $node_name $attr_name 0`
ret=`/userfs/bin/tcapi set $node_name Logoff 1`
node_name="Account_Entry1"
ret=`/userfs/bin/tcapi set $node_name $attr_name 0`
ret=`/userfs/bin/tcapi set $node_name Logoff 1`
echo "</table></body></html>"

