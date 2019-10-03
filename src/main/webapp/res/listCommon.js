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
	$(".navDiv3-setting-span").on("click", function(event) {
		event.stopPropagation();
	});

	//
	$('li').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.checkbox').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.rating').on("click", function(event) {
		event.stopPropagation();
	});

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
		exclusive: false
	});
	$('.ui.rating').rating();

	$('.ui.dropdown').dropdown();
})
