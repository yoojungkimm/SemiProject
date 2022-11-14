<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp"%>
<%
	String userName = "";
	if(request.getAttribute("userName")!=null){
		 userName = (String)request.getAttribute("userName");
	}
		
%>
    <section class="container pt-3 mb-5">
        <!-- Alert with background image -->
        <div class="   show text-center py-5 bg-position-center bg-repeat-0 bg-size-cover border-0" style="background-image: url(https://cdn.pixabay.com/photo/2019/07/02/11/18/crowd-4312230_960_720.jpg); height: 500px;" role="alert">
        </div>


        <div class="container text-center mt-6 pt-4" style="height: 600px;">

            <h2><%=userName %> 님의 가입이 성공적으로 완료되었습니다!</h2>
            <h2>로그인 후, 컬쳐쇼크의 풍부한 데이터와 서비스를 경험해보세요.</h2>
            <h2>감사합니다.</h2>
            <a type="button" class="btn btn-outline-dark mt-6 w-25 text-black-50" href="<%=path%>/login">로그인</a>

            <p class="pt-7 fs-4">Culture Shock</p>
            <img src="./logo_bigger.svg" style="width: 10%;">
        </div>
    </section>
    
    
    <%@include file="/views/common/footer.jsp"%>