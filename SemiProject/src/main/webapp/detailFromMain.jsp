<%@page import="semi.culture.mvc.show.model.vo.Stadium"%>
<%@page import="semi.culture.common.util.PageInfo"%>
<%@page import="semi.culture.mvc.reviewboard.model.vo.Review"%>
<%@page import="semi.culture.mvc.member.model.vo.DipLike"%>
<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member member = (Member) session.getAttribute("loginMember");
	ShowDetail showDetail = null;
	Stadium stadium = null;
	List<ShowDetail> showList = null;
	List<Review> reviewList = null;
	List<DipLike> dipLike = null;
	try {
	
		if (request.getAttribute("showDetail") != null) {
			showDetail = (ShowDetail) request.getAttribute("showDetail");
		}
		if (request.getAttribute("stadium") != null) {
			stadium = (Stadium) request.getAttribute("stadium");
		}
		if (request.getAttribute("showList") != null) {
			showList = (List<ShowDetail>) request.getAttribute("showList");
		}
		if (request.getAttribute("reviewList") != null) {
			reviewList = (List<Review>) request.getAttribute("reviewList");
		}
		if (request.getAttribute("dipLike") != null) {
			dipLike = (List<DipLike>) request.getAttribute("dipLike");
		}
	} catch (Exception e) {
	
	}
%>

<%@include file="/views/common/header.jsp"%>


<!-- <img src="./resources/d_all_2.svg" style="height: 70%;" alt=""> -->
<section class="m-lg-5">

	<div class="container  mb-md-5 mt-3">
		<img src="<%=path%>/resources/dblquote.svg" class="mb-3" alt="">
		<p class="h3 fw-bold mb-4 " style="color: #9A161F;">
			<%=showDetail.getPrfnm()%>
		</p>
		<div class="float-end">
			<button class="btn-info btn"
				style="background-color: #9A161F; border: #9A161F solid; color: white;"
				onclick="reserveZoneOn()">예매하기</button>
			<%
			int result = 0;
			if (loginMember != null) {
				for (int i = 0; i < dipLike.size(); i++) {
					if (dipLike.get(i).getPrfid().equals(showDetail.getPrfid())) { // 같은 찜 목록 있다면
				result = 1;
			%>
			<button class="btn-info btn"
				style="background-color: #9A161F; border: #9A161F solid; color: white;"
				onclick="location.href='<%=path%>/DeleteDipLike?prfid=<%=showDetail.getPrfid()%>';">
				찜 삭제♥</button>
			<%
					}
				}
			}
			%>


			<button class="btn-info btn"
				style="background-color: #9A161F; border: #9A161F solid; color: white;"
				onclick="DipLike();">찜 하기♡</button>
			<script type="text/javascript">
                  function DipLike() {
					<%if (loginMember == null) {%>
					alert("로그인 후 이용해주세요!");
					<%} else {%>
					location.href='<%=path%>/InsertDipLike?prfid=<%=showDetail.getPrfid()%>';
					<%}%>
					}
			</script>
		</div>
	</div>
	<div class="container w-75" style="width: fit-content;">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs justify-content-start" role="tablist"
			style="width: 100%;">
			<li class="nav-item"><a href="#infoDetail"
				class="nav-link active" data-bs-toggle="tab" role="tab"> 상세 정보 </a>
			</li>
			<li class="nav-item"><a href="#story" class="nav-link"
				data-bs-toggle="tab" role="tab"> 스토리 </a></li>

		</ul>

		<!-- Tabs content -->
		<div class="tab-content border-bottom  ">

			<div class="tab-pane fade show active" id="infoDetail"
				role="tabpanel">
				<div class="row ">
					<div class="col-md-3">
						<img src="<%=showDetail.getPoster()%>" alt=""
							style="height: 100%;">

					</div>
					<div class="col-md-9 ">
						<div class="table-responsive pt-3">
							<table class="table-sm">
								<tbody>
									<tr>
										<th>공연기간</th>
										<td><%=showDetail.getPrfpdfrom()%> ~ <%=showDetail.getPrfpdto()%></td>
									</tr>
									<tr>
										<th>공연장소</th>
										<td><%=showDetail.getFcltynm()%></td>
									</tr>
									<tr>
										<th>공연시간</th>
										<td><%=showDetail.getTimedtguidance()%></td>
									</tr>
									<tr>
										<th>관람연령</th>
										<td><%=showDetail.getPrfage()%></td>
									</tr>
									<tr>
										<th>티켓가격</th>
										<td><%=showDetail.getPcseguidance()%></td>
									</tr>
									<tr>
										<th>출연진</th>
										<td><%=showDetail.getPrfcast()%></td>
									</tr>
								<tfoot>
								</tfoot>
								</tbody>
							</table>
						</div>


					</div>
				</div>
			</div>
			<div class="tab-pane fade " id="story" role="tabpanel">
				<div class="row text-start">
					<div class="col-md-3 justify-content-center">
						<img src="<%=showDetail.getPoster()%>" alt="">

					</div>
					<div class="col-md-9 pt-5  p-2">

						<p>
							<%
							if (showDetail.getSty() == null) {
								out.println("해당 정보 없음");
							} else {
								out.println(showDetail.getSty());
							}
							%>
						</p>

					</div>
				</div>
			</div>
		</div>

	</div>

	<!--예약시작-->
	<form
		action="<%=path%>/ticketInsert?prfid=<%=showDetail.getPrfid()%>"
		method="get">
		<input type="hidden" name="prfid" value="<%=showDetail.getPrfid()%>">
		<input type="hidden" name="prfnm" value="<%=showDetail.getPrfnm()%>">
		<div class="container mt-3  w-75" id="reserveZone"
			style="display: none; width: 100%;">
			<img src="<%=path%>/resources/1000x250_4.svg" alt=""
				style="height: 50%;">
			<div class="continer border">
				<div class="row ">
					<div class="col-8 p-3 m-3 border-end ">
						<div class="text-center border-bottom py-2 my-2">
							<p class="text-muted">
								예매자는 본 안내페이지의 모든 내용을 숙지 및 동의한 것으로 간주합니다. <br> 관람 연령,티켓 수령,
								공연 관람 안내 미숙지로 인한 책임은 관람자 본인에게 있으며,<br> 예매 티켓의 취소/변경/환불은
								불가하오니 이 점 유의 바랍니다.
							</p>
						</div>
						<div class=" py-2">
							<div class="h4 mb-3 pb-3 border-bottom text-center"
								style="color: #9A161F">예매내용</div>
							<div class="row">
								<div class="col-5 border-end">
									<img
										src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTRfMTkx%2FMDAxNjMxNTg2MDY3Mjk0.QkbXdvtbL6Gq2iE88BoIDuEqCWXQ6HlzKlFmu2TVioAg.xity1ljDDgC7-s69FjYv57OR3zRhkTn4wRtCD8cIYVIg.JPEG.motetpark%2F123456.jpg&type=sc960_832"
										alt="">
								</div>
								<div class="col-6 ps-3">
									<!-- Date picker -->
									<div class="mb-2">
										<label class="form-label text-start">공연일</label>
										<div class="input-group align-items-center"
											style="width: 90%;">
											<input class="form-control date-picker rounded pe-5"
												onchange="change_day(this.value);" type="text" id="day"
												name="day" placeholder="Choose date"
												data-datepicker-options='{"altInput": true, "altFormat": "F j, Y", "dateFormat": "Y-m-d"}'>
											<i
												class="ai-calendar position-absolute top-50 end-0 translate-middle-y me-3"></i>
										</div>
									</div>
									<!-- Inline radio buttons -->
									<p class="form-label text-start">관객정보</p>
									<!-- Inline checkboxes -->
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="adult"
											name="type" value="adult"> <label
											class="form-check-label" for="adult">성인</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="juv"
											name="type" value="juv"> <label
											class="form-check-label" for="juv">청소년</label>
									</div>
									<div class="form-check form-check-inline mb-2">
										<input class="form-check-input" type="radio" id="child"
											name="type" value="child"> <label
											class="form-check-label" for="child">어린이</label>
									</div>
									<p class="form-label text-start ">인원</p>
									<div class="inline input-group-sm  mb-2" style="width: 85%;">
										<select class="form-select" id="nmPersonCh" name="peopleCount"
											onchange="change_count(this.value); total(this.form.nmPersonCh.value, this.form.seatInfo.value);">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
										</select>
									</div>
									<p class="form-label text-start">좌석정보</p>
									<%
									String seat = showDetail.getPcseguidance();
									%>
									<div class="inline input-group-sm" style="width: 85%;">
										<select class="form-select" id="nmPersonCh" name="seatInfo"
											onchange="change_seat(this.value); total(this.form.nmPersonCh.value, this.form.seatInfo.value);">
											<option value="0">--좌석 선택--</option>
											<%
											if (seat.contains("R석")) {
												String[] seatArr = seat.split(", ");

												for (int i = 0; i < seatArr.length; i++) {
											%>
											<option
												value="<%=seatArr[i].substring(3).replace(",", "").replace("원", "")%>"><%=seatArr[i]%></option>
											<!--   	<option value="50000">S석 50,000원</option>
                                                		<option value="30000">A석 30,000원</option>
                                                		<option value="10000">B석 10,000원</option> -->
											<%
											}
											%>
											<%
											} else if (seat.contains("전석")) {
											%>
											<option
												value="<%=seat.substring(3).replace(",", "").replace("원", "")%>"><%=seat%></option>
											<%
											}
											%>
										</select>
									</div>
									<!--   <button class="mt-3 btn btn-outline-primary d-block w-25" onclick="completeSelect();">선택완료</button> -->

								</div>
							</div>
						</div>
					</div>

					<div class="col-3">
						<!-- Vertical pricing plan: Border -->
						<div class=" container m-4 pt-7">
							<div class="container mb-3">
								<h3 class="h3">결제 정보</h3>
							</div>

							<ul class="list-unstyled py-2 mb-4">
								<li class="d-flex align-items-center mb-3"><i
									class="ai-check fs-xl text-primary me-2"></i> 결제 금액 : <span
									id="priceTotal">0</span>원</li>
								<li class="d-flex align-items-center mb-3"><i
									class="ai-check fs-xl text-primary me-2"></i> 공연일 : <span
									id="dayCh"></span></li>
								<li class="d-flex align-items-center mb-3"><i
									class="ai-check fs-xl text-primary me-2"></i> 총 인원 : <span
									id="pcount">0</span>명</li>
								<li class="d-flex align-items-center mb-3"><i
									class="ai-check fs-xl text-primary me-2"></i> 좌석당 가격 : <span
									id="seatGrade"></span></li>

							</ul>
							<div class="text-center mb-2">
								<div class="text-sm-end">
									<a class="btn btn-outline-primary d-block w-100"
										href="#add-payment" data-bs-toggle="modal">결제하러 가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				var count = 0;
				var price = 0;
				function change_count(value) {
					document.getElementById("pcount").innerHTML = value;

					count = value;
				}

				function change_seat(value) {
					document.getElementById("seatGrade").innerHTML = value;

					price = value;
				}

				function change_day(value) {
					document.getElementById("dayCh").innerHTML = value;
				}

				function total(count_value, price_value) {
					var total = count * price
					document.getElementById("priceTotal").innerHTML = total;
					document.getElementById("priceTotal").value = total;
				}
			</script>
		</div>


		<div class="modal fade" id="add-payment">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">결제</h4>
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-check mb-4">
							<input class="form-check-input" type="radio" id="card"
								name="payment-method" checked> <label
								class="form-check-label" for="card" data-bs-toggle="radioTab"
								data-bs-target="#card-payment" data-bs-parent="#payment-methods">Credit
								/ Debit card<img class="d-inline-block align-middle ms-2"
								src="<%=path%>img/account/cards/cards.png" alt="Cards accepted"
								width="187">
							</label>
						</div>
						<div class="pt-3" id="payment-methods"
							style="text-align: -webkit-center;">
							<div class="radio-tab-pane active" id="card-payment">
								<form class="row g-0 mx-n2">

									<div class="mb-3 pb-1 col-sm-6 px-2">
										<label class="form-label" for="cc-number">Card number</label>
										<input class="form-control" type="text" id="cc-number"
											placeholder="0000 0000 0000 0000">
									</div>
									<div class="mb-3 pb-1 col-sm-6 px-2">
										<label class="form-label" for="cc-holder-name">Name on
											card</label> <input class="form-control" type="text"
											id="cc-holder-name" placeholder="Card holder's name">
									</div>
									<div class="mb-3 pb-1 col-sm-3 px-2">
										<label class="form-label" for="cc-expiry">Expiry</label> <input
											class="form-control" type="text" id="cc-expiry"
											placeholder="mm/yy">
									</div>
									<div class="mb-3 pb-1 col-sm-3 px-2">
										<label class="form-label" for="cc-cvc">CVC</label> <input
											class="form-control" type="text" id="cc-cvc"
											placeholder="000">
									</div>
									<div class="mb-3 pb-1 col-sm-3 px-2">
										<label class="form-label" for="cc-password">Password</label> <input
											class="form-control" type="password" id="password"
											placeholder="****">
									</div>
								</form>
								<div class="col-sm-6 pt-4 px-2">
									<button class="btn btn-primary d-block w-100 mt-1"
										type="submit">결제하기</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--예약끝-->
	<div class="container mt-3 text-center border-bottom">

		<button type="button" class="btn btn-light mb-3 fw-semibold"
			data-toggle="collapse" data-target="#demo" style="width: 100%;">▼상세이미지를
			확인하려면 클릭하세요.▼</button>
		<div id="demo" class="collapse pb-3">
			<%
			if (showDetail.getStyurls() != null) {
			%>
			<img src="<%=showDetail.getStyurls()%>" alt="">
			<%
			} else {
			%>
			<h3>상세 이미지를 준비중입니다.</h3>
			<%
			}
			%>
		</div>
	</div>

	<div class="container mt-lg-2">

		<div class="row">

			<div class="col mt-5 " style="width: 500px; height:400px;">
				<div class="text-center p-2">
					<p class="h3 mb-3" style="color: #9A161F;">작품리뷰</p>
				</div>
				<!-- Actionalbe list group -->
				<div class="list-group ">
					<%
					if (reviewList != null) {
						for (int i = 0; i < 5; i++) {
					%>
					<a href="# " class="list-group-item list-group-item-action "><%=reviewList.get(i).getRtitle()%></a>
					<%
					}
					}
					%>
					<a href="# " class="list-group-item list-group-item-action ">리뷰가
						없습니다.</a>


				</div>
			</div>

			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dda3c54a7d81d32069b09462383531c1"></script>
                <div class="col mt-5 text-center">
                    <div class="text-center p-2">
                        <p class="h3 mb-3" style="color: #9A161F;">공연장위치</p>
                    </div> 
			<div id="map" style="width:600px;height:400px;"></div> 

                 <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=cf45196fdd120992587a95ae3882e9f3"></script> 
                <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(<%=stadium.getLa()%>, <%=stadium.getLo()%>), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                        // 마커가 표시될 위치입니다 
                        var markerPosition = new kakao.maps.LatLng(37.5660139, 127.0148131);

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);

                        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                        // marker.setMap(null);
                    </script> 


		</div>
	</div>
	</div>

	<!-- Related projects (Carousel)-->
	<div class="container py-3 py-lg-6 mb-4 mt-6">
		<div class="container py-3 py-md-0">
			<h3 class="h3 text-center mb-6" style="color: #9A161F;">공연 중</h3>
			<div class="tns-carousel-wrapper">
				<div class="tns-carousel-inner"
					data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;nav&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 16}, &quot;780&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 16}, &quot;1000&quot;:{&quot;items&quot;:4, &quot;gutter&quot;: 23}}}">
					<%
					for (int i = 0; i < showList.size(); i++) {
						if(i == 5){
							break;
						}
					%>
					<!-- Item-->
					<div class="pb-2">
						<div>
							<img class="card-img" style="height: 400px; width: 400px;"
								src="<%=showList.get(i).getPoster()%>" alt="Portfolio thumb">
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</section>


<%@include file="/views/common/footer.jsp"%>
