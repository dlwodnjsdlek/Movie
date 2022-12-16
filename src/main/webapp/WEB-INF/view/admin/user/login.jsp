<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>로그인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
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
		if(isVal($('#adminId')) && isVal($('#pw'))) {
			$.ajax({
				url: 'login',
		      	method:'post',
		      	contentType: 'application/json',
		      	data: JSON.stringify({
		    	  	userId: $('#adminId').val(),
		    	  	pw: $('#pw').val()
		      	}),
		      	success: function(data) {
		      		if($('#adminId').val() != 'admin') {
			   			$('#errMsg').text('잘못된 접근입니다.')
					   	$('input').val('')
					   	$('#adminId').focus()
		   			} else if(!data) { 
						$('#errMsg').text('아이디 또는 비밀번호가 틀렸습니다.')
						$('input').val('')
						$('#adminId').focus()
		   			} else {
		   				location.href='/admin'
		   			}
			   	}
	      	})
	   	}
	})	
}

$(login)
</script>
<style>
body{
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-group{
    max-width:30rem;
    margin: auto;
}
</style>
<body>
    <div class='container'>
		<div class='col'>
			<form class='m-4'>
				<div class='form-group'>
				<label for='adminId'>아이디 </label>
				<input id='adminId'  name='adminId' type='text' class='form-control' placeholder='아이디를 입력하세요.'/>
				</div>
				<div class='form-group mt-3'>
					<label for='pw'>비밀번호 </label>
					<input id='pw' name='pw' type='password' class='form-control mb-2'  placeholder='••••' autoComplete='off'/>
					<small id='errMsg' class='msg d-inline' style='color: red;'></small>
				</div>
				<div class='form-group mt-4'>
					<button id='loginBtn' type='button' class='btn border btn-block bg-success'>
						<span class='h5'>로 그 인</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
