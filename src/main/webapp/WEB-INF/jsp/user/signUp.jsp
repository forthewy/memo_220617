<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1>회원 가입</h1>
		<form id="signUpForm" method="post" action="/user/sign_up">
		<table class="table table-bordered col-7 mt-4">
			<tr>
				<th class="table-secondary">* 아이디</th>
                <td>
                   <div class="d-flex">
                      <input type="text" class="form-control col-7" name="loginId" id="loginId">
                      <button type="button" class="btn btn-success ml-3" id="duplicateCheckBtn">중복 확인</button>
                   </div>
                   <div id="idCheckDuplicated" class="text-danger d-none">
                      사용불가한 아이디입니다
                   </div>
                   <div id="idCheckOk" class="text-success d-none">
                      사용가능한 아이디입니다
                   </div>
                   <div id="idCheckLength" class="text-danger d-none">
                      ID는 4글자 이상입력하셔야 합니다
                   </div>
                </td>
             </tr>
             <tr>
                <th class="table-secondary">* 비밀번호</th>
                   <td>
						<input type="password" id="password" name="password" class="form-control col-7">
                   </td>
             </tr>
             <tr>
                <th class="table-secondary">* 비밀번호 확인</th>
                <td>
                   <input type="password" id="passwordConfirm" class="form-control col-7">
                </td>
             </tr>
             <tr>
               <th class="table-secondary">* 이름</th>
               <td>
                  <input type="text" name="name" id="name" class="form-control col-7" placeholder="이름을 입력하세요">
               </td>
             </tr>
             <tr>
               <th class="table-secondary">* 이메일 주소</th>
               <td>
                  <input type="text" name="email" id="email" class="form-control col-9"  placeholder="이메일을 입력하세요">
               </td>
             </tr>
         </table>
         <div class="d-flex justify-content-center mt-2">
             <button type="submit" class="btn btn-primary">회원 가입</button>
         </div>
         </form>
	</div>
</div>



<script>
$(document).ready(function() {
	$('#loginId').keyup(function() {
		$('#idCheckDuplicated').addClass('d-none');
		$('#idCheckOk').addClass('d-none');
		$('#idCheckLength').addClass('d-none');
	}); // ID를 이후에 변경하면 중복체크를 다시해야한다.
	
	$('#duplicateCheckBtn').on('click', function(e) {
		e.preventDefault();
		let loginId = $('#loginId').val().trim();
		
		if (loginId.length < 4) {
			// 4자 이하일때 경고문구 노출하고 끝낸다.
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		
		$.ajax({
			url:"/user/is_duplicated_id"
			,data:{"loginId":loginId}
			,success:function(data) {
				if (data.result) {
					// 중복일때
					$('#idCheckDuplicated').removeClass('d-none'); // 경고 문구 노출
					$('#idCheckOk').addClass('d-none'); 
					$('#idCheckLength').addClass('d-none');
				} else {
					// 중복 아닐때
					$('#idCheckDuplicated').addClass('d-none');
					$('#idCheckOk').removeClass('d-none'); // 사용 가능 문구
					$('#idCheckLength').addClass('d-none');
				}
			}
			,error:function(e) {
				alert("아이디 중복 확인에 실패했습니다. 관리자에게 문의해주세요");
			}
		});
	}); 
	
	// 회원가입
	$('#signUpForm').on('submit', function(e) {
		e.preventDefault(); // 서브밋 기능을 중단
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		let passwordConfirm = $('#passwordConfirm').val();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		
		if (loginId == "") {
			alert ("아이디를 입력해주세요");
			return false;
		}
		if (password == "") {
			alert ("비밀번호를 입력해주세요");
			return false;
		}
		if (password != passwordConfirm) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if (name.length < 1) {
			alert("이름을 입력해주세요");
			return false;
		}
		if (email.length < 1) {
			alert("이메일을 입력해주세요");
			return false;
		}
		
		// 아이디 중복확인이 완료 되었는지 확인 -> idCheckOk d-none 이 없을때
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("id 중복 확인을 다시해주세요");
			return false;
		}
		
		
		// 1) submit 
		//$(this)[0].submit(); // 서브밋 이후에 다른 화면으로 넘길때 사용 (action 주소 -> 뷰화면)
		
		// 2) ajax
		let url = $(this).attr('action');
		let params = $(this).serialize(); // name 속성에 있는 값들을 파라미터로 구성
		//console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) {
				alert("가입을 환영합니다!! 로그인 해주세요");
				location.href = "/user/sign_in_view";
			} else {
				alert("가입에 실패했습니다");
			}
		});
	});
});

</script>