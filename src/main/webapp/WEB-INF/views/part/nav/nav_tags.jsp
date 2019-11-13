<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>

</head>
<body>
	<div class="title" style="border: 1px solid lightgray;">
		<i class="dropdown icon"></i> 태그별 메모
	</div>
	<div class="content" style="padding-left: 20px;">

		<!--  -->
		<div class="ui list">

			<div class="content" style="padding: 14px 14px 0px 14px">

				<div class="item" style="color: #00b5ad;">태그목록</div>


				<div class="list">
					<c:forEach var="tag" items="${tags}">

						<div class="item" data-url="listByTag?tagNum=${tag.tagNum}"
							style="font-size: 13px; padding: 3px 0px 3px 0px; cursor: pointer;">${tag.tagName}&nbsp;&nbsp;&nbsp;&nbsp;(${tag.count})</div>

					</c:forEach>
				</div>
			</div>

		</div>
		<!--  -->

	</div>
</body>
</html>