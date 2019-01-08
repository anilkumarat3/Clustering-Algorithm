<%@page import="com.mongodb.AggregationOutput"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("churn");
		DBCollection myColl = db.getCollection("client_reg");

		DBObject groupFields = new BasicDBObject("_id", "$network");

		groupFields.put("count", new BasicDBObject("$sum", 1));
		DBObject group = new BasicDBObject("$group", groupFields);

		DBObject sortFields = new BasicDBObject("count", -1);
		DBObject sort = new BasicDBObject("$sort", sortFields);

		AggregationOutput output = myColl.aggregate(group, sort);

		System.out.println(output.getCommandResult());
	%>
</body>
</html>