<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Customer Churn</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/cufon-yui.js"></script>
<script type="text/javascript" src="jquery/English_italic_500.font.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	Cufon.replace('h1')('h2')('h3')('#menu a', {
		hover : true
	});
</script>

 <script>
  $( function() {
	  var date = new Date(); 
	  var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
    $( "#dob" ).datepicker({
    	
      changeMonth: true,
      changeYear: true,
      yearRange: '1900:' + new Date().getFullYear(),
      maxDate: new Date(y, m, d)
    });
  } );
  </script>

<!-- AngularJs Script -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
function validation(){
	
	var allLetters = /^[a-zA-Z]+$/;
    var letter =  /^[a-zA-Z ]{4,30}$/;
    var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    var number = /^[0-9]{6,8}$/;
    var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    
	var name = document.forms["f"]["name"].value;
	console.log("name" + name);
    if (name == "") {
        alert("User Name must be filled out");
        return false;
    }
    if(!letter.test(name)){
    	alert("User Name must contains only letters and space with min of 4 and max of 30 characters");
        return false;
    }
    
    var pass = document.forms["f"]["pass"].value;
    if (pass == "") {
        alert("Password must be filled out");
        return false;
    }
    if (!password.test(pass))
    {
    	alert("Your Password should contain at least one digit,least one lower case,least one upper case,at least 8 characters");
    	return false;
    }
    
    var e = document.getElementById("network");
    var strUser = e.options[e.selectedIndex].value;
    if(strUser=='Select')
    {
        alert("Please select a Network");
        return false;
    }
    
    var mobile = document.forms["f"]["mobile"].value;
    if (mobile == "") {
        alert("Mobile number must be filled out");
        return false;
    }    

    var e1 = document.getElementById("network_type");
    var strUser = e1.options[e1.selectedIndex].value;
    if(strUser=='Select')
    {
        alert("Please select a Network type");
        return false;
    }
    
    var email = document.forms["f"]["email"].value;
    if (email == "") {
        alert("Email must be filled out");
        return false;
    }
    if(!pattern.test(email))
    {
    	alert("Enter valid mail id");
        return false;
    }
    
    var gender = document.forms["f"]["gender"].value;
    if (gender == "") {
        alert("Select Gender");
        return false;
    }
}

function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
</script>
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
					<li><a href="client_login.jsp" class="active">Home</a></li>
					<li><a href="client_reg.jsp">Register</a></li>
					<!-- <li><a href="logout.jsp">Logout</a></li> -->

				</ul>
				<div class="clear"></div>
			</div>

			<%-- <%
				HttpSession session2 = request.getSession(false);
				String name = (String) session2.getAttribute("forename");
			%> --%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue; "> New Client Register Here</font>
						<form action="client_reg" name="f" method="post" onsubmit="return validation()">
							<table style="margin-left: 50px;" cellpadding="10px" cellspacing="10px">
								<tr>																										
									<td><label for="name" style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">User Name*</label></td>                				
                					<td><input id="name" class="tex1" name="name" type="text"  ></td>															
								</tr>
								<tr>
									<td><label for="password" style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Password*</label></td>
									<td><input type="password" name="pass" class="tex1"  id="password"></td>															
								</tr>
								<tr>
									<td><label for="network" style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Network*</label></td>
									<td>									
										<select id="network" name="network" class="tex1">
											<option>Select</option>
											<option value="Airtel">Airtel</option>
											<option value="Aircel">Aircel</option>
											<option value="Reliance">Reliance</option>
											<option value="Videocon">Videocon</option>
											<option value="BSNL">BSNL</option>
										</select>
									</td>																							                                    
								</tr>
								<tr>
									<td><label for="mobile" style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Mobile No*</label></td>
									<td><input id="mobile" type="text" name="mno" class="tex1" maxlength="10" onkeypress="return onlyNos(event,this);" ></td>
								</tr>														
								<tr>
									<td><label for="network_type" style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Network type</label></td>
									<td>
										<select id="network_type" name="network_type" class="tex1">
												<option>Select</option>
												<option value="Prepaid">Prepaid</option>
												<option value="Postpaid">Postpaid</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><label for="email"  style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Email</label></td>
									<td><input type="text" name="email" class="tex1"></td>
								</tr>
								<tr>
									<td><label for="gender"  style="font: italic small-caps bold 20px Georgia; font-size: 18px; color: maroon;">Gender</label></td>
									<td>
										<input type="radio" name="gender" value="male"><font color="black">Male</font> 
										<input type="radio" name="gender" value="female"><font color="black">FeMale</font></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit" class="btn" name="submit" value="Register">
										<input type="reset" class="btn" name="reset" value="Clear">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- <div id="content_right">
					 <font style="font: italic small-caps bold 25px Georgia;color:blue;"> Company News </font>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<img src="/images/a2.png" alt="" />
								<a href="member_home.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>View Customer</a></u><br/>
								<a href="subscript.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Subscription</a></u><br/>
								<a href="cusgroup.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Customer Group</a></u><br/>
								<a href="groupmsg.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Group Message</a></u><br/>
							    <a href="view.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Customer Complaints</a></u><br/>
							     <a href="comview.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Customer analysis</a></u><br/>
								<a href="upload_pack.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:+1;color:maroon;"><u>Upload Pack</a></u><br />
								<div class="clear"></div>
							</div>
						</div>										
 -->
					<div id="content_right">
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<img src="images/i4.jpg" alt="" title="" width="250px"
									height="200px" />

								<div class="clear"></div>
							</div>
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
