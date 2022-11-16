<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dto.Travel" %>
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
    </head>
	<body>
        <!-- Navigation-->	
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a href="main.jsp"class="navbar-brand" href="#!">Travier</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상점</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Africa</a></li>
                                <li><a class="dropdown-item" href="#!">America</a></li>
                                <li><a class="dropdown-item" href="#!">Asia</a></li>
                                <li><a class="dropdown-item" href="#!">Europe</a></li>
                                <li><a class="dropdown-item" href="#!">Oceania</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a href="login.jsp" style="color:black; text-decoration:none;">
                           Login
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <fmt:setLocale value='<%=request.getParameter("language") %>'/>
   <fmt:bundle basename="bundle.souvenir" >
   <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">기념품을 등록해주세요</h1>
                </div>
            </div>
        </header>
   <div class="container">
         <div class="text-right">
            <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
         </div>
      <form name="addBook" action="./processAddBook.jsp" class="form-horizontal" method="post"
      enctype="multipart/form-data">
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="Id"/></label>
            <div class="col-sm-3">
               <input type="text" id = "Id" name="Id" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="name"/></label>
            <div class="col-sm-3">
               <input type="text" id="name" name="name" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="author"/></label>
            <div class="col-sm-3">
               <input type="text" name="author" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="price"/></label>
            <div class="col-sm-3">
               <input type="text" id="price" name="price" class="form-control">
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
            <label class="col-sm-2"><fmt:message key="Image"/></label>
            <div class="col-sm-3">
               <input type="file" name="filename" class="form-control">
             </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
               <input type="button" class="btn btn-primary" value='<fmt:message key="button" />' onclick="checkAddBook()">
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
   