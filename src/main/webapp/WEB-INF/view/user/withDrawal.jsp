<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<title>회원탈퇴</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<style>
	hr {
        background:gray;
        height: 1px;
        border: 0;
    }
</style>
<div class='container'>
    <div class='row' style='margin-top: 100px'>
        <div class='col'>
            <h1 class='text-center'>회원탈퇴</h1>
            <hr class='col-8'>
        </div>
    </div>
    <div class='row' style='margin-top: 100px'>
        <div class='col'>
            <span class='h4' style='margin-left: 30px;'>탈퇴가 완료되었습니다.</span>
        </div>
    </div>
    <div class='row' style='margin-top: 150px; margin-left: 100px;'>
        <div class='col'>
            <button id='okBtn' type='button' class='btn btn-primary' onclick='location.href="/"' style='width: 100px; '>
                <span class='h6'>확인</span>
            </button>
        </div>
    </div>
</div>