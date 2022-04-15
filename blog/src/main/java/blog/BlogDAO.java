package blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BlogDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// Database 연동 부분
	public BlogDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/blog_db";	// MySQL 주소 
			String dbID = "root";	//MySQL ID
			String dbPassword = "root";	//MySQL PASSWORD
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);	//DB 접속
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Database 테이블 불러오기
	public ArrayList<Blog> getList(){
		String SQL = "select write_id, write_title, write_content, date_format(write_date, \"%Y-%m-%d\")as write_date from blog_write order by write_id desc;";
		
		ArrayList<Blog> list = new ArrayList<Blog>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Blog blog = new Blog();
				blog.setWrite_id(rs.getInt(1));
				blog.setWrite_title(rs.getString(2));
				blog.setWrite_content(rs.getString(3));
				blog.setWrite_date(rs.getString(4));
				list.add(blog);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 글쓰기 작업
	public int write(String title, String content) {
		String SQL = "insert into blog_write values(null, ?, ?, default)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 문서 선택해서 읽기
	// 문서 읽기
	public Blog getBlog(int Write_id) {
		String SQL = "SELECT * FROM blog_write WHERE write_id = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, Write_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Blog blog = new Blog();
				blog.setWrite_id(rs.getInt(1));
				blog.setWrite_title(rs.getString(2));
				blog.setWrite_content(rs.getString(3));
				blog.setWrite_date(rs.getString(4));
				return blog;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
