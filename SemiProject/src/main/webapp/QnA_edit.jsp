<%@page import="semi.culture.mvc.qnaboard.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
	// 수정 게시물에 뿌려줄 내용
	Qna qna = (Qna)request.getAttribute("board");
%>
    <main>
        <!-- 문의사항 수정 시작 -->
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
                <div class=" board_write_wrap ">
                    <div class="board_write ">
                <form action="<%= request.getContextPath()%>/QnA_edit" method="POST" >
                	<input type="hidden" name="boardNo" value="<%=qna.getNo()%>"/>
                        <div class="board_write">
                            <div class="title">
                                <dl>
                                    <dt style="margin-bottom:-5px; ">제목</dt>
                                    <dd><input name="title" style="width: 655px; height: 40px; margin-top: 15px; margin-left:-30px;" type="text "  value="<%=qna.getTitle()%>" ></dd>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>글쓴이</dt>
                                    <dd><input name="writer" style="height:40px; margin-left: -30px;" type="text" value="<%=qna.getWriter_id()%>" readonly></dd>
                                </dl>
                               
                            </div>
                            <div class=" cont ">
                                <textarea name="content" placeholder="내용 입력 " style="font-size:25px; text-align:left; "><%=qna.getContent()%></textarea>
                            </div>
                        </div>
                         <div style="margin-top:40px; font-size:20px; width:20px height:30px; " >
                        <input style="background-color:#9A161F;  color:white" type="submit" class="on" value="수정">
                        <input  type="button"  onclick="location.replace('<%=request.getContextPath()%>/QnA_list')" value="목록">
                    </div>
                    </form>
                       
                        </div>
                    </div>
                </div>
                </div>
                <!-- 문의사항 수정 끝 -->
    </main>
    
    
    <%@include file="/views/common/footer.jsp"%>