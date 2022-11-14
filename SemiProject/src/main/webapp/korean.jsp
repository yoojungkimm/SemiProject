<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.show.model.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
    	List<ShowDetail> listAll = (List<ShowDetail>)request.getAttribute("listAll");
    	List<ShowDetail> listRank=(List<ShowDetail>)request.getAttribute("listRank");
    %>
    <%@include file="/views/common/header.jsp"%>
    
     <div class="d-md-block d-none position-relative bg-no-repeat bg-position-center" style="background-image: url(img/img/korean.jpg); padding-top: 30rem;">
        </div>
     <!-- 검색 -->
    <form class="container position-relative zindex-5" style="margin-top: -68px;" action="<%=path%>/koreanSearch" method="get">
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
     <hr style="border-top: solid 2px #9A161F;">

    <section style="margin-left: 21rem; margin-right: 21rem;">
        <!-- Controls position: Dots outside + Arrows inside -->
        <div class="tns-carousel-wrapper tns-controls-inside">
            <div class="tns-carousel-inner" data-carousel-options='{"gutter": 15}'>
            
              
                  <div style="display: flex; justify-content: center;">
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(0).getPrfid() %>" style="margin: 10px;"><img src="<%= listAll.get(0).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(1).getPrfid() %>" style="margin: 10px;"><img src="<%= listAll.get(1).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(2).getPrfid() %>" style="margin: 10px;"><img src="<%= listAll.get(2).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                </div>
                <div style="display: flex; justify-content: center;">
                    <a href="" style="margin: 10px;"><img src="<%= listAll.get(3).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="#" style="margin: 10px;"><img src="<%= listAll.get(4).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="#" style="margin: 10px;"><img src="<%= listAll.get(5).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                </div>
                <div style="display: flex; justify-content: center;">
                    <a href="#" style="margin: 10px;"><img src="<%= listAll.get(6).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="#" style="margin: 10px;"><img src="<%= listAll.get(7).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                    <a href="#" style="margin: 10px;"><img src="<%= listAll.get(8).getPoster() %>" style="width: 20rem; height: 30rem;"></a>
                </div>
            </div>
        </div>
    </section>

    <hr style="border-top: solid 2px #9A161F;">

    <h2 style="color: #9A161F; text-align: center; margin-bottom:-70px;">List</h2>
    <div style="margin-bottom: -25px; margin-top:40px;">
     <form action="<%=path%>/koreanAllList" method="get">
        <button class="button2" style="margin-left:1400px;">더보기</button>
     </form>
        
        
    </div>
    <br><br>

    <!-- List 시작 -->
    <section style="margin-left: 21rem; margin-right: 21rem;">
        <div style="display: flex;">
            <!-- Image on top -->
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(9).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(9).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(9).getPrfpdfrom() %>~<%= listAll.get(9).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(9).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(9).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(13).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(13).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(13).getPrfpdfrom() %>~<%= listAll.get(13).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(13).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(13).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(11).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(11).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(11).getPrfpdfrom() %>~<%= listAll.get(11).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(11).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(11).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(12).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(12).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(12).getPrfpdfrom() %>~<%= listAll.get(12).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(12).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(12).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>

            
        </div>

        <div style="display: flex;">
            <!-- Image on top -->
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(14).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(14).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(14).getPrfpdfrom() %>~<%= listAll.get(14).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(14).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(14).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(15).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(15).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(15).getPrfpdfrom() %>~<%= listAll.get(15).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(15).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(15).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(16).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(16).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(16).getPrfpdfrom() %>~<%= listAll.get(16).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(16).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(16).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
            <div class="card" style="margin: 5px; max-width: 18rem;">
                <img src=" <%= listAll.get(17).getPoster() %>" style="width: 20rem; height: 20rem;" class="card-img-top" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;"><%= listAll.get(17).getPrfnm() %></h5>
                    <p class="card-text fs-sm ">기간 : <%= listAll.get(17).getPrfpdfrom() %>~<%= listAll.get(17).getPrfpdto() %></p>
                    <p class="card-text fs-sm " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">장소 : <%= listAll.get(17).getFcltynm() %></p>
                    <a href="<%=path %>/showSelect?prfid=<%=listAll.get(17).getPrfid() %>" class="btn btn-sm btn-primary">상세보기</a>
                </div>
            </div>
        </div>

        

    </section>

    <hr style="border-top: solid 2px #9A161F;">


    <section style="margin-right: 21rem; margin-left: 21rem; margin-bottom: 50px; display: flex; justify-content: space-around;">
        <div>
            <h3 style="color: #9A161F; text-align: center; margin-top: 5px;  margin-bottom: 30px;">Recommend</h3>
            <div class="list-group">
                <a href="<%=path %>/showSelect?prfid=<%=listAll.get(4).getPrfid() %>" class="list-group-item list-group-item-action" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 20rem;">
                    <%= listAll.get(4).getPrfnm() %>
                </a>
                <a href="<%=path %>/showSelect?prfid=<%=listAll.get(6).getPrfid() %>" class="list-group-item list-group-item-action" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 20rem;">
                    <%= listAll.get(6).getPrfnm() %>
                </a>
                <a href="<%=path %>/showSelect?prfid=<%=listAll.get(17).getPrfid() %>" class="list-group-item list-group-item-action" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 20rem;">
                    <%= listAll.get(17).getPrfnm() %>
                </a>
                <a href="<%=path %>/showSelect?prfid=<%=listAll.get(36).getPrfid() %>" class="list-group-item list-group-item-action" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 20rem;">
                    <%= listAll.get(36).getPrfnm() %>
                </a>
                <a href="<%=path %>/showSelect?prfid=<%=listAll.get(20).getPrfid() %>" class="list-group-item list-group-item-action" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 20rem;">
                    <%= listAll.get(20).getPrfnm() %>
                </a>
            </div>
        </div>
        <div style="max-width: 100rem; min-width: 50%;">
            <div style="margin-bottom: -80px; ">
                <button class="button2" style="margin-left:520px;" onClick="location.href='https://www.naver.com'">더보기</button>
            </div>
            <h3 style="color: #9A161F; text-align: center; margin-bottom: 30px; margin-top: 30px;">Review</h3>

            <article class="card card-horizontal  card-hover" style="margin-bottom: 20px;">
                <a class="card-img-top " href="# " style="background-image: url(https://www.kopis.or.kr/upload/pfmPoster/PF_PF193086_220620_135308.jpg); "></a>
                <div class="card-body ">
                    <a class="meta-link fs-sm mb-2 " href="# ">토요신명 (7~12월)</a>
                    <h2 class="h4 nav-heading mb-4 " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">
                        <a href="# ">재미있어요</a>
                    </h2>
                    <a class="d-flex meta-link fs-sm align-items-center pt-3 " href="# ">
                        <div class="ps-2 ms-1 mt-n1 ">
                            by
                            <span class="fw-semibold ms-1 ">홍길동</span>
                        </div>
                    </a>
                    <div class="mt-3 text-right text-nowrap ">
                        <a class="meta-link fs-xs " href="# ">
                            <i class="ai-message-square me-1 "></i> &nbsp;4
                        </a>
                        <span class="meta-divider "></span>
                        <a class="meta-link fs-xs " href="# ">
                            <i class="ai-calendar me-1 mt-n1 "></i> &nbsp;Feb 12
                        </a>
                    </div>
                </div>
            </article>
            <article class="card card-horizontal  card-hover" style="margin-bottom: 20px;">
                <a class="card-img-top " href="# " style="background-image: url(https://www.kopis.or.kr/upload/pfmPoster/PF_PF193492_220624_130917.jpg); "></a>
                <div class="card-body ">
                    <a class="meta-link fs-sm mb-2 " href="# ">광주국악상설공연 (7월)</a>
                    <h2 class="h4 nav-heading mb-4 " style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 15rem;">
                        <a href=" # ">멋있어요</a>
                    </h2>
                    <a class="d-flex meta-link fs-sm align-items-center pt-3 " href="# ">
                        <div class="ps-2 ms-1 mt-n1 ">
                            by
                            <span class="fw-semibold ms-1 ">최길동</span>
                        </div>
                    </a>
                    <div class="mt-3 text-right text-nowrap ">
                        <a class="meta-link fs-xs " href="# ">
                            <i class="ai-message-square me-1 "></i> &nbsp;4
                        </a>
                        <span class="meta-divider "></span>
                        <a class="meta-link fs-xs " href="# ">
                            <i class="ai-calendar me-1 mt-n1 "></i> &nbsp;Feb 12
                        </a>
                    </div>
                </div>
            </article>
        </div>
    </section>
    <%@include file="/views/common/footer.jsp"%>