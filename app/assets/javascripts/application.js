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
// = require turbolinks
//= require jquery

//= require cocoon
//= require moment 
//= require popper
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-ja
//= require jquery_ujs
//= require fullcalendar 
//= require bootstrap-sprockets
//= require @fortawesome/fontawesome-free/js/all.js
//= require underscore
//= require gmaps/google
//= require chartkick
//= require Chart.bundle
//= require_tree .


$(document).on('turbolinks:load', function () {
    $('.drawer').drawer();
    $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' })
    bsCustomFileInput.init();
    $('.evaluate_stars').raty({
        starOn: "/raty/star-on.png" ,
        starOff: "/raty/star-off.png",
        starHalf: "/raty/star-half.png ",
        scoreName: 'worship[worship_params_attributes][0][points]',
        half: true,
    });
    $('#magazine').turn({
        elevation: 50,
        duration: 1000,
        acceleration: true,
        autoCenter: true,
        direction: 'rtl',
    });
})

document.addEventListener("turbolinks:load", function(){
    $("#worships")
    .on('cocoon:after-insert', function(e, insertedItem) {
        $(insertedItem).find(".evaluate_stars").raty(
        {
            starOn: "/raty/star-on.png" ,
            starOff: "/raty/star-off.png",
            starHalf: "/raty/star-half.png ",
            scoreName: `worship[worship_params_attributes][${insertedItem[0].children[0].firstChild.lastElementChild.name.match(/[0-9]{12,}/)[0]}][points]`,
            half: true,
        });
    })
})

document.addEventListener("turbolinks:load", function(){
    $('.evaluate').raty({
        starOn: "/raty/star-on.png" ,
        starOff: "/raty/star-off.png",
        starHalf: "/raty/star-half.png ",
        scoreName: 'shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][0][points]',
        half: true,
    });
});

document.addEventListener("turbolinks:load", function(){
    $("#shinto_params")
    .on('cocoon:after-insert', function(e, insertedItem) {
        $(insertedItem).find(".evaluate").raty(
        {
            starOn: "/raty/star-on.png" ,
            starOff: "/raty/star-off.png",
            starHalf: "/raty/star-half.png ",
            scoreName: `shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][${insertedItem[0].children[0].children[1].lastElementChild.name.match(/[0-9]{12,}/)[0]}][points]`,
            half: true,
        });
    })
})
