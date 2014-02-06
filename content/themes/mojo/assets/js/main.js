(function ($) {
  var $menuButton = $("#draw-menu");
  $(document).ready(function() {

    if (Modernizr.touch) {
      $menuButton.addClass("absolute");
    }
  });
}(jQuery));
