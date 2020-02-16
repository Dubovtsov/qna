// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
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
require("@rails/ujs").start()
global.Rails = Rails;
//= require cocoon
import "cocoon";
require("cocoon")
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("project/answers")
require("project/questions")
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require twitter/bootstrap
//= require popper
//= require bootstrap-sprockets
//= require_tree .
//

$(document).on("turbolinks:load", function(){
  setTimeout(function () {
    if ($(".alert").is(":visible")){
      $(".alert").fadeOut("slow");
    }
  }, 3000)
});
