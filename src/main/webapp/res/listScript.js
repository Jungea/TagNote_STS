$(function() {

	$('li').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.checkbox').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.rating').on("click", function(event) {
		event.stopPropagation();
	});

	// 체크박스 전체 선택, 전체 해제
	$('.checkbox_all').click(function() {
		if ($('.checkbox_all').is(':checked')) {
			$('.inputCheck').prop("checked", true);
		} else {
			$('.inputCheck').prop("checked", false);
		}

	})

	$('.inputCheck').click(function() {
		// 체크하면 update
		if ($(this).is(':checked')) {
			alert($(this).parent().parent().parent().attr("data-num"));
		} else {
			alert("풀림")
		}

		// 모든 체크박스가 체크 되었을 경우 checkbox_all 체크
		if ($('.inputCheck:checked').length == $('.inputCheck').length) {
			$('.checkbox_all').prop("checked", true);
		} else {
			$('.checkbox_all').prop("checked", false);
		}

	})

})
