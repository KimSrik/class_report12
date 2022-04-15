<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Blog" %>
<%@ page import="blog.BlogDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성중</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		String title = null;
		if(request.getParameter("title") != null){
			title = request.getParameter("title");
		}
		
		String content = null;
		if(request.getParameter("content") != null){
			content = request.getParameter("content");
		}
		/* System.out.println("넘어온 제목 : " + title);
		System.out.println("넘어온 내용 : " + content); */

		if(title.isEmpty() || content.isEmpty()){
			script.println("<script>");
			script.println("alert('제목 또는 내용을 확인하세요')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BlogDAO blogDAO = new BlogDAO();
			int result = blogDAO.write(title, content);
			if(result == -1){
				script.println("<script>");
				script.println("alert('데이터베이스 오류. 관리자에게 문의하세요.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('글쓰기가 완료되었습니다.')");
				script.println("location.href = './blog.jsp';");
				script.println("</script>");
			}
		}
	%>

</body>
</html>