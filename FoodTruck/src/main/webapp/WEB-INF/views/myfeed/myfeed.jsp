
<%
	String id = (String) session.getAttribute("userId");
String userNick = (String) session.getAttribute("userNick");
String feedNick = (String) session.getAttribute("feedNick");
String feedPhoto = (String) session.getAttribute("feedPhoto");

if (id == null) {
	response.sendRedirect("login/signIn.jsp");
}
%>
<!-- 1. POST 전송시 한글깨짐
JSP 페이지 상단에 request.setCharacterEncoding 을 명시한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 2. GET 전송시 한글깨짐
Tomcat의 server.xml에 URIEncoding 옵션을 추가해 준다.  -->

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FT Zone | 마이피드</title>
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
</style>
</head>
<body class="sidebar-main-active right-column-fixed">
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
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
							class="img-fluid" alt=""> <span id="mainName">FoodTruck
								Zone</span>
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
		<!-- Page Content  -->
		<div id="content-page" class="content-page">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="iq-card">
							<div class="iq-card-body profile-page p-0">
								<div class="profile-header">
									<div class="cover-container">
										<img src="../resources/static/images/page-img/profile-bg1.jpg"
											alt="profile-bg" class="rounded img-fluid">
									</div>
									<div class="user-detail text-center mb-3">
										<div class="profile-img">
											<img src="../resources/upload/${sessionScope.feedPhoto}"
												alt="profile-img" class="avatar-130 img-fluid"
												style="height: 120px; margin-bottom: 20px;" />
										</div>
										<div class="profile-detail">
											<h3 class="">${sessionScope.feedNick}</h3>
										</div>
									</div>
									<div
										class="profile-info p-4 d-flex align-items-center justify-content-between position-relative">
										<div class="social-links">
											<ul
												class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0">
												<li class="text-center pr-3"><a
													href="https://ko-kr.facebook.com/"><img
														src="../resources/static/images/icon/08.png"
														class="img-fluid rounded" alt="facebook"></a></li>
												<li class="text-center pr-3"><a
													href="https://twitter.com/"><img
														src="../resources/static/images/icon/09.png"
														class="img-fluid rounded" alt="Twitter"></a></li>
												<li class="text-center pr-3"><a
													href="https://www.instagram.com/"><img
														src="../resources/static/images/icon/10.png"
														class="img-fluid rounded" alt="Instagram"></a></li>
											</ul>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="iq-card">
							<div class="iq-card-body p-0">
								<div class="user-tabing">
									<ul
										class="nav nav-pills d-flex align-items-center justify-content-center profile-feed-items p-0 m-0">
										<li class="col-sm-3 p-0"><a class="nav-link active"
											data-toggle="pill" href="#timeline" style="width: 935px;">Timeline</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="tab-content">
							<div class="tab-pane fade active show" id="timeline"
								role="tabpanel">
								<div class="iq-card-body p-0">
									<div class="row">
										<%
											if (userNick.equals(feedNick)) {
										%>
										<div class="col-lg-8">
											<div id="post-modal-data" class="iq-card"
												style="width: 940px;">
												<div class="iq-card-header d-flex justify-content-between">
													<div class="iq-header-title">
														<h4 class="card-title">Create Post</h4>
													</div>
												</div>

												<form class="post-text ml-3 w-100" action="../insertFeed.do"
													id="createPost" enctype="multipart/form-data" method='post'>
													<div class="iq-card-body" data-toggle="modal"
														data-target="#post-modal">
														<input type="hidden" name="userId"
															value="${sessionScope.userId}">
														<div class="d-flex align-items-center">
															<div class="user-img">
																<img src="../resources/upload/${sessionScope.userPhoto}"
																	alt="userimg" class="avatar-60 rounded-circle">
															</div>
															<input type="text" name="feedContent"
																class="form-control rounded" placeholder="글을 적어주세요..."
																style="border: none;">
														</div>
														<hr>
														<ul
															class="post-opt-block d-flex align-items-center list-inline m-0 p-0">
															<li class="iq-bg-primary rounded p-2 pointer mr-3">
																<input type="file" size="40" name='feedfile'> <!-- 										 <div class="custom-file"> -->

																<!--                            				 </div>	 --> <!-- 게시물 등록 부분 아마도 나중에 submit으로 바꾸던가 button 기능을 submit으로 바꿔야할 것 이다.-->
																<button type="submit"
																	class="btn btn-primary d-block mt-3"
																	style="margin-left: 260%; width: 60px">등록</button>
															</li>
														</ul>
													</div>
												</form>
											</div>
											<%
												}
											%>
											<c:forEach items="${ListFeed }" var="ListFeed">
												<input type="hidden" class="feedSeqList"
													value="${ListFeed.get(0).feedSeq} ">
												<div class="iq-card" style="width: 940px;">
													<div class="iq-card-body">
														<div class="post-item">
															<div class="user-post-data p-3">
																<div class="d-flex flex-wrap">
																	<div class="media-support-user-img mr-3">
																		<img class="rounded-circle img-fluid"
																			src="../resources/upload/${ListFeed.get(0).userPhoto}"
																			alt="">
																	</div>
																	<div class="media-support-info mt-2">

																		<h5 class="mb-0 d-inline-block">
																			${sessionScope.feedNick}</h5>
																		<p class="mb-0">
																			<fmt:formatDate value="${ListFeed.get(0).feedDate}"
																				pattern="yyyy-MM-dd KK:mm" />
																		</p>
																	</div>
																	<%
																		if (userNick.equals(feedNick)) {
																	%>
																	<div class="iq-card-post-toolbar">
																		<div class="dropdown">
																			<span class="dropdown-toggle" data-toggle="dropdown"
																				aria-haspopup="true" aria-expanded="false"
																				role="button"> <i class="ri-more-fill"></i>
																			</span>
																			<div class="dropdown-menu m-0 p-0">

																				<a onclick="button_update(this)"
																					class="dropdown-item p-3"><input type="hidden"
																					class="feedSeq" value="${ListFeed.get(0).feedSeq}">
																					<div class="d-flex align-items-top">
																						<div class="icon font-size-20">
																							<i class="ri-pencil-line"></i>
																						</div>
																						<div class="data ml-2">
																							<h6>글 수정하기</h6>
																							<p class="mb-0">게시글 수정하기 및 업데이트</p>
																						</div>
																					</div> </a> <a class="dropdown-item p-3"
																					onclick="button_delete(this)"> <input
																					type="hidden" class="feedSeq"
																					value="${ListFeed.get(0).feedSeq}">
																					<div class="d-flex align-items-top">
																						<div class="icon font-size-20">
																							<i class="ri-delete-bin-7-line"></i>
																						</div>
																						<div class="data ml-2">
																							<h6>글 삭제하기</h6>
																							<p class="mb-0">마이피드에서 게시글을 삭제하기</p>
																						</div>
																					</div>
																				</a>

																			</div>
																		</div>
																	</div>
																	<%
																		}
																	%>
																</div>
															</div>
															<div class="user-post">
																<h5>${ListFeed.get(0).feedContent}</h5>
																<!-- 글내용 -->
															</div>
															<div class="user-post">
																<c:choose>
																	<c:when
																		test="${ListFeed.get(0).feedContent_photo != null }">
																		<a href="javascript:void();"><img width="320px"
																			height="210px"
																			src="../resources/upload/${ListFeed.get(0).feedContent_photo} "
																			alt="post-image" /></a>
																	</c:when>
																</c:choose>
															</div>
															<div class="comment-area mt-3">
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div
																		class="like-block position-relative d-flex align-items-center">

																		<div class="total-comment-block">
																			<span class="dropdown-toggle" data-toggle="dropdown"
																				aria-haspopup="true" aria-expanded="false"
																				role="button">
																				${ListFeed.get(0).feedCommentCnt} 댓글</span>
																		</div>
																	</div>
																</div>
																<div class="comment-area mt-3">
																	<hr>
																	<input type="hidden" name="userId"
																		value="${sessionScope.userId}">
																	<!-- 댓글기능 -->
																	<input type="text"
																		class="form-control rounded commentCont"
																		name="commentCont" id="commentCont"
																		placeholder="댓글을 입력해주세요..." style="width: 780px;">
																	<!-- 																	<div class="comment-attagement d-flex"> -->
																	<!-- 등록버튼위치 -->
																	<a class="dropdown-item p-3 feedcomment"
																		onclick="button_feedcomment(this)"> <input
																		type="hidden" class="feedSeq"
																		value="${ListFeed.get(0).feedSeq}">
																		<button class="btn btn-primary d-block "
																			style="margin: 0 0 50px 290px; float: right;">댓글
																			등록</button>
																	</a>
																</div>
																<c:choose>
																	<c:when test="${ListFeed.get(0).commentSeq !=  '' }">
																		<c:forEach items="${ListFeed }" var="commentFeed">
																			<hr>
																			<ul class="post-comments p-0 m-0">
																				<li class="mb-2">
																					<div class="d-flex flex-wrap">
																						<div class="user-img">
																							<img
																								src="../resources/upload/${commentFeed.userPhoto}"
																								alt="userimg"
																								class="avatar-35 rounded-circle img-fluid">
																						</div>
																						<div class="comment-data-block ml-3">
																							<h6>${commentFeed.userNick}</h6>
																							<input type="hidden" cless="commentNick"
																								value="${commentFeed.userNick} ">
																							<p class="mb-0">${commentFeed.commentCont}</p>
																							<div
																								class="d-flex flex-wrap align-items-center comment-activity">
																								<span> <fmt:formatDate
																										value="${commentFeed.commentDate}"
																										pattern="yyyy-MM-dd KK:mm" />
																								</span>
																								<c:set var="setuserId"
																									value="${sessionScope.userNick}" />
																								<c:choose>
																									<c:when
																										test="${commentFeed.userNick == setuserId}">
																										<input type="hidden" class="feedSeq"
																											value="${commentFeed.feedSeq}">
																										<input type="hidden" class="commentSeq"
																											value="${commentFeed.commentSeq}">
																										<a onclick="button_deletecomment(this)">삭제
																										</a>
																									</c:when>
																								</c:choose>
																							</div>
																						</div>
																					</div>
																				</li>

																			</ul>
																		</c:forEach>
																	</c:when>
																</c:choose>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
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
	<!-- lottie JavaScript -->
	<script src="../resources/static/js/lottie.js"></script>
	<!-- am core JavaScript -->
	<script src="../resources/static/js/core.js"></script>
	<!-- am charts JavaScript -->
	<script src="../resources/static/js/charts.js"></script>
	<!-- am animated JavaScript -->
	<script src="../resources/static/js/animated.js"></script>
	<!-- am kelly JavaScript -->
	<script src="../resources/static/js/kelly.js"></script>
	<!-- am maps JavaScript -->
	<script src="../resources/static/js/maps.js"></script>
	<!-- am worldLow JavaScript -->
	<script src="../resources/static/js/worldLow.js"></script>
	<!-- Chart Custom JavaScript -->
	<script src="../resources/static/js/chart-custom.js"></script>
	<!-- Custom JavaScript -->
	<script src="../resources/static/js/custom.js"></script>
</body>
<script type="text/javascript">
	function button_delete(e) {
		var feedSeq = $(e).find("input").val();
		
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			//document.form.submit();
			location.href = "../deleteFeed.do?feedSeq=" + feedSeq;
		} else { //취소
			href = "#"
			return;
		}

	}
	
	function button_feedcomment(e){ //댓글 등록
		
		var feedSeq = $(e).find("input").val();		
		var userId = '<%=(String) session.getAttribute("userId")%>';
		var commentCont = $(e).prev().val();
		//closest("div")
	
		
		
		location.href = "../feedcomment.do?feedSeq="+feedSeq+"&userId="+userId+"&commentCont="+commentCont;
	}

	 
 	function button_update(e){ //게시글 수정
		
		var feedSeq = $(e).find("input").val();		
		var userId = '<%=(String) session.getAttribute("userId")%>
	';

		var commentCont = document.getElementById("commentCont").value

		location.href = "../myfeed/selectFeed.do?feedSeq=" + feedSeq;

	}
	function button_deletecomment(e) { //댓글 삭제

		var feedSeq = $(e).prev().prev().val()
		var commentSeq = $(e).prev().val()

		location.href = "../deleteOneComm.do?feedSeq=" + feedSeq
				+ "&commentSeq=" + commentSeq;

	}
</script>
</html>
