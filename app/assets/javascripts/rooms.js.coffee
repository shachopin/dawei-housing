$ ->
  $('#rooms').imagesLoaded ->
    $('#rooms').masonry
      itemSelector: '.box'
      isFitWidth: true