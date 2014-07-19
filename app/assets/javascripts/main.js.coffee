jQuery ->
  # setInterval ()->
  #   $('.logo-text').fadeToggle 'slow'
  #   $('.js-switchable-text').fadeToggle('slow')
  # , 5000

  setInterval ->
    first  = $('.switchable_title.short')
    second = $('.switchable_title.long')
    delay = 500;
    if first.css('display') == 'block'
      first.fadeOut delay, ->
        second.fadeIn(delay)
    else
      second.fadeOut delay, ->
        first.fadeIn delay 
  , 10000
