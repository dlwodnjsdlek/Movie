<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>addMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function isVal(field) {
	let isGood
	
	if(!field.val() && !$('#movieName').val()) {
		$('#nameErrMsg').css('color', 'red').text('작품명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieReleasedate').val()) {
		$('#relErrMsg').css('color', 'red').text('개봉일은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(isGenreSelected() == false) {
		$('#genreErrMsg').css('color', 'red').text('장르는 필수 선택 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieCountry').val()) {
		$('#ctrErrMsg').css('color', 'red').text('국가명는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
/* 	if(!field.val() && !$('#directorName').val()) {
		$('#directErrMsg').css('color', 'red').text('감독명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#castName').val()) {
		$('#castErrMsg').css('color', 'red').text('출연진명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true */
	
	if(!field.val() && !$('#movieRunningtime').val()) {
		$('#timeErrMsg').css('color', 'red').text('상영시간은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieStory').val()) {
		$('#storyErrMsg').css('color', 'red').text('줄거리는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#cumulativeAudience').val()) {
		$('#cumeErrMsg').css('color', 'red').text('누적관객수는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	return isGood
}

function isGenreSelected() {
	var checkBoxList = document.getElementsByName('genreBox');
	
	for(var i = 0; i < checkBoxList.length; i++) {
		var checkBox = checkBoxList[i];
		
		if(checkBox.checked) {
			return true;
		}
	
	}
	
	return false;
}

function genreSelection(genreId) {
	if(document.querySelector('#genre_' + genreId).checked) {
		$('#genreErrMsg').css('color', 'red').text('');
	}
}

function init() {
	
	$('#movieName').keyup(function() {
		let movieName =/^[가-힣a-zA-Z0-9]{2,20}$/;
		if(!(movieName.test($('#movieName').val()))) {
			$('#nameErrMsg').css('color', 'red').text('작품명을 2자 이상 20자 이하로 입력하세요.')
		} else {
			$('#nameErrMsg').text('')
		}
	})
	
	//개봉일부분 미완성
/* 	$('#movieReleasedate').keyup(function() {
		let movieReleasedate = false;
		if(!(movieReleasedate.test($('#movieReleasedate').val()))) {
			$('#relErrMsg').css('color', 'red').text('개봉일을 입력하세요.')
		} else {
			$('#relErrMsg').text('')
		}
	}) */
	
	$('#movieCountry').keyup(function() {
		let movieCountry =/^[가-힣a-zA-Z0-9]{1,20}$/;
		if(!(movieCountry.test($('#movieCountry').val()))) {
			$('#ctrErrMsg').css('color', 'red').text('국가명을 1자 이상 20자 이하로 입력하세요.')
		} else {
			$('#ctrErrMsg').text('')
		}
	})
	
	$('#movieRunningtime').keyup(function() {
		let movieRunningtime =/^[0-9]{1,3}$/;
		if(!(movieRunningtime.test($('#movieRunningtime').val()))) {
			$('#timeErrMsg').css('color', 'red').text('상영시간을 1~999 범위 내에 입력하세요.')
		} else {
			$('#timeErrMsg').text('')
		}
	})
	
	$('#cumulativeAudience').keyup(function() {
		let cumulativeAudience =/^[0-9]{1,10}$/;
		if(!(cumulativeAudience.test($('#cumulativeAudience').val()))) {
			$('#cumeErrMsg').css('color', 'red').text('누적관객수를 0~10억 범위 내에 입력하세요.')
		} else {
			$('#cumeErrMsg').text('')
		}
	})
	
	//스토리 수정중
/* 	$('#movieStory').keyup(function() {
		let movieStory =/^[ㄱ-ㅎ가-힣a-zA-Z0-9/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{2,2000}$/;
		if(!(movieStory.test($('#movieStory').val()))) {
			$('#storyErrMsg').css('color', 'red').text('줄거리를 2자 이상 20자 이하로 입력하세요.')
		} else {
			$('#storyErrMsg').text('')
		}
	}) */
		
    $('#addMovieBtn').click(() => {
    	
    	if( (isVal($('#movieName')) && 
    			isVal($('#movieReleasedate')) && 
    			isVal($('#movieCountry')) && 
    			isVal($('#movieRunningtime')) && 
    			isVal($('#movieStory')) && 
    			isVal($('#cumulativeAudience'))) == false) {
    		return;
    	}
    	
    	var selectedGenres = getSelectedGenrs();
    	var selectedDirector = getSelectedDirector();
    	var selectedCastStr = getSelectedCast();
    	console.log(selectedCastStr);
    	
    	var formData = new FormData();
    	formData.append('movieName', $('#movieName').val());
    	formData.append('movieReleasedate', $('#movieReleasedate').val());
    	formData.append('movieCountry', $('#movieCountry').val());
    	formData.append('movieRunningtime', $('#movieRunningtime').val());
    	formData.append('movieStory', $('#movieStory').val());
    	formData.append('hashtag', $('#hashtag').val());
    	formData.append('cumulativeAudience', $('#cumulativeAudience').val());
    	formData.append('selectedGenres', selectedGenres);
    	formData.append('selectedDirector', selectedDirector);
    	formData.append('selectedCast', selectedCastStr);
    	formData.append('img', document.querySelector('#movieImgfileName').files[0]);
    	
    	$.ajax({
			url : '../mv/addMovie',
			method : 'post',
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				location.href = "addMovie";
			}
		});
    })
}

function getSelectedGenrs() {
	var selectedGenre = '';
	
	document.getElementsByName('genreBox').forEach(function(element) {
		if(element.checked) {
			var id = element.getAttribute('id').replace('genre_', '');
			selectedGenre += id + ",";
		}
	});
	
	return selectedGenre;
}

function getSelectedDirector() {
	return selectedDirector.getAttribute('id').replace('p_', '');
}

function getSelectedCast() {
	var selectedCastStr = '';
	
	for (var [key, value] of selectedCast) {
		if(value != null) {
			selectedCastStr += key + ',' + value[1] + '-';	
		}
	}
	
	console.log(selectedCastStr);
	
	return selectedCastStr;
}

$(init)

</script>
<style>

	td {
		height: 30px;
		width: 150px;
	}

	#movieStory {
		height: 250px;

	}

	#orButton{
		padding-top: 200px;
		margin-top: 200px;
	}
	
	span {
		font-size: 13px;
	}
	
	.genre-add-button {
		height : 24px;
		padding : 0px 5px; 
		margin-bottom : 4px;
		background-color : #28a745;
		color : #ffffff;
	}
	
	.circle {
		width: 60px;
		height: 60px;
		-webkit-border-radius: 30px;
		-moz-border-radius: 30px;
		border-radius: 50px;
		border : 2px solid gray;
	}
	
	.cast-name {
		font-size: 12px;
		text-align: center;
	}
	
	.table tr { 
		line-height: 0px; 
		font-size: 12px;
		font-weight: bold;
	}
	
	.table th { 
		padding:8px; 
		font-weight: normal;
	}
	
</style>
<div class='container-fluid'>
	<div class='header'>
		<div class='float-left mt-3'><h5>| 영화</h5></div>
		 <div id='btn_group' class='float-right mt-3'>
			  <label style='font-size:13'>관리자님</label>&emsp;
			  <span style='font-size:12'>(08:23)</span>&emsp;
			  <a href='#'><button style='font-size:13'>로그아웃</button></a>
		  </div><br>
	  <div class='row mt-5'>
		  <div class='col'>
			 <div class='container'>
				 <div class='row'>
					 <div class='col-12 text-center'>
						 <div class='btn-group btn-block'>
							<button type='button' class='btn btn-secondary' onclick='location.href="../../admin" '>홈</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="../user" '>회 원</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="../genre/addGenre" '>장 르</button>
							 <button disabled type='button' class='btn btn-primary' onclick='location.href="../movie/listMovie" '>영 화</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="../cast/cast" '>감독/배우</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="../inspection/inspection" '>신고 조회</button>
						 </div>
					 </div>
				 </div>
			 </div>
		  </div>
	 </div>
</div><hr>
	<div class='col p-5'>
		
			<div class='col'>
				<h5 style='color:#0f56ba'><b>| 영화 추가</b></h5>
				<hr>
			</div>
			<div class='form-group mt-1' >
				<label>작품명*</label><input type='text' id='movieName' name='movieName' class='text-area form-control' minlength='2' maxlength='20' placeholder='작품명을 2자 이상 20자 이하로 입력하세요.' required/>
				<span id='nameErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>개봉일*</label><input type='date' id='movieReleasedate' name='movieReleasedate' class='form-control' required/>
				<span id='relErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>장르*</label>
				<button type="button" onclick="createAddGenreDialog()"data-toggle="modal" data-target='#dialogModal' class='btn genre-add-button'>추가</button>
				<span id='genreErrMsg'></span>
				<div class='col'>
						<table>
							<tbody id="genreTableBody">
								<c:forEach var="i" begin="0" end="${fn:length(genres) }" step="4">
									<tr id="genre_line_${Integer.valueOf(i / 4)}">
										<c:if test="${not empty genres[i]}">
											<td><label><input id="genre_${genres[i].genreNum }" name="genreBox" onchange="genreSelection(${genres[i].genreNum })" type='checkbox'>${genres[i].genreName }</label></td>
										</c:if>
										<c:if test="${not empty genres[i + 1]}">
											<td><label><input id="genre_${genres[i + 1].genreNum }" name="genreBox" onchange="genreSelection(${genres[i + 1].genreNum })" type='checkbox'>${genres[i + 1].genreName }</label></td>
										</c:if>
										<c:if test="${not empty genres[i + 2]}">
											<td><label><input id="genre_${genres[i + 2].genreNum }" name="genreBox" onchange="genreSelection(${genres[i + 2].genreNum })" type='checkbox'>${genres[i + 2].genreName }</label></td>
										</c:if>
										<c:if test="${not empty genres[i + 3]}">
											<td><label><input id="genre_${genres[i + 3].genreNum }" name="genreBox" onchange="genreSelection(${genres[i + 3].genreNum})" type='checkbox'>${genres[i + 3].genreName }</label></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
                    </div>
                </div>

            <div class='form-group mt-1'>
				<label>국가*</label><input type='text' id='movieCountry' name='movieCountry' class='form-control' minlength='1' maxlength='20' placeholder='국가명을 입력하세요.' required/>
				<span id='ctrErrMsg'></span>
			</div>

			<div class='form-group mt-1'>
				<label>감독*</label>
				<button type="button" onclick="findDirector(true)"data-toggle="modal" data-target='#dialogModal' class='btn genre-add-button'>탐색</button>
				<button type="button" onclick="addDirector(true)"data-toggle="modal" data-target='#dialogModal' class='btn genre-add-button'>추가</button>
				<input type='text' id='directorName' name='directorName' class='form-control' placeholder='감독명을 입력하세요.' required readonly/>
				<span id='directErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>출연진*</label>
				<button type="button" onclick="findDirector(false)"data-toggle="modal" data-target='#dialogModal' class='btn genre-add-button'>탐색</button>
				<button type="button" onclick="addCast()"data-toggle="modal" data-target='#dialogModal' class='btn genre-add-button'>추가</button>
				<input type='text' id='castName' name='castName' class='form-control' placeholder='출연진명을 입력하세요.' required readonly/>
				<span id='castErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>태그</label><input type='text' id='hashtag' name='hashtag' class='form-control'/>
			</div>
			<div class='form-group mt-2'>
			<label>포스터</label>
			<input type="file" id="movieImgfileName" name='movieImgfileName' accept='image/png, image/jpeg, image/jpg'>
			</div>
			<div class='row form-group m-0 mt-1'>
				<label>상영시간(분)*</label><div><input type='number' id='movieRunningtime' name='movieRunningtime' min='1' max='999' class='form-control w-50 ml-5' required/></div>
			</div>
				<span id='timeErrMsg'></span>
			<div class='row form-group m-0 mt-3'>
				<label>누적관객수* &nbsp</label><div><input type='number' id='cumulativeAudience' name='cumulativeAudience' min='0' max='1000000000' class='form-control w-75 ml-5' required/></div>
			</div>
				<span id='cumeErrMsg'></span>
			<div class='form-group m-0 mt-3'>
				<label>줄거리*</label><textarea id='movieStory' name='movieStory' class='form-control' minlength='2' maxlength='2000' required></textarea>
				<span id='storyErrMsg'></span>
			</div> 
			<div class='row p-5 ml-5 justify-content-end'>
				<div class='p-1'>
				<button class='btn btn-secondary btn-block h-100 w-100 mr-5' onclick='location.href="../movie/listMovie"'>취소</button>
				</div>
				<div class='p-1'>
				<button class='btn btn-success btn-block h-100 w-100 mr-5' id='addMovieBtn'>추가</button>
				</div>
			</div>
		
	</div>
	<div class='modal fade' tabindex='-1' id='dialogModal'>
		<div id="modal-back" class='modal-dialog modal-lg'>
			<div style="height:250px"></div>
			<div id="modal-content" class="modal-content" style="padding:15px; background-color: white;">
				<div id='dialog'>
					<div id="dialogTitle" style="height:30px; font-size:20px; font-weight:bold;"></div>
					<div id="dialogBody"></div>
					<div id="dialogButton" style="height:38px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<input hidden='true' accept="image/*" id='fileSelector' type="file" id="fileUpload" />

<table class='table' id='addedCast' hidden='true'>
	<thead style='text-align: center'>
		<tr class="bg-light">
			<th>No.</th><th>이름</th><th>삭제</th>
		</tr>
	</thead>
	<tbody style='text-align: center'>
	</tbody>
</table>
<script>
	
	var totalGenreCount = ${fn:length(genres)};
	var selectedDirector = null;
	var selectedCast = new Map();
	var castToAdd; 
	
	function addCast() {
		castToAdd = [];
		setDialog(500, 250, true, "신규 배우 추가");
		setAddCastTitle();
		createAddCastBody();
		createDoubleButton();
		setAddCastOkEvent();
	}
	
	function setAddCastOkEvent() {
		document.querySelector('#okButton').addEventListener('click', function() {
			for(var i = 0; i < castToAdd.length; i++) {
				var formData = new FormData();
				formData.append('castName', castToAdd[i][0]);
				formData.append('img', castToAdd[i][1]);
				formData.append('isDirector', 'false');
				
				$.ajax({
					url : '../../cst/addcast',
					method : 'post',
					processData : false,
					contentType : false,
					data : formData,
					type : 'post'
				});
			}
			$('#dialogModal').modal('hide');
		});
	}
	
	function setAddCastTitle() {
		var btn = document.createElement('button');
		btn.setAttribute('type', 'button');
		btn.classList.add('btn');	
		btn.classList.add('genre-add-button');
		btn.style.setProperty('padding', '3px, 0px');
		btn.style.setProperty('margin-left', '5px');
		btn.innerHTML = '찾아보기';
		btn.addEventListener('click', function() {
			$("#fileSelector").trigger("click");
		});
		
		document.querySelector('#fileSelector').setAttribute('multiple', 'multiple');
		document.querySelector("#fileSelector").onchange = () => {
			var files = document.querySelector("#fileSelector").files;
			
			for(var i = 0; i < files.length; i++) {
				castToAdd.push([removeFileExtension(files[i].name), files[i]]);
			}
			
			updateTable();
			document.querySelector("#fileSelector").files.value = '';
		};
		
		var title = document.querySelector('#dialogTitle');
		title.appendChild(btn);
	}
	
	function removeFileExtension(origin) {
		var nameLastIndex = origin.indexOf('.');
		return origin.substring(0, nameLastIndex);
	}
	
	function updateTable() {
		var tableBody = document.querySelector('#addedCastBody');
		tableBody.innerHTML = '';
		
		for(var i = 0; i < castToAdd.length; i++) {
			var tdElem1 = document.createElement('th');
			tdElem1.innerHTML = i;
			
			var tdElem2 = document.createElement('th');
			tdElem2.innerHTML = castToAdd[i][0];
			
			var delButton = document.createElement('div');
			delButton.setAttribute('onclick', 'removeInTable(' + i + ')');
			delButton.innerHTML += '×';
			delButton.style.setProperty('padding', '0px');
			delButton.style.setProperty('margin', '0px');
			delButton.style.setProperty('cursor', 'pointer');
			
			var tdElem3 = document.createElement('th');
			tdElem3.appendChild(delButton);
			
			var trElem = document.createElement('tr');
			trElem.appendChild(tdElem1);
			trElem.appendChild(tdElem2);
			trElem.appendChild(tdElem3);
			
			tableBody.appendChild(trElem);
		}	
	}
	
	function removeInTable(rowNum) {
		castToAdd.splice(rowNum, 1);
		updateTable();
	}
	
	function createAddCastBody() {
		var descDiv = document.createElement('div');
		descDiv.innerHTML = '이미지 파일 명을 배우 이름으로 지정해서 업로드하시면 배우가 추가됩니다.';
		descDiv.style.setProperty('font-size', '13px');
		
		var addedCast = document.querySelector("#addedCast").cloneNode(true);
		addedCast.removeAttribute('hidden');
		addedCast.getElementsByTagName('tbody')[0].setAttribute('id', 'addedCastBody');
		
		var addedCastDiv = document.createElement('div');
		addedCastDiv.style.setProperty('border', '1px solid gray');
		addedCastDiv.style.setProperty('border-radius', '0.5rem');
		addedCastDiv.style.setProperty('margin-top', '3px');
		addedCastDiv.style.setProperty('height', '120px');
		addedCastDiv.style.setProperty('overflow', 'auto');
		addedCastDiv.style.setProperty('overflow-x', 'hidden');
		
		addedCastDiv.appendChild(addedCast);
		
		var body = document.querySelector('#dialogBody');
		body.appendChild(descDiv);
		body.append(addedCastDiv);
	}
	
	function addDirector() {
		setDialog(400, 185, true, "감독 추가");
		createAddDirectorBody();
		createDoubleButton();
		setButtonListener();
		setFileSelectButtonListener();
	}
	
	function setButtonListener() {
		var btn = document.querySelector("#okButton");
		btn.innerHTML = "추가";
		
		btn.addEventListener('click', function() {
			var formData = new FormData();
			formData.append('castName', document.querySelector('#inputCastName').value);
			formData.append('img', document.querySelector("#fileSelector").files[0]);
			formData.append('isDirector', 'true');
			
			$.ajax({
				url: '../../cst/addcast',
				method: 'post',
				data: formData,
				processData : false,
				contentType : false
			});
			
			$('#dialogModal').modal('hide');
			
		});
	}
	
	function setFileSelectButtonListener() {
		document.querySelector("#fileSelector").onchange = () => {
			document.querySelector('#imgName').value = document.querySelector("#fileSelector").files[0].name;
			document.querySelector("#fileSelector").files.value = '';
		};
	}
	
	function createAddDirectorBody() {
		var body = document.querySelector("#dialogBody");
		var nameInputDiv = createAddDirectorName();
		var imageInputDiv = createAddDirectorImage();
		
		body.appendChild(nameInputDiv);
		body.appendChild(imageInputDiv);
	}

	function createAddDirectorName() {
		var inputText = document.createElement('input');
		inputText.setAttribute('type', 'text');
		inputText.setAttribute('placeholder', '이름을 입력하세요.');
		inputText.classList.add('form-control');
		inputText.style.setProperty('width', '100%');
		inputText.style.setProperty('margin-top', '5px');
		inputText.setAttribute('id', 'inputCastName');
		return inputText;
	}
	
	function createAddDirectorImage() {
		var inputLabel = document.createElement('input');
		inputLabel.classList.add('form-control');
		inputLabel.setAttribute('type', 'text');
		inputLabel.style.setProperty('width', '85%');
		inputLabel.setAttribute('id', 'imgName');
		inputLabel.setAttribute('placeholder', '이미지를 입력하세요.');
		inputLabel.setAttribute('readonly', 'true');
		
		var buttonElem = document.createElement('button');
		buttonElem.classList.add('btn');
		buttonElem.classList.add('btn-success');
		buttonElem.style.setProperty('width', '28%');
		buttonElem.style.setProperty('margin-left', '2%')
		buttonElem.style.setProperty('padding', '0px');
		buttonElem.setAttribute('type', 'button');
		buttonElem.addEventListener('click', function() {
			$("#fileSelector").trigger("click");
		});
		buttonElem.innerHTML = "찾아보기";
		
		var imgDiv = document.createElement('div');
		imgDiv.style.setProperty('margin-top', '5px');
		imgDiv.style.setProperty('display', 'flex');
		imgDiv.appendChild(inputLabel);
		imgDiv.appendChild(buttonElem);
		
		return imgDiv;
	}
	
	function setDialog(width, height, isButtonDisplay, title) {
		if(isButtonDisplay) {
			var bodySize = height - 98;
		} else {
			var bodySize = height - 68;
		}
		
		document.querySelector("#modal-back").style.setProperty('width', width + 'px');
		document.querySelector("#modal-content").style.setProperty('height', height + 'px');
		document.querySelector("#dialogBody").style.setProperty('height', bodySize + 'px');
		document.querySelector("#dialogBody").innerHTML = "";
		document.querySelector("#dialogButton").innerHTML = "";
		document.querySelector("#dialogTitle").innerHTML = title;
	}
	
	function createAddGenreDialog() {
		setDialog(400, 100, false, "장르 추가");
		createAddGenreBody();
		document.querySelector('#addGenreBtn').addEventListener('click', function() {
			var inputGenre = document.querySelector('#genreInput').value;
			
			$.ajax({
				url: '/admin/gnr/add',
				method: 'post',
				data: {
					genreName: inputGenre
				},
				success : function(result) {
					addGenreElems(result, inputGenre);
				},
				error : function(error) {
					console.log(error);
				}
			})
		})
	}
	
	function addGenreElems(genreId, inputGenre) {
		var lineNum = parseInt(totalGenreCount++ / 4);
		var lineElem = document.querySelector("#genre_line_" + lineNum);
		
		if(lineElem == null) {
			lineElem = document.createElement('tr');
			lineElem.setAttribute('id', 'genre_line_' + lineNum);
			document.querySelector('#genreTableBody').appendChild(lineElem);
		}
		
		var inputElem = document.createElement('input');
		inputElem.setAttribute('id', 'gener_' + genreId);
		inputElem.setAttribute('onchange', 'genreSelection(' + genreId + ')');
		inputElem.setAttribute('type', 'checkbox');
		
		var labelElem = document.createElement('label');
		var tdElem = document.createElement('td');
		
		document.querySelector('#genreTableBody').appendChild(lineElem);
		lineElem.appendChild(tdElem);
		tdElem.appendChild(labelElem);
		labelElem.appendChild(inputElem);
		
		inputElem.outerHTML += inputGenre;
	}
	
	function createAddGenreBody() {
		var bodyDiv = createInputElems('추가');
		document.querySelector("#dialogBody").appendChild(bodyDiv);
	}
	
	function createInputElems(inputTitle) {
		var inputText = document.createElement('input');
		inputText.setAttribute('type', 'text');
		inputText.setAttribute('id', 'genreInput');
		inputText.style.setProperty('width', '78%');
		inputText.style.setProperty('margin-right', '2%');
		inputText.classList.add('form-control');
		 
		var button = document.createElement('button');
		button.classList.add('btn');
		button.classList.add('btn-success');
		button.style.setProperty('width', '20%')
		button.setAttribute('id', 'addGenreBtn');
		button.innerText = inputTitle;
		
		var bodyDiv = document.createElement('div');
		bodyDiv.style.setProperty('display', 'flex');
		bodyDiv.appendChild(inputText);
		bodyDiv.appendChild(button);
		
		return bodyDiv;
	}
	
	function findDirector(isDirector) {
		if(isDirector) {
			setDialog(600, 400, true, "감독 검색");
		} else {
			setDialog(600, 450, true, "배우 검색");
		}
		
		createSearchDirectorBody(isDirector);
		addDirectorListener();
	}
	
	function addDirectorListener() {
		var okBtn = document.querySelector('#okButton');
		
		okBtn.addEventListener('click', function() {
			updateCastNames();
			$('#dialogModal').modal('hide');
		})
	}
	
	function updateCastNames() {
		var selectedCastElem = document.querySelector('#selectedCast');
		
		document.querySelector('#directorName').value = '';
		document.querySelector('#castName').value = '';
		
		if(selectedDirector != null) {
			document.querySelector('#directorName').value = selectedDirector.lastChild.innerHTML;	
		} 
		
		if(selectedCast != null) {
			for (var [key, value] of selectedCast) {
				if(value != null) {
					document.querySelector('#castName').value += value[0] + ' ';	
				}
			}
		}
	}
	
	function createSearchDirectorBody(isDirector) {
		var searchDiv = createInputElems("검색");
		var listDiv = createDirectorListDiv(isDirector)
		
		var bodyDiv = document.querySelector("#dialogBody");
		bodyDiv.appendChild(searchDiv);
		bodyDiv.appendChild(listDiv);
		
		if(isDirector == false) {
			addSelectResultElem(bodyDiv);
		}
		
		createDoubleButton();
	}
	
	function addSelectResultElem(bodyDiv) {
		var resultElem = document.createElement('input');
		resultElem.setAttribute('id', 'selectedCast');
		resultElem.setAttribute('type', 'text');
		resultElem.classList.add('form-control');
		resultElem.setAttribute('placeholder', '선택된 배우들이 여기에 표시됩니다.');
		
		bodyDiv.appendChild(resultElem);
	}
	
	function createDirectorListDiv(isDirector) {
		var listDiv = document.createElement('div');
		listDiv.style.setProperty('height', '244px');
		listDiv.style.setProperty('margin-top', '10px');
		listDiv.style.setProperty('margin-bottom', '10px');
		listDiv.style.setProperty('border', '1px solid #ced4da');
		listDiv.style.setProperty('border-radius', '0.25rem');
		listDiv.style.setProperty('overflow', 'auto');
		listDiv.style.setProperty('overflow-x', 'hidden');
		printAllDirectors(listDiv, isDirector);
		
		return listDiv;
	}
	
	function printAllDirectors(listDiv, isDirector) {
		var url = isDirector ? "../../cst/getdirector" : "../../cst/getactor";
		$.ajax({
			url : url,
			method : "post",
			type : 'application/json',
			data : 	JSON.stringify ({
				startIndex : 0,
				rowCount : 1000
			}),
			success : function(result) {
				printDatas(listDiv, JSON.parse(result), isDirector);
			}
		});
	}
	
	function printDatas(listDiv, datas, isDirector) {
		var lineDiv = createLineDiv();
		
		for(var i = 0; i < datas.length; i++) {
			var imgElem = createImgElement(datas[i], isDirector);
			var nameElem = createNameElement(datas[i], isDirector);
			var imgDiv = createImageDiv(isDirector, datas[i], imgElem, nameElem);
			
			lineDiv.appendChild(imgDiv);
			
			if((i + 1) % 8 == 0) {
				listDiv.appendChild(lineDiv);
				lineDiv = createLineDiv();
			}
			
			if((isDirector == false) && (selectedCast.get(String(datas[i].castNum)) != null)) {
				select(imgDiv, nameElem, imgElem);
			}
			
			if((isDirector) && (selectedDirector != null) &&(selectedDirector.getAttribute('id') == imgDiv.getAttribute('id'))) {
				select(imgDiv, nameElem, imgElem);
			}
		}
		
		listDiv.appendChild(lineDiv);
	}
	
	function createImageDiv(isDirector, data, imgElem, nameElem) {
		var imgDiv = document.createElement('div');
		imgDiv.style.setProperty('margin', '5px');
		imgDiv.style.setProperty('cursor', 'pointer');
		imgDiv.setAttribute('selected', false);
		imgDiv.appendChild(imgElem);
		imgDiv.appendChild(nameElem);
		
		if(isDirector) {
			imgDiv.setAttribute('isDirector', true);
			imgDiv.setAttribute('id', 'p_' + data.directorNum);
		} else {
			imgDiv.setAttribute('isDirector', false);
			imgDiv.setAttribute('id', 'p_' + data.castNum);
		}
		
		imgDiv.addEventListener('click', function() {
			converteImageDivStatus(this, isDirector);
		});
		
		return imgDiv;
	}
	
	function createNameElement(result, isDirector) {
		var nameElem = document.createElement('div');
		nameElem.classList.add('cast-name');
		
		if(isDirector) {
			nameElem.setAttribute('id', 'name_' + result.directorNum);
			nameElem.innerHTML = result.directorName;	
		} else {
			nameElem.setAttribute('id', 'name_' + result.castNum);
			nameElem.innerHTML = result.castName;	
		}
		
		return nameElem;
	}
	
	function converteImageDivStatus(imgDiv, isDirector) {
		var selected = imgDiv.getAttribute('selected');
		
		var num = imgDiv.getAttribute('id').replace('p_', '');
		var imgElem = document.querySelector("#img_" + num);
		var nameElem = document.querySelector("#name_" + num);
		
		if(isDirector) {
			if(selected == 'true') {
				unSelect(imgDiv, nameElem, imgElem);
				selectedDirector = null;
			} else if(selected == 'false'){
				select(imgDiv, nameElem, imgElem);
				checkIsDirector(imgDiv, nameElem, imgElem);
			}
		} else {
			if(selected == 'subActor') {
				selectToMainActor(imgDiv, nameElem, imgElem);
			} else if(selected == 'mainActor') {
				unSelect(imgDiv, nameElem, imgElem);	
			} else if(selected == 'false'){
				selectToSubActor(imgDiv, nameElem, imgElem);	
			}
		}
	}
	
	function selectToMainActor(imgDiv, nameElem, imgElem) {
		imgDiv.setAttribute('selected', 'mainActor');
		nameElem.style.setProperty('color', 'red');
		imgElem.style.setProperty('border', '2px solid red');
		addOrRemoveCasts(imgDiv, nameElem, imgElem, 'mainActor');
	}
	
	function selectToSubActor(imgDiv, nameElem, imgElem) {
		imgDiv.setAttribute('selected', 'subActor');
		nameElem.style.setProperty('color', 'orange');
		imgElem.style.setProperty('border', '2px solid orange');
		addOrRemoveCasts(imgDiv, nameElem, imgElem, 'subActor');
	}
	
	function unSelect(imgDiv, nameElem, imgElem) {
		imgDiv.setAttribute('selected', false);
		nameElem.style.setProperty('color', 'black');
		imgElem.style.setProperty('border', '2px solid gray');
		addOrRemoveCasts(imgDiv, nameElem, imgElem, false);
	}
	
	function select(imgDiv, nameElem, imgElem) {
		imgDiv.setAttribute('selected', true);
		nameElem.style.setProperty('color', 'orange');
		imgElem.style.setProperty('border', '2px solid orange');
		addOrRemoveCasts(imgDiv, nameElem, imgElem, true);
	}
	
	function addOrRemoveCasts(imgDiv, nameElem, imgElem, isAdd) {
		var selectedCastElem = document.querySelector('#selectedCast');
		
		if(selectedCastElem == null) {
			return;
		}
		
		var castNum = imgDiv.getAttribute('id').replace('p_', '');
		var castName = nameElem.innerHTML;
		
		if(isAdd == true) {
			selectedCast.set(castNum, castName);
		} else if (isAdd == false) {
			selectedCast.set(castNum, null);
		} else if (isAdd == 'mainActor') {
			selectedCast.set(castNum, [castName, 'mainActor']);
		}  else if (isAdd == 'subActor') {
			selectedCast.set(castNum, [castName, 'subActor']);
		} 
		
		writeSelectdCastElem(selectedCastElem);
	}
	
	function writeSelectdCastElem(selectedCastElem) {
		selectedCastElem.value = '';
		for (var [key, value] of selectedCast) {
			if(value != null) {
				selectedCastElem.value += value[0] + ' ';	
			}
		}
	}
	
	function checkIsDirector(imgDiv, nameElem, imgElem) {
		var isDirector = imgDiv.getAttribute('isDirector');
		
		if(isDirector == 'false') {
			return;
		}

		
		if(selectedDirector != null) {
			var unSelectTarget = document.querySelector('#' + selectedDirector.getAttribute('id'))
			unSelect(unSelectTarget, unSelectTarget.lastChild, unSelectTarget.firstChild);
		}
		
		selectedDirector = imgDiv;
	}
	
	function createImgElement(result, isDirector) {
		var imgElem = document.createElement('img');
		imgElem.setAttribute('alt', 'Avatar');
		imgElem.classList.add('w3-col');
		imgElem.classList.add('s6');
		imgElem.classList.add('circle');
		
		if(isDirector) {
			imgElem.setAttribute('id', 'img_' + result.directorNum);
			imgElem.setAttribute('src', '../../img?fileName=' + result.directorImgFileName);	
		} else {
			imgElem.setAttribute('id', 'img_' + result.castNum);
			imgElem.setAttribute('src', '../../img?fileName=' + result.castImgFileName);
		}
		
		return imgElem;
	}
	
	function createLineDiv() {
		var lineDiv = document.createElement('div');
		lineDiv.style.setProperty('display', 'flex');
		lineDiv.style.setProperty('margin', '0px auto');
		lineDiv.style.setProperty('width', '100%');
		overflow:scroll;
		return lineDiv;
	}
	
	function createDoubleButton() {
		var cancelButton = document.createElement('button');
		cancelButton.style.setProperty('width', '49%');
		cancelButton.classList.add('btn');
		cancelButton.innerHTML = '취소';
		
		var okButton = cancelButton.cloneNode();
		okButton.style.setProperty('margin-left', '2%');
		okButton.innerHTML = '선택';
		okButton.setAttribute('id', 'okButton');
		okButton.classList.add('btn-success');
		cancelButton.classList.add('btn-secondary');
		
		var btnDiv = document.querySelector('#dialogButton');
		btnDiv.appendChild(cancelButton);
		btnDiv.appendChild(okButton);
		
		cancelButton.addEventListener('click', function() {
			$('#dialogModal').modal('hide');
			selectedDirector = null;
		})
	}
	
</script>
