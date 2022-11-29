<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dto.Travel" %>
<%@ page import="java.util.ArrayList" %>
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
			
			ArrayList<Travel> travels =new ArrayList<>();
			Connection conn =DatabaseUtil.getConnection();
			String travelSql ="select * from travel";
				
			PreparedStatement pstmt = conn.prepareStatement(travelSql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				String id = rs.getString("userID");
	            String title = rs.getString("title");
	            String author = rs.getString("author");
	            String continent = rs.getString("continent");
	            String country = rs.getString("country");
	            String destination = rs.getString("destination");
	            String description = rs.getString("description");
	            String startDate = rs.getString("startDate");
	            String endDate = rs.getString("endDate");
	            String filename = rs.getString("filename");
	                
	        	Travel travel = new Travel();
	        	travel.setUserID(id);
	        	travel.setTitle(title);
	        	travel.setAuthor(author);
	        	travel.setContinent(continent);
	        	travel.setCountry(country);
	        	travel.setDestination(destination);
	        	travel.setDescription(description);
	        	travel.setStartDate(startDate);
	        	travel.setEndDate(endDate);
	        	travel.setFileName(filename);
	       
	        	travels.add(travel);
			}
			%>
			
			
        <!-- Navigation-->	
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a href="main.jsp"class="navbar-brand" href="#!">Travier</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    	<%if(userID==null){ %>
                        <%}else{ %>
                        <li class="nav-item"><a class="nav-link" href="./mypage.jsp"><%=name%>의 여행기록</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상점</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="allProducts.jsp">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="./mysouvenir.jsp">내 기념품</a></li>
                            </ul>
                        </li>
                        <%} %>
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
    <div class="container">
        <div class="row">

			<%
				for(int i=0;i<travels.size();i++){
			%>
            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="./resources/images/<%=travels.get(i).getFileName() %>" style="wdith:100%; height:100%;" class="card-image-top" alt="...">
                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary"><%=travels.get(i).getTitle() %></a></h3>
                        <p class="card-text"><%=travels.get(i).getDescription() %></p>
                        <a href="./travel.jsp?filename=<%=travels.get(i).getFileName() %>"  class="btn btn-primary" >보러가기</a>
                    </div>
                </div>
           
            </div>
            
            <%} %>
        </div>
    </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><%@ include file="footer.jsp" %></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
    </body>
</html>
   