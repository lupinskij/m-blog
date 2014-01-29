(function ($) {

  var $menuButton = $("#draw-menu");
  var $codeBlocks = $("code");

  $(document).ready(function() {

    if (Modernizr.touch) {
      $menuButton.addClass("absolute");
    }

    $codeBlocks.wrap( "<pre></pre>" );

  });
}(jQuery));
