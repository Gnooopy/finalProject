<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
<title>FT Zone | 푸드트럭 모집</title>
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
					<div class="col-lg-8">
						<div
							class="iq-card iq-card-block iq-card-stretch iq-card-height blog blog-detail">
							<div class="iq-card-body">
								<div class="image-block">
									<img src="../resources/static/images/articlebg.png"
										class="img-fluid rounded w-100" alt="blog-img">
								</div>
								<div class="blog-description mt-3">
									<h5 class="mb-3 pb-3 border-bottom">${getrecruit.recruitTitle }</h5>
									<div class="blog-meta d-flex align-items-center mb-3 floatLeft">
										<div class="date mr-4">
											<i class="ri-calendar-2-fill text-primary pr-2"></i>${getrecruit.recruitDate }
										</div>
										<div class="like mr-4">
											<i class="ri-thumb-up-line text-primary pr-2"></i>좋아요 200
										</div>
										<div class="comments mr-4">
											<i class="ri-chat-3-line text-primary pr-2"></i>댓글
											${commentSize2 }
										</div>
										<div style="float: right">
											<button class="btn btn-primary" style="margin-left: 20px;">좋아요</button>
											<button class="btn btn-primary"
												onclick="location.href='UpdateArticle2.do?recruitSeq=${getrecruit.recruitSeq}';"
												style="margin-left: 10px;">글 수정</button>
											<button class="btn btn-primary"
												onclick="location.href='deleteArticle2.do?recruitSeq=${getrecruit.recruitSeq}';"
												style="margin-left: 10px;">글 삭제</button>
										</div>
									</div>
									<div style="float: left;">
										<p>
											일정 : ${getrecruit.recruitDate } | 장소 :
											${getrecruit.recruitLocation }<br>작성자 :
											${sessionScope.userNick}<br> <br>${getrecruit.recruitContent }
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 작성된 게시글 게시 공간 End -->
					<!-- 새로운 게시글 리스트 공간 start -->
					<div class="col-lg-4">
						<div
							class="iq-card iq-card-block iq-card-stretch iq-card-height blog-post">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="header-title">
									<h4 class="iq-card-title">새로운 게시글</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<ul class="list-inline p-0 mb-0 mt-2">
									<li class="mb-3">
										<div class="d-flex align-items-top pb-3 border-bottom">
											<div class="col-md-5">
												<div class="image-block">
													<img src="../resources/static/images/articlebg.png"
														class="img-fluid rounded w-100" alt="blog-img">
												</div>
											</div>
											<div class="col-md-7">
												<div class="blog-description pl-2">
													<div class="date mb-1">
														<a href="#" tabindex="-1">1 주 전</a>
													</div>
													<h6 class="mb-2">(예시)[모집]수원 KT위즈 야구장 시즌권</h6>
												</div>
											</div>
										</div>
									</li>
									<li class="mb-3">
										<div class="d-flex align-items-top pb-3 border-bottom">
											<div class="col-md-5">
												<div class="image-block">
													<img src="../resources/static/images/articlebg.png"
														class="img-fluid rounded w-100" alt="blog-img">
												</div>
											</div>
											<div class="col-md-7">
												<div class="blog-description pl-2">
													<div class="date mb-1">
														<a href="#" tabindex="-1">2 주 전</a>
													</div>
													<h6 class="mb-2">(예시)[모집]수원시청 앞 광장 행사</h6>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 새로운 게시글 리스트 공간 End -->
					<!-- 댓글 리스트 공간 start -->
					<div class="col-lg-12">
						<div
							class="iq-card iq-card-block iq-card-stretch iq-card-height blog user-comment">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="header-title">
									<h4 class="iq-card-title">댓글</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<div class="row">
									<c:forEach items="${commentList2 }" var="comment2">
										<div class="col-lg-12">
											<div
												class="iq-card iq-card-block iq-card-stretch iq-card-height blog">
												<div class="iq-card-body">
													<div class="d-flex align-items-center">
														<div class="user-image mb-3">
															<img class="avatar-80 rounded"
																src="../resources/static/images/user/01.jpg" alt="#"
																data-original-title="" title="">
														</div>
														<div class="ml-3">
															<h5>${sessionScope.userNick}</h5>
														</div>
													</div>
													<div class="blog-description">
														<p>${comment2.recruitcmtContent }</p>
														<div class="like mr-4">
															<i class="ri-thumb-up-line text-primary pr-2"></i>좋아요 200
															<button class="btn iq-bg-danger"
																onclick="location.href='deleteComment2.do?recruitSeq=${getrecruit.recruitSeq }&recruitcmtSeq=${comment2.recruitcmtSeq}';">댓글
																삭제</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<!-- 댓글 작성 공간 start -->
									<div class="col-lg-12">
										<div
											class="iq-card iq-card-block iq-card-stretch iq-card-height blog">
											<div class="iq-card-header d-flex justify-content-between">
												<div class="header-title">
													<h4 class="iq-card-title">댓글 작성</h4>
												</div>
											</div>
											<div class="iq-card-body">
												<form action="insertComment2.do" method="get">
													<div class="form-group">
														<label for="exampleFormControlTextarea1">댓글 내용:</label>
														<textarea class="form-control lineHeight"
															name="recruitcmtContent" id="exampleFormControlTextarea1"
															rows="4"></textarea>
													</div>
													<input type="submit" class="btn btn-primary" value="댓글 등록">
													<input type="hidden" name="recruitSeq"
														value="${getrecruit.recruitSeq}">
												</form>
											</div>
										</div>
									</div>
									<!-- 댓글 작성 공간 End -->
								</div>
							</div>
						</div>
					</div>
					<!-- 댓글 리스트 공간 End -->
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
						<li class="list-inline-item"><a href="terms-of-service.html">서비스
								이용약관</a></li>
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
