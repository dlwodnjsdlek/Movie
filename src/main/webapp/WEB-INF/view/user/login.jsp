<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html lang="ko">
<head>
<title>login</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function isVal(field) {
	let isGood = false
	let errMsg

	$('#errMsg').empty()

	if(!field.val()) errMsg = '아이디 또는 비밀번호를 입력하세요.'
	else isGood = true

	if(!isGood) $('#errMsg').text(errMsg)

	return isGood
}

function login() {
	$('#loginBtn').click(() => {
		if(isVal($('#userId')) && isVal($('#pw'))) {
			$.ajax({
				url: 'login',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		    	  	userId: $('#userId').val(),
		    	  	pw: $('#pw').val()
		      	}),
		      	success: function(user) {
		      		if(!user) {
					   	$('#errMsg').text('아이디 또는 비밀번호가 틀렸습니다.')
					   	$('input').val('')
					   	$('#userId').focus()
				   	} else {
				   		if(user.userNum == -1) {
				   			$('#errMsg').text('탈퇴한 회원입니다.')
					   		$('input').val('')
					   		$('#userId').focus()
				   		} else {
				   			if($('#userId').val() == 'admin') {
				   				location.href='/admin'
				   			} else {
				   				location.href='/'
				   			}
				   		}
				   	}
		      	}
		   	})
		}	
	})
	
	$('#joinBtn').click(() => {
		location.href="addUser"
	})
}
$(login)
</script>
<style>
.fa-compass, .fa-user, .fa-house, .fa-comments {
	color:rgb(221, 221, 221);
	font-size:28px;
}

.iconfont {
	font-size:12px;
}

nav {
	background-color: rgb(19, 19, 29);
}

nav a {
	text-decoration: none;
	color: lightgray;
}
</style>
</head>
<body>
	<header class='container-fulid'>
		<div class='row m-1 p-1 justify-content-between align-items-center'>
			<h5 class='col mt-2 mb-0'>
				 로그인
			</h5>
		</div>
	</header><hr>
		<div class='col body' style='text-align: center'>
			<form class='m-4'>
				<div class='form-group'>
					<label for='userId' class='d-flex'>아이디 </label>
					<input id='userId' name='userId' type='text' class='form-control' placeholder='아이디를 입력하세요.'/>
				</div>
				<div class='form-group'>
					<label for='userPw' class='d-flex'>비밀번호 </label>
					<input id='pw' name='pw' type='password' class='form-control mb-2'  placeholder='••••' autoComplete="off"/>
				</div>
				<small id='errMsg' class='msg d-inline' style='color: red;'></small>
				<div class='d-flex justify-content-center mb-2'><a href='findId' id='findId'>아이디 찾기</a>&nbsp;/&nbsp;<a href='findPw' id='findPw'>비밀번호 찾기</a></div>
				<div class='form-group'>
					<button id='loginBtn' type='button' class='btn border btn-block bg-success'>
						<span class='h5'>로 그 인</span>
					</button>
					<button id='joinBtn' type='button' class='btn border btn-block mt-3 bg-primary'>
						<span class='h5'>회원가입</span>
					</button>
				</div>
			</form>
		</div>
</body>
</html>
