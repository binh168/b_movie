$(document).on('turbolinks:load', function(){
  $(".my-rating-9").starRating({
    initialRating: this.initialRating_st,
    starSize: this.starSize_st,
    useFullStars: true,
    disableAfterRate: true,
    callback: function(currentRating, $el){
      film_id = $('#film_id').val()
      $.ajax({
        url: "/ratings",
        type: "POST",
        data: {star : currentRating,
          film_id: film_id}
      });
    }
  });
  $(".my-rating-8").starRating({
    starSize: this.starSize_st,
    readOnly: true
  });
});
