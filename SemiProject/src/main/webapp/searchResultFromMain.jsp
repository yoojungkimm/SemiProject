<%@page import="semi.culture.mvc.show.model.vo.ShowRank"%>
<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/views/common/header.jsp"%>


<%
	List<ShowDetail> showList = null;
	List<ShowRank> recommenList = null;

	if(request.getAttribute("showList")!=null){
		showList = (List<ShowDetail>) request.getAttribute("showList");
	}
	if(request.getAttribute("recommenList")!=null){
		recommenList = (List<ShowRank>) request.getAttribute("recommenList");
	}

%>
    <!-- 검색 -->
    <form class="container position-relative zindex-5">
        <div class="d-lg-flex align-items-center bg-white border rounded-3 px-6 pt-3 pb-1">
            <div class="d-sm-flex align-items-center flex-grow-1">
                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="from-destination">공연 이름</label>
                    <input class="form-control me-3" type="text" required>
                </div>

                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="to-destination">출연진</label>
                    <input class="form-control me-3" type="text" required>
                </div>

                <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                    <label class="form-label" for="from-destination">지역</label>
                    <select class="form-select" id="from-destination">
                        <option value="" disabled hidden>From where?</option>
                        <option value="seoul">서울</option>
                        <option value="gyeonggi" selected>경기</option>
                    <option value="Incheon">	인천</option>
                    <option value="Daejeon">	대전</option>
                    <option value="Daegu">대구</option>
                    <option value="Gwangju">광주</option>
                    <option value="Ulsan">울산</option>
                    <option value="Chuncheon">춘천</option>
                    <option value="Busan">부산</option>
                    <option value="Gangwon">춘천</option>
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
                        <input class="form-control rounded date-picker" type="text" placeholder="Choose date" data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;defaultDate&quot;: &quot;today&quot;, &quot;minDate&quot;: &quot;today&quot;}"
                            data-linked-input="#return-date"><i class="ai-calendar align-middle position-absolute top-50 end-0 translate-middle-y me-3"></i>
                    </div>
                </div>


                <div class="text-center text-sm-start mt-2 mt-sm-4 mb-4">
                    <button class="btn btn-primary" type="submit">검색</button>
                </div>
            </div>
        </div>
    </form>

    <!-- 검색결과 시작 -->
    <div class="container py-4 mb-2 mb-sm-0 pb-sm-5">
        <div class="row justify-content-center">
            <div class="col-lg-12">
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
                    
                    	<%
                    	if(showList!=null && showList.size() > 0){
                    		for(int i = 0; i < showList.size(); i++){
 								if(i==4){
 									break;
 								}
                    	%>
                    	
                        <article class="card card-horizontal card-hover mb-grid-gutter " style="height:250px;">
                            <a class="card-img-top" href="<%=path %>/detailFromMain?prfmid=<%=showList.get(i).getPrfid() %>" style="background-image: url(<%=showList.get(i).getPoster()%>);"></a>
                            <div class="card-body">
                                <h2 class="h4 nav-heading text-capitalize mb-3"><a href="<%=path %>/detailFromMain?prfmid=<%=showList.get(i).getPrfid() %>"><%=showList.get(i).getPrfnm() %></a></h2>
                                <p class="mb-0 fs-sm text"><%=showList.get(i).getGenrenm() %> | <%=showList.get(i).getPrfstate() %> | <%=showList.get(i).getPrfage() %></br>
                                	
                                    공연기간 :<%=showList.get(i).getPrfpdfrom() %> - <%=showList.get(i).getPrfpdto() %> <br>
                                    <% if(showList.get(i).getPrfcast()!=null){
                                    %>
                                    	<p>출연진 : <%=showList.get(i).getPrfcast() %></p>
                                    <%
                                    }
                                    %>
                                </p>
                            </div>
                        </article>
                        
                        <%
               					showList.remove(i);		
                        
		                		}
		                	}
                	
                        %>
                        
                    </div>
                    <!-- Content right -->
                    <div class="col-lg-6 ">
                       <%
                    	if(showList!=null && showList.size() > 0){
                    		for(int i = 0; i < showList.size(); i++){
 								if(i==4){
 									break;
 								}
                    	%>
                    	
                        <article class="card card-horizontal card-hover mb-grid-gutter " style="height:250px;">
                            <a class="card-img-top" href="<%=path %>/detailFromMain?prfmid=<%=showList.get(i).getPrfid() %>" style="background-image: url(<%=showList.get(i).getPoster()%>);"></a>
                            <div class="card-body">
                                <h2 class="h4 nav-heading text-capitalize mb-3"><a href="<%=path %>/detailFromMain?prfmid=<%=showList.get(i).getPrfid() %>"><%=showList.get(i).getPrfnm() %></a></h2>
                                <p class="mb-0 fs-sm text"><%=showList.get(i).getGenrenm() %> | <%=showList.get(i).getPrfstate() %> | <%=showList.get(i).getPrfage() %></br>
                                	
                                    공연기간 :<%=showList.get(i).getPrfpdfrom() %> - <%=showList.get(i).getPrfpdto() %> <br>
                                    <% if(showList.get(i).getPrfcast()!=null){
                                    %>
                                    	<p>출연진 : <%=showList.get(i).getPrfcast() %></p>
                                    <%
                                    }
                                    %>
                                </p>
                            </div>
                        </article>
                        
                        <%
               					showList.remove(i);		
                        
		                		}
		                	}
                	
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--검색결과 끝-->

    <!--추천목록 시작-->

    <!-- Page content-->
    <div class="container py-4 mb-20 mb-sm-0 pb-sm-10">
        <nav aria-label="breadcrumb">
        </nav>
        <h2 class="mb-5">추천목록</h2>
        <hr style="border: solid 1px; color : #9A161F;">
        <!-- Blog grid-->
        <div class="masonry-grid overflow-hidden" data-columns="5">
        
        	<% if(recommenList!=null && recommenList.size()>0){
        			for(int i = 0;i<recommenList.size();i++){
        				if(i==5){
							break;
						}
       		%>
        	
            <!-- Post-->
            <div class="masonry-grid-item" ">
                <article class="card card-hover"  style="height:410px;">
                    <a class="card-img-top"style="height:250px; href="#"><img src="<%=recommenList.get(i).getPoster() %>" alt="Post thumbnail"></a>
                    <div class="card-body">
                        <h2 class="h5 nav-heading mb-3"><a href="<%=path%>/detailFromMain?prfmid=<%=recommenList.get(i).getPrfid() %>"><%=recommenList.get(i).getPrfnm() %></a></h2>
                        <a class="meta-link fs-sm mb-2" href="#"><%=recommenList.get(i).getPrfpd()%></a>
                        <a class="d-flex meta-link fs-sm align-items-center pt-3" href="">
                            <i class="fa-solid fa-landmark" alt="Emma Brown"></i>
                            <div class="ps-2 ms-1 mt-n1 "><span class="fw-semibold "><%=recommenList.get(i).getPrfplcnm() %></span></div>
                        </a>
                    </div>
                </article>
            </div>
            <%	
        			}
        		}
            %>

        </div>
    </div>

    
    <%@include file="/views/common/footer.jsp"%>