<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="w-50">
		<h1>글 상세 및 수정</h1>
		<div>
		<input type="text" class="form-control" id="subject" placeholder="제목을 입력해주세요" value="${post.subject}">
			<textarea class="form-control" rows="15" cols="100" placeholder="내용을 입력해주세요" id="content">${post.content}</textarea>
		</div>
		
		<%-- 이미지가 있을 때만 이미지 영역 추가 --%>
		<c:if test="${not empty post.imagePath}">
			<div class="mt-3">
				<img src="${post.imagePath}" alt="업로드 이미지" width="300">			
			</div>
		</c:if>
		<div class="d-flex justify-content-end my-3">
			<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
		</div>
		
		<div class="d-flex justify-content-between" my-3>
			<button type="button" class="btn btn-success" id="postListBtn">삭제</button>
			<div class="d-flex justify-content-end">
				<a href="/post/post_list_view" class="btn btn-secondary" id="postListBtn">목록으로</a>
				<button type="button" class="btn btn-warning" id="postUpdateBtn">수정</button>
			</div>
		</div>
	</div>
</diV>