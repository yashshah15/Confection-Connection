<%@language=vbscript%>
<%option explicit%>
<%
	dim name,number,email,address,con,rs,objMail,max,min,num
	name=Request.form("name")
	number=Request.form("number")
	email=Request.form("email")
	address=Request.form("address")
	'password=Request.form("password")'
	'cpassword=Request.form("Cpassword")'
	if Len(name)<2 then
	response.redirect "register.asp?err=1"

	elseif Len(number)>10 or Len(number)<10 then
	response.redirect "register.asp?err=3"

	elseif InStr(email,"@")=0 or InStr(email,".")=Len(email) then
	response.redirect "register.asp?err=2"

	else

	session("email")=email
	max=99999
	min=999
	Randomize
	num=Int((max-min+1)*Rnd)
	Set objMail = Server.CreateObject("CDO.Message")
	dim smtpServer, yourEmail, yourPassword
	smtpServer = "smtp.gmail.com"
	yourEmail = "your_company's_email_id"     'replace with a valid gmail account
	yourPassword = "your_password"   'replace with a valid password for account set in yourEmail
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = smtpServer
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465 
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = yourEmail
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = yourPassword
	objMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objMail.Configuration.Fields.Update
	objMail.Subject="OTP to set password. "
	objMail.htmlBody = "Your one-time-password is "&num&"!"
	objMail.From="company_mailID"
	objMail.To=email
	objMail.Send
	Response.Write(Session.SessionID&"<br>")
	session(Session.SessionID)=num
	Response.Write(session(Session.SessionID))
	set con=Server.CreateObject("ADODB.Connection")
	con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
	Set rs=Server.CreateObject("ADODB.RecordSet")
	dim sql
	sql="insert into UserInfo values('"&email&"','"&name&"','"&number&"','"&address&"');"
	set rs = con.Execute(sql)
	set rs=nothing
	con.close
	set con=nothing
	response.redirect("setpass.asp")
end if
%>