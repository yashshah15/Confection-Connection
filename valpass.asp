<%@language="vbscript"%>
<%option explicit%>
<%
dim fname
fname=Request.form("otp")
'response.write(fname&"<br>")'
dim otp,rs,con,cp,p
p=Request.form("password")
cp=Request.form("Cpassword")
otp=session(Session.SessionID)
response.write(otp&"<br>")
if (otp-fname=0) then
	if cp=p then 
		set con=Server.CreateObject("ADODB.Connection")
		con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
		set rs=Server.CreateObject("ADODB.RecordSet")
		rs.open "UserLogin",con,0,3,2
		rs.AddNew
		rs("Email")=session("email")
		rs("Password")=Request.form("Cpassword")
		rs.update
		rs.close
		set rs=nothing
		response.redirect("login.asp")
	else
		response.redirect("setpass.asp?err=2")
	end if		
else
	response.redirect("setpass.asp?err=1")

end if
%>