<%@language="vbscript"%>
<%option explicit%>
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
    <TITLE>About Us</TITLE>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="icon" sizes="300*300" href="logo.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/homepage.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  </head>
  <style>
  .mylink:hover{
    background-color: #edeff3;
    }
    .fa {
    padding: 20px;
    font-size: 30px;
    text-align: center;
    text-decoration: none;
    margin: 5px 2px;
    border-radius: 50%;
}
  .fa:hover {
    opacity: 0.7;
  }
  .fa-facebook {
    background: #3B5998;
    color: white;
  }
  .fa-twitter {
    background: #55ACEE;
    color: white;
  }
  .fa-google {
    background: #dd4b39;
    color: white;
  }
  .fa-instagram {
    background: #125688;
    color: white;
  }
</style>
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
if (!!window.performance && window.performance.navigation.type === 2) {
            // value 2 means "The page was accessed by navigating into the history"
            console.log('Reloading');
            window.location.reload(); // reload whole page

        }
  </script>
  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="#" style="font-family: 'Pacifico', cursive;font-size: 28px">Confection Connection</a>
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
              <a class="nav-link" href="#">About</a>
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
            <a href="cakes.asp" class="list-group-item">Cakes</a>
            <a href="cupcakes.asp" class="list-group-item">Cup Cakes</a>
            <a href="donuts.asp" class="list-group-item">Donuts</a>
          </div>
        </div>
        <div class="col-lg-9">
          <center> <h1 style="font-family: 'Pacifico', cursive;font-size: 60px;margin-top: 60px;
    margin-left: 65px; color: #ff4a83">------About Us------ </h1> </center> <hr style="color: #ff4a83">  

          <div id="carouselExampleIndicators" class="carousel slide my-5" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox" style="margin-left: 120px;">
              <div class="carousel-item active">
                <img class="d-block img-fluid" width=600 src="https://static.pexels.com/photos/353347/pexels-photo-353347.jpeg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" width=600 src="images/abt1.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid"  width=600 src="images/donut1.jpeg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
  <h4 style="font-family: 'Pacifico', cursive;font-size: 30px;margin-top: 40px;
    margin-left: 0px; color: #ff4a83">Background</h4> </center>
    <br> <hr style="color: #ff4a83">        



The Company is engaged in the business of manufacturing cakes, cupcakes and donuts. The Company has state of an art manufacturing facility at Charkop, Kandivali (West), admeasuring 14500 sq ft. The Company operates under the brand name “Confection Connection”, which is copyright and registered in India.<br>


  <h4 style="font-family: 'Pacifico', cursive;font-size: 30px;margin-top: 60px;
    margin-left: 0px; color: #ff4a83">Our Focus – 5P’s:</h4> </center>
    <br> <hr style="color: #ff4a83">
<h5>1. Product Quality</h5><br>
We adhere to strictest quality of food being manufactured at our factory, with special attention on taste, nutritional properties, textures, shelf life, so on and so forth, before it reaches to the ultimate customers. <br>

<br>

<h5>2.Product Diversity</h5><br>
We just not manufacture cakes; it’s the happiness that we deliver with utmost quality, retaining product taste, vitamins & nutrients, which are especially important for everyone’s health.<br>
<br>

<h5>3.Product Distribution</h5><br>
We believe that product distribution is important part of any organization and key element in the entire supply chain.<br> 
<br>
<h5>4.Profound Technology</h5><br>

We also offer a varied selection of seasonal cakes and change our season-oriented menus two times a year.<br>
<br>

<h5>5.Product Hygiene</h5><br>
For food and beverage industry, Hygiene is crucial and plays a vital role for ongoing sustainability / growth.<br> <br><br>

 

</h5>
        </div>
      </div>
    </div>

      <hr style="color: #ff4a83">

    <center><a href="#" class="fa fa-facebook" style="text-decoration: none;"></a>
    <a href="#" class="fa fa-twitter" style="text-decoration: none;"></a>
    <a href="#" class="fa fa-google" style="text-decoration: none;"></a>
    <a href="#" class="fa fa-instagram" style="text-decoration: none;"></a>
    </center>
    <div class="row"> <div class="col-lg-4 col-md-6 mb-4"> <div class="card h-100"> </div> </div> </div>
    <div class="row"> <div class="col-lg-4 col-md-6 mb-4"> <div class="card h-100"> </div> </div> </div>
   

    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white" style="font-family: 'Pacifico', cursive;font-size: 30px">Confection Connection©</p>
      </div>
    </footer>
  </body>
</html>
