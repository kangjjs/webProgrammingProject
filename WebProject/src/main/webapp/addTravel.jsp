<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dto.Travel" %>
<%@ page import="util.DatabaseUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script src="./resources/js/popper.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993" integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA==" data-cf-beacon='{"rayId":"76a07765bb367c59","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.11.0","si":100}' crossorigin="anonymous"></script>
   
 	<script type="text/javascript">
 		function PostTravel(){
 			var form=document.travels;
 			form.submit();
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
        <fmt:setLocale value='<%=request.getParameter("language") %>'/>
   <fmt:bundle basename="bundle.message" >
   <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">나의 여행을 기록해주세요</h1>
                </div>
            </div>
        </header>
   <div class="container">
         <div class="text-right">
            <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
         </div>
      <form name="travels" action="./addTravelProcess.jsp" class="form-horizontal" method="post" enctype="multipart/form-data" >
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="title"/></label>
            <div class="col-sm-3">
               <input type="text" name="title" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="continent"/></label>
            <div class="col-sm-3">
               <input type="text" name="continent" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="country"/></label>
            <div class="col-sm-3">
               <input type="text" name="country" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="destination"/></label>
            <div class="col-sm-3">
               <input type="text" name="destination" class="form-control">
            </div>
         </div>
   
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="description"/></label>
            <div class="col-sm-5">
               <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="startDate"/></label>
            <div class="col-sm-3">
               <input type="date" name="startDate" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="endDate"/></label>
            <div class="col-sm-3">
               <input type="date" name="endDate" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="endDate"/></label>
            <div class="col-sm-3">
               <input type="file" name="filename" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
               <input type="button" value="작성하기" class="btn btn-primary" onclick="PostTravel()">
            </div>
         </div>
      </form>
   </div>
   </fmt:bundle>
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
   