package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import dto.Travel;
import util.DatabaseUtil;

public class TravelRepository {
	public int post(String userID, String title,String author,String description,String continent,
			String country,String destination,String startDate,String endDate,String filename) {
		String SQL = "INSERT INTO TRAVEL VALUES(?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(10,filename);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Travel> getList(String userID){
		String sql="select * from travel where userID=?";
		ArrayList<Travel> list = new ArrayList<>();
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String title=rs.getString("title");
				String author=rs.getString("author");
				String description=rs.getString("description");
				String continent=rs.getString("continent");
				String country=rs.getString("country");
				String destination=rs.getString("destination");
				String startDate=rs.getString("startDate");
				String endDate=rs.getString("endDate");
				String filename=rs.getString("filename");
				
				Travel travel =new Travel();
				
				travel.setUserID(userID);
				travel.setTitle(title);
				travel.setAuthor(author);
				travel.setDescription(description);
				travel.setContinent(continent);
				travel.setCountry(country);
				travel.setDestination(destination);
				travel.setStartDate(startDate);
				travel.setEndDate(endDate);
				travel.setFileName(filename);
			
				list.add(travel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
