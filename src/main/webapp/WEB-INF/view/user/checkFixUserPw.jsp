<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<title>회원수정</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script>
function isVal(field) {
	let isGood = false
	let errMsg

	$('#errMsg').empty()

	if(!field.val()) errMsg = '비밀번호를 입력하세요.'
	else isGood = true

	if(!isGood) $('#errMsg').text(errMsg).css('color', 'red')

	return isGood
}

function checkFixUser() {
    $('#okBtn').click(() => {
    	if(isVal($('#pw'))) {
    		$.ajax({
				url: 'checkFixUserPw',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		      		userId: $('#userId').val(),
		    	  	pw: $('#pw').val()
		      	}),
		      	success: function(result) {
		      		if(!result) {
		      			$('#errMsg').css('color', 'red').text('비밀번호가 틀렸습니다.')
		      			$('#pw').blur(function() {
		   					$('#errMsg').text('')
		   				})
		      		} else {
		      			location.href='fixUser'
		      		}
		      	}
		   	})
    	}
    })
}
$(checkFixUser)
</script>
<style>
hr {
    background:gray;
    height: 1px;
    border: 0;
}
</style>
<c:if test='${empty userId}'>
<div class='row' style='margin-top: 100px; text-align: center;'>
        <div class='col'>
            <span class='h4'>로그인을 하세요.</span>
        </div>
    </div>
    <div class='row' style='margin-top: 150px; margin-left: 100px;'>
        <div class='col'>
            <button id='okBtn' type='button' class='btn btn-primary' onclick='location.href="login"' style='margin-left: 30px;'>
                <span class='h6'>로그인</span>
            </button>
        </div>
    </div>
</c:if>
<c:if test='${not empty userId}'>
<div class='container'>
    <div class='row' style='margin-top: 100px'>
        <div class='col'>
            <h1 class='text-center'>회원수정</h1>
            <hr class='col-8'>
        </div>
    </div>
    <div class='row' style='margin-top: 100px'>
        <div class='col'>
        	<input id='userId' type='hidden' class='form-control' value='${user.userId}' />
            <input id='pw' type='password' class='form-control' placeholder='비밀번호를 입력하세요.' required/>
        </div>
    </div>
    <p id='errMsg' style='text-align: center'></p>
    <div class='row' style='margin-top: 150px'>
        <div class='col'>
            <button id='cancelBtn' type='button' class='btn btn-secondary' onclick='location.href="mypage"' style='width: 90px; margin-left: 45px; margin-right: 30px;'>
                <span class='h6'>취소</span>
            </button>
            <button id='okBtn' type='button' class='btn btn-primary' style='width: 90px; margin-left: 30px;'>
                <span class='h6'>확인</span>
            </button>
        </div>
    </div>
</div>
</c:if>