<%@language="vbscript"%>
<%option explicit%>
<% dim error
  dim i
  error=0
  for i=1 to Request.QueryString("err").Count
      error=Request.QueryString("err")(i)
  next
%>
<html>
  <head>
    <title>Set Password</title>
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
  	<link rel="icon" sizes="300*300" href="logo.png">
    <meta charset="utf-8">
    <link rel="stylesheet" href="styleR.css"> </link>
</head> 
    <body>
    <div class="container">
      <div class="row">
        <form method="post" name="form" action="valpass.asp">
          <div class="box">
        <img src="logo.png" width=200 height=200> 
              <div class="txt">Set Password</div>
              <div class="form-input">
                  <input type="text" style="margin-left: 28px;" name="otp" placeholder="Enter OTP">
                  <br>
                  <%if error=1 then%>  
                    <div class="mydialog">
                      <h6>Incorrect OTP !</h6>
                    </div>
                  <%end if%>
                   <i class="material-icons">vpn_key</i>
                  <input type="Password" name="password" placeholder="Set Password">
				  <br>
                  <i class="material-icons">vpn_key</i>
                  <input type="Password" name="Cpassword" placeholder="Confirm Password"><br>
                  <%if error=2 then%>  
                    <div class="mydialog">
                      <h6>Incorrect Password !</h6>
                    </div>
                  <%end if%>  
              </div>
        <input type="submit" class="mbtn" value="Submit">
          </div>
        </form>
    </div>
  </div>
  </body>
</html>