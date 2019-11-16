<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<script src="${R}res/addTagScript.js"></script>
<link rel="stylesheet" href="${R}res/addTagStyle.css">

<meta charset="UTF-8">
<title></title>

<style type="text/css">
</style>

</head>
<body>

	<div class="frame">

		<header id="pageHeader"> TAGNOTE </header>

		<nav id="mid1">

			<div class="ui list">

				<div class="content" style="padding: 14px 14px 0px 14px">
					<div class="description" style="color: #00b5ad;">태그조합</div>
					<div class="list">
						<my:bookmarkSetting index="" paths="${paths}" />
					</div>
				</div>
			</div>

		</nav>

		<!-- -------------------- article -------------------- -->

		<article id="mid2">
			<div>
				<div class="ui search ">
					<div class="ui icon input fluid">
						<input class="prompt" type="text" placeholder="검색"> <i
							class="search icon"></i>
					</div>
				</div>

				<div class="ui list">
					<div class="content">
						<div class="header">태그목록</div>
						<div class="list">
							<c:forEach var="tag" items="${tags}">

								<div class="item" tagNum="${tag.tagNum}"
							style="font-size: 13px; padding: 3px 0px 3px 0px; cursor: pointer;">${tag.tagName}</div>

							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</article>

		<!-- -------------------- aside -------------------- -->

		<aside id="mid3">
			<form id="add_tag_form">

				<div class="ui list">

					<div class="item">#2019년</div>
					<div class="item">#2학기</div>
					<div class="item">#html</div>
					<div class="item">#spring</div>
					<div class="item">#mysql</div>
					<div class="item">#mybatis</div>
					<div class="item">#데이터베이스 캡스톤</div>
				</div>
			</form>


		</aside>

		<!-- -------------------- aside -------------------- -->

		<footer id="pageFooter">

			<!-- type="submit" form="add_tag_form" -->
			<button class="ui button teal" type="submit" form="add_tag_form"
				style="float: right; margin: 10px 20px 10px 5px;">추가</button>
			<button class="ui button" type="button" onclick="window.close()"
				style="float: right; margin: 10px 5px 10px 5px;">취소</button>

		</footer>



	</div>

</body>
</html>