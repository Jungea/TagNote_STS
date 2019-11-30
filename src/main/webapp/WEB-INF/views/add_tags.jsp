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

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
					<div class="description no" style="color: #00b5ad;">태그조합</div>
					<div class="list">
						<my:bookmarkSetting index="" paths="${paths}" />
					</div>
				</div>
			</div>

		</nav>

		<!-- -------------------- article -------------------- -->

		<article id="mid2">
			<div>
				<div class="ui icon input ui-widget">
					<input class="autocomplete search" type="text" placeholder="검색">
					<i class="search icon link"></i>
				</div>

				<div class="ui list">
					<div class="content">
						<div class="header">태그목록</div>
						<div class="list">
							<c:forEach var="tag" items="${tags}">

								<div class="addTag item" tagNum="${tag.tagNum}"
									style="font-size: 13px; padding: 3px 0px 3px 0px; cursor: pointer;">${tag.tagName}</div>

							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</article>

		<!-- -------------------- aside -------------------- -->

		<aside id="mid3">
			<form id="add_tag_form" method="post" action="addTags">
				<input type="hidden" name="tagNumString" value="${tagNumString}"
					class="tagNumString" /> <input type="hidden" name="tagNameString"
					value="${tagNameString}" class="tagNameString" />
			</form>

			<div class="ui list remove">
				<c:forEach var="tag" items="${userTags}">

					<div class="removeTag item" tagNum="${tag.tagNum}"
						style="font-size: 13px; padding: 3px 0px 3px 0px; cursor: pointer;">${tag.tagName}</div>

				</c:forEach>

			</div>

		</aside>


		<div style="position: fixed; top: 70px; right: 20px;">
			<button class="refresh ui icon button teal" type="button">
				<i class="icon refresh"></i>
			</button>
		</div>

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