#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"></head><body>"



node_name="Info_WLan"
attr_name="wlanSelfPinCode"

pincode=`/userfs/bin/tcapi get $node_name $attr_name`
pincode=`/userfs/bin/tcapi get $node_name $attr_name`
pincode=`/userfs/bin/tcapi get $node_name $attr_name`
pincode=`/userfs/bin/tcapi get $node_name $attr_name`

echo "<div>$pincode</div></body></html>"

