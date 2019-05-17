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
      
       <script type="text/javascript" src="js/canvg2.js"></script>
    <script type="text/javascript" src="js/html2canvas-0.4.1.js"></script>
    <script type="text/javascript" src="js/jspdf.min.js"></script>
	 
      
      
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
<input type="button" id="downloadPdf" value="pdf dwonload" >
<div id="printDiv" style="background-color:#FFFFFF" class="printDiv">
<h1>我是要被打印的部分标题</h1>
<p>我想知道我现在模糊吗，我模糊吗我想知道我现在模糊吗，我模糊吗我想知道我现在模糊吗，我模糊吗我想知道我现在模糊吗，我模糊吗我想知道我现在模糊吗，我模糊吗</p>


		<div id="chart1" 
			style="float:left;width:100%;background-color:#FFFFFF">
		</div>
		<div id="image" style="float:left;width:100%;background-color:#FFFFFF"></div>
		<div id="image1" style="float:left;width:100%;background-color:#FFFFFF"></div>
	
	<div style="clear:both"></div>
</div>
	<div style="clear:both"></div>
	<p style="color:blue;font-size:8px ;align:centre;position:fixed;bottom:0px">不奋斗，你的才华如何配上你的任性； <br>
不奋斗，你的脚步如何赶上父母老去的速度；  <br>不奋斗，世界那么大，你靠什么去看看；  <br>一个人老去的时候，最痛苦的事情，不是失败，而是我本可以。  <br>每个人心里都有一片海，自己不扬帆，没人帮你启航，只有拼出来的成功，没有等出来的辉煌！
</p>
<script>
$(function(){
	/* $("a").addClass("noprint");
	$("h1").addClass("noprint");
	$("input").addClass("noprint");
	$("p").addClass("noprint"); */
});
$(function () {
	
	 $("#downloadPdf").click(function () {
			
		 //----打印开始
		 //要提前设置宽高
		 var targetDom = $("#printDiv");
		 var width=targetDom.width() ;
		 var height=targetDom.height() ;
         
				         //------额外处理，把jqplot设置为image
						 var chart = $('#chart1');  
							var str = chart.jqplotToImageElem({backgroundColor: chart.css('background-color')});  
							$('#image').append(str);  
							$('#chart1').css("display","none");
							//------额外处理暂时结束，把jqplot设置为image
		 
		
         //把需要导出的pdf内容clone一份，这样对它进行转换、微调等操作时才不会影响原来界面
         var copyDom = targetDom.clone();
         //var copyDom = $("#printDiv");
         //新的div宽高跟原来一样，高度设置成自适应，这样才能完整显示节点中的所有内容（比如说表格滚动条中的内容）
        /*  copyDom.width(width*2);
         copyDom.height(height*2); */

        $('body').append(copyDom);//ps:这里一定要先把copyDom append到body下，然后再进行后续的glyphicons2canvas处理，不然会导致图标为空
         $(".printDiv").last().width(width + "px");
         $(".printDiv").last().height(height + "px");
        // svg2canvas(copyDom);
        
        
        
         var canvas = document.createElement("canvas"); 
    var scale = 2; 

    canvas.width = width * scale; 
    canvas.height = height * scale; 
    canvas.getContext("2d").scale(scale, scale);
        var opts = {
        scale: scale, 
        canvas: canvas, 
        logging: true, 
        width: width, 
        height: height 
    };
        html2canvas(copyDom,opts).then(function(canvas) {
            	 
                 var imgData = canvas.toDataURL('image/jpeg');
                 var img = new Image();
                 img.src = imgData;
                 $(img).css({
                     "width": width + "px",
                     "height": height + "px",
                 })
                 $('#image1').append(img);  //测试转成canvas之后的图片是模糊的
                 //根据图片的尺寸设置pdf的规格，要在图片加载成功时执行，之所以要*0.225是因为比例问题
                 img.onload = function () {
                     //此处需要注意，pdf横置和竖置两个属性，需要根据宽高的比例来调整，不然会出现显示不完全的问题
                     if (this.width > this.height) {
                         var doc = new jsPDF('l', 'mm', [this.width * 0.225, this.height * 0.225]);
                     } else {
                         var doc = new jsPDF('p', 'mm', [this.width * 0.225, this.height * 0.225]);
                     }
                     doc.addImage(imgData, 'jpeg', 0, 0, this.width * 0.225, this.height * 0.225);
                     //根据下载保存成不同的文件名
                     doc.save('pdf_' + new Date().getTime() + '.pdf');
                 };
                 //删除复制出来的div
                // copyDom.remove();
         });
     		
         //打印结束------
         								//------额外处理又开始，把jqplot设置image删除，把图标还原。
						        			 $('#image').empty(); 
											$('#chart1').css("display","");
										//------额外处理结束
	 
	 
	 });
             
	 //
	 
        });
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

var ticks = [' ',' ',' ',' ','1',' ',' ',' ','2',' ',' ',' ','3',' ',' ',' ','4',' ',' ',' ','5',' ',' ',' ','6',' ',' ',' ','7','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
 
/* var req = [1,1,0.1,0.5,1,1];
var under = [1.5,0.5,0,1,0,1];
var over = [0,0,1,0,1,0];
var reqBorder = [0.05,0.05,0.1,0.1,0.05,0.05];

var ticks = ['','','','','','']; */
 
var plot2 = $.jqplot('chart1', [req, under, reqBorder, over], {
    stackSeries: true,
    grid: {
    	showGridline: false,
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
        show: true,
    },
    axesDefaults: {
        tickRenderer: $.jqplot.CanvasAxisTickRenderer
    },
    axes: {
        xaxis: {
        	showTicks: true,
            renderer: $.jqplot.CategoryAxisRenderer,
            ticks: ticks,
            drawMajorGridlines:true,
            tickOptions:{ 
            	showGridline:true, 
            	
       	     gridLineWidth:[4],
            	showMark: true,
                angle: 40,
                markSize:20,//x轴往下伸出一部分纵轴
                size:40,
                isMinorTick:false,
                show:true,
                showLabel:true,
            }
        },
        yaxis: {
        	ticks:[0,1,2,3,4],
             tickOptions: {formatString:'%02s'},
             tickOptions:{
            	 
             showGridline:false, 
             },
        min : 0,//横(纵)轴最小刻度值
    	max : null,// 横(纵)轴最大刻度值 
	    pad : 1, // 一个相乘因子，
	    decimal:0
        }
    },
    grid: {     
    	     showGridline:false,    
    	    // gridLineWidth:[2],
         	//gridLineColor: 'blue' ,   // 设置整个图标区域网格背景线的颜色     
    	   backGround: 'white',      // 设置整个图表区域的背景色     
    	     borderColor: '#999999',     // 设置图表的(最外侧)边框的颜色     
    	     borderWidth: 4.0,           //设置图表的（最外侧）边框宽度     
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

function glyphicons2canvas(targetElem, fontClassName, fontFamilyName) {
    var iconElems = targetElem.find('.' + fontClassName);
    iconElems.each(function (index, inconNode) {
        var fontSize = $(inconNode).css("font-size");
        var iconColor = $(inconNode).css("color");
        var styleContent = $(inconNode).attr('style');
        //去掉"px"
        fontSize = fontSize.replace("px", "");
        var charCode = getCharCodeByGlyphiconsName(iconName);
        var myCanvas = document.createElement('canvas');
        //把canva宽高各增加2是为了显示图标完整
        myCanvas.width = parseInt(fontSize) + 2;
        myCanvas.height = parseInt(fontSize) + 2;
        myCanvas.style = styleContent;
        var ctx = myCanvas.getContext('2d');
        //设置绘图内容的颜色
        ctx.fillStyle = iconColor;
        //设置绘图的字体大小以及font-family的名字
        ctx.font = fontSize + 'px ' + fontFamilyName;
        ctx.fillText(String.fromCharCode(charCode), 1, parseInt(fontSize) + 1);
        $(inconNode).replaceWith(myCanvas);
    });
}
//根据glyphicons/glyphicon图标的类名获取到对应的char code
function getCharCodeByGlyphiconsName(iconName) {
    switch (iconName) {
        case("glyphicons-resize-full"):
            return "0xE216";
        case ("glyphicons-chevron-left"):
            return "0xE225";
        default:
            return "";
    }
}
</script>
</body>


</html>