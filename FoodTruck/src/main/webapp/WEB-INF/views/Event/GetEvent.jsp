<%

	String id = (String)session.getAttribute("userId"); 
	
	if(id == null){
		response.sendRedirect("../login/signIn.do");
	}
	
	String eventseq = (String)request.getParameter("eventseq");

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	request.setCharacterEncoding("UTF-8");

%>

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FT Zone | 이벤트 상세페이지</title>
<script src="../resources/static/js/mainCSS.js"></script>
<style>
@font-face {
	font-family: 'Cafe24Ssurround';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#mainName {
	font-family: 'Cafe24Ssurround';
}

.form-control2 {
	display: block;
	width: 80%;
	height: 45px;
	line-height: 45px;
	padding: .375rem .75rem;
	background: transparent;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid var(- -iq-border-light);;
	font-size: 14px;
	font-weight: 400;
	color: var(- -iq-secondary);
	border-radius: 10px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.form-group2 {
	float: left;
	width: 50%;
}

/* textarea 글 작성부분 줄간격 수정 클래스 */
.lineHeight {
	line-height: 1;
}

.floatLeft {
	float: left;
}
</style>
</head>
<body class="right-column-fixed">
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<!-- loader END -->
	<!-- Wrapper Start -->
	<div class="wrapper">
		<!-- Sidebar start -->
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
                        <li><a href="../TruckRequest/introTruck.do"><i
                              class="las la-users"></i><span>푸드트럭 소개</span></a></li>
                        <li><a href="../TruckRequest/TruckRequest.do"><i
                              class="ri-list-check-2"></i>푸드트럭 요청</a></li>
                        <li><a href="../TruckRequest/TruckRecruit.do"><i
                              class="ri-list-check-2"></i>푸드트럭 모집</a></li>
                     </ul></li>

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
      <!-- side bar end -->
      <!-- TOP Nav Bar -->
      <div class="iq-top-navbar">
         <div class="iq-navbar-custom">
            <nav class="navbar navbar-expand-lg navbar-light p-0">
               <div class="iq-navbar-logo d-flex justify-content-between">
                  <a href="../mainpage/mainpage.do"> <img
                     src="../resources/static/images/foodTrcukIcon.png"
                     class="img-fluid" alt=""> <span id="mainName">FoodTruck Zone</span>
                  </a>
                  <div class="iq-menu-bt align-self-center">
                     <div class="wrapper-menu">
                        <div class="main-circle">
                           <i class="ri-menu-line"></i>
                        </div>
                     </div>
                  </div>
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
                                       <br> <span class="text-white font-size-12">접속 중</span>
                                    </div>
                                    <a href="../myProfile/myProfile.do"
                                       class="iq-sub-card iq-bg-primary-hover">
                                       <div class="media align-items-center">
                                          <div class="rounded iq-card-icon iq-bg-primary">
                                             <i class="ri-file-user-line"></i>
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">내 프로필</h6>
                                             <p class="mb-0 font-size-12">개인 프로필 세부 정보 보기</p>
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
                                             <p class="mb-0 font-size-12">개인정보 수정</p>
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
      <!-- TOP Nav Bar END -->
		<!-- Page Content  -->
		<div id="content-page" class="content-page">
			<div class="container">
				<div class="row">
					<!-- 작성된 게시글 게시 공간 start -->
					<div class="image-block">
						<img src="../resources/upload/${Event.eventContent_photo}"
							class="img-fluid rounded w-100" alt="blog-img" style="width:1200px; height:600px;">
					</div>
					<div class="col-lg-8">
						<div
							class="iq-card iq-card-block iq-card-stretch iq-card-height blog blog-detail">
							<div class="iq-card-body">
								
								
								<div class="blog-description mt-3" >
									<h5  class="mb-3 pb-3 border-bottom" >${Event.eventTitle }</h5>
									<div class="blog-meta d-flex align-items-center mb-3 floatLeft">
										<div class="date mr-4">
											<i class="ri-calendar-2-fill text-primary pr-2"></i>2021-${Event.eventmm}-${Event.eventdd}
										</div>
									</div>
<!-- 									style="float: left;" -->
									<div>
										<p>작성자 : ${sessionScope.userNick}</p><br>
									</div>
									<div></div>
									<div>
										<p>${Event.eventContent}</p> 
									</div>
									<c:choose>
										<c:when test="${sessionScope.userId == 123}">
											<div style="float: right">
												<button class="btn btn-primary"
													onclick="location.href='getEventvo.do?eventseq=${Event.eventseq}';"
													style="margin-left: 10px;">글 수정</button>
												<button class="btn btn-primary"
													onclick="location.href='deleteEvent.do?eventseq=${Event.eventseq}';"
													style="margin-left: 10px;">글 삭제</button>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<!-- 작성된 게시글 게시 공간 End -->
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
						<li class="list-inline-item"><a href="privacy-policy.html">개인정보처리방침</a></li>
						<li class="list-inline-item"><a href="terms-of-service.html">서비스 이용약관</a></li>
					</ul>
				</div>
				<div class="col-lg-6 text-right">
					저작권 2021.09.30 <a href="#">푸드트럭</a>모든 권리는 푸드트럭에 있습니다.
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer END -->
	<script src="../resources/static/js/mainJS.js"></script>
</body>
</html>
