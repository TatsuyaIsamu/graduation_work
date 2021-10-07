
document.addEventListener("turbolinks:load", function(){
  google.charts.load('current', {
      'packages':['geochart']
  });
  google.charts.setOnLoadCallback(drawMap);
  
})



function drawMap() {
  //都道府県単位のデータ
  let map = gon.usermapping
  var data = map;
  var dt = google.visualization.arrayToDataTable(data);
  var options = {
    region: 'JP',  //地域
    displayMode: 'regions', // regions=塗りつぶし, markers=マーカー 
    backgroundColor: '#ebf7fe', //背景色
    resolution: 'provinces',
    colorAxis: {colors: ["#CBDDC3", "#99E6B2", "#7AD2A8", "#5CBE9D", "#3DAA93", "#1F9688", "#00827E"], maxSize: 60 },
    colors:['white','green'], //階層の色
  };
  //出力するDivを指定して chart を生成
  var chart = new google.visualization.GeoChart(document.getElementById('region-div'));
  //描画
  chart.draw(dt, options);
}


// google.charts.load('current', {
//   'packages':['geochart']
// });
// google.charts.setOnLoadCallback(drawMap);
