$(document).on('ready page:load', function(){
	$('#search-form').submit(function(event){
		event.preventDefault();
		var searchValue = $('#search').val();

		$.getScript('/builds?search=' + searchValue);
	});
});

$(document).on('ready page:load', function(){
	$( '.specs' ).slideDown(2500).css('opacity', 0.3);
	$('.specs').mouseenter(function(){
		$(this).fadeTo('slow', 1);
	});
});

$(document).on('ready page:load', function(){
	$( '#links' ).slideDown(1000);
	// $('#links').fadeTo('slow', 1)
	// $('#builds').mouseenter(function(){
	// 	$(this).fadeTo('slow', 1);
	// });
});

// $(document).on('ready page:load', function(){
// 	$( '#new-spoke-form' ).slideDown(2500).css('opacity', 0.3);
// 	$('#new-spoke-form').mouseenter(function(){
// 		$(this).fadeTo('slow', 1);
// 	});
// });