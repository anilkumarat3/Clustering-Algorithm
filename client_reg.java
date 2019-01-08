package com.churn;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

/**
 * Servlet implementation class client_reg
 */
public class client_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public client_reg() {
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
		doGet(request, response);
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String network = request.getParameter("network");
		String mno = request.getParameter("mno");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String network_type = request.getParameter("network_type");
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		String date = sdf.format(new Date()); 
		int ftime=0;
		int balance=150;
		int c_id = (int) (Math.random()*10000);
		try
		{
			Mongo mongo = new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			
			DBCollection collection = db.getCollection("client_reg");
			BasicDBObject object = new BasicDBObject("name",name)
					.append("client_id", c_id)
					.append("pass", pass)
					.append("network", network)
					.append("mobile", mno)
					.append("email", email)
					.append("gender", gender)
					.append("date", date)
					.append("network_type", network_type)
					.append("balance", balance)
					.append("ftime", ftime);
			collection.insert(object);
						
			int complaint_id = (int) (Math.random()*500);
			DBCollection complaints_coll = db.getCollection("complaints");
			BasicDBObject comp_obj = new BasicDBObject("Name",name)
					.append("NetworkType", network)
					.append("email", email)
					.append("Network", "Good")
					.append("Smspack", "Good")
					.append("Data", "Good")
					.append("Yourreview", "Good")
					.append("status", "pending")
					.append("complaint_id", complaint_id)
					.append("client_id", c_id);
			
			complaints_coll.insert(comp_obj);
			
			//request.setAttribute("client_id", c_id);
			response.sendRedirect("client_login.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
