<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<!-- email, pwd, nick_name -->
<div class="container-md">
<h1>Board Modify Page</h1>
<br>
<form action="/member/modify" method="post" > 
<div class="mb-3">
  <label for="e" class="form-label">Email</label>
  <input type="email" class="form-control" name="email" id="e" value="${mvo.email }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="p" class="form-label">PassWord</label>
  <input type="password" class="form-control" name="pwd" id="p" >
</div>

<div class="mb-3">
  <label for="n" class="form-label">Nick Name</label>
   <input type="text" class="form-control" name="nickName" id="n" value="${mvo.nickName }">
</div>

<!--권한 표시  -->
<ul>
	<c:forEach items="${mvo.authList }" var="auth">
		<li>권한 : ${auth.auth } </li>
	</c:forEach>
</ul> 

<button type="submit" class="btn btn-primary" id="modBtn">Modify</button>
<a href="/member/delete?email=${mvo.email }"><button type="button" class="btn btn-secondary">Delete </button></a>

</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

