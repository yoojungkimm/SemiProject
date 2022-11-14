<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/views/common/header.jsp"%>
   
  <!-- 슬라이드 시작 -->
        <section class="position-relative foot_custom height-2" style="margin-left: -150px;">
            <!-- 검색창 시작-->
            <div class="container pt-1 pb-4" style="padding-left:175px;">
                <div class="row justify-content-center pt-4">
                    <div class="col-lg-7 ">
                        <form class="input-group">
                            <input class="form-control" type="text" required>
                            <button class="btn btn-primary-3 " type="submit"><i class="ai-search fs-xl-1 me-1"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 검색창 끝-->
            <div class="container pb-5">

                <section class="position-relative  pt-6 pb-7">

                </section>
                <div class="position-relative zindex-5 container" style="margin-top: -150px;">

                    <div class="tns-carousel-wrapper ">

                        <div class="tns-carousel-inner width-1 " data-carousel-options="{&quot;items&quot;: 2, &quot;nav&quot;: false, &quot;gutter&quot;: 23, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;800&quot;:{&quot;items&quot;:1}}}">
                            <div class="pb-2  ">
                                <div class=" height-1 color-1"><span class="badge badge-lg badge-floating bg-success">New</span>
                                    <div class="card-body py-5 px-4">
                                        <div class="d-sm-flex py-sm-4 px-lg-3">
                                            <!-- 글, 사진 넣을 공간-->
                                            <div class='container-1' style="padding-right:160px;">
                                                <img style="margin-top :-40px; margin-right:-20px; " src="img/img/poster.png" alt="지킬엔하이드">
                                                <span style="position:absolute; margin-top:-20px; padding-left:50px;  font-size: 2.7em; font: bold;  color:  white; ">지킬앤하이드 </span>

                                                <span style="position:absolute;  margin-left:20px; bottom: 300px;  font-size: 1.5em;   color:  white; ">2022.07.01(금)~08.14(일) </span>
                                                <button style="position:absolute;  margin-left:45px; bottom: 200px;" type="button" class="btn btn-outline-light button-2">자세히보기</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="pb-2  ">
                                <div class=" height-1 color-1"><span class="badge badge-lg badge-floating bg-success">New</span>
                                    <div class="card-body py-5 px-4">
                                        <div class="d-sm-flex py-sm-4 px-lg-3">
                                            <!-- 글, 사진 넣을 공간-->
                                            <div class='container-1'>
                                                <img style="margin-top :-20px; margin-right:-20px; " src="img/img/poster1.png" alt="손그림">
                                                <span style="position:absolute; margin-top:-10px; padding-left:140px;  font-size: 2.7em; font: bold;  color:  white; ">손 </span>
                                                <span style="position:absolute;  margin-left:20px; bottom: 300px;  font-size: 1.5em;   color:  white; ">2022.07.01(금)~08.14(일) </span>
                                                <button style="position:absolute; margin-left:60px; bottom: 200px;" type="button" class="btn btn-outline-light button-2">자세히보기</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="pb-2  ">
                                <div class=" height-1 color-1"><span class="badge badge-lg badge-floating bg-success">New</span>
                                    <div class="card-body py-5 px-4">
                                        <div class="d-sm-flex py-sm-4 px-lg-3">
                                            <!-- 글, 사진 넣을 공간-->
                                            <div class='container-1'>
                                                <img style="margin-top: -20px; margin-right:-20px; " src="img/img/poster2.png" alt="">
                                                <span style="position:absolute;  margin-top:-10px; padding-left:90px;  font-size: 2.7em; font: bold;  color:  white; ">EQUAL </span>
                                                <span style="position:absolute;  margin-left:20px; bottom: 300px;  font-size: 1.5em;   color:  white; ">2022.07.01(금)~08.14(일) </span>
                                                <button style="position:absolute; margin-left:60px; bottom: 200px;" type="button" class="btn btn-outline-light button-2">자세히보기</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </section>


        <!-- 슬라이드 끝 -->


        <!-- 랭킹시작-->

        <div class="container mt-10 p-7">
            <div class=" text-center">
                <p class="h1 mb-5 fs-1 ml-4" style=" color: #9A161F;">랭킹</p>

            </div>
            <div class="masonry-filterable">


                <!-- Filters -->
                <ul class="masonry-filters nav nav-tabs justify-content-center pb-4" style="color:#9A161F;">
                    <li class="nav-item">
                        <a class="nav-link active" href="#" data-group="all" style="color:#9A161F;">전체 랭킹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="musical" style="color:#9A161F;">뮤지컬</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="theater" style="color:#9A161F;">연극</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="classic" style="color:#9A161F;">클래식</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="korean" style="color:#9A161F;">국악</a>
                    </li>
                </ul>

                <!-- Grid -->
                <div class="masonry-grid" data-columns="4">

                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["musical"]'>

                        <!-- Image on top -->
                        <div class="card cardSize mar">
                            <img src="./resources/caliburn_2.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">베토벤</h5>
                                <p class="card-text fs-sm">예매일시: 2022.05.30<br> 티켓가격: 30000원 <br>공연장소: 충무 아트홀 <br>주연배우: 김홍동</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["musical"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar1">
                            <img src="./resources/caliburn_7.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">나의 투쟁</h5>
                                <p class="card-text fs-sm">예매일시: 2022.05.30<br> 티켓가격: 30000원 <br>공연장소: 충무 아트홀 <br>주연배우: 김홍동</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["musical"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar2">
                            <img src="./resources/caliburn_8.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">나는 고양이로소이다</h5>
                                <p class="card-text fs-sm">예매일시: 2022.05.30<br> 티켓가격: 30000원 <br>공연장소: 충무 아트홀 <br>주연배우: 김홍동</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>

                    <div class="masonry-grid-item" data-groups='["musical"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar3">
                            <img src="./resources/caliburn_15.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">나는 고양이로소이다</h5>
                                <p class="card-text fs-sm">예매일시: 2022.05.30<br> 티켓가격: 30000원 <br>공연장소: 충무 아트홀 <br>주연배우: 김홍동</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["theater"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar">
                            <img src="./resources/caliburn_5.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">옥상달빛</h5>
                                <p class="card-text fs-sm">예매일시: 2021.10.30<br> 티켓가격: 20000원 <br>공연장소: 소공동 소극장 <br>주연배우: 차유나</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["theater"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar1">
                            <img src="./resources/caliburn_7.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">옥상달빛</h5>
                                <p class="card-text fs-sm">예매일시: 2021.10.30<br> 티켓가격: 20000원 <br>공연장소: 소공동 소극장 <br>주연배우: 차유나</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["theater"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar2">
                            <img src="./resources/caliburn_6.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">옥상달빛</h5>
                                <p class="card-text fs-sm">예매일시: 2021.10.30<br> 티켓가격: 20000원 <br>공연장소: 소공동 소극장 <br>주연배우: 차유나</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["theater"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar3">
                            <img src="./resources/caliburn_4.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">옥상달빛</h5>
                                <p class="card-text fs-sm">예매일시: 2021.10.30<br> 티켓가격: 20000원 <br>공연장소: 소공동 소극장 <br>주연배우: 차유나</p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["classic"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar">
                            <img src="./resources/caliburn_14.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">베니스의 상인</h5>
                                <p class="card-text fs-sm">고전은 영원하다. 이 말을 체감하고 온 시간이었습니다. 수천번 수만번 아니 수조억번 무대에 올랐을 작품. 기대감을 뛰어넘은 정말 좋은 공연이었습니다. 연기도 너무너무 좋았어요 </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["classic"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar1">
                            <img src="./resources/caliburn_13.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">베니스의 상인</h5>
                                <p class="card-text fs-sm">고전은 영원하다. 이 말을 체감하고 온 시간이었습니다. 수천번 수만번 아니 수조억번 무대에 올랐을 작품. 기대감을 뛰어넘은 정말 좋은 공연이었습니다. 연기도 너무너무 좋았어요 </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["classic"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar2">
                            <img src="./resources/caliburn_12.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">베니스의 상인</h5>
                                <p class="card-text fs-sm">고전은 영원하다. 이 말을 체감하고 온 시간이었습니다. 수천번 수만번 아니 수조억번 무대에 올랐을 작품. 기대감을 뛰어넘은 정말 좋은 공연이었습니다. 연기도 너무너무 좋았어요 </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["classic"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar3">
                            <img src="./resources/caliburn_11.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">베니스의 상인</h5>
                                <p class="card-text fs-sm">고전은 영원하다. 이 말을 체감하고 온 시간이었습니다. 수천번 수만번 아니 수조억번 무대에 올랐을 작품. 기대감을 뛰어넘은 정말 좋은 공연이었습니다. 연기도 너무너무 좋았어요 </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["korean"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar">
                            <img src="./resources/caliburn_1.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">Orchestra Inside 호르니스트 김홍박</h5>
                                <p class="card-text fs-sm">개요: 클래식 > 클래식 80분<br> 기간: 2022.07.20. (수)<br> 시간: 수 19:30<br> 장소: 신영체임버홀
                                </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["korean"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar1">
                            <img src="./resources/caliburn_10.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">Orchestra Inside 호르니스트 김홍박</h5>
                                <p class="card-text fs-sm">개요: 클래식 > 클래식 80분<br> 기간: 2022.07.20. (수)<br> 시간: 수 19:30<br> 장소: 신영체임버홀
                                </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["korean"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar2">
                            <img src="./resources/caliburn_9.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">Orchestra Inside 호르니스트 김홍박</h5>
                                <p class="card-text fs-sm">개요: 클래식 > 클래식 80분<br> 기간: 2022.07.20. (수)<br> 시간: 수 19:30<br> 장소: 신영체임버홀
                                </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["korean"]'>
                        <!-- Image on top -->
                        <div class="card cardSize mar3">
                            <img src="./resources/caliburn_8.svg" class="card-img-top imgSize" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">Orchestra Inside 호르니스트 김홍박</h5>
                                <p class="card-text fs-sm">개요: 클래식 > 클래식 80분<br> 기간: 2022.07.20. (수)<br> 시간: 수 19:30<br> 장소: 신영체임버홀
                                </p>
                                <a href="#" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
                            </div>
                        </div>
                    </div>

                    <!-- More items... -->
                </div>
            </div>
        </div>
        <!-- 랭킹 끝-->

        <!-- 지역별 랭킹 시작 -->


        <div style="margin-top:-110px;">
            <div class="container mt-5 p-10">
                <p class="h1 mb-3 fs-1 " style="padding-bottom: -4; margin-left: 230px; color: #9A161F;">지역별 랭킹</p>
                <div class="d-flex align-items-start">
                    <div class="nav flex-column nav-pills  me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <button class="nav-link  active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">서울</button>
                        <button class="nav-link " id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">경기</button>
                        <button class="nav-link " id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">대구/부산/경북/경남</button>
                        <button class="nav-link " id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">대전/전라/전남/전북</button>
                    </div>
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active tabSize" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <div class="card-1 cardSize-1">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-1 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade tabSize" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <div class="card-1 cardSize-1">
                                <img src="img/img/poster.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-1 ">
                                <img src="img/img/poster.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade tabSize" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <div class="card-1 cardSize-1">
                                <img src="img/img/poster2.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster2.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-1 ">
                                <img src="img/img/poster2.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster2.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade tabSize" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <div class="card-1 cardSize-1">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-1 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                            <div class="card-1 cardSize-2 ">
                                <img src="img/img/poster1.png" class="imgSize-1 " alt="Card image">

                                <div class="card-body">
                                    <h5 class="card-title mar-top">베니스의 상인</h5>
                                    <p class="card-text fs-sm mar-top">2022-07-23 </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 지역별 랭킹 끝 -->

        <!-- 관람 후기-->
        <div class="space-1" style="width: 35%; display:inline-block; ">
            <p class="h1 mb-3 fs-1 " style=" margin-left: 260px; color: #9A161F;">관람 후기
                <a href="review_list.html">
                    <svg style=" margin-left:170px;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg>
                </a>
            </p>

            <!-- Events-->                        
            </section>
            <div class="position-relative zindex-5 container">
                <div class="tns-carousel-wrapper">
                    <div class="pb-2">
                        <div class="card h-100 border-0 shadow mx-1">
                            <div class="card-body py-1 px-4" style="padding: bottom 3rem; ">
                                <div class="d-sm-flex py-sm-2 px-lg-3">
                                    <div class="text-sm-center mt-0 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3" style="font-size: 3.75rem; color: #9A161F;">★</span><span class="fs-xl text-muted text-uppercase">9.8</span></div>
                                    <h3 class="h4 nav-heading mb-4"><a href="#" style="font-size: 1rem;">1인 3역, 진혜원 배우님은 1인 5역 호! 찢었다! 원래 이렇게 랩도잘하고 춤도 잘추고 피아노도 잘치고</a></h3>
                                    <a class="d-flex meta-link fs-sm align-items-center pt-2" href="#"><img class="rounded-circle" src="신바람삼대.jpg" alt="Charlie Welch" width="42">
                                        <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1">정통 코믹 체력극<신바람 삼대>
                                        </span></div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-2">
                    <div class="card h-100 border-0 shadow mx-1">
                        <div class="card-body py-1 px-4">
                            <div class="d-sm-flex py-sm-2 px-lg-3">
                                <div class="text-sm-center mt-0 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3" style="font-size: 3.75rem; color: #9A161F;">★</span><span class="fs-xl text-muted text-uppercase">9.6</span></div>
                                <h3 class="h4 nav-heading mb-4"><a href="#" style="font-size: 1rem;">처음에 예매를 할때는 별 생각없이 예매했다. 주식? 제3세계? 모두 다 흥미로운 주제이고, 지금 전 세계적으로...</a></h3>
                                <a class="d-flex meta-link fs-sm align-items-center pt-2" href="#"><img class="rounded-circle" src="보이지 않는 손.jpg" alt="Charlie Welch" width="42">
                                    <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1">연극 <보이지 않는 손> : 연극열전...</span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-2">
                    <div class="card h-100 border-0 shadow mx-1">
                        <div class="card-body py-1 px-4">
                            <div class="d-sm-flex py-sm-2 px-lg-3">
                                <div class="text-sm-center mt-0 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3" style="font-size: 3.75rem; color: #9A161F;">★</span><span class="fs-xl text-muted text-uppercase">9.6</span></div>
                                <h3 class="h4 nav-heading mb-4"><a href="#" style="font-size: 1rem;">처음에 예매를 할때는 별 생각없이 예매했다. 주식? 제3세계? 모두 다 흥미로운 주제이고, 지금 전 세계적으로...</a></h3>
                                <a class="d-flex meta-link fs-sm align-items-center pt-2" href="#"><img class="rounded-circle" src="보이지 않는 손.jpg" alt="Charlie Welch" width="42">
                                    <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1">연극 <보이지 않는 손> : 연극열전...</span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-2">
                    <div class="card h-100 border-0 shadow mx-1">
                        <div class="card-body py-1 px-4" style="padding: bottom 3rem; ">
                            <div class="d-sm-flex py-sm-2 px-lg-3">
                                <div class="text-sm-center mt-0 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3" style="font-size: 3.75rem; color: #9A161F;">★</span><span class="fs-xl text-muted text-uppercase">9.8</span></div>
                                <h3 class="h4 nav-heading mb-4"><a href="#" style="font-size: 1rem;">1인 3역, 진혜원 배우님은 1인 5역 호! 찢었다! 원래 이렇게 랩도잘하고 춤도 잘추고 피아노도 잘치고</a></h3>
                                <a class="d-flex meta-link fs-sm align-items-center pt-2" href="#"><img class="rounded-circle" src="신바람삼대.jpg" alt="Charlie Welch" width="42">
                                    <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1">정통 코믹 체력극<신바람 삼대>
                                    </span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-2">
                    <div class="card h-100 border-0 shadow mx-1">
                        <div class="card-body py-1 px-4" style="padding: bottom 3rem; ">
                            <div class="d-sm-flex py-sm-2 px-lg-3">
                                <div class="text-sm-center mt-0 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3" style="font-size: 3.75rem; color: #9A161F;">★</span><span class="fs-xl text-muted text-uppercase">9.8</span></div>
                                <h3 class="h4 nav-heading mb-4"><a href="#" style="font-size: 1rem;">1인 3역, 진혜원 배우님은 1인 5역 호! 찢었다! 원래 이렇게 랩도잘하고 춤도 잘추고 피아노도 잘치고</a></h3>
                                <a class="d-flex meta-link fs-sm align-items-center pt-2" href="#"><img class="rounded-circle" src="신바람삼대.jpg" alt="Charlie Welch" width="42">
                                    <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1">정통 코믹 체력극<신바람 삼대>
                                    </span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 공지사항, 자주하는질문 시작 -->
        <div class="container mb-7 mar-top-1 ">

            <div class="row justify-content-center">
                <div class="col-lg-6" style="margin-left:-300px">
                    <div class="text-center p-2" style="margin-left:210px;">
                        <p class="h1 mb-3 fs-1 " style="  color: #9A161F;">공지사항
                            <a href="notice_list.html">
                                <svg style=" margin-left:160px;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                      </svg>
                            </a>
                        </p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group ">
                        <a href="# " class="list-group-item list-group-item-action ">8월 공연 업데이트</a>
                        <a href="# " class="list-group-item list-group-item-action ">서버 정상화 안내</a>
                        <a href="# " class="list-group-item list-group-item-action ">문화 행사 '조수미와 함께하는 밤의 아리아' 신청 안내</a>
                        <a href="# " class="list-group-item list-group-item-action " tabindex="-1 " aria-disabled="true ">7월 추가 공연 업데이트</a>
                        <a href="# " class="list-group-item list-group-item-action ">예매 서비스 런칭</a>
                        <a href="# " class="list-group-item list-group-item-action ">5월 가정의 달 공연</a>
                    </div>
                </div>
                <div class="col-lg-6 " style="margin-right:-350px">
                    <div class="text-center p-2 " style="margin-left:140px">
                        <p class="h1 mb-3 fs-1 " style="padding-bottom: -4;  color: #9A161F;">자주하는 질문
                            <a href="QnA_list.html">
                                <svg style=" margin-left:160px;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                              </svg>
                            </a>
                        </p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group ">
                        <a href="# " class="list-group-item list-group-item-action ">주소를 바꿨는데 그쪽으로 계속 우편물이 간다고 합니다</a>
                        <a href="# " class="list-group-item list-group-item-action ">조수미와 함께하는 밤의 아리아 행사에 대해서 문의드립니다</a>
                        <a href="# " class="list-group-item list-group-item-action "> 사이트에 광고 가능한가요?</a>
                        <a href="# " class="list-group-item list-group-item-action " tabindex="-1 ">소극장 공연 정보도 업데이트 되나요?</a>
                        <a href="# " class="list-group-item list-group-item-action ">연기된 이문세 공연 언제쯤..</a>
                        <a href="# " class="list-group-item list-group-item-action ">소극장 저예산 작품 홍보 </a>
                    </div>
                </div>

            </div>
        </div>
    </body>



    <br><br><br><br>

<%@include file="/views/common/footer.jsp"%>