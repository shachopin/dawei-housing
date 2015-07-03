$ ->
  $('#tenants').imagesLoaded ->
    $('#tenants').masonry
      itemSelector: '.box'
      isFitWidth: true
