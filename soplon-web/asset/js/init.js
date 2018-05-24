(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('select').material_select();
    $('.modal-trigger').leanModal();
    $('.tooltipped').tooltip({delay: 50});
    $('.carousel.carousel-slider').carousel({fullWidth: true});
    $('.carousel').carousel();
    $('.slider').slider({full_width: true});//slider init
    $('.slider').slider();

    /* images */
    //var username = $("#username").val();

    //var shaObj = new jsSHA(username.toString()+'0', "TEXT");
    //var hash = shaObj.getHash('SHA-512','HEX','1');
    //var data = new Identicon(hash, 31).toString();
    //var img = 'data:image/png;base64,' + data + ''


  }); // end of document ready
})(jQuery); // end of jQuery name space
/*
function avatars(ids){

  var shaObj = new jsSHA(ids.toString()+'0', "TEXT");
  var hash = shaObj.getHash('SHA-512','HEX','1');
  var data = new Identicon(hash, 31).toString();
  var img = 'data:image/png;base64,' + data + ''

  document.getElementById(''+ids+'').src = img;
}*/
