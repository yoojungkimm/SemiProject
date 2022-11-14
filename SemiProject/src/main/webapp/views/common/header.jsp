<%@page import="semi.culture.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%	String path = request.getContextPath();
	Member loginMember = null;
	
	if(session.getAttribute("loginMember")!=null){
		loginMember = (Member)session.getAttribute("loginMember");
	}
%>



<head>
    <meta charset="UTF-8">

    <!-- ========Around ============시작-->
    <!-- SEO Meta Tags-->
    <meta name="description" content="Around - Multipurpose Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, consulting, coworking space, services, creative agency, dashboard, e-commerce, mobile app showcase, multipurpose, product landing, shop, software, ui kit, web studio, landing, html5, css3, javascript, gallery, slider, touch, creative">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
        .page-loading {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            -webkit-transition: all .4s .2s ease-in-out;
            transition: all .4s .2s ease-in-out;
            background-color: #fff;
            opacity: 0;
            visibility: hidden;
            z-index: 9999;
        }
        
        .page-loading.active {
            opacity: 1;
            visibility: visible;
        }
        
        .page-loading-inner {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: opacity .2s ease-in-out;
            transition: opacity .2s ease-in-out;
            opacity: 0;
        }
        
        .page-loading.active>.page-loading-inner {
            opacity: 1;
        }
        
        .page-loading-inner>span {
            display: block;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            font-weight: normal;
            color: #737491;
        }
        /* button 추가 */
        
        .button1 {
            background-color: #9A161F;
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            margin-left: 1100px;
            margin-bottom: 30px;
            margin-top: -100px;
        }
        
        .button2 {
            background-color: #9A161F;
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        /* button 추가 */
        /* div margin 추가 */
        
        .marT {
            margin-top: -30px;
        }
        
        div.mar {
            margin-left: -85px;
        }
        
        div.mar1 {
            margin-left: -45px;
        }
        
        div.mar2 {
            margin-left: -5px;
        }
        
        div.mar3 {
            margin-left: 35px;
        }
        
        div.mar-top {
            margin-top: 150px;
        }
        
        div.mar-top-1 {
            margin-top: 120px;
        }
        
        h5.mar-top {
            margin-top: -10px;
            margin-left: 20px;
        }
        
        p.mar-top {
            margin-top: -10px;
            margin-left: 35px;
        }
        
        .page-spinner {
            display: inline-block;
            width: 2.75rem;
            height: 2.75rem;
            margin-bottom: .75rem;
            vertical-align: text-bottom;
            border: .15em solid #766df4;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner .75s linear infinite;
            animation: spinner .75s linear infinite;
        }
        
        @-webkit-keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
        @keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        section #enroll-container {
            text-align: center;
            color: #9A161F;
        }
        
        section #enroll-container input {
            margin: 20px;
        }
        
        section #enroll-container table {
            margin: 0 auto;
        }
        
        section #enroll-container table th {
            padding: 0 10px;
            text-align: right;
            font-size: x-large;
        }
        
        section #enroll-container table td {
            padding: 0 10px;
            text-align: left;
        }
    </style>
    <!-- Page loading scripts-->
    <script>
        (function() {
            window.onload = function() {
                var preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 2000);
            };
        })();
    </script>
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="<%=path %>/vendor/simplebar/dist/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/vendor/tiny-slider/dist/tiny-slider.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/vendor/flatpickr/dist/flatpickr.min.css" />
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="<%=path %>/css/theme.min.css">



    <!-- =======================around 끝=======================-->

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path %>/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <title>cultureshock</title>
    <script src="https://kit.fontawesome.com/b4c02836de.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>


    <link rel="stylesheet" media="screen" href="<%=path %>/dist/vendor/flatpickr/dist/flatpickr.min.css" />
    <script src="https://kit.fontawesome.com/b4c02836de.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 나의 js 코드 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
     <script>
        function reserveZoneOn() {
            $('#reserveZone').css('display', 'block').addClass('.show');

        }

        // function completeSelect() {

        // }

        function openImage() {
            window.open('https://www.kopis.or.kr/upload/pfmIntroImage/PF_PF194394_220711_0123230.jpg', 'detail', 'width=500px, height=500px')
        }
    </script>

</head>

<body>
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div>
    <!-- ==============헤더시작=============== -->
    <header>
        <nav class="navbar_custom">
            <div class="navbar_logo_custom" style="margin-left: 150px; padding: bottom 80px;">
                <a href="<%=path %>/main2"> 
                    <img src="logo_ver3.svg" class="navbar-brand-logo_custom" style="width:120px; height:120px;">
                </a>

            </div>

            <nav class="navbar_menu_custom" style="margin-bottom:-60px; ">
                <ul class="navbar_menu_custom">
                    <li class="nav-item "><a href="<%=path %>/main2">홈</a></li> 
                    <li class="nav-item "><a href="<%=path %>/musical">뮤지컬</a></li> 
                    <li class="nav-item"><a href="<%=path %>/drama">연극</a></li>
                    <li class="nav-item "><a href="<%=path %>/classic">클래식</a></li>
                    <li class="nav-item "><a href="<%=path %>/korean">국악</a></li>
                    <li class="nav-item dropdown">
                        <a href="#" class="dropdown-toggle" role="button" id="board" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                        <ul class="dropdown-menu" aria-labelledby="board">
                            <li><a class="dropdown-item" href="<%=path %>/notice_list">공지게시판</a></li> 
                            <li><a class="dropdown-item" href="<%=path %>/review_list">리뷰게시판</a></li> 
                            <li><a class="dropdown-item" href="<%=path %>/QnA_list">문의게시판</a></li> 
                        </ul>
                    </li>
                </ul>
            </nav>

            <ul class="navbar_icons_custom " style="margin-top:-60px;">
            	<% if(loginMember != null){ %>
					<li>
						<p class="h5 mt-2"><%=loginMember.getUser_name() %>
							님 반갑습니다
						</p>
					</li>
				<%} else { %>
	                <li>
	                    <a href="<%=path %>/login">
	                        <i class="fa-solid fa-user"></i>
	                    </a>
	                </li>
	                <li>
	                    <a href="<%=path %>/enroll">
	                        <i class="fa-solid fa-user-plus"></i>
	                    </a>
	                </li>
	            <%} %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" role="button" id="myPage" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                    <ul class="dropdown-menu" aria-labelledby="myPage">
                        <li><a class="dropdown-item" href="<%=path %>/myPage">마이페이지 메인</a></li>
                        <li><a class="dropdown-item" href="<%=path %>/Memberupdate">회원정보수정</a></li>
                        <li><a class="dropdown-item" href="<%=path %>/bookCompleteList">예매내역</a></li>
                        <% if(loginMember != null){ %>
                        <li><a class="dropdown-item" href="<%=path %>/logout">로그아웃</a></li>
                        <%} %>
                    </ul>
                </li>

            </ul>

        </nav>




    </header>
    <!-- ===================헤더끝=====================-->


    <body>