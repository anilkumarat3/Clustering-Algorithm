<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.mongodb.Mongo"%>
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

<script type="text/javascript">
function funn()
{
	var b= document.fun.toadd.value;
	if(b=="")
	{
		alert("Enter The To Address");
		document.fun.toadd.focus();
		return false;
	}
	var c= document.fun.msg.value;
	if(c=="")
	{
		alert("Enter The Message");
		document.fun.msg.focus();
		return false;
	}
}	

 function func()
{
var ty=document.fun.sel.options[document.fun.sel.selectedIndex].value;
window.location="groupmsg11.jsp?"+ty;	
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
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
		
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 20px"><%-- Welcome:<%=name %> --%></h2>						
						<div class="amar">
<div align="center" style="margin-top:123px;">
      <%
	  String value = request.getQueryString();
     // System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&:"+value);
   String pack = null;
   String namer = null;
    try
		{
		
			Mongo mongo = new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("plans");
			DBCursor cursor = collection.find();
			while(cursor.hasNext())
			{
			DBObject object1 = cursor.next();
			
			MongoClient mongoClient = new MongoClient("localhost",27017);
			DB db1 = mongoClient.getDB("churn");
			DBCollection collection2 = db1.getCollection("subscribe");
			DBCursor cursor2 = collection2.find(new BasicDBObject("packs",value));
			
			while(cursor2.hasNext())
			{
				DBObject object = cursor2.next();
	if(namer!=null)
				{
				namer = namer+(String)(object.get("name")+",");
			
				}
			else
				{                                  
				namer = (String)(object.get("name")+",");	
		
				}
			}
			
			
	if(pack!=null)
				{
				pack = pack+(String)(object1.get("pack")+",");
				}
			else
				{
				pack = (String)(object1.get("pack")+",");	
				}
			
		}
		} 
		catch(Exception e)
		{
		out.print(e);	
		}
   String packer[] = pack.split(",");
	
   %>

 <form class="login1"name="fun" action="sendmsg.jsp" method="post" onsubmit="return funn();">
    <h1 align="center"><font color="#0066FF" face="Courier New, Courier, monospace" size="+2">Message</font></h1>
    <table cellpadding="10px" cellspacing="10px"><tr><td>Choose Category:</td>
     <td><select name="sel" onChange="func()">
     <option selected="selected" value="<%=value%>"><%=value%></option>
    <%
	for(int i=0;i<packer.length;i++)
	{if(!(packer[i].equals(value))){%>
	<option><%=packer[i]%></option>
	<%}}
	%>
    </select></td></tr>
    <tr><td>To:</td><td><input type="text" name="toadd" class="span4" placeholder="To, " value="<%=namer%>"  /></td></tr>
    <tr><td>Message:</td><td><textarea name="msg" placeholder="Message"></textarea></td></tr>
     <tr><td colspan="2"><button class="btn btn-success" type="submit">Send</button>
      <button class="btn btn-danger" type="reset">Clear</button></td></tr>
      </table>
  </form>

</div>							
</div>

</div>
					<div id="content_right">
						<h2>Company News</h2>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<!-- <img src="/images/a2.png" alt="" /> -->
								<a href="view_customer.jsp">View Customer</a><br/>
								<a href="subscript.jsp">Subscription</a><br/>
								<a href="cusgroup.jsp">Customer Group</a><br/>
								<a href="upload_pack.jsp">Upload Pack</a><br />

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
				<div class="footer_left">A Big Data Clustering Algorithm for
					Mitigating the Risk of Customer Churn</div>
			</div>
		</div>
	</div>

</body>
</html>
