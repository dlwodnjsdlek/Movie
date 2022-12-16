<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function coinfirmSubmitAction(movieNum) {
	document.querySelector("#movie_" + movieNum).submit();
}

function getMovieTop() {
	$.ajax({
    	url: 'movie/getMovieTop',
    	dataType: 'json',
    	success: movieTop => {
    	    if(movieTop.length) {
    	        const movieArr = []
    	        $.each(movieTop, (i, movie) => {
    	            movieArr.push(
                			`<div class='carousel-item'>
                           		<div id='movieImg\${movie.movieNum}'>
                           			<a href='../review/\${movie.movieNum}'>
                       					<img src='<c:url value="attach/\${movie.movieImgfileName}"/>' width='120' height='90' />
                           			</a>
                           		</div>
                               	<div>\${movie.movieName}</div>
                             </div>`
    	            )
    	        })
    	        console.log(movieTop)
    	        $('#movies').append(movieArr.join(''))
    	        $('#movies').children(':eq(0)').addClass('active')
    	    } else $('#movies').append(
    	        '<div style="text-align: center"><small>등록된 영화가 없습니다.</small></div>')
    	}
    })
}


function init() {
	getMovieTop()
	
	if(${not empty userId}) {
		$('#user').attr('href', 'user/mypage')
		$('#loginSpan').text('프로필')
	}
}
$(init)
</script>
<style>
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
   color: lightgray;
}

table {
   width: auto;
   text-align: center;
}

[id*='movieImg']{
   width: 120px;
   height: 90px;
   border: 2px solid lightgrey;
   text-align: center;
   margin: 0 auto;
}

[id*='Carousel']{
   width: 170px;
   height: 125px;
   margin: 0 auto;
}
</style>
</head>
<body>
   <header class='container-fulid'>
        <form class='mt-3'>
         <div class='col form-group d-flex justify-content-center align-items-center'>
            <input  class='form-control w-75' type='text' placeholder='검색'/>
            <button type='button' class=" btn ml-3 border" onclick='location.href="movie/01.html"'>
               <i class='fa-solid fa-magnifying-glass'></i>
               <span class='ml-2 d-none d-md-inline'>검색</span>
            </button>
         </div>
      </form>
   </header>
   <div class='container'>
      <hr>
      <div class='ml-2 font-weight-bold'>영화 TOP 5</div>
      <div class='row'>
         <div class='col'>
               <div id='topCarousel' class='carousel slide' data-ride='carousel'>
                  <div class='carousel-inner'>
                     <table class = 'table table-borderless' id='topMv'>
                        <tbody>
                           <tr>
                              <th id='movies'>
                              </th>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <a href='#topCarousel' class='carousel-control-prev' data-slide='prev'>
                     &nbsp;<i class='fa fa-chevron-left' style='color:#000000'></i>
                  </a>
                  <a href='#topCarousel' class='carousel-control-next' data-slide='next'>
                     &nbsp;<i class='fa fa-chevron-right' style='color:#000000'></i>
                  </a>
               </div>
            </div>
         </div>
   	<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='/' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='community/list' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='movie/searchMovie' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='user/login' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>로그인</span>
               	</a>
           	</div>
      	</nav>
   	</div>
</body>
</html>