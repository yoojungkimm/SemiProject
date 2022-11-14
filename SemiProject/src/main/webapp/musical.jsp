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
    
    
    
     <!-- 헤더 아래 사진-->
    <section class="jarallax bg-dark py-1" data-jarallax data-speed="0.25">
        <div class="jarallax-img" style="background-image: url(<%=path%>/img/demo/booking/musical-bg2.jpg);"></div>
        <div class="container py-5 py-sm-7 text-center">
            <div class="py-md-6">
            </div>
        </div>
    </section>
    <!-- 헤더 아래 사진 끝-->


    <!-- 검색 -->
    <form class="container position-relative zindex-5" style="margin-top: -68px;" action="<%=path%>/musicalSearch" method="get">
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

     <!-- 추천 시작 -->

    <div style="margin-top:-60px;">
        <section class="container py-5 my-4 my-sm-0 py-sm-6 py-md-7">
            <div style="margin-bottom: -10px;">
                <h3 class="text-left mb-1">추천 뮤지컬</h3>
            </div>
            
            
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-progress ms-auto mb-3" >
                    <div class="text-sm text-muted text-center mb-2"><span class="tns-current-slide me-1"></span><span class="tns-total-slides ms-1"></span></div>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"></div>
                    </div>
                </div>
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 3, &quot;nav&quot;: false, &quot;gutter&quot;: 23, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;540&quot;:{&quot;items&quot;:2},&quot;900&quot;:{&quot;items&quot;:3}}}">
           
          
                   <div class="pb-2">
                        <a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(0).getPrfid()%>">
                            <div class="card-img-top card-img-gradient"><img src="  <%= listRank.get(0).getPoster() %> " alt="Burano"><span class="card-floating-text text-light fw-medium">자세히 보기<i class="ai-chevron-right align-middle fs-lg ms-1"></i></span></div>
                            <div class="card-body text-center">
                                <h3 class="h5 pt-1 mb-3"><%= listRank.get(0).getPrfnm() %></h3>
                                <p class="fs-sm text-muted mb-2"><%= listRank.get(0).getPrfpdfrom() %>~<%= listRank.get(0).getPrfpdto() %></p>
                            </div>
                        </a>
                    </div>
                   <div class="pb-2">
                        <a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(1).getPrfid()%>">
                            <div class="card-img-top card-img-gradient"><img src="  <%= listRank.get(1).getPoster() %> " alt="Burano"><span class="card-floating-text text-light fw-medium">자세히 보기<i class="ai-chevron-right align-middle fs-lg ms-1"></i></span></div>
                            <div class="card-body text-center">
                                <h3 class="h5 pt-1 mb-3"><%= listRank.get(1).getPrfnm() %></h3>
                                <p class="fs-sm text-muted mb-2"><%= listRank.get(1).getPrfpdfrom() %>~<%= listRank.get(1).getPrfpdto() %></p>
                            </div>
                        </a>
                    </div>
                   <div class="pb-2">
                        <a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(2).getPrfid()%>">
                            <div class="card-img-top card-img-gradient"><img src="  <%= listRank.get(2).getPoster() %> " alt="Burano"><span class="card-floating-text text-light fw-medium">자세히 보기<i class="ai-chevron-right align-middle fs-lg ms-1"></i></span></div>
                            <div class="card-body text-center">
                                <h3 class="h5 pt-1 mb-3"><%= listRank.get(2).getPrfnm() %></h3>
                                <p class="fs-sm text-muted mb-2"><%= listRank.get(2).getPrfpdfrom() %>~<%= listRank.get(2).getPrfpdto() %></p>
                            </div>
                        </a>
                    </div>
                   <div class="pb-2">
                        <a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(3).getPrfid()%>">
                            <div class="card-img-top card-img-gradient"><img src="  <%= listRank.get(3).getPoster() %> " alt="Burano"><span class="card-floating-text text-light fw-medium">자세히 보기<i class="ai-chevron-right align-middle fs-lg ms-1"></i></span></div>
                            <div class="card-body text-center">
                                <h3 class="h5 pt-1 mb-3"><%= listRank.get(3).getPrfnm() %></h3>
                                <p class="fs-sm text-muted mb-2"><%= listRank.get(3).getPrfpdfrom() %>~<%= listRank.get(3).getPrfpdto() %></p>
                            </div>
                        </a>
                    </div>
                   <div class="pb-2">
                        <a class="card border-0 shadow card-hover mx-1" href="<%=path %>/showSelect?prfid=<%=listRank.get(4).getPrfid()%>">
                            <div class="card-img-top card-img-gradient"><img src="  <%= listRank.get(4).getPoster() %> " alt="Burano"><span class="card-floating-text text-light fw-medium">자세히 보기<i class="ai-chevron-right align-middle fs-lg ms-1"></i></span></div>
                            <div class="card-body text-center">
                                <h3 class="h5 pt-1 mb-3"><%= listRank.get(4).getPrfnm() %></h3>
                                <p class="fs-sm text-muted mb-2"><%= listRank.get(4).getPrfpdfrom() %>~<%= listRank.get(4).getPrfpdto() %></p>
                            </div>
                        </a>
                    </div>
                   
                    
                </div>
            </div>
        </section>
    </div>

     <!-- 추천 끝 -->

    <!-- 전체목록 시작 -->
    <div style="margin-top:-50px;">
        <section class="container">
            <div style="margin-bottom: -55px; margin-left:20px;">
                <h2 class="text-left mb-1">전체 목록</h2>
                <form action="<%=path%>/muAllList" method="get">
                 <button class="button1" style="margin-bottom:100px;" >더보기</button>
                 </form>
            </div>
            <div class="row">
                <!-- Content left -->
                <div class="col-lg-6 ">
                    <!-- Post-->
                    
                    
                    <%for(int i=277; i<283;i++){ %>
                    <!-- Post-->
                    <article class="card card-horizontal card-hover mb-grid-gutter ">
                        <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(i).getPrfid()%>" style="background-image: url(<%=listAll.get(i).getPoster() %>);"></a>
                        <div class="card-body">
                            <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%=listAll.get(i).getPrfnm() %></a></h2>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfpdfrom() %>~<%= listAll.get(i).getPrfpdto() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfcast() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getFcltynm() %> </p>
                           
                        </div>
                    </article>
                    <%} %>
                    
                    
                </div>
                <!-- Content right -->
                <div class="col-lg-6 ">
                    <!-- Post-->
                     <%for(int i=249; i<255;i++){ %>
                    <!-- Post-->
                    <article class="card card-horizontal card-hover mb-grid-gutter ">
                        <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(i).getPrfid()%>" style="background-image: url(<%=listAll.get(i).getPoster() %>);"></a>
                        <div class="card-body">
                            <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%=listAll.get(i).getPrfnm() %></a></h2>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfpdfrom() %>~<%= listAll.get(i).getPrfpdto() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfcast() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getFcltynm() %> </p>
                           
                        </div>
                    </article>
                    <%} %>

                </div>
                
            </div>






          
        </section>
    </div>
    <!-- 전체목록 끝 -->
    
    <%@include file="/views/common/footer.jsp"%>