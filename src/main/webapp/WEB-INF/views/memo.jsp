<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- slick slider carousel -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
	rel="stylesheet" />

<script src="${R}res/common.js"></script>
<script src="${R}res/memoScript.js"></script>
<link rel="stylesheet" href="${R}res/common.css">
<link rel="stylesheet" href="${R}res/memoStyle.css">

<meta charset="UTF-8">
<title></title>

<style type="text/css">
</style>

</head>
<body>
	<div class="frame">

		<%@ include file="part/header.jsp"%>

		<%@ include file="part/manual.jsp"%>

		<%@ include file="part/nav/nav.jsp"%>

		<%@ include file="part/article/article_memo.jsp"%>

		<%@ include file="part/topButton.jsp"%>

		<%@ include file="part/nav/tagBookmark.jsp"%>

		<%@ include file="part/footer.jsp"%>
	</div>
</body>
</html>