<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>User Login Validation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%
	String a = request.getParameter("name");
	String b = request.getParameter("pass");
	String unme = null, pass = null;
	String name = null;
	String gender = null;
	try {

		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("churn");
		DBCollection collection = db.getCollection("client_reg");
		DBCursor cursor = collection.find(new BasicDBObject("name", a).append("pass", b));
		if (cursor.hasNext()) {
			DBObject object = cursor.next();

			name = (String) object.get("name");
			session.setAttribute("name", name);

			gender = (String) object.get("gender");
			session.setAttribute("gender", gender);

			String network = (String) object.get("network");
			session.setAttribute("network", network);

			String email = (String) object.get("email");
			session.setAttribute("email", email);
			
			int client_id = (Integer) object.get("client_id");
			session.setAttribute("client_id", client_id);

			int ftime = 0;

			try {
				Mongo mongo2 = new Mongo("localhost", 27017);
				DB db1 = mongo2.getDB("churn");
				DBCollection collection2 = db1.getCollection("client_reg");
				BasicDBObject object2 = new BasicDBObject("name", name);
				DBCursor cursor2 = collection2.find(object2);
				while (cursor2.hasNext()) {
					DBObject object1 = cursor.next();

					ftime = (Integer) object1.get("ftime");
				}
			} catch (Exception e1) {
				out.println(e1.getMessage());
			}
			if (ftime == 1) {
				response.sendRedirect("home.jsp?12");
			} else {
				response.sendRedirect("advert.jsp?12");
			}
			/* } */
		} else {
			out.println("Invalid credentials !!!!");
			/* response.sendRedirect("logfail.jsp"); */
		}
	} catch (Exception e1) {
		out.println(e1.getMessage());
	}
%>
</head>
<body>
</body>
</html>