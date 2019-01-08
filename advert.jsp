<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.Mongo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
					$(window).load(function() { $('#slider').nivoSlider(); });
				</script>
			</div>
			<div id="menu">
				<ul>
					<li><a href="advert.jsp?12" class="active">Home</a></li>
					<!-- <li><a href="client_login.jsp">Login</a></li> -->
					<li><a href="vote.jsp">Feedback</a></li>
					<li><a href="client_logout.jsp">Logout</a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<%
				System.out.println("***************************************");
				String network = (String) session.getAttribute("network");
				System.out.println("session.getAttribute(network) :" + network);
				String name = (String) session.getAttribute("name");
				System.out.println("session.getAttribute(name) :" + name);
				System.out.println("***************************************");
			%>
			<div id="content_white">
				<div id="content">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; ">
							<center>Select Subscription</center>
						</font>

<!--****************************************** Unused code ************************************************************************* -->
						<%
							String disp = request.getQueryString();
							System.out.print("@@@@@@@@@@$$$$$$$$" + disp);
							if (disp.equals("resuc")) {
						%>
						<h2 align="center">
							<font color="#009900"> Your Account Has Been Recharged Successfully </font>
						</h2>
						<br/>
						<%
							}
							if (disp.equals("refail")) {
						%>
						<h2 align="center">
							<font color="#FF0000">You Have Entered a Wrong Username Or Password Please Try Again</font>
						</h2>
						<br/> 
						<a href="recharge.jsp" style="text-decoration: none;">
								<h3>
									<font color="#009900">Recharge Now</font>
								</h3>
						</a>
						<%
							} else {
								String packed = null;
								try {
									Mongo mongo1 = new Mongo("localhost", 27017);
									DB db1 = mongo1.getDB("churn");
									DBCollection collection1 = db1.getCollection("plans");
									BasicDBObject obj1 = new BasicDBObject();
									obj1.put("pack", disp);
									DBCursor cursor1 = collection1.find(obj1);

									while (cursor1.hasNext()) {
										DBObject object1 = cursor1.next();
										packed = (String) object1.get("name");
						%>
						<h2 align="center">
							<font color="#FF0000">
								Request Failed !!! You Have Low
								Balance You Can Not Subscribe For <font color="#CC3366">"<%=packed%>"</font>
								Please Recharge To Subscribe it.
							</font>
						</h2>
						<br/> <a href="recharge.jsp" style="text-decoration: none;">
									<h3><font color="#009900">Recharge Now</font></h3>
							   </a>
						<%
							}
								} catch (Exception e) {
									out.print(e);
								}
							}
						%>
						
<!--****************************************** Unused code but please do not alter ************************************************************************* -->							

						<%
							String pack = null, plname = null, price = null, valid = null, details = null;
							int plan_id = 0;
						
							try {
								MongoClient mongoClient1 = new MongoClient("localhost", 27017);
								DB db1 = mongoClient1.getDB("churn");
								DBCollection collection1 = db1.getCollection("plans");
								DBCursor cursor1 = collection1.find(new BasicDBObject("network", network));
								System.out.println("***************************************");
								System.out.println("network value is :" + network);
								try {
									while (cursor1.hasNext())
									{
										DBObject object1 = cursor1.next();
										pack = (String) object1.get("pack");
										plname = (String) object1.get("name");
										details = (String) object1.get("details");
										price = (String) object1.get("price");
										valid = (String) object1.get("valid");
										if(object1.containsKey("plan_id")){
											plan_id = (Integer) object1.get("plan_id");	
										}																				
																			
										%>
										<div class="amar">											 
												<%=plname%> :-
												<h5>
													Details  : <%=details%><br/> 
													Validity : <%=valid%> Days<br/> 
													Price Rs.: <%=price%>/-<br />
													<a href="plan.jsp?<%=pack%>&<%=plan_id%>" style="text-decoration: none">Subscribe</a>
												</h5>											
										</div>
										<%
									}
								} finally {
									cursor1.close();
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
					</div>
					<div id="content_right">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; ">Company News</font>
						<div class="content_right_pad">
							<div class="news" style="margin-left: -130px;">
								<%
									String mobile = null;
									String namer = null;
									String str = null;
									int balance = 0;

									try {
										MongoClient mongoClient2 = new MongoClient("localhost", 27017);
										DB db2 = mongoClient2.getDB("churn");
										DBCollection collection2 = db2.getCollection("client_reg");
										DBCursor cursor2 = collection2.find(new BasicDBObject("name", name));
										System.out.println("name value is :" + name);
										while (cursor2.hasNext())
										{
											DBObject object2 = cursor2.next();
											mobile = (String) object2.get("mobile");
											namer = (String) object2.get("name");
											balance = (Integer) object2.get("balance");
										}
									} catch (Exception e) {
										out.print(e);
									}
									String sub = "No Subscriptions";
									String check = "not";
									ArrayList<String> subscribe = new ArrayList<String>();
									try {
										MongoClient mongoClient3 = new MongoClient("localhost", 27017);
										DB db3 = mongoClient3.getDB("churn");
										DBCollection collection3 = db3.getCollection("subscribe");
										List<BasicDBObject> criteria = new ArrayList<BasicDBObject>();
										criteria.add(new BasicDBObject("name", new BasicDBObject("$eq", name)));
										criteria.add(new BasicDBObject("active", new BasicDBObject("$eq", check)));

										DBCursor cursor3 = collection3.find(new BasicDBObject("$and", criteria));

										System.out.println("Name " + name);
										System.out.println("check " + check);

										while (cursor3.hasNext())

										{
											DBObject object3 = cursor3.next();
											sub = (String) object3.get("packs");
											subscribe.add(sub);
										}
									} catch (Exception e) {
										out.print(e);
									}
									String sub12[] = new String[subscribe.size()];
									subscribe.toArray(sub12);
								%>
								<div class="amar">
									<table>
										<tr>
											<td width="auto"><font color="#006600">Name : </font></td>
											<td></td>
											<td><%=namer%></td>
										</tr>										
										<tr>
											<td><font color="#006600">Mobile No. : </font></td>
											<td></td>
											<td><%=mobile%></td>
										</tr>									
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
											%>
											<td width="220px">
												<%
													for (int i = 0; i < sub12.length; i++) {
															System.out.println("all packs for a client :" + sub12[i]);
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
										<tr>										
											<td><a href="plan.jsp?no_plan&00" style="text-decoration: none">Details</a></td>
										</tr>																			
									</table>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<!-- end of the content -->
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
						<font size="+1"> A Big Data Clusteringn Algorithm for Mitigating the Risk of Customer Churn</font>
					</marquee>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
