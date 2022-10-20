<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex d-flex align-items-center justify-content-center">
	<div class="sign-in-box">
		<div class="form-group input-group">
    		<div class="input-group-prepend">
        		<span class="input-group-text">아이디</span>
    		</div>
    		<input type="text" class="form-control" id="logInId">
		</div>
		<div class="form-group input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">비밀번호</span>
			</div>
			<input type="password" class="form-control" id="password">
		</div>
		<diV class="d-flex justify-content-center align-items-center">
    		<button type="button" class="btn btn-primary w-50 mr-3">로그인</button>
			<button type="button" class="btn btn-dark w-50" onclick="location.href='/memo/sign_up_view'">회원가입</button>
		</diV>
	</div>
</div>
