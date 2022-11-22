package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class SouvenirRepository {
	public int post(String userID,String name,String author,int price,
			String description,String continent,String country,String destination,String filename) {
		String SQL = "INSERT INTO SOUVENIR VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn= DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,name);
			pstmt.setString(3,author);
			pstmt.setInt(4,price);
			pstmt.setString(5,continent);
			pstmt.setString(6,country);
			pstmt.setString(7,destination);;
			pstmt.setString(8,description);
			pstmt.setString(9, filename);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
