<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.qnaboard.model.vo.Qna"%>
<%@page import="semi.culture.mvc.noticeboard.model.vo.Notice"%>
<%@page import="semi.culture.mvc.member.model.vo.DipLike"%>
<%@page import="semi.culture.mvc.reviewboard.model.vo.Review"%>
<%@page import="semi.culture.mvc.member.model.vo.TicketBookList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member member = null;
	try{
		member = (Member)session.getAttribute("loginMember");
	}catch(Exception e){}

	
	List<TicketBookList> tblPresent = null;
	List<TicketBookList> tblPast =null;
	List<Review> reviewList = null;
	List<ShowDetail> dipListPrm = null;
	List<Notice> noticeList = null;
	List<Qna> myQnaList = null;
	
	if(request.getAttribute("tblPresent")!=null){
		tblPresent = (List<TicketBookList>)request.getAttribute("tblPresent");
	}
	if(request.getAttribute("tblPast")!=null){
		tblPast = (List<TicketBookList>)request.getAttribute("tblPast");
	}
	if(request.getAttribute("reviewList")!=null){
		reviewList = (List<Review>)request.getAttribute("reviewList");
	}
	if(request.getAttribute("dipListPrm")!=null){
		dipListPrm = (List<ShowDetail>)request.getAttribute("dipListPrm");
	}
	if(request.getAttribute("noticeList")!=null){
		noticeList = (List<Notice>)request.getAttribute("noticeList");
	}
	if(request.getAttribute("myQnaList")!=null){
		myQnaList = (List<Qna>)request.getAttribute("myQnaList");
	}

%>
    <%@include file="/views/common/header.jsp"%>
    <section class="m-lg-6" style="height:auto">


        <!-- Blockquote: center aligned -->
        <div class="container ">
            <div class=" text-center">
                <div>
                    <img src="<%=path %>/resources/dblquote_bigger.svg" class="mb-4" alt="">
                </div>
                <%if(tblPast!=null && tblPast.size() > 0){%>
                	<p class="h1 mb-5 fs-1 "><%=member.getUser_name() %>님이 가장 최근 관람한 작품은 <%=tblPast.get(0).getPrfnm() %>입니다.</p>
                <%} else{ %>
                	<p class="h1 mb-5 fs-1 "><%=member.getUser_name() %>님 반갑습니다.</p>
                <%} %>
                <footer class="blockquote-footer display-3 mb-8">
                    이곳은 <%=member.getUser_name() %>님의 공간입니다.
                </footer>
            </div>
        </div>


        <div class="container justify-content-center mt-5" style="width: 50%;">
            <img src="<%=path %>/resources/1000x250_3.svg">
        </div>

        <!-- Masonry grid with filters -->
        <div class="container mt-10 p-7">
            <div class="masonry-filterable">

                <!-- Filters -->
                <ul class="masonry-filters nav nav-tabs justify-content-center pb-4" style="color:#9A161F;">
                    <li class="nav-item">
                        <a class="nav-link active" href="#" data-group="all" style="color:#9A161F;">All</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="booking" style="color:#9A161F;">예매내역</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="history" style="color:#9A161F;">과거예매내역</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="review" style="color:#9A161F;">나의리뷰</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="dips" style="color:#9A161F;">찜목록</a>
                    </li>
                </ul>

                <!-- Grid -->
                <div class="masonry-grid" data-columns="3">
					<%
						int count = 1;
						if(tblPresent!=null && tblPresent.size() > 0){ 
					
					%>
					<% 
					
						for(TicketBookList tbl : tblPresent){ 
						
					%>
					
	                    <!-- Item -->
	                    <div class="masonry-grid-item" data-groups='["booking"]'>
	                        <!-- Image on top -->
	                        <div class="card">
	                            <img src="./resources/caliburn_<%=count++%>.svg" class="card-img-top" alt="Card image">
	                            <div class="card-body">
	                            	<input type="text" value="<%= tbl.getUser_id()%>" name="user_id" hidden>
	                                <h5 class="card-title"><%=tbl.getPrfnm() %></h5>
	                                <p class="card-text fs-sm">예매일시:<%=tbl.getTicketingDate() %><br> 공연일: <%=tbl.getPreviewDate().substring(0,10) %> </p>
	                                <a type="submit" href="<%=path %>/bookComplete?ticketing_no=<%=tbl.getTicketing_no() %>&user_id=<%=tbl.getUser_id() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
	                            </div>
	                        </div>
	                    </div>
                    
                    <%} %>
      				<%} %>
					<%
						count = 10;
						if(tblPast!=null && tblPast.size() > 0){ 
					
					%>
					<% 
					
						for(TicketBookList tbl : tblPast){ 
						
					%>
					
	                    <!-- Item -->
	                    <div class="masonry-grid-item" data-groups='["history"]'>
	                        <!-- Image on top -->
	                        <div class="card">
	                            <img src="./resources/caliburn_<%=count--%>.svg" class="card-img-top" alt="Card image">
	                            <div class="card-body">
	                                <h5 class="card-title"><%=tbl.getPrfnm() %></h5>
	                                <p class="card-text fs-sm">예매일시:<%=tbl.getTicketingDate() %><br> 공연일: <%=tbl.getPreviewDate().substring(0,10) %> </p>
	                                <a href="<%=path %>/bookComplete2?ticketing_no=<%=tbl.getTicketing_no() %>&user_id=<%=tbl.getUser_id() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
	                            </div>
	                        </div>
	                    </div>
                    
                    <%} %>
      				<%} %>
      				<%
						count = 3;
						if(reviewList!=null && reviewList.size() > 0){ 
					
					%>
					<% 
						
						for(Review review : reviewList){ 
						
					%>
					
	                    <!-- Item -->
	                    <div class="masonry-grid-item" data-groups='["review"]'>
	                        <!-- Image on top -->
	                        <div class="card">
	                            <img src="./resources/caliburn_<%=count++ %>.svg" class="card-img-top" alt="Card image">
	                            <div class="card-body">
	                                <h5 class="card-title"><%=review.getRtitle() %></h5>
	                                <p class="card-text fs-sm" style="height:50px"><%=review.getRcontent() %> </p>
	                                <a href="<%=path %>/review_view?reviewNum=<%=review.getReviewnum() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
	                            </div>
	                        </div>
	                    </div>
                    
                    <%} %>
      				<%} %>
            
					<%
						count = 15;
						if(dipListPrm!=null && dipListPrm.size() > 0){ 
					
					%>
					<% 
						
						for(ShowDetail dipLikePrfm : dipListPrm){ 
						
					%>
	                    <div class="masonry-grid-item" data-groups='["dips"]'>
	                        <!-- Image on top -->
	                        <div class="card">
	                            <img src="./resources/caliburn_<%=count-- %>.svg" class="card-img-top" alt="Card image">
	                            <div class="card-body">
	                                <h5 class="card-title"><%=dipLikePrfm.getPrfnm() %></h5>
	                                <p class="card-text fs-sm" style="height: 130px;">
		                                장르: <%=dipLikePrfm.getGenrenm() %><br>
		                                출연진: <%=dipLikePrfm.getPrfcast() %><br>
		                                공연장: <%=dipLikePrfm.getFcltynm() %><br>
		                               	런타임: <%=dipLikePrfm.getPrfruntime() %><br>
	                                </p>
	                                <a href="<%=path %>/detailFromMain?prfmid=<%=dipLikePrfm.getPrfid() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">Go somewhere</a>
	                            </div>
	                        </div>
	                    </div>

                    <%} %>
      				<%} %>
                    
                    
                </div>
            </div>
        </div>



        <div class="container" style="width: 50%;">
            <div class="comment text-center  mb-5 text-muted">
                <img src="./logo_bigger.svg" class="m-2" style="width: 10%;">
                <p>저희 컬쳐쇼크는 선진적인 공연문화조성을 위해 노력하고 있습니다.<br> 회원분들의 적극적인 협조 부탁드립니다.</p>

            </div>
        </div>

        <div class="container mb-7">

            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="text-center p-2">
                        <p class="h3 " style="color: #9A161F;">공지사항</p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group ">
                    <%for(Notice notice : noticeList){ %>
                        <a href="<%=path %>/NoticeView?NoticeNo=<%=notice.getNoticeNum() %> " class="list-group-item list-group-item-action "><%=notice.getNoticeTitile() %></a>
                    <%} %>    
                    </div>
                </div>
                <div class="col-lg-5 ">
                    <div class="text-center p-2">
                        <p class="h3" style="color: #9A161F;">문의내역</p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group border" style="background-color:white;">
                    <%if(myQnaList!=null && myQnaList.size()>0) {%>
                    <%for(Qna qna : myQnaList){ %>
                        <a href="<%=path %>/QnaView?boardNo=<%=qna.getNo() %> " class="list-group-item list-group-item-action "><%=qna.getTitle() %></a>
                    <%}%>
                    <%}else{ %>
            	        <p class="h4 text-center pt-7 pb-7" style="height:280px;"> 문의 하신 내역이 없습니다 </p>
                    	
                    <%
                   		} 
                    %>

                    </div>
                </div>

            </div>
        </div>
    </section>





    
    <%@include file="/views/common/footer.jsp"%>