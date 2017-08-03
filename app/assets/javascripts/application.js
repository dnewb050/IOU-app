// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(document).ready(function(){

$( "#login_button" ).click(function() {
  $( ".login_form" ).toggle(function() {
  });
  $( "#login_button").addClass('hide');
  $( "#sign_up").addClass('hide');
});

$( "#return").click(function() {
  setTimeout(function () {
    $( "#login_button").removeClass('hide');
    $( "#sign_up").removeClass('hide');
  }, 800);

  $( ".login_form" ).toggle(function() {
  });

});

});

$(document).ready(function () {
          if (!$.browser.webkit) {
              $('.req_msg').html();
          }
      });
