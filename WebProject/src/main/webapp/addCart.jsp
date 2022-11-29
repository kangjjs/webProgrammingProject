<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Souvenir"%>
<%@ page import="dao.SouvenirRepository"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page errorPage="isErrorPage_error.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String filename=request.getParameter("filename");
	Connection conn =DatabaseUtil.getConnection();
	String sql ="delete from souvenir where filename=?";
	PreparedStatement pstmt = null;

	try{
    	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,filename);
		pstmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			pstmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	response.sendRedirect("./allProducts.jsp");
%>