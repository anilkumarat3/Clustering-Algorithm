<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.net.UnknownHostException,java.util.List,java.util.Set,com.mongodb.*,com.mongodb.MongoClient,com.mongodb.gridfs.GridFS,com.mongodb.gridfs.GridFSDBFile,com.mongodb.gridfs.*"%>
<%@page import="java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.MongoClient"%>
<%
	String a = request.getParameter("name");
	String b = request.getParameter("nettype");
	String b1 = request.getParameter("email");
	String c = request.getParameter("net");
	String d = request.getParameter("sms");
	String e = request.getParameter("data");
	String f = request.getParameter("rev");
	String g = "pending";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer churn</title>
</head>
<body>
	<%
		DBCollection coll = null, collection=null;
	int client_id = (Integer) session.getAttribute("client_id");
	int complaint_id = 0;
	try {
		MongoClient mongoClient1 = new MongoClient("localhost", 27017);
		DB db11 = mongoClient1.getDB("churn");
		collection = db11.getCollection("complaints");		
		DBCursor dbcur = collection.find(new BasicDBObject("client_id", client_id));
	
			while(dbcur.hasNext()){
				DBObject object = dbcur.next();
				complaint_id = (Integer)object.get("complaint_id");			 
			}
		}
		catch (Exception e11){
			e11.printStackTrace();
		}
	%>
	<%
		
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("churn");
			coll = db.getCollection("complaints");
			BasicDBObject doc = new BasicDBObject("Name", a)
					.append("NetworkType", b)
					.append("email", b1)
					.append("Network", c)
					.append("Smspack", d)
					.append("Data", e)
					.append("Yourreview", f)
					.append("status", "pending")
					.append("complaint_id", complaint_id)
					.append("client_id", client_id);												
			
			//coll.insert(doc);
			coll.update(new BasicDBObject().append("client_id", client_id), doc);						
		} catch (Exception e1){
			e1.printStackTrace();
		}
		response.sendRedirect("success.jsp");
	%>
</html>