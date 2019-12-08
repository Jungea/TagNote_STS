//function setParentText() {
//	if (opener.document.getElementById("pInput").value != null)
//		opener.document.getElementById("pInput").value = userArr.join(" ");
//	window.close();
//}

$(function() {
	var userArr = [];

	var name = $('.tagNameString').val();
	if (name.length > 0) {
		// alert(name);
		if (opener.document.getElementById("tagNameString") != null)
			opener.document.getElementById("tagNameString").value = name;

		window.close();
	}

	var tag = $('.tagNumString').val();
	if (tag.length != 0)
		userArr = tag.split(' ');

	// $('.add').click(function(event) {
	// /* Act on the event */
	// arr.push($('#cInput').val());
	// $('#cInput').val("")
	// alert(arr)
	// });

	$('.description').not('.no').dblclick(function(event) {
		/* Act on the event */
		$(this).addClass('check');
		var tempArr = $(this).attr("path").split("/")
		tempArr.splice(0, 1)
		for ( var i in tempArr) {
			if ($.inArray(tempArr[i], userArr) === -1)
				userArr.push(tempArr[i]);
		}
		// alert(userArr)
	});

	$('.addTag.item').dblclick(function(event) {
		/* Act on the event */
		$(this).addClass('check');
		var tempArr = $(this).attr("tagNum")
		if ($.inArray(tempArr, userArr) === -1)
			userArr.push(tempArr);

		// alert(userArr)
	});

	$('body').on('dblclick', '.removeTag.item', function() {
		// $(this).addClass('check');
		$(this).remove();
		var tempArr = $(this).attr("tagNum")
		var index = userArr.indexOf(tempArr);
		userArr.splice(index, 1);
		// alert(userArr);
	})

	$('.refresh.button').click(function() {
		var join = userArr.join(" ")
		if (join != "")
			location.href = "addTagsRefresh?tagNumString=" + join;
		else
			$('.ui.list.remove').empty();

	})

	$('#add_tag_form').submit(function() {
		var join = userArr.join(" ")
		$('.tagNumString').val(join);
		// alert($('.tagNumString').val())
	})

	$('.search.icon').click(
			function() {
				var searchString = $(this).parent().children('input').val();
				if (searchString.length == 0) {
					alert("검색어를 입력하세요.");
				} else {
					searchString = encodeURIComponent(searchString);
					var join = userArr.join(" ")
					location.href = 'addTagsSearch?searchString='
							+ searchString + "&tagNumString=" + join;
				}
			})

	$('.autocomplete.search').keydown(
			function(event) {
				if (event.keyCode === 13) {
					var searchString = $(this).val();
					if (searchString.length == 0) {
						alert("검색어를 입력하세요.");
					} else {
						searchString = encodeURIComponent(searchString);
						var join = userArr.join(" ")
						location.href = 'addTagsSearch?searchString='
								+ searchString + "&tagNumString=" + join;
					}
				}
			});

	$(".autocomplete.search").autocomplete({
		source : 'testa',
		minLength : 1,
		delay : 500
	});
})