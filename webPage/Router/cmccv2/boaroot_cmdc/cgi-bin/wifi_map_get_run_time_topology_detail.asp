<html>
<head>
	<SCRIPT language=javascript src="/JS/vis.js"></SCRIPT>
	<SCRIPT language=javascript src="/JS/json2.js"></SCRIPT>
</head>
<body>
<div id="display_tree_vis" style="display:none"></div>
<SCRIPT language=JavaScript type=text/javascript>

if(typeof String.prototype.startsWith != 'function')
{
	String.prototype.startsWith = function(prefix)
	{
		return this.slice(0, prefix.length) == prefix;
	}
}

function JSO_get_runtime_topology()
{
		var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
		ret = ret.replace(/\'/g,'\\\\u0022');
		return ret;
}

function draw_topology_table(jsTopoInfo)
{
    var tree_info = [];
    var tree_info_count = 0;
    var topoInfoArr = jsTopoInfo['topology information'];
    if(!(topoInfoArr instanceof Array))
    {
        console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
        return;
    }
    for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
    {
        var obj_1905 = topoInfoArr[idx_1905];
        if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']) || !obj_1905.hasOwnProperty('IP'))
        {
        		continue;
        }
        tree_info[tree_info_count] = prep_tree_info(obj_1905);
        tree_info_count++;
    }
    tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
    disp_topology_vis(tree_info);
}

function get_dev_role_string(devRole)
{
    switch(parseInt(devRole))
    {
        case 1:
            return 'Controller';
        case 2:
            return 'Agent';
        default:
            return 'Not Configured';
    }
}
<% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>							    
function prep_tree_info(dev1905Obj)
{
	var node = {};
	node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
	node["alMac"] = dev1905Obj['AL MAC'];
	node["ip"] = dev1905Obj['IP'];
	node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
	node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
	node["wifistaInfo"] = {};
	node["ethstaInfo"] = {};
	
	for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
	{
	    for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
	    {
	        if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
	        {
	            for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
	            {
	                var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
									var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
									if (node["wifistaInfo"].hasOwnProperty(ssid))
									{
										node["wifistaInfo"][ssid].push(staMac);
									}
									else
									{
										node["wifistaInfo"][ssid] = Array(staMac);
									}
	            }
	        }
	    }					
	}
	
	for(var cliIdex = 0; cliIdex < dev1905Obj['Other Clients Info'].length; cliIdex++)
	{
			if (dev1905Obj['Other Clients Info'][cliIdex].hasOwnProperty('Client Address'))
			{
				var cliAdd = dev1905Obj['Other Clients Info'][cliIdex]['Client Address'];
				var medium = dev1905Obj['Other Clients Info'][cliIdex]['Medium'];
				if (node["ethstaInfo"].hasOwnProperty(medium))
				{
					node["ethstaInfo"][medium].push(cliAdd);
				}
				else
				{
					node["ethstaInfo"][medium] = Array(cliAdd);
				}
			}
	}
	return node;
}
<% else %>
function prep_tree_info(dev1905Obj)
{
    var node = {};
    node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
    node["alMac"] = dev1905Obj['AL MAC'];
	node["ip"] = dev1905Obj['IP'];
    node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
    node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
    node["staInfo"] = {};
    for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
	{
        for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
		{
            if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
			{
                for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
				{
					var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
					var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
					if (node["staInfo"].hasOwnProperty(ssid))
					{
						node["staInfo"][ssid].push(staMac);
					}
					else
					{
						node["staInfo"][ssid] = Array(staMac);
					}
                }
            }
        }
    }
    return node;
}
<% end if %>
function get_uplink_tree_info(tree_info, mac)
{
    for(var nIdx=0; nIdx < tree_info.length; nIdx++)
		{
        if(tree_info[nIdx]['alMac'] == mac)
				{
				<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				return '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
				<% else %>
				return '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
				<% end if %>
        }
    }
    return "";
}
<% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
function disp_topology_vis(tree_info)
{
    var div = document.getElementById("display_tree_vis");
    div.style.display = "";
    var str = "";
    var numStaPerDev = 0;
    console.log("TREE INFO VIS = ",tree_info);
    for(var nIdx=0; nIdx < tree_info.length; nIdx++)
   	{
        if (tree_info[nIdx]['devRole'] == "Agent")
        {
            var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
            if(upLinkNodeStr != "")
            {
               	<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
				<% else %>
				str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
				<% end if %>
            }
            else
            {
                console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
            }
        }
        for(var ssid in tree_info[nIdx]['wifistaInfo'])
        {
            var staIdx;
            for(var staIdx=0; staIdx < tree_info[nIdx]['wifistaInfo'][ssid].length; staIdx++)
            {               
				<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
				if(mac1stOctet & 0x02)
                {
                    continue;
                }
				str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				numStaPerDev += 1;
				<% else %>
				var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
				if(mac1stOctet & 0x02)
                {
                    continue;
                }				
				str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				numStaPerDev += 1;
				<% end if %>
            }
        }
        
        for(var medium in tree_info[nIdx]['ethstaInfo'])
        {
            var ethstaIdx;
            for(var ethstaIdx=0; ethstaIdx < tree_info[nIdx]['ethstaInfo'][medium].length; ethstaIdx++)
            {               
				<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
				if(mac1stOctet & 0x02)
                {
                    continue;
                }
				str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n'  + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				numStaPerDev += 1;
				<% else %>
				var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
				if(mac1stOctet & 0x02)
                {
                    continue;
                }
				str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				numStaPerDev += 1;
				<% end if %>
            }
        }
        if (numStaPerDev == 0 && tree_info.length == 1 &&
            (tree_info[nIdx]['devRole'] == "Controller" ||
            tree_info[nIdx]['devRole'] == "Agent"))
        {
            <% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
			str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
			<% else %>
			str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
			<% end if %>
        }
    }
    console.log("TREE INFO str = ",str);
    var NewDOTstring = "dinetwork{"+str+"}";
    var parsedData = vis.network.convertDot(NewDOTstring);
    for(var count=0;count<parsedData.nodes.length;count++)
    {
        console.log("NODE LABEL = ",parsedData.nodes[count].label);
        if(parsedData.nodes[count].label.startsWith('Agent'))
        {
            parsedData.nodes[count].color='Orange';
        }
        else if(parsedData.nodes[count].label.startsWith('STA'))
        {
            parsedData.nodes[count].color='Green';
        }
        else
        {
            parsedData.nodes[count].shape='box';
        }
    }
    var data = {
      nodes: parsedData.nodes,
      edges: parsedData.edges
    }
    var options = parsedData.options;
    var network = new vis.Network(div, data, options);
    network.setSize('100%','100%');
}
<% else %>
function disp_topology_vis(tree_info)
{
    var div = document.getElementById("display_tree_vis");
    div.style.display = "";
    var str = "";
    var numStaPerDev = 0;
    console.log("TREE INFO VIS = ",tree_info);
    for(var nIdx=0; nIdx < tree_info.length; nIdx++)
   	{
        if (tree_info[nIdx]['devRole'] == "Agent")
        {
            var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
            if(upLinkNodeStr != "")
            {
				<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' +  "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
				<% else %>
				str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
				<% end if %>               
            }
            else
            {
                console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
            }
        }
        for(var ssid in tree_info[nIdx]['staInfo'])
        {
            var staIdx;
            for(var staIdx=0; staIdx < tree_info[nIdx]['staInfo'][ssid].length; staIdx++)
            {
				<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
				var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
				str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				<% else %>
				var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
				str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
				<% end if %>											                   
				numStaPerDev += 1;            
            }
        }
        if (numStaPerDev == 0 && tree_info.length == 1 &&
            (tree_info[nIdx]['devRole'] == "Controller" ||
            tree_info[nIdx]['devRole'] == "Agent"))
        {           
			<% if tcWebApi_get("info_mesh","DeviceRole","h") = "1"  then %>
		    str += '"' + tree_info[nIdx]['devRole'] + '\n' + "IP " + tree_info[nIdx]['ip'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
			<% else %>
		    str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
			<% end if %>
        }
    }
    console.log("TREE INFO str = ",str);
    var NewDOTstring = "dinetwork{"+str+"}";
    var parsedData = vis.network.convertDot(NewDOTstring);
    for(var count=0;count<parsedData.nodes.length;count++)
    {
        console.log("NODE LABEL = ",parsedData.nodes[count].label);
        if(parsedData.nodes[count].label.startsWith('Agent'))
        {
            parsedData.nodes[count].color='Orange';
        }
        else if(parsedData.nodes[count].label.startsWith('STA'))
        {
            parsedData.nodes[count].color='Green';
        }
        else
        {
            parsedData.nodes[count].shape='box';
        }
    }
    var data = {
      nodes: parsedData.nodes,
      edges: parsedData.edges
    }
    var options = parsedData.options;
    var network = new vis.Network(div, data, options);
    network.setSize('100%','100%');
}
<% end if %>
function get_run_time_topology_cb(rsp)
{
    try
    {
        var r = JSON.parse(rsp);
        if(r.status == "SUCCESS")
        {
        		var tmp_jsTopoInfo = r.luaTopologyInfo;
						tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '"');
         		tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '"');
            var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
            document.getElementById("display_tree_vis").innerHTML = "";
            draw_topology_table(jsTopoInfo);
        }
        else
        {
            console.log("Failed to get Topology Info!\nStatus: ",r.status);
        }
    }
    catch(e)
    {
        console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
    }
}

function checkLoadRuntimeTopology()
{
		document.getElementById("display_tree_vis").style.display = "none";
		var x_response = JSO_get_runtime_topology();
		get_run_time_topology_cb(x_response);
}

checkLoadRuntimeTopology();
</SCRIPT>
</body>
</html>
