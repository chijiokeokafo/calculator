
$(document).on('ready page:load', function() {
	$(".wheel-trigger").on("click", function(e) {
		e.preventDefault();

		var self = $(this);
		var linkPath = self.attr('href');
		$(".img-container").toggleClass('is-rolling');
		setTimeout(function(){
			window.location.href = linkPath;
		}, 500);
	});
});