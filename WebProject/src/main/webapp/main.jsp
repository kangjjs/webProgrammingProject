<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
                                <li><a class="dropdown-item" href="allProducts.jsp">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="africa.jsp">Africa</a></li>
                                <li><a class="dropdown-item" href="america.jsp">America</a></li>
                                <li><a class="dropdown-item" href="asia.jsp">Asia</a></li>
                                <li><a class="dropdown-item" href="europe.jsp">Europe</a></li>
                                <li><a class="dropdown-item" href="oceania.jsp">Oceania</a></li>
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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">나의 여행 글쓰러가기</h1>
                    <br>
                    <a href="addTravel.jsp" class="btn btn-primary btn-lg">작성하기</a>
                </div>
            </div>
        </header>
        
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg" class="card-image-top" alt="thumbnail">

                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">What is HTML</a></h3>
                        <p class="card-text">HTML stands for Hyper Text Markup Language, It helps to learn web development and designing. </p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="https://images.pexels.com/photos/3848158/pexels-photo-3848158.jpeg" class="card-image-top" alt="thumbnail">

                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">Why We Use HTML</a></h3>
                        <p class="card-text">We use HTML to make website and that website helps to gain very much knowledge.Pellentesque dictum consequat tincidunt. Sed tincidunt tortor nec vulputate gravida.</p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="https://images.pexels.com/photos/2343170/pexels-photo-2343170.jpeg" class="card-image-top" alt="thumbnail">
                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">Where do people came from?</a></h3>
                        <p class="card-text">Pellentesque dictum consequat tincidunt. Sed tincidunt tortor nec vulputate gravida. Nam sapien nisi, malesuada at sapien suscipit,</p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">
                    <img src="https://images.pexels.com/photos/1519088/pexels-photo-1519088.jpeg" class="card-image-top" alt="thumbnail">
                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">What is Lorem Ipsum?</a></h3>
                        <p class="card-text">Pellentesque dictum consequat tincidunt. Sed tincidunt tortor nec vulputate gravida. Nam sapien nisi, malesuada at sapien suscipit.</p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg" class="card-image-top" alt="thumbnail">
                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">Where is my Pasta?</a></h3>
                        <p class="card-text">Pellentesque dictum consequat tincidunt. Sed tincidunt tortor nec vulputate gravida. Nam sapien nisi, malesuada at sapien suscipit,</p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="card my-3">

                    <img src="https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg" class="card-image-top" alt="thumbnail">

                    <div class="card-body">
                        <h3 class="card-title"><a href="#" class="text-secondary">Why is sky blue ?</a></h3>
                        <p class="card-text">Pellentesque dictum consequat tincidunt. Sed tincidunt tortor nec vulputate gravida. Nam sapien nisi, malesuada at sapien suscipit.</p>
                        <a href="#" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
   