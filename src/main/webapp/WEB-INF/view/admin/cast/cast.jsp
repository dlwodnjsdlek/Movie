<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>addMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function checkLogin() {
	if(${empty userId}) {location.href="user/login"}
	else if(${userId ne "admin"}) location.href="../user/logout"
}
$(checkLogin)
</script>
<style>
html, body {
	height: 90%;
}

.backgroundLayout {
	margin-top: 20px;
	margin-left: 10%;
	margin-right: 10%;
	width: 80%;
	height: 100%;
}

.viewLayout {
	height: 79%;
	margin-top: 1%;
	padding : 10px;
	border : 1px solid gray;
	border-radius : 0.25rem;
}

.circle {
	width: 90px;
	height: 90px;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	border : 2px solid gray;
}

.cast-info {
	margin : 5px;
	margin-bottom : 0px;
	font-size : 14px;
	text-align : center;
}

.add-button {
	margin-left : 90%;
	margin-top : 10px;
	width : 10%;
}

#dialog {
	height : 170px;
}

#logoutBtn{
	height: 1.5rem;
	font-size: 14px;		
}
</style>
<body>
	<div class='container'>
		<div class='header'>
			<div class='float-left mt-3'>
				<h5>| 감독/배우</h5>
			</div>
			<div id='btn_group' class='float-right mt-3'>
				<label style='font-size: 13'>${userId}님</label>&emsp; 
				<button id='logoutBtn' type='button' class='btn btn-secondary' onclick='location.href="user/logout"'>
	        		<span id='logoutSpan'>로그아웃</span>
	        	</button>
			</div>
			<br>
			<div class='row mt-5'>
				<div class='col'>
					<div class='container'>
						<div class='row'>
							<div class='col-12 text-center'>
								<div class='btn-group btn-block'>
									<button type='button' class='btn btn-secondary' onclick='location.href="../admin" '>홈</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="user" '>회 원</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="genre/addGenre" '>장 르</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="movie/listMovie" '>영 화</button>
									<button disabled type='button' class='btn btn-primary' onclick='location.href="" '>감독/배우</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="inspection/inspection" '>신고 조회</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><hr>
	<div class="backgroundLayout">
		<div style="display:flex">
			<input class='form-control' type='text' placeholder='검색' style="width:65%"/>
			<button type='button' class="btn ml-3 mr-3 border" style="width:5%">
				<i class='fa-solid fa-magnifying-glass'></i>
			</button>
			<div class="btn-group" style="width:28%;">
				<button id="director" onclick="togleDirector()" type='button' class='btn btn-secondary' style="width:50%; border: 0px solid gray">감독</button>
				<button id="actor" onclick="togleActor()" type='button' class='btn btn-secondary' style="width:50%; border: 0px solid gray">배우</button>
			</div>
		</div>
		<div id="view" class="viewLayout">
		
		</div>
		<div>
			<button type='button' onclick='createCastAddDialog()' class='btn btn-secondary add-button' data-toggle="modal" data-target='#dialogModal'>추가</button>
		</div>
	</div>
	
	<div class='modal fade' tabindex='-1' id='dialogModal'>
		<div class='modal-dialog modal-lg'>
			<div id="dialogUpperMargin" style="height:290px"></div>
			<div class="modal-content" style="width:500px; margin:0px auto">
				<div id='dialog' style="margin:5px;padding:15px; background-color: white;"></div>
			</div>
		</div>
	</div>
	
	<input hidden='true' accept="image/*" id='fileSelector' type="file" id="fileUpload" />
</body>
<script>
	
	var directorSelected = false;
	var actorSelected = false;
	
	function togleDirector() {
		var director = document.querySelector("#director");
		var actor = document.querySelector("#actor");
		
		if(directorSelected == false) {
			enableDirector();
		} else {
			disableDirector();
		}
	}
	
	function togleActor() {
		var actor = document.querySelector("#actor");
		
		if(actorSelected == false) {
			enableActor();
		} else {
			disableActor();
		}
	}
	
	function enableDirector() {
		director.style.setProperty('background-color', '#5aaaff');
		directorSelected = true;
		
		if(actorSelected) {
			actor.style.setProperty('background-color', '#6c757d');
			actorSelected = false;
		}
		
		request(true);
	}
	
	function disableDirector() {
		director.style.setProperty('background-color', '#6c757d');
		directorSelected = false;
		document.querySelector("#view").innerHTML = '';
	}
	
	function enableActor() {
		actor.style.setProperty('background-color', '#5aaaff');
		actorSelected = true;
		
		if(directorSelected) {
			director.style.setProperty('background-color', '#6c757d');
			directorSelected = false;
		}
		
		request(false);
	}
	
	function disableActor() {
		actor.style.setProperty('background-color', '#6c757d');
		actorSelected = false;
		document.querySelector("#view").innerHTML = '';
	}
	
	function request(isDirector) {
		var targetUrl;
		
		if(isDirector) {
			targetUrl = "../cst/getdirector";
		} else {
			targetUrl = "../cst/getactor";
		}
		
		$.ajax({
			url : targetUrl,
			method : "post",
			type : 'application/json',
			data : 	JSON.stringify ({
				startIndex : 0,
				rowCount : 1000
			}),
			success : function(result) {
				writeData(JSON.parse(result), isDirector);
			}
		});
		
	}
	
	function writeData(result, isDirector) {
		console.log(result);
		
		var view = document.querySelector("#view");
		var lineDiv = createLineDiv();
		view.innerHTML = "";
		view.appendChild(lineDiv);
		
		for(var i = 0; i < result.length; i++) {
			var imgElem = createImgElement(result[i], isDirector);
			var nameElem = createNameElement(result[i], isDirector);
			
			var imgDiv = createImgDiv();
			imgDiv.appendChild(imgElem);
			imgDiv.appendChild(nameElem);
			lineDiv.appendChild(imgDiv);
			
			if(isOverflown(lineDiv)) {
				imgDiv.remove();
				lineDiv = createLineDiv();
				view.appendChild(lineDiv);
				lineDiv.appendChild(imgDiv);
			}
		}
		
		view.appendChild(lineDiv);
	}
	
	function createLineDiv() {
		var lineDiv = document.createElement('div');
		lineDiv.style.setProperty('display', 'flex');
		lineDiv.style.setProperty('margin', '0px auto');
		lineDiv.style.setProperty('width', '100%');
		return lineDiv;
	}
	
	function createImgElement(result, isDirector) {
		var imgElem = document.createElement('img');
		imgElem.setAttribute('alt', 'Avatar');
		imgElem.classList.add('w3-col');
		imgElem.classList.add('s6');
		imgElem.classList.add('circle');
		imgElem.style.setProperty('border-radius', '50%');
		
		if(isDirector) {
			imgElem.setAttribute('src', '../img?fileName=' + result.directorImgFileName);
		} else {
			imgElem.setAttribute('src', '../img?fileName=' + result.castImgFileName);
		}
		
		return imgElem;
	}
	
	function createNameElement(result, isDirector) {
		var nameElem = document.createElement('div');
		nameElem.classList.add('cast-name');
		
		if(isDirector) {
			nameElem.innerHTML = result.directorName;
		} else {
			nameElem.innerHTML = result.castName;
		}
		
		return nameElem;
	}
	
	function createImgDiv() {
		var imgDiv = document.createElement('div');
		imgDiv.classList.add('cast-info');
		imgDiv.style.setProperty('overflow', 'hidden;');
		return imgDiv;
	}
	
	function isOverflown(element) {
		return element.scrollHeight > element.clientHeight
		|| element.scrollWidth > (element.clientWidth);
	}
	
	////////////
 	// DIALOG //
 	////////////
 	
	function createCastAddDialog() {
		var dialog = document.querySelector("#dialog");
		dialog.innerHTML = '';
		dialog.appendChild(createTitleElem());
		dialog.appendChild(createBodyElem());
		dialog.appendChild(createButtonDiv());
		
		document.querySelector("#okButton").addEventListener('click', function() {
			uploadFile();
		});
	}
	var directorSelected = false;
	var actorSelected = false;
	
	
	function uploadFile() {
		var formData = new FormData();
		formData.append('castName', document.querySelector('#inputName').value);
		formData.append('img', document.querySelector("#fileSelector").files[0]);
		
		if(directorSelected) {
			formData.append('isDirector', 'true');
		} else {
			formData.append('isDirector', 'false');
		}
		
		$.ajax({
			url : '../cst/addcast',
			method : 'post',
			processData : false,
			contentType : false,
			data : formData,
			type : 'post',
			success : function(result) {
				console.log(result);
				$('#dialogModal').modal('hide');
			}
		});
	}
	
	function createTitleElem() {
		var title = document.createElement('div');
		title.style.setProperty('font-size', '20px');
		title.style.setProperty('font-weight', 'bold');
		
		if((directorSelected == false) && (actorSelected == false)) {
			title.innerHTML += "알림";
		} else if (directorSelected) {
			title.innerHTML += "감독 추가";
		} else if (actorSelected) {
	   		title.innerHTML += "배우 추가";
		}
		
		return title;
	}
	
	function createBodyElem() {
		var body = document.createElement('div');
		body.style.setProperty('margin-top', '10px');
		body.style.setProperty('height', '75px');
		
		if((directorSelected == false) && (actorSelected == false)) {
			body.innerHTML += "감독 또는 배우를 선택하세요.";
		} else if (directorSelected) {
			body.appendChild(createAddCastBody(true));
		} else if (actorSelected) {
			body.appendChild(createAddCastBody(false));
		}
		
		return body;
	}
	
	function createAddCastBody(isDirector) {
		var nameDiv = createInputNameDiv();
		var imgDiv = createDialogImgDiv();
		var bodyDiv = document.createElement('div');
		
		bodyDiv.appendChild(nameDiv);
		bodyDiv.appendChild(imgDiv);
		
		return bodyDiv;
	}
	
	function createDialogImgDiv() {
		var imgLabel = createTextSpanElement('이미지');
		var inputLabel = createInputLabel();
		var buttonElem = document.createElement('button');
		
		inputLabel.setAttribute('id', 'imgName');
		inputLabel.style.setProperty('width', '55%');
		
		buttonElem.classList.add('btn');
		buttonElem.classList.add('btn-secondary');
		buttonElem.style.setProperty('width', '28%');
		buttonElem.style.setProperty('height', '30px');
		buttonElem.style.setProperty('margin-left', '2%')
		buttonElem.style.setProperty('padding', '0px');
		buttonElem.setAttribute('type', 'button');
		buttonElem.addEventListener('click', function() {
			$("#fileSelector").trigger("click");
		});
		buttonElem.innerHTML = "찾아보기";
		
		var imgDiv = document.createElement('div');
		imgDiv.style.setProperty('display', 'flex');
		imgDiv.appendChild(imgLabel);
		imgDiv.appendChild(inputLabel);
		imgDiv.appendChild(buttonElem);
		
		return imgDiv;
	}
	
	function createInputNameDiv() {
		var nameLabel = createTextSpanElement('이름');
		var inputLabel = createInputLabel();
		var nameDiv = document.createElement('div');
		
		inputLabel.setAttribute('id', 'inputName');
		nameDiv.style.setProperty('display', 'flex');
		nameDiv.style.setProperty('margin-bottom', '5px');
		nameDiv.appendChild(nameLabel);
		nameDiv.appendChild(inputLabel);
		
		return nameDiv;
	}
	
	function createTextSpanElement(text) {
		var nameLabel = document.createElement('span');
		nameLabel.innerHTML += text;
		nameLabel.style.setProperty('text-align', 'left');
		nameLabel.style.setProperty('width', '15%'); 
		nameLabel.style.setProperty('margin-top', '2px');
		return nameLabel;
	}
	
	function createInputLabel() {
		var inputLabel = document.createElement('input');
		inputLabel.classList.add('form-control');
		inputLabel.setAttribute('type', 'text');
		inputLabel.style.setProperty('width', '85%');
		inputLabel.style.setProperty('height', '30px');
		return inputLabel;
	}
	
	function createButtonDiv() {
		var div = document.createElement('div');
		div.style.setProperty('display', 'flex');
		
		if((directorSelected == false) && (actorSelected == false)) {
			createSingleButton(div);
		} else {
			createDoubleButton(div);
		}
		
		return div;
	}
	
	function createDoubleButton(div) {
		var btnElem = document.createElement('button');
		btnElem.classList.add('btn');
		btnElem.classList.add('btn-secondary');
		btnElem.style.setProperty('width', '49%');
		btnElem.style.setProperty('height', '35px');
		btnElem.setAttribute('id', 'cancelBtn');
		btnElem.innerHTML += '취소';
		btnElem.addEventListener('click', function() {
			$('#dialogModal').modal('hide');
		});
		div.appendChild(btnElem);
		
		
		btnElem = document.createElement('button');
		btnElem.classList.add('btn');
		btnElem.classList.add('btn-primary');
		btnElem.setAttribute('id', 'okButton');
		btnElem.style.setProperty('background-color', '#5aaaff');
		btnElem.style.setProperty('broder', '0px solid gray');
		btnElem.style.setProperty('width', '49%');
		btnElem.style.setProperty('height', '35px');
		btnElem.style.setProperty('margin-left', '2%');
		btnElem.innerHTML += '확인';
		div.appendChild(btnElem);
	}
	
	function createSingleButton(div) {
		var btnElem = document.createElement('button');
		btnElem.classList.add('btn');
		btnElem.classList.add('btn-secondary');
		btnElem.style.setProperty('margin-left', '80%'); 
		btnElem.style.setProperty('width', '20%');
		btnElem.innerHTML += '확인';
		btnElem.addEventListener('click', function() {
			$('#dialogModal').modal('hide');
		});
		
		div.appendChild(btnElem);
	}
	
	document.querySelector("#fileSelector").onchange = () => {
		console.log(document.querySelector("#fileSelector").files[0]);
		document.querySelector('#imgName').value = document.querySelector("#fileSelector").files[0].name;
	};	
</script>
</html>