package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		Session s = FactoryProvider.getFactory().openSession();
		
		Transaction txn = s.beginTransaction();
		Todo todo = (Todo)s.get(Todo.class, noteId);
		todo.setTitle(title);
		todo.setContent(content);
		todo.setAddedDate(new Date());
		
		txn.commit();
		s.close();
		response.sendRedirect("all_notes.jsp");
		
	}

}
