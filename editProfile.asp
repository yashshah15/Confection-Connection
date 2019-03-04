<%@language="vbscript"%>
<% dim name,loc
    if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
    else
        name=""
    end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <script type="text/javascript">
if (!!window.performance && window.performance.navigation.type === 2) {
            // value 2 means "The page was accessed by navigating into the history"
            console.log('Reloading');
            window.location.reload(); // reload whole page

        }
  </script>
    <TITLE>Edit Profile</TITLE>
    <link rel="icon" sizes="300*300" href="logo.png">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/homepage.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  </head>
  <style>
  .mylink:hover{
    background-color: #edeff3;
    }
    .box{
      margin-top:-200px;  
      border-radius: 2px;
    border: solid 1px;
    border-bottom-color: #ffffff;
    border-right: white;
    border-left: white;
    border-top-color: #ffffff;
    box-shadow: 0.5px 0.5px 10px 0.5px #ff4a83;
    }
    .show{
        box-shadow: 0.5px 0.5px 10px 0.5px #d8d8d8;
        height:40px;
        margin-left: 10px;
        padding-left: 5px;
        padding-top: 5px;
        width: 300px;
    }
    .mbtn{
      border: solid 0px;
      margin-left: 5px;
      padding-left: 1px;
    }
    .mbtn:hover{
      box-shadow: 1px 1px 10px 1px #d8d8d8;
          cursor: pointer;
    }
</style>
  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#" style="font-family: 'Pacifico', cursive; font-size: 30px">Confection Connection</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
           <li class="nav-item ">
            <%dim q
              dim con,rs,rss,pid,amt
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rss=Server.CreateObject("ADODB.RecordSet")
        q=0
        if session("name")<>"" then
          dim sql
          sql="select Quantity from UserCart where Email in('"&session("name")&"');"
          set rss=con.Execute(sql)
          do while not rss.EOF
            q=q+rss("Quantity")
          rss.MoveNext
        loop
      else
        dim cookie
        cookie=Request.cookies("UID")
        dim sql1
        sql1="select Quantity from Cart where SessionID in ('"&cookie&"');"
        set rss=con.Execute(sql1)
        do while not rss.EOF
          q=q+rss("Quantity")
          rss.MoveNext
        loop
        end if 
        %>
              <a class="nav-link" href="cart.asp"><i class="material-icons">shopping_cart</i><span>(<%=q%>)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="aboutus.asp">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="homepage.asp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <div class="dropdown">
                    <%if (session("name")<>"") then%>
                    <a class="nav-link" class="dropdown-toggle" data-toggle="dropdown" href="#">Hello, <%=name%></a>
                        <ul class="dropdown-menu">
                        <a style="text-decoration: none;" href="editProfile.asp"> 
                            <li class="mylink">&nbsp&nbspEdit Profile</li>
                        </a>
                        <a style="text-decoration: none;" href="logout.asp"> 
                        <li class="mylink">&nbsp&nbspLogout</li>
                        </a>
                            </ul>
                </div>
              <% else%>
                <a class="nav-link" href="Log_in.html">Login Or Sign Up </a>
              <% end if%>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4"><img src="logo.png"></h1>
          <div class="list-group">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-3">
        </div>
      <div class="box col-lg-9" style="padding-left: 50px;padding-top: 10px;">
        <h2 style="color: #ff4a83;">Edit Profile</h2>
        <% if name<>"" then 
            
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rs=Server.CreateObject("ADODB.RecordSet")
        dim i 
        
        sql="select * from UserInfo where Email='"&session("name")&"'"
        set rs=con.Execute(sql)
        
        %>  
        <br>
        <div class="row">
          <h6 style="margin-top: 7px;" id="name">&nbsp&nbsp&nbspName :</h6>
          <div class="show" style="margin-left: 38px;">
            <% Response.write rs("Name")%>
          </div>
          <a href="update.asp?val=Name">
            <button class="mbtn">
                <i class="material-icons" style="margin-left: 15px;margin-top: 7px;color:black;">&#xE150;</i>
          </button></a>
        </div><br>
        <div class="row">
          <h6 style="margin-top: 7px;" id="email">&nbsp&nbsp&nbspEmail :</h6><div class="show" style="margin-left: 42px;">
            <% Response.write rs("Email")%>
          </div>
          <a href="#">
          <button class="mbtn" style="cursor: not-allowed;">
              <i class="material-icons" style="margin-left: 15px;margin-top: 7px;color:black;">&#xE150;</i>
          </button>
        </a>
        </div><br>
        <div class="row">
          <h6 style="margin-top: 7px;" id="phone">&nbsp&nbsp&nbspPhone No :</h6><div class="show">
            <% Response.write rs("Phone")%>
          </div>
          <a href="update.asp?val=Phone">
           <button class="mbtn">
              <i class="material-icons" style="margin-left: 15px;margin-top: 7px;color:black;">&#xE150;</i>
          </button>
        </a>
        </div><br>
          <div class="row">
          <h6 style="margin-top: 7px;" id="address">&nbsp&nbsp&nbspAddress :</h6>
          <div class="show" style="height: 100px; margin-left: 24px;">
            <% Response.write rs("Address")%>
          </div>
          <a href="update.asp?val=Address">
           <button class="mbtn" style="height:40px;">
              <i class="material-icons" style="margin-left: 15px;margin-top: 7px;color:black;">&#xE150;</i>
          </button>
        </a>
        </div><br>
        </div>
        <% else 
          end if %>
      </div>
    </div>
  </body>
  
</html>