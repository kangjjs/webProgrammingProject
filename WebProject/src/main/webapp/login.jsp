<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">

<link rel="stylesheet" href="./resources/css/login.css">
<title>Login #2</title>
<script nonce="db9662b3-fd51-4be9-bd14-04ec6f04247f">(function(w,d){!function(e,f,g,h){e.zarazData=e.zarazData||{};e.zarazData.executed=[];e.zaraz={deferred:[],listeners:[]};e.zaraz.q=[];e.zaraz._f=function(i){return function(){var j=Array.prototype.slice.call(arguments);e.zaraz.q.push({m:i,a:j})}};for(const k of["track","set","debug"])e.zaraz[k]=e.zaraz._f(k);e.zaraz.init=()=>{var l=f.getElementsByTagName(h)[0],m=f.createElement(h),n=f.getElementsByTagName("title")[0];n&&(e.zarazData.t=f.getElementsByTagName("title")[0].text);e.zarazData.x=Math.random();e.zarazData.w=e.screen.width;e.zarazData.h=e.screen.height;e.zarazData.j=e.innerHeight;e.zarazData.e=e.innerWidth;e.zarazData.l=e.location.href;e.zarazData.r=f.referrer;e.zarazData.k=e.screen.colorDepth;e.zarazData.n=f.characterSet;e.zarazData.o=(new Date).getTimezoneOffset();if(e.dataLayer)for(const r of Object.entries(Object.entries(dataLayer).reduce(((s,t)=>({...s[1],...t[1]})))))zaraz.set(r[0],r[1],{scope:"page"});e.zarazData.q=[];for(;e.zaraz.q.length;){const u=e.zaraz.q.shift();e.zarazData.q.push(u)}m.defer=!0;for(const v of[localStorage,sessionStorage])Object.keys(v||{}).filter((x=>x.startsWith("_zaraz_"))).forEach((w=>{try{e.zarazData["z_"+w.slice(7)]=JSON.parse(v.getItem(w))}catch{e.zarazData["z_"+w.slice(7)]=v.getItem(w)}}));m.referrerPolicy="origin";m.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(e.zarazData)));l.parentNode.insertBefore(m,l)};["complete","interactive"].includes(f.readyState)?zaraz.init():e.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,0,"script");})(window,document);</script></head>
<body>
<div class="d-lg-flex half">
<div class="bg order-1 order-md-2" style="background-image: url('./resources/images/bg_1.jpg');"></div>
<div class="contents order-2 order-md-1">
<div class="container">
<div class="row align-items-center justify-content-center">
<div class="col-md-7">
<h3> 당신의 여행을 보여주세요 <strong>Travier</strong></h3>
<p class="mb-4">여행을 통해서 얻은 정보와 여행에서 가져온 기념품을 판매</p>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.login" >
<form name="login" action="./loginProcess.jsp" method="post">
<div class="text-right">
     <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
</div>
<div class="form-group first">
<label class="col-sm-2"><fmt:message key="userID"/></label>
<input type="text" class="form-control" id="userID" name="userID">
</div>
<div class="form-group last mb-3">
<label class="col-sm-2"><fmt:message key="userPassword"/></label>
<input type="password" class="form-control" id="userPassword" name="userPassword" >
</div>
<div class="d-flex mb-5 align-items-center">
<span class="ml-auto"><a href="signup.jsp" class="forgot-pass">회원가입</a></span>
</div>
<input type="submit" value="로그인" class="btn btn-block btn-primary">
</form>
</div>
</div>
</div>
</div>
</div>
</fmt:bundle>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script src="./resources/js/popper.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993" integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA==" data-cf-beacon='{"rayId":"76a07765bb367c59","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.11.0","si":100}' crossorigin="anonymous"></script>
</body>
</html>