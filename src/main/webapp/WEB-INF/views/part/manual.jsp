<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.slick-prev:before {
	position: absolute;
	left: -25px;
	font-size: 40px;
	color: grey;
}

.slick-next:before {
	position: absolute;
	right: -25px;
	font-size: 40px;
	color: grey;
}
</style>

</head>
<body>
	<div class="ui big modal menual">
		<i class="close icon"></i>
		<div class="header">사용설명서</div>
		<div class="content" style="padding-left: 100px !important;
	padding-right: 100px !important;">
			<div class="menual slider ui center aligned container">
				<img src="${R}image/main.png" alt="메인 화면">
				<img src="${R}image/bookmark.png" alt="태그 즐겨찾기 창">
				<img src="${R}image/memo.png" alt="메모 작성 페이지">
				<img src="${R}image/taglist.png" alt="태그 목록 창">
			</div>
		</div>
	</div>
</body>
</html>