<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>비밀번호 재설정</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script>
function init(){
    $('#yesBtn').on('click', ()=>{
        $('#yesBtn').attr('data-target', '');
		
        if(!(2 <= ($('#pw').val().length) && ($('#pw').val().length <= 10 ))) {
            $('#errPw').text('2~10자의 영문,숫자로 입력하세요.')
        } else if(($('#checkPw').val()) != ($('#pw').val())){
            $('#errCheckPw').text('비밀번호가 일치하지 않습니다.')
        } else {
        	$.ajax({
            	url: 'fixPw',
            	method:'patch',
            	contentType: 'application/json',
            	data: JSON.stringify({
            		userId: $('#userId').val(),
            		email: $('#email').val(),
            		pw: $('#pw').val()
            	})
        	}).done($('#yesBtn').attr('data-target', '#modal'))
        }
    })

    $('#yesFixBtn').on('click', ()=>{
        return location.href='login'
    })

    $('#noBtn').on('click', ()=>{
        return location.href='login'
    })
}

$(init)

</script>
<style>
hr {
    background:gray;
    height:1px;
    border:0;
}

#inputBox{
    margin-left: 2rem;
    margin-right: 2rem;
}

.btn {
    text-align: center;
}

#yesBtn,#noBtn,#yesFixBtn{
    margin: auto;
}

#yesFixBtn{
    width: 50%;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
<body>
<div class='container'>
    <div class='row'>
        <div class='col'>
            <header class='p-2'>
                <h1 class='text-center'>비밀번호 재설정</h1>
                <hr class='col-7 color-black'>
            </header>
        </div>
    </div>
    <form>
        <div class='row d-flex'>
            <div class='col' id='inputBox'>
                <input id='pw' name='pw' type='password' class='form-control' placeholder='새 비밀번호'
                    maxlength='10'>
                <p id='errPw' style='font-size: 8px; color: red; height: 8px;'></p>
                <input id='checkPw' name='checkPw' type='password' class='form-control' placeholder='새 비밀번호 확인'
                    maxlength='10'>
                <p id='errCheckPw' style='font-size: 8px; color: red; height: 8px;'></p>
            </div>
        </div>
        <div class='row'>
            <div class='col d-flex'>
                <input id='noBtn' type="button" class='btn btn-block btn-secondary mr-3' value='취소'
                    style='max-width: 7rem;'>
                <input id='yesBtn' type="button" class='btn btn-block btn-primary' value='확인'
                    data-toggle='modal' data-target='#modal' style='max-width: 7rem;'
                    data-backdrop='static' data-keyboard='false'>
            </div>
        </div>
    </form>
         	<input type='hidden' id='userId' name='userId' value='${userId}'>
        	<input type='hidden' id='email' name='email' value='${email}'>
</div>
</body>
<div class='modal fade' tabindex='-1' id='modal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-body'>
                <p align='center'>비밀번호가 수정되었습니다. &nbsp;</p>
                <button id='yesFixBtn' type='button' class='btn btn-block btn-primary'>확인</button>
            </div>
        </div>
    </div>
</div>