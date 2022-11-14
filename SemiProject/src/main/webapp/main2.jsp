<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.lang.model.util.SimpleAnnotationValueVisitor14"%>
<%@page import="java.util.Date"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.qnaboard.model.vo.Qna"%>
<%@page import="semi.culture.mvc.noticeboard.model.vo.Notice"%>
<%@page import="semi.culture.mvc.reviewboard.model.vo.Review"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowRank"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/views/common/header.jsp"%>
<%

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		int count = 1;

		List<ShowDetail> musicalRankList = null;
		List<ShowDetail> classicRankList = null;
		List<ShowDetail> DramaRankList = null;
		List<ShowDetail> triditionalRankList = null;
		List<ShowDetail> muListAll = (List<ShowDetail>)request.getAttribute("muListAll");                 
		List<ShowDetail> koListAll = (List<ShowDetail>)request.getAttribute("koListAll");                 
		List<ShowDetail> clListAll = (List<ShowDetail>)request.getAttribute("clListAll");                 
		List<ShowRank> rankSeoul = null;
		List<ShowRank> rankKuyngki = null;
		List<ShowRank> rankKuyngsang = null;
		List<ShowRank> rankJeolla= null;
		                                
		List<Review> reviewList = null;
		                                
		List<Notice> noticeList = null;
		                                
		List<Qna> qnaList = null;
		
		if(request.getAttribute("musicalRankList")!=null){
			musicalRankList = (List<ShowDetail>)request.getAttribute("musicalRankList");
		}
		if(request.getAttribute("classicRankList")!=null){
			classicRankList = (List<ShowDetail>)request.getAttribute("classicRankList");
		}
		if(request.getAttribute("DramaRankList")!=null){
			DramaRankList = (List<ShowDetail>)request.getAttribute("DramaRankList");
		}
		if(request.getAttribute("triditionalRankList")!=null){
			triditionalRankList = (List<ShowDetail>)request.getAttribute("triditionalRankList");
		}
		if(request.getAttribute("rankSeoul")!=null){
			rankSeoul = (List<ShowRank>)request.getAttribute("rankSeoul");
		}
		if(request.getAttribute("rankKuyngki")!=null){
			rankKuyngki = (List<ShowRank>)request.getAttribute("rankKuyngki");
		}
		if(request.getAttribute("rankKuyngsang")!=null){
			rankKuyngsang = (List<ShowRank>)request.getAttribute("rankKuyngsang");
		}
		if(request.getAttribute("rankJeolla")!=null){
			rankJeolla = (List<ShowRank>)request.getAttribute("rankJeolla");
		}
		if(request.getAttribute("reviewList")!=null){
			reviewList = (List<Review>)request.getAttribute("reviewList");
		}
		if(request.getAttribute("noticeList")!=null){
			noticeList = (List<Notice>)request.getAttribute("noticeList");
		}
		if(request.getAttribute("qnaList")!=null){
			qnaList = (List<Qna>)request.getAttribute("qnaList");
		}
%>


   
  <!-- 슬라이드 시작 -->
  
  
  
        <!-- Hero - Featured Products (tabs)-->
        <section  style="background-color: #9A161F; padding-bottom:10px;">
            <div class="shape shape-bottom shape-curve " >
                <svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 185.4">
          </svg>
            </div>
            <!-- 검색창 시작 -->
 			<div class="container " style="padding-left:55px; padding-top:40px; padding-bottom:40px;">
                <div class="row justify-content-center ">
                    <div class="col-lg-7 ">
                        <form class="input-group" action="<%=path%>/searchFromMain">
                            <input  class="form-control" type="text" name="searchWord" required>
                            <button class="btn btn-primary-3 " type="submit"><i class="ai-search fs-xl-1 me-1"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 검색창 끝 -->


            <!-- Categories (carousel)-->
            <section class="container position-relative zindex-5" >
                <div class="tns-carousel-wrapper container" style="margin-bottom:10px;">
                    <div class="tns-carousel-inner"  data-carousel-options="{&quot;items&quot;: 3, &quot;controls&quot;: false, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;560&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3}}}">
                       
                       
                      		<div class="col-4" style="margin-left:70px;">
	                                <img style="width:280px; height:380px;" src="<%=classicRankList.get(0).getPoster() %>" alt="지킬엔하이드">
	                               <div style="display: inline-block; margin-left: 20px">
		                                <div style="margin-top:10px; margin-left:-15px; font-size: 1.7em; font: bold;  color:  white;">(클래식)<%=classicRankList.get(0).getPrfnm() %> </div>
		                                 <div style="margin-top:10px; margin-left:-15px; font-size: 1.5em;   color:  white; ">2022.08.08(월)~08.29(월) </div>
		                                    <button style="margin-top:10px; margin-left:20px;" type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=classicRankList.get(0).getPrfid()%>">자세히보기</a></button>
	                                        </div>
                                   </div>
                                          		 
                                   <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=classicRankList.get(2).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px;  margin-left:-5px; font-size: 1.7em; font: bold;  color:  white;">(클래식)<%=classicRankList.get(2).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.07.31(일)~09.01(목) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=classicRankList.get(2).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>    
                                          		   
                                   <div class="col-4">
	                                                <img style="width:280px; height:380px;" src="<%=clListAll.get(3).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.7em; font: bold;  color:  white;">(클래식)<%=clListAll.get(3).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.07.31(일)~09.14(수) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=clListAll.get(3).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>      
          
         									  <div class="col-4">
	                                                <img style="width:280px; height:380px;" src="<%=musicalRankList.get(0).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:30px; font-size: 1.7em; font: bold;  color:  white;">(뮤지컬)<%=musicalRankList.get(0).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.07.01(금)~08.31(수) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=musicalRankList.get(0).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>
	
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=musicalRankList.get(2).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px;  margin-left:30px; font-size: 1.7em; font: bold;  color:  white;">(뮤지컬)<%=musicalRankList.get(2).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.01(월)~09.20(화) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=musicalRankList.get(2).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div> 
                                          		 
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=musicalRankList.get(3).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:10px; font-size: 1.7em; font: bold;  color:  white;">(뮤지컬)<%=musicalRankList.get(3).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.01(월)~09.03(토) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=musicalRankList.get(3).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div> 
                        
                       							  <div class="col-4">
	                                                <img style="width:280px; height:380px;" src="<%=DramaRankList.get(0).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:65px; font-size: 1.7em; font: bold;  color:  white;">(연극)<%=DramaRankList.get(0).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.20(토)~09.14(수) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=DramaRankList.get(0).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>
	
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=DramaRankList.get(2).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:50px; font-size: 1.7em; font: bold;  color:  white;">(연극)<%=DramaRankList.get(2).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.17(수)~09.30(금) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=DramaRankList.get(2).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>   
                                          		  
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=DramaRankList.get(3).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:-22px; font-size: 1.7em; font: bold;  color:  white;">(연극)<%=DramaRankList.get(3).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.17(수)~09.30(금) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=DramaRankList.get(3).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div> 
                                          		    
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=koListAll.get(0).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:8px; font-size: 1.7em; font: bold;  color:  white;">(국악)<%=koListAll.get(0).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.17(수)~08.28(일) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=koListAll.get(0).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>    
                                          		 
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=koListAll.get(1).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:-55px; font-size: 1.7em; font: bold;  color:  white;">(국악)<%=koListAll.get(1).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.17(수)~09.30(금) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=koListAll.get(1).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>    
                                          		 
	                                              <div class="col-4" >
	                                                <img style="width:280px; height:380px;" src="<%=koListAll.get(8).getPoster() %>" alt="지킬엔하이드">
	                                                <div style="display: inline-block; margin-left: 20px">
		                                                <div style="margin-top:10px; margin-left:15px; font-size: 1.7em; font: bold;  color:  white;">(국악)<%=koListAll.get(8).getPrfnm() %> </div>
		                                                <div style="margin-top:10px; margin-left:-10px; font-size: 1.5em;   color:  white; ">2022.08.17(수)~10.13(목) </div>
		                                                <button style="margin-top:10px; margin-left:20px; " type="button" class="btn btn-outline-light button-2"><a href="<%=path %>/showSelect?prfid=<%=koListAll.get(8).getPrfid()%>">자세히보기</a></button>
	                                                </div>
                                          		 </div>    
                                          		 
                                          		
           
          
                    </div>
                </div>
            </section>
        </section>
  
   
        <!-- 슬라이드 끝 -->


        <!-- 랭킹시작-->

        <div class="container p-7" style="margin-top:-30px;">
            <div  style="margit-left:-650px; margin-bottom:-80px;">
                <p class="h1 mb-5 fs-1 " style=" color: #9A161F; ">Ranking</p>
            </div>
            <div class="masonry-filterable">


                <!-- Filters -->
                <ul class="masonry-filters nav nav-tabs justify-content-center pb-4" style="color:#9A161F;">
                   
                    <li class="nav-item">
                        <a class="nav-link active" href="#" data-group="musical" style="color:#9A161F; font-size:20px;">뮤지컬</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="theater" style="color:#9A161F; font-size:20px;">연극</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="classic" style="color:#9A161F; font-size:20px;">클래식</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-group="korean" style="color:#9A161F; font-size:20px;">국악</a>
                    </li>
                </ul>

                <!-- Grid -->
                <div class="masonry-grid" data-columns="4">
					<%
						if(musicalRankList!=null && musicalRankList.size()>0){
							for(int i = 0; i < 4;i++){
							String marginCount = "";
					%>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["musical"]' >

                        <!-- Image on top -->
                  		<%
                  			if(i==0){
                  				marginCount  = "";
                  			}else{
                  				marginCount = i +"";
                  			}
                  		%>
                
                        
                        <div class="card cardSize mar<%=marginCount%>">
                            <img src="<%=path %>/resources/caliburn_<%=count++ %>.svg" class="card-img-top imgSize" alt="Card image"style="height:200px;">
                            <div class="card-body"style="height:270px;">
                                <h5 class="card-title"><%=musicalRankList.get(i).getPrfnm() %></h5>
                                <p class="card-text fs-sm">공연장:<%=musicalRankList.get(i).getFcltynm()%> <br> 가격:<%=musicalRankList.get(i).getPcseguidance() %> <br>관람연령: <%=musicalRankList.get(i).getPrfage()%><br>기간: <%=musicalRankList.get(i).getPrfpdfrom()%>-<%=musicalRankList.get(i).getPrfpdto() %></p>
                                <a href="<%=path %>/detailFromMain?prfmid=<%=musicalRankList.get(i).getPrfid() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">더보기</a>
                            </div>
                        </div>
                    </div>
            		<%
            				
            		
							} 
						}
            		%>

                    <%
						if(DramaRankList!=null && DramaRankList.size()>0){
							for(int i = 0; i < 4;i++){
							String marginCount = "";
					%>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["theater"]'>

                        <!-- Image on top -->
                  		<%
                  			if(i==0){
                  				marginCount  = "";
                  			}else{
                  				marginCount = i +"";
                  			}
                  		%>
                
                        
                        <div class="card cardSize mar<%=marginCount%>">
                            <img src="<%=path %>/resources/caliburn_<%=count++ %>.svg" class="card-img-top imgSize" alt="Card image" style="height:200px;">
                            <div class="card-body"style="height:270px;">
                                <h5 class="card-title"><%=DramaRankList.get(i).getPrfnm() %></h5>
                                <p class="card-text fs-sm">공연장:<%=DramaRankList.get(i).getFcltynm()%> 
                                <br> 가격:<%=DramaRankList.get(i).getPrfpdto() %> 
                                <br>관람연령: <%=DramaRankList.get(i).getPrfage()%>
                                <br>기간: <%=DramaRankList.get(i).getPrfpdfrom()%>-<%=DramaRankList.get(i).getPrfpdfrom()%></p>
                                <a href="<%=path %>/detailFromMain?prfmid=<%=DramaRankList.get(i).getPrfid() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">더보기</a>
                            </div>
                        </div>
                    </div>
            		<%
            				
							} 
						}
            		%>
                    

                    <%
						if(classicRankList!=null && classicRankList.size()>0){
							for(int i = 0; i < 4;i++){
							String marginCount = "";
					%>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["classic"]'>

                        <!-- Image on top -->
                  		<%
                  			if(i==0){
                  				marginCount  = "";
                  			}else{
                  				marginCount = i +"";
                  			}
                  		%>
                
                        
                        <div class="card cardSize mar<%=marginCount%>">
                            <img src="<%=path %>/resources/caliburn_<%= count++ %>.svg" class="card-img-top imgSize" alt="Card image"style="height:200px;">
                            <div class="card-body"style="height:270px;">
                                <h5 class="card-title"><%=classicRankList.get(i).getPrfnm() %></h5>
                                <p class="card-text fs-sm">공연장:<%=classicRankList.get(i).getFcltynm()%> 
                                <br> 가격:<%=classicRankList.get(i).getPrfpdto() %> 
                                <br>관람연령: <%=classicRankList.get(i).getPrfage()%>
                                <br>기간: <%=classicRankList.get(i).getPrfpdfrom()%>-<%=classicRankList.get(i).getPrfpdfrom()%></p>
                                <a href="<%=path %>/detailFromMain?prfmid=<%=classicRankList.get(i).getPrfid() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">더보기</a>
                            </div>
                        </div>
                    </div>
            		<%
            				
							} 
						}
            		%>
                    
                    
                    <%
						if(triditionalRankList!=null && triditionalRankList.size()>0){
							for(int i = 0; i < 4;i++){
							String marginCount = "";
					%>
                    <!-- Item -->
                    <div class="masonry-grid-item" data-groups='["korean"]'>

                        <!-- Image on top -->
                  		<%
                  			if(i==0){
                  				marginCount  = "";
                  			}else{
                  				marginCount = i +"";
                  			}
                  		%>
                
                        
                        <div class="card cardSize mar<%=marginCount%>">
                            <img src="<%=path %>/resources/caliburn_<%=count++ -1 %>.svg" class="card-img-top imgSize" alt="Card image"style="height:200px;">
                            <div class="card-body"style="height:270px;">
                                 <h5 class="card-title"><%=triditionalRankList.get(i).getPrfnm() %></h5>
                                <p class="card-text fs-sm">공연장:<%=triditionalRankList.get(i).getFcltynm()%> 
                                <br> 가격:<%=triditionalRankList.get(i).getPrfpdto() %> 
                                <br>관람연령: <%=triditionalRankList.get(i).getPrfage()%>
                                <br>기간: <%=triditionalRankList.get(i).getPrfpdfrom()%>-<%=triditionalRankList.get(i).getPrfpdfrom()%></p>
                                <a href="<%=path %>/detailFromMain?prfmid=<%=triditionalRankList.get(i).getPrfid() %>" class="btn btn-sm btn-primary" style="background-color: #9A161F; border: #9A161F;">더보기</a>
                            </div>
                        </div>
                    </div>
            		<%
            				
							} 
						}
            		%>
                    
                    <!-- More items... -->
                </div>
            </div>
        </div>
        <!-- 랭킹 끝-->

        <!-- 지역별 랭킹 시작 -->


        <div style="margin-top:-100px;">
            <div class="container mt-5 p-10">
                <p class="h1 mb-4 fs-1 " style="padding-bottom: -4; margin-left: 230px; color: #9A161F;">Regional ranking</p>
                <div class="d-flex align-items-start">
                    <div class="nav flex-column nav-pills  me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">서울</button>
                        <button class="nav-link " id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#gyeonggi" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">경기</button>
                        <button class="nav-link " id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">대구/부산/경북/경남</button>
                        <button class="nav-link " id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">대전/전라/전남/전북</button>
                    </div>
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active tabSize" id="v-pills-home" role="tabpanel" aria-labelledby="seoul">
                            
                            <%if(rankSeoul!=null &&rankSeoul.size()>0) {
                            	int num = 1;
                            	for(int i = 0; i<4;i++){
                            %>
                            
                            <div class="card-1 cardSize-<%=num%>">
                            	<a href="<%=path%>/detailFromMain?prfmid=<%=rankSeoul.get(i).getPrfid() %> ">
                                <img src="<%=rankSeoul.get(i).getPoster() %>" class="imgSize-1 " alt="Card image">

                                <div class="card-body text-center">
                                    <h6 class="card-title mar-top" style="width:; margin-left:0px;"><%=rankSeoul.get(i).getPrfnm() %></h6>
                                    <p class="card-text fs-sm mar-top"style="width:; margin-left:0px;"><%=today %> </p>
                                </div>
                                </a>
                            </div>
                            
                            <%		
                            
                            		num ++;
                            		if(num > 2 ){
                            			num = 1;
                            		}
                            		if(rankSeoul.size()==i){
                            			break;
                            		}
                            %>
                            <%		}
                            	}
                            %>
                        </div>
                        <div class="tab-pane fade tabSize" id="gyeonggi" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <%if(rankKuyngki!=null &&rankKuyngki.size()>0) {
                            	int num = 1;
                            	for(int i = 0; i<4;i++){
                            %>
                            <div class="card-1 cardSize-<%=num%>">
                            	<a href="<%=path%>/detailFromMain?prfmid=<%=rankKuyngki.get(i).getPrfid()%>">
                                <img src="<%=rankKuyngki.get(i).getPoster() %>" class="imgSize-1 " alt="Card image">

                                <div class="card-body text-center">
                                    <h6 class="card-title mar-top" style="width:; margin-left:0px;"><%=rankKuyngki.get(i).getPrfnm() %></h6>
                                    <p class="card-text fs-sm mar-top"style="width:; margin-left:0px;"><%=today %> </p>
                                </div>
                                </a>
                            </div>
                            <%		
                            
                            		num ++;
                            		if(num > 2 ){
                            			num = 1;
                            		}
                            		if((rankKuyngki.size()-1)==i){
                            			break;
                            		}
                            %>
                            <%		}
                            	}
                            %>
                        </div>
                        <div class="tab-pane fade tabSize" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <%if(rankKuyngsang!=null &&rankKuyngsang.size()>0) {
                            	int num = 1;
                            	for(int i = 0; i<4;i++){
                            %>
                            <div class="card-1 cardSize-<%=num%>">
                                <a href="<%=path%>/detailFromMain?prfmid=<%=rankKuyngsang.get(i).getPrfid()%>">
                            
                                <img src="<%=rankKuyngsang.get(i).getPoster() %>" class="imgSize-1 " alt="Card image">

                                <div class="card-body text-center">
                                    <h6 class="card-title mar-top" style="width:; margin-left:0px;"><%=rankKuyngsang.get(i).getPrfnm() %></h6>
                                    <p class="card-text fs-sm mar-top"style="width:; margin-left:0px;"><%=today %> </p>
                                </div>
                                </a>
                            </div>
                            <%		
                            
                            		num ++;
                            		if(num > 2 ){
                            			num = 1;
                            		}
                            		if((rankKuyngsang.size()-1)==i){
                            			break;
                            		}
                            %>
                            <%		}
                            	}
                            %>
                            
                        </div>
                        <div class="tab-pane fade tabSize" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                        
                            <%if(rankJeolla!=null &&rankJeolla.size()>0) {
                            	int num = 1;
                            	for(int i = 0; i<4;i++){
                            %>
                            <div class="card-1 cardSize-<%=num%>">
                                <a href="<%=path%>/detailFromMain?prfmid=<%=rankJeolla.get(i).getPrfid()%>">
                            
                                <img src="<%=rankJeolla.get(i).getPoster() %>" class="imgSize-1 " alt="Card image">

                                <div class="card-body text-center">
                                    <h6 class="card-title mar-top" style="width:; margin-left:0px;"><%=rankJeolla.get(i).getPrfnm() %></h6>
                                    <p class="card-text fs-sm mar-top"style="width:; margin-left:0px;"><%=today %> </p>
                                </div>
                                </a>
                            </div>
                            <%		
                            		num ++;
                            		if(num > 2 ){
                            			num = 1;
                            		}
                            		if((rankJeolla.size()-1)==i){
                            			break;
                            		}
                            %>
                            <%		}
                            	}
                            %>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 지역별 랭킹 끝 -->

        <!-- 관람 후기-->
        <div class="space-1" style="width: 35%; display:inline-block; " >
            <p class="h1 mb-4 fs-1 " style=" margin-left: 260px; color: #9A161F;">Review
                <a href="<%=path%>/review_list">
                    <svg style=" margin-left:170px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg>
                </a>
            </p>

            <!-- Events-->
            <div class="position-relative zindex-5 container">
            	<%if(reviewList != null && reviewList.size() > 0){
            		for(int i = 0 ;i<6;i++){

            	%>
    	       <div class="tns-carousel-wrapper">
            	
	               <div class="pb-2">
	                   <div class="card h-100 border-0 shadow mx-1">
	                       <div class="card-body py-1 px-4" style="padding: bottom 3rem; ">
	                           <div class="d-sm-flex py-sm-2 px-lg-3">
	                               <div class="text-sm-center mt-3 pt-2 mt-sm-n3"><span class="d-sm-block text-primary me-2 me-sm-0 mb-n3 pe-2" style="font-size: 1.3rem; color: #9A161F; width:7px;"></span><span class="fs-xl text-muted text-uppercase text-start"></span></div>
	                               <h3 class="h4 nav-heading mb-4 mt-3 pe-2"style=" width:420px;;"><a href="<%=path%>/review_view?reviewNum=<%=reviewList.get(i).getReviewnum()%>" style="font-size: 1rem;absolute:true;"><%=reviewList.get(i).getRcontent() %> </a></h3>
	                               <a class="d-flex meta-link fs-sm align-items-center pt-2 ps-2" href="#"><img class="rounded-circle" src="<%=path %>/resources/p_<%=i %>.svg" alt="Charlie Welch" width="42">
	                                   <div class="ps-2 ms-1 mt-n1"><span class="fw-semibold ms-1"><%=reviewList.get(i).getUser_id() %></span></div>
	                               </a>
	                           </div>
	                       </div>
	                   </div>
	                </div>
                </div>
               <%
            		}
            	}
               %>
            </div>
        </div>


        <!-- 공지사항, 자주하는질문 시작 -->
        <div class="container mb-7  " style="margin-top:120px;">

            <div class="row justify-content-center">
                <div class="col-lg-6" style="margin-left:-300px">
                    <div class="text-center p-2" style="margin-left:210px;">
                        <p class="h1 mb-3 fs-1 " style="  color: #9A161F;">Notice
                            <a href="notice_list">
                                <svg style=" margin-left:160px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                      </svg>
                            </a>
                        </p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group ">
                        <%if(noticeList!=null && noticeList.size()>0){
                        	for(int i = 0 ; i < noticeList.size() ;i++){

                        	if(i==6){
                        		break;
                        	}
                       	%>
                           <a href="<%=path %>/NoticeView?NoticeNo=<%=noticeList.get(i).getNoticeNum() %> " class="list-group-item list-group-item-action "><%= noticeList.get(i).getNoticeTitile() %></a>
                       	
                       	<%
                        	}
                        }
                       	%>
                    </div>
                </div>
                <div class="col-lg-6 " style="margin-right:-350px">
                    <div class="text-center p-2 " style="margin-left:140px">
                        <p class="h1 mb-3 fs-1 " style="padding-bottom: -4;  color: #9A161F;">QnA
                            <a href="QnA_list">
                                <svg style=" margin-left:160px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                              </svg>
                            </a>
                        </p>
                    </div>
                    <!-- Actionalbe list group -->
                    <div class="list-group ">
                        <%if(qnaList!=null && qnaList.size()>0){
                        	for(int i = 0 ; i < qnaList.size() ;i++){
                        		if(i==6){
                            		break;
                            	}

                        %>
                             <a href="<%=path %>/QnaView?boardNo=<%=qnaList.get(i).getNo() %> " class="list-group-item list-group-item-action "><%= qnaList.get(i).getTitle() %></a>
                        
                        <% 
                        	}
                        }
                        %>
                    </div>
                </div>

            </div>
        </div>
    </body>



    <br><br><br><br>

<%@include file="/views/common/footer.jsp"%>