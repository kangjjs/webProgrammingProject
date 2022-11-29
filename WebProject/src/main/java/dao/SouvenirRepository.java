package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.crypto.Data;

import dto.Souvenir;
import dto.Travel;
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
	
	public ArrayList<Souvenir> getList(String userID){
		String sql="select * from souvenir where userID=?";
		ArrayList<Souvenir> list = new ArrayList<>();
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String name=rs.getString("name");
				String author=rs.getString("author");
				int price=rs.getInt("price");
				String description=rs.getString("description");
				String continent=rs.getString("continent");
				String country=rs.getString("country");
				String destination=rs.getString("destination");
				String filename=rs.getString("filename");
				
				Souvenir souvenir =new Souvenir();
				
				souvenir.setUserID(userID);
				souvenir.setName(name);
				souvenir.setAuthor(author);
				souvenir.setPrice(price);
				souvenir.setDescription(description);
				souvenir.setContinent(continent);
				souvenir.setCountry(country);
				souvenir.setDestination(destination);
				souvenir.setFileName(filename);
			
				list.add(souvenir);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}