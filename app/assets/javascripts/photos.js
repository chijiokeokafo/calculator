function updateLikeButton (number_of_likes){
  $('#like_number').html(number_of_likes)
}

// $(document).on('ready page:load', function() {
//   $('#search-form').submit(function(event) {
//     event.preventDefault();
//     var searchValue = $('#search').val();

//     $.ajax({
//       url: '/classifieds?search=' + searchValue,
//       type: 'GET',
//       dataType: 'script'
//     // }).done(function(data){
//     //   $('#products').html(data);
//     });
//   });
// });