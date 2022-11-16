function checkSignUp() {
   var userID = document.getElementById("userID");
   var form=document.signup;
   
   //상품 아이디 체크
   if (userID<5){
	  alert("길이가 더 길어야합니다.");
	  form.userID.focus();	  
      return false;
   }
   function check(regExp, e, msg) {
      if (regExp.test(e.value)) {
         return true;
      }
      alert(msg);
      e.select();
      e.focus();
      return false;
   }
   
   document.signup.submit();
}