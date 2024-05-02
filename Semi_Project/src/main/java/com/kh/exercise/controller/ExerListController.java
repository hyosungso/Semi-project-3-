package com.kh.exercise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.exercise.model.service.ExerService;
import com.kh.exercise.model.vo.Exercise;

/**
 * Servlet implementation class ExerListController
 */
@WebServlet("/list.ex")
public class ExerListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ExerListController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int pageLimit;
		int exerLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount=new ExerService().listCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		exerLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/exerLimit);
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		endPage = startPage+pageLimit-1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,exerLimit,maxPage,startPage,endPage);
		ArrayList<Exercise> elist=new ExerService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("elist", elist);
		request.getRequestDispatcher("views/exercise/exerListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
