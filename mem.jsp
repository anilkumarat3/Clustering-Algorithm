<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
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
String aa = request.getParameter("membership");
String bb = request.getParameter("pass");
try
{
	Mongo mongo = new Mongo("localhost",27017);
	DB db = mongo.getDB("churn");
	DBCollection collection = db.getCollection("network");
	DBCursor cursor = collection.find(new BasicDBObject("membershipno",aa).append("password", bb));
	if(cursor.hasNext())
	{
		DBObject object = cursor.next();
		String forename = (String)object.get("forename");
		//HttpSession session = request.getSession();
		session.setAttribute("forename", forename);
		String network = (String)object.get("network");
		response.sendRedirect("member_home.jsp");
	}
	else
	{
		out.println("your membership login id and password are incorrect");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>