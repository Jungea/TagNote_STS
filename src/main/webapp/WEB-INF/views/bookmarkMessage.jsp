<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var message = '${msg}';
	var returnUrl = '${lastPage}';
	alert(message);
	document.location.href = returnUrl;
</script>
</head>
<body>북마크 설정 관리
</body>
</html>