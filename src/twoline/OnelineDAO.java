package twoline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OnelineDAO { //data access object
	private String url;
	private String user;
	private String passwd; 
	
	public OnelineDAO() { //생성자
		this.url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
		this.user = "root";
		this.passwd = "1004";
	}
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	 
		return con;
	}
	
	public ArrayList<OnelineDTO> getList() {
		Connection con = null;
		String sql = "select * from oneline order by no desc";
		ResultSet rs = null;	
		PreparedStatement pstmt = null;
		ArrayList<OnelineDTO> dtos = new ArrayList<OnelineDTO>();

		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String memo = rs.getString("memo");
				String wdate = rs.getString("wdate");
				
				OnelineDTO dto = new OnelineDTO(no,memo,wdate);
				dtos.add(dto);			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {	
			try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return dtos;
	}
	public void insert(OnelineDTO dto) {
		Connection con = null;
		String sql = "insert into oneline(memo) values(?)";
		PreparedStatement pstmt = null;
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMemo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void delete(OnelineDTO dto) {
		Connection con = null;
		String sql = "delete from oneline where no=?";
		PreparedStatement pstmt = null;
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void delete(int no) 
	{
		Connection con = null;
		String sql = "delete from oneline where no=("+ no +")";
		PreparedStatement pstmt = null;
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
