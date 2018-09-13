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
//= require jquery
// require jquery_ujs
//= require rails-ujs
//= require cocoon
// Loads all Semantic javascripts
//= require semantic-ui
//= require activestorage
//= require jquery.turbolinks
// require turbolinks
//= require_tree .



$(function() {
  var $overlay = $('.overlay'),
      $overlayTrigger = $('.overlay-trigger button'),
      $overlayClose = $('.overlay-close'),
      openClass = 'is-open';

  $overlayTrigger.on('click', function() {
    var num = ('0' + ($(this).index() + 1)).slice(-2);
    $('.overlay' + num).addClass(openClass);
    $overlayClose.addClass(openClass);
  });

  $overlayClose.on('click', function() {
    $overlayClose.removeClass(openClass);
    $overlay.removeClass(openClass);
  });


  // $('.activating.element')
  // .popup();

// コメント投稿Ajax
  $(document).on("ajax:success", "#ajax", function(e) {
    $('#ajax-comments').html(e.detail[2]["response"]);
    $("textarea").val('')
  });
  // アルバム写真追加Ajax
  // $(document).on("ajax:success", "#ajax", function(e) {
  //   $('#ajax-comments').html(e.detail[2]["response"]);
  //   $("textarea").val('')
  // });
// いいね投稿Ajax
// $(document).on("ajax:success", "#like", function(e) {
//   $('#like).html(e.detail[2]["response"]);
// });

  $('.ui.dropdown')
  .dropdown();


  $('#modal-confirm').click(function(){
    $('.ui.basic.modal')
    .modal('show');
  });


  $('#test')
  .transition('bounce');


  $('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });

  $('.post-photo-modal').on('click',(function() {
      $('#mini-modal')
        .modal('show');
  }));

$('#post-photo-modal').on('click',(function() {
      $('#mini-modal')
        .modal('show');
  }));

$('#edit').click(function(){
    $('#header-image-edit-modal').modal('show');
  });

});


// $('.button')
//   .popup({
//     inline: true
//   })
// ;












// $(function() {
//     $(window).scroll(function(){
//         var y = $(this).scrollTop(); // スクロール値を取得（=Y座標=縦位置）
//         $('#bg1').css('background-position', '0 ' + parseInt( -y / 50 ) + 'px'); // 1/50のスピード
//         $('#bg2').css('background-position', '0 ' + parseInt( -y / 10 ) + 'px'); // 1/10のスピード
//         $('#bg3').css('background-position', '0 ' + parseInt( -y / 2 ) + 'px'); // 1/2のスピード
//     });
// });

// $(function() {
//     $(window).scroll(function(){
//         var y = $(this).scrollTop(); // スクロール値を取得（=Y座標=縦位置）
        
//         $('.main-visual').css('background-position', '0 ' + parseInt( -y / 2 ) + 'px'); // 1/2のスピード
//     });
// });

