<%
    dim q,con,rs,rss,rsss
    q=0
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        dim i,pid
        for i=1 to Request.QueryString("id").Count
            pid=Request.QueryString("id")(i)
        next
if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
        response.write(pid)
        Set rs=Server.CreateObject("ADODB.RecordSet")
        sql="select * from UserCart where Email in('"&session("name")&"') AND PID="&pid&";"
        set rss=con.Execute(sql)
        q=rss("Quantity")
        q=q-1
        if (q>0) then
            sql2="update UserCart set Quantity="&q&" where PID="&rss("PID")&";"
            set rs=con.Execute(sql2) 
        end if
        response.redirect("cart.asp")

else
        dim cookie
        cookie=Request.cookies("UID")
    response.write(q)
        Set rs=Server.CreateObject("ADODB.RecordSet")
        dim sql2
        dim sql1
        sql1="select * from Cart where SessionID in ('"&cookie&"') AND PID="&pid&";"
        set rss=con.Execute(sql1)
        q=rss("Quantity")
        q=q-1
        if (q>0) then
        sql2="update Cart set Quantity="&q&" where PID="&rss("PID")&";"
        set rs=con.Execute(sql2) 
        end if
        response.redirect("cart.asp")
end if
%>