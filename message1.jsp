<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.Mongo"%>
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
					<li><a href="index.html" class="active">Home</a></li>
					<li><a href="networkerlogin.jsp">Login</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
			<%
				String name = (String) session.getAttribute("name");
				System.out.println("&&&&&&&&&&&&&&&&&&&&&&:" + name);
				String network = (String) session.getAttribute("network1");
			%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 40px">
							Messages
						</h2>

						<%
							String keying = request.getParameter("key");
							System.out.println("%%%%%%%%%%%%%%%%%%%%%%Keying:" + keying);
							String msg = null;
							String from = "Customer Care";
							String idid = request.getQueryString();
							//System.out.println("$$$$$$$$$$$$$$$$$$$$$$:"+idid);
							String key = null;
							int id = 0;
							try {
								/* Class.forName("com.mysql.jdbc.Driver");
								Connection conn12 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
								PreparedStatement ps23=conn12.prepareStatement("select * from message where id='"+idid+"'");
								ResultSet rs23=ps23.executeQuery();
								while(rs23.next())
								{
								 */
								Mongo mongo11 = new Mongo("localhost", 27017);
								DB db11 = mongo11.getDB("churn");
								DBCollection collection11 = db11.getCollection("message");
								DBCursor cursor11 = collection11.find(new BasicDBObject("_id", idid));
								while (cursor11.hasNext()) {

									DBObject object12 = cursor11.next();

									 msg = (String) object12.get("msg");
									//System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%qqqq:"+msg); 
									String key11 = (String) object12.get("enkey");
									System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%qqkeyq:" + key11);

									String id1 = object12.get("_id").toString();
									//System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%qqqq:"+id1); 
									/* if (key11.equals(keying)) {  */
						%>
						<div class="amar">
							
							
							<table>
    <tr>
   	 <td><h4><font color="#006600">From : </font></h4></td>
     <td><h4><font><%=from%></font></h4></td>
     </tr>
     <tr>
     <td><h4><font color="#006600">Message : </font></h4></td>
     <td><h4><font><%=msg%></font></h4></td>
     </tr>
     <tr>
     <td></td>
     <td><input type="submit" name="sub" class="sumit" value="Submit"></td>
     <td><a href="delmsg.jsp?id1=<%=id1%>"><button name="del" class="delit">Delete</button></a></td>
     </tr>
     </table>
						</div>
						<%
							/* } else {
										response.sendRedirect("message.jsp?fail");
									} */
								}
							} catch (Exception s) {
								s.printStackTrace();
							}
						%>

					</div>
					<div id="content_right">
						<h2>Company News</h2>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<div style="margin-top: -170px; width: auto;">
									<%
										String disp = request.getQueryString();
										String packed = null;
										try {

											/* Class.forName("com.mysql.jdbc.Driver");
											Connection conn19 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
											PreparedStatement ps93=conn19.prepareStatement("select * from plans where pack='"+disp+"'");
											ResultSet rs93=ps93.executeQuery();
											while(rs93.next())
												{ */

											MongoClient mongoClient = new MongoClient("localhost", 27017);
											DB db = mongoClient.getDB("churn");
											DBCollection collection = db.getCollection("plans");
											BasicDBObject obj1 = new BasicDBObject();
											obj1.put("pack", disp);
											DBCursor cursor1 = collection.find(obj1);
											while (cursor1.hasNext()) {
												DBObject object = cursor1.next();
												packed = (String) object.get("name");
									%>
									<h3 align="center">
										<font color="#009900">Request Sent Successfully !!! You
										Have Subscribed for <font color="#CC3366">"<%=packed%>"</font></font>
									</h3>
									<br />
									<%
										}
										} catch (Exception e) {
											out.print(e);
										}
									%>
								</div>

								<%
									String mobile = null;
									String namer = null;
									String str = null;
									int balance = 0;

									try {

										/* Class.forName("com.mysql.jdbc.Driver");
										Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
										PreparedStatement ps=conn.prepareStatement("select * from user where name='"+name+"'");
										ResultSet rs9=ps.executeQuery();
										while(rs9.next())
										{
										 */
										MongoClient mongoClient1 = new MongoClient();
										DB db1 = mongoClient1.getDB("churn");
										DBCollection collection2 = db1.getCollection("client_reg");
										BasicDBObject object2 = new BasicDBObject();
										object2.put("name", name);
										DBCursor cursor2 = collection2.find(object2);
										while (cursor2.hasNext()) {
											DBObject object3 = cursor2.next();
											mobile = (String) object3.get("mobile");
											namer = (String) object3.get("name");
											balance = (Integer) object3.get("balance");
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
										ResultSet rs3=ps3.executeQuery();
										while(rs3.next())
										{ */

										MongoClient mongoClient22 = new MongoClient();
										DB db22 = mongoClient22.getDB("churn");
										DBCollection collection22 = db22.getCollection("subscribe");
										BasicDBObject object22 = new BasicDBObject();
										object22.put("name", name);
										DBCursor cursor22 = collection22.find(object22);
										while (cursor22.hasNext()) {
											DBObject object33 = cursor22.next();
											sub = (String) object33.get("packs");
											subscribe.add(sub);

										}
									} catch (Exception e) {
										out.print(e);
									}
									String sub12[] = new String[subscribe.size()];
									subscribe.toArray(sub12);
								%>
								<!-- <div style="margin-left:-20px; margin-top:0px;float:left;height:214px; width:auto;">  -->
								<div class="amar">


									<table style="margin-left: -150px; margin-top: 155px";>
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
											<td width="120px"><font color="#006600">Acc.Balance
												: </font></td>
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
