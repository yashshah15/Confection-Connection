<%@language="vbscript"%>
<%option explicit%>
<%
	dim name,loc
    if session("name")<>"" then
        loc = InStr(session("name"), "@")
        name=Left(session("name"), loc-1)
    else
        name=""
    end if
	if Request.ServerVariables("REQUEST_METHOD")= "GET" then
		dim i,col
        for i=1 to Request.QueryString("val").Count
            col=Request.QueryString("val")(i)
        next
        dim email
        email=session("name")
        dim con,rs
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
    <title>Update Details</title>
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
    .sub{
    	background-color: #ffffff;
    	border: solid 2px #ff4a83;
    	border-radius: 2px;
    	width: 90px;
    	height: 30px;
    	cursor: pointer;
    	margin-left: 40px;
	}
	.sub:hover{
		box-shadow: 1px 1px 10px 1px #ff4a83;
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
              dim rss,pid,amt
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
        <h2 style="color: #ff4a83;">Edit Profile</h2><br>
        <div class="row">
        <h4 style="margin-left: 15px;">Enter new <%=col%>:</h4>
        <form method="post" action="updatelog.asp">
        	<input type="text" name=<%=col%> style="margin-left:10px; width:250px;" />
        	<input type="submit" value="Done" class="sub" />
       	</form>
       </div>
    </div>
</div>
</div>
</body>
</html>
<%
	session("col")=col
    end if
        %>