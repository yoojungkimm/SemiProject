<%@page import="semi.culture.common.util.PageInfo"%>
<%@page import="semi.culture.mvc.reviewboard.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Review> reviewList = null;
PageInfo pageInfo = null;
if (request.getAttribute("reviewList") != null) {
	reviewList = (List<Review>) request.getAttribute("reviewList");
}

if (request.getAttribute("pageInfo") != null) {
	pageInfo = (PageInfo) request.getAttribute("pageInfo");
}
%>
<%@include file="/views/common/header.jsp"%>
<!--공지사항 -->
<div class="board_wrap">
	<div class="board_title">
		<div class="bt_wrap"
			style="text-align: right; margin-bottom: -48px; margin-right: 10px;">
			<a href="<%=path%>/review_write" class="on"
				style="text-align: center;">글쓰기</a>
		</div>
		<div style="margin-bottom: -20px;">

			<svg xmlns="http://www.w3.org/2000/svg" width="70" height="50"
				fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"
				style="margin-top: -15px">
                    <path
					d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                  </svg>
			<strong>리뷰 게시판</strong>
		</div>
	</div>
	<style>
.color1 {
	color: #9A161F;
	font-size: small;
}
</STYLE>
	<div class="color1">단기간이더라도 정성껏 상품평 작성 시 급상승 리뷰어 혜택을 드립니다.</div>
	<style>
.color1 {
	color: #9A161F;
	font-size: small;
}
</STYLE>
	<div class="board_list_wrap">
		<div class="board_list">
			<div class="top">
				<div class="num">번호</div>
				<div class="title">제목</div>
				<div class="writer">글쓴이</div>
				<div class="date">작성일</div>
				<div class="count ps-2">조회</div>
			</div>
			<%
			if (reviewList != null && reviewList.size() > 0) {
				for (Review review : reviewList) {
			%>
			<div>
				<div class="num"><%=review.getReviewnum()%></div>
				<div class="title">
					<a href="<%=path%>/review_view?reviewNum=<%=review.getReviewnum() %>"> <%=review.getRtitle()%>
					</a>
				</div>
				<div class="writer"><%=review.getUser_id() %></div>
				<div class="date" style="font-size:17px;"><%=review.getRcreateDate()%></div>
				<div class="count" style="font-size:17px;"><%=review.getRreadCount()%></div>
			</div>
			
			<%
				}
			}
			%>

		</div>
	
		<div class="board_page">
			<a href="<%=path%>/review_list?page=<%=pageInfo.getStartPage()%>"
				class="bt first"> &lt;&lt; </a> <a
				href="<%=path%>/review_list?page=<%=pageInfo.getPrvePage()%>"
				class="bt prev"> &lt; </a>

			<%
			for (int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) {
			%>
			<%
			if (pageInfo.getCurrentPage() == i) {
			%>
			<a href="<%=path%>/review_list?page=<%=i%>" class="num on"><%=i%></a>
			<%
			} else {
			%>
			<a href="<%=path%>/review_list?page=<%=i%>" class="num"><%=i%></a>
			<%
			}
			}
			%>

			<a href="<%=path%>/review_list?page=<%=pageInfo.getEndPage()%>"
				class="bt next"> &gt; </a> 
			<a href="<%=path%>/review_list?page=<%=pageInfo.getEndPage() %>"
				class="bt last"> &gt;&gt; </a>
				
		</div>
	</div>
</div>

<%@include file="/views/common/footer.jsp"%>