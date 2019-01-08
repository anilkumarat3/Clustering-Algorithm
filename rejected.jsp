<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Churn</title>
</head>
<body>
<%
String email1 = request.getParameter("bb");

try
{	
	String status = "Rejected";
	Mongo mongo = new Mongo("localhost",27017);
	DB db = mongo.getDB("churn");
	DBCollection collection = db.getCollection("network");
	BasicDBObject newDocument = new BasicDBObject().append("$set",   
			 new BasicDBObject().append("status",status ));  
			   
			collection.update(new BasicDBObject().append("email", email1), newDocument);  
			%>
			<script type="text/javascript">
			alert("Your Network subscription request rejected");
			window.location = 'admin_home.jsp';
			</script>
			<%
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>
</html>