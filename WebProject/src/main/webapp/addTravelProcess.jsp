<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.TravelRepository"%>
<%@ page import="dto.Travel"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.PrintWriter"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	String name = null;
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String continent = request.getParameter("continent");
	String country = request.getParameter("country");
	String destination = request.getParameter("description");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");

	userID = (String) session.getAttribute("userID");
	Connection conn = DatabaseUtil.getConnection();
	String sql = "select * from user where userID=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	name = rs.getString("name");

	TravelRepository travelDAO = new TravelRepository();
	int result = travelDAO.post(userID,title, name, description, continent, country, destination, startDate, endDate);

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