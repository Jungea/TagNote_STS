<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.skhu.dto.Path"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>

<title></title>


</head>
<body>
	<div class="title" style="border: 1px solid lightgray;">
		<i class="dropdown icon"></i> 태그 조합 즐겨찾기 <span
			class="navDiv3-setting-span" style="float: right"> <a> <i
				class="icon tagBookmark setting"></i>
		</a>
		</span>
	</div>
	<div class="content">

		<!------------ 태그조합 즐겨찾기 내용 시작 ------------>
		<div class="ui list">


			<div class="content" style="padding: 14px 14px 0px 14px">
				<div class="description" style="color: #00b5ad;">태그조합</div>
				<div class="list">
					<!------------ 재귀호출 시작 ------------>

					<my:treePrinter index="" paths="${paths}" />

					<!------------ 재귀호출 종료 ------------>
				</div>
			</div>
		</div>
		<!------------ 태그조합 즐겨찾기 내용 종료 ------------>
	</div>

</body>
</html>