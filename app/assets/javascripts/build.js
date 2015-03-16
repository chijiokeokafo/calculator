$(document).on('ready page:load', function(){
	$('#search-form').submit(function(event){
		event.preventDefault();
		var searchValue = $('#search').val();

		$.getScript('/builds?search=' + searchValue);
	});
});

$(document).on('ready page:load', function(){
	$( '#specs' ).slideDown(2500).css('opacity', 0.3);
	$('#specs').mouseenter(function(){
		$(this).fadeTo('slow', 1);
	});
});