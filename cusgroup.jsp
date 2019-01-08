<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.mongodb.AggregationOutput"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="java.util.List"%>
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
	<link href="style.css" rel="stylesheet" type="text/css" />
<link href="separate.css" rel="stylesheet" type="text/css" />
<link href="css/core1.css" rel="stylesheet" type="text/css" />
	
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
					<li><a href="member_home.jsp" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
			
			<%
							
						%>
			<div id="content_white">

				<div id="content">
					<div id="content_left">
						<h2 style="margin-top: 20px"><%-- Welcome:<%=name %> --%></h2>						
						<div class="amar">
						<%
	  int sno = 1;
	  String namer = null;
	  String gamer = null;
	  String refnum = null;
	  String mobile = null;
	  String packs = null;
	  String ntact = "not";
	  String act = "act";
	  String active = null;
	  String id = null;
	  int rem = 0;
	  String plan = null;
	  String planer = null;
	  String catag = null;
	  String catag1 = null;
		String network = (String)session.getAttribute("network");
	
				try
			{
				MongoClient client = new MongoClient("127.0.0.1",27017);

				DBCollection col = client.getDB("churn").getCollection("plans");

				               AggregationOutput agout = col.aggregate(
				            		   new BasicDBObject("$group",
				            			new BasicDBObject("_id","$catag")));

				Iterator<DBObject> results = agout.results().iterator();


				while(results.hasNext())
				{
				 DBObject object1 = results.next();
				 String aa = (String)object1.get("_id");
				 catag = aa.toString();
			
			MongoClient mongoClient2 = new MongoClient("localhost",27017);
			DB db1 = mongoClient2.getDB("churn");
			DBCollection collection2 = db1.getCollection("plans");
			BasicDBObject wherequery = new BasicDBObject();
			wherequery.put("catag", catag);
			DBCursor cursor2 = collection2.find(wherequery);
			while(cursor2.hasNext())
			{
			DBObject object2 = cursor2.next();
				plan = (String)object2.get("pack");
				
				 try
		{
			
				MongoClient mongoClient3 = new MongoClient("localhost",27017);
			DB db3 = mongoClient3.getDB("churn");
			DBCollection collection3 = db3.getCollection("subscribe");
			BasicDBObject wherequery3 = new BasicDBObject();
			wherequery3.put("packs", plan);
			DBCursor cursor3 = collection3.find(wherequery3);
			while(cursor3.hasNext())
			{
			DBObject object3 = cursor3.next();
				
			gamer = (String)object3.get("name");	
			
				
				MongoClient mongoClient4 = new MongoClient("localhost",27017);
				DB db4 = mongoClient4.getDB("churn");
				DBCollection collection4 = db4.getCollection("client_reg");
				BasicDBObject wherequery4 = new BasicDBObject();
				wherequery4.put("name", gamer);
				DBCursor cursor4 = collection4.find(wherequery4);
				while(cursor4.hasNext())
				{
				DBObject object4 = cursor4.next();
	if(namer!=null)
				{
				namer = namer+(String)(object4.get("name")+",");
				//System.out.println("$$$$$$$$$$$$$$$$$$rrrrrrrrrrrrr$$$$$$"+namer);
				}
			else
				{
				namer = (String)(object4.get("name")+",");	
			//	System.out.println("$$$$$$$$$$$$$$$$$$rrrrr123123rrrrrrrr$$$$$$"+namer);      /* print the statement */
				}
	
	if(mobile!=null)
				{
				mobile = mobile+(String)(object4.get("mobile")+",");
				//System.out.println("$$$$$$$$$$"+mobile);
				}
			else
				{
				mobile = (String)(object4.get("mobile")+",");	
				//System.out.println("$$$$$$$$rrrrrr$$$$$$"+mobile);
				}
				}
			}
			
		}
		catch(Exception w)
		{
			out.print(w);
		}
			
				 if(planer!=null)
				{
				planer = planer+(String)(object2.get("pack")+",");
				//System.out.println("$$$$$$$$Planer$$$$$$"+planer);
				}
			else
				{
				planer = (String)(object2.get("pack")+",");	
				//System.out.println("$$$$$$$$Planer1$$$$$$"+planer);
				}
			}
		
		if(catag1!=null)
				{
				catag1 = catag1+(String)(object1.get("_id")+",");
				System.out.println("$$$$$$$$catagory$$$$$$"+catag1);
				}
			else
				{
				catag1 = (String)(object1.get("_id")+",");	
				System.out.println("$$$$$$$$catagory$$$$$$"+catag1);
				}
			rem++;}
		}
		catch(Exception w)
		{
			out.print(w);
		}		
			
			
			
			
		if(!(rem==0))
		{
		String namer1[] = namer.split(",");
		String mobile1[] = mobile.split(",");
		String planer1[] = planer.split(",");
		String catag2[] = catag1.split(",");
		String planoff[][] = new String[catag2.length][planer1.length];
		int wew = 0;
		for(int i=0;i<catag2.length;i++)
		{
		 try
		{
			
			MongoClient mongoClient5 = new MongoClient("localhost",27017);
			DB db5 = mongoClient5.getDB("churn");
			DBCollection collection5 = db5.getCollection("plans");
			BasicDBObject wherequery5 = new BasicDBObject();
			wherequery5.put("catag", catag2[i]);
			DBCursor cursor5 = collection5.find(wherequery5);
			while(cursor5.hasNext())
			{
			DBObject object5 = cursor5.next();
				
				
				plan = (String)object5.get("pack");
				System.out.println("%%%%%%%%%%%%%%%%%%PlanRamaya%%%%%%%%%%%%%:"+plan);
				planoff[i][wew]=plan;
				wew++;
			}
		}
		catch(Exception w)
		{
			out.print(w);
		}
		wew=0;
		}  /* close for loop */
		
		
		String nameoff[][][] = new String[catag2.length][planoff.length][namer1.length];
		String mobileoff[][][] = new String[catag2.length][planoff.length][mobile1.length];
		int opp = 0;
			for(int i=0;i<catag2.length;i++)
		{
		for(int j=0;j<planoff.length;j++)
		{
			if(!(planoff[i][j]==null))
			{
		
		
		 try
		{
			
				
			MongoClient mongoClient6 = new MongoClient("localhost",27017);
			DB db6 = mongoClient6.getDB("churn");
			DBCollection collection6 = db6.getCollection("subscribe");
			BasicDBObject wherequery6 = new BasicDBObject();
			wherequery6.put("packs", planoff[i][j]);
			DBCursor cursor6 = collection6.find(wherequery6);
			while(cursor6.hasNext())
			{
 			DBObject object6 = cursor6.next();
			gamer = (String)object6.get("name");	
			System.out.println("******************Amaresh****************:"+gamer);
			
			MongoClient mongoClient7 = new MongoClient("localhost",27017);
			DB db7 = mongoClient7.getDB("churn");
			DBCollection collection7 = db7.getCollection("client_reg");
			BasicDBObject wherequery7 = new BasicDBObject();
			wherequery7.put("name", gamer);
			wherequery7.put("network", network);
			DBCursor cursor7= collection7.find(wherequery7);
			while(cursor7.hasNext())
			{
			DBObject object7 = cursor7.next();
			
					namer = (String)object7.get("name");
					System.out.println("$$$$$$$$$$NAMERS$$$$$$$$$$$$$$$:"+namer);
					mobile = (String)object7.get("mobile");
					System.out.println("%%%%%%%%%%%%%%Mobile%%%%%%%%%%%"+mobile);
				//out.print(namer);
				nameoff[i][j][opp] = namer;
				mobileoff[i][j][opp] = mobile;
				opp++;					
					}   /* second while */
					
			} /*  first while */
			
		}
		catch(Exception w)
		{
			out.print(w);
		}
			
			}  /* if close */
		}
		opp=0;
		}
	
		
		%>	
							
			
			
			<div class="pricing_table" style="margin-left:-100px; margin-top:-8px; width:500px">

<div class="pricing_table12">
		<ul>
			<li style="width:auto;"><span class="price_number"><font size="4">Catagory</font></span><br /></li>
			<%
            for(int i=0;i<catag2.length;i++)
			{%><ul style="width:auto;"><%
			out.print(catag2[i]);
				
            %>
			<ul> 
			<%
		
		for(int j=0;j<planoff.length;j++)
		{
			if(!(planoff[i][j]==null))
			{
				%><ul style="width:auto;"><%
		out.println(planoff[i][j]);
		%><br />
        <ul>

			<li style="width:auto;"><span class="price_number"><font size="4">Name</font></span><br /></li>
			<%
            for(int k=0;k<nameoff.length;k++)
		{
			if(!(nameoff[i][j][k]==null))
			{
				%><li style="width:auto;"><%
		out.println(nameoff[i][j][k]);
		%>
        </li><%	
			}
		}%>
   		</ul>
            <ul>
			<li style="width:auto;"><span class="price_number"><font size="4">Mobile Number</font></span><br /></li>
			<%
            for(int k=0;k<mobileoff.length;k++)
		{
			if(!(mobileoff[i][j][k]==null))
			{
				%><li style="width:auto;"><%
		out.println(mobileoff[i][j][k]);
		%>
        </li><%	
			}
		}%>
   		</ul>
        
        
        </ul><%	
			}
		}
		
		%>
   		</ul>
            </ul><%
			}
			%>
            
   		</ul>
      </div><%
		}
		
		else
		{%>
		<h2 align="center" style="margin-top:140px;"><font color="#009900">No Subscriptions</font></h2>
        <%
		}%>
        

</div>				
							
							
								
						
</div>




					</div>
					<div id="content_right">
					<font style="font: italic small-caps bold 25px Georgia;color:blue; ">	Company News</font>
						<div class="content_right_pad">
							<div class="news" style="margin-left: 30px;">
								<!-- <img src="/images/a2.png" alt="" /> -->
								<a href="member_home.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>View Customer</a></u><br/>
								<a href="subscript.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Subscription</a></u><br/>
								<a href="cusgroup.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Customer Group</a></u><br/>
								<a href="groupmsg.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Group Message</a></u><br/>
							    <a href="view.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Customer Complaints</a></u><br/>
							     <a href="comview.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Customer analysis</a></u><br/>
								<a href="upload_pack.jsp"><h4 style="font:italic small-caps bold 20px Georgia;font-size:18px;color:maroon;"><u>Upload Pack</a></u><br />
<img src="images/bb.jpg" alt="" />

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
