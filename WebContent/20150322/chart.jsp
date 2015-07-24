<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/chart/fusioncharts.js"></script>
<script type="text/javascript" src="../js/chart/themes/fusioncharts.theme.zune.js"></script>
	<!-- fusioncharts.theme.zune.js只支持一部分常用的报表统计比如，饼图，曲线图，柱形图 -->
	<!-- 比如其他的：温度计，地图，等等就在必须引入其他的js文件 -->
<title>统计报表</title>
</head>
<body>
<select onchange="change(this)">
   <option>--请选择展现的形式----</option>
   <option value="pie2d">pie2d</option>
   <option value="column3d">column3d</option>
   <option value="doughnut2d">doughnut2d</option>
   <option value="column2d">column2d</option>
   <option value="pareto2d">pareto2d</option>
   <option value="doughnut3d">doughnut3d</option>
</select>
<!--存放报表统计  -->
<div id="chartContainer"></div>

<script type="text/javascript">
//html5 svg() canvas
//fusionchar最新html5,第一步:引入js
//第二步：不要急着写业务逻辑，先建立一个页面去测试看看效果


//column2d:0,column3d:0,bar2d:0,bar3d:0,pie2d:0,pie3d:0,line:0,area2d:0,doughnut2d:0,doughnut3d:0,pareto2d:0,pareto3d:0,mscolumn2d:0,mscolumn3d:0,msline:0,msarea:0,msbar2d:0,msbar3d:0,stackedcolumn2d:0,marimekko:0,stackedcolumn3d:0,stackedarea2d:0,stackedcolumn2dline:0,stackedcolumn3dline:0,stackedbar2d:0,stackedbar3d:0,msstackedcolumn2d:0,mscombi2d:0,mscombi3d:0,mscolumnline3d:0,mscombidy2d:0,mscolumn3dlinedy:0,stackedcolumn3dlinedy:0,msstackedcolumn2dlinedy:0,scatter:0,bubble:0,ssgrid:0,scrollcolumn2d:0,scrollcolumn3d:0,scrollline2d:0,scrollarea2d:0,scrollstackedcolumn2d:0,scrollcombi2d:0,scrollcombidy2d:0,zoomline:0});a.powercharts=d.extend(a.powercharts||{},{spline:0,splinearea:0,msspline:0,mssplinearea:0,mssplinedy:0,multiaxisline:0,multilevelpie:0,waterfall2d:0,msstepline:0,inversemsline:0,inversemscolumn2d:0,inversemsarea:0,errorbar2d:0,errorscatter:0,errorline:0,logmsline:0,logmscolumn2d:0,logstackedcolumn2d:0,radar:0,dragnode:0,candlestick:0,selectscatter:0,dragcolumn2d:0,dragline:0,dragarea:0,boxandwhisker2d:0,kagi:0,heatmap:0
	function change(obj){
		showchart_forXML({
		   type:obj.value,
		   width:900,
		   height:460   
		});
	}
	
	showchart_forXML({
		type:"doughnut2d",
		width:900,
		height:460
	});
	
	function showchart_forXML(option){
	FusionCharts.ready(function(){
		var revenueChart = new FusionCharts({
			 type: option.type,  //报表展现的形式
			 width: option.width,
			 height: option.height,
			 dataFormat: "xml",   /*xml/json*/
			 dataSource:'<chart caption="刚锅药店直销药统计" subcaption="药店销售统计" yaxisname="销售数量柱状图" plotgradientcolor="" bgcolor="FFFFFF" showalternatehgridcolor="0" showplotborder="0" divlinecolor="#CCCCCC" showvalues="1" showcanvasborder="0" canvasbordercolor="#CCCCCC" canvasborderthickness="1" captionpadding="30" linethickness="3" yaxisvaluespadding="15" showshadow="0" labelsepchar=": " basefontcolor="000000" labeldisplay="AUTO" numberscalevalue="1000,1000,1000" numberscaleunit="K,M,B" animation="0" palettecolors="e44a00" showborder="0">'+
					'<set label="Table Tennis" value="900000000" alpha="55" tooltext="Popular in: {br}Asia{br}Europe{br}Africa{br}Americas" />'+
					'<set label="Baseball" value="500000000" alpha="40" tooltext="Popular in: {br}US{br}Japan{br}Cuba{br}Dominican Republic" />'+
					'<set label="Golf" value="400000000" alpha="30" tooltext="Popular in: {br}US{br}Canada{br}Europe" />'+
					'<set label="Basketball" value="400000000" alpha="30" tooltext="Popular in: {br}US{br}Canada" />'+
					'<set label="American Football" value="390000000" alpha="25" tooltext="Popular in: {br}US" />'+
					'<set label="Volleyball" value="900000000" alpha="55" tooltext="Popular in: {br}Asia{br}Europe{br}Americas{br}Australia" />'+
					'<set label="Tennis" value="1000000000" alpha="70" tooltext="Popular in: {br}Europe{br}Americas{br}Asia" />'+
					'<set label="Field Hockey" value="2200000000" alpha="80" tooltext="Popular in: {br}Asia{br}Europe{br}Africa{br}Australia" />'+
					'<set label="Cricket" value="3000000000" alpha="90" tooltext="Popular in: {br}India{br}UK{br}Pakistan{br}England{br}Australia" />'+
					'<set label="Football" value="3500000000" alpha="100" tooltext="Popular in: {br}Europe{br}Africa{br}Asia{br}Americas" />'+
					'</chart>'
		});
		
		 revenueChart.render("chartContainer");
	  }); 
	 
}

</script>


</body>
</html>