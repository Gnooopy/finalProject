<!doctype html>
<!-- 1. POST 전송시 한글깨짐
JSP 페이지 상단에 request.setCharacterEncoding 을 명시한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
   request.setCharacterEncoding("UTF-8");
	
%>

<!-- 2. GET 전송시 한글깨짐
Tomcat의 server.xml에 URIEncoding 옵션을 추가해 준다.  -->

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
   redirectPort="8443" URIEncoding="UTF-8" />
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>FT Zone | 비밀번호 찾기</title>
      <!-- Favicon -->
      <link rel="shortcut icon" href="../resources/static/images/favicon.ico" />
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="../resources/static/css/bootstrap.min.css">
      <!-- Typography CSS -->
      <link rel="stylesheet" href="../resources/static/css/typography.css">
      <!-- Style CSS -->
      <link rel="stylesheet" href="../resources/static/css/style.css">
      <!-- Responsive CSS -->
      <link rel="stylesheet" href="../resources/static/css/responsive.css">
   </head>
   <body>
      <!-- loader Start -->
      <div id="loading">
         <div id="loading-center">
         </div>
      </div>
      <!-- loader END -->
        <!-- Sign in Start -->
        <section class="sign-in-page">
          <div id="container-inside">
              <div id="circle-small"></div>
              <div id="circle-medium"></div>
              <div id="circle-large"></div>
              <div id="circle-xlarge"></div>
              <div id="circle-xxlarge"></div>
          </div>
            <div class="container p-0">
                <div class="row no-gutters">
                    <div class="col-md-6 text-center pt-5">
                        <div class="sign-in-detail text-white">
                            <a class="sign-in-logo mb-5" href="#"><img src="images/logo-full.png" class="img-fluid" alt="logo"></a>
                            <div class="owl-carousel" data-autoplay="true" data-loop="true" data-nav="false" data-dots="true" data-items="1" data-items-laptop="1" data-items-tab="1" data-items-mobile="1" data-items-mobile-sm="1" data-margin="0">
                                <div class="item">
                                    <img src="images/login/1.png" class="img-fluid mb-4" alt="logo">
                                    <h4 class="mb-1 text-white">Find new friends</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                                </div>
                                <div class="item">
                                    <img src="images/login/2.png" class="img-fluid mb-4" alt="logo"> 
                                    <h4 class="mb-1 text-white">Connect with the world</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                                </div>
                                <div class="item">
                                    <img src="images/login/3.png" class="img-fluid mb-4" alt="logo">
                                    <h4 class="mb-1 text-white">Create new events</h4>
                                    <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 bg-white pt-5">
                        <div class="sign-in-from">
                            <h1 class="mb-0">비밀번호 찾기</h1>
                            <p>인증번호를 입력하세요</p>
                            <form method="post" action="signIn.do">
                            	
                               <div class="form-group"> 
<!--                                     <label for="exampleInputEmail1">인증번호</label> -->
<!--                                     <input type="text" class="form-control mb-0" name="#" id="exampleInputEmail1" placeholder="Enter Id"> -->
										<h1>${pwdSearch.userId} 님의 비밀번호는 ${pwdSearch.userPass}  </h1>
                               </div>
                               
                                <div class="d-inline-block w-100">
                                    <div class="custom-control custom-checkbox d-inline-block mt-2 pt-1">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                        <label class="custom-control-label" for="customCheck1">Remember Me</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary float-right">Sign in</button>
                                </div>
                                <div class="sign-info">
                                    <span class="dark-color d-inline-block line-height-2">Don't have an account? <a href="#">Sign up</a></span>
                                    <ul class="iq-social-media">
                                        <li><a href="#"><i class="ri-facebook-box-line"></i></a></li>
                                        <li><a href="#"><i class="ri-twitter-line"></i></a></li>
                                        <li><a href="#"><i class="ri-instagram-line"></i></a></li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Sign in END -->
      <!-- Optional JavaScript -->
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      <script src="../resources/static/js/jquery.min.js"></script>
      <script src="../resources/static/js/popper.min.js"></script>
      <script src="../resources/static/js/bootstrap.min.js"></script>
      <!-- Appear JavaScript -->
      <script src="../resources/static/js/jquery.appear.js"></script>
      <!-- Countdown JavaScript -->
      <script src="../resources/static/js/countdown.min.js"></script>
      <!-- Counterup JavaScript -->
      <script src="../resources/static/js/waypoints.min.js"></script>
      <script src="../resources/static/js/jquery.counterup.min.js"></script>
      <!-- Wow JavaScript -->
      <script src="../resources/static/js/wow.min.js"></script>
      <!-- Apexcharts JavaScript -->
      <script src="../resources/static/js/apexcharts.js"></script>
      <!-- lottie JavaScript -->
      <script src="../resources/static/js/lottie.js"></script>
      <!-- Slick JavaScript --> 
      <script src="../resources/static/js/slick.min.js"></script>
      <!-- Select2 JavaScript -->
      <script src="../resources/static/js/select2.min.js"></script>
      <!-- Owl Carousel JavaScript -->
      <script src="../resources/static/js/owl.carousel.min.js"></script>
      <!-- Magnific Popup JavaScript -->
      <script src="../resources/static/js/jquery.magnific-popup.min.js"></script>
      <!-- Smooth Scrollbar JavaScript -->
      <script src="../resources/static/js/smooth-scrollbar.js"></script>
      <!-- Chart Custom JavaScript -->
      <script src="../resources/static/js/chart-custom.js"></script>
      <!-- Custom JavaScript -->
      <script src="../resources/static/js/custom.js"></script>
   </body>

</html>
