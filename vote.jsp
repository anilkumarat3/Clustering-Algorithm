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
							<img src="images/header.jpg" alt="" /> 
							<img src="images/header2.jpg" alt="" /> 
							<img src="images/header3.jpg" alt="" />
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
					<li><a href="advert.jsp?12" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
				<div class="clear"></div>
			</div>

			<%
				//HttpSession session = request.getSession(false);
				String name = (String) session.getAttribute("name");
				String network = (String) session.getAttribute("network");
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + network);
			%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue;">Welcome:<%=name%></font>

						<form method="get" name="form" action="votedb.jsp">

							<div id="sha">
								<img src="images/comm.jpg" alt="" style="margin-left: 600px; margin-top: 30px" width="300px" />
								<table align="center" width="736" style="margin-left: 100px">
									<form action="votedb.jsp" method="get" name="form" onSubmit="return valida();">
										<tr>
											<td>
												<font style="font: italic small-caps bold 25px Georgia;color:red; ">COMPLAINT BOX</font>
											</td>
										</tr>

										<%
											//HttpSession session = request.getSession(false);
											String name1 = (String) session.getAttribute("name");
											String network1 = (String) session.getAttribute("network");
											String email1 = (String) session.getAttribute("email");
										%>
										<tr>
											<td>
												<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Customer</h4>
											</td>
											<td>
												<input class="tex1" type="text" name="name" value="<%=name%>">
											</td>
										</tr>
										<tr>
											<td>
												<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">NetworkType</h4>
											</td>
											<td>
												<input class="tex1" type="text" name="nettype" value="<%=network%>">
											</td>
										</tr>
										<tr>
											<td>
												<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Email </h4>
											</td>
											<td>
												<input class="tex1" type="text" name="email" value="<%=email1%>">
											</td>																					
										</tr>

										<tr>
											<td class="paragraping2">
												<tr>
													<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Network</h4></td>
													<td><select name="net" class="tex1">
															<option value="select"><---Select Type---></option>
															<option value="Good">Good</option>
															<option value="Poor ">Poor</option>
															<option value="Average ">Average</option>
													</select></td>
												</tr>
												<tr>
													<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Smspack</h4></td>
													<td><select name="sms" class="tex1">
															<option value="select"><---Select Type---></option>
															<option value="Good">Good</option>
															<option value="Poor ">Poor</option>
															<option value="Average ">Average</option>
													</select></td>
												</tr>
												<tr>
													<td><h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Datapack</h4></td>
													<td><select name="data" class="tex1">
															<option value="select"><---Select Type---></option>
															<option value="Good">Good</option>
															<option value="Poor ">Poor</option>
															<option value="Average ">Average</option>
													</select></td>
												</tr>
												<tr>
													<td>
														<h4 style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">YourReview</h4></font>
													</td>
												</tr>
												<tr>
													<td colspan="4" align="center">
														<textarea name="rev" rows="8" cols="80" style="border: 1px solid #C64000; font-family: verdana; font-size: 12px;"></textarea>
													</td>
												</tr>

												<td><center> <input type="submit" value="Submit" name="submit" class="btn"></input></center></td>

												<tr>
													<td><br></td>
												</tr>
									</form>
									</div>
</body>
</html>
