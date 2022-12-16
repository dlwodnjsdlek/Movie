<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>비밀번호 찾기</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script> 
function textClear(field){
    return field.children().val('')
}
 
$(function(){
    $(document).on("keydown", "#onlyNumber", function(e){
        if(/[a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g.test(this.value)){ //한글 막기
            e.preventDefault();
            this.value = "";
        }else if (e.which != 8 && e.which != 0 //영문 e막기
            && e.which < 48 || e.which > 57    //숫자키만 받기
            && e.which < 96 || e.which > 105){ //숫자키패드 받기
            e.preventDefault();
            this.value = "";
        }else if (this.value.length >= this.maxLength){ //1자리 이상 입력되면 다음 input으로 이동시키기
            this.value = this.value.slice(0, this.maxLength);
            if($(this).next("input").length > 0){
                $(this).next().focus();
            }else{
                $(this).blur();
            }
        }
    });   
});
     
function init(){
	const code = ${code}
    $('#yesBtn').on('click', ()=>{ 
        if(!(code.toString().substr(0,1) == $("input[name='codeBox1']").val() &&
        	code.toString().substr(1,1) == $("input[name='codeBox2']").val() &&
        	code.toString().substr(2,1) == $("input[name='codeBox3']").val() &&
        	code.toString().substr(3,1) == $("input[name='codeBox4']").val())) {
				$('#errMsg').text('다시 입력하세요').css({'color': 'red'})               
            	$('#codeBoxRow').children().css({'border-color': 'red'})
            	textClear($('#codeBoxRow'))
        		textClear($('#inputEmail'))    
        } else $('#yesBtn').attr('type', 'submit')
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


#onlyNumber{
    width: 5rem;
    height: 5rem;
    margin: auto;
    background-color: gainsboro;
    border: 0.1rem solid;
    font-size:40pt;
    font-weight: bold;
    text-align: center;
    
}

.btn {
    text-align: center;
}

#yesBtn, #noBtn{
    margin: auto;
}

#errMsg{
    font-size: 1.5rem;
    font-weight: bolder;
    color: gray;
}
</style>
<body>
<div class='container'>
    <div class='row'>
        <div class='col'>
            <header class='p-2'>
                <h1 class='text-center'>비밀번호 찾기</h1>
                <hr class='col-7 color-black'>
            </header>
        </div>
    </div>
    <div class='row'>
        <div class='col'>
            <h4>${email}으로 메일을 보냈습니다!
            </h4>
        </div>
    </div>
    <div class='row' id='codeBoxRow'>
        <input type='tel' id='onlyNumber' maxlength='1' min='0' max='9' name='codeBox1'>
        <input type='tel' id='onlyNumber' maxlength='1' min='0' max='9' name='codeBox2'>
        <input type='tel' id='onlyNumber' maxlength='1' min='0' max='9' name='codeBox3'>
        <input type='tel' id='onlyNumber' maxlength='1' min='0' max='9' name='codeBox4'>
    </div>
    <div class='row col mb-4' id='msg'>
        <p id='errMsg'>코드 번호를 입력하세요.</p>
    </div>
    <form action='fixPw' method='post'>
    	<div class='row'>
        	<div class='col d-flex'>
        		<input type='hidden' name='userId' value='${userId}'>
            	<input type='hidden' name='email' value='${email}'>
                <input id='noBtn' type="button" class='btn btn-block btn-secondary mr-3' value='취소'
                    style='max-width: 7rem;'>
                <input id='yesBtn' type="button" class='btn btn-block btn-primary' value='확인'
                    style='max-width: 7rem;'>
            </div>
        </div>
    </form>
</div>
</body>