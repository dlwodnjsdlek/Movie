<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<title>MYPAGE</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script>
function listGenreNames() {
	$.ajax({
    	url: 'getGenreNames',
    	method:'post',
    	contentType: 'application/json',
    	data: JSON.stringify(${user.userNum}),
    	success: genreNames => {
    	    if(genreNames.length) {
    	        const genreArr = []
    	        $.each(genreNames, (i, genreName) => {
    	            genreArr.push(
                			`<div class='row' style='padding-left: 15px; margin-left: 5px;'>
    	                		<div id='cw'>
                            		<label for='genre'>\${genreName}</label>
                        		</div>
                    		</div>`)
    	        })
    	        $('#genres').append(genreArr.join(''))
    	    } else $('#genres').append(
    	        '<div class="row" style="margin: 0 auto; margin-bottom: 50px;">관심장르가 없습니다.</div>')
    	}
    })
}

function init() {
	listGenreNames()
	
	$('#delUserBtn').click(() => {
		$('#modalMsg').text('탈퇴 하시겠습니까?')
        $('#delUserNoBtn').show()
        $('#delUserYesBtn').show()
        $('#myPageModal').modal()
	})
	
	$('#delUserOkBtn').click(() => {
		$.ajax({
			url: 'addWithDrawal',
	      	method:'post',
	      	contentType: 'application/json',
	      	data: JSON.stringify({
	    	  	userNum: ${user.userNum}
	      	}),
	      	success: location.href='addWithDrawal'
	   	})
        $('#myPageModal').modal('hide')
    })
}
$(init)
</script>
<style>
    label {
        font-size: 13px;
    }

    #cw {
        width: 75px;
    }
</style>
<h5><br><b>&nbsp;&nbsp;&nbsp;&nbsp;| 프로필</b></h5>
<hr>
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
<div class="container-fulid">
    <div id='join' class='col'>
        <form>
            <div class='form-group'>
                <label for='userId'>아이디</label><br>
                <label for='userId'>${user.userId}</label>
            </div>
            <div class='form-group'>
                <label for='nickName'>닉네임</label><br>
                <label for='nickName'>${user.nickname}</label>
            </div>
            <div class='form-group'>
                <label for='phoneNum'>연락처</label><br>
                <label for='phoneNum'>${user.phoneNum}</label>
            </div>
            <div class='form-group'>
                <label for='email'>이메일</label><br>
                <label for='email'>${user.email}</label>
            </div>
            <div class='form-group'>
                <label for='genre'>관심장르</label><br>
                <div id='genres' class='row' style='padding-left: 15px'>
                </div>
            </div>
            <div>
                <button id='cancelBtn' type='button' class='btn btn-light' onclick='location.href="/"' style='width: 90px; margin-left: 45px; margin-right: 30px; margin-bottom: 30px;'>
                    <span class='h6'>뒤로가기</span>
                </button>
                <button id='fixUserBtn' type='button' class='btn btn-primary' onclick='location.href="checkFixUserPw"' style='width: 90px; margin-left: 30px; margin-bottom: 30px;'>
                    <span class='h6'>회원수정</span>
                </button>
                <button id='delUserBtn' type='button' class='btn btn-warning' style='width: 90px; margin-left: 45px; margin-right: 30px;'>
                    <span class='h6'>회원탈퇴</span>
                </button>
                <button id='logoutBtn' type='button' class='btn btn-secondary' onclick='location.href="logout"' style='width: 90px; margin-left: 30px;'>
                    <span class='h6'>로그아웃</span>
                </button>
            </div>
        </form>
    </div>
</div>
<div class='modal fade' tabindex='-1' id='myPageModal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'></div>
            <div class='modal-body'>
                <p id='modalMsg'></p>
            </div>
            <div class='modal-footer justify-content-center'>
                <div class='col' id='delUserNoBtn'>
                    <button type='button' class='btn btn-secondary btn-block' id='delUserCencelBtn' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='delUserYesBtn'>
                    <button type='button' class='btn btn-primary btn-block' id='delUserOkBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
</c:if>