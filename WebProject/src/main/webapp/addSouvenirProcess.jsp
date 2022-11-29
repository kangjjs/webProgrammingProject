<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.SouvenirRepository"%>
<%@ page import="dto.Souvenir"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>	
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page errorPage="isErrorPage_error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
	<%
	
	String Directory="C:/Users/user/git/webProgrammingProject/WebProject/src/main/webapp/resources/images";
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";
	
	
	MultipartRequest multipartRequest= new MultipartRequest(request,Directory, maxSize, encoding,
			new DefaultFileRenamePolicy());
	
	String userID = null;
	String author = null;
	String subName = multipartRequest.getParameter("name");
	String description = multipartRequest.getParameter("description");
	String continent = multipartRequest.getParameter("continent");
	String country = multipartRequest.getParameter("country");
	String destination = multipartRequest.getParameter("description");
	String price=multipartRequest.getParameter("price");
	int subPrice = Integer.parseInt(price);
	String fileName = multipartRequest.getFilesystemName("file");
	
	userID = (String) session.getAttribute("userID");
	Connection conn = DatabaseUtil.getConnection();
	String sql = "select * from user where userID=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	author = rs.getString("name");

	SouvenirRepository souvenirDAO =new SouvenirRepository();
	int result = souvenirDAO.post(userID,subName,author,subPrice,description,continent,country,destination,fileName);

	if(subName.equals("")){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('작성이 완료되었습니다.');");
		script.println("location.href='main.jsp';");
		script.println("</script>");
	}
	%>
</body>
</html>