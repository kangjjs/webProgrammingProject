<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.TravelRepository"%>
<%@ page import="dto.Travel"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page errorPage="isErrorPage_error.jsp"%>
<jsp:useBean id="travel" class="dto.Travel" scope="page" />
<jsp:setProperty name="travel" property="title" />
<jsp:setProperty name="travel" property="description" />
<jsp:setProperty name="travel" property="continent" />
<jsp:setProperty name="travel" property="country" />
<jsp:setProperty name="travel" property="destination" />
<jsp:setProperty name="travel" property="startDate" />
<jsp:setProperty name="travel" property="endDate" />

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
	String name = null;
	String title = multipartRequest.getParameter("title");
	String description = multipartRequest.getParameter("description");
	String continent = multipartRequest.getParameter("continent");
	String country = multipartRequest.getParameter("country");
	String destination = multipartRequest.getParameter("description");
	String startDate = multipartRequest.getParameter("startDate");
	String endDate = multipartRequest.getParameter("endDate");
	String fileName = multipartRequest.getFilesystemName("filename");
	
	userID = (String) session.getAttribute("userID");
	Connection conn = DatabaseUtil.getConnection();
	String sql = "select * from user where userID=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	name = rs.getString("name");

	TravelRepository travelDAO = new TravelRepository();
	int result = travelDAO.post(userID,title, name, description, continent, country, destination, startDate, endDate,fileName);

	if(title.equals("")){
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