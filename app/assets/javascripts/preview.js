function previewImage(id) {
  const target = this.event.target;     
  const file = target.files[0];      
  const reader = new FileReader();    
  reader.onloadend = function() {      
    preview.src = reader.result;      
  };
  if (file) {
    reader.readAsDataURL(file);       
  } else {
    preview.src = "";
  }
}

document.addEventListener("turbolinks:load", function(){
  document.getElementById('inputFileReset').addEventListener('click', function() {
    var elem = document.getElementById('inputFile');
    elem.value = '';
    elem.dispatchEvent(new Event('change'));
    document.getElementById("preview").src = "/noimage.png"
  })
})
