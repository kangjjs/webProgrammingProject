<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Souvenir" %>
<%@ page errorPage="isErrorPage_error.jsp"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="./resources/css/styles.css" />

</head>
<body>
	<%
			
			String userID=null;
			String name=null;
			int subPrice=0;
			ArrayList<Souvenir> list=new ArrayList<>();
			
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
			
			if(session.getAttribute("userID")!=null){
				userID=(String)session.getAttribute("userID");
				Connection conn =DatabaseUtil.getConnection();
				String sql ="select * from souvenir";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next()){
					String id = rs.getString("userID");
	                String subname = rs.getString("name");
	                String author = rs.getString("author");
	                int price = rs.getInt("price");
	                String continent = rs.getString("continent");
	                String country = rs.getString("country");
	                String destination = rs.getString("destination");
	                String description = rs.getString("description");
	                String filename = rs.getString("filename");
	                
	                Souvenir souvenir = new Souvenir();
	        
	                souvenir.setUserID(userID);
	                souvenir.setName(subname);
	                souvenir.setAuthor(author);
	                souvenir.setPrice(price);
	                souvenir.setContinent(continent);
	                souvenir.setCountry(country);
	                souvenir.setDestination(destination);
	                souvenir.setDescription(description);
	                souvenir.setFileName(filename);
	                
	                list.add(souvenir);
				}
			}
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a href="main.jsp" class="navbar-brand" href="#!">Travier</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link" href="./mypage.jsp"><%=name%>의
							여행기록</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">상점</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="allProducts.jsp">All products</a></li>
							<li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="./mysouvenir.jsp">내 기념품</a></li>
						</ul></li>
				</ul>


				<%
                    	if(userID==null){
                    %>
				<form class="d-flex">
					<a href="login.jsp" style="color: black; text-decoration: none;">
						Login </a>
				</form>
				<%
                    	}else{
                    %>

				<form class="d-flex">
					<a href="logoutProcess.jsp"
						style="color: black; text-decoration: none;"> Logout </a>
				</form>
				<%
                    }
                    %>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="text-center text-white">
			<% if(userID==null){ %>
			<h1 class="display-4 fw-bolder">갖고싶은 기념품을 둘러봐요</h1>
			<br>
			<% }else{ %>
			<h1 class="display-4 fw-bolder">기념품 등록하기</h1>
			<br> <a href="addSouvenir.jsp" class="btn btn-primary btn-lg">등록하기</a>
			<%} %>
		</div>
	</header>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<% for(int i=0;i<list.size();i++){ %>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" 
							src="./resources/images/<%=list.get(i).getFileName()%>" alt="..." 
							style="width:100%; height:100%"/>
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=list.get(i).getName()%></h5>
								<!-- Product price-->
								<%=list.get(i).getPrice() %>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
							<a href="./product.jsp?filename=<%=list.get(i).getFileName() %>"  class="btn btn-outline-dark mt-auto" >더 보기</a>								
							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container"><%@ include file="footer.jsp"%></div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
</body>
</html>