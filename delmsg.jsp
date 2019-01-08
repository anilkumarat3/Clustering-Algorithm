<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%

String id = request.getParameter("id1");
System.out.println("$$$$$$$$$$$$$$$$$$$$$$ID:"+id);
try
		{
			
			Mongo mongo =new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("message");
			BasicDBObject wherequery = new BasicDBObject();
			wherequery.put("_id", id);
			collection.remove(wherequery);
			
			
			response.sendRedirect("message.jsp?11");
		}
		
catch(Exception e)
{
out.print(e);	
}
%>
</body>
</html>