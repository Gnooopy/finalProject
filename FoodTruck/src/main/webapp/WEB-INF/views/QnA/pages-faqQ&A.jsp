<%

	String id = (String)session.getAttribute("userId"); 
	
	if(id == null){
		response.sendRedirect("../login/signIn.do");
	}
%>
<!doctype html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 1. POST 전송시 한글깨짐
JSP 페이지 상단에 request.setCharacterEncoding 을 명시한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String qnaseq = request.getParameter("qnaSeq"); 
%>

<!-- 2. GET 전송시 한글깨짐
Tomcat의 server.xml에 URIEncoding 옵션을 추가해 준다.  -->

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />


<html lang="en">
<head>
<style>

.ad{float:left;
	
}
#ad2{
	width:600px;
	float:light;
}
/* #ad2{ */
/* 	width:650px; */
/* 	float:light; */
/* } */


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

#hr{
	border-color: #000000; 
	width: 1000px;
}
</style>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FT Zone | Q&A 고객센터 </title>
<!-- Favicon -->
<script src="../resources/static/js/mainCSS.js"></script>
</head>
<body class="sidebar-main-active right-column-fixed">
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<!-- loader END -->
	<!-- Wrapper Start -->
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
                           class="img-fluid rounded-circle mr-3" alt="">
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
					<div class="col-sm-12">
						<div class="iq-card position-relative ">
							<img src="../resources/static/images/qnabg.jpg" class="img-fluid w-100"
									alt="profile-bg" style="opacity: 1; height: 260px;">
							<div class="inner-page-title" style = "width : 300px; margin-left: 35%; margin-top: 3%; ">
								<h1 class="text-white">Q&A 게시판</h1>
							</div>

						</div>
						<div id="writebutton" style="padding-left: 92%">
							<button type="submit" class="btn btn-primary" onclick="location.href='insertQ&A.do'">
								<font style="vertical-align: inherit"> 
									<font style="vertical-align: inherti;">글쓰기</font>
								</font>
							</button>
						</div>
					</div><br>
					<div class="col-lg-12">
						<div class="iq-accordion career-style faq-style  ">
							<div class="iq-card iq-accordion-block accordion-active">
								<div class="active-faq clearfix">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<a class="accordion-title"><h4>(예시)로그인이 안되요 </h4></a>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-details">
									<p class="mb-0">입력한 아이디와 비밀번호로 로그인이 되지 않아요</p>
								</div>
								<div class="accordion-details">
										<!-- ㅂ 한자 6 번 = └ -->
									<p class="mb-0">└  로그인이 불가하며 '아이디또는 비밀번호가 일치하지 않습니다.'라는 문구가 노출되는 경우라면, 아이디/비밀번호가 맞지 않거나 잘못 입력된 경우입니다. 아이디 혹은 비밀번호를 확인해주세요.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="iq-accordion career-style faq-style  ">
							<div class="iq-card iq-accordion-block accordion-active">
								<div class="active-faq clearfix">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<a class="accordion-title"><h4>(예시)비밀번호 찾기 </h4> </a>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-details">
									<p class="mb-0">비밀번호가 기억나지 않아요.</p>
								</div>
								<div class="accordion-details">
									<p class="mb-0">└푸드트럭 회원 비밀번호는 암호화 저장되어 분실 시 찾아드릴 수 없습니다. 로그인 페이지에서 비밀번호를 재설정해 주시기 바랍니다</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="iq-accordion career-style faq-style  ">
							<div class="iq-card iq-accordion-block accordion-active">
								<div class="active-faq clearfix">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<a class="accordion-title"><h4>(예시)한글입력</h4> </a>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-details">
									<p class="mb-0">키보드 한글 입력이 안돼요.</p>
								</div>
								<div class="accordion-details">
									<p class="mb-0">└ windows 키 또는 시작 > 언어 설정 실행 > 기본설정 언어 > 언어추가 한국어 </p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="iq-accordion career-style faq-style  ">
							<div class="iq-card iq-accordion-block accordion-active">
								<div class="active-faq clearfix">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<a class="accordion-title"><h4>(예시)푸드트럭자리 신청</h4> </a>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-details">
									<p class="mb-0">마이페이지에서 업체등록 신청하고 푸드트럭자리 신청 할려고 하는데 어디서 해야하나요? </p>
								</div>
								<div class="accordion-details">
									<p class="mb-0">└ 페이지상 왼쪽 메뉴바 > 푸드트럭자리 신청 및 조회 에서 신청 가능합니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="iq-accordion career-style faq-style  ">
							<div class="iq-card iq-accordion-block accordion-active">
								<div class="active-faq clearfix">
									<div class="container">
										<div class="row">
											<div class="col-sm-12" style="display:block">
												<a class="accordion-title">
													<div class="ad"><h4>(예시)푸드트럭 요청  </h4></div>
													 <div  id="ad2" class="ad" style="margin-top:6px"><h6></h6></div> 
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-details">
									<p class="mb-0">저의 동내에 푸드트럭을 요청하고 싶어요</p>
								</div>
								<div class="accordion-details">
									<p class="mb-0">└ 페이지상 왼쪽 메뉴바 > 커뮤니티 > 푸드트럭 요청 에서 푸드트럭을 요청할수 있습니다. </p>
								</div>
							</div>
						</div>
					</div>
					<hr id="hr">
					<c:forEach items="${QnAList}" var="qna">
						<div class="col-lg-12">
							<div class="iq-accordion career-style faq-style  ">
								<div class="iq-card iq-accordion-block accordion-active">
									
									<div class="active-faq clearfix">
										<div class="container">
											<div class="row">
												<div class="col-sm-12" style="display:block">
													<a class="accordion-title">
														<div class="ad"><h4> ${qna.qnaTitle}  </h4></div> 
														<div  id="ad2" class="ad"></div> 
													</a>
												</div>
													<div id="ad2" class="ad" style="margin-top:5px; width:auto; font-size:13px; font-weight: bold">${qna.userId}&nbsp;&nbsp;</div>
													<div style="margin-top:10px; font-size:10px "><fmt:formatDate value="${qna.qnaContentdate}" pattern="yyyy-MM-dd"/></div>
													<div style="margin-top:10px; font-size:10px">
												
												<div>
												<input type="hidden" value="${qna.userId}" class="qnaId">
												<input type="hidden" class="qnaSeq" value="${qna.qnaSeq}">
													<div class="qnafucking">
													</div>
<!-- 													 String userid=(String)session.getAttribute("userid");   -->
<!-- 													 qnaid= getElementById("qnaId").value; -->
												</div>
											</div>
											</div>
										</div>
									</div>
									<div class="accordion-details">
										<p class="mb-0">${qna.qnaContent} </p>
									</div>
									<div class="accordion-details">
										<p class="mb-0">└ ${qna.qnaComment} 
											<c:choose>
												<c:when test="${qna.qnaComment == null}">
													아직 댓글이 없습니다.
												</c:when>
											</c:choose>
										 </p>
									</div>
									<c:choose>
										<c:when test="${sessionScope.userId == 123 and qna.qnaComment == null}">
												<div class="col-lg-12">
													<div class="iq-card iq-card-block iq-card-stretch iq-card-height blog">
														<div class="iq-card-header d-flex justify-content-between">
															<div class="header-title">
																<h5 class="iq-card-title">댓글 작성</h5>
															</div>
														</div>
														<div class="iq-card-body">
															<form action="insertQ&AComment.do" method="get">
																	<div class="form-group">
																		<label for="exampleFormControlTextarea1">댓글 내용:</label>
																		<textarea class="form-control lineHeight" name="qnaComment" id="exampleFormControlTextarea1"  rows="1"></textarea>
																	</div>
																	<input type="hidden" class="qnaSeq" name="qnaSeq" value="${qna.qnaSeq}">
																	<input type="submit" class="btn btn-primary" value="댓글 등록">
															</form>
														</div>
													</div>
												
												</div>
										</c:when>
									</c:choose>
									</div>
								</div>
							</div>
					</c:forEach>
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
	 <script src="../resources/static/js/mainJS.js"></script>
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	 <script type="text/javascript">
	 	$(function(){
	 		
	 		var userId = ${sessionScope.userId};
	 		var qnaId = $('.qnaId');
	 		var qnaSeq = $('.qnaSeq');
// 	 		var userChk = ${sessionScope.userChk};
	 	 	
	 		
	 		for ( var i = 0; i < qnaId.length; i++){
		 		if ( userId ==  qnaId.eq(i).val() && userId != 123 ){
		 			$('.qnafucking').eq(i).html('<a href="getQ&A.do?qnaSeq='+qnaSeq.eq(i).val()+'">수정</a><a href="deleteQnA.do?qnaSeq='+qnaSeq.eq(i).val()+'">삭제</a>');
		 		}
		 		if ( userId == 123 ){ // 나중에 합치고 수정 userId > userChk == 3 으로
		 			$('.qnafucking').eq(i).html('<a href="getQ&A.do?qnaSeq='+qnaSeq.eq(i).val()+'">수정</a><a href="deleteQnA.do?qnaSeq='+qnaSeq.eq(i).val()+'">삭제</a>');
		 		}
		 		// <a href="insertQ&AComment.do?qnaSeq='+qnaSeq.eq(i).val()+'">답장</a>
		 		
// 		 		if ( userId == 123){ // 나중에 합치고 수정 userId > userChk == 3 으로   qnaComment
		 			
// // 		 			$('.fuckingqna').eq(i).html('<textarea class="form-control" id="qnaComment" name="qnaComment" placeholder="ㅂ한자6번 = └ 입니다."></textarea>')
<%-- 		 		$('.fuckingqna').eq(i).html('<div class="col-lg-12"><div class="iq-card iq-card-block iq-card-stretch iq-card-height blog"><div class="iq-card-header d-flex justify-content-between"><div class="header-title"><h4 class="iq-card-title">댓글 작성</h4></div></div><div class="iq-card-body"><form action="insertQ&AComment.do" method="get"><input type="hidden" name="qnaSeq" value="<%=qnaseq%>"><div class="form-group"><label for="exampleFormControlTextarea1">댓글 내용:</label><textarea class="form-control lineHeight" name="qnaComment" id="exampleFormControlTextarea1" rows="4"></textarea></div><input type="submit" class="btn btn-primary" value="댓글 등록"></form></div></div></div>') --%>
// 		 		}
	 		}
	 		
	 		
	 		
	 	});
	 
	 
	 </script>
</body>
</html>