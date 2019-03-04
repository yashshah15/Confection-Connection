<%@language="vbscript"%>
<%option explicit%>
<%
dim uname,pwd

uname=request.Form("sap")
pwd=Request.Form("password")

dim con,rs

set con=Server.CreateObject("ADODB.Connection")
con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")

Set rs=Server.CreateObject("ADODB.RecordSet")

dim sql
sql="select * from UserLogin"
set rs=con.Execute(sql)

do while not rs.EOF
	response.write rs("Email") & uname & pwd & rs("Password")
	if rs("Email")=uname AND rs("Password")=pwd then
		session("name")=uname
		session.Timeout=1440
		response.redirect "homepage.asp"
	else	
		rs.MoveNext
	end if
loop
	response.redirect "login.asp?err=1"
%>
<html><body></body></html>