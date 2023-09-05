#!/bin/sh
echo -e "Content-Type: text/html\n"
echo "<html>
<head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content=\"text/html hhh; charset=iso-8859-1\">
<style>
iframe {

}
.diag-box .inner-txt {
  font-size: 14px;
  font-family: MicrosoftYaHei;
  color: #3f414a;
  line-height: 24px;
  padding: 10px 14px 10px 14px;
}
</style>
</head>
<body>
<table cellspacing=0 cellPadding=0  border=0><tr><td>"

echo "<div class='diag-box'><div class='inner-txt'>Ping Result:"
echo "<BR>"

cat /tmp/pingOth | while read LINE
do
	echo "$LINE"
	echo "<BR>"
done


echo "</div></div></td></tr></table></body></html>"
 
