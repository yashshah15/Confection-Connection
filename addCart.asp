<%@language="vbscript"%>
<%option explicit%>
<% dim name,loc,pid
    if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
        pid=session("pid")
        dim con,rs
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rs=Server.CreateObject("ADODB.RecordSet")
        dim sql
        sql="select PID from UserCart where Email='"&session("name")&"';"
        set rs=con.Execute(sql)
        do while not rs.EOF
            if (pid-rs("PID")=0) then        
                    response.redirect("cart.asp?err=2") 
            end if  
        rs.MoveNext
        loop 
        sql="insert into UserCart values('"&session("name")&"',"&pid&",1);"
        set rs=con.Execute(sql)
        if (pid<1010 OR pid=1010) then
            response.redirect("cakes.asp")
        end if
        if (pid<1019) then 
            response.redirect("cupcakes.asp")
        end if
        if (pid>1019 OR pid=1019) then
            response.redirect("donuts.asp")
        end if 
    else
        name=""
        pid=session("pid")
        Response.cookies("UID")=Session.SessionID
        Response.cookies("UID").Expires=date+365
        dim conn,rss
        set conn=nothing
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rss=Server.CreateObject("ADODB.RecordSet")
        sql="select PID from Cart where SessionID='"&session.SessionID&"';"
        set rss=conn.Execute(sql)
        do while not rss.EOF
            if (pid-rss("PID")=0) then        
                    response.redirect("cart.asp?err=2") 
            end if  
        rss.MoveNext
        loop 
        sql="insert into Cart values('"&Session.SessionID&"',"&pid&",1);"
        set rss=conn.Execute(sql)
        if (pid<1010 OR pid=1010) then
            response.redirect("cakes.asp")
        end if
        if (pid<1019) then 
            response.redirect("cupcakes.asp")
        end if
        if (pid>1019 OR pid=1019) then
            response.redirect("donuts.asp")
        end if
    end if
%>
