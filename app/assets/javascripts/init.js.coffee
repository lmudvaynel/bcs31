$(document).ready ->
  App.init()
  $('#liquid1').liquidcarousel(height: 183, duration: 500, hidearrows: false)
  App.initSliders()
  Index.initParallaxSlider()
  $('#da-slider').cslider()