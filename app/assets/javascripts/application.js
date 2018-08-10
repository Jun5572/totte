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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
// Loads all Semantic javascripts
//= require semantic-ui
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
});