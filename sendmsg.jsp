<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%

String pack = request.getParameter("sel");
String to = request.getParameter("toadd");
String msg = request.getParameter("msg");
String toadd[] = to.split(",");
String encptmsg = null;
int keyed = 10000 + (int)(Math.random()*99999);
%>
<%!
private static String algorithm = "DESede";
        private static Key key = null;
        private static Cipher cipher = null;
 private static byte[] encrypt(String input)throws Exception {
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] inputBytes = input.getBytes();
            return cipher.doFinal(inputBytes);
        }
%>

<%
StringBuffer buffer=new StringBuffer();
 key = KeyGenerator.getInstance(algorithm).generateKey();
            cipher = Cipher.getInstance(algorithm);
            String input = msg;
            System.out.println("Entered: " + input);
            byte[] encryptionBytes = encrypt(input);
            encptmsg = new String(encryptionBytes);

for(int i=0;i<toadd.length;i++)
{
try
		{
			
			MongoClient mongoClient = new MongoClient("localhost",27017);
			DB db = mongoClient.getDB("churn");
			DBCollection collection = db.getCollection("message");
			BasicDBObject object = new BasicDBObject("pack",pack).append("name", toadd[i]).append("msg", msg).append("encrypt", encptmsg).append("enkey", keyed);
			collection.insert(object);
			response.sendRedirect("groupmsg.jsp?suc");
		}
		catch(Exception w)
		{
			out.print(w);
		}
}
%>
</body>
</html>