
google.charts.load('current', {
	'packages':['geochart']
});
google.charts.setOnLoadCallback(drawMap);





function drawMap() {
	//都道府県単位のデータ
	var data = [
	    ["都道府県","回数"],
	    ["北海道", 5],
	    ["青森",   2],
	    ["秋田",   0],
	    ["岩手",   1],
	    
	];
	var dt = google.visualization.arrayToDataTable(data);
	var options = {
		region: 'JP',  //地域
		displayMode: 'regions', // regions=塗りつぶし, markers=マーカー 
		backgroundColor: '#ebf7fe', //背景色
		resolution: 'provinces',
		colors:['white','green'], //階層の色
	};
	//出力するDivを指定して chart を生成
	var chart = new google.visualization.GeoChart(document.getElementById('region-div'));
	//描画
	chart.draw(dt, options);
}


google.charts.load('current', {
	'packages':['geochart']
});
google.charts.setOnLoadCallback(drawMap);


