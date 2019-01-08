<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%
	String network = (String) session.getAttribute("network");
	String name = (String) session.getAttribute("name");
	int client_id = (Integer) session.getAttribute("client_id");
	String qs = request.getQueryString();
	String params[] = qs.split("&");
	String plan = params[0];
	String plan_id = (params[1]);
	String act = "not";
	
	String extent = null;
	String am_pm;
	java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
	Calendar cal = Calendar.getInstance();

	java.text.DateFormat tim = new java.text.SimpleDateFormat("hh:mm");
	Calendar cal2 = Calendar.getInstance();
	if (cal2.get(Calendar.AM_PM) == 0)
		am_pm = "AM";
	else
		am_pm = "PM";

	String d = df.format(cal.getTime());
	String timr = tim.format(cal2.getTime());
	String t = timr + " " + am_pm;

	if (plan.equalsIgnoreCase("no_plan")) {
		response.sendRedirect("home.jsp?" + plan);
	} else {
		int bal = 0;
		String pack = null;
		int endof = 0;
		String price = null;
		ArrayList<String> packing = new ArrayList<String>();

		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("client_reg");
			DBCursor cursor = collection.find(new BasicDBObject("client_id", client_id));				

			while (cursor.hasNext()) {
				DBObject object = cursor.next();
				bal = (Integer) object.get("balance");
				System.out.println("balance b4" + bal);
			}

			MongoClient mongoClient = new MongoClient("localhost",27017);			
			Mongo mongo1 = new Mongo("localhost", 27017);
			DB db1 = mongoClient.getDB("churn");
			DBCollection collection2 = db1.getCollection("plans");
			DBCursor cursor2 = collection2.find(new BasicDBObject("plan_id", Integer.parseInt(plan_id)));

			while (cursor2.hasNext()) {
				BasicDBObject object1 =(BasicDBObject)cursor2.next();			
				price = (String)object1.get("price");
				bal =  bal - Integer.parseInt(price);
				
				System.out.println("balance after" + bal);
				
				try {					
					Mongo mongo11 = new Mongo("localhost", 27017);
					DB db11 = mongo11.getDB("churn");
					DBCollection collection1 = db11.getCollection("subscribe");
					BasicDBObject object = new BasicDBObject("network", network)
							.append("name", name)
							.append("packs", plan)
							.append("plan_id", plan_id)
							.append("date", d)
							.append("active", act)
							.append("client_id", client_id)
							.append("endof", endof);								
					collection1.insert(object);
					
					DBCollection collection22 = db11.getCollection("client_reg");
					BasicDBObject newDocument = new BasicDBObject()
							.append("$set",new BasicDBObject().append("balance", bal));

					collection22.update(new BasicDBObject().append("client_id", client_id), newDocument);
							
					response.sendRedirect("home.jsp?"+plan+"&"+plan_id);
				} catch (Exception e) {
					out.println(e.getMessage());
				}														
			}
			response.sendRedirect("home.jsp?" + plan);			
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}
%>
</head>

<body class="rg">
</body>
</html>