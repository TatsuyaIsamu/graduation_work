
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
          scoreName: `worship[worship_params_attributes][${insertedItem[0].children[0].children[1].lastElementChild.name.match(/[0-9]{12,}/)[0]}][points]`,
          half: true,
      });
  })
})

// 神社詳細画面の星のフォーム
document.addEventListener("turbolinks:load", function(){
  $(".evaluate").empty();
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

// 参拝確認画面の星表示
document.addEventListener("turbolinks:load", function(){
  let item_id = gon.star_array
  item_id.forEach((item_id) => {
      let key = Object.keys(item_id)[0]
      $(`.${key}`).raty({
          starOn: "/raty/star-on.png" ,
          starOff: "/raty/star-off.png",
          starHalf: "/raty/star-half.png ",
          score: item_id[key],
          readOnly: true,
          half: true,
      });
  })
});

// 神社詳細画面と参拝詳細画面の星一覧表示
document.addEventListener("turbolinks:load", function(){
  let item_id = gon.star_array
  item_id.forEach((item_id) => {
      let key = Object.keys(item_id)[0]
      $(`#${key}`).empty()
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

document.addEventListener("turbolinks:load", function(){
  let stars = $(".edit_worship_stars")
  stars.each(function(index, item) {
      $(item).raty({
          starOn: "/raty/star-on.png" ,
          starOff: "/raty/star-off.png",
          starHalf: "/raty/star-half.png ",
          score: gon.star_array[index],
          scoreName: `worship[worship_params_attributes][${index}][points]`,
          half: true,
      });
  })
});
