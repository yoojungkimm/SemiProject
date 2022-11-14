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
    
    
    <img class="header_image" alt="슬라이드" style="width:2000px; height:300px; object-fit: cover;" rel="3-2" src="img/img/opera-594592.jpg">

    <!-- <section class="opera-594592  py-1" data-jarallax data-speed="0.25">
    <div class="jarallax-img" style="background-image: url(img/demo/booking/musical-bg2.jpg);"></div>
    <div class="container py-5 py-sm-7 text-center">
        <div class="py-md-6">
        </div>
    </div>
</section> -->

    <!-- <div>
    <img src="main2.png" style="width:2000px; height:300px; object-fit: cover;">
</div> -->


    <!-- 검색 시작 -->
    <form class="container position-relative zindex-5" style="margin-top: -68px;" action="<%=path%>/classicSearch" method="get">
        <div class="d-lg-flex align-items-center bg-white border rounded-3 px-6 pt-3 pb-1">
            <div class="d-sm-flex align-items-center flex-grow-1">
                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="from-destination">공연 이름</label>
                    <input class="form-control me-3" name="prfnmValue"  type="text">
                </div>

                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="to-destination">출연진</label>
                    <input class="form-control me-3" name="prfcastValue" type="text">
                </div>

                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="from-destination">지역</label>
                    <select class="form-select" name="adresValue" id="from-destination">
                        <option value="" disabled hidden>From where?</option>
                        <option value=""  selected></option>
                        <option value="서울" >서울</option>
                        <option value="경기">경기</option>
                    <option value="인천">인천</option>
                    <option value="대전">대전</option>
                    <option value="대구" >대구</option>
                    <option value="광주">광주</option>
                    <option value="울산">울산</option>
                    <option value="춘천" >춘천</option>
                    <option value="부산" >부산</option>
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
                        <input class="form-control rounded date-picker" name="dateValue" type="text" placeholder="Choose date" data-datepicker-options="{ &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y.m.d&quot;, &quot;defaultDate&quot;: &quot;today&quot;, &quot;minDate&quot;: &quot;today&quot;}"
                            data-linked-input="#return-date"><i class="ai-calendar align-middle position-absolute top-50 end-0 translate-middle-y me-3"></i>
                    </div>
                </div>

                <div class="text-center text-sm-start mt-2 mt-sm-4 mb-4">
                    <button class="btn btn-primary-1 " type="submit"><i class="ai-search fs-xl-1 me-1 "></i></button>
                </div>

            </div>
        </div>
    </form>
    <!-- 검색 끝 -->

    <!-- Portfolio-->
    <div style="margin-top :-60px;">


        <section class="container pt-5 pt-md-6 pt-lg-7">
            <h2 class="text-center pt-3 pt-md-2 pb-4" style="color: #9A161F;" font-size=10;>Popular</h2>
            <br>
            <div class="masonry-filterable mb-3">
                <div class="masonry-grid" data-columns="4">
                  
                    <div class="masonry-grid-item" data-groups="[&quot;3d&quot;]" >
                        <div class="card card-flip" >
                            <div class="card-flip-inner">
                                <div class="card-flip-front"><img class="card-img" src="<%= listRank.get(1).getPoster() %>" alt="Portfolio thumb"></div>
                                <a class="card-flip-back" href="<%=path %>/showSelect?prfid=<%=listRank.get(1).getPrfid() %>">
                                    <div class="card-body">
                                        <div class="card-body-inner">
                                            <h3 class="h5 card-title mb-2"><%= listRank.get(1).getPrfnm() %></h3>
                                            <p class="fs-sm text-muted"><%= listRank.get(1).getPrfpdfrom() %>~<%= listRank.get(1).getPrfpdto() %></p><span class="btn btn-primary btn-sm">공연 상세정보</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="masonry-grid-item" data-groups="[&quot;3d&quot;]" >
                        <div class="card card-flip">
                            <div class="card-flip-inner">
                                <div class="card-flip-front"><img class="card-img" src="<%= listRank.get(2).getPoster() %>" alt="Portfolio thumb"></div>
                                <a class="card-flip-back" href="<%=path %>/showSelect?prfid=<%=listRank.get(2).getPrfid() %>">
                                    <div class="card-body">
                                        <div class="card-body-inner">
                                            <h3 class="h5 card-title mb-2"><%= listRank.get(2).getPrfnm() %></h3>
                                            <p class="fs-sm text-muted"><%= listRank.get(2).getPrfpdfrom() %>~<%= listRank.get(2).getPrfpdto() %></p><span class="btn btn-primary btn-sm">공연 상세정보</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="masonry-grid-item" data-groups="[&quot;3d&quot;]">
                        <div class="card card-flip">
                            <div class="card-flip-inner">
                                <div class="card-flip-front"><img class="card-img" src="<%= listRank.get(3).getPoster() %>" alt="Portfolio thumb"></div>
                                <a class="card-flip-back" href="<%=path %>/showSelect?prfid=<%=listRank.get(3).getPrfid() %>">
                                    <div class="card-body">
                                        <div class="card-body-inner">
                                            <h3 class="h5 card-title mb-2"><%= listRank.get(3).getPrfnm() %></h3>
                                            <p class="fs-sm text-muted"><%= listRank.get(3).getPrfpdfrom() %>~<%= listRank.get(3).getPrfpdto() %></p><span class="btn btn-primary btn-sm">공연 상세정보</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
        <div class="masonry-grid-item" data-groups="[&quot;3d&quot;]">
                        <div class="card card-flip">
                            <div class="card-flip-inner">
                                <div class="card-flip-front"><img class="card-img" src="<%= listRank.get(0).getPoster() %>" alt="Portfolio thumb"></div>
                                <a class="card-flip-back" href="<%=path %>/showSelect?prfid=<%=listRank.get(0).getPrfid() %>">
                                    <div class="card-body">
                                        <div class="card-body-inner">
                                            <h3 class="h5 card-title mb-2"><%= listRank.get(0).getPrfnm() %></h3>
                                            <p class="fs-sm text-muted"><%= listRank.get(0).getPrfpdfrom() %>~<%= listRank.get(0).getPrfpdto() %></p><span class="btn btn-primary btn-sm">공연 상세정보</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
        </section>
        </div>
        <!-- TOP5 끝 -->
        <hr><br>

        <!-- Reviews -->
        <section class="pb-5 pt-2 pt-md-0 mb-5 mb-sm-6 border-bottom" id="reviews">
            <div class="container pb-3">
                <div class="row pb-3">
                    <div class="col-lg-4 col-md-5">
                        <h2 class="h3 mb-4">베르디 레퀴엠</h2>
                        <div class="star-rating-lg mt-n1 me-2 star-rating mt-n1"><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star"></i>
                        </div><span class="text-heading">4.2</span>
                        <p class="pt-3 fs-sm text-muted">12 out of 15<br>Customers recommended this product</p>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="d-flex align-items-center mb-2">
                            <div class="text-nowrap me-3"><span class="d-inline-block align-middle">5</span><i class="ai-star fs-sm ms-1"></i></div>
                            <div class="w-100">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 47%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div><span class="ms-3">7</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <div class="text-nowrap me-3"><span class="d-inline-block align-middle">4</span><i class="ai-star fs-sm ms-1"></i></div>
                            <div class="w-100">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 20%; background-color: #a7e453;" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div><span class="ms-3">3</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <div class="text-nowrap me-3"><span class="d-inline-block align-middle">3</span><i class="ai-star fs-sm ms-1"></i></div>
                            <div class="w-100">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 14%; background-color: #ffda75;" aria-valuenow="17" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div><span class="ms-3">2</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <div class="text-nowrap me-3"><span class="d-inline-block align-middle">2</span><i class="ai-star fs-sm ms-1"></i></div>
                            <div class="w-100">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 14%;" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div><span class="ms-3">2</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="text-nowrap me-3"><span class="d-inline-block align-middle">1</span><i class="ai-star fs-sm ms-1"></i></div>
                            <div class="w-100">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 7%;" aria-valuenow="4" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div><span class="ms-3">1</span>
                        </div>
                    </div>
                </div>
                <!-- <hr class="my-5">
            <div class="row"> -->
                <div class="text-center"><a class="btn btn-primary" href="review_list.html">리뷰 더보기</a></div>
        </section>


        <!-- 전체목록 시작 -->
        <div style="margin-top :-150px;">
            <section class="container pt-5 pb-4 pb-md-5 pb-lg-6 pt-md-6 pt-lg-7 ">
                <h2 class="text-center pt-2 pt-md-0 mb-5 " style="color: #9A161F; ">전체 목록</h2>
                 <div class="text-center " style="margin-bottom:-70px;">
                	<form action="<%=path%>/clAllList" method="get">
              		 <button class="button1" style="margin-bottom:100px;" >더보기</button>
              		 </form>
               </div>
                <div class="row pb-3 pb-md-0 ">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter " >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(26).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(26).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(26).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(26).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 70rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(27).getPrfid() %>"><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(27).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(27).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(27).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(28).getPrfid() %>"><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(28).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(31).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(31).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(31).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(31).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(11).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(11).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(16).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(16).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(16).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(16).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(17).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(17).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(17).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(17).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter " >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(24).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(24).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(14).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(14).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter "  >
                        <div class="card card-curved-body card-hover border-0 shadow mx-auto " style="max-width: 20rem; "><a class="card-floating-icon fs-base " href="<%=path %>/showSelect?prfid=<%=listAll.get(19).getPrfid() %> "><i class="ai-linkedin "></i></a>
                            <div class="card-img-top card-img-gradient "><img src="<%= listAll.get(19).getPoster() %>" alt="Sarah Cole "></div>
                            <div class="card-body text-center ">
                                <h3 class="h6 card-title mb-2 "><%= listAll.get(15).getFcltynm() %></h3>
                                <p class="fs-xs text-body mb-0 "><%= listAll.get(15).getPrfcast() %></p>
                            </div>
                        </div>
                    </div>
                   
                   
               
            </section>
        </div>

        <!-- 전체목록 끝 -->
    
    <%@include file="/views/common/footer.jsp"%>