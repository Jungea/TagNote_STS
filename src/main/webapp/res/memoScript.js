$(function() {
	
	$('.wrap').on('keyup', 'textarea', function(e) {
		var t = $('#mainArticle').scrollTop();
		var ta = $('#mainArticle').innerHeight();
		var d = $('#mainArticle')[0].scrollHeight;

		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
		if (t + ta >= d) {
			d = $('#mainArticle')[0].scrollHeight;
			$('#mainArticle').scrollTop(d + 20);
		} else
			$('#mainArticle').scrollTop(t);
	});
	$('.wrap').find('textarea').keyup();

	$('.memo').click(function(event) {
		$('.memoTextarea').focus();
	});

	$('.memoTextarea').focus();

	timer = setInterval(function() {
		$('textarea').trigger('keyup');
	}, 500)

	$(".tagBar").on("click", function(event) {
		event.stopPropagation();
	});

	$('.header.link').on("click", function(event) {
		event.stopPropagation();
	});

	$('.header.link').on("click", function(event) {
		var a = $(this).attr('path');
		location.href = a;
	});
})
