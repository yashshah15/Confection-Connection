<%@language="vbscript"%>
<%option explicit%>
<% dim name,loc,pid
    dim i
        for i=1 to Request.QueryString("pid").Count
            pid=Request.QueryString("pid")(i)
        next
    if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
        dim con,rs
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rs=Server.CreateObject("ADODB.RecordSet")
        dim sql
        sql="delete from UserCart where PID="&pid&";"
        set rs=con.Execute(sql)
        response.redirect("cart.asp")
    else
        name=""
        Response.cookies("UID")=Session.SessionID
        Response.cookies("UID").Expires=date+365
        dim conn,rss
        set conn=nothing
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rss=Server.CreateObject("ADODB.RecordSet")
        dim sql1
        sql1="delete from Cart where PID="&pid&";"
        set rss=conn.Execute(sql1)
        response.redirect("cart.asp")
    end if
%>