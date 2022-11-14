
<%@page import="java.util.List"%>
<%@page import="semi.culture.mvc.show.model.vo.ShowDetail"%>
<%@page import="semi.culture.mvc.show.model.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <%
    	List<ShowDetail> listAll = (List<ShowDetail>)request.getAttribute("listAll");
    %>
    
     <%@include file="/views/common/header.jsp"%>
     
     <br><br><br><br>
      <!-- 전체목록 시작 -->
    <div style="padding-bottom : 100px; margin-top:-50px;">
        <section class="container">
            <div style=" margin-left:20px;">
                <h2 class="text-left mb-1">전체 목록</h2>
               
            </div>
            <div class="row">
                <!-- Content left -->
                <div class="col-lg-6 ">
                    <!-- Post-->
                     <br>
                    
                    <%for(int i=0; i<listAll.size()/2;i++){ %>
                    <!-- Post-->
                    <article class="card card-horizontal card-hover mb-grid-gutter ">
                        <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(i).getPrfid()%>" style="background-image: url(<%=listAll.get(i).getPoster() %>);"></a>
                        <div class="card-body">
                            <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%=listAll.get(i).getPrfnm() %></a></h2>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfpdfrom() %>~<%= listAll.get(i).getPrfpdto() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfcast() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getFcltynm() %> </p>
                           
                        </div>
                    </article>
                    <%} %>
                    
                    
                </div>
                <!-- Content right -->
                <div class="col-lg-6 ">
                    <!-- Post-->
                    <br>
                     <%for(int i=listAll.size()/2; i<listAll.size();i++){ %>
                    <!-- Post-->
                    <article class="card card-horizontal card-hover mb-grid-gutter ">
                        <a class="card-img-top" href="<%=path %>/showSelect?prfid=<%=listAll.get(i).getPrfid()%>" style="background-image: url(<%=listAll.get(i).getPoster() %>);"></a>
                        <div class="card-body">
                            <h2 class="h4 nav-heading text-capitalize mb-3"><a href="#"><%=listAll.get(i).getPrfnm() %></a></h2>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfpdfrom() %>~<%= listAll.get(i).getPrfpdto() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getPrfcast() %> </p>
                            <p class="mb-0 fs-sm text"> <%= listAll.get(i).getFcltynm() %> </p>
                           
                        </div>
                    </article>
                    <%} %>

                </div>
                
            </div>


        </section>
    </div>
    <!-- 전체목록 끝 -->
     
     
     
     
     <%@include file="/views/common/footer.jsp"%>