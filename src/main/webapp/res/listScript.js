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

})
