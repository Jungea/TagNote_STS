<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>


<script type="text/javascript">
	var arr = [];

	function setParentText() {
		opener.document.getElementById("pInput").value = arr.join(" ");
		opener.location.href="javascript:aasplit();";
		window.close();
	}

	$(function() {
		$('.add').click(function(event) {
			/* Act on the event */
			arr.push($('#cInput').val());
			$('#cInput').val("")
			alert(arr)
		});

	})
</script>
</head>
<body>
	<br>
	<b><font size="5" color="gray">자식창</font></b>
	<br>
	<br>

	<input type="text" id="cInput">
	<input type="button" value="저장" class="add">
	<br>
	<br>
	<input type="button" value="확인" onclick="setParentText()">
	<input type="button" value="창닫기" onclick="window.close()">
</body>
</html>