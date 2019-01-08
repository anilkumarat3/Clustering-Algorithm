
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	int y = (int) (Math.random() * 100000);
	String messageText = Integer.toString(y);
	String email = request.getParameter("aa");
	String status = "Activated";
	try {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		DB db = mongoClient.getDB("churn");
		DBCollection collection = db.getCollection("network");
		BasicDBObject newDocument = new BasicDBObject().append("$set",
				new BasicDBObject().append("status", status).append("membershipno", messageText));

		collection.update(new BasicDBObject().append("email", email), newDocument);
%>
<script type="text/javascript">
	alert("Network subscriber account activated");
	window.location = 'admin_home.jsp';
</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
