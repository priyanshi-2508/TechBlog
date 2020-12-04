<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<% 
    Thread.sleep(1000);
        PostDao d=new PostDao(ConnectionProvider.getConnection());

        int cid=Integer.parseInt(request.getParameter("cid"));
        List<Post> posts=null;
        if(cid==0)
        {
         posts=d.getAllPosts();
        }else
        {
            posts=d.getPostByCatId(cid);
        }
        if(posts.size()==0)
        {
            out.println("<h4 class='text-center'>No Post in this Category..!!</h4>");
            return;
        }
        for(Post p:posts)
        {
%>
<div class="col-md-6 mt-2">
    <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
    <div class="card">
        <div class="card-body">
            <b><%= p.getpTitle()%></b>
            <p><%= p.getpContent() %></p>
           
        </div>
            <div class="card-footer text-center bg-dark">
                 <a href="#!" class="btn btn-outline-danger btn-sm"><i class="fa fa-thumbs-o-up"></i> <span>10</span></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-danger btn-sm">Read More..</a>
                <a href="#!" class="btn btn-outline-danger btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
            
            </div>
    </div>
    
</div>


<%  
}
%>
</div>