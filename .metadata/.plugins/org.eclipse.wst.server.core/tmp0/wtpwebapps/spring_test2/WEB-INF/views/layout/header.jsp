<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/nav.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:500,900,100,300,700,400'
	rel='stylesheet' type='text/css'>
</head>
<body>

	<nav class="stroke">
	<a class="logo" href="/"><img src="/resources/image/logo.png" alt=""/></a>
		<ul>
			<li><a href="/">Home</a></li>
			<li><a href="/board/list">게시판</a></li>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.mvo.email" var="authEmail" />
				<sec:authentication property="principal.mvo.nickName" var="authNick" />
				<sec:authentication property="principal.mvo.authList" var="auths" />


				<c:choose>
					<c:when
						test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
						<li><a href="/member/list">회원리스트
								${authNick}(${authEmail}/ADMIN)</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/modify">회원정보
								수정${authNick}(${authEmail})</a></li>
					</c:otherwise>
				</c:choose>


				<li><a href="/member/logout" id="logoutLink">로그아웃</a></li>
				<li><a href="/board/register">게시판 글쓰기</a></li>
				<form action="/member/logout" method="post" id="logoutForm">
					<!--인증 된 이메일  -->
					<input type="hidden" name="email" value="${authEmail}">
				</form>

			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<li><a href="/member/register">회원가입</a></li>

				<li><a href="/member/login">로그인</a></li>
			</sec:authorize>
		</ul>
	</nav>



	<script type="text/javascript">

document.getElementById('logoutLink').addEventListener('click',(e)=>{
    e.preventDefault();
    document.getElementById('logoutForm').submit();
});
</script>