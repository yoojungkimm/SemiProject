<%@page import="semi.culture.mvc.qnaboard.model.vo.QnaReply"%>
<%@page import="semi.culture.mvc.qnaboard.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
	Qna qna = (Qna)request.getAttribute("qna");
	
%>
    
    
    <!--공지사항 -->
    <div class="board_wrap">
        <div class="board_title">
            <div style="margin-bottom: 30px;">

                <svg xmlns="http://www.w3.org/2000/svg" width="70" height="50" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16" style="margin-top:-15px">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                </svg>
                <strong>문의 게시판</strong>
            </div>
            <style>
                .color1 {
                    color: #9A161F;
                    font-size: small;
                }
            </STYLE>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                   <%=qna.getTitle() %>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%=qna.getNo() %></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=qna.getWriter_id() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=qna.getCreate_date() %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%=qna.getReadCount() %></dd>
                    </dl>
                </div>
                <div class="cont" style="font-size:25px; text-align:left;">
                   <%=qna.getContent()%>

						
                </div>
                 <div style="margin-top:20px; margin-bottom:40px; font-size:20px; width:20px height:30px; " >
                         <button style="background-color:#9A161F;  color:white" type="button" onclick="location.href='<%= request.getContextPath() %>/QnA_edit?boardNo=<%=qna.getNo()%>'">수정</button>
                         <button  type="button" onclick="location.href='<%=path %>/QnA_list'">목록</button>
                    </div>
               
            
            <!-- 리플리스트 출력 시작-->
            <h4 class="pb-2 mb-2 text-center text-md-start">관리자 답변</h4>
		<table id="tbl-comment">
			<%for(QnaReply reply: qna.getReplies()) { %>
				<tr>
					<td>
						<br>
						<sub style="font-size:25px;" ><%= reply.getContent() %> </sub>
						
						
					</td>
				</tr>
			<%} %>
		</table>
		<br><br>
		
		
		
		
		
		<!-- 리플리스트 출력 종료 -->
                <!-- 답변 시작 -->
               <!-- 리플 등록 form 시작 -->
		<div id="comment-container">
	    	<div class="comment-editor">
	 			<form action="<%=request.getContextPath()%>/QnaReply" method="post">
					<input type="hidden" name="boardNo" value="<%=qna.getNo()%>" />
					<input type="hidden" name="writer" value="<%=loginMember != null ? loginMember.getUser_id() : "" %>" />
					<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	  	
	 			</form>
	    	</div>
	   	</div>
		<!-- 리플 등록 form 종료 -->
		
		
		
               

                <!-- 답변 끝 -->
                
               
            </div>
           
            
              
                 
        </div>
    </div>
    <!--<a href="#">수정</a>-->
    <%@include file="/views/common/footer.jsp"%>