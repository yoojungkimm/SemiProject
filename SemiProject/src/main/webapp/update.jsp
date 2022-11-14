<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp"%>
<%
	Member member = null;
	if(member!=request.getAttribute("member")){
		member = (Member)request.getAttribute("member");
	}
	

%>

 <script type="text/javascript">
	    function test() {
	      var p1 = document.getElementById('pwd').value;
	      var p2 = document.getElementById('pwdCheck').value;
	      if( p1 != p2 ) {
	        alert("비밀번호가 일치 하지 않습니다");
	        document.getElementById('pwd').focus();
	        return false;
	      } else{
	        alert("비밀번호가 일치합니다");
	        document.getElementById('memberUpdateFrm').submit();
	      }
	
	    }
	    
				
  </script>
    
     <!-- 회원가입 -->
    <br><br>
    <section id="content">
        <h3 align="center" style="color:#9A161F">회원 정보 수정</h3>
        <br>

        <div id="enroll-container">
            <form name="memberUpdateFrm" id="memberUpdateFrm" action="<%=request.getContextPath()%>/Memberupdate" method="POST"> 
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" value="<%=member.getUser_id() %>" name="newId" id="newId" disabled style="width:400px;height:60px;font-size:20px;"/>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" value="<%=member.getUser_pw() %>" name="userPwd" id="pwd" placeholder="8~12자, 영문, 숫자, 특수문자" required style="width:400px;height:60px;font-size:20px;" />
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" id="pwdCheck" value="<%=member.getUser_pw() %>" placeholder="8~12자, 영문, 숫자, 특수문자" style="width:400px;height:60px;font-size:20px;" /></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="userName" value="<%=member.getUser_name() %>"placeholder="홍길동" required style="width:400px;height:60px;font-size:20px;" /></td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td><input type="tel" name="phone" value="<%=member.getUser_phone() %>"maxlength="11" placeholder="(-없이)01012345678" style="width:400px;height:60px;font-size:20px;"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" value="<%=member.getUser_email() %>" placeholder="abc@abc.com" style="width:400px;height:60px;font-size:20px;" />
                    </td>
                </tr>
              
                <tr>
                    <th></th>
                    <td>
                        <label>
                        <input type="checkbox" name="hobby" />SMS, 이메일로 상품 및 이벤트 정보를 받겠습니다.(선택)</label> <label>
                    </tr>
                </table>

                <input type="button" onclick="test()" id="updateMember" style="width:150px;height:40px;font-size:20px;" value="회원 정보 수정" /> 
            </form>
            
        </div>
    </section>
    
<br>
    <!-- 회원가입 끝 -->
    <%@include file="/views/common/footer.jsp"%>