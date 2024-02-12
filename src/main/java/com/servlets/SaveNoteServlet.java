package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//title,content fetching 
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Todo todo = new Todo(title, content,new Date());
			//System.out.println(todo.getTitle()+" "+todo.getContent());
			response.setContentType("text/html");
			//hibernate save
			
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
	        Transaction txn = session.beginTransaction();
	        
	        session.save(todo);
	        
			txn.commit();
			session.close();
			PrintWriter out= response.getWriter();
			out.println("<h1 style ='text-align:center'>Note is Added successfully </h1>");
			out.println("<h1 style ='text-align:center'><a href = 'all_notes.jsp'>View all added notes</a> </h1>");
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
