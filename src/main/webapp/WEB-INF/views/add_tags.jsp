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

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<meta charset="UTF-8">
<title></title>

<style type="text/css">
/*---------------------Grid Layout--------------------*/
body {
	margin: 0;
}

.frame {
	display: grid;
	grid-template-areas: "header header header" "nav article aside"
		"footer footer footer";
	grid-template-rows: 50px 1fr 60px;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 0px;
	height: 100vh;
}

#pageHeader {
	grid-area: header;
}

#pageFooter {
	grid-area: footer;
}

#mid1 {
	grid-area: nav;
	overflow: auto;
}

#mid2 {
	grid-area: article;
	overflow: auto;
}

#mid3 {
	grid-area: aside;
	overflow: auto;
}

a {
	color: black !important;
}

/*--------------------- header --------------------*/
header {
	background-color: #00b5ad;
	border-bottom: 1px solid lightgray;
	font-weight: bold;
	color: white;
	font-size: 25px;
	vertical-align: middle;
	line-height: 50px;
	padding-left: 25px;
}

/*--------------------- footer --------------------*/
footer {
	border-top: 1px solid lightgray
}

/*--------------------- nav --------------------*/
nav {
	padding: 20px;
}

/*--------------------- article --------------------*/
article {
	display: grid;
	grid-template-rows: 120px 1fr;
	grid-gap: 0px;
	padding: 20px;
	border-right: 1px solid lightgray;
	border-left: 1px solid lightgray;
}

.artDiv1>.grid {
	max-width: 400px;
	padding: 15px;
}

/*--------------------- aside --------------------*/
aside {
	padding: 20px;
}
</style>

</head>
<body>

	<div class="frame">

		<header id="pageHeader"> TAGNOTE </header>

		<nav id="mid1">
			<div class="ui list">

				<div class="item">

					<div class="content">
						<div class="header">태그조합즐겨찾기</div>


						<div class="list">
							<div class="item">

								<i class="bookmark yellow icon"></i>
								<div class="content">
									<div class="description">#2018년</div>

									<div class="list">
										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#1학기</div>

												<div class="list">
													<div class="item">

														<i class="bookmark yellow icon"></i>
														<div class="content">
															<div class="description">#데이터베이스</div>
														</div>
													</div>
													<div class="item">
														<i class="bookmark yellow icon"></i>
														<div class="content">
															<div class="description">#자바</div>
														</div>
													</div>
												</div>

											</div>

										</div>
										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#2학기</div>
											</div>

										</div>

									</div>
								</div>
							</div>
							<div class="item">
								<i class="bookmark yellow icon"></i>
								<div class="content">
									<div class="description">#2019년</div>
									<div class="list">
										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#1학기</div>

											</div>

										</div>
										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#2학기</div>
											</div>

										</div>

									</div>
								</div>
							</div>
							<div class="item">
								<i class="bookmark yellow icon"></i>
								<div class="content">
									<div class="description">#프로젝트</div>

									<div class="list">
										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#HalliGalli</div>
											</div>

										</div>

										<div class="item">

											<i class="bookmark yellow icon"></i>
											<div class="content">
												<div class="description">#TagNote</div>
											</div>

										</div>

									</div>
								</div>
							</div>
						</div>
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

								<div class="item"
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