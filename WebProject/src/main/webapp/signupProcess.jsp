<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.User"%>
<%@ page import="dao.UserRepository"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="dto.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="address"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	if(user.getUserID().equals("") || user.getUserPassword().equals("") 
			|| user.getName().equals("")|| user.getAddress().equals("")){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.');");
		script.println("history.back();");
		script.println("</script>");
	}else {
		UserRepository userDAO = new UserRepository();
		int result= userDAO.join(user.getUserID(),user.getUserPassword(),user.getAddress(),user.getName());
	
		if(result== -1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('�̹� �����ϴ� ���̵��Դϴ�.');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('ȸ�����Լ���');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}
	}
%>
</body>
</html>