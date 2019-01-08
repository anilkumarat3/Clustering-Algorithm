<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Churn</title>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet" />
<script type="text/javascript" src="jquery/cufon-yui.js"></script>
<script type="text/javascript" src="jquery/English_italic_500.font.js"></script>
<script src = "js/jquery-1.10.2.js"></script>
<script src = "js/jquery-ui.js"></script>
<script type="text/javascript">
	Cufon.replace('h1')('h2')('h3')('#menu a', {
		hover : true
	});
</script>
<!-- AngularJs Script -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<!-- 
<script>
  $( function() {
	  var date = new Date(); 
	  var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
    $("#dob").datepicker({    	
      changeMonth: true,
      changeYear: true,
      yearRange: '1900:' + new Date().getFullYear(),
      maxDate: new Date(y, m, d)
    });
  } );
</script> -->

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

<script type="text/javascript">
      $(function() {
            $( "#dob-datepicker" ).datepicker();
            $( "#dob-datepicker" ).datepicker("show");
         });
</script>

<script type="text/javascript">
function validation(){
	
	var allLetters = /^[a-zA-Z]+$/;
    var letter =  /^[a-zA-Z ]{4,30}$/;
    var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    var number = /^[0-9]{6,8}$/;
    var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    
	var name = document.forms["f"]["forename"].value;
    if (name == "") {
        alert("ForeName must be filled out");
        return false;
    }
    if(!letter.test(name)){
    	alert("ForeName must contains only letters and space with min of 4 and max of 30 characters");
        return false;
    }
    
    var surname = document.forms["f"]["surname"].value;
    if (surname == "") {
        alert("SurName must be filled out");
        return false;
    }
    if(!letter.test(surname)){
    	alert("SurName must contains only letters and space with min of 4 and max of 30 characters");
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
    
    var network = document.getElementById("network");
    var strUser = network.options[network.selectedIndex].value;
    if(strUser=='Select')
    {
        alert("Please select a Network");
        return false;
    }
    
    var address = document.forms["f"]["addressline"].value;
    if (address == "") {
        alert("Address must be filled out");
        return false;
    }
    
    var city = document.forms["f"]["city"].value;
    if (city == "") {
        alert("city must be filled out");
        return false;
    }
    
    var postalcode = document.forms["f"]["postalcode"].value;
    if (postalcode == "") {
        alert("postal code must be filled out");
        return false;
    }
    
    var mobile = document.forms["f"]["mobile"].value;
    if (mobile == "") {
        alert("Mobile number must be filled out");
        return false;
    }  
    
    var mobile = document.forms["f"]["hometelephone"].value;
    if (mobile == "") {
        alert("Mobile number must be filled out");
        return false;
    }
    
    var dob = document.forms["f"]["dob"].value;
    if (dob == "") {
        alert("DOB must be filled out");
        return false;
    }    
    
    var gender = document.forms["f"]["gender"].value;
    if (gender == "") {
        alert("Select Gender");
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
					<li><a href="networkerlogin.jsp" class="active">Home</a></li>
					<li><a href="reg.jsp">Register</a></li>					
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
				<font style="font: italic small-caps bold 25px Georgia;color:blue; ">	NetWork Subscriber Registration Here...</font>
						<form action="networkdb" name="f" method="post" onsubmit="return validation()">
							<table style="margin-left: 50px;" cellpadding="10px" cellspacing="10px">
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">ForeName</td>
									<td><input  class="tex1" type="text" name="forename" class="textbox"></td>
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">SurName</td>
									<td><input class="tex1"  type="text" name="surname" class="textbox"></td>
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Email</td>
									<td><input class="tex1"  type="text" name="email" class="textbox"></td>
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Network</td>
									<td><select id="network" name="network" class="tex1">
											<option value="Select">Select</option>
											<option value="Airtel">Airtel</option>
											<option value="Aircel">Aircel</option>
											<option value="Reliance">Reliance</option>
											<option value="Videocon">Videocon</option>
											<option value="BSNL">BSNL</option>
									</select></td>
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">AddressLine</td>
									<td><input class="tex1"  type="text" name="addressline" class="textbox"></td>
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">City/Town</td>
									<td><input class="tex1"  type="text" name="city" class="textbox"></td>
								</tr>
								<tr>
									<td><label  for="pincode" style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">PostalCode</label></td>
									<td><input  class="tex1"  type="text" name="postalcode" class="textbox" onkeypress="return onlyNos(event,this);"/></td>																
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">HomeTelepone</td>
									<td><input class="tex1"  type="text" name="hometelephone" class="textbox" onkeypress="return onlyNos(event,this);" /></td>																	
								</tr>
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Mobile</td>
									<td><input class="tex1"  type="text" name="mobile" class="textbox" onkeypress="return onlyNos(event,this);" /></td>
								</tr>
								<tr>
									<td><label for="dob" style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Date of Birth</label></td>
									<td><input type="text" id="dob-datepicker" name="dob" class="text" /></td>															
								</tr>
								<tr>
									<td><label for="gender" style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Gender</label></td>
									<td>
										<input type="radio" name="gender" value="male"><font color="black">Male</font>
										<input type="radio" name="gender" value="female"><font color="black">FeMale</font>
									</td>
								</tr>								
								<tr>
									<td><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;">Password</td>
									<td><input class="tex1"  type="password" name="pass" class="textbox"></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="submit" class="btn" name="submit" value="Register"> 
										<input type="reset" class="btn" name="reset" value="Clear">
									</td>
								</tr>																
							</table>

						</form>

					</div>
					<div id="content_right">
						
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<img src="images/d2.jpg" alt="" title="" width="250px"
									height="200px" />

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
