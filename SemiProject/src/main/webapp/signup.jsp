<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp"%>
    <!-- 회원가입 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
    <br><br>
    <section id="content">
        <h3 align="center" style="color:#9A161F">회원 가입 정보</h3>
        <br>

        <div id="enroll-container">
            <form name="memberEnrollFrm" id="memberEnrollFrm" action="<%=request.getContextPath()%>/enroll" method="POST"> 
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" name="user_id" id="user_id" placeholder="6~20자, 영문, 숫자" required style="width:400px;height:60px;font-size:20px;" />
                        <input type="button" id="checkDuplicate2" style="width:100px;height:40px;font-size:20px;" value="ID중복체크" />
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="pwd" id="pwd" placeholder="8~12자, 영문, 숫자, 특수문자" required style="width:400px;height:60px;font-size:20px;" />
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" id="pwdCheck" placeholder="8~12자, 영문, 숫자, 특수문자" style="width:400px;height:60px;font-size:20px;" /></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="userName" placeholder="홍길동" required style="width:400px;height:60px;font-size:20px;" /></td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td><input type="tel" name="phone" maxlength="11" placeholder="(-없이)01012345678" style="width:400px;height:60px;font-size:20px;"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" placeholder="abc@abc.com" style="width:400px;height:60px;font-size:20px;" />
                    </td>
                </tr>
                
                <tr>
                    <th></th>
                    <td>
                        <label>
                        <input type="checkbox" name="mailService" />SMS, 이메일로 상품 및 이벤트 정보를 받겠습니다.(선택)</label> <label>
                    </tr>
                </table>

                <input type="button" onclick="test()" id="enrollSubmit" style="width:100px;height:40px;font-size:20px;" value="회원 가입" />
            </form> 
        </div>
    </section>
    <form name="checkIdForm">
                    <input type="hidden" name="userId">
    </form>
	<br>
    <!-- 회원가입 끝 -->
        
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
	        document.getElementById('memberEnrollFrm').submit();
	      }
	
	    }
	    $('#checkDuplicate2').click(()=>{
			let id = $('#user_id').val().trim();
			
			if(id.length < 4){
				alert('아이디는 최소 4글자 입니다.');
				return;
			}
			
			// 비동기식 처리 - AJAX
			const xhr = new XMLHttpRequest();
			xhr.open('get','${pageContext.request.contextPath}/checkId?userId=' + id);
			
			// Callback 함수 셋팅 = 이벤트 함수, 리스너, 핸들러
			xhr.onreadystatechange = ()=>{
				if(xhr.readyState == 4 && xhr.status == 200){
					if(xhr.responseText == 'used'){
						alert('중복된 아이디 입니다.');
					}else{
						alert('입력하는 아이디는 사용 가능합니다.');					
						// html을 변경하는 코드를 작성하면 -> 동적페이징이 된다!!
					}
				}
			};
			xhr.send();
		});	
  </script>
    <%@include file="/views/common/footer.jsp"%>