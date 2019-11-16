var arr = [];

function setParentText() {
	opener.document.getElementById("pInput").value = arr.join(" ");
	opener.location.href = "javascript:aasplit();";
	window.close();
}

$(function() {
	$('.add').click(function(event) {
		/* Act on the event */
		arr.push($('#cInput').val());
		$('#cInput').val("")
		alert(arr)
	});

})