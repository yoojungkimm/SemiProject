<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.show.model.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%
    	List<ShowDetail> searchList = (List<ShowDetail>)request.getAttribute("Searchlist");
   		 List<ShowDetail> listRank=(List<ShowDetail>)request.getAttribute("listRank");
    %>
    
<%@include file="/views/common/header.jsp"%>
    <!-- 검색 -->
   <form class="container position-relative zindex-5"
	 action="<%=path%>/dramaSearch"
	method="get">
	<div
		class="d-lg-flex align-items-center bg-white border rounded-3 px-6 pt-3 pb-1">
		<div class="d-sm-flex align-items-center flex-grow-1">
			<div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
				<label class="form-label" for="from-destination">공연 이름</label> <input
					class="form-control me-3" name="prfnmValue" type="text">
			</div>

			<div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
				<label class="form-label" for="to-destination">출연진</label> 
				<input class="form-control me-3" name="prfcastValue" type="text">
			</div>

			<div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
				<label class="form-label" for="from-destination">지역</label> <select
					class="form-select" name="adresValue" id="from-destination">
					<option value="" disabled hidden>From where?</option>
					<option value="" selected></option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="춘천">춘천</option>
					<option value="부산">부산</option>
					<option value="춘천">춘천</option>
					<!-- <option value="Monaco, MON">Monaco, MON</option>
                    <option value="Moscow, RU">Moscow, RU</option>
                    <option value="Stockholm, SW">Stockholm, SW</option> -->
				</select>
			</div>
		</div>

		<div class="d-sm-flex align-items-center">
			<div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
				<label class="form-label">날짜</label>
				<div class="input-group">
					<input class="form-control rounded date-picker" name="dateValue"
						type="text" placeholder="Choose date"
						data-datepicker-options="{ &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y.m.d&quot;, &quot;defaultDate&quot;: &quot;today&quot;, &quot;minDate&quot;: &quot;today&quot;}"
						data-linked-input="#return-date"><i
						class="ai-calendar align-middle position-absolute top-50 end-0 translate-middle-y me-3"></i>
				</div>
			</div>

			<div class="text-center text-sm-start mt-2 mt-sm-4 mb-4">
				<button class="btn btn-primary-1 " type="submit">
					<i class="ai-search fs-xl-1 me-1 "></i>
				</button>
			</div>

		</div>
	</div>
</form>

    <!-- 검색결과 시작 -->
    <div class="container py-4 mb-2 mb-sm-0 pb-sm-5">
        <div class="row justify-content-center">
            <div class="col-lg-11">
                <nav aria-label="breadcrumb">
                    <!-- <ol class="py-1 my-2 breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Blog</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">List no sidebar</li>
                    </ol> -->
                </nav>
                </br>
                </br>
                <h2 class="mb-5">검색결과</h2>
                <hr style="border: solid 1px; color : #9A161F;">
                <!-- Post-->
                <div class="row">
                    <!-- Content left -->
                    <div class="col-lg-6 ">
                        <!-- Post-->
                         <%for(int i=searchList.size()/2; i<searchList.size(); i++) {%>
                         
                       
                      <article class="card card-horizontal card-hover mb-grid-gutter ">
                            <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=searchList.get(i).getPrfid()%>" style="background-image: url(<%=searchList.get(i).getPoster() %>);"></a>
                            <div class="card-body">
                                <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%= searchList.get(i).getPrfnm() %></a></h2>
                                <p class="mb-0 fs-sm text"> <%= searchList.get(i).getPrfruntime() %> | <%= searchList.get(i).getPrfage()%></br>
                                    출연 : <%=searchList.get(i).getPrfcast() %>
                                </p>
                            </div>
                        </article>
                        
                      
                       <%} %>
                     
                   
                    </div>
                    
                    
                    <!-- Content right -->
                    <div class="col-lg-6 ">
                        <!-- Post-->
                           <%for(int i=0; i<searchList.size()/2; i++) {%>
                         
                       
                       <article class="card card-horizontal card-hover mb-grid-gutter ">
                            <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=searchList.get(i).getPrfid()%>" style="background-image: url(<%=searchList.get(i).getPoster() %>);"></a>
                            <div class="card-body">
                                <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%= searchList.get(i).getPrfnm() %></a></h2>
                                <p class="mb-0 fs-sm text"> <%= searchList.get(i).getPrfruntime() %> | <%= searchList.get(i).getPrfage()%></br>
                                    출연 : <%=searchList.get(i).getPrfcast() %>
                                </p>
                            </div>
                        </article>
                        
                   
                        
                       <%} %>
                        
                       
                       
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--검색결과 끝-->

    <!--추천목록 시작-->

    <!-- Page content-->
    <div class="container py-4 mb-20 mb-sm-0 pb-sm-10" style="margin-top:-70px;">
        <nav aria-label="breadcrumb">
        </nav>
        <h2 class="mb-5">추천목록</h2>
        <hr style="border: solid 1px; color : #9A161F;">
        <!-- Blog grid-->
        <div class="masonry-grid overflow-hidden" data-columns="5">
            <!-- Post-->
            <div class="masonry-grid-item">
                <article class="card card-hover">
                    <a class="card-img-top" href="blog-single-rs.html"><img src="img/blog/shin.jpg" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="blog-single-rs.html">신바람 삼대</a></h2>
                        <a class="meta-link fs-sm mb-2" href="#">2020.12.10 ~ 2022.08.31</a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="https://map.kakao.com/?urlX=500684.0&urlY=1134149.0&name=%EB%8C%80%ED%95%99%EB%A1%9C+%EC%95%84%ED%8A%B8%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8+2%EA%B4%80">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold ">아트포레스트 2관</span></div>
                        </a>
                    </div>
                </article>
            </div>
            <!-- Post-->
            <div class="masonry-grid-item">
                <article class="card card-hover">
                    <a class="card-img-top" href="blog-single-rs.html"><img src="img/blog/hang.jpg" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="blog-single-rs.html">행오버</a></h2>
                        <a class="meta-link fs-sm mb-2" href="#">2022.01.21 ~ 2022.07.31</a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="https://map.kakao.com/?urlX=500876.0&urlY=1133736.0&name=%EC%A0%95%EA%B7%B9%EC%9E%A5">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold ">정극장</span></div>
                        </a>
                    </div>
                </article>
            </div>
            <!-- Post-->
            <div class="masonry-grid-item">
                <article class="card card-hover">
                    <a class="card-img-top" href="blog-single-rs.html"><img src="img/blog/yeon.jpg" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="blog-single-rs.html">연애하기 좋은 날</a></h2>
                        <a class="meta-link fs-sm mb-2" href="#">2022.07.09 ~ 2022.09.25</a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="https://map.kakao.com/?urlX=501139.0&urlY=1133244.0&name=%EC%9A%B0%EB%A6%AC%EC%86%8C%EA%B7%B9%EC%9E%A5">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold ">우리소극장</span></div>
                        </a>
                    </div>
                </article>
            </div>
            <!-- Post-->
            <div class="masonry-grid-item">
                <article class="card card-hover">
                    <a class="card-img-top" href="blog-single-rs.html"><img src="img/blog/chung.jpg" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="blog-single-rs.html">청년 윤봉길</a></h2>
                        <a class="meta-link fs-sm mb-2" href="#">2022.07.21 ~ 2022.07.24</a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="https://map.naver.com/v5/entry/place/11621559?c=14138771.1581117,4506020.1154957,13,0,0,0,dh&placePath=%2Fhome&entry=plt">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold ">예술의전당 토월극장</span></div>
                        </a>
                    </div>
                </article>
            </div>
            <!-- Post-->
            <div class="masonry-grid-item">
                <article class="card card-hover">
                    <a class="card-img-top" href="blog-single-rs.html"><img src="img/blog/sa.jpg" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="blog-single-rs.html">사춘기 메들리</a></h2>
                        <a class="meta-link fs-sm mb-2" href="#">2022.07.09 ~ 2022.09.25</a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="https://map.kakao.com/?urlX=501139.0&urlY=1133244.0&name=%EC%9A%B0%EB%A6%AC%EC%86%8C%EA%B7%B9%EC%9E%A5">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold ">우리소극장</span></div>
                        </a>
                    </div>
                </article>
            </div>

        </div>
    </div>

    </nav>
    
    <%@include file="/views/common/footer.jsp"%>