package com.churn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

/**
 * Servlet implementation class upload_pack
 */
public class upload_pack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_pack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		try
		{
			HttpSession session2 = request.getSession();
			String network = (String)session2.getAttribute("network");
			String a = request.getParameter("category");
			String b = request.getParameter("keyword");
			String c = request.getParameter("name");
			String d = request.getParameter("details");
			String e = request.getParameter("price");
			//int e1 = Integer.parseInt("e");
			String f = request.getParameter("validity");
			//int f1 = Integer.parseInt("f");
			
			Mongo mongo = new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("plans");
			int id = (int) (Math.random()*1000);
			BasicDBObject object = new BasicDBObject("network",network).append("catag", a).append("pack", b).append("name", c).append("details", d).append("price", e).append("valid", f).append("plan_id", id);
			collection.insert(object);
			response.sendRedirect("upload_pack.jsp");
			
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
		
	}

}
