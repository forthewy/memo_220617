<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center sign-in-box">
	<div>
	<h1 class="pt-5">로그인</h1>
	<form method="post" id="loginForm" action="/user/sign_in">
		<div class=" form-group input-group">
    		<div class="input-group-prepend">
        		<span class="input-group-text">아이디</span>
    		</div>
    		<input type="text" class="form-control" name="loginId">
		</div>
		<div class="form-group input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">비밀번호</span>
			</div>
			<input type="password" class="form-control" name="password">
		</div>
		<diV class="d-flex justify-content-center align-items-center">
    		<button type="submit" class="btn btn-primary w-50 mr-3">로그인</button> <%-- 키보드 enter로 로그인이 가능하도록 submit --%>
			<button type="button" class="btn btn-dark w-50" onclick="location.href='/memo/sign_up_view'">회원가입</button>
		</diV>
	</form>
	</div>
</div>


<script>
$(document).ready(function() {
	$('#loginForm').on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('input[name=password]').val();
		
		if (loginId == '') {
			alert("아이디를 입력하세요");
			return false;
		}
		
		if (password == '') {
			alert('비밀번호를 입력하세요');
			return false;
		}
			
		// ajax
		let url = $(this).attr('action');
		let params = $(this).serialize(); // loginId=aaa&password=sdf...
		
		$.post(url,params)
		.done(function(data) {
			if (data.code == 100) { // 성공
				location.href = "/post/post_list_view";
			} else {
				alert(data.errorMessage);
			}
		});
			
	});
})

</script>