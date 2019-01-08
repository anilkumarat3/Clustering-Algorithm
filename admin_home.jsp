<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Churn</title>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/cufon-yui.js"></script>
<script type="text/javascript" src="jquery/English_italic_500.font.js"></script>
<script type="text/javascript">
	Cufon.replace('h1')('h2')('h3')('#menu a', {
		hover : true
	});
</script>
<!-- AngularJs Script -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<style>
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
							<img src="images/header.jpg" alt="" /> 
							<img src="images/header2.jpg" alt="" /> 
							<img src="images/header3.jpg" alt="" />
						</div>
					</div>
				</div>
				<script type="text/javascript" src="jquery/jquery-1.4.3.min.js"></script>
				<script type="text/javascript" src="jquery/jquery.nivo.slider.pack.js"></script>
				<script type="text/javascript">
					$(window).load(function() {
						$('#slider').nivoSlider();
					});
				</script>
			</div>
			<div id="menu">
				<ul>
					<li><a href="admin_home.jsp" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="admin.jsp">Logout</a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content_white">
				<div id="content">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; ">NetWork Subscriber Registration Here...</font>
						<div class="amar">
						<form action="network_login" name="f" method="post" onsubmit="return validation()">
							<table style="margin-left: -130px;" cellpadding="10px" cellspacing="10px">
								<tr><td><b>Name</b></td><td><b>Email</b></td><td><b>Network</b></td><td><b>Accepted</b></td><td><b>Rejected</b></td></tr>
								<%
								try
								{

								String status = "Not Activated";
								Mongo mongo = new Mongo("localhost",27017);
								DB db = mongo.getDB("churn");
								DBCollection collection = db.getCollection("network");
								BasicDBObject object = new BasicDBObject();
								object.put("status", status);
								DBCursor cursor = collection.find(object);
								
								while(cursor.hasNext())
								{
									DBObject object2 = cursor.next();
									%>
									<tr>
									<td><%=object2.get("forename") %></td>
									<td><%=object2.get("email") %></td>
									<td><%=object2.get("network") %></td>
									<td><a href="accepted.jsp?aa=<%=object2.get("email")%>"><u>Accepted</u></a></td>
									<td><a href="rejected.jsp?bb=<%=object2.get("email")%>"><u>Rejected</u></a></td>
									</tr>
									<%
								}
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}												
								%>
							</table>
						</form>
						</div>
					</div>
					<div id="content_right">
						<!-- <font style="font: italic small-caps bold 25px Georgia;color:blue; ">Company News</font> -->
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<img src="images/n1.png" alt="" title="" width="250px" height="200px" />
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer_bg">
		<div id="footer_bot">
			<div class="main">
				<div class="footer_left">
					<marquee> 
						<font size="+1"> 
							A Big Data Clustering Algorithm for Mitigating the Risk of Customer Churn
						</font>
					</marquee>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
