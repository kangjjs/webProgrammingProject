package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class TravelRepository {

	public void join(String userID, String userPassword) {
		String SQL = "INSERT INTO USER VALUES(?,?)";
		try {
			Connection conn= DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,ID);
			pstmt.setString(2, );
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
