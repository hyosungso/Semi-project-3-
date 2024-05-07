package com.kh.market.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Category;
import com.kh.common.MyFileRenamePolicy;
import com.kh.market.model.service.MarketService;
import com.kh.market.model.vo.Item;
import com.kh.market.model.vo.ItemAttachment;
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
									.getRealPath("/resources/marketImg/");
			MultipartRequest multiRequest =new MultipartRequest(request,
																savePath,
																maxSize,
																"UTF-8",
																new MyFileRenamePolicy());
			int itemCode=new MarketService().newItemCode();
			String productName=multiRequest.getParameter("productName");
			int category=Integer.parseInt(multiRequest.getParameter("category"));
			int price=Integer.parseInt(multiRequest.getParameter("price"));
			String itemDetail=multiRequest.getParameter("itemDetail");
		
			
			int fileCount = Integer.parseInt(multiRequest.getParameter("count"))-1;
			
			Item i= new Item();
			i.setItemCode(itemCode);
			i.setItemCode(new MarketService().newItemCode());
			i.setItemName(productName);
			i.setCategory(category);
			i.setPrice(price);
			i.setItemDetail(itemDetail);
			
			
			ArrayList<ItemAttachment> itList=new ArrayList<>();
			
			for(int j=1; j<=fileCount; j++) {
				String key="itemImg"+j;
				if(multiRequest.getOriginalFileName(key)!=null) {
					ItemAttachment it=new ItemAttachment();
					it.setOriginName(multiRequest.getOriginalFileName(key));
					it.setChangeName(multiRequest.getFilesystemName(key));
					it.setFilePath("/resources/marketImg/");
					
					
					if(j==1) {
						it.setFileLev(1);
					}else {
						it.setFileLev(2);
					}
					
					itList.add(it);
					
				}
			}
			
			
			int result=new MarketService().insertItem(i,itList);
			
			HttpSession session=request.getSession();
			String msg="";
			if(result>0) {
				msg="신상품등록완료";
			}else {
				msg="상품등록실패";
			}
			
			session.setAttribute("alertMsg", msg);
			response.sendRedirect(request.getContextPath()+"/list.mk");
		}
		
		
	
	}

}