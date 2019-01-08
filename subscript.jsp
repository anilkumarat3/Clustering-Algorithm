<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<link href="core.css" rel="stylesheet" type="text/css" media="screen" />
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
					<li><a href="member_home.jsp" class="active">Home</a></li>
					<!-- <li><a href="networkerlogin.jsp">Login</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
				<div class="clear"></div>
			</div>
			
			<%							
							String name1 = (String) session.getAttribute("forename");
							String network = (String)session.getAttribute("network");
						%>
			<div id="content_white">

				<div id="content1">
					<div id="content_left">
						<font style="font: italic small-caps bold 25px Georgia;color:blue;">Welcome:<%=name1 %></font>						
						<div class="amar">
			
			<%
	  int sno = 1;
	  String namer = null;
	  //String name=null;
	  String gamer = null;
	  String refnum = null;
	  String mobile = null;
	  String packs = null;
	  String ntact = "not";
	  String act = "act";
	  String active = null;
	  String id = null;
	  int rem = 0;
	  try
		{
		
			
			Mongo mongo = new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			DBCollection coll = db.getCollection("subscribe");
			 List<BasicDBObject> criteria1 = new ArrayList<BasicDBObject>();
			criteria1.add(new BasicDBObject("network", new BasicDBObject("$eq", network)));
			criteria1.add(new BasicDBObject("active", new BasicDBObject("$eq", ntact)));
			DBCursor cursor = coll.find(new BasicDBObject("$and", criteria1));
			//DBCursor cursor = coll.find(new BasicDBObject("active",ntact));
			while(cursor.hasNext())
			{
			DBObject object = cursor.next();
			gamer = (String)object.get("name");	
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%:"+gamer);
			
			 Mongo mongo2 = new Mongo("localhost",27017);
			 DB db1 = mongo2.getDB("churn");
			 DBCollection collection1 = db1.getCollection("client_reg");
			 DBCursor cursor2 = collection1.find(new BasicDBObject("name",gamer));
			 while(cursor2.hasNext())
			 {
				 DBObject object1 = cursor2.next();
				
	if(namer!=null)
				{
				//namer = namer+(String)(object1.get("name")+",");
				namer+=(String)(object1.get("name")+",");
				System.out.println("&&&&&&&&&&&&&&&&&&&&"+namer);
				}
			else
				{
				namer = (String)(object1.get("name")+",");	
				}
	
	if(mobile!=null)
				{
				/* mobile = mobile+(String)(object1.get("mobile")+","); */
				mobile+= (String)(object1.get("mobile")+",");
				}
			else
				{
				mobile = (String)(object1.get("mobile")+",");	
				}
				}
				
				
				if(refnum!=null)
				{
				/* refnum = refnum+(String)(object.get("refnum")+","); */
				refnum+= (String)(object.get("refnum")+",");
				}
			else
				{
				refnum = (String)(object.get("refnum")+",");	
				}
				
				if(id!=null)
				{
					
				/* id = id+(object.get("_id").toString()+","); */
					id+=(object.get("_id").toString()+",");
				}
			else
				{
				id = (object.get("_id").toString()+",");	
				}
				
				if(packs!=null)
				{
				/* packs = packs+(String)(object.get("packs")+","); */
				packs+=(String)(object.get("packs")+",");
				}
			else
				{
				packs = (object.get("packs")+",");	
				}
			rem++;
			}
			
		}
		catch(Exception w)
		{
			out.print(w);
		}
		if(!(rem==0))
		{
		String namer1[] = namer.split(",");
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&:"+namer);
		String refnum1[] = refnum.split(",");
		String mobile1[] = mobile.split(",");
		String packs1[] = packs.split(",");
		String id1[] = id.split(",");
		String packs2[] = new String[namer1.length];
		
		for(int i=0;i<namer1.length;i++)
		{
		 try
		{
			/* Class.forName("com.mysql.jdbc.Driver");
			Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/rekey", "root", "admin");
			PreparedStatement ps4=conn4.prepareStatement("select * from subscribe where active = '"+act+"' and name = '"+namer1[i]+"'");
			ResultSet rs4=ps4.executeQuery();
			while(rs4.next())
			{ */
				
				Mongo mongo10 = new Mongo("localhost",27017);
			DB db10 = mongo10.getDB("churn");
			DBCollection collection10 = db10.getCollection("subscribe");
			List<BasicDBObject> criteria = new ArrayList<BasicDBObject>();
			criteria.add(new BasicDBObject("active", new BasicDBObject("$eq", act)));
			criteria.add(new BasicDBObject("name", new BasicDBObject("$eq", namer1[i])));
			criteria.add(new BasicDBObject("network", new BasicDBObject("$eq", network)));
			DBCursor cursor10 = collection10.find(new BasicDBObject("$and", criteria)); 
			while(cursor10.hasNext())
			{
			DBObject object10 = cursor10.next();
			
					if(active!=null)
				{
				active = active+(String)(object10.get("packs")+",");
				}
			else
				{
				active = (String)(object10.get("packs")+",");	
				}	
				packs2[i]=active;
			}
			
		}
		catch(Exception w)
		{
		out.print(w);	
		}
		active=null;
		}
		//out.println(packs2[0]);
		//out.println(packs2[1]);%>
		<img src="images/bigg.jpg" alt="" style="margin-left:480px;" />	
		<div class="pricing_table" style="margin-left:-130px;margin-top:-170px;width:710px;">
		
<div class="pricing_table12">

		<ul>
			<li style="width:60px;"><span class="price_number"><font size="2">Sl.No</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:60px;"><%
			out.print(i+1);	
            %></li><%
			}%>
		</ul>
		</div>
<div class="pricing_table12">
		<ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Name</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:auto;"><%
			out.print(namer1[i]);	
            %></li><%
			}%>
   		</ul>
      </div>
        <ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Mobile Number</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:auto;"><%
			out.print(mobile1[i]);	
            %></li><%
			}%>
   		</ul>
<div class="pricing_table12">
		<ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Pack</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:auto;"><%
			out.print(packs1[i]);	
            %></li><%
			}%>
		</ul>
	</div>
<div class="pricing_table12">
		<ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Activated Pack</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:auto;"><%
			out.print(packs2[i]);	
            %></li><%
			}%>
   		</ul>
        </div>
<div class="pricing_table12">
        <ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Ref No.</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
			{%><li style="width:auto;"><%
			out.print(refnum1[i]);	
            %></li><%
			}%>
   		</ul>
	</div>	
<div class="pricing_table12">
        <ul>
			<li style="width:auto;"><span class="price_number"><font size="2">Response</font></span><br /></li>
			<%
            for(int i=0;i<mobile1.length;i++)
            	//for (String currency : id1)
			{%><li style="width:auto;" id="pricing_table21">
            <form action="activate.jsp?<%=id1[i]%>/act/<%=packs1[i]%>/<%=namer1[i]%>" method="post" >
            	<input style="margin-top:-12px;" type="submit" name="sub" class="active" value="Activate" />
            	<a href="activate.jsp?<%=id1[i]%>/rej/<%=packs1[i]%>/<%=namer1[i]%>">
            		<button type="button" class="reject">Reject</button>
            	</a>
            </form>
            </li><%
			}%>
   		</ul>
	</div>
</div><%
		}
		
	 else
		{%>
		<h2 align="center" style="margin-top:140px;"><font color="#009900">No Subscriptions</font></h2>
        <%	
		}%>
								
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
				<div class="footer_left"> <marquee> <font size="+1"> A Big Data Clustering Algorithm for
					Mitigating the Risk of Customer Churn</div>
			</div>
		</div>
	</div>

</body>
</html>
