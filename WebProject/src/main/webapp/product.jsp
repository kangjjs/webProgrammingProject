<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dto.Souvenir" %>
<%@ page import="dao.SouvenirRepository" %>
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
        <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 구매하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.rest();
		}
	}
	</script>
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
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		String filename=request.getParameter("filename");
		ArrayList<Souvenir> souvenirs=new ArrayList<>();
	
		Connection conn = DatabaseUtil.getConnection();
		String sql="select * from souvenir where filename=?";
		
		if (filename!=null){
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,filename);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			String subuserID = rs.getString("userID");
            String subname = rs.getString("name");
            String author = rs.getString("author");
            int price = rs.getInt("price");
            String continent = rs.getString("continent");
            String country = rs.getString("country");
            String destination = rs.getString("destination");
            String description = rs.getString("description");
            
            Souvenir souvenir = new Souvenir();
	        
            souvenir.setUserID(subuserID);
            souvenir.setName(subname);
            souvenir.setAuthor(author);
            souvenir.setPrice(price);
            souvenir.setContinent(continent);
            souvenir.setCountry(country);
            souvenir.setDestination(destination);
            souvenir.setDescription(description);
            souvenir.setFileName(filename);
            
            souvenirs.add(souvenir);
			}
		}
		
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
            <div class="text-center text-white">
            	<h1>어서 오세요</h1>
            	<h2>많은 기념품을 가져가세요</h2>
            	<br>
                </div>
        </header>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
		<div class="row">
		<div class="col-md-5">
      	 		<img src="./resources/images/<%=filename%>"
      	 		style="width : 100%">
      	 </div>
			<div class="col-md-6">
				<h3>상품 이름</h3><p><%=souvenirs.get(0).getName()%>
				<p><h4>설명</h4><%=souvenirs.get(0).getDescription()%>
				<p><h4>대륙</h4><%=souvenirs.get(0).getContinent() %> 
				<p><h4>나라</h4><%=souvenirs.get(0).getCountry() %>
				<p><h4>장소</h4><%=souvenirs.get(0).getDestination()%>
				<p><h4>가격</h4><%=souvenirs.get(0).getPrice() %>
				<p>
					
				 <a href="./addCart.jsp?filename=<%=filename %>" class="btn btn-info" onclick="addToCart()" >상품주문&raquo;</a>
				 <a href="./allProducts.jsp" class="btn btn-secondary">상품 목록 &raquo</a>
			</div>
						
			</div> 
		<hr>
		<br>
		<br>
		<br>
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
   