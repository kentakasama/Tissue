// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $(document).on('click', '.sign_button', function() {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    if ($(this).hasClass('sign_up_button')) {
      $('.sign_up_modal').show();
    } else {
      $('.sign_in_modal').show();
    }
  });

$(document).on('click', '.sign_modal_wrapper, .fa_wrapper', function() {
    $('.sign_modal_wrapper').hide();
    $('.sign_modal').hide();
    $('.sign_modal_content').hide();
});


$('.top-text-1').fadeIn(4500);
$('.top-text-2').fadeIn(6000);
$('.top-text-3').fadeIn(8000);
$('.top-text-4').fadeIn(10000);
$('.top-text-5').fadeIn(12000);
$('.top-text-6').fadeIn(12300);
$('.top-text-7').fadeIn(12600);
$('.top-text-8').fadeIn(12900);

$('.alert').fadeOut(4000);

});

$(function(){
$('input').on('click',function(){
if ($(this).prop('checked')){
$('input').prop('checked',false);
$(this).prop('checked',true);
}
});
});