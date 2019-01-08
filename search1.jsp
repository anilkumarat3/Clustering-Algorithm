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
			<h1>
				<a href="#"><b>A Big Data Clustering Algorithm for
						Mitigating <center>the Risk of Customer Churn</center>
				</b></a>
			</h1>
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
				//HttpSession session = request.getSession(false);
				String name = (String) session.getAttribute("forename");
				String network = (String) session.getAttribute("network");
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + network);
			%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 20px">
							Welcome:<%=name%></h2>
						<div class="amar">
							<table align="center" ; style="margin-left: -130px;"
								cellpadding="10px" cellspacing="10px">

								<tr>
									<td>
										<table height="200" width="500"
											style="margin-top: -120px; margin-left: 120px;">
											<form method="post" name="form">

												<tr>

													<td align="center"><font color="#FF0000" size="+2">
														<strong>Customer Anaylise</strong></font></td>
												</tr>
												
												<tr>
													<td colspan="3" align="center"><input type="radio"
														name="p2" value="p2"><font color="#FF00FF">Network</font></td>

												</tr>
											<tr>
												<td><input type='radio' name="aa"
													onclick="document.location.href='search2.jsp';" />Airtel</td>
												<br><br>
												<td><input type='radio' name="p4" class="btn"
													onclick="document.location.href='search3.jsp';" />BSNL</td>
												<br><br>
												<td><input type='radio' name="p5" class="btn"
													onclick="document.location.href='search4.jsp';" />Idea</td>
												<br><br> <!-- <td><input type='radio' name="p6" class="btn" onclick="document.location.href='search5.jsp';"/>Mumbai</td> -->
											</tr>


											</form>

										</table>
									</td>


								</tr>


							</table>

						</div>




					</div>
					<div id="content_right">
						<h2>Company News</h2>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<!-- <img src="/images/a2.png" alt="" /> -->
								<a href="view_customer.jsp">View Customer</a><br /> <a
									href="subscript.jsp">Subscription</a><br /> <a
									href="cusgroup.jsp">Customer Group</a><br /> <a
									href="groupmsg.jsp">Group Message</a><br /> <a
									href="analyst.jsp">Customer Analyses</a> <a
									href="upload_pack.jsp">Upload Pack</a><br />

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
					Mitigating the Risk of Customer Churn</div>
			</div>
		</div>
	</div>

</body>
</html>
