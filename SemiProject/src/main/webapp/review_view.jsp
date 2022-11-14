<%@page import="semi.culture.mvc.reviewboard.model.vo.ReviewReply"%>
<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.reviewboard.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Review review = null;
	Member member = null;
	List<ReviewReply> replyList = null;
	String user_id = "";
	if(request.getAttribute("review")!=null){
		review = (Review)request.getAttribute("review");
	}
	if(session.getAttribute("loginMember")!=null){
	 	member = (Member)session.getAttribute("loginMember");
	 	user_id = member.getUser_id();
	}
	if(request.getAttribute("replyList")!=null){
		replyList = (List<ReviewReply>)request.getAttribute("replyList");
	}
		
%>
<%@include file="/views/common/header.jsp"%>
 <style>
     .color1 {
         color: #9A161F;
         font-size: small;
     }
 </style>

    <!--리뷰 -->
    <div class="board_wrap">
        <div class="board_title">
            <div style="margin-bottom: 10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="70" height="50" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16" style="margin-top:-15px">
                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                  </svg>
                <strong>리뷰 게시판</strong>
            </div>
            <div class="color1">단기간이더라도 정성껏 상품평 작성 시 급상승 리뷰어 혜택을 드립니다.</div>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <%=review.getRtitle()%>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%=review.getReviewnum() %></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=review.getUser_id() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=review.getRcreateDate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%=review.getRreadCount() %></dd>
                    </dl>
                    <dl>
                        <dt>별점</dt>
                        <dd>
                        	<%
                        		int star = Integer.parseInt(review.getStar());
                        		for(int i = 0; i<star; i++){
                        	%>
                            <label for="rate1">⭐</label>
                            <%
                            	}
                        	%>
                            
                        </dd>
                    </dl>
                </div>
                <div style="font-size:20px; height: 400px;" class="cont">
                    <%=review.getRcontent() %>

                </div>
            </div>
            	
			<!-- 리플시작 -->
			<table class="w-100">
				<div class="container text-center pt-2 mt-2">
					<p class="h4"> 댓글을 남겨주세요 </p>
				</div>
				
				<hr>
				<%
					if(replyList!=null && replyList.size()>0){
						for(ReviewReply rr : replyList){
				%>
				<tr class="row p-4 border-bottom">
					<td class="col-2"><%=rr.getUser_id() %> ♥ </td>
					<td class="col-8 text-start pe-3"><%=rr.getRccontent() %> <span class="ps-5 text-muted fs-xs">(<%=rr.getRccreatedate() %>)</span></td>
					<% if(member != null && member.getUser_id().equals(rr.getUser_id())){ %>
					<td class="col-2 text-end pe-3 text-muted"">
						<a type="button" class="ps-3 btn btn-outline-danger btn-icon" href="<%=path%>/reply_delete?replyNum=<%=rr.getRcommentnum()%>">
						  <i class="ai-trash"></i>
						</a>
					</td>
					<%} %>
				</tr>
				<%
						}
					}
				%>
				
			</table>
			
			<div class="w-100 pt-2 mt-5">
				<form action="<%=path %>/reply_write" method="post">
					<input type="text" name="reviewNum" value="<%=review.getReviewnum()%>" hidden>
					
					<textarea class="form-control mb-4" rows="5" cols="120" name="reply" placeholder="소중한 댓글을 남겨주세요"></textarea>
					<div class="text-center">
						<input class="btn btn-translucent-dark" type="submit" value="댓글 등록">
					</div>
				</form>
			
			</div>
			<!-- 리플 끝 -->
            <div class="bt_wrap board_view_wrap text-end">
                <a href="<%=path %>/review_list" class="on text-center">목록</a>
                <% if(user_id.equals(review.getUser_id())){ %>
                <a class="text-center" href="<%=path %>/review_update?reviewNum=<%=review.getReviewnum()%>">수정</a>
                <a class="text-center" href="<%=path %>/review_delete?reviewNum=<%=review.getReviewnum()%>">삭제</a>
                <%} %>
            </div>
        </div>
    </div>

    
    <%@include file="/views/common/footer.jsp"%>