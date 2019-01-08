<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Churn</title>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css"
	media="screen" />
<script type="text/javascript" src="jquery/cufon-yui.js"></script>
<script type="text/javascript" src="jquery/English_italic_500.font.js"></script>
<script type="text/javascript">
	Cufon.replace('h1')('h2')('h3')('#menu a', {
		hover : true
	});
</script>
<!-- AngularJs Script -->
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<style>
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}

.textbox {
	border: 1px solid #848484;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	outline: 0;
	height: 25px;
	width: 200px;
	padding-left: 10px;
	padding-right: 10px;
}

.amar {
	font-family: sans-serif;
	color: purple;
	font-style: bold;
	font-size: 15px;
	letter-spacing: 2px;
	margin-top: 20px;
	margin-left: 120px;
}

#clss
{
background-color: olive;
margin-top: -100px;
width:900px;


}
</style>

</head>
<body>
	<div id="wrap">

		<div id="logo">
			<img src="images/h1 (2).gif" alt="" />
<center> <img src="images/h2.gif" alt="" /> </center>
		</div>
		<div id="content_bg">
			<div id="header">

				<div id="wrapper">
					<div id="slider-wrapper">
						<div id="slider" class="nivoSlider">
							<img src="images/header.jpg" alt="" /> <img
								src="images/header2.jpg" alt="" /> <img
								src="images/header3.jpg" alt="" />
						</div>
					</div>

				</div>

				<script type="text/javascript" src="jquery/jquery-1.4.3.min.js"></script>
				<script type="text/javascript"
					src="jquery/jquery.nivo.slider.pack.js"></script>
				<script type="text/javascript">
					$(window).load(function() {
						$('#slider').nivoSlider();
					});
				</script>

			</div>
			<div id="menu">
				<ul>
					<li><a href="member_home.jsp" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
<div id="content_white1">

				<div id="content">
					<div id="content_left">
						
	<div id="clss">				
	
	<%
	String network = (String)session.getAttribute("network");
	%>
	
<form action="index.html" name="f" enctype="multipart/form-data" method="get" onsubmit= "return validation()" style="margin-top:200px;">
<table  class="gridtable">
<tr>
<font style="font: italic small-caps bold 25px Georgia;color:blue; "> VIEW_FEEDBACK_DETAILS</td>
</center>
</tr>
<tr>


<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">Name:</h4></td>
<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">NetworkType:</h4></td>
<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">Network: </h4></td>
<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">Smspack:</h4></td>
<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">Datapack: </h4></td>
<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:red;">Yourreview:</h4></td>


<%
try
{
	MongoClient mongoClient = new MongoClient("localhost",27017);
	DB db = mongoClient.getDB("churn");
	DBCollection collection = db.getCollection("complaints");
	DBCursor cursor = collection.find(new BasicDBObject("status","success").append("NetworkType", network));


while(cursor.hasNext())
{
	DBObject object = cursor.next();
	
	%>
<tr>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("Name")%></td>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("NetworkType")%></td>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("Network")%></td>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("Smspack")%></td>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("Data")%></td>
	<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><%=object.get("Yourreview")%></td>
	
								</tr>	
							
								

<%
}
}
catch(Exception e1)
{
	e1.printStackTrace();
}


%>
</tr>
</table>
</form>
</div>
<img src="images/dd.jpg" alt=""width="230px;" style="margin-left:650px;margin-top:-120px;"/>
</div>

</div>

<!-- <div id="footer">


<div>
<p>  <marquee> <font color="yellow" size="+2">  Crowdsourcing Worker Quality Evaluation Algorithm 
		on Map Reduce for Big Data Applications </font> </marquee></p>
</div> -->
</div>
</body>
</html>
