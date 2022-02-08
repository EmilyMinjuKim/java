package jspbook.addrbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AddrBean {
	
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	//JNDI
	public void connect() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/xe");
			
			con = ds.getConnection();
			System.out.println("connection success...");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//-----------------------------------------------------------------------------
	public void disconnect() {
		try {
			if(con!=null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("connection close...");
	}
	
	//-----------------------------------------------------------------------------
	//Update
	public boolean updateDB(AddrBook addrBook) {
		connect();
		String sql = "update addrbook set ab_name=?, ab_email=?, ab_comdept=?, ab_birth=?, ab_tel=?, ab_memo=? where ab_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			//매핑 
			pstmt.setString(1, addrBook.getAb_name());
			pstmt.setString(2, addrBook.getAb_email());
			pstmt.setString(3, addrBook.getAb_comdept());
			pstmt.setString(4, addrBook.getAb_birth());
			pstmt.setString(5, addrBook.getAb_tel());
			pstmt.setString(6, addrBook.getAb_memo());
			pstmt.setInt(7, addrBook.getAb_id());
			
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	//-----------------------------------------------------------------------------
	//Delete
	public boolean deleteDB(int gb_id) {
		connect();
		String sql = "delete from addrbook where ab_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	//-----------------------------------------------------------------------------
	//Insert
	public boolean insertDB(AddrBook addrBook) {
		connect();
		String sql = "insert into addrbook values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, addrBook.getAb_id());
			pstmt.setString(2, addrBook.getAb_name());
			pstmt.setString(3, addrBook.getAb_email());
			pstmt.setString(4, addrBook.getAb_comdept());
			pstmt.setString(5, addrBook.getAb_birth());
			pstmt.setString(6, addrBook.getAb_tel());
			pstmt.setString(7, addrBook.getAb_memo());
			
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	//-----------------------------------------------------------------------------
	//상세페이지 
	public AddrBook getDB(int gb_id) {
		connect();
		
		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrBook = new AddrBook();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			addrBook.setAb_id(rs.getInt("ab_id"));
			addrBook.setAb_name(rs.getString("ab_name"));
			addrBook.setAb_email(rs.getString("ab_email"));
			addrBook.setAb_comdept(rs.getString("ab_comdept"));
			addrBook.setAb_birth(rs.getString("ab_birth"));
			addrBook.setAb_tel(rs.getString("ab_tel"));
			addrBook.setAb_memo(rs.getString("ab_memo"));
			rs.close();

			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			disconnect();
		}
		
		return addrBook;
	}
	
	//-----------------------------------------------------------------------------
	//전체 주소 목록
	public ArrayList<AddrBook> getDBList() {
		connect();
		
		String sql = "select * from addrbook order by ab_id";
		ArrayList<AddrBook> addrList = new ArrayList<>();
		AddrBook addrBook = new AddrBook();
		
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				addrBook.setAb_id(rs.getInt("ab_id"));
				addrBook.setAb_name(rs.getString("ab_name"));
				addrBook.setAb_email(rs.getString("ab_email"));
				addrBook.setAb_comdept(rs.getString("ab_comdept"));
				addrBook.setAb_birth(rs.getString("ab_birth"));
				addrBook.setAb_tel(rs.getString("ab_tel"));
				addrBook.setAb_memo(rs.getString("ab_memo"));
				
				addrList.add(addrBook);
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			disconnect();
		}
		
		return addrList;
	}
}
