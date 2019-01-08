<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<%
		String network = (String) session.getAttribute("network");
		String extent = null;
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
		String timr = tim.format(cal2.getTime());
		String t = timr + " " + am_pm;
		out.print(t);
		session.setAttribute("sysdate", d);
		session.setAttribute("systime", t);

		String name = (String) session.getAttribute("name");
		int endof = 0;
		String check = request.getQueryString();
		String chk[] = check.split("/");
		int bal = Integer.parseInt(chk[1]);
		String plan = chk[0];
		if (plan.equals("sms1")) {
			endof = 3;
			bal = bal - 15;
		}
		if (plan.equals("sms2")) {
			endof = 5;
			bal = bal - 25;
		}
		if (plan.equals("data")) {
			endof = 3;
			bal = bal - 20;
		}
		if (plan.equals("rtcut")) {
			endof = 10;
			bal = bal - 33;
		}
		int ftime = 1;
		String act = "not";
		int refnum = (int) (10001 + Math.random() * 10000);
		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("client_reg");
			BasicDBObject newDocument = new BasicDBObject().append("$set",
					new BasicDBObject().append("balance", bal).append("ftime", ftime));
			collection.update(new BasicDBObject().append("name", name), newDocument);

			try {
				Mongo mongo1 = new Mongo("localhost", 27017);
				DB db1 = mongo1.getDB("churn");
				DBCollection collection1 = db1.getCollection("subscribe");
				BasicDBObject object = new BasicDBObject("network", network).append("name", name)
						.append("packs", plan).append("date", d).append("active", act).append("endof", endof)
						.append("refnum", refnum);
				collection1.insert(object);
				response.sendRedirect("home.jsp?" + plan);
			} catch (Exception e) {
				out.println(e.getMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>