package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserRepository {

	public int join(String userID,String userPassword,String address,String name) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, address);
			pstmt.setString(4, name);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(String userID,String userPassword) {
		String SQL="select userPassword from user where userID=?";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)){
					return 1;
				}else
					return 0;
			}return -1;
		} catch (Exception e) {
		e.printStackTrace();
	}return -2;
}
}