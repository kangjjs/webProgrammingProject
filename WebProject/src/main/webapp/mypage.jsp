<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dto.Travel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.TravelRepository" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page errorPage="isErrorPage_error.jsp"%>

<!DOCTYPE html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="./resources/css/styles.css"  />
    </head>
	<body>
			<%
			
			String userID=null;
			String name=null;
			if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
			Connection conn =DatabaseUtil.getConnection();
			String sql ="select * from user where userID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			name=rs.getString("name");

			}
			
			TravelRepository travelRepository = new TravelRepository();
			ArrayList<Travel> list = travelRepository.getList(userID);
			
			%>
			
			
        <!-- Navigation-->	
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a href="main.jsp"class="navbar-brand" href="#!">Travier</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="./mypage.jsp"><%=name%>의 여행기록</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상점</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="allProducts.jsp">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="./mysouvenir.jsp">내 기념품</a></li>
                            </ul>
                        </li>
                    </ul>
                    
					
                    <%
                    	if(userID==null){
                    %>
                    <form class="d-flex">
                        <a href="login.jsp" style="color:black; text-decoration:none;">
                           Login
                        </a>
                    </form>
                    <%
                    	}else{
                    %>
                    
                    <form class="d-flex">
                        <a href="logoutProcess.jsp" style="color:black; text-decoration:none;">
                           Logout
                        </a>
                    </form>
                    <%
                    }
                    %>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                	<% if(userID==null){ %>
                    <h1 class="display-4 fw-bolder">나만의 여행을 적어주세요</h1>
                    <% }else{ %>
                    <h1 class="display-4 fw-bolder">나의 여행 글쓰러가기</h1>
                    <br>
                    <a href="addTravel.jsp" class="btn btn-primary btn-lg">작성하기</a>
                    <% } %>
                </div>
            </div>
        </header>
        <br>
        <br>
        <br>
        <br>
        
        <div class="container">
        	<div class="row">
        		<table class="table table-striped" style="text-align:center; border:1px solid #ddddd">
        			<thead>
        				<tr>
        					<th style="backgroound-color:#eeeeee; text-align:center;">제목</th>
        					<th style="backgroound-color:#eeeeee; text-align:center;">작성자</th>
        					<th style="backgroound-color:#eeeeee; text-align:center;">장소</th>
        				</tr>
        			</thead>
        			<tbody>
        				<%
        					for(int i=0;i<list.size();i++){
        				%>
        				<tr>
        				<td><a href="./travel.jsp?filename=<%=list.get(i).getFileName()%>" style="text-decoration:none;"><%=list.get(i).getTitle() %></a></td>
        				<td><%=userID %></td>
        				<td><%=list.get(i).getDestination() %></td>
        				</tr>
        				<%} %>
        			</tbody> 
        	</div>
        </div>
</body>
</html>