<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<%
		String am_pm;
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();

		java.text.DateFormat tim = new java.text.SimpleDateFormat("hh:mm");
		Calendar cal2 = Calendar.getInstance();
		if (cal2.get(Calendar.AM_PM) == 0)
			am_pm = "AM";
		else
			am_pm = "PM";

		String d = df.format(cal.getTime());
		System.out.println("Date" + d);

		String timr = tim.format(cal2.getTime());
		String t = timr + " " + am_pm;
		out.print(t);
		session.setAttribute("sysdate", d);
		session.setAttribute("systime", t);

		String active = request.getQueryString();
		String active1[] = active.split("/");
		String id = active1[0];
		System.out.println("&&&&&&&&&&&&&&id:" + id);
		String actype = active1[1];
		System.out.println("%%%%%%%%%%%Actype:" + actype);
		String pack = active1[2];
		String name = active1[3];
		System.out.println("&&&&&&&&&&&&&&&&&Name:" + name);
		if (actype.equals("act"))
			active = "act";

		{

			try {
				Mongo mongo1 = new Mongo("localhost", 27017);
				DB db1 = mongo1.getDB("churn");
				DBCollection collection1 = db1.getCollection("subscribe");
				BasicDBObject newDocument = new BasicDBObject().append("$set",new BasicDBObject().append("date", d).append("active", active));
				collection1.update(new BasicDBObject().append("name", name).append("packs", pack), newDocument);
				response.sendRedirect("subscript.jsp");

			}

			catch (Exception e) {
				out.print(e);
			}
		}

		if (actype.equals("rej")) {
			int bal = 0;
			int price = 0;
			try {

				Mongo mongo2 = new Mongo("localhost", 27017);
				DB db2 = mongo2.getDB("churn");
				DBCollection collection2 = db2.getCollection("plans");
				BasicDBObject obj1 = new BasicDBObject();
				obj1.put("pack", pack);
				DBCursor cursor2 = collection2.find(obj1);

				Mongo mongo3 = new Mongo("localhost", 27017);
				DB db3 = mongo3.getDB("churn");
				DBCollection collection3 = db3.getCollection("subscribe");
				BasicDBObject obj2 = new BasicDBObject();
				obj2.put("_id", id);
				collection3.remove(obj2);

				while (cursor2.hasNext()) {
					DBObject object2 = cursor2.next();
					price = (Integer) object2.get("price");
				}
			}

			catch (Exception e) {
				out.print(e);
			}
			try {

				Mongo mongo4 = new Mongo("localhost", 27017);
				DB db4 = mongo4.getDB("churn");
				DBCollection collection4 = db4.getCollection("client_reg");
				BasicDBObject obj4 = new BasicDBObject();
				obj4.put("name", name);
				DBCursor cursor4 = collection4.find(obj4);

				if (cursor4.hasNext()) {
					DBObject object4 = cursor4.next();
					bal = (Integer) object4.get("balance");
					bal = price + bal;
					try {

						Mongo mongo5 = new Mongo("localhost", 27017);
						DB db5 = mongo5.getDB("churn");
						DBCollection collection5 = db5.getCollection("client_reg");
						BasicDBObject newDocument1 = new BasicDBObject().append("$set",
								new BasicDBObject().append("balance", bal));

						collection5.update(new BasicDBObject().append("name", name), newDocument1);
						response.sendRedirect("subscript.jsp");

					} catch (Exception e) {
						out.println(e.getMessage());
					}
				}
			} catch (Exception e) {
				out.println(e.getMessage());
			}

		}
	%>
</body>
</html>