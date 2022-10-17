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
            <section class="d-flex justify-content-center">
                <div style="height: 500px;">
                    <table class="table table-bordered col-7 mt-5">
                        <tr>
                            <th class="table-secondary">* 아이디</th>
                            <td>
                                <div class="d-flex">
                                    <input type="text" class="form-control col-7">
                                    <button class="btn btn-success ml-3">중복 확인</button>
                                </div>
                                <div class="text-danger d-none">
                                    사용불가한 아이디입니다
                                </div>
                                <div class="text-success d-none">
                                    사용가능한 아이디입니다
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="table-secondary">* 비밀번호</th>
                            <td>
                                <input type="password" class="form-control col-7">
                            </td>
                        </tr>
                        <tr>
                            <th class="table-secondary">* 비밀번호확인</th>
                            <td>
                                <input type="password" class="form-control col-7">
                            </td>
                        </tr>
                        <tr>
                            <th class="table-secondary">* 이름</th>
                            <td>
                                <input type="text" class="form-control col-7" placeholder="이름을 입력하세요">
                            </td>
                        </tr>
                        <tr>
                            <th class="table-secondary">* 이메일 주소</th>
                            <td>
                                <input type="text" class="form-control col-9"  placeholder="이메일을 입력하세요">
                            </td>
                        </tr>
                    </table>
                    <div class="d-flex justify-content-center mt-5">
                        <button type="button" class="btn btn-primary">회원 가입</button>
                    </div>
                </div>
            </section>
            <footer class="bg-secondary text-center" style="height: 100px">
                <h3 class="pt-4">Copyright forthewy</h3>
            </footer>
        </div>
    </body>
</html>
