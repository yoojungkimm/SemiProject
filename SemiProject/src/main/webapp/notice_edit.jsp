<%@page import="semi.culture.mvc.noticeboard.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
     <%
	// 수정 게시물에 뿌려줄 내용
	Notice notice = (Notice)request.getAttribute("notice");
%>
  <main>
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
        <div class=" board_write_wrap ">
            <div class="board_write ">
                <form action="<%= request.getContextPath()%>/notice_edit" method="POST" >
                	<input type="hidden" name="noticeNo" value="<%=notice.getNoticeNum()%>"/>
                        <div class="board_write">
                            <div class="title">
                                <dl>
                                    <dt style="margin-bottom:-5px; ">제목</dt>
                                    <dd><input name="title" style="width: 655px; height: 40px; margin-top: 15px; margin-left:-30px;" type="text "  value="<%=notice.getNoticeTitile()%>" ></dd>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>글쓴이</dt>
                                    <dd><input  style="height:40px; margin-left: -30px;" type="text" value="관리자" readonly></dd>
                                </dl>
                               
                            </div>
                            <div class=" cont ">
                                <textarea name="content" placeholder="내용 입력 " style="font-size:25px; text-align:left; "><%=notice.getNoticeContent()%></textarea>
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

      </main>
    <%@include file="/views/common/footer.jsp"%>