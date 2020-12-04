
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 73% 93%, 29% 93%, 0 100%, 0 0);
            }
        </style>
        
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background" style="padding-bottom: 50px;">
            
            <div class="container">
                
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        
                        <div class="card-header text-center bg-danger text-white">
                            <span class=" fa fa-user-circle-o fa-3x"></span> Register Here!
                            
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                
                                <div class="form-group">
                                  <label for="user_name">User Name</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                
                                
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                   
                                </div>
                                
                                
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                 Male <input type="radio" id="male" class="form-control" value="Male" name="user_gender">Female <input id="female" type="radio" class="form-control" value="Female" name="user_gender">
                                </div>
                               
                                <div class="form-group">
                                    <textarea name="user_about" class="form-control" id="s_about" cols="30" rows="4" placeholder="Enter Something about Yourself.."></textarea>
                                </div>
                                
                                
                                <div class="form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree to terms and conditions.</label>
                                </div>
                                
                                
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-3x fa-spin"></span>
                                    <br>
                                    <h4> Please wait..  </h4>                         
                                </div>
                                
                                
                                
                                <br>
                                <button id="submit-btn"type="submit" class="btn btn-primary">Sign Up</button>
                                
                              </form>
                            
                            
                            
                        </div>
                        <div class="card-footer">
                            
                        </div>
                        
                        
                    </div>
                    
                    
                    
                </div>
                
                
            </div>
            
            
            
            
        </main>
        
        
         <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myJs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded..")
                
             $("#reg-form").on('submit',function(event){
                 event.preventDefault();
                 
                 
                 
                let form = new FormData(this);
                
                $("#submit-btn").hide();
                $("#loader").show();
                
                 //send to reg servlet
                 $.ajax({
                     url:"RegisterServlet",
                     type: 'POST',
                     data: form ,
                     success: function (data, textStatus, jqXHR){
                         console.log(data);
                         $("#submit-btn").show();
                         $("#loader").hide();
                         
                         if(data.trim() ==='done')
                         {
                         swal("Registered Sucessfully..!! We are redirecting to login page..").then((value) => {
                                        window.location = "login_page.jsp";
                            });
                         
                         }
                         else{
                             swal(data);
                         }
                         
                     },
                   error: function (jqXHR, textStatus, errorThrown){
                     console.log(jqXHR); 
                      $("#submit-btn").show();
                         $("#loader").hide();
                         
                         
                         swal(" Something went wrong..try again..!");
                         
                   },
                   
                   processData : false,
                   contentType: false
                 });
                 
                 
             }); 
             
            });
        </script>
        
    </body>
</html>
