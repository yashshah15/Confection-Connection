<%@language="vbscript"%>
<%option explicit%>
<% dim name,loc
    if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
    else
        name=""
    end if
     dim i,pid
        for i=1 to Request.QueryString("id").Count
            pid=Request.QueryString("id")(i)
        next
    dim t
    if (pid<1011) then
      t="Cake"
    end if
    if (pid>1010 AND pid<1019) then
      t="Cupcake"
    end if
    if (pid>1019) then
      t="Donut"
    end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title><%=t%></title>
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
  .btnMy{
        margin-left: 150px;
    width: 150px;
    background: rgba(202, 202, 202, 0.48);
    text-align: center;
    height: 35px;
    margin-bottom: 10px;
    padding-top: 4px;
  }
  .btnMy:hover{
    box-shadow: 1px 1px 5px 1px #989696;
  }
  .linkMy:hover{
    text-decoration: none;
  }
  .card{
    border:0px;
    border-radius: 2px;
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
              dim con,rs,rss,amt
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
              <a class="nav-link" href="cart.asp"><i class="material-icons">shopping_cart</i><span>(<%=q%>)</span>
            </a>
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
     <%
       
        set con=nothing
        set con=Server.CreateObject("ADODB.Connection")
        con.Open ("Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=C:\\inetpub\wwwroot\ASP\userDb.mdb")
        Set rs=Server.CreateObject("ADODB.RecordSet")
       
        for i=1 to Request.QueryString("id").Count
            pid=Request.QueryString("id")(i)
        next
        session("pid")=pid
        
        sql="select * from CakeData where PID="&pid
        set rs=con.Execute(sql)
    %>
    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4"><img src="logo.png"></h1>
          <div class="list-group">
            <a href="cakes.asp" class="list-group-item">Cakes</a>
            <a href="cupcakes.asp" class="list-group-item">Cupcakes</a>
            <a href="donuts.asp" class="list-group-item">Donuts</a>
          </div>
        </div>
        <div class="col-lg-7">
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            </ol>
            <div class="card h-100" style="margin-top: -35px; border-radius: 10px;">
            <div class="carousel-inner" role="listbox">
                <img class="d-block img-fluid"  width=600 src=<%=rs("ImgSrc")%> alt="First slide" style="border-radius: 10px;">
              </div>
          </div>
          </div>
          <div class="row">
            <div class="col-lg-10 col-md-6 mb-4">
                <!-- <a href="#"><img class="card-img-top" src="http://pl acehold.it/700x400" alt=""></a>-->
                <div class="card-body" style="width: 550px;">
                  <h4 class="card-title" style="color: #ff4a83;">
                    <%=rs("Name")%><%if rs("PID")<1011 then%>&nbsp&nbsp&nbsp&nbsp(500gm)<% end if%>
                  </h4>
                  <h5>₹<%=rs("Rate")%></h5>
                  <p class="card-text"><%=rs("Description")%>
                    
                  </p>
                </div>
                <a class="linkMy" href="addCart.asp"><div class="btnMy">Add To Cart</div></a>
                <div class="card-footer" >
                  <small class="text-muted" style="font-size: 18px;">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
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
