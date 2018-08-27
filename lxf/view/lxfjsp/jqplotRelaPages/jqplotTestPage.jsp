<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="utf-8">
<title>Jqplot控件测试学习</title>

  <script type="text/javascript"
            src="js/jquery-3.2.1.js"></script>
             <script type="text/javascript"
            src="js/JqPlot/jquery.jqplot.js"></script>
       <link
            href="<%=basePath%>js/JqPlot/jquery.jqplot.min.css"
            rel="stylesheet" type="text/css" />
       <script type="text/javascript"
            src="js/JqPlot/jqplot.barRenderer.min.js"></script>
        <script type="text/javascript"
            src="js/JqPlot/jqplot.categoryAxisRenderer.min.js"></script>
        <script type="text/javascript"
            src="js/JqPlot/jqplot.canvasAxisTickRenderer.min.js"></script>
        <script type="text/javascript"
            src="js/JqPlot/jqplot.canvasTextRenderer.min.js"></script>
        <script type="text/javascript"
            src="js/JqPlot/jqplot.highlighter.min.js"></script>
        <script type="text/javascript"
            src="js/JqPlot/jqplot.pointLabels.min.js"></script>
            <script type="text/javascript"
            src="js/JqPlot/jqplot.dateAxisRenderer.min.js"></script>
            
             <script type="text/javascript"
            src="js/jquery.jqprint-0.3.js"></script>
           <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script> 
      
      <style>
         @media print{
          .noprint{
          	display:none;
          }
         }
      
      </style>     
  </head>
<body>
<a href="<%=basePath%>index.jsp"><button type="button"
			class="btn btn-default">Back to Home Page（固定request获取地址）</button></a>
<input type="button" value="打印plot" onclick="printPlot()">
<div id="printDiv">
<h1>我是要被打印的部分标题</h1>


	<div id="chart1"
		style="float:left;width:80%">
		
		
		
	</div>
	
	</div>
	<div style="clear:both"></div>
	<p style="color:blue;font-size:8px ;align:centre;position:fixed;bottom:0px">不奋斗，你的才华如何配上你的任性； <br>
不奋斗，你的脚步如何赶上父母老去的速度；  <br>不奋斗，世界那么大，你靠什么去看看；  <br>一个人老去的时候，最痛苦的事情，不是失败，而是我本可以。  <br>每个人心里都有一片海，自己不扬帆，没人帮你启航，只有拼出来的成功，没有等出来的辉煌！
</p>
<script>
$(function(){
	$("a").addClass("noprint");
	$("h1").addClass("noprint");
	$("input").addClass("noprint");
	$("p").addClass("noprint");
})
function printPlot(){
	/* $("#printDiv").jqprint({
		 debug: false, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false      
		importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找
		printContainer: false, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
	}); */
	
	 var prehtml = $("#chart1").html();
	var bdhtml = window.document.body.innerHTML;
	
	var css = ""
	
	window.print(); 
	window.document.body.innerHTML = bdhtml;
}

var req = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0.1,0.5,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var under = [1.5,0.5,0.25,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var over = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var reqBorder = [0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

var ticks = ['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
 
var plot2 = $.jqplot('chart1', [req, under, reqBorder, over], {
    stackSeries: true,
    grid: {
    	              background:'#fff',    //设置整个饼图后的背景色
    	              shadow:false,          //取消整个图的阴影
    	              shadowAngle: 45,            // 设置阴影区域的角度，从x轴顺时针方向旋转  
    	              shadowOffset: 0.5,          // 设置阴影区域偏移出图片边框的距离  
    	              shadowWidth: 1,             // 设置阴影区域的宽度  
    	              shadowDepth: 1,             // 设置影音区域重叠阴影的数量  
    	              shadowAlpha: 0.07,
    	              borderWidth: 0              //取消图最外层边框
    	            },
    seriesDefaults: {
        renderer:$.jqplot.BarRenderer,
        pointLabels: { show: false },
        shadow: false,
        rendererOptions: {
            barMargin: 2     // number of pixels between adjacent groups of bars.
        }
    },
    series:[
            {label:'Required'},
            {label:'Under'},
            {label:'Border'},
            {label:'Over'}
        ],
    seriesColors: [ '#82A87F', '#EA6B67','#040904', '#FFE459'],
    legend: {
        show: false
    },
    axesDefaults: {
        tickRenderer: $.jqplot.CanvasAxisTickRenderer
    },
    axes: {
        xaxis: {
        	showTicks: false,
            renderer: $.jqplot.CategoryAxisRenderer,
            ticks: ticks,
            tickOptions:{ 
            	 
            	showMark: false,
                angle: 0,
            }
        },
        yaxis: {
        	ticks:[0,1,2,3,4],
             tickOptions: {formatString:'%02s'},
        min : 0,//横(纵)轴最小刻度值
    	max : null,// 横(纵)轴最大刻度值 
	    pad : 1, // 一个相乘因子，
	    decimal:0
        }
    },
    grid: {     
    	     drawGridLines: true,        // wether to draw lines across the grid or not.     
    	     gridLineColor: 'red' ,   // 设置整个图标区域网格背景线的颜色     
    	    LineWidth:[4,1],
    	   backGround: 'white',      // 设置整个图表区域的背景色     
    	     borderColor: '#999999',     // 设置图表的(最外侧)边框的颜色     
    	     borderWidth: 1.0,           //设置图表的（最外侧）边框宽度     
    	        shadow: false,               // 为整个图标（最外侧）边框设置阴影，以突出其立体效果     
    	     shadowAngle: 45,            // 设置阴影区域的角度，从x轴顺时针方向旋转     
    	     shadowOffset: 1.5,          // 设置阴影区域偏移出图片边框的距离     
    	     shadowWidth: 3,             // 设置阴影区域的宽度     
    	     shadowDepth: 3,             // 设置影音区域重叠阴影的数量     
    	     shadowAlpha: 0.07 ,          // 设置阴影区域的透明度     
    	     renderer: $.jqplot.CanvasGridRenderer, // renderer to use to draw the grid.     
    	     rendererOptions: {}         // options to pass to the renderer. Note, the default     
    	                                 // CanvasGridRenderer takes no additional options.     
    	 },        
});


$(window).resize(function() {
    var isIE = !-[1,];
    if(isIE==false){
        plot2.replot( { resetAxes: true } );
    }
});
</script>
</body>


</html>