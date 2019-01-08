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
String email = request.getParameter("email");
session.setAttribute("email1", email);
String pass	=	request.getParameter("pass");

try
{
	Mongo mongoClient = new Mongo("localhost",27017);
	DB db = mongoClient.getDB("churn");
	DBCollection collection = db.getCollection("network");
	DBCursor cursor = collection.find(new BasicDBObject("email",email).append("password",pass));
	if(cursor.hasNext())
	{
		DBObject object2 = cursor.next();
		String name = (String)object2.get("forename");
		//HttpSession session = request.getSession();
		session.setAttribute("name", name);
		System.out.println("%%%%%%%%%%%%%%%%"+name);
		String network = (String)object2.get("network");
		session.setAttribute("network", network);
	
		response.sendRedirect("network_home.jsp");
		
	}
	else
	{
	
		  out.println("Sorry Email id or Password Error!");  
	       
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}



%>

</body>
</html>