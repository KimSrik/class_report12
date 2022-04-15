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
	
	// Database ���� �κ�
	public BlogDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/blog_db";	// MySQL �ּ� 
			String dbID = "root";	//MySQL ID
			String dbPassword = "root";	//MySQL PASSWORD
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);	//DB ����
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Database ���̺� �ҷ�����
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
	
	// �۾��� �۾�
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
	
	// ���� �����ؼ� �б�
	// ���� �б�
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
