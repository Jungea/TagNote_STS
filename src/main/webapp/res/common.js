$(function() {

	// nav 영역 숨기기
	$('.close.ui.basic.button').click(function() {
		$('nav').toggle();
		$('.frame').toggleClass('closeNav');
	})

	// 태그 검색 목록
	var content = [ {
		title : '#1학기'
	}, {
		title : '#2018년'
	}, {
		title : '#2019년'
	}, {
		title : '#2학기'
	}, {
		title : '#데이터베이스'
	}, {
		title : '#프로젝트'
	}, {
		title : '#안드로이드'
	}, {
		title : '#Java'
	}, {
		title : '#Angola'
	} ];
	$('.ui.search').search({
		source : content
	});

	// setting 버튼 버블링x
	$(".navDiv3-setting-span").click(function(event) {
		event.stopPropagation();
	});

	$(".navDiv4-trash-span").click(function(event) {
		var result = confirm('휴지통을 비우시겠습니까?');
		if (result) {
			location.href = 'deleteAll';
		}
	});

	$("[data-url]").click(function() {
		var url = $(this).attr("data-url");
		location.href = url;
	})

	// 트리
	$('.header.link').on("click", function(event) {
		event.stopPropagation();
	});

	$('.header.link').on("click", function(event) {
		var a = $(this).attr('path');
		location.href = a;
	});

	$('.icon.tagBookmark.setting').click(function(event) {
		$('.ui.modal').modal('show');
	});

	$('#target').accordion({
		exclusive : false
	});

	$('.ui.rating').rating();
	$('.ui.rating.impt').click(function(event) {
		var memoNum = $(this).parent().parent().attr("data-num");
		if (memoNum == 0) {
			alert("메모 저장 후 사용 가능한 기능입니다.")
		} else {
			if ($(this).children('i').hasClass('active')) {
				location.href = 'impt?memoNum=' + memoNum;
			} else {
				location.href = 'notImpt?memoNum=' + memoNum;
			}
		}
	});

	$('.ui.dropdown').dropdown();
})