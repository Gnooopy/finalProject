<%

	String id = (String)session.getAttribute("userId"); 

	if(id == null){
		response.sendRedirect("login/signIn.jsp");
	}
	
%>
<!doctype html>

<!-- 1. POST 전송시 한글깨짐
JSP 페이지 상단에 request.setCharacterEncoding 을 명시한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String qnaseq = request.getParameter("qnaSeq"); 
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<!-- 2. GET 전송시 한글깨짐
Tomcat의 server.xml에 URIEncoding 옵션을 추가해 준다.  -->

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />
	
<html lang="en">
   <head>
     <style>
         @font-face {
            font-family: 'Cafe24Ssurround';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
            font-weight: normal;
            font-style: normal;
         }
         #mainName{font-family: 'Cafe24Ssurround';}
      </style>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Q&A 게시판 글수정</title>
      <script src="../resources/static/js/mainCSS.js"></script>
   </head>
   <body class="sidebar-main-active right-column-fixed">
      <!-- loader Start -->
      <div id="loading">
         <div id="loading-center">
         </div>
      </div>
      <!-- loader END -->
      <!-- Wrapper Start -->
      <div class="wrapper">
        	 	 <!-- Sidebar  -->
      <div class="iq-sidebar">
         <div id="sidebar-scrollbar">
            <nav class="iq-sidebar-menu">
               <ul id="iq-sidebar-toggle" class="iq-menu">
                  <li><a href="../myfeed/feed.do" class=" "><i
                        class="las la-user"></i><span>My Feed</span></a></li>

                  <li><a href="../Event/profile-event.do" class=" "><i
                        class="las la-film"></i><span>이번달 이벤트</span></a></li>

                  <li><a href="#blog" class="  collapsed"
                     data-toggle="collapse" aria-expanded="false"><i
                        class="lab la-blogger"></i><span>푸드트럭존</span><i
                        class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                     <ul id="blog" class="iq-submenu collapse"
                        data-parent="#iq-sidebar-toggle">
                        <li><a href="../foodTruckZone/weather.do" class=" "><i
                              class="ri-snowy-line"></i><span>우리동네 푸드트럭존</span></a></li>
                        <li><a href="../festival/festivalBoard.do"><i
                              class="ri-list-check-2"></i>축제별 푸드트럭</a></li>
                     </ul></li>
                     
                  <li><a href="#store" class="  collapsed"
                     data-toggle="collapse" aria-expanded="false"><i
                        class="las la-store"></i><span>커뮤니티</span><i
                        class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                     <ul id="store" class="iq-submenu collapse"
                        data-parent="#iq-sidebar-toggle">
                        <li><a href="group.html" class=" "><i
                              class="las la-users"></i><span>푸드트럭 소개</span></a></li>
                        <li><a href="../TruckRequest/TruckRequest.do"><i
                              class="ri-list-check-2"></i>푸드트럭 요청</a></li>
                        <li><a href="../TruckRequest/TruckRecruit.do"><i
                              class="ri-list-check-2"></i>푸드트럭 모집</a></li>
                     </ul></li>

                  <li><a href="calendar.html" class=" "><i
                        class="las la-calendar"></i><span>푸드트럭일정</span></a></li>

                  <li><a href="../apply/truckApply.do" class=" "><i
                        class="ri-focus-2-line"></i><span>푸드트럭자리 신청 및 조회</span></a></li>

                  <li><a href="#mailbox" class="  collapsed"
                     data-toggle="collapse" aria-expanded="false"><i
                        class="ri-mail-line"></i><span>고객센터 & 문의</span><i
                        class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                     <ul id="mailbox" class="iq-submenu collapse"
                        data-parent="#iq-sidebar-toggle">
                        <li><a href="../QnA/pages-faqQ&A.do"><i
                              class="ri-inbox-line"></i>Q&A 게시판</a></li>
                        <li><a href="../QnA/pages-faqBall.do"><i
                              class="ri-edit-line"></i>공공기관 협업 신청 게시판</a></li>
                        <li><a href="../QnA/pages-faqPromotion.do"><i
                              class="ri-edit-line"></i>홍보 협찬 요청 신청 게시판</a></li>
                     </ul></li>
               </ul>
            </nav>
            <div class="p-3"></div>
         </div>
      </div>
      <!-- TOP Nav Bar -->
      <div class="iq-top-navbar">
         <div class="iq-navbar-custom">
            <nav class="navbar navbar-expand-lg navbar-light p-0">
               <div class="iq-navbar-logo d-flex justify-content-between">
                  <a href="../mainpage/mainpage.do"> <img
                     src="../resources/static/images/foodTrcukIcon.png"
                     class="img-fluid" alt=""> <span id="mainName">푸드트럭</span>
                  </a>
                  <div class="iq-menu-bt align-self-center">
                     <div class="wrapper-menu">
                        <div class="main-circle">
                           <i class="ri-menu-line"></i>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="iq-search-bar">
                  <form action="#" class="searchbox">
                     <input type="text" class="text search-input"
                        placeholder="검색어를 입력해주세요." style="margin-top: 8%;"> <a
                        class="search-link" href="#"><i class="ri-search-line"></i></a>
                  </form>
               </div>
               <button class="navbar-toggler" type="button" data-toggle="collapse"
                  data-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent"
                  aria-label="Toggle navigation">
                  <i class="ri-menu-3-line"></i>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto navbar-list">
                     <li><a href="../myfeed/feed.do"
                        class="  d-flex align-items-center"> <img
                           src="../resources/upload/${sessionScope.userPhoto}"
                           class="img-fluid rounded-circle mr-3" alt="user">
                           <div class="caption">
                              <h6 class="mb-0 line-height">${sessionScope.userNick}</h6>
                           </div>
                     </a></li>
                     <ul class="navbar-list">
                        <li><a href="#"
                           class="search-toggle   d-flex align-items-center"> <i
                              class="ri-arrow-down-s-fill"></i>
                        </a>
                           <div class="iq-sub-dropdown iq-user-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3 line-height">
                                       <h6 class="mb-0 text-white line-height"
                                          style="display: inline;">안녕하세요</h6>
                                       <h4 class="mb-0 text-white line-height"
                                          style="display: inline;">${sessionScope.userNick}</h4>
                                       <h6 class="mb-0 text-white line-height"
                                          style="display: inline;">님.</h6>
                                       <br> <span class="text-white font-size-12">사용가능</span>
                                    </div>
                                    <a href="../myProfile/myProfile.do"
                                       class="iq-sub-card iq-bg-primary-hover">
                                       <div class="media align-items-center">
                                          <div class="rounded iq-card-icon iq-bg-primary">
                                             <i class="ri-file-user-line"></i>
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">내 프로필</h6>
                                             <p class="mb-0 font-size-12">개인 프로필 세부 정보 보기.</p>
                                          </div>
                                       </div>
                                    </a> <a href="../myProfile/myProfileEdit.do"
                                       class="iq-sub-card iq-bg-warning-hover">
                                       <div class="media align-items-center">
                                          <div class="rounded iq-card-icon iq-bg-warning">
                                             <i class="ri-profile-line"></i>
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">프로필 편집</h6>
                                             <p class="mb-0 font-size-12">개인정보 수정.</p>
                                          </div>
                                       </div>
                                    </a> <a href="account-setting.html"
                                       class="iq-sub-card iq-bg-info-hover"> </a>
                                    <div class="d-inline-block w-100 text-center p-3">

                                       <a class="bg-primary iq-sign-btn" href="../login/logOut.do"
                                          role="button">로그아웃<i class="ri-login-box-line ml-2"></i></a>
                                    </div>
                                 </div>
                              </div>
                           </div></li>
                     </ul>
                  </ul>
               </div>
            </nav>
         </div>
      </div>
<!--      TOP Nav Bar END  -->
         <!-- Right Sidebar Panel Start-->
         <div class="right-sidebar-mini right-sidebar">
            <div class="right-sidebar-panel p-0">
               <div class="iq-card shadow-none">
                  <div class="iq-card-body p-0">
                     <div class="media-height p-3" data-scrollbar="init">
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/01.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Anna Sthesia</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/02.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Paul Molive</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/03.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Anna Mull</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/04.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Paige Turner</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/01.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Bob Frapples</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/02.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Barb Ackue</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-online">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/03.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Greta Life</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-away">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/04.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Ira Membrit</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center mb-4">
                           <div class="iq-profile-avatar status-away">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/01.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Pete Sariya</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                        <div class="media align-items-center">
                           <div class="iq-profile-avatar">
                              <img class="rounded-circle avatar-50" src="../resources/static/images/user/02.jpg" alt="">
                           </div>
                           <div class="media-body ml-3">
                              <h6 class="mb-0"><a href="#">Monty Carlo</a></h6>
                              <p class="mb-0">Admin</p>
                           </div>
                        </div>
                     </div>
                     <div class="right-sidebar-toggle bg-primary mt-3">
                        <i class="ri-arrow-left-line side-left-icon"></i>
                        <i class="ri-arrow-right-line side-right-icon"><span class="ml-3 d-inline-block">Close Menu</span></i> 
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- Right Sidebar Panel End-->
         <!-- Page Content  -->
         <div id="content-page" class="content-page">
            <div class="container">
               <div class="row">
<!--                   <div class="col-lg-12"> -->
<!--                      <div class="iq-card"> -->
<!--                         <div class="iq-card-body p-0"> -->
<!--                            <div class="iq-edit-list"> -->
<!--                               <ul class="iq-edit-profile d-flex nav nav-pills"> -->
<!--                                  <li class="col-md-3 p-0"> -->
<!--                                     <a class="nav-link active" data-toggle="pill" href="#personal-information"> -->
<!--                                     111 -->
<!--                                     </a> -->
<!--                                  </li> -->
<!--                                  <li class="col-md-3 p-0"> -->
<!--                                     <a class="nav-link" data-toggle="pill" href="#chang-pwd"> -->
<!--                                     222 -->
<!--                                     </a> -->
<!--                                  </li> -->
<!--                                  <li class="col-md-3 p-0"> -->
<!--                                     <a class="nav-link" data-toggle="pill" href="#emailandsms"> -->
<!--                                     333 -->
<!--                                     </a> -->
<!--                                  </li> -->
<!--                                  <li class="col-md-3 p-0"> -->
<!--                                     <a class="nav-link" data-toggle="pill" href="#manage-contact"> -->
<!--                                     Q&A 글쓰기 -->
<!--                                     </a> -->
<!--                                  </li> -->
<!--                               </ul> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                      </div> -->
<!--                   </div> -->
                  <div class="col-lg-12">
                     <div class="iq-edit-list-data">
                        <div class="tab-content">
                           <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                           	<br><br>
                              <div class="iq-card">
                                 <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                       <h4 class="card-title">글 수정하기</h4>
                                    </div>
                                 </div>
                                  <div class="iq-card-body">
                                    <form action="../updateFeed.do" method='post' enctype="multipart/form-data">
                                        <input type="hidden" name="feedSeq" value="${selectFeed.feedSeq}">
                                	    
                                       
                                       <div class="form-group">
                                          <label for="email">내용</label>
                                          <textarea class="form-control"  rows="8" cols="50" name="feedContent" >${selectFeed.feedContent}</textarea>
<!--                                      <input type="text" class="form-control" id="email" rows="10" cols="40" placeholder="내용을 입력해주세요" ></input> -->
                                       </div>
                                       <div class="user-post">
                                       <input type="file" size="40" name='feedfile' >
                                       <a href="../deletPhoto.do?feedSeq=${selectFeed.feedSeq}">
                                       <input type="button" size="40" value="사진 삭제" >
                                       </a>
                                             <c:choose>
                                             <c:when test="${selectFeed.feedContent_photo != null }">
                                                <a href="javascript:void();"><img width="320px" height="210px" src="../resources/upload/${selectFeed.feedContent_photo}" alt="사진없음"   /></a>
                                             </c:when> 
                                             </c:choose>
                                             </div>
                                       <button type="submit" class="btn btn-primary mr-2" >글 남기기</button>
                                       <button type="reset" class="btn iq-bg-danger" onclick="location.href='pages-faqQ&A.do'">취소</button>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Wrapper END -->
      <!-- Footer -->
      <footer class="bg-white iq-footer">
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-6">
                  <ul class="list-inline mb-0">
                     <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
                     <li class="list-inline-item"><a href="terms-of-service.html">Terms of Use</a></li>
                  </ul>
               </div>
               <div class="col-lg-6 text-right">
                  Copyright 2020 <a href="#">SocialV</a> All Rights Reserved.
               </div>
            </div>
         </div>
      </footer>
      <!-- Footer END -->
      <!-- Optional JavaScript -->
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
       <script src="../resources/static/js/mainJS.js"></script>
   </body>
</html>