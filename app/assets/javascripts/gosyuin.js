document.addEventListener("turbolinks:load", function(){
  if($('#magazine').length){
      $('#magazine').turn({
        elevation: 50,
        duration: 1000,
        acceleration: true,
        autoCenter: true,
        direction: 'rtl',
    });
  } 
})