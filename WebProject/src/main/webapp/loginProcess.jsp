<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dao.UserRepository" %>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		
		UserRepository userDAO = new UserRepository();
		int result= userDAO.login(user.getUserID(),user.getUserPassword());
		if(result==1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('�α��� �Ǿ����ϴ�.');");
			script.println("location.href='main.jsp';");
			script.println("</script>");
		}else if(result== 0){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('��й�ȣ�� Ʋ���ϴ�.');");
				script.println("history.back()");
				script.println("</script>");
			}else if(result==-1){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('�������� �ʴ� ���̵��Դϴ�.');");
				script.println("history.back()");
				script.println("</script>");
			}
	%>
</body>
</html>