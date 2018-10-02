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
  $(document).on("ajax:success", "#ajax, .delete-comment", function(e) {
    $('#ajax-comments').html(e.detail[2]["response"]);
    $(".comment-form").val('');
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

$('#index').click(function(){
  $('#more_link').fadeIn(1000);
});

});



// onload = function() {
//   var input = document.getElementById('file');
//   var dst = document.getElementById('dst');
//   input.onchange = function() {
//     // 選択中のファイルの一つ目
//     var file = this.files[0];
//     // ファイルを選択しなかった場合
//     if(!file) return;
//     // ファイル形式
//     console.log(file.type);
//     // ファイル形式の中にimageが含まれない場合
//     if(!/image/.test(file.type)) {
//       alert('画像を選択してください。');
//       return;
//     }

//     // 読み込み用の関数で読み込み完了時に、HTMLにcanvas追加
//     load(file, function(canvas) {
//       dst.appendChild(canvas);

//       // canvas がクリックされた時に、別ウィンドウで画像を開く
//       canvas.onclick = function() {
//         open(this.toDataURL('image/png'));
//       };
//     });

//   };

//   function load(file, callback) {
//     // canvas: true にすると canvas に画像を描画する(回転させる場合は必須オプション)
//     var options = {canvas: true};

//     loadImage.parseMetaData(file, function (data) {
//       if (data.exif) {
//         console.log("exifに格納されている情報:\n", data.exif.getAll());

//         // options の orientation は小文字。 exif.getの 'Orientation' は先頭大文字
//         // ここでcanvasの回転を指定している
//         options.orientation = data.exif.get('Orientation');
//         console.log('Orientation: ' + options.orientation);
//       }
//       // 画像の読み込み。完了時に callback が呼び出される
//       loadImage(file, callback, options);
//     });
//   }
// };

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

