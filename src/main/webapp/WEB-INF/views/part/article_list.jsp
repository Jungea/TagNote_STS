<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
</head>

</style>
<body>
	<article id="mainArticle">
		<!--  -->

		<div class="artDiv1" id="toTop">

			<div class="ui internally grid center aligned">

				<div class="row" style="padding-bottom: 0px;">

					<div class="three wide column" style="margin-right: 0px;">
						<button id="navColseBtn" class="close ui icon basic button">
							<i class="icon bars"></i>
						</button>
					</div>
					<div class="ten wide column" style="padding-left: 0px;">
						<div class="ui search">
							<div class="ui icon input">
								<input class="prompt" type="text" placeholder="검색"> <i
									class="search icon"></i>
							</div>
							<div class="results"></div>
						</div>
					</div>
					<div class="three wide column"></div>

				</div>

				<div class="row">
					<div class="three wide column">
						<div class=""
							style="border: 1px solid lightgray; padding: 10px; width: 40px; height: 40px;">
							<div class="ui fitted checkbox">
								<input type="checkbox"> <label></label>
							</div>
						</div>
					</div>
					<div class="thirteen wide column left aligned"
						style="padding-left: 5px;">
						<button class="ui button basic"
							onclick="alert('선택한 메모를 삭제하시겠습니까?')">삭제</button>
					</div>
				</div>

			</div>

		</div>

		<!--  -->

		<div class="artDiv2">

			<table class="ui table selectable">
				<thead class="full-width">
					<tr>
						<th class="one wide">
							<div class="ui checkbox">
								<input type="checkbox" checked> <label></label>
							</div>
						</th>
						<th class="one wide"><div class="fixed ui star rating "
								data-rating="1" data-max-rating="1"></div></th>
						<th class="eleven wide">Tags</th>
						<th class="three wide">Date</th>
					</tr>
				</thead>
				<tbody>
					<tr onclick="location.href='write-memo.html?memoNum=1'">
						<td class="collapsing">
							<div class="ui checkbox">
								<input type="checkbox"> <label></label>
							</div>
						</td>
						<td>
							<div class="ui star rating" data-max-rating="1"></div>
						</td>
						<td>#2018 #데이터통신 #유상신</td>
						<td>2019.09.17 08:59</td>

					</tr>
				</tbody>

			</table>

		</div>

	</article>
</body>
</html>