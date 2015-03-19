
$(document).on('ready page:load', function() {
	$(".wheel-trigger").on("click", function(e) {
		e.preventDefault();

		var self = $(this);
		$(".img-container").toggleClass('is-rolling');
	
	});
  
});