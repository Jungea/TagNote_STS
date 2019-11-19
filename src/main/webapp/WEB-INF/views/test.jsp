<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<script>
	$(function() {
		$(".prompt").autocomplete({
			source : 'testa',
			autoFocus : true,
			minLength : 1,
			delay : 500,
			close : function(event) {
				alert($('.prompt').val())
			}
		});

		$(".aaa").click(function() {
			alert($('.prompt').val());
		})
	});
</script>
<style>
.ui-widget {
	max-height: 200px;
	overflow-y: auto;
	overflow-x: hidden;
}
</style>
</head>
<body>

	<div class="" style="padding-left: 0px;">
		<div class="ui icon input ui-widget">
			<input class="prompt" id="automplete-1" type="text" placeholder="검색">
			<i class="search icon link" id="aaaa"></i>
		</div>

		<div class="aaa">hello</div>
	</div>

</body>
</html>