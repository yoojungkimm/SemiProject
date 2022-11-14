<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.show.model.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/common/header.jsp"%>
<%
    	List<ShowDetail> listAll = (List<ShowDetail>)request.getAttribute("listAll");
    	List<ShowDetail> listRank=(List<ShowDetail>)request.getAttribute("listRank");
    %>


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
<!-- 검색 끝 -->
<!-- 인기목록 시작-->
<section class="container py-5 my-4 my-sm-0 py-sm-6 py-md-7">
	<h1 class="text-center mb-4">WHAT'S HOT</h1>
	<div class="tns-carousel-wrapper">
		<div class="tns-carousel-progress ms-auto mb-3">
			<div class="text-sm text-muted text-center mb-2">
				<span class="tns-current-slide me-1"></span><span
					class="tns-total-slides ms-1"></span>
			</div>
			<div class="progress">
				<div class="progress-bar" role="progressbar"></div>
			</div>
		</div>
		<div class="tns-carousel-inner"
			data-carousel-options="{&quot;items&quot;: 3, &quot;nav&quot;: false, &quot;gutter&quot;: 23, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;540&quot;:{&quot;items&quot;:2},&quot;900&quot;:{&quot;items&quot;:3}}}">

			<div class="pb-2">
				<a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(0).getPrfid() %>">
					<div class="card-img-top card-img-gradient">
						<img src="<%= listRank.get(0).getPoster()%>" alt="Burano"><span
							class="card-floating-text text-light fw-medium">자세히 보기<i
							class="ai-chevron-right align-middle fs-lg ms-1"></i></span>
					</div>
					<div class="card-body text-center">
						<h3 class="h5 pt-1 mb-3"><%= listRank.get(0).getPrfnm()%></h3>
						<p class="fs-sm text-muted mb-2"><%= listRank.get(0).getPrfpdfrom() %>~<%= listRank.get(0).getPrfpdto() %></p>
					</div>
				</a>
			</div>

			<div class="pb-2">
				<a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(1).getPrfid() %>">
					<div class="card-img-top card-img-gradient">
						<img src="<%= listRank.get(1).getPoster()%>" alt="Burano"><span
							class="card-floating-text text-light fw-medium">자세히 보기<i
							class="ai-chevron-right align-middle fs-lg ms-1"></i></span>
					</div>
					<div class="card-body text-center">
						<h3 class="h5 pt-1 mb-3"><%= listRank.get(1).getPrfnm()%></h3>
						<p class="fs-sm text-muted mb-2"><%= listRank.get(1).getPrfpdfrom() %>~<%= listRank.get(1).getPrfpdto() %></p>
					</div>
				</a>
			</div>


			<div class="pb-2">
				<a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(5).getPrfid() %>">
					<div class="card-img-top card-img-gradient">
						<img src="<%= listRank.get(5).getPoster()%>" alt="Burano"><span
							class="card-floating-text text-light fw-medium">자세히 보기<i
							class="ai-chevron-right align-middle fs-lg ms-1"></i></span>
					</div>
					<div class="card-body text-center">
						<h3 class="h5 pt-1 mb-3"><%= listRank.get(5).getPrfnm()%></h3>
						<p class="fs-sm text-muted mb-2"><%= listRank.get(5).getPrfpdfrom() %>~<%= listRank.get(5).getPrfpdto() %></p>
					</div>
				</a>
			</div>

			<div class="pb-2">
				<a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(4).getPrfid() %>">
					<div class="card-img-top card-img-gradient">
						<img src="<%= listRank.get(4).getPoster()%>" alt="Burano"><span
							class="card-floating-text text-light fw-medium">자세히 보기<i
							class="ai-chevron-right align-middle fs-lg ms-1"></i></span>
					</div>
					<div class="card-body text-center">
						<h3 class="h5 pt-1 mb-3"><%= listRank.get(4).getPrfnm()%></h3>
						<p class="fs-sm text-muted mb-2"><%= listRank.get(4).getPrfpdfrom() %>~<%= listRank.get(4).getPrfpdto() %></p>
					</div>
				</a>
			</div>

			<div class="pb-2">
				<a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(3).getPrfid() %>">
					<div class="card-img-top card-img-gradient">
						<img src="<%= listRank.get(3).getPoster()%>" alt="Burano"><span
							class="card-floating-text text-light fw-medium">자세히 보기<i
							class="ai-chevron-right align-middle fs-lg ms-1"></i></span>
					</div>
					<div class="card-body text-center">
						<h3 class="h5 pt-1 mb-3"><%= listRank.get(3).getPrfnm()%></h3>
						<p class="fs-sm text-muted mb-2"><%= listRank.get(3).getPrfpdfrom() %>~<%= listRank.get(3).getPrfpdto() %></p>
					</div>
				</a>
			</div>

		</div>
	</div>
</section>
<!-- 인기목록 끝 -->

<main class="page-wrapper">


	<!-- Page content-->
	<!-- <div class="is-sidebar"> -->
	<div class="sidebar-enabled">
		<div class="container">
			<div class="row">
				<!-- Sidebar-->
				<div class="sidebar col-lg-3 pt-lg-5">
					<div class="offcanvas offcanvas-collapse" id="blog-sidebar">
						<div class="offcanvas-header navbar-shadow px-4 mb-3">
							<h5 class="mt-1 mb-0">Sidebar</h5>
							<button class="btn-close lead" type="button"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>
						<div
							class="offcanvas-body px-4 pt-3 pt-lg-0 ps-lg-0 pe-lg-2 pe-xl-4"
							data-simplebar>

							<!-- Categories-->
							<div class="widget widget-categories mb-5">
								<h3 class="widget-title">인기순위</h3>
								<ul>
									<li><a class="widget-link" href="<%=path %>/showSelect?prfid=<%=listRank.get(0).getPrfid() %>"><%= listRank.get(0).getPrfnm()%><small
											class="text-muted ps-1 ms-2">23</small></a></li>
									<li><a class="widget-link" href="<%=path %>/showSelect?prfid=<%=listRank.get(1).getPrfid() %>"><%= listRank.get(1).getPrfnm()%><small
											class="text-muted ps-1 ms-2">14</small></a></li>
									<li><a class="widget-link" href="<%=path %>/showSelect?prfid=<%=listRank.get(2).getPrfid() %>"><%= listRank.get(2).getPrfnm()%><small
											class="text-muted ps-1 ms-2">7</small></a></li>
									<li><a class="widget-link" href="<%=path %>/showSelect?prfid=<%=listRank.get(3).getPrfid() %>"><%= listRank.get(3).getPrfnm()%><small
											class="text-muted ps-1 ms-2">19</small></a></li>
									<li><a class="widget-link" href="<%=path %>/showSelect?prfid=<%=listRank.get(4).getPrfid() %>"><%= listRank.get(4).getPrfnm()%><small
											class="text-muted ps-1 ms-2">35</small></a></li>
								</ul>
							</div>
							<!-- Featured posts-->
							<div class="widget mt-n1 mb-5">
								<h3 class="widget-title pb-1">Trending posts</h3>
								<div class="d-flex align-items-center pb-1 mb-3">
									<a class="d-block flex-shrink-0" href="<%=path %>/showSelect?prfid=<%=listAll.get(0).getPrfid() %>"><img
										class="rounded" src="<%=listAll.get(0).getPoster() %>"
										alt="Post" width="64"></a>
									<div class="ps-2 ms-1">
										<h4 class="fs-md nav-heading mb-1">
											<a class="fw-medium" href="<%=path %>/showSelect?prfid=<%=listAll.get(0).getPrfid() %>"><%=listAll.get(0).getPrfnm() %></a>
										</h4>
										<p class="fs-xs text-muted mb-0"><%=listAll.get(0).getPrfage() %></p>
									</div>
								</div>
								<div class="d-flex align-items-center pb-1 mb-3">
									<a class="d-block flex-shrink-0" href="<%=path %>/showSelect?prfid=<%=listAll.get(1).getPrfid() %>"><img
										class="rounded" src="<%=listAll.get(1).getPoster() %>"
										alt="Post" width="64"></a>
									<div class="ps-2 ms-1">
										<h4 class="fs-md nav-heading mb-1">
											<a class="fw-medium" href="<%=path %>/showSelect?prfid=<%=listAll.get(1).getPrfid() %>"><%=listAll.get(1).getPrfnm() %></a>
										</h4>
										<p class="fs-xs text-muted mb-0">전체이용가</p>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<a class="d-block flex-shrink-0" href="<%=path %>/showSelect?prfid=<%=listAll.get(2).getPrfid() %>"><img
										class="rounded" src="<%=listAll.get(2).getPoster() %>"
										alt="Post" width="64"></a>
									<div class="ps-2 ms-1">
										<h4 class="fs-md nav-heading mb-1">
											<a class="fw-medium" href="<%=path %>/showSelect?prfid=<%=listAll.get(2).getPrfid() %>"><%=listAll.get(2).getPrfnm() %></a>
										</h4>
										<p class="fs-xs text-muted mb-0"><%=listAll.get(2).getPrfage() %></p>
									</div>
								</div>
							</div>
							<!-- Tag cloud-->
							<div class="widget mb-5">
								<h3 class="widget-title pb-1">Popular btn-tags</h3>
								<a class="btn-tag me-2 mb-2" href="#">#어린이</a><a
									class="btn-tag me-2 mb-2" href="#">#웃음</a><a
									class="btn-tag me-2 mb-2" href="#">#성인</a><a
									class="btn-tag me-2 mb-2" href="#">#실화</a> <a
									class="btn-tag me-2 mb-2" href="#">#감동</a><a
									class="btn-tag me-2 mb-2" href="#">#가족</a><a
									class="btn-tag mb-2" href="#">#랭킹</a>
							</div>
							
						</div>
						                                           
				
              
					</div>
						<form action="<%=path%>/DramaAllList" method="get">
                 <button class="button3" style="width:120px; height:50px;" >공연 전체</button>
                 </form>
				</div>


				<div class="col-lg-9 content py-4 mb-2 mb-sm-0 pb-sm-5">
					<h1 class=" background-1" style="margin-bottom:-130px; margin-left:60px">리뷰 목록</h1>
				<form action="<%=path%>/review_list" method="get">
                 <button class="button4" style="width:120px; height:50px;" >리뷰 전체</button>
                 </form>
					<!-- Blog grid-->
					<div class="masonry-grid " data-columns="3">
				

						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(21).getPrfid() %>"><img
									src="<%=listAll.get(21).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(21).getPrfid() %>"><%=listAll.get(21).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">혼자 본것이 아쉬워 다음에는 둘이서 가야겠습니다.
											즐거운 시간이었습니다.</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/03.jpg" alt="Jessica Miller" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">유길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<!-- <div class="masonry-grid-item">
                                    <article class="card card-hover">
                                        <div class="card-body"><a class="meta-link fs-sm mb-2" href="#">Brand strategy</a>
                                            <h2 class="h5 nav-heading mb-4"><a href="blog-single-ls.html">Simple steps to an effective brand strategy. Real life examples</a></h2>
                                            <a class="d-flex meta-link fs-sm align-items-center pt-3" href="#"><img class="rounded-circle" src="img/blog/avatar/02.jpg" alt="Charlie Welch" width="36">
                                                <div class="ps-2 ms-1 mt-n1">by<span class="fw-semibold ms-1">Charlie Welch</span></div>
                                            </a>
                                    </article>
                                    </div> -->
						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(13).getPrfid() %>"><img
									src="<%=listAll.get(13).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(13).getPrfid() %>"><%=listAll.get(13).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">혼자 본것이 아쉬워 다음에는 둘이서 가야겠습니다.
											즐거운 시간이었습니다.</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/03.jpg" alt="Jessica Miller" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">유길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(12).getPrfid() %>"><img
									src="<%=listAll.get(12).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(12).getPrfid() %>"><%=listAll.get(12).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">혼자 본것이 아쉬워 다음에는 둘이서 가야겠습니다.
											즐거운 시간이었습니다.</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/03.jpg" alt="Jessica Miller" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">유길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<!-- <div class="masonry-grid-item">
                                            <article class="card card-hover">
                                                <div class="card-body"><a class="meta-link fs-sm mb-2" href="#">Project management</a>
                                                    <h2 class="h5 nav-heading mb-4"><a href="blog-single-ls.html">What you can learn about managing projects</a></h2>
                                                    <a class="d-flex meta-link fs-sm align-items-center pt-3" href="#"><img class="rounded-circle" src="img/blog/avatar/04.jpg" alt="Sanomi Smith" width="36">
                                                        <div class="ps-2 ms-1 mt-n1">by<span class="fw-semibold ms-1">Sanomi Smith</span></div>
                                                    </a>
                                            </article>
                                            </div> -->
						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(6).getPrfid() %>"><img
									src="<%=listAll.get(6).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(6).getPrfid() %>"><%=listAll.get(6).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">믿고보는 배우님들 다 나오셔서... 이번에도 꼭
											n차 관람하고 말겁니다.</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/01.jpg" alt="Emma Brown" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">이길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(7).getPrfid() %>"><img
									src="<%=listAll.get(7).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(7).getPrfid() %>"><%=listAll.get(7).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">3년 전 쯤에 봤었는데 그때 재밌어서 다시
											보러왔어요!! 여전히 재밌네용</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/06.jpg" alt="Barbara Palson" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">최길동</span>
										</div> </a>
							</article>
						</div>
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(8).getPrfid() %>"><img
									src="<%=listAll.get(8).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(8).getPrfid() %>"><%=listAll.get(8).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">배우분들 연기 너무 잘하세요 ㅠㅠ 감동감동 너무
											재밌게 잘 봤습니다~</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/06.jpg" alt="Barbara Palson" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">박길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<!-- <div class="masonry-grid-item">
                                                        <article class="card card-hover">
                                                            <div class="card-body"><a class="meta-link fs-sm mb-2" href="#">Digital design</a>
                                                                <h2 class="h5 nav-heading mb-4"><a href="blog-single-ls.html">Top 5 Secrets of Making Successful Corporate Identity Design</a></h2>
                                                                <a class="d-flex meta-link fs-sm align-items-center pt-3" href="#"><img class="rounded-circle" src="img/blog/avatar/02.jpg" alt="Charlie Welch" width="36">
                                                                    <div class="ps-2 ms-1 mt-n1">by<span class="fw-semibold ms-1">Charlie Welch</span></div>
                                                                </a>
                                                        </article>
                                                        </div> -->
						<!-- Post-->
						<!-- <div class="masonry-grid-item">
                                                    <article class="card card-hover">
                                                        <div class="card-body"><a class="meta-link fs-sm mb-2" href="#">Project management</a>
                                                            <h2 class="h5 nav-heading mb-4"><a href="blog-single-ls.html">3 things everyone knows about Management that you don't</a></h2>
                                                            <a class="d-flex meta-link fs-sm align-items-center pt-3" href="#"><img class="rounded-circle" src="img/blog/avatar/05.jpg" alt="Daniel Adams" width="36">
                                                                <div class="ps-2 ms-1 mt-n1">by<span class="fw-semibold ms-1">Daniel Adams</span></div>
                                                            </a>
                                                    </article>
                                                    </div> -->
						<!-- Post-->
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(1).getPrfid() %>"><img
									src="<%=listAll.get(1).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(1).getPrfid() %>"><%=listAll.get(1).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">볼때마다 집중하게 되고 울컥하게 되는 연극이에요..</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/06.jpg" alt="Barbara Palson" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">김길동</span>
										</div> </a>
							</article>
						</div>
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(2).getPrfid() %>"><img
									src="<%=listAll.get(2).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(2).getPrfid() %>"><%=listAll.get(2).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">이렇게 좋은 공연을 볼수 있어서 참 행복했습니다!</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/06.jpg" alt="Barbara Palson" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">홍길동</span>
										</div> </a>
							</article>
						</div>
						<div class="masonry-grid-item">
							<article class="card card-hover" style="height: 27rem;">
								<a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(20).getPrfid() %>"><img
									src="<%=listAll.get(20).getPoster() %>" alt="Post thumbnail"></a>
								<div class="card-body" style="height: 20rem;">
									<a class="meta-link fs-sm mb-2" href="<%=path %>/showSelect?prfid=<%=listAll.get(20).getPrfid() %>"><%=listAll.get(20).getPrfnm() %></a>
									<h2 class="h5 nav-heading mb-4">
										<a href="blog-single-ls.html">이렇게 좋은 공연을 볼수 있어서 참 행복했습니다!</a>
									</h2>
									<a class="d-flex meta-link fs-sm align-items-center pt-3"
										href="#"><img class="rounded-circle"
										src="img/blog/avatar/06.jpg" alt="Barbara Palson" width="36">
										<div class="ps-2 ms-1 mt-n1">
											by<span class="fw-semibold ms-1">홍길동</span>
										</div> </a>
							</article>
						</div>
						<!-- Post-->
						<!-- <div class="masonry-grid-item">
                                                            <article class="card card-hover">
                                                                <div class="card-body"><a class="meta-link fs-sm mb-2" href="#">Travel &amp; Vacation</a>
                                                                    <h2 class="h5 nav-heading mb-4"><a href="blog-single-ls.html">Global travel on a tight budget. Tips &amp; tricks</a></h2>
                                                                    <a class="d-flex meta-link fs-sm align-items-center pt-3" href="#"><img class="rounded-circle" src="img/blog/avatar/03.jpg" alt="Jessica Miller" width="36">
                                                                        <div class="ps-2 ms-1 mt-n1">by<span class="fw-semibold ms-1">Jessica Miller</span></div>
                                                                    </a>
                                                            </article>
                                                            </div> -->
					</div>
					<!-- Pagination-->
					<!-- <div class="d-md-flex justify-content-between align-items-center pt-3 pb-2">
                                                        <div class="d-flex justify-content-center align-items-center mb-4"> -->
					<!-- <label class="pe-1 me-2">Show</label> -->
					<!-- <select class="form-select me-2" style="width: 5rem;">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                    <option value="50">50</option>
                  </select> -->




					<!-- <div class="fs-sm text-nowrap ps-1 mb-1">posts per page</div>
                                                        </div> -->
					<!-- 
                                                                <nav class="mb-4" aria-label="Page navigation">
                                                                    <ul class="pagination justify-content-center">
                                                                        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><i class="ai-chevron-left"></i></a></li>
                                                                        <li class="page-item d-sm-none"><span class="page-link page-link-static">2 / 10</span></li>
                                                                        <li class="page-item d-none d-sm-block"><a class="page-link" href="#">1</a></li>
                                                                        <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">2<span class="visually-hidden">(current)</span></span>
                                                                        </li>
                                                                        <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                                                                        <li class="page-item d-none d-sm-block"><a class="page-link" href="#">4</a></li>
                                                                        <li class="page-item d-none d-sm-block">...</li>
                                                                        <li class="page-item d-none d-sm-block"><a class="page-link" href="#">10</a></li>
                                                                    </ul>
                                                                </nav>
                                                         -->
              
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</body>
	<%@include file="/views/common/footer.jsp"%>