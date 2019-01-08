<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.BasicDBList"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Customer Churn</title>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
	<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
	<script type="text/javascript" src="jquery/cufon-yui.js"></script>
	<script type="text/javascript" src="jquery/English_italic_500.font.js"></script>
	<script type="text/javascript"> Cufon.replace('h1')('h2')('h3')('#menu a', { hover : true });</script>
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
		color: black;
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
							<img src="images/header.jpg" alt="" /> <img
								src="images/header2.jpg" alt="" /> <img src="images/header3.jpg"
								alt="" />
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
					<li><a href="network_home.jsp" class="active">Home</a></li>					
					<li><a href="logout.jsp">Logout</a></li>					
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content_white">
				<!-- <div id="content"> -->
					<!-- <div id="content_left">						
															
					</div> -->
					<div class="amar">
							<table style="margin-top: 100px;" cellpadding="10px" cellspacing="10px">
							<%
							try {
								ArrayList churner_clients = new ArrayList();
								ArrayList non_churner_clients = new ArrayList();
								String network =(String)session.getAttribute("network");								
								MongoClient mongoClient = new MongoClient();
								DB db = mongoClient.getDB("churn");
								DBCollection collection = db.getCollection("complaints");
								DBCollection sub_collection = db.getCollection("subscribe");
																
								BasicDBObject subscriberId = new BasicDBObject( "NetworkType", network );
								BasicDBObject subscriberIdIsNull = new BasicDBObject( "status", "pending" );
								BasicDBList firstOrValues = new BasicDBList();
								firstOrValues.add( subscriberId );
								firstOrValues.add( subscriberIdIsNull );
								DBObject firstOr = new BasicDBObject( "$and", firstOrValues );								
								DBCursor cursor_present_clients = collection.find( firstOr );								
								
								BasicDBObject ob1 = new BasicDBObject( "NetworkType", network );
								BasicDBObject ob2 = new BasicDBObject( "status", "success" );
								BasicDBList andVals = new BasicDBList();
								andVals.add( ob1 );
								andVals.add( ob2 );
								DBObject out_objects = new BasicDBObject( "$and", andVals );								
								DBCursor cursor_out_clients = collection.find( out_objects );
								
								int totalclients = cursor_present_clients.count();
								%>
								<div style="color:black">Total Clients</h2></div>
								<div style="color:black"><%=totalclients%></div>
								<%
								
								%>
								
								<%
								while(cursor_present_clients.hasNext()){
									DBObject object2 = cursor_present_clients.next();
									String Network = object2.get("Network").toString();
									String Smspack = object2.get("Smspack").toString();
									String Data = object2.get("Data").toString();
																																		
									BasicDBObject subob1 = new BasicDBObject( "network", network );
									BasicDBObject subob2 = new BasicDBObject( "name", object2.get("Name").toString());
									BasicDBList subVals = new BasicDBList();
									subVals.add( subob1 );
									subVals.add( subob2 );
									DBObject subscribe_objects = new BasicDBObject( "$and", subVals );								
									DBCursor subcursor  = sub_collection.find( subscribe_objects );
									
									if( (Network.equals("Good") && Smspack.equals("Good")) || 
										(Network.equals("Good") && Data.equals("Good")) ||
										(Smspack.equals("Good") && Data.equals("Good") ) 										
									   ){										
										%>
												
										<tr>
										<td>Non churner clients</td>							
										<td><%=object2.get("Name") %></td>
										<td><%=object2.get("NetworkType") %>
										</td>				
										</tr>					
										<%											
										}
									else{
										
										%>
										<tr>
										<td> Atl </td>								
										<td><%=object2.get("Name") %></td>
										<td><%=object2.get("NetworkType") %></td>
										</tr>
																		
										<%
									}
								}
								
								%>
								
								<%
								while(cursor_out_clients.hasNext()){
									DBObject object3 = cursor_out_clients.next();
									%>
									<tr>
									<td>Left clients</td>									
									<td><%=object3.get("Name") %></td>
									<td><%=object3.get("NetworkType") %></td>
									</tr>									
									<%																										
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
																				
							%>
							</table>
					</div>			
					<!-- </div> -->			
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