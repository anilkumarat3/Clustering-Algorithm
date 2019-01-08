<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
         Cufon.replace ('h1')('h2')('h3')('#menu a', {hover: true});
        </script>
    </head>
    <body>   
		<div id="wrap">
					
			<div id="logo">
				<!-- <h1><a href="#"><b>A Big Data Clustering Algorithm 
for Mitigating <center>the Risk of Customer Churn</center></b></a></h1>		 -->	
 <img src="images/h1 (2).gif" alt="" />
<center> <img src="images/h2.gif" alt="" /> </center>
			</div>
		  <div id="content_bg">
				<div id="header">
				
				  <div id="wrapper">
        <div id="slider-wrapper">        
            <div id="slider" class="nivoSlider">
                <img src="images/header.jpg" alt="" />
                <img src="images/header2.jpg" alt=""/>
                <img src="images/header3.jpg" alt="" />
                 <img src="images/header4.jpg" alt="" />
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
	<style>
	#cll
	{
	background-color: teal;
	width:400px;
	height:500px;
	border:2px solid red;
	
	}			
				
				
	</style>
				</div>				
				<div id="menu">
					<ul>
						<li><a href="index.html" class="active">Home</a></li>
						<li><a href="client_login.jsp">Client</a></li>
						<li><a href="networkerlogin.jsp">Network</a></li>
						<li><a href="admin.jsp">Admin</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div id="content_white2">
					
					<div id="content">
                <div id="content_left">
    <%              
     String name = (String) session.getAttribute("name");	
    System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+name);
   String email = (String) session.getAttribute("email");
   System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+email);
   %>                                 
           <%--        
                 <%


  
try
     {
	Mongo mongo = new Mongo("localhost",27017);
	DB db = mongo.getDB("churn");
	DBCollection collection = db.getCollection("client_reg");
	BasicDBObject wheresearch = new BasicDBObject();
	wheresearch.put("name", name);
	wheresearch.put("email", email);
	DBCursor cursor = collection.find(wheresearch);
	while(cursor.hasNext())
	{
		DBObject object = cursor.next();

 	
%>   --%>
<div id="cll">
<form action="maildb.jsp" name="f" method="get"  onsubmit= "return validation()">
<center><table></center>

<br></br>
<tr>
<th colspan="2"> <font style="font: italic small-caps bold 25px Georgia;color:blue; "> RESPONSE MAIL  </font> </th> </tr>
<br></br>
<br></br>


<tr>
<td> <font color="purple" size="4"> <strong>  NAME: </strong> </font> </td>
<td> <input class="tex1" type ="text" name ="name" value=<%=name%>> </td>
</tr>
<br></br>
<br></br>
<tr>
<td> <font color="purple" size="4">  <strong> EMAIL: </font> </strong> </td>
<td> <input class="tex1" type = "text" name = "email" value=<%=email%>> </td>
</tr>


<tr>
<td> <font color="purple" size="4"> <strong> RESPONSE: </font></strong> </td>
<td> <textarea rows="4" cols="25" name="letter"></textarea> </td>
</tr>

<tr>
<td colspan ="2" align= "center"> <input type = "submit"  class="btn" value= "Send" > <input type="reset"  class="btn" value="cancel"></td>
</tr>
</table>
</form>
</div>
  <%-- <%
     }
     }
catch(Exception e)
{
	e.printStackTrace();
}
%>
  --%>
 
    </body>
</html>
