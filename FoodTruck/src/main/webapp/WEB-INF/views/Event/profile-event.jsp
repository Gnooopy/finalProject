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
      <title>FT Zone | 이번달 이벤트</title>
      
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
         
         <div class="header-for-bg">
            <div class="background-header position-relative">
               <img src="../resources/static/images/eventbg.jpg" class="img-fluid w-100 rounded rounded" alt="profile-bg" style="opacity: 0.8; height: 10%; width : 1200px; height : 330px;">
               <div class="title-on-header">
                  <div class="data-block">
                     <h2>다가오는 이벤트</h2>
                  </div>
               </div>
            </div>
         </div>
        
         <!-- Page Content  -->
         <div id="content-page" class="content-page">
            <div class="container">
             <div class="eventfucking">  <!-- 머선일이지  -->
              
	    	 </div>
               <div class="row">
	               <div class="col-md-6 col-lg-4">
	                     <div class="iq-card rounded iq-card-block iq-card-stretch iq-card-height">
	                        <div class="event-images">
	                           <a href="#">
	                           <img src="../resources/static/images/eventgojung1.png" class="img-fluid" alt="Responsive image" style="width : 310px; height : 200px;">
	                           </a>
	                        </div>
	                        <div class="iq-card-body">
	                           <div class="d-flex">
	                              <div class="date-of-event">
	                                 <h6>10월</h6>
	                                 <h6>15일</h6>
	                              </div>
	                              <div class="events-detail ml-3">
	                                 <h5>(예시)휴면교육센터</h5>
	                                 <p>10월 15일 휴먼교육센터(수원)에서 마지막 프로젝트 발표가 있습니다.</p>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	               <div class="col-md-6 col-lg-4">
	                     <div class="iq-card rounded iq-card-block iq-card-stretch iq-card-height">
	                        <div class="event-images">
	                           <a href="#">
	                           <img src="../resources/static/images/eventgojung2.jpg" class="img-fluid" alt="Responsive image" style="width : 310px; height : 200px;">
	                           </a>
	                        </div>
	                        <div class="iq-card-body">
	                           <div class="d-flex">
	                              <div class="date-of-event">
	                                 <h6>10월</h6>
	                                 <h6>16일</h6>
	                              </div>
	                              <div class="events-detail ml-3">
	                                 <h5>(예시)세계유산축전 수원화성</h5>
	                                 <p>유네스코 세계유산 수원화성의 생생한 가치를 느낄 수 있는 <세계유산축전 수원화성>이다.</p>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	                  <div class="col-md-6 col-lg-4">
	                     <div class="iq-card rounded iq-card-block iq-card-stretch iq-card-height">
	                        <div class="event-images">
	                           <a href="#">
	                           <img src="../resources/static/images/eventgojung3.png" class="img-fluid" alt="Responsive image" style="width : 310px; height : 200px;">
	                           </a>
	                        </div>
	                        <div class="iq-card-body">
	                           <div class="d-flex">
	                              <div class="date-of-event">
	                                 <h6>10월</h6>
	                                 <h6>19일</h6>
	                              </div>
	                              <div class="events-detail ml-3">
	                                 <h5>(예시)롯데월드 호러 할로원</h5>
	                                 <p>롯데월드 어드벤처가 선풍적인 열풍을 몰고 온 가을시즌 축제 호러 할로윈 심장을 쫄깃하게 만드는 본격적인 호러 할로윈이 파크 곳곳에서 펼쳐진다.</p>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	                  
	                  
	                    <c:forEach items="${EventList}" var="event">
		                  <div class="col-md-6 col-lg-4">
		                     <div class="iq-card rounded iq-card-block iq-card-stretch iq-card-height">
		                    	 <a href="GetEvent.do?eventseq=${event.eventseq}">
			                        <div class="event-images">
			                           <img src="../resources/upload/${event.eventContent_photo }" class="img-fluid" alt="Responsive image" style="width : 310px; height : 200px;">
			                        </div>
			                        <div class="iq-card-body">
			                           <div class="d-flex">			                          
			                              <div class="events-detail ml-3">
			                                 <span style="color:black; font-size:30px; margin-left:-20px;">${event.eventTitle}</span>
			                                 <span style="color:gray; font-size:10px; ">${event.eventmm} 월 ${event.eventdd} 일</span>
			                                 <h6>${event.eventContent}</h6>
			                              </div>
			                           </div>
			                        </div>
		                        </a>
		                     </div>
		                  </div>
		                  <input type="hidden" value="${event.userId}" class="eventId">
						  <input type="hidden" value="${event.eventseq}" class="eventseq">
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
	 		var eventId = $('.eventId');
	 		var eventseq = $('.eventseq');
	 	 	
	 		
	 		for ( var i = 0; i < 1; i++){
// 		 		while(userId==123){
		 		 if(userId == 123){
		 			 
		 			$('.eventfucking').eq(i).html('<a href="insertEvent.do">글쓰기</a>');
		 			
		 		}
			}
	 	});
	 </script>
   </body>
</html>