package com.kh.memorials.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.memorials.model.service.MemorialsService;
import com.kh.memorials.model.vo.Memorials;

/**
 * Servlet implementation class MemberIndividualRecordControlloer
 */
@WebServlet("/MemorialsMyPage.me")
public class MemorialsMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemorialsMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		Memorials memo=new MemorialsService().selectMemorials(id);
		
		request.setAttribute("id", id);
		request.setAttribute("memorials", memo);
		
		request.getRequestDispatcher("views/memorials/memorialsMyPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	
		
		
		
		
		
	}

}
