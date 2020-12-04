<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 

User user=(User)session.getAttribute("currentUser");

if(user==null)
{
    response.sendRedirect("login_page.jsp");
}

%>

<% 
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostbyPostId(postId);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background: url(Image/C2.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .post-title{
                font-weight: 100;
                font-size:30px;
            }
            .post-content{
                font-weight: 100;
                font-size:20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                
            }
            .post-user-info{
                font-size: 20px;
                font-weight: 200;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
        
    </head>
    <body>
        <!--start of navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp">
      <span class="fa fa-asterisk"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-book"></span> Learn Code<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contact</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
      
    </ul> 
      <ul class="navbar-nav mr-right">
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span>Name</a>
          
          <li class="nav-item active">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle-o"></span>Logout</a>
      </li
      
          
      </ul>
  </div>
</nav>
        <!--end of navbar-->
        <!--main content ofbody-->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle() %></h4>  
                        </div>
                                <div class="card-body">
                                    <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
                                    
                                    <div class="row my-3 row-user">
                                        
                                        
                                        <div class="col-md-8">
                                            <% 
                                            UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                            %>
                                            <p class="post-user-info"><a href="#!">
                                            
                                                    NAME
                                                </a>
                                                    has posted: </p>
                                        </div>
                                        
                                         <div class="col-md-4">
                                             <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                        </div>
                                        
                                    </div>
                                        
                                    <p class="post-content"><%= p.getpContent() %></p>
                                    <br>
                                    <div class="post-code">
                                    <pre>
                                        <%= p.getpCode() %>
                                    </pre>
                                    </div>
                                </div>
                                 <div class="card-footer text-center bg-dark">
                                     <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-danger btn-sm"><i class="fa fa-thumbs-o-up"></i> <span>10</span></a>                    
                                   <a href="#!" class="btn btn-outline-danger btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                                </div>
                    </div>
                </div>
                
          
            </div>
     
        </div>
        
        
        
        <!--end of main content of body-->
        
        
        
        
         <!--profile modal-->
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white text-center">
                      <h5 class="modal-title" id="exampleModalLabel">TechBlog!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:135px;">
                          <br>
                             <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
                             
                             <!--DEtailss..-->
                             <div id="profile-detail">
                             <table class="table">
                            
                            <tbody>
                              <tr>
                                <th scope="row">ID: </th>
                                <td><%= user.getId() %></td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Email : </th>
                                <td><%= user.getEmail() %></td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Gender: </th>
                                <td><%= user.getGender() %></td>
                              </tr>
                               <tr>
                                <th scope="row">Status : </th>
                                <td><%= user.getAbout() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Registration Time : </th>
                                <td><%= user.getRdate()%></td>
                              </tr>
                              
                              
                            </tbody>
                          </table>
                             </div>
                              
                              
                              <!--profile eidt-->
                              <div id="profile-edit" style="display: none;">
                                  <h3 class="mt-2" style="color: crimson;">PLEASE EDIT CAREFULLY !</h3> 
                                  <form action="EditServlet" method="post" enctype="multipart/form-data">
                                      <table class="table">
                                          <tr>
                                              <td>ID:</td>
                                              <td><%= user.getId() %></td>
                                                  
                                          </tr>
                                          
                                          <tr>
                                              <td>Name: </td>
                                              <td><input type="text" class="form-control" name="user_name" values="<%= user.getName() %>" ></td>
                                          </tr>
                                          
                                          
                                          <tr>
                                              <td>Email: </td>
                                              <td><input type="email" class="form-control" name="user_email" values="<%= user.getEmail() %>" ></td>
                                          </tr>
                                          
                                           <tr>
                                              <td>Password: </td>
                                              <td><input type="password" class="form-control" name="user_password" values="<%= user.getPassword() %>" ></td>
                                          </tr>
                                          <tr>
                                              <td>Gender: </td>
                                              <td><%= user.getGender().toUpperCase() %></td>
                                          </tr>
                                          
                                          <tr>
                                              <td>About: </td>
                                              <td><textarea rows="3" class="form-control" name="user_about">
                                                      <%= user.getAbout() %>
                                                  </textarea>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>New Profile: </td>
                                              <td>
                                                  <input type="file" name="image" class="form-control">
                                              </td>
                                          </tr>
                                          
                                      </table>
                                                  
                                       <div class="container">
                                             <button type="submit" class="btn btn-outline-danger">SAVE</button>
                                        </div>
                                  </form>
                              </div>
                              
                              
                      </div>
                  </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                  </div>
                </div>
              </div>
        <!--end of profile modal-->
         <!--add post modal-->
                <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details.!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <form id="add-post-form" action="AddPostServlet" method="post" enctype='multipart/form-data'>
                              <div class="form-group">
                                  <select class="form-control" name="cid">
                                      <option selected disabled>--Select Category--</option>
                                      <% 
                                      PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                      ArrayList<Category> list=postd.getAllCategories();
                                      for(Category c:list)
                                      {
                                      %>
                                      <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                      <% 
                                        }
                                      %>
                                  </select>
                              </div>                          
                              <div class="form-group">
                                  <input name="pTitle" type="text" placeholder="Enter post title" class="form-control" > 
                              </div>
                              
                              <div class="form-group">
                                  <label>Enter your content</label>
                                  <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height:200px;">  
                                  </textarea>   
                              </div>
                              <div class="form-group">
                                  <label>Enter your program(if any)</label>
                                  <textarea name="pCode" class="form-control" placeholder="Enter your program(if any)" style="height:200px;">
                                  </textarea>
                              </div>
                              <div class="form-group">
                                  <label>Select picture</label><br>
                                  <input name="pic" type="file">
                                  
                                  
                              </div>
                                  <div class="container text-center">
                                      <button type="submit" class="btn btn-outline-danger">Post</button>
                                  </div>
                          </form>
                          
                          
                          
                      </div>
                                  
                    </div>
                  </div>
                </div>
        <!--end post modal-->
     
         <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myJs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function(){
               
               let editStatus = false;
               
                    $('#edit-profile-button').click(function(){
                        
                        if(editStatus === false)
                        {
                        $("#profile-detail").hide();
                        
                        $("#profile-edit").show();
                        editStatus =true;
                        $(this).text("Back");
                        }else
                        {
                            $("#profile-detail").show();
                        
                        $("#profile-edit").hide();
                        editStatus =false;
                        $(this).text("Edit");
                        
                        }
                        
                    });
            
            });
            
        </script>
        
       <!--now add post js-->
       <script>
           $(document).ready(function(){
                  // asynchronous request through ajax
            
                    $("#add-post-form").on("submit",function(event){
                
                        event.preventDefault();
                
                let form=new FormData(this);
                    
                    $.ajax({
                       url: "AddPostServlet",
                        type:'POST',
                        data: form ,
                        success: function(data,textStatus,jqXHR){
                            //success..
                            console.log(data);
                            if(data.trim()==='done')
                            {
                                swal("Good job!", "Saved successfullyy.!", "success");
                            }
                            else
                            {
                                swal("Error!!", "Something went wrong!!Try Again..", "error");
                            }
                            
                        },
                  
                        error: function(jqXHR,textStatus,errorThrown){
                            swal("Error!!", "Something went wrong!!Try Again..", "error");
                        },
                        processData: false,
                        contentType:false
                        
                    });
            });
              
           });
           
           
           
       </script>
        
        
    </body>
</html>
