<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Blog" %>
<%@ page import="blog.BlogDAO" %>       
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.clearfix::after{
	    content: '';
	    display: block;
	    clear: both;
	}
	
	.btn-group, .btn-more{
		float: right;
	}
	
	.footer{
		position: absolute;
		bottom: 0;
		left: 50%;
		transform: translateX(-50%);
	}
	
</style>
<title>누군가의 블로그</title>
</head>
<body>
<%
	int Write_id = 0;
	if(request.getParameter("Write_id") != null){
		Write_id = Integer.parseInt(request.getParameter("Write_id"));
	}
	
	Blog blog = new BlogDAO().getBlog(Write_id);

%>


	<div class="wrap">
		<header class="header">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container-fluid">
			    <h1><a class="navbar-brand" href="./index.jsp">Someone's Blog</a></h1>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
			        </li>
					<li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="./index.jsp">Write</a>
			        </li>
			      </ul>
			      <form class="d-flex">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
		  </nav>
	  	</header>
	  
	  	<section class="section view-sec">
	  		<div class="container">
	  			<div class="col-lg-12">
					<div class="jumbotron" style="margin-top:20px;padding-top:30px">
						<h2 style="text-align:center">게시판 글 보기</h2>		
						<div>
							<span>제목</span>
							<span><%= blog.getWrite_title() %></span>
							<br>
							<span>내용</span>
							<span><%= blog.getWrite_content() %></span>
							<br>
							<span>작성일자</span>
							<span><%= blog.getWrite_date() %></span>
							<br>
						</div>
					</div>
					<div class="button-group">
						<a href="./bbs.jsp" class="btn btn-success">목록</a>
						<a href="./deleteAction.jsp?bbsID=<%= Write_id %>" class="btn btn-success">삭제</a>
						<a href="./update.jsp?bbsID=<%= Write_id %>" class="btn btn-success">수정</a>					
					</div>
				</div>
			</div>
	  	</section>
	  	
	  	<footer class="footer">
	  		<h2>COPYRIGHT Srik</h2>
	  	</footer>
  	</div>
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>