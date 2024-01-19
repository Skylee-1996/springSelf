<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<!-- email, pwd, nick_name -->
<div class="container-md">
<h1>회원가입</h1>
<br>
<form action="/member/register" method="post" > 
<div class="input-group mb-3">
  <input type="email" class="form-control" name="email" id="e" placeholder="email.." required="required" aria-describedby="button-addon2">
   <button class="btn btn-outline-secondary" type="button" id="button-addon2">Email Check</button>
</div>

<div class="mb-3">
  <input type="password" class="form-control" name="pwd" id="p" placeholder="password" required="required">
</div>
<div class="mb-3">
  <input type="password" class="form-control" name="pwdC" id="pc" placeholder="passwordCheck" required="required">
</div>
<span id="checkpass"></span>

<div class="mb-3">
   <input type="text" class="form-control" name="nickName" id="n" placeholder="nickName">
</div>

<button type="submit" class="btn btn-primary" id="regBtn" disabled="disabled">Register</button>

</form>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script src="/resources/JS/memberRegister.js"></script>
