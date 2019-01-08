<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%String emailid = request.getParameter("name");
  String name = request.getParameter("aa");
	String a = "deactivated";
	try {
		Mongo mongo = new Mongo("127.0.0.1", 27017);
		DB MongoUtils = mongo.getDB("churn");
		DBCollection lotusCollection = MongoUtils.getCollection("subscribe");

		BasicDBObject searchObject = new BasicDBObject();
		searchObject.put("name", name);
		
		DBObject modifiedObject = new BasicDBObject();
		modifiedObject.put("$set", new BasicDBObject().append("date", a));

		lotusCollection.update(searchObject, modifiedObject, false, true);

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%
	String b = "success";
	try {
		Mongo mongo = new Mongo("127.0.0.1", 27017);
		DB MongoUtils = mongo.getDB("churn");
		DBCollection lotusCollection = MongoUtils.getCollection("complaints");

		BasicDBObject searchObject = new BasicDBObject();
		searchObject.put("Name", name);

		DBObject modifiedObject = new BasicDBObject();
		modifiedObject.put("$set", new BasicDBObject().append("status", b));

		lotusCollection.update(searchObject, modifiedObject, false, true);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	try {
		Mongo mongo = new Mongo("127.0.0.1", 27017);
		DB MongoUtils = mongo.getDB("churn");
		DBCollection lotusCollection = MongoUtils.getCollection("complaints");

		BasicDBObject searchObject = new BasicDBObject();
		searchObject.put("Name", name);

		DBObject modifiedObject = new BasicDBObject();
		modifiedObject.put("$set", new BasicDBObject().append("status", b));

		lotusCollection.update(searchObject, modifiedObject, false, true);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%
	try {
		Mongo mongo = new Mongo("127.0.0.1", 27017);
		DB MongoUtils = mongo.getDB("churn");
		DBCollection lotusCollection = MongoUtils.getCollection("client_reg");
		
		BasicDBObject document = new BasicDBObject();
		document.put("name", name);				
		lotusCollection.remove(document);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert("Client account has been deactivated");
	window.location = "view.jsp";
</script>



