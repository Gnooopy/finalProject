$(function(){
   // 사용자의 자료 입력여부를 검사하는 함수
   $('#confirm').click(function(){
       if($.trim($('#userId').val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#userId").focus();
            return false;
      
       }
       if($.trim($('#userPass').val())==''){
          alert("비밀번호를 입력해 주세요.");
          $('#userPass').focus();
          return false;
       }
       
       
       if($.trim($('#userName').val())==''){
          alert("이름입력해주세요.");
          $('#userName').focus();
          return false;
       }
       
       if($.trim($('#userNick').val())==''){
          alert("닉네임을 입력해주세요.");
          $('#userNick').focus();
          return false;
       }
       
       if($.trim($('#userPhone').val())==''){
          alert("전화번호를 입력해주세요.");
          $('#userPhone').focus();
          return false;
       }
       if($.trim($('#userEmail').val())==''){
          alert("이메일을 입력해주세요.");
          $('#userEmail').focus();
          return false;
       }
       
        // 자료를 전송합니다.
        //document.userinput.submit();
       alert("회원가입을 축하드립니다!!!");
       
   });
   
   //아이디 중복체크
   $('#userId').keyup(function(){
        $.ajax({
           type:'post',
           url:'idCheck.do',
           data : {userId : $('#userId').val()},
           async : true, // 비동기 통신(submit이 안되게끔방해)
           contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
           success: function(resultData){
              //alert("resultData" + resultData);
              
              $('#idCheckResult').html(resultData);
              
           }
              
        })
       
   })
   
   //이메일 중복체크
   $('#userNick').keyup(function(){
      $.ajax({
         type:'post',
         url:'idCheck.do',
         data : {userNick : $('#userNick').val()},
         async : true, // 비동기 통신(submit이 안되게끔방해)
         contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
         success: function(resultData){
            //alert("resultData" + resultData);
            
            $('#nickCheckResult').html(resultData);
            
         }
         
      })
      
   })

   $('#userEmail').keyup(function(){
      $.ajax({
         type:'post',
         url:'idCheck.do',
         data : {userEmail : $('#userEmail').val()},
         async : true, // 비동기 통신(submit이 안되게끔방해)
         contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
         success: function(resultData){
            //alert("resultData" + resultData);
            
            $('#emailCheckResult').html(resultData);
            
         }
         
      })
      
   })
})
   
   
   
   
   
   
   
   
   