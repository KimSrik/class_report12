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
	  
	  	<section class="section write-sec">
	  		<div class="container">
	  			<form method="post" action="./writeAction.jsp">
			  		<div class="mb-3">
					  <!-- <label for="title" class="form-label">제목</label> -->
					  제목
					  <input type="text" class="form-control title" name="title" placeholder="제목을 입력해주세요.">
					</div>
					<div class="mb-3">
					  <!-- <label for="content" class="form-label">내용</label> -->
					  내용
					  <textarea class="form-control content" name="content" rows="10" placeholder="내용을 입력하는 곳입니다."></textarea>
					</div>
					<div class="btn-group">
						<input type="reset" value="모두지우기" class="btn btn-secondary btn-clear">
						<input type="submit" value="글쓰기" class="btn btn-primary btn-complete">
					</div>
				</form>
			</div>
	  	</section>
	  	

	  	<section class="section show-sec">
	  		<div class="container">
	  			<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">제목</th>
				      <th scope="col">내용</th>
				      <th scope="col">날짜</th>
				    </tr>
				  </thead>			  
				  <tbody>
<%
					PrintWriter script=response.getWriter();
				
					BlogDAO blogDAO = new BlogDAO();
					ArrayList<Blog> list = blogDAO.getList();
					for(int idx=0; idx<list.size(); idx++){
%>
				    <tr>
				      <th scope="row"> <%= list.get(idx).getWrite_id() %> </th>
				      <td><a href = "./view.jsp?getWrite_id=<%= list.get(idx).getWrite_id() %>" style="color:#000;text-decoration:none"><%= list.get(idx).getWrite_title() %></a></td>
				      <td><a href = "./view.jsp?getWrite_id=<%= list.get(idx).getWrite_id() %>" style="color:#000;text-decoration:none"><%= list.get(idx).getWrite_content() %></a></td>
				      <td><%= list.get(idx).getWrite_date() %></td>
				    </tr>
<%
					}
%>
				    
				  </tbody>
				</table>
				<button type="button" class="btn btn-info btn-more">더보기</button>	
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