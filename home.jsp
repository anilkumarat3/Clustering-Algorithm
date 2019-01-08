<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.ArrayList"%>
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
					<li><a href="advert.jsp?12" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<%
				String name = (String) session.getAttribute("name");
				int client_id = (Integer) session.getAttribute("client_id");
				System.out.println("Name in home.jsp :" + name);
				//String network = (String) session.getAttribute("network1");
			%>
			<div id="content_white">
				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 20px">
							<!-- Select Subscription -->
						</h2>
						<%
							String mobile = null;
							String namer = null;
							String str = null;
							int balance = 0;
						%>
						<%
							try {

								MongoClient mongo = new MongoClient("localhost", 27017);
								DB db = mongo.getDB("churn");
								DBCollection collection = db.getCollection("client_reg");
								DBCursor cursor = collection.find(new BasicDBObject("client_id", client_id));

								while (cursor.hasNext()) {
									DBObject object = cursor.next();
									mobile = (String) object.get("mobile");
									namer = (String) object.get("name");								
									balance = (Integer) object.get("balance");								
								}
							} catch (Exception e) {
								out.print(e);
							}
							String sub = "No Subscription";
							ArrayList<String> subscribe = new ArrayList<String>();
							try {

								/* Class.forName("com.mysql.jdbc.Driver");
								Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
								PreparedStatement ps3=conn1.prepareStatement("select * from subscribe where name='"+name+"'");
								ResultSet rs3=ps3.executeQuery(); */

								MongoClient mongoClient1 = new MongoClient("localhost", 27017);
								DB db1 = mongoClient1.getDB("churn");
								DBCollection collection1 = db1.getCollection("subscribe");
								DBCursor cursor1 = collection1.find(new BasicDBObject("client_id", client_id));
								while (cursor1.hasNext()) {
									DBObject obj = cursor1.next();
									sub = (String) obj.get("packs");
									subscribe.add(sub);
								}
							} catch (Exception e) {
								out.print(e);
							}
							String sub12[] = new String[subscribe.size()];
							subscribe.toArray(sub12);
						%>

						<h2>
							<font color="#CC0000" face="Courier New, Courier, monospace">User Details</font>
						</h2>
						<br />

						<div class="amar">
							<table>
								<tr>
									<td width="auto"><font color="#006600">Name : </font></td>
									<td></td>
									<td><%=namer%></td>
								</tr>
								<tr>
								</tr>
								<tr>
									<td><font color="#006600">Mobile No. : </font></td>
									<td></td>
									<td><%=mobile%></td>
								</tr>
								<tr></tr>
								<tr>
									<td width="120px"><font color="#006600">Acc.Balance : </font></td>
									<td></td>
									<td><%=balance%>/- rs.</td>
								</tr>
								<tr>
									<td><font color="#006600">Subscription : </font></td>
									<td></td>
									<%
										if (subscribe.size() == 0) {
									%>
									<td><%=sub%></td>
									<%
										} else {
									%><td width="160px">
										<%
											for (int i = 0; i < sub12.length; i++) {
													if (sub12[i].equals("sms1")) {
														str = "SMS Pack 1";
													}
													if (sub12[i].equals("sms2")) {
														str = "SMS Pack 2";
													}
													if (sub12[i].equals("data")) {
														str = "Data Pack";
													}
													if (sub12[i].equals("rtcut")) {
														str = "Rate Cutter Pack";
													}
													if (!((i + 1) == sub12.length)) {
														out.print(str + ",");
													} else {
														out.print(str);
													}
												}
										%>
									</td>
									<%
										}
									%>
								</tr>
							</table>
							<br></br>
							<ul style="list-style: none;">
								<li>
								<a href="advert.jsp?12" style="text-decoration: blink;">
									<strong> <font size="4"> <u>Back</u> </font></strong>
								</a>
								</li>
								<br></br>
								<li>
									<a href="message.jsp?12" style="text-decoration: blink;"> 
										<strong> <font size="4"> <u>Message</u> </font></strong>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="content_right">
						<h2 style="margin-bottom: -15px;">
							<b>User Details</b>
						</h2>
						<div class="content_right_pad">
							<div class="news" style="margin-left: -130px;">
								<%
									String packer = null;
									String active = null;
									String pack = null;
									String plan_id1 = null;
									String plan_id2 = null;
									int id = 0;
									String plname = null;
									String price = null;
									String valid = null;
									String details = null;
									int tree = 0;
								%>
								<font style="font: italic small-caps bold 25px Georgia;color:blue; ">
									<center>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subscribed Services :
									</center>
								</font>
								</h3>
								<br />
								<%
									try {

										/* Class.forName("com.mysql.jdbc.Driver");
										Connection conn12 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
										PreparedStatement ps23=conn12.prepareStatement("select * from subscribe where name='"+name+"'");
										ResultSet rs23=ps23.executeQuery();
										while(rs23.next()) */
										MongoClient mongoClient2 = new MongoClient("localhost", 27017);
										DB db2 = mongoClient2.getDB("churn");
										DBCollection collection2 = db2.getCollection("subscribe");
										DBCursor cursor2 = collection2.find(new BasicDBObject("client_id", client_id));
										while (cursor2.hasNext()) {
											DBObject object2 = cursor2.next();
											plan_id1 = (String) object2.get("plan_id"); 
											packer = (String) object2.get("packs");
											active = (String) object2.get("active");
											if (active.equals("not")) {
												/* PreparedStatement ps25=conn12.prepareStatement("select * from plans where pack='"+packer+"'");
												ResultSet rs25=ps25.executeQuery();
												while(rs25.next()) */
												MongoClient mongoClient3 = new MongoClient("localhost", 27017);
												DB db3 = mongoClient3.getDB("churn");
												DBCollection collection3 = db3.getCollection("plans");
												DBCursor cursor3 = collection3.find(new BasicDBObject("plan_id", Integer.parseInt(plan_id1)));
												while (cursor3.hasNext()) {
													DBObject object3 = cursor3.next();

													pack = (String) object3.get("pack");
													plname = (String) object3.get("name");
													details = (String) object3.get("details");
													price = (String) object3.get("price");
													valid = (String) object3.get("valid");
													
													System.out.println("plan_id in home.jsp :"+ plan_id1);
													System.out.println("client_id in home.jsp :"+ client_id);
													System.out.println("pack in home.jsp :"+ pack);
													System.out.println("name in home.jsp :"+ plname);
													System.out.println("details in home.jsp :"+ details);
													System.out.println("price in home.jsp :"+ price);
													System.out.println("valid in home.jsp :"+ valid);
								%>

								<div class="amar">
									<font color="#006600" face="Georgia, Times New Roman, Times, serif"><%=plname%>:-</font><br />
									Details :<%=details%><br /> 
									Validity :<%=valid%> Days<br /> 
									<br />
								</div>
								<%
									}
											}
											//tree++;
										}
									} catch (Exception e) {
										out.print(e);
									}
									if (tree == 0) {
								%>
								<%
									}
									tree = 0;
								%><br /> 
								<font style="font: italic small-caps bold 25px Georgia;color:blue; ">
									<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										Activated Services : 
									</center> 
								</font>
								</h3>
								<br />
								<%
									try {

										/* Class.forName("com.mysql.jdbc.Driver");
										Connection conn12 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
										PreparedStatement ps23=conn12.prepareStatement("select * from subscribe where name='"+name+"'");
										ResultSet rs23=ps23.executeQuery();
										while(rs23.next()) */
										MongoClient mongoClient4 = new MongoClient("localhost", 27017);
										DB db4 = mongoClient4.getDB("churn");
										DBCollection collection4 = db4.getCollection("subscribe");
										DBCursor cursor4 = collection4.find(new BasicDBObject("client_id", client_id));
										while (cursor4.hasNext()) {
											DBObject object4 = cursor4.next();
											plan_id2 = (String) object4.get("plan_id");
											packer = (String) object4.get("packs");
											active = (String) object4.get("active");
											if (active.equals("act")) {
												/* PreparedStatement ps25=conn12.prepareStatement("select * from plans where pack='"+packer+"'");
												ResultSet rs25=ps25.executeQuery();
												while(rs25.next()) */
												MongoClient mongoClient5 = new MongoClient("localhost", 27017);
												DB db5 = mongoClient5.getDB("churn");
												DBCollection collection5 = db5.getCollection("plans");
												DBCursor cursor5 = collection5.find(new BasicDBObject("plan_id", Integer.parseInt(plan_id2)));
												while (cursor5.hasNext()) {
													DBObject object5 = cursor5.next();
													pack = (String) object5.get("pack");
													plname = (String) object5.get("name");													
													details = (String) object5.get("details");													
													price = (String) object5.get("price");
													valid = (String) object5.get("valid");													
								%>
								<div class="amar">
									<%=plname%>:-<br /> Details :
									<%=details%><br /> Validity :
									<%=valid%>
									Days<br />
								</div>
								<%
									}
											}
											tree++;
										}
									}

									catch (Exception e) {
										out.print(e);
									}
									if (tree == 0) {
								%>
								<h3>
									<font color="#0066CC">You Have No Activations</font>
								</h3>
								<%
									}
								%><br />
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
				<div class="footer_left">A Big Data Clustering Algorithm for Mitigating the Risk of Customer Churn</div>
			</div>
		</div>
	</div>
</body>
</html>
