<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.MongoClient"%>
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
			<<img src="images/h1 (2).gif" alt="" />
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
					<li><a href="index.html" class="active">Home</a></li>
					<li><a href="networkerlogin.jsp">Login</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
			
			<%
							HttpSession session2 = request.getSession(false);
							String name = (String) session2.getAttribute("name");
							String network = (String)session2.getAttribute("network1");
							System.out.println("&&&&&&&&&&&&&&&&&&&&&&&:"+network);
						%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 20px">Select Subscription</h2>
						<div class="amar">
							<%
							try
							{
							Mongo mongo = new Mongo("localhost",27017);
							DB db = mongo.getDB("churn");
							DBCollection collection = db.getCollection("plans");
							BasicDBObject object = new BasicDBObject("network",network);
							DBCursor cursor = collection.find(object);
							
							while(cursor.hasNext())
							{
								DBObject object2 = cursor.next();
								String aa = ":-";
								%>
								<a href="plan.jsp?<%=name%>" style="text-decoration:none">
							<table cellpadding="7px"
						style="margin-left: 14px; padding-left: 30px; margin-top: 10px; border: 3px solid black; border-radius: 20px;"
						width="290" bgcolor="#FDEDEC">
								  
								<tr><td><%=object2.get("name")%><%=aa%></td></tr>
								<tr><td>Details:</td><td><%=object2.get("details") %></td></tr>
								<tr><td>Validity:</td><Td><%=object2.get("validity") %></Td></tr>
								<tr><td>Price:</td><td><%=object2.get("price") %></td></tr>
								</table></a>
								
								<%
							}
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
							
							%>
	</div>
					</div>
					<div id="content_right">
						<h2 style="margin-bottom: -15px;"><b>User Details</b></h2>
						<div class="content_right_pad">
							<div class="news" style="margin-left: -130px;">
								<div class="amar">
								<table cellpadding="7px"
						style="margin-right: 10px; padding-left: 30px; margin-top: 10px; border: 3px solid black; border-radius: 20px;"
						width="290" bgcolor="#FDEDEC">
								<%
								try
								{
									
							
								MongoClient mongoClient = new MongoClient("localhost",27017);
								DB db = mongoClient.getDB("churn");
								DBCollection collection2 = db.getCollection("client_reg");
								BasicDBObject object1 = new BasicDBObject("name",name);
								DBCursor cursor1 = collection2.find(object1);
								
								while(cursor1.hasNext())
								{
									DBObject object2 = cursor1.next();
									%>
									<tr><td style="color: red;font-size: medium;font-family: inherit;"> <b>Name:</b></td><td><%=object2.get("name") %></td></tr>
									<tr><td style="color: red;font-size: medium;font-family: inherit;"> <b>Mobile:</b></td><td><%=object2.get("mobile") %></td></tr>
									<tr><td style="color: red;font-size: medium;font-family: inherit;"> <b>Balance:</b></td><td><%=object2.get("balance") %></td></tr>			
									<tr><td style="color: red;font-size: medium;font-family: inherit;"> <b>Subscription:</b></td></tr>						
									</table>
									
									<%
								}
								}
								catch(Exception e1)
								{
									e1.printStackTrace();
								}
								
								%>
								
								
								
								</div>
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
				<div class="footer_left"><marquee> <font size="+1"> A Big Data Clustering Algorithm for
					Mitigating the Risk of Customer Churn</font></marquee></div>
			</div>
		</div>
	</div>

</body>
</html>
