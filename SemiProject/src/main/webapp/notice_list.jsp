<%@page import="java.util.List"%>
<%@page import="semi.culture.common.util.PageInfo"%>
<%@page import="semi.culture.mvc.noticeboard.model.vo.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
    List<Notice> list = (List<Notice>)request.getAttribute("list");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    
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
            <form action="<%=path%>/noticeWrite" method="get" style="text-align:right; font-size:25px; margin-top:-20px; margin-right:50px;">
                    <button style="background-color:#9A161F; border:0; padding-top:5px; padding-right:15px; padding-left:15px; padding-bottom:5px; color:white" type="button" onclick="location.href='<%=path %>/noticeWrite'">작성하기</button>
            </form>
            <style>
                .color1 {
                    color: #9A161F;
                    font-size: small;
                }
            </STYLE>
            <div class="color1">cultureshock의 따끈따끈한 새소식과 알고 계시면 도움이 되는 공지사항을 한눈에 보실수 있습니다.</div>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                <%--게시글 리스트 시작--%>
                        <%for(Notice n : list){ %>
                        <div >
                            <div class="num"><%=n.getNoticeNum()%></div>
                            <div class="title"><a href="<%=path+"/NoticeView?NoticeNo="+n.getNoticeNum()%>"><%=n.getNoticeTitile()%></a></div>
                            <div class="writer">관리자</div>
                            <div class="date"><%=n.getNoticeCreateDate()%></div>
                            <div class="count"><%= n.getNoticeReadCount()%></div>
                        </div>
						<%} %>
               
            </div>
            <%-- 페이지부 시작 --%>
	<div id="pageBar" style="text-align:center; margin-top:25px; font-size:25px; padding-right:15px; padding-left:15px;">
		<%-- 처음으로 가기 --%>													
		<button onclick="location.href='<%=path%>/notice_list?page=<%=pageInfo.getStartPage()%>'">&lt;&lt;</button>
		<%-- 이전으로 가기 --%>	
		<button onclick="location.href='<%=path%>/notice_list?page=<%=pageInfo.getPrvePage()%>'">&lt;</button>

		<!-- 10개 목록 출력하기 -->
		<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
			<%if(i == pageInfo.getCurrentPage()){ %>
				<button disabled><%=i%></button>
			<%} else {%>
				<button onclick="location.href='<%=path%>/notice_list?page=<%=i%>'"><%=i%></button>
			<%} %>
		<%} %>
		<%-- 다음으로 가기 --%>	
		<button onclick="location.href='<%=path%>/notice_list?page=<%=pageInfo.getNextPage()%>'">&gt;</button>
		
		<%-- 마지막으로 가기 --%>													
		<button onclick="location.href='<%=path%>/notice_list?page=<%=pageInfo.getEndPage()%>'">&gt;&gt;</button>
	</div>
	<%-- 페이지부 종료 --%>
           <!-- <div class="bt_wrap">
                <a href="notice_write.jsp" class="on">등록</a>
                <a href="#">수정</a>
            </div>-->
        </div>
    </div>
    <%@include file="/views/common/footer.jsp"%>