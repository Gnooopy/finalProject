
<%
	String id = (String) session.getAttribute("userId");

if (id == null) {
	response.sendRedirect("../login/signIn.do");
}
%>
<%@page import="com.java.test.domain.MemberVO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />



<!doctype html>
<html lang="en">
<head>
<link rel="shortcut icon" href="#">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FT Zone | 자리신청 & 조회</title>
<script src="../resources/static/js/mainCSS.js"></script>
<!--       Favicon -->
<!--       <link rel="shortcut icon" href="../resources/static/images/favicon.ico" /> -->
<!--       Bootstrap CSS -->
<!--       <link rel="stylesheet" href="../resources/static/css/bootstrap.min.css"> -->
<!--       Typography CSS -->
<!--       <link rel="stylesheet" href="../resources/static/css/typography.css"> -->
<!--       Style CSS -->
<!--       <link rel="stylesheet" href="../resources/static/css/style.css"> -->
<!--       Responsive CSS -->
<!--       <link rel="stylesheet" href="../resources/static/css/responsive.css"> -->
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

.reservationClickCheck {
	font-family: 'Cafe24Ssurround';
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -180px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 10px 0 0 5px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

.map_wrap, .map_wrap * {
	margin-left:;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 14%;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
	margin-left: 50px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#reservationChart {
	position: absolute;
	left: 1210px;
	top: 0px
}

.overlaybox {
	position: relative;
	width: 360px;
	height: 350px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png')
		no-repeat;
	padding: 15px 10px;
}

.overlaybox div, ul {
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.overlaybox li {
	list-style: none;
}

.overlaybox .boxtitle {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png')
		no-repeat right 120px center;
	margin-bottom: 8px;
}

.overlaybox .first {
	position: relative;
	width: 247px;
	height: 136px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png')
		no-repeat;
	margin-bottom: 8px;
}

.first .text {
	color: #fff;
	font-weight: bold;
}

.first .triangle {
	position: absolute;
	width: 48px;
	height: 48px;
	top: 0;
	left: 0;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png')
		no-repeat;
	padding: 6px;
	font-size: 18px;
}

.first .movietitle {
	position: absolute;
	width: 100%;
	bottom: 0;
	background: rgba(0, 0, 0, 0.4);
	padding: 7px 15px;
	font-size: 14px;
}

.overlaybox ul {
	width: 247px;
}

.overlaybox li {
	position: relative;
	margin-bottom: 2px;
	background: #2b2d36;
	padding: 5px 10px;
	color: #aaabaf;
	line-height: 1;
}

.overlaybox li span {
	display: inline-block;
}

.overlaybox li .number {
	font-size: 16px;
	font-weight: bold;
}

.overlaybox li .title {
	font-size: 13px;
}

.overlaybox ul .arrow {
	position: absolute;
	margin-top: 8px;
	right: 25px;
	width: 5px;
	height: 3px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png')
		no-repeat;
}

.overlaybox li .up {
	background-position: 0 -40px;
}

.overlaybox li .down {
	background-position: 0 -60px;
}

.overlaybox li .count {
	position: absolute;
	margin-top: 5px;
	right: 15px;
	font-size: 10px;
}

.overlaybox li:hover {
	color: #fff;
	background: #d24545;
}

.overlaybox li:hover .up {
	background-position: 0 0px;
}

.overlaybox li:hover .down {
	background-position: 0 -20px;
}
</style>
</head>
<body class="sidebar-main-active right-column-fixed">
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<!-- loader END -->
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

		<div class="header-for-bg">
			<div class="background-header position-relative">
				<img src="../resources/static/images/푸드트럭배경사진1.png"
					class="img-fluid w-100" alt="profile-bg"
					style="opacity: 0.8; height: 30%;">
				<div class="title-on-header" >
					<div class="data-block" >
						<h2>푸드트럭자리 신청 및 조회</h2>
					</div>
				</div>
			</div>
		</div>






		<!--  ★★★★★★★★★★★ 지도 기능 시작 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->


		<!--  검색창 만들기 START -->
		<div class="map_wrap" style="margin-left: -9%; ">
			<div id="map"
				style="width: 50%; height: 100%; position: relative; overflow: hidden; margin: 5% 0% 0% 35%;">
			</div>
			<div id="menu_wrap" class="bg_white" style="margin-left:20%;">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="푸드트럭존" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<form Method="post" name="weather">
				<div id="reservationChart">
					<table class="table" style="width: 300px; margin-left:210%; float:left; ">
						<thead>
							<tr>
								<th scope="col">구역</th>
								<th scope="col" id=reservationMarkZone
									name="reservationMarkZone" colspan="2"></th>
							</tr>
							<tr>
								<th scope="col">#</th>
								<th scope="col">날짜</th>
								<th scope="col">업체명</th>
							</tr>
						</thead>
						<tbody id="dynamicTbody">

						</tbody>
					</table>
				</div>
			</form>
		</div>
		<!--  검색창 만들기 END -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d5e5d3ed9da917359e3dc33025391e0&libraries=services"></script>
		<script>
 
var markers = [];
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(37.251883248504406, 127.03135072804665), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


var positions = [
    {
    	// 수원 1-1
        latlng: new kakao.maps.LatLng(37.251883248504406, 127.03135072804665)
    },

    {
		// 수원 1-2
        latlng: new kakao.maps.LatLng(37.251761167616266, 127.03092670159204)
    },
    {
		// 수원 1-3
        latlng: new kakao.maps.LatLng(37.25140928630241, 127.0321446499191)
    },

    {
    		// 강남 1-3
    	latlng: new kakao.maps.LatLng(37.498163662235804, 127.02717148536811)
    },

    {
    		// 강남 2-1
    	latlng: new kakao.maps.LatLng(37.49703103147426, 127.02780914696652)
    },

    {
    		// 강남 3-3
    	latlng: new kakao.maps.LatLng(37.49684671812411, 127.02840684387205)
    },
    
];
 
 
 
// ★★★★★★★★★★★ 마커위 div창 띄우기 START ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

var content = [ ${divStr} ];


// var contentChart = [ ${divStr3} ];


var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
var marker;
var overlay = [];

// var overChart = [];

var overTitle = [];
for (var i = 0; i < positions.length; i ++) {
		
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35); 
        
        // 마커 이미지를 생성합니다    
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

        marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다.
            image : markerImage // 마커 이미지 
        });

    addMarker1(i); 
}
 

function addMarker1(i){		
    kakao.maps.event.addListener(marker, 'click', function() {
            overlay[i] = new kakao.maps.CustomOverlay({
	            content: content[i],
	            map: map,
	            position: positions[i].latlng 
     		});

            var startNum = content[i].indexOf("click_reservation('")+ 19; // 571 // 602
            var endNum = content[i].indexOf("')\"");
    		endNum = endNum - startNum;
    
            
	  	$("#reservationMarkZone").text(content[i].substr( startNum , endNum));
	  	
	  	
	  	
	  	$.ajax({
	  		type : "post",
			url : "chartC.do",
			data : {reservationMarkZone : content[i].substr( startNum , endNum) },
			async : true,
			dataType: 'json',
			success : function(data){		
				var html = "";
				for ( var i = 0; i < data.length; i++){
					html += '<tr>';
					html += '<td>'+data[i].reservationSeq+'</td>';
					html += '<td>'+data[i].reservationDate.substring(0,10)+'</td>';
					html += '<td>'+data[i].reservationTitle+'</td>';
					html += '</tr>';

					}
				$("#dynamicTbody").empty();
				$("#dynamicTbody").append(html);
				
			}, error : function(request, error){
		         alert("fail");
		    }

	  	})  
	 
    });
}

function closeOverlay(i) {   
	$("#reservationTitle").text("");
    overlay[i].setMap(null); 
}

function reservationChart(){
	
}
//★★★★★★★★★★★ 마커위 div창 띄우기 END ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★


// 예약 팝업창 띄우기
function click_reservation(e) {
 	var title = e
	
    var url = "truckReservation.do?title="+title;
    var name = "truckReservation";
    var options = 'width=500, height=550, top=30, left=600, resizable=no, scrollbars=no, location=no';
    window.open(url, name, options);
 	console.log(zoneTitle);
}



// 팝업 닫기
function close_reservation(){
   
    var requestValue = document.getElementById("Name").value;                   // 전송 파라미터 값
    var theURL = "/servlet/servlet.ExampleCloseUrl?requestValue="+requestValue; // 전송 URL
    // 호출 한 부모 페이지에서 URL 호출
    opener.window.location = url;
    // 호출 한 뒤 현재 팝업 창 닫기 이벤트
    close();
} 


//★★★★★★★★★★★★★ 검색기능 START ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
//searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })
        (marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// // 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info" style="margin-left:5%">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
//★★★★★★★★★★★★★ 검색기능 END ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★


</script>

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../resources/static/js/mainJS.js"></script>
</body>
</html>