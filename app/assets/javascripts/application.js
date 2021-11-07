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
//= require toastr
//= require Chart.bundle
//= require_tree .

// datepicker drawer bscustomfileinput
$(document).on('turbolinks:load', function () {
    $('.drawer').drawer();
    $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' })
    if (typeof beCustomFileInput !== "undefined") {
        bsCustomFileInput.init();
    }
})




// table の列をクリックしたときに リンクを発火させる
document.addEventListener("turbolinks:load", function(){

    $('tbody tr[data-href]').addClass('clickable').click( function() {
        window.location = $(this).attr('data-href');
    }).find('a').hover( function() {
        $(this).parents('tr').unbind('click');
    }, function() {
        $(this).parents('tr').click( function() {
            window.location = $(this).attr('data-href');
        });
    });
});

