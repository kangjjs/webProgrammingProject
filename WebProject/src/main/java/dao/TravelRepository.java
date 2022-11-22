package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class TravelRepository {
	public int post(String userID, String title,String author,String description,String continent,
			String country,String destination,String startDate,String endDate) {
		String SQL = "INSERT INTO TRAVEL VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn= DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,title);
			pstmt.setString(3,author);
			pstmt.setString(4,description);
			pstmt.setString(5,continent);
			pstmt.setString(6,country);
			pstmt.setString(7,destination);
			pstmt.setString(8,startDate);
			pstmt.setString(9,endDate);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
