<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"
	redirectPort="8443" URIEncoding="UTF-8" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리신청 팝업창</title>
<script src="../resources/static/js/mainCSS.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">



<style>
@font-face {
	font-family: 'Cafe24Ssurround';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#truckReservation {
	font-family: 'Cafe24Ssurround'
}
#truckReservation2{
	font-family: 'Cafe24Ssurround'
}

.btnSubmit {
	margin: 3% 0 0 30%;
}

.btnReset {
	margin: 3% 0 0 3%;
}

#explain {
	font-size: 12px;
	color: red;
	margin-top: 30px;
}
</style>

</head>
<body>


	
	<div class="iq-card">
		<div class="iq-card-header d-flex justify-content-between">
			<div class="iq-header-title1">
				<span id=truckReservation style="font-size: 30px; color: black;">푸드트럭 자리신청</span>
			</div>
			
		</div>
		<div class="iq-card-body">

			<form Method="post" name="insertReservation">
			
				<div class="form-group">
					
					<span type="text" id=truckReservation2 name="reservationMarkZone" 
					style="font-size:20px; color : skyblue; margin-top:10px;"></span>		
				</div>
				<div class="form-group">
					<label for="colFormLabelSm">푸드트럭명</label> <input type="text"
						class="form-control form-control-sm" name="reservationTitle"
						id="colFormLabelSm" placeholder="푸드트럭명을 적어주세요.">
				</div>
				<div class="form-group">
					<label for="exampleInputdate">날짜</label> <input type="text"
						class="form-control" name="reservationDate" id="testDatepicker"
						value="" style="width:400px; display:initial;">
					
				</div>
				<div class="form-group mb-0">
					<label for="colFormLabelLg" class="pb-0">핸드폰번호</label> <input
						type="text" class="form-control form-control-lg"
						name="reservationPhone" id="colFormLabelLg"
						placeholder="'-'를 빼고 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="colFormLabel">이메일</label> <input type="email"
						class="form-control" name="reservationEmail" id="colFormLabel"
						placeholder="exam@naver.com">
				</div>
				<div>
					<p id="explain">
						※주의 사항※<br> &nbsp 저희 푸드트럭존의 영업시간은 해당 날짜의 am6:00 - pm5:00까지
						영업가능합니다.
					</p>
				</div>
				<button type="button" class="btn btn-primary btnSubmit"
					onclick="clickSubmit()">Submit</button>
				<button type="reset" class="btn iq-bg-danger btnReset"
					onclick="winClose()">cancle</button>
			</form>
		</div>
	</div>


	<script src="../resources/static/js/mainJS.js"></script>
	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		function clickSubmit(){
			
			var insertReservation = document.insertReservation
			var reservationTitle = insertReservation.reservationTitle.value;
			var reservationDate = insertReservation.reservationDate.value;
			var reservationPhone = insertReservation.reservationPhone.value;
			var reservationEmail = insertReservation.reservationEmail.value;
			var reservationMarkZone = $('#truckReservation2').text();
// 			alert(reservationMarkZone);
			
			if(!reservationTitle){
				alert("상호명을 입력해주세요." );
			}
			else if(!reservationDate){
				alert("날짜를 선택해주세요.");
			}
			else if(!reservationPhone){
				alert("핸드폰 번호를 입력해주세요.");
			}
			else if(!reservationEmail){
				alert("이메일을 입력해주세요.");
			}else{
				var data = {
						reservationTitle : reservationTitle,
						reservationDate : reservationDate,
						reservationPhone : reservationPhone,
						reservationEmail : reservationEmail,
						reservationMarkZone : reservationMarkZone
				}
				$.ajax({
					type : "post",
					url : "insertReservation.do",
					data : data,
					success : function(){
						alert('예약완료 되었습니다.');
						winClose();
					}, error : function(request, error){
				         alert("fail");
				    }
				});
			}
		}
		function winClose(){
			window.close();
		}
		
		
	</script>
<script type="text/javascript">
$(function() {
	
		  $("#truckReservation2").text('<%=request.getParameter("title")%>');			  
		  
		  $( "#testDatepicker" ).datepicker({
		        showOn: "both", 
		        buttonImage: "../resources/static/images/calender.png", 
		        buttonImageOnly: true,
		        dateFormat: "yy-mm-dd",
		        minDate : 0,
		        maxDate : new Date('2021-10-26')
		  } );
		});
</script>

</body>
</html>