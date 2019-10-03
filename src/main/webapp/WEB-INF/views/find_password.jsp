<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
body>.grid {
	height: 100%;
}

.outter.column {
	max-width: 750px;
}

.inner.column {
	max-width: 650px;
}
</style>

<script>
		$(function() {
			$('.button.overlap').click(function(event) {
				alert("사용가능한 아이디입니다.");
			});
		});
	</script>

</head>
<body>

	<div class="ui grid middle aligned center aligned">
		<div class="outter column">

			<h1 class="ui teal header"
				style="font-size: 40px; margin-bottom: 60px;">TAGNOTE</h1>

			<h3 class="ui header teal"
				style="margin: 5px 20px; text-align: left;">회원가입</h3>
			<div class="ui divider" style="margin: 5px;"></div>

			<div class="ui grid middle aligned center aligned">
				<div class="inner column">

					<form:form id="membership_form" method="post" class="ui form"
						modelAttribute="user">

						<div class="field" style="text-align: left;">
							<label>아이디</label>
							<div class="two fields">
								<div class="thirteen wide field">
									<div class="ui left icon input">
										<i class="user icon"></i>
										<form:input path="userId" placeholder="아이디" />
									</div>
								</div>
								<div class="three wide field">
									<button class="overlap ui button fluid teal" type="button">중복확인</button>
								</div>
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호</label>
							<div class="ui left icon input">
								<i class="lock icon"></i>
								<form:password path="password" placeholder="비밀번호" />
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 확인</label>
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password"
									name="password2" value="" placeholder="비밀번호 확인">
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 찾기 질문</label>

							<form:select path="passwordCheckQ" class="ui dropdown fluid"
								itemValue="id" itemLabel="departmentName"
								items="${ departments }" />

						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 찾기 답변</label>
							<div class="ui left icon input">
								<i class="exclamation icon"></i> <form:input path="passwordCheckA" placeholder="비밀번호 찾기 답변" />
							</div>
						</div>

					</form:form>

				</div>
			</div>

			<div class="ui divider"></div>
			<div class="ui container right aligned">
				<button class="ui button teal" type="submit" form="membership_form">가입</button>
				<button class="ui button" type="button"
					onclick="location.href
				='login'">취소</button>
			</div>

		</div>

	</div>

	<script>
		$('.ui.dropdown').dropdown();
	</script>

</body>
</html>