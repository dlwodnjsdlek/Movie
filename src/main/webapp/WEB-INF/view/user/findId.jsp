<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>아이디찾기</title>
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

	if(!field.val()) {
		errMsg = '이메일과 연락처를 입력하세요.'
	}
	else isGood = true

	if(!isGood) $('#errMsg').text(errMsg)

	return isGood
}

function mailOption() {
	$("#domainList").change(function(){
    	$('#domainTxt').val(($(this).val()))
    })
}

$(document).on("keyup", "#inputPhoneNum", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""))   
})

function init(){
    mailOption()
    
    $('#yesBtn').on('click', ()=>{
    	if(isVal($('#inputPhoneNum')) && isVal($('#inputEmail')) && isVal($('#domainTxt'))){
    		$.ajax({
	        	url: 'findId',
	        	method:'Post',
	        	contentType: 'application/json',
	        	data: JSON.stringify({
	        		email: $('#inputEmail').val() + '@' + $('#domainTxt').val(),
	        		phoneNum: $('#inputPhoneNum').val()
	        		})
	        }).done(data =>{
	        	if(!data){
	        		$('#errMsg').text('입력하신 정보와 일치하는 계정이 없습니다.')
	        	} else {
	           		location.href="findIdResult/" + data;
	        	}
	        })
    	}
    })

    $('#noBtn').on('click', ()=>{
        return location.href='login'
    })
}

$(init)
</script>
<style>
body{
    display: flex;
    justify-content: center;
    align-items: center;
}

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

#yesBtn, #noBtn{
    margin: auto;
}

.err{
    border: 0.1rem solid;
    border-color: red;
}
</style>
<body>
<div class='container'>
    <div class='row'>
        <div class='col'>
            <header class='p-2'>
                <h1 class='text-center'>아이디 찾기</h1>
                <hr class='col-7 color-black'>
            </header>
        </div>
    </div>
    <form>
        <div class='row d-flex'>
            <div class='col' id='inputBox'>
                <div class='d-flex align-items-center'>
                    <input id='inputEmail' name='check' type='text' class='form-control' placeholder='이메일 ID' required/>
                        &nbsp;@&nbsp;
                    <input id='domainTxt' name='check' type='text' class='form-control'/>
                        &nbsp;
                    <select  id='domainList' class='form-control'>
                        <option value=''>직접 입력</option>
                        <option value='naver.com'>naver.com</option>
                        <option value='gmail.com'>gmail.com</option>
                        <option value='daum.net'>daum.net</option>
                        <option value='nate.com'>nate.com</option>
                        <option value='kakao.com'>kakao.com</option>
                    </select>
                </div>
                <input id='inputPhoneNum' name='check' type='tel' class='form-control mt-4' placeholder='연락처를 입력하세요.'
                    maxlength='13' onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                <p id='errMsg' class='mt-1' style='font-size: 8px; color: red; height: 8px;'></p>
            </div>
        </div>
        <div class='row'>
            <div class='col d-flex'>
                <input id='noBtn' type='button' class='btn btn-block btn-secondary mr-3' value='취소'
                    style='max-width: 7rem;'>
                <input id='yesBtn' type='button' class='btn btn-block btn-primary' value='확인'
                    style='max-width: 7rem;'>
            </div>
        </div>
    </form>
</div>
</body>