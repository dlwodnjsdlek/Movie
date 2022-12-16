<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<title>회원수정</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script>
$(document).on("keyup", "input[phoneNum]", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""))   
})

function checkedCheckbox() {
	let list = "${genre}"
	list = list.split('[').join('').split(']').join('').split(' ').join('').split(',')
	
	$('input[name="genre"]').each(function() {
		for(let j = 0; j < list.length; j++) {
			if(this.value == list[j]) {
				this.checked = true
			}
		}
	})
}

function isVal(field) {
	let isGood = false
	
	if(!field.val() && !$('#pw').val()) {
		$('#pwErrMsg').css('color', 'red').text('비밀번호를 입력하세요.')
	} else isGood = true
	
	if(!field.val() && !$('#nickname').val()) {
		$('#nnErrMsg').css('color', 'red').text('닉네임을 입력하세요.')
	} else isGood = true
	
	if(!field.val() && !$('#phoneNum').val()) {
		$('#pnErrMsg').css('color', 'red').text('연락처를 입력하세요.')
	} else isGood = true
	
	if(!field.val() && !$('#email').val()) {
		$('#emailErrMsg').css('color', 'red').text('이메일을 입력하세요.')
	} else isGood = true
	
	return isGood
}

function init() {
	checkedCheckbox()
	
	$('#pw').keyup(function() {
		let pw = /^[a-zA-Z0-9]{2,10}$/;
		if(!(pw.test($('#pw').val()))) {
			$('#pwErrMsg').css('color', 'red').text('영문, 숫자 2자 이상 10자 이하로 입력하세요.')
			$('input[type=password]').blur(function() {
				$('#pwErrMsg').text('')
			})
		} else {
			$('#pwErrMsg').text('')
		}
	})
	
	$('#checkPw').keyup(function() {
		let pw = /^[a-zA-Z0-9]{2,10}$/;
		if(!(pw.test($('#checkPw').val()))) {
			$('#pwErrMsg').css('color', 'red').text('영문, 숫자 2자 이상 10자 이하로 입력하세요.')
			$('input[type=password]').blur(function() {
				$('#pwErrMsg').text('')
			})
		} else {
			if($('#pw').val() != $('#checkPw').val()) {
				$('#pwErrMsg').css('color', 'red').text('비밀번호가 일치하지 않습니다.')
			} else {
				$('#pwErrMsg').css('color', 'blue').text('사용 가능한 비밀번호 입니다.')
				$('input[type=password]').blur(function() {
					$('#pwErrMsg').text('')
				})
			}
		}
	})
	
	$('#nickname').keyup(function() {
		let nickname = /^[가-힣a-zA-Z0-9]{4,8}$/;
		if(!(nickname.test($('#nickname').val()))) {
			$('#nnErrMsg').css('color', 'red').text('특수문자 제외 4자 이상 8자 이하로 입력하세요.')
		} else {
			$.ajax({
				url: 'checkFixUserNickname',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		      		userId: $('#userId').val(),
		    	  	nickname: $('#nickname').val()
		      	}),
		      	success: function(result) {
		      		if(result == 1) {
		      			$('#nnErrMsg').css('color', 'red').text('이미 존재하는 닉네임 입니다.')
			   			$('#nickname').focus()
		      		} else {
		      			$('#nnErrMsg').css('color', 'blue').text('사용 가능한 닉네임 입니다.')
		      			$('#nickname').blur(function() {
		   					$('#nnErrMsg').text('')
		   				})
		      		}
		      	}
		   	})
		}
	})
	
	$('#phoneNum').keyup(function() {
		let phoneNum = /^(010|011)-([0-9]{4})-([0-9]{4})$/;
		if(!(phoneNum.test($('#phoneNum').val()))) {
			$('#pnErrMsg').css('color', 'red').text('010 또는 011로 시작하는 연락처를 입력하세요.')
		} else {
			$.ajax({
				url: 'checkFixUserPhoneNum',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		      		userId: $('#userId').val(),
		    	  	phoneNum: $('#phoneNum').val()
		      	}),
		      	success: function(result) {
		      		if(result == 1) {
		      			$('#pnErrMsg').css('color', 'red').text('이미 존재하는 연락처 입니다.')
			   			$('#phoneNum').focus()
		      		} else {
		      			$('#pnErrMsg').css('color', 'blue').text('사용 가능한 연락처 입니다.')
		      			$('#phoneNum').blur(function() {
		   					$('#pnErrMsg').text('')
		   				})
		      		}
		      	}
		   	})
		}
	})
	
	$('#email').keyup(function() {
		let email = /^([0-9a-zA-Z]{2,20})+\@[a-z]+\.[a-z]{2,3}$/;
		if(!(email.test($('#email').val()))) {
			$('#emailErrMsg').css('color', 'red').text('2자 이상 20자이하로 이메일 형식으로 입력하세요.')
		} else {
			$.ajax({
				url: 'checkFixUserEmail',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		      		userId: $('#userId').val(),
		    	  	email: $('#email').val()
		      	}),
		      	success: function(result) {
		      		if(result == 1) {
		      			$('#emailErrMsg').css('color', 'red').text('이미 존재하는 이메일 입니다.')
			   			$('#email').focus()
		      		} else {
		      			$('#emailErrMsg').css('color', 'blue').text('사용 가능한 이메일 입니다.')
		      			$('#email').blur(function() {
		   					$('#emailErrMsg').text('')
		   				})
		      		}
		      	}
		   	})
		}
	})
	
    $('#fixUserBtn').click(() => {
    	if(isVal($('#pw')) && isVal($('#nickname')) &&
    		isVal($('#phoneNum')) && isVal($('#email'))) {
    		let valueArr = []
        	$('input[name=genre]:checked').each(function() {
        		let value = $(this).val()
        		valueArr.push(value)
        	})
    		$.ajax({
     			url: 'fixUser',
     		    method:'put',
     		    contentType: 'application/json',
     		    data: JSON.stringify({
     		    	user: {
     		    		userNum: $('#userNum').val(),
     		    		userId: $('#userId').val(),
    		 		    pw: $('#pw').val(),
    		 		    nickname: $('#nickname').val(),
    		 		    phoneNum: $('#phoneNum').val(),
    		 		    email: $('#email').val()
     		    	},
     		    	genreNum: valueArr
     		    }),
     		    success: result => {
     		    	if(result == 1) {
     		    		location.href='mypage' 
     		    	}
     		    }
            })
    	}
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

#userId {
	height: 30px;
    width: 330px;
    font-size: 15px;
}

#pw, #checkPw, #nickName, #phoneNum, #email {
    height: 30px;
    width: 330px;
    font-size: 11px;
}
</style>
<h5><br><b>&nbsp;&nbsp;&nbsp;&nbsp;| 회원수정</b></h5>
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
<div class='container-fulid'>
    <div id='fixUser' class='col'>
        <form id='fixUser'>
            <div class='form-group'>
            	<input id='userNum' type='hidden' value='${user.userNum}'/>
                <label for='userId'>아이디</label><br>
                <input disabled id='userId' type='text' class='form-control' value='${user.userId}'/>
            </div>
            <div class='form-group' style='margin-top: -15px'>
                <label for='pw'>비밀번호
                	<small id='pwErrMsg' class='form-text m-3 d-inline msg'></small>
                </label>
                <input id='pw' type='password' class='form-control' value='${user.pw}' placeholder='영문, 숫자 최소 2자'/>
                <input id='checkPw' type='password' class='form-control' value='${user.pw}' placeholder='비밀번호 확인'/>
            </div>
            <div class='form-group' style='margin-top: -5px'>
                <label for='nickname'>닉네임
                    <small id='nnErrMsg' class='form-text m-3 d-inline msg'></small>
                </label>
                <input id='nickname' type='text' class='form-control' value='${user.nickname}' placeholder='한글, 영문, 숫자 최소 4자'/>
            </div>
            <div class='form-group' style='margin-top: -5px'>
                <label for='phoneNum'>연락처
                    <small id='pnErrMsg' class='form-text m-3 d-inline msg'></small>
                </label>
                <input id='phoneNum' type='text' class='form-control' value='${user.phoneNum}' placeholder='연락처를 입력하세요.' maxlength='13' phoneNum/>
            </div>
            <div class='form-group' style='margin-top: -5px'>
                <label for='email'>이메일
                    <small id='emailErrMsg' class='form-text m-3 d-inline msg'></small>
                </label>
                <div class='row' style='padding-left: 15px'>
                    <input id='email' name='email' type='email' class='form-control' value='${user.email}' placeholder='EX) example@naver.com'/>
                </div>
            </div>
            <div class='form-group'>
                <label for='genre'>관심장르</label><br>
                <div class='row' style='padding-left: 15px'>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='1'/> <label for='genre'>액션</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='2'/> <label for='genre'>범죄</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='3'/> <label for='genre'>SF</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='4'/> <label for='genre'>스릴러</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='5'/> <label for='genre'>공포</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='6'/> <label for='genre'>전쟁</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='7'/> <label for='genre'>미스터리</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='8'/> <label for='genre'>판타지</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='9'/> <label for='genre'>코미디</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='10'/> <label for='genre'>로맨스</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='11'/> <label for='genre'>멜로</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='12'/> <label for='genre'>드라마</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='13'/> <label for='genre'>뮤지컬</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='14'/> <label for='genre'>음악</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='15'/> <label for='genre'>스포츠</label>
                        </div>
                        <div id='cw'>
                            <input type='checkbox' name='genre' value='16'/> <label for='genre'>애니</label>
                        </div>
                    </div>
                </div>
            </div>
            <div style='margin-top: -15px; margin-bottom: -10px;'>
                <button id='cancelBtn' type='button' class='btn btn-secondary' onclick='location.href="mypage"' 
                		style='width: 90px; margin-left: 45px; margin-right: 30px;'>
                    <span class='h6'>취소</span>
                </button>
                <button id='fixUserBtn' type='button' class='btn btn-primary' style='width: 90px; margin-left: 30px;'>
                    <span class='h6'>수정</span>
                </button>
            </div>
        </form>
    </div>
</div>
</c:if>