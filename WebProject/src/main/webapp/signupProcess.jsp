<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.User"%>
<%@ page import="dao.UserRepository"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="dto.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="address"/>
<%@ page errorPage="isErrorPage_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	
	if(userID.equals("") || userPassword.equals("") 
			|| name.equals("")|| address.equals("")){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}else {
		UserRepository userDAO = new UserRepository();
		int result= userDAO.join(user.getUserID(),user.getUserPassword(),user.getAddress(),user.getName());
	
		if(result== -1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입성공');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}
	}
%>
</body>
</html>