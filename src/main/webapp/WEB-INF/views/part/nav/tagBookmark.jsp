<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!----------------------------- modal ------------------------>
	<div class="ui tiny longer modal">
		<i class="close icon"></i>
		<div class="header">태그 조합 즐겨찾기 설정</div>
		<div class="scrolling content">
			<!--  -->

			<div class="ui list">

				<div class="content" style="padding: 14px 14px 0px 14px">
					<span class="description setting" style="color: #00b5ad;"
						pathNum="0" path="0">태그조합</span>
					<div class="list">
						<my:bookmarkSetting index="" paths="${paths}" />
					</div>
				</div>
			</div>
			<!--  -->

		</div>

		<select class="ui search dropdown fluid bookmark"
			id="bookmark-dropdown">
			<option value="">#태그를 입력하세요</option>
			<c:forEach var="tag" items="${tags}">
				<option value="${tag.tagName}">${tag.tagName}</option>
			</c:forEach>
		</select>

		<div class="actions">
			<div class="negative ui deny button">삭제</div>
			<div class="ui positive right labeled icon button">
				추가 <i class="checkmark icon"></i>
			</div>
		</div>

	</div>

	<!----------------------------------------------------------------->

</body>
</html>