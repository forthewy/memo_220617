<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <div>
            <header class="bg-secondary pt-3 pl-4" style="height: 100px;">
                <h1><b>메모 게시판</b></h1>
            </header>
            <section style="height: 500px;" class="d-flex d-flex align-items-center justify-content-center">
                    <div>
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
            </section>
            <footer class="bg-secondary text-center" style="height: 100px">
                <h3 class="pt-4">Copyright forthewy</h3>
            </footer>
        </div>
    </body>
</html>
