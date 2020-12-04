package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    
    Connection con;
    private int catId;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list=new ArrayList<>();
        try {
            
            String q="select * from categories";
            
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description =set.getString("description");
                
                Category c = new Category(cid, name, description);
               
                list.add(c);
               
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       
        
        return list;
    }
    
    public boolean savePost(Post p)
    {
        boolean f=false;
        try {
            
            String q="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return f;
    }
    
    
//    get al the posts
    public List<Post> getAllPosts()
    {
        List<Post> list=new ArrayList<>();
        //fetch all posts
        
        try {
            
            PreparedStatement p=con.prepareStatement("select * from post order by pid desc");
            
            
            ResultSet rs=p.executeQuery();
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
               String pContent=rs.getString("pContent");
               String pCode=rs.getString("pCode");
               String pPic=rs.getString("pPic");
               Timestamp date=rs.getTimestamp("pDate");
               int catId=rs.getInt("catId");
               int userId=rs.getInt("userId");
               Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
               list.add(post);
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catId)
    {
         List<Post> list=new ArrayList<>();
        //fetch all post by id..
        
         try {
            
            PreparedStatement p=con.prepareStatement("select * from post where catId=?");
            p.setInt(1,catId);
            ResultSet rs=p.executeQuery();
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
               String pContent=rs.getString("pContent");
               String pCode=rs.getString("pCode");
               String pPic=rs.getString("pPic");
               Timestamp date=rs.getTimestamp("pDate");
              
               int userId=rs.getInt("userId");
               Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
               list.add(post);
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        
        return list;
    }
 
    
    public Post getPostbyPostId(int postId)
    {
            Post post=null;
        String q="select * from post where pid=?";
        try{
        PreparedStatement pt=this.con.prepareStatement(q);
        pt.setInt(1,postId);
        ResultSet set=pt.executeQuery();
        if(set.next())
        {
            
            int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
               int cid=set.getInt("catId");
              
               int userId=set.getInt("userId");
               post=new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
            
        }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return post;
    }
    
}
