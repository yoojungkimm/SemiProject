<%@page import="java.util.Random"%>
<%@page import="semi.culture.mvc.member.model.vo.TicketBookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Random rand = new Random();
	int count = rand.nextInt(14)+1;
	TicketBookList tbl = null;
	if(request.getAttribute("tbl") != null){
		
		tbl = (TicketBookList)request.getAttribute("tbl");
	}

%>
    <%@include file="/views/common/header.jsp"%>
    
    <section class="container py-5 mb-5">

        <div class="rounded-top text-center py-5 bg-position-center bg-repeat-0 bg-size-cover border-0" style="background-image: url(https://cdn.pixabay.com/photo/2017/08/07/09/00/theatre-2601686_960_720.jpg)">
            <i class="ai-check-square text-white my-4" style="font-size: 5rem;"></i>
            <div>
                <h2 class="text-white text-shadow inline" style="font-size: 40px;">관람을 완료한 공연입니다.</h2>
                <h3 class="text-white fw-normal text-shadow mb-4 pb-2" style="font-size: 30px;">소중한 리뷰를 작성해주세요.</h3>
            </div>
        </div>
        <div class="container py-3 pb-6">
            <div class="container d-flex flex-column justify-content-center pt-5 mt-n6" style="flex: 1 0 auto;">
                <div class="text-center justify-content-center">
                    <div class="row">
                        <div class="col-4"></div>

                        <div class="col-4 pb-6 pt-7" style="font-size: 40px; color:#9A161F; font-stretch: expanded;">지난 예매 내역</div>

                        <div class="col-4"></div>

                    </div>
                    <div class="row container text-center mb-4" style="width: 100%;">
                        <div class="col-5">
                            <img src="./resources/caliburn_<%=count %>.svg" style="height: 100%;">
                        </div>
                        <!-- Basic table -->
                        <div class="col-7 text-center border-light ">
                            <table class="table ">
                                <tbody>
                                    <tr class="mb-7 pb-7 fs-5">
                                        <th scope="row" style="font-size: 20px;">
                                            예매인
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getUser_id() %>
                                        </td>

                                    </tr>
                                    <tr class="mb-7">
                                        <th scope="row " style="font-size: 20px;">
                                            공연 이름
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getPrfnm() %>
                                        </td>

                                    </tr>
                                    <tr>
                                        <th scope="row" style="font-size: 20px;">
                                            예매일
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getTicketingDate() %>
                                        </td>

                                    </tr>
                                    <tr class="mb-7">
                                        <th scope="row" style="font-size: 20px;">
                                            공연일
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getPreviewDate() %>
                                        </td>

                                    </tr>
                                    <tr class="mb-7">
                                        <th scope="row" style="font-size: 20px;">
                                            결제금액
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getPrice() %> 원
                                        </td>
                                    </tr>
                                    <tr class="mb-7">
                                        <th scope="row" style="font-size: 20px;">
                                            총 인원
                                        </th>
                                        <td class="text-start" style="font-size: 20px;">
                                            <%=tbl.getPersonCount() %> 인
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="container text-end">

                            <button class="btn btn-translucent-dark">리뷰작성</button>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="container text-center mt-7">
                <div>
                    <img src="./logo_bigger.svg" class="mb-7" style="height: 80px;" alt="">
                </div>
                <div class="text-muted">
                    <p>※ 실내 마스크 착용 의무화 마스크 미착용 시 극장 내 출입이 제한됩니다. </p>
                    <p>◆ 만 13세 이상 관람가 2022년 기준 2009년 포함 이후 출생자 관람 불가 (미취학 아동, 초등학생 관람 불가) </p>
                    <p>◆ 위 관람 등급에 부합되지 않는 초등학생 및 어린이는 티켓 유무, 보호자의 동반 여부와 관계없이 공연장 입장이 절대 불가합니다. </p>
                    <p>◆ 관람 연령 기준은 생년월일을 가장 최우선으로 확인합니다. </p>
                    <p>◆ 당일 티켓 취소/ 환불/ 변경 불가 </p>
                    <p>◆ 공연 시작 후 입장이 제한되며 이로 인한 당일 취소/변경/ 환불이 불가합니다. </p>
                    <p>◆ 공연 시작 10분전까지는 입장해 주시기 바랍니다. </p>
                    <p>◆ 공연 당일 주차 및 교통난으로 인해 당일 관람 불가하거나 관람을 포기한 경우 예매 티켓의 취소/변경/환불이 불가합니다. </p>
                    <p>◆ 공연 당일 교통이 혼잡하오니 가급적 대중교통을 이용해 주시기 바랍니다. </p>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/views/common/footer.jsp"%>