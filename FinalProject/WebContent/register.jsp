<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>

        <%@include file="components/common_css_js.jsp" %>
        
         
        <style>
        body{
          background-image: url("img/bg.jpg");
          background-repeat: no-repeat;
          background-size: cover;
        }
        
        </style>
    </head>
    <body>

        <%@include  file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-6 mx-auto">                  

                    <div class="card md-5">                        
                        <%@include  file="components/message.jsp" %>                        
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/userlogo.png"  style="max-width: 150px;" class="img-fluid" alt="">
                            </div>


                            <h3 class="text-center my-3">Sign up here !!</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height: 150px;" class="form-control" placeholder="Enter your address"></textarea>


                                </div>

                                <div class="container text-center md-5"> 
                                    <button type="submit" class="btn btn-outline-success btn-lg">Register</button>
                                    <button type="reset" class="btn btn-outline-warning btn-lg">Reset</button>

                                </div>


                            </form>


                        </div>

                    </div>

                </div>
            </div>



        </div>
     
    </body>
</html>
