<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
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
                    글 제목이 들어갑니다.
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>김이름</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2021.1.16</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont" style="font-size:17px; text-align:left;">
                    안녕하세요.
                    <BR>안녕하세요.
                    <BR>안녕하세요.
                    <BR>안녕하세요.
                    <BR>안녕하세요.
                    <BR>안녕하세요.
                    <BR>감사합니다.

                </div>
                <!-- 답변 시작 -->
                <div class="mb-3 pb-1">
                    <textarea style="width: 1000px; height: 150px; font-size:15px;" class="form-control" rows="10" placeholder="관리자 답변" required></textarea>
                </div>
                <div class="col-lg-6 col-md-8">
                    <button class="btn btn-primary-2 btn-block" type="submit">제출</button>
                </div>

                <!-- 답변 끝 -->
            </div>
            <div class="bt_wrap">
                <a href="QnA_list.jsp" class="on">목록</a>
                <a href="QnA_edit.jsp">수정</a>
            </div>
        </div>
    </div>
    <!--<a href="#">수정</a>-->
    
    <%@include file="/views/common/footer.jsp"%>