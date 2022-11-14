<%@page import="semi.culture.mvc.noticeboard.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
    Notice notice = (Notice)request.getAttribute("notice");
	
%>
    
    <!--공지사항 -->
    <div class="board_wrap">
        <div class="board_title">
            <div style="margin-bottom: 15px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="70" height="50" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16" style="margin-top:-15px">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
              </svg>
                <strong>공지사항</strong>
            </div>
            <style>
                .color1 {
                    color: #9A161F;
                    font-size: small;
                }
            </STYLE>
            <div class="color1">cultureshock의 따끈따끈한 새소식과 알고 계시면 도움이 되는 공지사항을 한눈에 보실수 있습니다.</div>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
            
                <div class="title">
                   <%=notice.getNoticeTitile() %>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%=notice.getNoticeNum() %></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>관리자</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=notice.getNoticeCreateDate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%=notice.getNoticeReadCount() %></dd>
                    </dl>
                </div>
                <div class="cont" style="font-size:25px; text-align:left;">
                   <%=notice.getNoticeContent()%>

						
                </div>
                 <div style="margin-top:20px; margin-bottom:40px; font-size:20px; width:20px height:30px; " >
                         <button style="background-color:#9A161F;  color:white" type="button" onclick="location.href='<%= request.getContextPath() %>/notice_edit?noticeNo=<%=notice.getNoticeNum()%>'">수정</button>
                          <button   type="button" onclick="location.href='<%=path %>/notice_list'">목록</button>
                    </div>
        </div>
    </div>
    <!--<a href="#">수정</a>-->
    </div>
    </div>
    </div>
    
    <%@include file="/views/common/footer.jsp"%>