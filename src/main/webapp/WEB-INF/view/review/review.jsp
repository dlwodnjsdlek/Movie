<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<style>
nav {
	background-color: rgb(19, 19, 29);
}

nav a {
	text-decoration: none;
	color: lightgray;
}

.fa-compass, .fa-user, .fa-house, .fa-comments {
	color:rgb(221, 221, 221);
	font-size:28px;
}

.iconfont {
	font-size:12px;
}

.center {
	display: flex;
	flex-wrap: wrap;
	margin-bottom : 10px;
}

.poster {
	width: 100px;
	height: 125px;
	border: 1px solid #dee2e6;
	margin-right: 5px;
}

.movieinfo-all {
	width : 225px;
	height : 120px;
}

.movieinfo-line {
	width : 225px;
	height : 25px;
	margin : 0px;
}

.movieinfo-contents {
	width : 130px;
	height : 125px;
	margin : 0px;
}

.movieinfo-contents-detail {
	font-size : 12px;
	text-align : justify;
	margin-right : 10px;
	height : 70px;
	text-overflow: ellipsis;
	overflow: hidden;
	display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
}

.movieinfo-contents-more {
	font-style: italic;
	text-decoration: underline;
}

.movieinfo-actors {
	width : 200px;
	height : 125px;
	margin : 0px;
	padding : 0px;
}

.movieinfo-actor {
	width : 50px;
	height : 100px;
	padding : 5px;
	margin-top : 5px;
}

.movieinfo-actor-name {
	text-align : center;
	font-size : 12px;
}

.movieinfo-actor-more {
	text-align : center;
	font-size: 25px;
	padding-left : 2px;
}

.moreinfo-contents-button {
	text-align : center;
	margin : 0px;
	margin-top : 5px;
	padding : 0px;
	width : 120px;
	height : 20px;
	font-size : 14px;
	color : white;
	border : 0px solid gray;
	background-color: #007bff;
}

.menu {
	font-size : 18px;
	font-weight : bold;
	width: 225px;
	height: 25px;
	margin-bottom:5px;
}

.submenu {
	font-size : 13px;
	font-weight : bold;
	width : 60px;
	height : 25px;
}

.submenu-content {
	font-size : 13px;
	width : 165px;
	text-align : right;
}

.write-review {
	font-size : 12px;
	width : 105px;
	text-align : right;
	margin-top : 4px;
}

.like-unlike-panel {
	width : 120px;
	text-align : right;
	padding-right : 5px;
}

.review-id {
	width : 203px;
	margin : 0px;
	padding : 0px;
	font-size : 13px;
	font-weight : bold;
}

.review-content {
	font-size : 11px;
	width: 260px;
}

.comment-panel {
	font-size : 11px;
	width : 60px;
	border : 1px solid gray;
	height : 20px;
}

.dialog-margin-top {
	height : 290px;
}

.dialog-menu {
	font-size : 18px;
	font-weight : bold;
}

#circle {
	width: 40px;
	height: 40px;
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	border : 1px solid gray;
}

.circle {
	width: 40px;
	height: 40px;
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	border : 2px solid black;
}

.rectangle {
	width : 330px;
	height : 50px;
	border : 1px solid gray;
	padding-left : 5px;
	margin-bottom : 5px;
}

.like-button {
	border : 0px solid gray;
	background : white;
	font-size : 12px;
	padding : 0px;
	background-color : rgba(0, 0, 0, 0);
}

.comment-like {
	font-size : 11px;
}

#dialog {
	height : 150px;
	background-color : rgb(237, 237, 237);
	border-radius: 5px;
}

.input-text {
	width : 100%;
	height : 60px;
	margin-top : 5px;
	border-radius: 5px;
}

.dialog-button {
	width : 48%;
	border : 0px solid gray;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div hidden="true">
		<span id="actor_size">${fn:length(review.casts) }</span>
		<c:forEach begin="0" end="${fn:length(review.casts) }" varStatus="status">
			<span id="actor_${status.current }">
				<span id="name">${review.casts[status.current].castName }</span>
				<span id="imgUrl">${review.casts[status.current].castImgFileName}</span>
				<span id="position">배우</span>
				<span id="position"><c:if test="${review.casts[status.current].position eq 0 }">배우</c:if></span>
			</span>
		</c:forEach>
		<span id="loginedUserNum">${userNum} </span>
		<span id="isReviewWritten">${review.reviewWriten}</span>
	</div>
	<!-- HEADER !-->
	<form class='mt-3'>
		 <div class='col form-group d-flex justify-content-center align-items-center'>
			<input  class='form-control w-75' type='text' placeholder='검색'/>
			<button type='button' class=" btn ml-3 border" onclick='location.href="../movie"'>
			   <i class='fa-solid fa-magnifying-glass'></i>
			   <span class='ml-2 d-none d-md-inline'>검색:</span>
			</button>
		 </div>
 	</form>
	  
	<!-- MAIN CONTENT !-->
	<div class="container"><hr></div>
	<div style="overflow:scroll; height:464px; overflow-x:hidden;">
		<div class="container center">
			<div class="poster">
				<img src='<c:url value="../attach/${review.movie.movieImgfileName}"/>' style="object-fit: cover; width:100%; height:100%;">
			</div>
			<div class="movieinfo">
				<div class="menu">${review.movie.movieName }</div>
				<div class="row movieinfo-line">
					<div class="submenu" style="width:30px;">개요</div>
					<div class="submenu-content" style="width:195px;" >${review.summaryString }</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">상영시간</div>
					<div class="submenu-content">${review.movie.movieRunningtime }분</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">개봉</div>
					<div class="submenu-content">${review.movie.movieReleasedate }</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">누적 관객</div>
					<div class="submenu-content">${review.audienceString }명</div>
				</div>
			</div>
		</div>
		<!-- MOVIE INFO CONTENTS AND ACTORS !-->
		<div class="container center">
			<div class="movieinfo-contents">
				<div class="menu">줄거리</div>
				<div id="movieStory" class="movieinfo-contents-detail ">${review.movie.movieStory }</div>
				<button class="moreinfo-contents-button" onclick="createDetailContentDialog()" type="button" data-toggle="modal" data-target='#dialogModal'>자세히</button>
			</div>
			<div class="movieinfo-actors">
				<div class="menu">출연진</div>
				<div class="container row movieinfo-actors">
					<div class="movieinfo-actor">
						<img src='<c:url value="../attach/${review.director.directorImgFileName}"/>' alt="Avatar" class="w3-col s6 circle" style="border-radius:50%;">
						<div class="movieinfo-actor-name">${review.director.directorName} (감독)</div>
					</div>
					<div class="movieinfo-actor">
						<img src='../attach/${review.casts[0].castImgFileName}' id="mainActorImage1" alt="Avatar" class="w3-col s6 circle" style="border-radius:50%;">
						<div id="mainActor1" class="movieinfo-actor-name">${review.casts[0].castName} (배우)</div>
					</div>
					<div class="movieinfo-actor">
						<img src='../attach/${review.casts[1].castImgFileName}' id="mainActorImage2" alt="Avatar" class="w3-col s6 circle" style="border-radius:50%;">
						<div id="mainActor2" class="movieinfo-actor-name">${review.casts[1].castName} (배우)</div>
					</div>
					<div class="movieinfo-actor">
						<div id="circle" class="movieinfo-actor-more" onclick="createActorDetail()" type="button" data-toggle="modal" data-target='#dialogModal'><span>&#10097;&#10097;</span></div>
						<div class="movieinfo-actor-name movieinfo-contents-more" onclick="createActorDetail()" style="color:#007bff; margin-top:5px;" type="button" data-toggle="modal" data-target='#dialogModal'><a href='#'>더보기</a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- REVIEW AND REVIEW COMMENTS !-->
		<div class="container center" style="margin-bottom:0px;">
			<div class="menu">
				사용자 평 &nbsp;
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star-half-full" style="font-size:14px; color:#FF7F00""></i>
				<!-- <i class="fa fa-star-o" style="font-size:14px"></i> !-->
				<span style="font-size:14px; color:#FF7F00"">4.7</span>
			</div>
			<div class="write-review">
				<button class="btn-secondary" type="button" data-toggle="modal" data-target='#dialogModal' id="writereviewBtn" onclick="createReviewDialog()" style="border:1px solid gray">평 작성하기</button></div>
		</div>
		<div class="container center" id="reviewContainer">
			<c:if test="${fn:length(review.reviews) eq 0 }">
				<div style="font-size:12px; text-align:center; width:100%; margin-top:5px;">
					작성된 사용자 평이 없습니다.<br>
					사용자 평을 작성해 주세요!
				</div>
			</c:if>
			<c:if test="${fn:length(review.reviews) ne 0 }">
				<c:forEach var="rev" items="${review.reviews}" varStatus="status">
					<div class="rectangle" id="review_${rev.reviewNum}" isCommentOpened="false">
						<div class="row container" style="margin:0px; padding:0px;">
							<div id="reviewWriter" class="review-id">${ rev.nickName }(${rev.userId })</div>
							<div class="like-unlike-panel">
								<button class="like-button" onclick="addLike(${rev.reviewNum}, 1)">
									<c:choose>
										<c:when test="${rev.currentUserSympaths eq 1}">
											<i id="revIcon_like_${rev.reviewNum }_1" class="fa fa-thumbs-up"></i>
										</c:when>
										<c:otherwise>
											<i id="revIcon_like_${rev.reviewNum }_1" class="far fa-thumbs-up"></i>
										</c:otherwise>
									</c:choose>
								</button>
								<span class="like-button"  id="rev_${rev.reviewNum }_1">${rev.likeCount }</span>
								<button class="like-button" onclick="addLike(${rev.reviewNum}, -1)">
									<c:choose>
										<c:when test="${rev.currentUserSympaths eq -1}">
											<i id="revIcon_like_${rev.reviewNum }_-1" id="rev_like_${rev.reviewNum }"class="fa fa-thumbs-down"></i>
										</c:when>
										<c:otherwise>
											<i id="revIcon_like_${rev.reviewNum }_-1"class="far fa-thumbs-down"></i>
										</c:otherwise>
									</c:choose>
								</button>		
								<span class="like-button" id="rev_${rev.reviewNum }_-1">${rev.disLikeCount }</span>
								<c:if test="${not empty userNum}">
									<c:if test="${userNum eq rev.userNum }">
										<button class="like-button" type="button" data-toggle="modal" data-target='#dialogModal' onclick="removeReview(${rev.reviewNum})"> 
											<i id="removeIcon" class="fa-solid fa-trash"></i>
										</button>
									</c:if>
									<c:if test="${userNum ne rev.userNum }">
										<button class="like-button" type="button" data-toggle="modal" data-target='#dialogModal' onclick="reportReview(${rev.reviewNum})"> 
											<i class="fa-solid fa-triangle-exclamation"></i>
										</button>
									</c:if>
								</c:if>
								<c:if test="${empty userNum	}">
									<button class="like-button" type="button" data-toggle="modal" data-target='#dialogModal' onclick="reportReview(${rev.reviewNum})"> 
										<i class="fa-solid fa-triangle-exclamation"></i>
								</button>
								</c:if>
							</div>
						</div>
						<div class="row container" style="margin:0px; padding:0px;">
							<span id="reviewContent" class="review-content">${rev.reviewContent }</span>
							<button id="testId" class="comment-panel btn-secondary" onclick="viewComment(${rev.reviewNum})">댓글 ${rev.commentCount }</button>
						</div>
					</div>
				</c:forEach>
				<div id="moreReviewButton"class="movieinfo-actor-name" style="width:100%">
					<span onclick="viewMoreReview()">더보기 <i class="fa-solid fa-square-caret-down"></i></span>
				</div>
			</c:if>
		</div>
	</div>
	
	<!-- NAVGATION BAR !-->
	<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='../' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='community' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='#' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='../user/login' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>로그인</span>
               	</a>
           	</div>
      	</nav>
   	</div>
   	
   	<!-- DIALOG !-->
	<div class='modal fade' tabindex='-1' id='dialogModal'>
		<div class='modal-dialog modal-lg'>
			<div id="dialogUpperMargin" style="height:290px"></div>
			<div class="modal-content">
				<div id='dialog' style="padding:15px; background-color: white;"></div>
			</div>
		</div>
	</div>
	
	<!-- BUTTON FOR DIALOG -->
	<button hidden='true' id="dialogButton" type="button" data-toggle="modal" data-target='#dialogModal'></button>
<script>
	var currentReviews = 5;
	
	function viewComment(reviewNum) {
		console.log(reviewNum);
		
		$.ajax({
			url: "../rev/viewcomment",
			method: 'post',
			data: {
				revNum: reviewNum
			},
			success: function(result) {
				viewCommentElements(result);
			}
		})
	}
	
	function viewCommentElements(result) {
		console.log(result);
	}
	
	function addLike(reviewNum, isLiked) {
		var userNum = document.querySelector('#loginedUserNum').innerHTML;
		
		if((userNum == null) || (userNum == '')) {
			document.querySelector("#writereviewBtn").click();
			return;
		}
		
		$.ajax({
			url : '../sym/revlike',
			method: 'post',
			contentType: 'application/json',
			data : JSON.stringify({
				contentNum: reviewNum,
				contentName: '리뷰',
				userNum: userNum,
				value: isLiked
			}),
			success: function(result) {
				applySympathResult(result, reviewNum, isLiked);
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
	
	function applySympathResult(result, reviewNum, isLiked) {
		var targetLikeButton = document.querySelector('#revIcon_like_' + reviewNum + "_" + isLiked);
		var targetContent = document.querySelector('#rev_' + reviewNum + "_" + isLiked);
		var targetContentValue = parseInt(targetContent.innerHTML);
		
		var targetReverseButton = document.querySelector('#revIcon_like_' + reviewNum + "_" + (isLiked * -1))
		var targetReverseContent = document.querySelector('#rev_' + reviewNum + "_" + (isLiked * -1));
		var targetReverseContentValue = parseInt(targetReverseContent.innerHTML);
		
		var reverseChecked = targetReverseButton.classList.contains('fa');
		
		targetContent.innerHTML = (targetContentValue + parseInt(result));
		
		if(result == 1) {
			targetLikeButton.classList.remove('far');
			targetLikeButton.classList.add('fa');	
		} else {
			targetLikeButton.classList.remove('fa');
			targetLikeButton.classList.add('far');
		}
			
		if(reverseChecked) {
			targetReverseButton.classList.remove('fa');
			targetReverseButton.classList.add('far');
			targetReverseContent.innerHTML = (targetReverseContentValue - parseInt(result));
		}
	}
	
	function findMainActor() {
		var mainActors = [];
		for(var i = 0; i < ${fn:length(review.casts)}; i++) {
			var actorElem = document.querySelector('#actor_' + i);
			var position = actorElem.querySelector('#position').innerHTML;
			
			if(position == '주연') {
				mainActors.push([
					actorElem.querySelector('#imgUrl').innerHTML,
					actorElem.querySelector('#name').innerHTML
				])
			}
		}	
//		console.log(${review.casts[0].castImgFileName})
//		document.querySelector('#mainActorImage1').setAttribute('src', '../attach/${review.casts[0].castImgFileName}');
//		document.getElementById('mainActorImage1').setAttribute('src', '../attach/1670467630219.jpeg');
//		document.getElementById('mainActorImage2').setAttribute('src', '../attach/${review.casts[1].castImgFileName}');
//		document.querySelector('#mainActor1').innerHTML = ${review.casts[0].castName} + '<br />(주연)';
//		document.querySelector('#mainActor2').innerHTML = ${review.casts[1].castName} + '<br />(주연)';
	}
	
	
	function viewMoreReview() {
		$.ajax({
			url : '../rev/morerev',
			method: 'post',
			contentType: 'application/json',
			data: JSON.stringify({
				movieId : '${review.movie.movieNum}',
				startIndex : currentReviews,
				rowCount : currentReviews + 5
			}),
			success : function(result) {
				currentReviews = currentReviews + 5;
				createAdditionalReviewElement(JSON.parse(result));
			}
		});
	}
	
	function createAdditionalReviewElement(reviews) {
		var button = document.querySelector("#moreReviewButton");
		var reviewContainer = document.querySelector("#reviewContainer");
		
		button.remove();
		insertReviews(reviewContainer, reviews);
		reviewContainer.appendChild(button);
	}
	
	function insertReviews(reviewContainer, reviews) {
		for(var i = 0; i < reviews.length; i++) {
			var reviewElem = reviewContainer.firstElementChild.cloneNode(true);
			writeReviewData(reviews[i], reviewElem);
			reviewContainer.appendChild(reviewElem);
		}
	}
	
	function writeReviewData(review, reviewElem) {
		reviewElem.setAttribute("id", "review_" + review.reviewNum);
		
		var nicknameElem = reviewElem.querySelector("#reviewWriter");
		nicknameElem.innerHTML = review.nickName + "(" + review.userId  + ")";
		
		var contentElem = reviewElem.querySelector("#reviewContent");
		contentElem.innerHTML = review.reviewContent;
	}
	
	function getLoginedUserId() {
		var userNum = document.querySelector("#loginedUserNum").innerHTML;
		
		if(userNum) {
			return userNum;
		} else {
			return -1;
		}
	}
	    
	function removeReview(reviewNum) {
		clearDialog();
		createDialog("사용자 평 삭제", 0x3132);
		document.querySelector('#okButton').addEventListener('click', function() {
			$.ajax({
				url : "../rev/remove",
				method : "post",
				contentType: 'application/json',
				data : JSON.stringify({
					reviewId : reviewNum
				}),
				success : function(result) {
					location.reload();
				}
			})
		});
	}
	
	function createNeedLoginDialog() {
		clearDialog();
		createDialog("알림", 0x2182);
		document.querySelector('#okButton').addEventListener('click', function() {
			location.href='../user/login';
		});
	}
	
	function createDetailContentDialog () {
		clearDialog();
		createDialog("상세 줄거리", 0x1111);
		addOkButtonListener();
	}
	
	function addOkButtonListener() {
		document.querySelector('#okButton').addEventListener('click', function() {
			clearDialog();
		});
	}
	
	function createActorDetail() {
		clearDialog();
		createDialog("전체 출연진", 0x1121);
		addOkButtonListener();
	}
	
	function createReviewDialog() {
		if(getLoginedUserId() != -1) {
			clearDialog();
			if (checkLoginedWriten()) {
				createDialog("알림", 0x1152);
				addOkButtonListener();
			} else {
				createDialog("사용자 평 작성하기", 0x11142);	
				addWriteReviewListener();	
			}
		} else {
			createNeedLoginDialog();
		}
	}
	
	function checkLoginedWriten() {
		if(document.querySelector("#removeIcon") != null) {
			return true;
		} else {
			return false;
		}
	}
	
	function addWriteReviewListener() {
		document.querySelector('#okButton').addEventListener('click', function() {
			$.ajax({
				url: '../rev/add',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					movieNum : ${review.movie.movieNum},
					grade : document.querySelector("#scoreBox").value,
					reviewContent : document.querySelector("#reviewContentNew").value,
					userNum : getLoginedUserId()
				}),
			    success: function(result) {
			    	console.log(result);
			    },
			    error: function() {
			    	console.log("에러");
			    }
			}).done(function() {
				location.reload();
			});
		});
	}
	
	function createDialog(title, code) {
		var dialog = document.querySelector("#dialog");
		
		createDialogTopMargin(dialog, code);
		createTitle(dialog, title, code);
		createBody(dialog, code);
		createButtons(dialog, code);
	}
	
	function createDialogTopMargin(dialog, code) {
		var marginElem = document.querySelector("#dialogUpperMargin");
		
		if((code & 0x1) == 0x01) {
			marginElem.style.setProperty('height', '150px');
			dialog.style.setProperty('height', '300px');
		} else if ((code & 0x2) == 0x2) {
			marginElem.style.setProperty('height', '290px');
			dialog.style.setProperty('height', '150px');
		}
	}
	
	function createTitle(dialog, title, code) {
		if((code & 0x10000) == 0x10000) {
			createScoreTitle(dialog, title);
		} else {
			createNormalTitle(dialog, title);
		}
	}
	
	function createScoreTitle(dialog, title) {
		var titleElem = createTitleElem(title);
		var scoreElem = createScoreElem();
		var comboBoxElem = createComboBox();
		titleElem.style.setProperty('width', '160px');
		
		var containerElem = document.createElement('div');
		containerElem.style.setProperty('display', 'flex');
		containerElem.appendChild(titleElem);
		containerElem.appendChild(scoreElem);
		containerElem.appendChild(comboBoxElem);
		
		dialog.appendChild(containerElem);
	}
	
	function createTitleElem(title) {
		var titleElem = document.createElement('div');
		titleElem.innerHTML = title;
		titleElem.classList.add('menu');
		return titleElem;
	}
	
	function createScoreElem() {
		var scoreElem = document.createElement('span');
		scoreElem.setAttribute('id', 'scoreSpan');
		scoreElem.style.setProperty('padding-top', '2px');
		scoreElem.style.setProperty('margin-right', '5px');
		for(i = 0; i < 5; i++) {
			scoreElem.innerHTML += '<i class="fa fa-star" style="font-size:12px"></i>';
		}
		
		return scoreElem;
	}
	
	function createComboBox() {
		var comboBoxNode = document.createElement('select');
		var isNum = true;

		for(i = 5; i >= 0; i -= 0.5) {
			var optionNode = document.createElement('option');
			optionNode.innerHTML = i;

			if(isNum) {
				optionNode.innerHTML += '.0';
				isNum = false;
			} else {
				isNum = true;
			}

			comboBoxNode.appendChild(optionNode);
		}
		
		comboBoxNode.style.setProperty('font-size', '12px', '');
		comboBoxNode.style.setProperty('width', '40px', '');
		comboBoxNode.style.setProperty('margin-right', '2px', '');
		comboBoxNode.style.setProperty('border', '0px solid gray', '');

		comboBoxNode.setAttribute('id', 'scoreBox');
		comboBoxNode.setAttribute('onchange', 'changeScoreSpan()');

		return comboBoxNode;
	}
	
	function changeScoreSpan() {
		var comboBox = document.querySelector("#scoreBox");
		var selected = comboBox.options[comboBox.selectedIndex].value;
		var numValue = parseInt(selected);
		var floatValue = selected - numValue;

		var scoreSpan = document.querySelector("#scoreSpan");
		scoreSpan.innerHTML = '';

		for (i = 0; i < numValue; i++) {
			scoreSpan.innerHTML += '<i class="fa fa-star" style="font-size:12px"></i>';
		}

		if (floatValue != 0) {
			scoreSpan.innerHTML += '<i class="fa fa-star-half-o" style="font-size:12px"></i>';
			numValue++;
		}

		for(i = 0; i < 5 - numValue; i++) {
			scoreSpan.innerHTML += '<i class="fa fa-star-o" style="font-size:12px"></i>';
		}
	}
	
	function createNormalTitle(dialog, title) {
		var titleDiv = createTitleElem(title);
		dialog.appendChild(titleDiv);
	}
	
	function createBody(dialog, code) {
		var targetCode = code & 0xF0;
		
		if(targetCode == 0x10) {
			createTextBody(dialog, code);
		} else if (targetCode == 0x20) {
			createAllActorBody(dialog);
		} else if (targetCode == 0x30) {
			createRemoveReviewBody(dialog);
		} else if (targetCode == 0x40) {
			createInputTextBody(dialog);
		} else if (targetCode == 0x50) {
			createAlreadyWritenBody(dialog);
		} else if (targetCode == 0x80) {
			createNeedLoginBody(dialog);
		}
	}
	
	function createTextBody(dialog, code) {
		var textDiv = document.createElement('div');
		
		if((code & 0x100) == 0x100) {
			textDiv.innerHTML = document.querySelector('#movieStory').innerHTML;
			textDiv.style.setProperty('font-size', '12px');
			textDiv.style.setProperty('height', '200px');
			textDiv.style.setProperty('overflow', 'scroll');
		}
		
		dialog.appendChild(textDiv);
	}
	
	function createAllActorBody(dialog) {
		var bodyDiv = document.createElement('div');
		var lineDiv = document.createElement('div');
		
		bodyDiv.appendChild(lineDiv);
		bodyDiv.style.setProperty('height', '200px');
		bodyDiv.style.setProperty('overflow', 'scroll');
		
		lineDiv.style.setProperty('display', 'flex');
		lineDiv.appendChild(createDirectorDiv('${review.director.directorImgFileName}', '${review.director.directorName}', '감독'));
		
		var totalActors = document.querySelector('#actor_size').innerHTML;
		
		for(var i = 0; i < totalActors; i++) {
			var actorDiv = document.querySelector('#actor_' + i);
			var actorName = actorDiv.querySelector('#name').innerHTML;
			var actorUrl = actorDiv.querySelector('#imgUrl').innerHTML;
			var actorPosition = actorDiv.querySelector('#position').innerHTML;
			
			if((i + 1) % 5 == 0) {
				lineDiv = document.createElement('div');
				lineDiv.style.setProperty('display', 'flex');
				bodyDiv.appendChild(lineDiv);
			}
			
			lineDiv.appendChild(createDirectorDiv(actorUrl, actorName, actorPosition));
		}
		
		dialog.append(bodyDiv);
	}
	
	function createDirectorDiv(imgUrl, name, position) {
		var imageElem = document.createElement('img');
		
		imageElem.setAttribute('src', '../attach/' + imgUrl);
		imageElem.setAttribute('alt', 'Avater');
		imageElem.classList.add('w3-col');
		imageElem.classList.add('s6');
		imageElem.classList.add('circle');
		imageElem.style.setProperty('width', '50px');
		imageElem.style.setProperty('height', '50px');
		imageElem.style.setProperty('border-radius', '50%');
		
		var nameElem = document.createElement('div');
		nameElem.classList.add('movieinfo-actor-name');
		nameElem.style.setProperty('width', '50px');
		nameElem.style.setProperty('height', '50px');
		nameElem.innerHTML += (name + '<br>(' + position + ')');
		
		var divElem = document.createElement('div');
		divElem.style.setProperty('margin-right', '10px');
		divElem.classList.add('movieinfo-actor');
		divElem.appendChild(imageElem);
		divElem.appendChild(nameElem);
		
		return divElem;
	}
	
	function createRemoveReviewBody(dialog) {
		var divElem = createTextDivBody('작성된 리뷰를 삭제하시겠습니까?')
		dialog.appendChild(divElem);
	}
	
	function createInputTextBody(dialog, code) {
		var inputTextElem = document.createElement('textarea');
		inputTextElem.setAttribute('id', 'reviewContentNew');
		inputTextElem.style.setProperty('width', '100%');
		inputTextElem.style.setProperty('padding', '0px');
		inputTextElem.style.setProperty('resize', 'none');
		dialog.appendChild(inputTextElem);
	}
	
	function createNeedLoginBody(dialog) {
		var divElem = createTextDivBody('로그인이 필요합니다.')
		dialog.appendChild(divElem);
	}
	
	function createAlreadyWritenBody(dialog) {
		var divElem = createTextDivBody('이미 작성하신 사용자 평이 있습니다.');
		dialog.appendChild(divElem);
	}
	
	function createTextDivBody(text) {
		var divElem = document.createElement('div');
		divElem.innerHTML = text;
		divElem.style.setProperty("font-size", "12px");
		divElem.style.setProperty('height', '50px');
	
		return divElem;
	}
	
	function createButtons(dialog, code) {
		var buttonDiv = document.createElement('div');
		buttonDiv.style.setProperty('height', '50px');
		buttonDiv.style.setProperty('padding-top', '5px');
		buttonDiv.style.setProperty('padding-bottom', '10px');
		
		if((code & 0xF000) == 0x1000) {
			createSingleButton(buttonDiv);
		} else if ((code & 0xF000) == 0x2000) {
			createDoubleButton(buttonDiv, "로그인");
		} else if ((code & 0xF000) == 0x3000) {
			createDoubleButton(buttonDiv, "삭제");
		}
		
		dialog.appendChild(buttonDiv);
	}
	
	function createSingleButton(buttonDiv) {
		var button = createButton('100%', '확인','#007bff' );
		button.setAttribute('id', 'okButton');
		buttonDiv.appendChild(button);
	}
	
	function createButton(width, buttonText, color) {
		var button = document.createElement('button');
		button.style.setProperty('height', '100%');
		button.style.setProperty('width', width);
		button.style.setProperty('border', '0px solid black');
		button.style.setProperty('background-color', color);
		button.style.setProperty('color', 'white');
		button.innerHTML = buttonText;
		return button;
	}
	
	function createDoubleButton(buttonDiv, confirmButtonText) {
		var cancelButton = createButton('49%', '취소','#6c757d');
		cancelButton.setAttribute('id', 'cancelButton');
		cancelButton.addEventListener('click', function() {
			clearDialog();
		});
		
		var confirmButton = createButton('49%', confirmButtonText,'#007bff');
		confirmButton.style.setProperty('margin-left', '2%');
		confirmButton.setAttribute('id', 'okButton');
		
		buttonDiv.appendChild(cancelButton);
		buttonDiv.appendChild(confirmButton);
	}
	
	function clearDialog() {
		dialog.innerHTML = '';
		$('#dialogModal').modal('hide');
	}
	
	if(getLoginedUserId() == -1) {
		document.querySelector('#loginSpan').innerHTML = '로그인';
		document.querySelector('#user').setAttribute('href', '../user/login');
	} else {
		document.querySelector('#loginSpan').innerHTML = '프로필';
		document.querySelector('#user').setAttribute('href', '../user/mypage');
	}	
</script>
</body>
</html>