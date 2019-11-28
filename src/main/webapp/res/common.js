var checkNum = -1;
$(function() {

	// nav 영역 숨기기
	$('.close.ui.basic.button').click(function() {
		$('nav').toggle();
		$('.frame').toggleClass('closeNav');
	})

	// autocomplete 기능
	$('.autocomplete.search').autocomplete({
		source : 'testa', // 액션메소드 RequestMapping
		autoFocus : true, // 첫번째 지정
		minLength : 1, // 검색 최소길이
		delay : 500
	});

	// $('.autocomplete.bookmark').autocomplete({
	// source : 'testa',
	// autoFocus : true,
	// minLength : 1,
	// delay : 500,
	// appendTo : ".modal"
	// });
	// 자동완성 기능이 켜져있을 때 enter 누르면 바로 검색되므로 + 로 검색이 불가능함

	// $('.autocomplete.search').keydown(function(event) {
	// if (event.keyCode === 13) {
	// var searchString = $(this).val();
	// if (searchString.length == 0) {
	// alert("검색어를 입력하세요.");
	// } else {
	// searchString = encodeURIComponent(searchString);
	// location.href = 'search?searchString=' + searchString;
	// }
	// }
	// });

	// 검색 아이콘 클릭하면 input태그에 입력된 값을 매개변수로 검색
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

	// 쓰레기통 아이콘을 클릭할 경우 쓰레기통의 메모 모두 삭제
	$(".navDiv4-trash-span").click(function(event) {
		var result = confirm('휴지통을 비우시겠습니까?');
		if (result) {
			location.href = 'deleteAll';
		}
	});

	// 해당 속성을 갖는 태그들 페이지 이동
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
		$('#bookmark-dropdown').dropdown("clear");
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

	$('.ui.dropdown').dropdown({
		showOnFocus : false
	});

	$('.description.setting').dblclick(function(event) {
		$('span[pathNum=' + checkNum + ']').removeClass('bookmark_check');
		$(this).addClass('bookmark_check');
		checkNum = $(this).attr('pathNum');
	});

	$('.negative.button').click(
			function() {
				if (checkNum > 0) {
					location.href = 'bookmarkDelete?path='
							+ $('span[pathNum=' + checkNum + ']').attr('path');
				} else {
					alert("삭제할 태그를 선택하세요.");
					return false;
				}
			})

	$('.positive.button').click(
			function() {
				var name = $('#bookmark-dropdown').val();
				if (checkNum == -1) {
					alert("태그를 추가할 곳을 선택하세요.")
					return false;
				} else if (name.length == 0) {
					alert("추가할 태그이름을 입력하세요.")
					return false;
				} else {

					name = encodeURIComponent(name);
					location.href = 'bookmarkInsert?path='
							+ $('span[pathNum=' + checkNum + ']').attr('path')
							+ "&name=" + name;
				}
			})
})