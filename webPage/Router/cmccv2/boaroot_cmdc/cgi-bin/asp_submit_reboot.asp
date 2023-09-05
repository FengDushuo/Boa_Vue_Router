<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
%>