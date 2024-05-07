package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/search.bo")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword=request.getParameter("search");
		String category=request.getParameter("searchCategory");
		
		ArrayList<Board> bList=new ArrayList<>();
		BoardService bs=new BoardService();
		/*switch(category) {
		case "title":
			bList=bs.searchBoardByTitle(keyword);
			break;
		case "content":
			bList=bs.searchBoardByContent(keyword);
			break;
		case "writer":
			bList=bs.searchBoardByWriter(keyword);
			break;
		}*/
		bList=bs.searchBoard(keyword,category);
		request.setAttribute("bList", bList);
		request.setAttribute("keyword", keyword);
		

		
		request.getRequestDispatcher("/views/board/boardSearchView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
