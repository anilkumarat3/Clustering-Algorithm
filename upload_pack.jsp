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
							<img src="images/header.jpg" alt="" /> <img
								src="images/header2.jpg" alt="" /> <img
								src="images/header3.jpg" alt="" />
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
					<li><a href="member_home.jsp" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<%
				HttpSession session2 = request.getSession(false);
				String name = (String) session2.getAttribute("forename");
				String network = (String) session2.getAttribute("network");
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + network);
			%>
			<div id="content_white">
				<div id="content">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; "> Welcome:<%=name%></font>
						<div class="amar">
							<form action="upload_pack" method="post">
								<table cellpadding="10px" cellspacing="10px">
									<tr>
										<td>
										<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Choose Service</td>
										<td>
											<select name="category" class="tex1">
													<option value="choose"><----Choose----></option>
													<option value="SMS">SMS</option>
													<option value="Data Pack">Data Pack</option>
													<option velue="Call Rate Cut">Call Rate Cut</option>
											</select>
										</td>
									</tr>
									<tr>
										<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Keyword</td>
										<td><input type="text" name="keyword" class="tex1"></input></td>
									</tr>
									<tr>
										<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Name</td>
										<td><input type="text" name="name" class="tex1"></input></td>
									</tr>
									<tr>
										<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Details</td>
										<td><input type="text" name="details" class="tex1"></input></td>
									</tr>
									<tr>
										<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Price</td>
										<td><input type="text" name="price" class="tex1"></input></td>
									</tr>
									<tr>
										<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Validity</td>
										<td><input type="text" name="validity" class="tex1"></input></td>
									</tr>
									<tr>
										<td></td>
										<td colspan="2">
											<input type="submit" name="submit" class="btn" value="Send">
											<input type="reset" name="clear" class="btn" value="clear"></input>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div id="content_right">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; ">Company News</font>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<!-- <img src="/images/a2.png" alt="" /> -->
								<a href="member_home.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>View Customer</u>
								</a>
								<br /> 
								<a href="subscript.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Subscription</u>
								</a>
								<br /> 
								<a href="cusgroup.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Customer Group</u>									
								</a>
								<br />
								<a href="groupmsg.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Group Message</u>
								</a>
								<br /> 
								<a href="view.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Customer Complaints</u>
								</a>
								<br /> 
								<a href="comview.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Customer analysis</u>
								</a>
								<br />
								<a href="upload_pack.jsp">
									<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">
									<u>Upload Pack</u>
								</a>
								<br />

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
						<font size="+1"> A Big Data Clustering Algorithm for Mitigating the Risk of Customer Churn</font>
					</marquee>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
