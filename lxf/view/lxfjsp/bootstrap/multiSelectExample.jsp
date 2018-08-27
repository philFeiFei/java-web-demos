<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bootstrap test</title>

           <link rel="stylesheet" href="http://localhost:8081/lxf/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"/> 
<script type="text/javascript" src="/lxf/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/lxf/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 
<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="/lxf/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="/lxf/css/bootstrap-multiselect.css" type="text/css"/>
      <!-- Initialize the plugin: -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#example-getting-started').multiselect({
            includeSelectAllOption: true,
            selectAllValue: 'select-all-value',
            numberDisplayed: 1,
            <!-- 当下拉框收起来时，触发方法。 -->
            onChange: function(event) { 
            	getValue();
            }
        });
    });
        
    <!-- 获取下拉框的选中的值，通过+"",变为字符串形式，然后做相关操作。 -->
    function getValue(){
    	var selected = [];
    	$('#example-getting-started').each(function () {
    	selected.push($(this).val());
    	});
    	selected = selected+"";
    	
    	if(selected.indexOf("tomatoes") >=0 ){
    		
    		$("#div1").slideDown(1200);
    	}else{
    		$("#div1").slideUp(1200);
    	}
    	if(selected.indexOf("mozarella") >=0 ){
    		$("#div2").show(1200);
    	}else{
    		$("#div2").hide(1200);
    	}
    	
    }
   
</script>
<body>	
<a href="../../index.jsp"><button type="button" class="btn btn-default">Back to Home Page(相对路径)</button></a>
	 <div style="width:100%;" class="seiHeader">
        <div style="float: left; width: 5%" class="seiHeaderClose">
		<p>Cog icon: <span class="glyphicon glyphicon-cog"></span></p> 
		<div><select id="example-getting-started" multiple="multiple">
    <option value="cheese" selected="selected">Cheese</option>
    <option value="tomatoes" selected="selected">Tomatoes</option>
    <option value="mozarella" selected="selected">Mozzarella</option>
    <option value="mushrooms" selected="selected">Mushrooms</option>
    <option value="pepperoni" selected="selected">Pepperoni</option>
    <option value="onions" selected="selected">Onions</option>
    </select>
    </div></div></div>
   <div style="clear:both"></div>																		
   <div id="div1" style="width: 300px;height:330px; border:1px solid red;float:left"></div>
   <div id="div2" style="width: 300px;height:330px; border:1px solid red;float:left"></div>
   <div id="div3" style="width: 300px;height:330px; border:1px solid red;float:left"></div>
   <div id="div4" style="width: 300px;height:330px; border:1px solid red;float:left"></div>


</body>


</html>