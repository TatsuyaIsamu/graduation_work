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

// datepicker drawer bscustomfileinput
$(document).on('turbolinks:load', function () {
    $('.drawer').drawer();
    $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' })
    bsCustomFileInput.init();
})

// 御朱印帳 
document.addEventListener("turbolinks:load", function(){
    $('#magazine').turn({
        elevation: 50,
        duration: 1000,
        acceleration: true,
        autoCenter: true,
        direction: 'rtl',
    });
})

// 参拝画面の星フォーム
document.addEventListener("turbolinks:load", function(){
    $('.worship_stars').raty({
        starOn: "/raty/star-on.png" ,
        starOff: "/raty/star-off.png",
        starHalf: "/raty/star-half.png ",
        scoreName: 'worship[worship_params_attributes][0][points]',
        half: true,
    });
    $("#worship_params")
    .on('cocoon:after-insert', function(e, insertedItem) {
        $(insertedItem).find(".worship_stars").raty(
        {
            starOn: "/raty/star-on.png" ,
            starOff: "/raty/star-off.png",
            starHalf: "/raty/star-half.png ",
            scoreName: `worship[worship_params_attributes][${insertedItem[0].children[0].firstChild.lastElementChild.name.match(/[0-9]{12,}/)[0]}][points]`,
            half: true,
        });
    })
})

// 神社詳細画面の星のフォーム
document.addEventListener("turbolinks:load", function(){
    $('.evaluate').raty({
        starOn: "/raty/star-on.png" ,
        starOff: "/raty/star-off.png",
        starHalf: "/raty/star-half.png ",
        scoreName: 'shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][0][points]',
        half: true,
    });
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


// 神社詳細画面と参拝詳細画面の星一覧表示
document.addEventListener("turbolinks:load", function(){
    let item_id = gon.star_array
    item_id.forEach((item_id) => {
        let key = Object.keys(item_id)[0]
        $(`#${key}`).raty({
            
            starOn: "/raty/star-on.png" ,
            starOff: "/raty/star-off.png",
            starHalf: "/raty/star-half.png ",
            score: item_id[key],
            readOnly: true,
            half: true,
        });
    })
});

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

