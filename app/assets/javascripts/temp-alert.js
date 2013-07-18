// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){

function fadeAlert() {
   $(".alert-temp").removeClass("in");
  }

function removeAlert() {
   $(".alert-temp").remove();
}


window.setTimeout(function () {
    fadeAlert();
}, 1000);

window.setTimeout(function () {
    removeAlert();
}, 3000);


});

