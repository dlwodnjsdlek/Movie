<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>아이디 찾기</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script>
$(() => {
	$('#yesBtn').on('click', ()=>{
	    return location.href='../login'
	})
})
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

#userId{
    color: rgb(114, 114, 114);
    text-align: center;
    border-width: 0.1rem;
    border-radius: 0.5rem;
}

.btn {
    text-align: center;
    margin:auto;
}

#font {
    font-size: 15px;
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
        <div class='row'>
            <div class='col'>
                <span id='font'><b>입력하신 내용과 일치하는 아이디를 찾았습니다.</b></span>
                <h3 id='userId' class='border mt-1'>
               		<%=request.getAttribute("userId") %>
            	</h3>
            </div>
        </div>
        <form>
			<div class='row'>
				<div class='col mt-3'>
					<input id='yesBtn' type="button" class='btn btn-block btn-primary'
						value='확인' style='width: 50%;'>
				</div>
			</div>
		</form>
	</div>
</body>