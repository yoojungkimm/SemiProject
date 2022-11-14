<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	Member member = null;
	if(session.getAttribute("loginMember")!=null){
		
	  member = (Member)session.getAttribute("loginMember");
	}
%>    
<%@include file="/views/common/header.jsp"%>
    
    
    <!--리뷰쓰기 등록화면 -->
    <div class="board_wrap">
        <div class="board_title">
            <div style="margin-bottom: 10px;">

                <svg xmlns="http://www.w3.org/2000/svg" width="70" height="50" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16" style="margin-top:-15px">
                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                  </svg>
                <strong>리뷰 게시판</strong>
            </div>
            <style>
                .color1 {
                    color: #9A161F;
                    font-size: small;
                }
            </STYLE>
            <div class="color1">단기간이더라도 정성껏 상품평 작성 시 급상승 리뷰어 혜택을 드립니다.</div>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <form name="myform" id="myform" method="post" action="<%=path %>/review_write" enctype="">
                <% if(member != null){%>
                <input type="text" name="writer" value="<%=member.getUser_id()%>" hidden>
                <%} %>
                <div class="title">
                    <dl>
                        <dt style="margin-bottom:5px;">제목</dt>
                        <dd><input type="text" name="title" placeholder="제목 입력" value=""></dd>
                    </dl>
                </div>
                     <h4 style="width:100px; margin-bottom:7px;">고객 만족도</h4>
                    <legend style="margin-left:90px; margin-top:-40px;">
                    
 						<fieldset style="margin-left: 40px;">
                            <input type="radio" name="rating" value="1" id="rate1"><label for="rate1" style="font-size:20px; margin-left:10px;"> ⭐</label>
                            <input type="radio" name="rating" value="2" id="rate2"><label for="rate2" style="font-size:20px;  margin-left:10px;" > ⭐⭐</label>
                            <input type="radio" name="rating" value="3" id="rate3"><label for="rate3" style="font-size:20px; margin-left:10px;" > ⭐⭐⭐</label>
                            <input type="radio" name="rating" value="4" id="rate4"><label for="rate4" style="font-size:20px; margin-left:10px;" >⭐⭐⭐⭐</label>
                            <input type="radio" name="rating" value="5" id="rate5" checked><label for="rate5" style="font-size:20px; margin-left:10px;" > ⭐⭐⭐⭐⭐</label>
                        </fieldset>
                    </legend>
	                <div class="cont">
	                    <textarea style="font-size: 15px;" name="content" placeholder="내용 입력" value=""></textarea>
	                </div>
	                <br>
		            <div class="text-center">
		                <input type="submit" class="btn btn-outline-dark btn-lg px-5" value="리뷰등록"></input>
		            </div>
		            <br>
		            <div class="bt_wrap">
                       	<a href="<%=path %>/review_list">리스트로 돌아가기</a>
		            </div>
                </form>
            </div>
        </div>
    </div>
    
    <%@include file="/views/common/footer.jsp"%>