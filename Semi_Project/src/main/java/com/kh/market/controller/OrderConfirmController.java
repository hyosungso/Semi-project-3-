package com.kh.market.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.market.model.service.MarketService;
import com.kh.market.model.vo.Order;

/**
 * Servlet implementation class OrderConfirmController
 */
@WebServlet("/views/market/confirm.mk")
public class OrderConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String shipping_cartId="";
		String shipping_name="";
		Date shipping_shippingDate=null;
		String shipping_postNumber="";
		String shipping_address="";
		
		
		Cookie[] cookies=request.getCookies();
		
		
		if(cookies !=null){
			for(int i = 0; i<cookies.length;i++){
				Cookie thisCookie= cookies[i];
				String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")) {
				shipping_cartId=thisCookie.getValue();}
			if(n.equals("Shipping_name")) {
				shipping_name=thisCookie.getValue();}
			if(n.equals("Shipping_shippingDate")) {
				shipping_shippingDate=Date.valueOf(thisCookie.getValue());}
			if(n.equals("Shipping_postNumber")) {
				shipping_postNumber=thisCookie.getValue();}
			if(n.equals("Shipping_address")) {
				shipping_address=thisCookie.getValue();}
			}
			
		}
		
		Order o= new Order(
				shipping_cartId,
				shipping_name,
				shipping_shippingDate,
				shipping_postNumber,
				shipping_address);
		
		int result = new MarketService().insertOrder(o);
		
		HttpSession session = request.getSession();
		
		if (result>0) {
			response.sendRedirect(request.getContextPath()+"/views/market/thanksCustomer.jsp");
			session.setAttribute("alertMsg", "상품구매에 성공하였습니다.");
		}else {
			session.setAttribute("alertMsg", "상품구매에 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/views/market/shippingInfo.jsp?cartId="+shipping_cartId);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
