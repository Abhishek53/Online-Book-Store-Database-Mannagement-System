<%-- 
    Document   : MannagerLogin
    Created on : Nov 24, 2018, 8:43:14 AM
    Author     : ABHISHEK R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link href="css/login_sign_up_style.css" rel="stylesheet" type="text/css"/>

        
    </head>
    <body>
        <!-- Navigation --> 
        <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                        <a><i class="fa fa-book book-icon"></i></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                                <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav ml-auto">
                                        
                                </ul>
                            <form action="" class="search-container">
                                <input type="text" placeholder="  Search" name="">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                </div>

        </nav>
        
        <div class="modal-dialog text-center">
  	<div class="col-sm-8 main-section">
		<div class="modal-content">
			

			<div class="col-12 user-image">
				<img src="img/unknown.png">
			</div>


                    <form class="col-12" action="LoginController" method="POST">
				<div class="form-group">
					<input type="text" class="form-control" name="login_email" placeholder="Enter email address">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="login_password" placeholder="Enter password">
				</div>
				<button class="loginsignup btn" type="submit" class="btn">Login</button>
                    </form>
                    <br>
			

		</div><!--end of modal content div -->  		
  	</div>
  	
  </div>
    </body>
</html>
