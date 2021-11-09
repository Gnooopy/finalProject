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
<title>FT Zone | 업체등록</title>
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
#business{
	font-family: 'Cafe24Ssurround'
}



</style>

</head>
<body>
<div class="iq-card">
		<div class="iq-card-header d-flex justify-content-between">
			<div class="iq-header-title1">
				<span id=business style="font-size: 30px; color: black;">푸드트럭 업체 등록</span>
			</div>
			
		</div>
		<div class="iq-card-body">

			<form Method="post" name="insertReservation">
			
				<div class="form-group">
					
					<span type="text" id=truckReservation2 name="reservationMarkZone" 
					style="font-size:20px; color : skyblue; margin-top:10px;"></span>		
				</div>
				<div class="form-group">
					<label for="colFormLabelSm">푸드트럭 이름</label> <input type="text"
						class="form-control form-control-sm" name="truckName"
						id="colFormLabelSm" placeholder="푸드트럭명을 적어주세요.">
				</div>
				<div class="form-group mb-0">
					<label for="colFormLabelLg" class="pb-0">사업자등록번호</label> <input
						type="text" class="form-control form-control-lg"
						name="truckNum" id="colFormLabelLg"
						placeholder="'-'를 빼고 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="colFormLabel">사업자등록증</label> 
					<br>
					<input type="file">
				</div>				
				<div class="form-group">
					<label for="exampleInputdate">소개글</label> 
					<br>
					<textarea cols="60" rows="6"name="truckContent" placeholder="소개글을 적어주세요..."></textarea>
					
				</div>
				
				<button type="button" class="btn btn-primary btnSubmit"
					onclick="clickSubmit()" style="width:100px; margin-left:150px;">등록</button>
				<button type="reset" class="btn iq-bg-danger btnReset"
					onclick="winClose()" style="width:100px">취소</button>
			</form>
		</div>
	</div>









</body>

  <script src="../resources/static/js/mainJS.js"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
   
      function clickSubmit(){
         
         var insertReservation = document.insertReservation
         var truckName = insertReservation.truckName.value;  //푸드트럭 이름
         var truckNum = insertReservation.truckNum.value; //사업자 등록번호
         var truckContent = insertReservation.truckContent.value; //소개글
		 var userId = '<%=(String)session.getAttribute("userId")%>';
         
         if(!truckName){
            alert("푸드트럭명을 입력해주세요." );
         }
 
         else if(!truckNum){
            alert("사업자등록번호를 입력해주세요.");
         }
         else if(!truckContent){
            alert("소개글을 입력해주세요.");
         }else{
            var data = {
            		userId : userId,
            		truckName : truckName,
            		truckNum : truckNum,
            		truckContent : truckContent,
           
            }
             $.ajax({
               type : "post",
               url : "/test/inserttruck.do",
               data : data,
               success : function(){
                  alert('업체등록이 완료되었습니다!');
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
</html>