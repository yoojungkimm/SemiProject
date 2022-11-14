<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    <!--리뷰게시판 -->
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
        <div class=" board_write_wrap ">
            <div class="board_write ">
                <div class="title">
                    <dl>
                        <dt style="margin-bottom:5px;">제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <form name="myform" id="myform" method="post" action="./save">
                    <h4 style="width:100px; margin-bottom:7px;">고객 만족도</h4>
                    <legend style="margin-left:90px; margin-top:-40px;">

                       <fieldset style="margin-left: 40px;">
                            <input type="radio" name="rating" value="5" id="rate1"><label for="rate1" style="font-size:20px; margin-left:10px;"> ⭐</label>
                            <input type="radio" name="rating" value="4" id="rate2"><label for="rate2" style="font-size:20px;  margin-left:10px;" > ⭐⭐</label>
                            <input type="radio" name="rating" value="3" id="rate3"><label for="rate3" style="font-size:20px; margin-left:10px;" > ⭐⭐⭐</label>
                            <input type="radio" name="rating" value="2" id="rate4"><label for="rate4" style="font-size:20px; margin-left:10px;" >⭐⭐⭐⭐</label>
                            <input type="radio" name="rating" value="1" id="rate5"><label for="rate5" style="font-size:20px; margin-left:10px;" > ⭐⭐⭐⭐⭐</label>
                        </fieldset>

                    </legend>
                </form>
                <div class="cont ">
                    <textarea style="font-size:15px;" placeholder="내용 입력 ">
안녕하세요.
안녕하세요.
안녕하세요.
안녕하세요.
안녕하세요.
안녕하세요.
감사합니다.

</textarea>
                </div>
            </div>
             <input style="margin-top:10px;" type='file' accept='image/jpg,image/png,image/jpeg,image/gif' id='profile_img_upload' />
            <div class="bt_wrap ">
            
                <a href="review_view.jsp" class="on ">수정</a>
                <a href="review_view.jsp ">취소</a>
            </div>
        </div>
    </div>
    
    
    <%@include file="/views/common/footer.jsp"%>