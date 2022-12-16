<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>장르</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function checkLogin() {
	if(${empty userId}) {location.href="../user/login"}
	else if(${userId ne "admin"}) location.href="../../user/logout"
}
$(checkLogin)

function isVal(field) {
    let isGood = false
    let errMsg

    if(!field.val()) errMsg = '장르를 선택하세요.'
    else isGood = true

    if(!isGood) $('#errMsg').css('color', 'red').text(errMsg)
    else $('#errMsg').text('')

    return isGood
}

function listGenre() {
	$.ajax({
    	url: 'getGenre',
    	dataType: 'json',
    	success: genreNames => {
    	    if(genreNames.length) {
    	        const genreArr = []
    	        $.each(genreNames, (i, genreName) => {
    	            genreArr.push(
                			`<tr>
	    	                    <td>\${genreName.genreNum}</td>
	    	                    <td>\${genreName.genreName}</td> 
	    	                    <td>\${genreName.targetNumMovies}</td>
	    	                    <td>\${genreName.numRegInterest}</td>
    	                	</tr>`
    	            )
    	        })
    	        $('#genres').append(genreArr.join(''))
    	    } else $('#genres').append(
    	        '<tr><td colspan=4 class=text-center>등록된 장르가 없습니다.</td></tr>')
    	}
    })
}

function init() {
	listGenre()
	
	$('#selectAll').click(function() {
	    $(this).parents('#checkBoxGroup').find('input').prop('checked', $(this).is(':checked'))
	})
	
	$('input[name=genre]').click(function() {
    	let isChecked = true

	    $('input[name=genre]').each(function(){
	        isChecked = isChecked && $(this).is(':checked')
	    })
	
	    $('#selectAll').prop('checked', isChecked)
	})
	
	$('#addGenreBtn').click(() => {
		let valueArr = []
    	$('input[name=genre]:checked').each(function() {
    		let value = $(this).val()
    		valueArr.push(value)
    	})
	    if(isVal($('input[name=genre]:checked'))) {
	        $.ajax({
	        	url: 'addGenre',
	        	method: 'post',
	        	contentType: 'application/json',
	        	data: JSON.stringify(valueArr),
	        	success: function(result) {
	        		if(result.length) {
	        			JSON.stringify(result),
		        		$('#errMsg').css('color', 'red').text(result + '는 이미 존재하는 장르입니다.'),
		        		$('input:checkbox').prop('checked', false)
	        		} else {
	        			$('#errMsg').css('color', 'blue').text('장르를 추가했습니다.'),
	        			$('input:checkbox').prop('checked', false)
	        			location.href='addGenre'
	        		}
	        	}
	    	})
		}
	})
}
$(init)
</script>
<style>
#cw {
	width:25%;
	text-align : left;
}

#logoutBtn{
	height: 1.5rem;
	font-size: 14px;		
}
</style>
<body>
	<div class='container'>
		<div class='header'>
            <div class='float-left mt-3'><h5>| 장르</h5></div>
            <div id='btn_group' class='float-right mt-3'>
                <span id='id'>${userId}님</span>&emsp;
				<button id='logoutBtn' type='button' class='btn btn-secondary' onclick='location.href="../user/logout"'>
	        		<span id='logoutSpan'>로그아웃</span>
	        	</button>
            </div><br>	  
		  <div class='row mt-5'>
			  <div class='col'>
				 <div class='container'>
					 <div class='row'>
						 <div class='col-12 text-center'>
							 <div class='btn-group btn-block'>
                                <button type='button' class='btn btn-secondary' onclick='location.href="../../admin"'>홈</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="../user" '>회 원</button>
								<button disabled type='button' class='btn btn-primary' onclick='location.href="#" '>장 르</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="../movie/listMovie" '>영 화</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="../cast" '>감독/배우</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="../inspection/inspection" '>신고 조회</button>
							 </div>
						 </div>
					 </div>
				 </div>
			  </div>
		 </div>
   </div><hr>

        <div class='row mt-5'>
            <div class='col' style='text-align: center'>
                <form>
                    <div class='row mb-3'>
                    	<div class='col-4' style='margin: 0 auto; width:350px;'>
                    		<div id='checkBoxGroup'>
	                    		<div class='row'>
			                        <div id='cw'>
			                            <input type='checkbox' name='genreAll' id='selectAll'/> <label for='genre'>전체 선택</label>
			                        </div>
			                    </div>
		                    	<div class='row'>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='액션'/> <label for='genre'>액션</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='범죄'/> <label for='genre'>범죄</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='SF'/> <label for='genre'>SF</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='스릴러'/> <label for='genre'>스릴러</label>
			                        </div>
		                    	</div>
			                    <div class='row'>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='공포'/> <label for='genre'>공포</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='전쟁'/> <label for='genre'>전쟁</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='미스터리'/> <label for='genre'>미스터리</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='판타지'/> <label for='genre'>판타지</label>
			                        </div>
			                    </div>
			                    <div class='row'>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='코미디'/> <label for='genre'>코미디</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='로맨스'/> <label for='genre'>로맨스</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='멜로'/> <label for='genre'>멜로</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='드라마'/> <label for='genre'>드라마</label>
			                        </div>
			                    </div>
			                    <div class='row'>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='뮤지컬'/> <label for='genre'>뮤지컬</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='음악'/> <label for='genre'>음악</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='스포츠'/> <label for='genre'>스포츠</label>
			                        </div>
			                        <div id='cw'>
			                            <input type='checkbox' name='genre' value='애니'/> <label for='genre'>애니</label>
			                        </div>
			                    </div>
			                </div>
	                        <div class='row' style='width: 200px; margin-left: 150px;'>
		                    	<button type='button' class='btn btn-success flex-fill border' id='addGenreBtn' style='width: 200px;'>
			                        	<span class='label d-md-inline'>추가</span>
			                    </button>
                   			</div>
                    	</div>
                    </div>
                    <p id='errMsg'></p>
                    <div class='col'>
                        <h5 style='color:#0f56ba'><b class='d-flex'>| 장르 목록</b></h5>
                    </div>
                    <div class='row'>
                        <div class='col'>
                            <table class='table table-bordered' id='BoardTable'>
                                <thead><tr><th>NO</th><th>장르명</th><th>대상 영화 수</th><th>관심 등록 수</th></tr></thead>
                                <tbody id='genres'>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>