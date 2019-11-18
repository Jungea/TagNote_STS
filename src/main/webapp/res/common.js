var checkNum = -1;
$(function() {

	// nav 영역 숨기기
	$('.close.ui.basic.button').click(function() {
		$('nav').toggle();
		$('.frame').toggleClass('closeNav');
	})

	// 태그 검색 목록
	var availableTutorials = [ "ActionScript", "Bootstrap", "C", "C++", ];
	$(".autocomplete.search").autocomplete({
		source : availableTutorials,
		autoFocus : true
	});

	$('.autocomplete.search').keydown(function(event) {
		if (event.keyCode === 13) {
			var searchString = $(this).val();
			if (searchString.length == 0) {
				alert("검색어를 입력하세요.");
			} else {
				searchString = encodeURIComponent(searchString);
				location.href = 'search?searchString=' + searchString;
			}
		}
	});

	$('.search.icon').click(function() {
		var searchString = $(this).parent().children('input').val();
		if (searchString.length == 0) {
			alert("검색어를 입력하세요.");
		} else {
			searchString = encodeURIComponent(searchString);
			location.href = 'search?searchString=' + searchString;
		}
	})

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
		$('span[pathNum=' + checkNum + ']').toggleClass('bookmark_check');
		checkNum = -1;
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

	$('.description.setting').click(
			function(event) {
				$(this).toggleClass('bookmark_check');
				$('span[pathNum=' + checkNum + ']').toggleClass(
						'bookmark_check');
				checkNum = $(this).attr('pathNum');

				alert(checkNum + " " + $(this).attr('pathNum') + " "
						+ $(this).attr('path'))
			});

	$('.negative.button').click(
			function() {
				if (checkNum > 0) {
					location.href = 'bookmarkDelete?path='
							+ $('span[pathNum=' + checkNum + ']').attr('path');
				} else {
					alert("다른 값을 선택하세요.");
				}
			})

	$('.positive.button').click(
			function() {
				var name = $('.bookmark.input.tag').val();
				name = encodeURIComponent(name);
				alert('bookmarkInsert?path='
						+ $('span[pathNum=' + checkNum + ']').attr('path')
						+ "&name=" + name)
				location.href = 'bookmarkInsert?path='
						+ $('span[pathNum=' + checkNum + ']').attr('path')
						+ "&name=" + name;
			})
})