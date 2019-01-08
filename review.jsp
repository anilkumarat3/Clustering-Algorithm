<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
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
					<li><a href="index.html" class="active">Home</a></li>
					<li><a href="networkerlogin.jsp">Login</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<form action="book2.jsp" method="get" name="f1"
							onSubmit="return validation();">
							<tr>
								<td height="34" class="paragraping2"><font color="#FF0000">Search
										by Category </font></td>
							</tr>
							<tr>
								<td height="54"><input type="text" name="bookid"
									style="border: 1px solid red; font-family: verdana; font-size: 12px; width: 200px; padding: 5px 5px 5px 5px;"></td>
							</tr>
							<tr>
								<td height="42">&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="submit" name="sub" value="Search"
									style="border: 1px solid green; font-family: verdana; font-size: 12px; padding: 2px 2px 2px 2px;">
								</td>
							</tr>
						</form>
					</table>
					<table align="center" width="250">
						<form action="book3.jsp" method="get" name="f2"
							onSubmit="return validat();">
							<tr>
								<td height="34" class="paragraping2"><font color="#FF0000">Search
										by Book Type</font></td>
							</tr>
							<tr>
								<td height="54"><input type="text" name="bookid"
									style="border: 1px solid red; font-family: verdana; font-size: 12px; width: 200px; padding: 5px 5px 5px 5px;"></td>
							</tr>
							<tr>
								<td height="42">&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="submit" name="sub" value="Search"
									style="border: 1px solid green; font-family: verdana; font-size: 12px; padding: 2px 2px 2px 2px;">
								</td>
							</tr>
						</form>
					</table></td>
				<td width="809" valign="top">

					<table align="center" width="750">
						<%
							String user = (String) session.getAttribute("user");

							try {
								Mongo mongo1 = new Mongo("127.0.0.1", 27017);
								DB db1 = mongo1.getDB("churn");
								DBCollection collection1 = db1.getCollection("register");
								DBCursor cursor1 = collection1.find(new BasicDBObject("name", user));
								while (cursor1.hasNext()) {
									DBObject object = cursor1.next();

									String s1 = (String) object.get("name");
						%>

						<td width="80" colspan="4" align="center" class="paragraping2">Welcome
							&nbsp;&nbsp;|&nbsp;&nbsp;<%
							out.println(object.get("name"));
						%>&nbsp;
							&nbsp;|&nbsp;<a href="logout.jsp" class="paragraping2">Signout&nbsp;|</a>
						</td>



						</tr>
						<tr>
							<td><a
								href="userpage.jsp?<%out.println(object.get("name"));%>"
								class="paragraping2"><img src="images/step1.jpg"></a></td>
							<td><a
								href="uservote.jsp?<%out.println(object.get("name"));%>"
								class="paragraping2"><img src="images/next2.jpg"></a></td>
						</tr>
						<%
							}

							} catch (Exception e1) {
								out.println("Your given didn't match to our database");
								System.out.println(e1);

							}
						%>
					</table>
					<table align="left" width="600">
						<tr bgcolor="#910000">
							<td class="paragraping2" width="68" style="color: white;">Book
								ID</td>
							<td class="paragraping2" width="310" style="color: white;">Book
								Name</td>
							<td class="paragraping2" width="10" style="color: white;">Book
								Category</td>
							<td class="paragraping2" width="97" style="color: white;">Book
								Type</td>
							<td class="paragraping2" width="245" style="color: white;">Rank
								Here</td>
						</tr>
						<%
							String bookid = request.getParameter("bookid");
							//System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:"+bookid);

							try {
								MongoClient mongoClient = new MongoClient("127.0.0.1", 27017);
								DB db = mongoClient.getDB("churn");
								DBCollection collection = db.getCollection("client_reg");
								BasicDBObject wherequery = new BasicDBObject();
								wherequery.put("book_name", bookid);
								DBCursor cursor = collection.find(wherequery);

								while (cursor.hasNext()) {
									DBObject object1 = cursor.next();
									String id = object1.get("_id").toString();
						%>

						<td width="102" class="paragraping2">
							<%
								out.println(object1.get("bookid"));
							%>
						</td>
						<td width="112" class="paragraping2">
							<%
								out.println(object1.get("book_name"));
							%>
						</td>
						<td width="140" class="paragraping2">
							<%
								out.println(object1.get("book_catagory"));
							%>
						</td>
						<td width="117" class="paragraping2">
							<%
								out.println(object1.get("add_typename"));
							%>
						</td>
						<td>
							<div id="container">
								<p>
									<a href="#?<%=%>" onClick="pop('popDiv')"><font
										class="paragraping2" style="text-decoration: none;">Vote</font></a>
								</p>
								</p>
							</div>

							<div id="popDiv" class="ontop">
								<table align="center" width="736">
									<form action="addvoteinsert.jsp" method="get" name="form"
										onSubmit="return valida();">
										<tr bgcolor="#950000">
											<td colspan="4" height="30"><font class="paragraping2"><font
													color="#FFFFFF">Add Your Vote</font></font></td>
										</tr>
										<tr>
											<td height="51"><label for="Key" class="paragraping2">Book
													ID:</label></td>
											<td colspan="3"><input name="bookid" type="text"
												style="border: 1px #A8A8FF solid; font-family: verdana; padding: 2px 2px 2px 2px; font-size: 12px;" />
												&nbsp;&nbsp;</td>
										</tr>
										<tr>
											<td class="paragraping2"><font color="#006600">Trustworthy</font><br>
												<input type="checkbox" name="trust" value="Poor">&nbsp;&nbsp;Poor<br>
												<input type="checkbox" name="trust" value="Good">&nbsp;&nbsp;Good<br>
												<input type="checkbox" name="trust" value="very Good">&nbsp;&nbsp;Very
												Good<br> <input type="checkbox" name="trust"
												value="Excellent">&nbsp;&nbsp;Excellent<br></td>
											<td width="131" class="paragraping2"><font
												color="#006600">Objective</font><br> <input
												type="checkbox" name="object" value="Poor">&nbsp;&nbsp;Poor<br>
												<input type="checkbox" name="object" value="Good">&nbsp;&nbsp;Good<br>
												<input type="checkbox" name="object" value="Very Good">&nbsp;&nbsp;Very
												Good<br> <input type="checkbox" name="object"
												value="Excellent">&nbsp;&nbsp;Excellent<br></td>
											<td width="160" class="paragraping2"><font
												color="#006600">Complete</font><br> <input
												type="checkbox" name="complete" value="Poor">&nbsp;&nbsp;Poor<br>
												<input type="checkbox" name="complete" value="Good">&nbsp;&nbsp;Good<br>
												<input type="checkbox" name="complete" value="Very Good">&nbsp;&nbsp;Very
												Good<br> <input type="checkbox" name="complete"
												value="Excellent">&nbsp;&nbsp;Excellent<br></td>
											<td width="178" class="paragraping2"><font
												color="#006600">Well-Written</font><br> <input
												type="checkbox" name="well" value="Poor">&nbsp;&nbsp;Poor<br>
												<input type="checkbox" name="well" value="Good">&nbsp;&nbsp;Good<br>
												<input type="checkbox" name="well" value="very Good">&nbsp;&nbsp;Very
												Good<br> <input type="checkbox" name="well"
												value="Excellent">&nbsp;&nbsp;Excellent<br></td>
										</tr>
										<tr>
											<td colspan="4" class="paragraping2">Please select your
												ratings on a scale of Checkbox. Comments in Your Review are
												vital to Ranking Spatial reviews and should be descriptive,
												witty and pithy.</td>
											<br>
										</tr>
										<tr>
											<td colspan="4" class="paragraping2"><font
												color="#FF0000">Your Review</font></td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
										<tr>
											<td colspan="4" align="center"><textarea name="mess"
													rows="8" cols="80"
													style="border: 1px solid #C64000; font-family: verdana; font-size: 12px;"></textarea></td>
										</tr>
										<tr>
											<td class="paragraping2" colspan="4">You have 400
												characters remaining for your review.</td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
										<tr>
											<td></td>
											<td align="right"><input type="submit" value="Submit"
												name="submit"
												style="border: 1px solid green; color: red; font-size: 15px; font-family: verdana; width: 80px; height: 25px;" /></td>
											<td><input type="reset" value="Clear" name="reset"
												style="border: 1px solid green; color: red; font-size: 15px; font-family: verdana; width: 80px; height: 25px;" /></td>
											<td></td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
									</form>
									<a style="margin-left: 800px;" href="#"
										onClick="hide('popDiv')"><b>Close</b></a>

								</table>

							</div> <script src="http://www.google-analytics.com/urchin.js"
								type="text/javascript">
								
							</script> <script type="text/javascript">
	_uacct = "UA-184511-1";
	urchinTracker();
</script>
						</td>
						</tr>
						<tr>
							<td colspan="5"><br>
							<br></td>
						</tr>
						<tr>
							<td colspan="5" bgcolor="#FFCC00" align="center" height="30"
								class="paragraping2">R-tree Generation</td>
						</tr>
						<tr class="paragraping2">
							<%
								Integer hitsCount3 = (Integer) application.getAttribute("hitCounter");
										if (hitsCount3 == null || hitsCount3 == 0) {
											/* First visit */
											out.println("!");
											hitsCount3 = 3;
										} else {
											/* return visit */
											out.println("");
											hitsCount3 = hitsCount3 + 2;
										}
										application.setAttribute("hitCounter", hitsCount3);
							%>
							<td height="901" valign="top" colspan="5" align="left"
								bgcolor="#FFCECE" class="paragraping">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Query
								Name<br>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								class="pass">
									<%
										out.println(object1.get("bookid"));
									%>
							</font> <br>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="images/arrow.jpeg" width="35" height="72"><br>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Indexing+
								Technique<br>
							<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								class="pass">Index+ Method</font><br>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="images/arrow.jpeg" width="29" height="100"> Database
								Name<br>&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								class="input" size="+1">vote</font>&nbsp; <br>
							<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="images/arrow.jpeg" width="33" height="76"><br>
							<br> &nbsp;&nbsp;&nbsp;<font class="pass"><font
									size="+1">rank</font></font>&nbsp;&nbsp;&nbsp;<font class="pass"><font
									size="+1">type</font></font>&nbsp;&nbsp;&nbsp; <font class="pass"><font
									size="+1">url</font></font>Table Name<br>
							<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="images/left.png" width="31" height="56">&nbsp;&nbsp;&nbsp;<img
								src="images/right.png" width="32" height="54"><br> <br>
								<font class="pass">
									<%
										out.println(object1.get("book_name"));
									%>
							</font>&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								class="pass">
									<%
										out.println(object1.get("bookid"));
									%>
							</font>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								class="input">No of Hits&nbsp;<img src="images/ul-01.gif">&nbsp;&nbsp;&nbsp;<font
									size="+1"><%=hitsCount3%></font></font> <br>
							<br>
								&nbsp;NN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NN&nbsp;(Neighbour
								Node)
							</td>
						</tr>
						<%
							}
							}

							catch (Exception e1) {
								out.println("OOP'S");
								System.out.println(e1);

							}
							
						%>
 
					</table>
				</td>
			</tr>
		</table>










	</div>
	<div id="footer">

		<div id="connect">
			<a href="#" id="facebook" target="_blank">Facebook</a> <a href="#"
				id="twitter" target="_blank">Twitter</a> <a href="#" id="googleplus"
				target="_blank">Google&#43;</a> <a href="#" id="pinterest"
				target="_blank">Pinterest</a>
		</div>
	</div>
</body>
</html>