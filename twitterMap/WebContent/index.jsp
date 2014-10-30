<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="twitterMap.Twittergetter,java.util.*,java.util.HashSet,java.util.Set,java.util.Map,com.amazonaws.services.dynamodbv2.model.AttributeValue"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>TwitterMapYW2663</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    #menu {
    display:inline;
    font-size:8px;
    padding:3px;
    margin: 0;
    color:#888;
    border:none;
    outline:none;
    cursor:pointer;
}
      #mapcanvas{
      position: absolute;
        height: 400px;
        width:  950px;
        top:30px;
        left: 150px;
        margin:0px;
        padding: 0px
      }
       #densitycanvas{
      position: absolute;
        height: 400px;
        width:  950px;
        top:  430px;
        left: 150px;
        margin:0px;
        padding: 0px
      }
      #head {
	font-size:18px;
	left:150px;
	top:0px;
	height:25px;
	color: black;
	text-align: center;
	padding: 5px;
}
      #name{
      position: absolute;
        top:  860px;
        height: 20px;
        width:  200px;
        font-family: ‘Shift’, sans-serif;
		font-size:10px;
		float:left;
        color:black;
        padding: 3px
      }
      
      
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBTUBiYydGRxiWKfDsJ_OoSO1vfEQx_6tw&sensor=true&libraries=visualization"></script>
    <script type="text/javascript"
  src="https://maps.googleapis.com/maps/api/js?libraries=visualization&sensor=true_or_false">
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
   
    <script>

    var map;
    var map2;
  
function initialize() {
  var keytext = selectmenu.options[selectmenu.selectedIndex].value;
  var mapOptions = {
	center: new google.maps.LatLng(40.7127,-74.0059),
    zoom: 2
  }; 
  
 map = new google.maps.Map(document.getElementById('mapcanvas'),
      mapOptions);
  
 map2 = new google.maps.Map(document.getElementById('densitycanvas'),
	      mapOptions);
 
 var themarker=[];
 var infow=[];
 var i=0;
 var templati;
 var templong;
 var tempid;
 var heatmapData=[];
 <% Twittergetter tg=new Twittergetter();
 Set<Map<String, AttributeValue>> itemset = new HashSet<Map<String, AttributeValue>>();
 itemset=tg.getitem("lol");
 for (Map<String, AttributeValue> s : itemset) {
 	%>
 	templati=<%out.print(Double.parseDouble(s.get("lati").getS()));%>;
 	templong=<%out.print(Double.parseDouble(s.get("long").getS()));%>;
 	heatmapData[i]=new google.maps.LatLng(templati,templong);
 	tempid=<%out.print(Integer.parseInt(s.get("Userid").getS()));%>;
 		themarker.push=(new google.maps.Marker({
 	    position: new google.maps.LatLng(templati,templong),
 	    map: map
 	  })
 	);
 	
 	 /*infow.push=new google.maps.InfoWindow({
 	       content: tempid
 	   });
 	 google.maps.event.addListener(themarker[i], 'mouseover', function() {	   
 		   infow[i].open(map, this);
 		  });   */ 
 	 i=i+1;
 	 <%
  }
 %>
 
 var heatmap = new google.maps.visualization.HeatmapLayer({
	  data: heatmapData});
heatmap.setMap(map2);

}

  
google.maps.event.addDomListener(window, 'load', initialize);


    </script>
</head>
<body>
<div id="head">TwitterMap by Youhan Wang yw2663</div>
    <div id="menu">
    <h1>Keyword Selection</h1>
    <label>
    <select id="selectmenu" onchange="initialize()">
        <option selected> happy </option>
        <option value="lol">lol</option>
        <option value="game">game</option>
        <option value="NBA">NBA</option>
    </select>   
</label>
    </div> 
    <div id="name">
    <h1>Author:Youhan,Wang(yw2663)@CU</h1>
    </div>
	<div id="mapcanvas"></div>	
	<div id="densitycanvas"></div>	
</body>
</html>