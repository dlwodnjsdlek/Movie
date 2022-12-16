<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE HTML>
<title>searchMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function getMovies() {
	$.ajax({
    	url: 'getMovies',
    	dataType: 'json',
    	success: movies => {
    	    if(movies.length) {
    	        const movieArr = []
    	        $.each(movies, (i, movie) => {
    	            movieArr.push(
                			`<div id='mo'>
	                			 <div id='m'>
	                   				<div id='movie\${movie.movieNum}'>
	                   					<a href='../../review/\${movie.movieNum}'>
	                   						<img src='<c:url value="/attach/\${movie.movieImgfileName}"/>' width='120' height='120'/>
	                   					</a>
	                   				</div>
		                         </div>
		                         <div id='mName'><small>\${movie.movieName}</small></div>
	                         </div>`
    	            )
    	        })
    	        $('#getList').append(movieArr.join(''))
    	    } else $('#getList').append(
    	        '<div style="text-align: center">등록된 영화가 없습니다.</div>')
    	}
    })
}

function init() {
	getMovies()
	
	if(${not empty userId}) {
		$('#user').attr('href', '../user/mypage')
		$('#loginSpan').text('프로필')
	}
}
$(init)
</script>
<style>
html {
	padding-bottom: 75px;
}

nav {
   background-color: rgb(19, 19, 29);
}

.fa-compass, .fa-user, .fa-house, .fa-comments {
   color:rgb(221, 221, 221);
   font-size:28px;
}

.iconfont {
   font-size: 12px;
   margin-left: 5px;
}

nav a {
	text-decoration: none;
	color: white;
}

#navBar {
	position: fixed;
	bottom: 0;
	width: 100%;
}

#mo {
	float: left;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
	margin-bottom: 5px;
}

#m {
   width: 120px;
   height: 120px;
   border: 2px solid lightgrey;
   text-align: center;
}

#mName {
	width: 120px;
	text-align: center;
}
</style>
<body>
	<div>
		<form class='mt-3'>
			<div class='col form-group d-flex justify-content-center align-items-center'>
				<input  class='form-control w-75' type='text' placeholder='검색'/>
				<button class=" btn ml-3 border">
					<i class='fa-solid fa-magnifying-glass'></i>
					<span class='ml-2 d-none d-md-inline'>검색</span>
				</button>
			</div>
		</form>
		<hr>
		<div style='margin-left: 10px;'>영화</div>
		<div class='container-fluid' style='padding-bottom: 50px;'>
			<div id='getList'></div>
		</div>
		<div id='navBar'>
	       	<nav class='row' style='padding-top: 0.5rem;'>
	            <div class='col text-center'>
	               	<a id='goHome' href='/' class='ml-1'>
	                  	<i class='fa-solid fa-house fa-xl'></i><br>
	                  	<span class='iconfont mr-1'>홈</span>
	               	</a>
	            </div>
	            <div class='col text-center'>
	               	<a id='community' href='../community/list' class='ml-1'>
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
	</div>
</body>