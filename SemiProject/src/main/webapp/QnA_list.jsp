<%@page import="semi.culture.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.qnaboard.model.vo.Qna"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
	List<Qna> list = (List<Qna>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	String searchType = "title";
	String searchValue = "";
	String searchParamValue = request.getParameter("searchValue");
	if(searchParamValue != null && searchParamValue.length() > 0){
		searchType = request.getParameter("searchType");
		searchValue = request.getParameter("searchValue");
	}
%>
    
    <!--문의사항 시작-->
    <main>
        <div class="board_wrap" >
            <div class="board_title">
            
                
                
                <div style="margin-bottom: 30px;">

                    <svg xmlns="http://www.w3.org/2000/svg" width="70" height="50" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16" style="margin-top:-15px">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                </svg>

                    <strong style="margin-bottot:-120px;">문의 게시판</strong>
                    
            <form action="<%=path%>/QnaWrite" method="get" style="text-align:right; font-size:25px; margin-top:-20px; margin-right:50px;">
                    <button style="background-color:#9A161F; border:0; padding-top:5px; padding-right:15px; padding-left:15px; padding-bottom:5px; color:white" type="button" onclick="location.href='<%=path%>/QnaWrite'">문의하기</button>
            </form>
                </div>
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
                            <div class="count">조회</div>
                        </div>
                        
                        <%--게시글 리스트 시작--%>
                        <%for(Qna b : list){ %>
                        <div >
                            <div class="num"><%=b.getNo()%></div>
                            <div class="title"><a href="<%=path+"/QnaView?boardNo="+b.getNo()%>"><%=b.getTitle()%></a></div>
                            <div class="writer"><%=b.getWriter_id()%></div>
                            <div class="date"><%=b.getCreate_date()%></div>
                            <div class="count"><%= b.getReadCount()%></div>
                        </div>
						<%} %>
                       <%--게시글 리스트 끝--%>
                    </div>
                      </div>
                      </div>
                   <%-- 페이지부 시작 --%>
	<div id="pageBar" style="text-align:center; margin-top:25px; font-size:25px; padding-right:15px; padding-left:15px;">
		<%-- 처음으로 가기 --%>													
		<button onclick="location.href='<%=path%>/QnA_list?page=<%=pageInfo.getStartPage()%>'">&lt;&lt;</button>
		<%-- 이전으로 가기 --%>	
		<button onclick="location.href='<%=path%>/QnA_list?page=<%=pageInfo.getPrvePage()%>'">&lt;</button>

		<!-- 10개 목록 출력하기 -->
		<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
			<%if(i == pageInfo.getCurrentPage()){ %>
				<button disabled><%=i%></button>
			<%} else {%>
				<button onclick="location.href='<%=path%>/QnA_list?page=<%=i%>'"><%=i%></button>
			<%} %>
		<%} %>
		<%-- 다음으로 가기 --%>	
		<button onclick="location.href='<%=path%>/QnA_list?page=<%=pageInfo.getNextPage()%>'">&gt;</button>
		
		<%-- 마지막으로 가기 --%>													
		<button onclick="location.href='<%=path%>/QnA_list?page=<%=pageInfo.getEndPage()%>'">&gt;&gt;</button>
	</div>
	<%-- 페이지부 종료 --%>

            </div>  
    </main>
    <!--문의사항 끝-->
    
    

    
    <%@include file="/views/common/footer.jsp"%>