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
    <TITLE>Cakes</TITLE>
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
</style>
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
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
                <a class="nav-link" href="login.asp">Login Or Sign Up </a>
              <% end if%>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4"><img src="logo.png"></h1>
          <div class="list-group">
            <a href="cakes.asp" class="list-group-item"><div>Cakes</div><div style="text-align: right;margin-top: -25px;">></div></a>
            <a href="cupcakes.asp" class="list-group-item">Cupcakes</a>
            <a href="donuts.asp" class="list-group-item">Donuts</a>
          </div>
        </div>
        <div class="col-lg-9">
    
          <div class="row" style="margin-top: 50px;">
            <%
        
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rs=Server.CreateObject("ADODB.RecordSet")

        dim sql3
        sql3="select * from CakeData where Item in('Cake')"
        set rs=con.Execute(sql3)
         
        do while not rs.EOF 
         
            response.write("<div class='col-lg-4 col-md-6 mb-4'><div class='card h-100' style='border: 1px solid #d6cccc;'>")
          response.write("<a href='item.asp?id=" & rs("PID") &"'><img class='card-img-top' height=200 width=200 src=" & rs("ImgSrc") & " alt=''></a>")
                  response.write("<div class='card-body'><h4 class='card-title'><a href='item.asp?id=" & rs("PID") & "'>" & rs("Name") & "</a></h4><h5>₹" & rs("Rate") & " </h5>" & "</div><div class='card-footer'><small class='text-muted'>&#9733; &#9733; &#9733; &#9733; &#9734;</small></div></div></div>")
          rs.MoveNext
        
        loop
      %>  
          </div>
        </div>
      </div>
    </div>
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white" style="font-family: 'Pacifico', cursive; font-size: 30px">Confection Connection©</p>
      </div
    </footer>

  </body>
</html>
