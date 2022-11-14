<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/views/common/header.jsp"%>
    
    <%
    	String msg = "";
    	if(request.getAttribute("msg")!=null){
    		msg = (String)request.getAttribute("msg");
    	}
    	
    %>
    <!--로그인 -->
    <section style="text-align: center;" class="mt-5">
        <div class="main-container">
            <div class="main-wrap">
            <span style=" font-size:xx-large; font-weight: bolder; color: #9A161F ;  ">
                    LOGIN
                </span>
            <style>
                .color1 {
                    color: #9A161F;
                    font-size: small;
                }
            </STYLE>
            <div class="color1">등록시 제공한 아이디와 비밀번호를 사용하여 로그인합니다.</div>

            <form action="<%=request.getContextPath() %>/login" method="post">
                <label for="id" hidden >아이디</label>
                <br> <input id="id" class="id" type="text" name="id" placeholder="id" required>
                <br><label for="password" hidden >비밀번호</label>

                <input class="password" type="password" name="pwd" placeholder="Pssword" Password>
                <br>

                <br>
                <input type="submit" class="login"></input>
                <p class="forget-msg">이메일 또는 비밀번호를 잊으셨습니까?| Sign up</p>


            </form>


    </section>


    <section class="Easy-sgin-in-wrap mb-7">


        <a href="" class="sns google">구글 계정으로 로그인</a>
        <a href="" class="sns facebook">페이스북 계정으로 로그인</a>
        <a href="" class="sns naver">네이버 계정으로 로그인</a>
        <a href="" class="sns kakao">카카오톡 계정으로 로그인</a>

    </section>
    

</body>

<style>
     :root {
        --red-color: #9A161F;
    }
</style>

    <%@include file="/views/common/footer.jsp"%>