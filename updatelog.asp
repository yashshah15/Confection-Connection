<%@language=vbscript%>
<%option explicit%>
<%
dim i,col
col=session("col")
dim val
val=Request.form(col)
if col="Name" then
	if Len(val)<2 then
		response.redirect "editProfile.asp"
	end if
end if
if col="Phone" then
	if Len(val)>11 or Len(val)<9 then
		response.redirect "editProfile.asp"
	end if
end if
if col="Email" then
	if InStr(val,"@")=0 or InStr(val,".")=Len(val) then
		response.redirect "editProfile.asp"
	end if
end if
if col="Address" then
	if val="" then
		response.redirect "editProfile.asp"
	end if
end if
dim con,rs
set con=Server.CreateObject("ADODB.Connection")
con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
Set rs=Server.CreateObject("ADODB.RecordSet") 	
dim sql
sql="update UserInfo set "&col&"='"&val&"' where Email='"&session("name")&"'"

response.write(sql)
set rs=con.Execute(sql)
 response.redirect("editProfile.asp")

%>