<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function setParentText() {
		opener.document.getElementById("pInput").value = document
				.getElementById("cInput").value;
		window.close();
	}
</script>
</head>
<body>
	<br>
	<b><font size="5" color="gray">자식창</font></b>
	<br>
	<br>

	<input type="text" id="cInput"><input type="button" value="전달하기" onclick="setParentText()">
	<br>
	<br>
	<input type="button" value="창닫기" onclick="window.close()">
</body>
</html>