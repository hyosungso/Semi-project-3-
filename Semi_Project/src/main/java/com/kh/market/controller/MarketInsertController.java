package com.kh.market.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Category;
import com.kh.market.MarketFileNamePolicy;
import com.kh.market.model.service.MarketService;
import com.kh.market.model.vo.Item;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MarketInsertController
 */
@WebServlet("/insert.mk")
public class MarketInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Category> cList =new MarketService().selectCategory();
		
		Category[] category = cList.toArray(new Category[cList.size()]);
		
		
		request.setAttribute("cList", category);
		request.getRequestDispatcher("views/market/marketInsertView.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize=10*1024*1024;
			String savePath= request.getSession()
									.getServletContext()
									.getRealPath("resources/marketing/");
			MultipartRequest multiRequest =new MultipartRequest(request,
																savePath,
																maxSize,
																"UTF-8",
																new MarketFileNamePolicy());
			
			String productName=multiRequest.getParameter("productName");
			int category=Integer.parseInt(multiRequest.getParameter("category"));
			int price=Integer.parseInt(multiRequest.getParameter("price"));
			String itemDetail=multiRequest.getParameter("itemDetail");
			int salseVol =0;
			int fileCount = Integer.parseInt(multiRequest.getParameter("count"));
			
			Item i= new Item(
					);
			
			
//			int result=new MarketService().insertItem(i);
			
			
			
		}
		
		doGet(request, response);
	}

}