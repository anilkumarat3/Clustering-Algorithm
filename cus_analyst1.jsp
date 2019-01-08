<%@page import="org.w3c.dom.Document"%>
<%@page import="org.bson.BSON"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mongodb.BasicDBObjectBuilder"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.AggregationOutput"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBCollection"%>
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
String network = (String)session.getAttribute("network");
String fromDate = request.getParameter("from_date");
String toDate = request.getParameter("to_date");

MongoClient mongoClient = new MongoClient("localhost",27017);
DB db = mongoClient.getDB("churn");
DBCollection collection = db.getCollection("client_reg");

BasicDBObject query = new BasicDBObject();
query.put("date", new BasicDBObject("$gte", fromDate));
query.put("date", new BasicDBObject("$lte", toDate));
collection.find(query).sort(new BasicDBObject("date", -1));

DBCursor cursor = collection.find(query);
try
{
	
	while(cursor.hasNext())
	{
		DBObject object1 = cursor.next();
		String name = (String)(object1.get("name"));
		String network1 = (String)(object1.get("network"));
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%date%:"+network1);
		String email = (String)(object1.get("email"));
	
		
		MongoClient client = new MongoClient("localhost",27017);

	    DB database = client.getDB("churn");
	    DBCollection collection1 = database.getCollection("client_reg");

	   
	    AggregationOutput output =
	            collection.aggregate(
	                    new BasicDBObject("$group",
	                            new BasicDBObject("_id", "$network1")
	                                    .append("count", new BasicDBObject("$sum", 1)))
	                    ,
	                 
	                    new BasicDBObject("$sort", new BasicDBObject("_id", 1))
	            );

	    int answer = 0;
	    for (DBObject doc : output.results()) {
	        answer += (Double) doc.get("_id");
	    }

	    System.out.println("THE ANSWER IS: " + answer);
	}
	  
	  
		
	
}
finally
{
cursor.close();	
}



%>
</body>
</html>