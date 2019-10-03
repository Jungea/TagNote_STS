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
						<div
							style="border: 1px solid lightgray; width: 40px; height: 40px; padding-top: 9px;">
							<div class="fixed ui star rating huge" data-max-rating="1"></div>
						</div>
					</div>


					<!------------------------------------------------------------------->
					<!-- 저장 버튼  type="submit" form="textarea_form" -->
					<!------------------------------------------------------------------->

					<div class="thirteen wide column left aligned"
						style="padding-left: 5px;">
						<button class="ui button basic" onclick="alert('저장되었습니다.')">저장</button>
						<button class="ui button basic" type="button"
							onclick="window.open('add_tag.html', '_blank', 'width=1000, height=600')">태그목록</button>
					</div>
				</div>

			</div>

		</div>

		<!--  -->

		<div class="artDiv2">
			<div class="memo"
				style="height: 100%; background-color: LightYellow;">

				<div class="tagBar"
					style="background-color: white; border-bottom: 1px solid lightgray; width: 100%">


					<div class="fifteen wide field center floated"
						style="margin: 10px;">
						<select class="ui fluid search dropdown" multiple="" name="paw"
							form="textarea_form">
							<option value="">태그를 입력하세요.</option>
							<option value="1">#2018년</option>
							<option value="2">#2019년</option>
							<option value="3">#프로젝트</option>
							<option value="4">#1학기</option>
							<option value="5">#2학기</option>
							<option value="6">#TagNote</option>
							<option value="7">#알고리즘</option>
							<option value="8">#데이터베이스</option>
							<option value="9">#자바</option>
							<option value="10">#HalliGalli</option>
							<option value="11">#TagNote</option>
						</select>
					</div>

				</div>


				<form class="field wrap" id="textarea_form" action="">
					<textarea id="ta" class="memoTextarea" name="memo"
						style="background-color: LightYellow;"></textarea>
				</form>
			</div>

		</div>

	</article>
</body>
</html>