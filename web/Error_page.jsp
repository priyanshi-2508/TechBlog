<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry.! Something went wrong..!!</title>
        
         <!--css-->
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
        <div class="container text-center" style="padding-top: 10px;">
            <img src="Image/404.jpg" class="img-fluid" >
            <h3 class="display-3">Sorry! Something went wrong..!!</h3>
            <%= exception %>
            <a href="index.jsp" class="btn primary-background btn-large text-white mt-3"> HOME </a>
        </div>
    </body>
</html>
