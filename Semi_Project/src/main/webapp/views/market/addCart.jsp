<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.market.model.vo.Item"%>
<%@page import="com.kh.market.model.service.MarketService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String id= request.getParameter("id"); /* 카트에 넣을 상품 파라미터 받기  */
 	int intId =Integer.parseInt(id);
 	if(id==null || id.trim().equals("")){
 		response.sendRedirect("index.jsp");
 		return;
 		}
 	
 		Item item = new MarketService().selectItem(Integer.parseInt(id));
		if(item==null){
			response.sendRedirect("index.jsp");
		}
		
		ArrayList<Item> itemList = new MarketService().selectItemList("topSal");
		Item items= new Item();
		for (int i=0; i<itemList.size();i++){	/* 아이템 목록 조회한 후 반복문으로 id값이 같은 상품을 찾아서 나오면 break */
			items=itemList.get(i);
			if(items.getItemCode()==intId){
				break;
			}
		}
		@SuppressWarnings("unchecked")
		ArrayList<Item> list= (ArrayList<Item>)session.getAttribute("cartlist"); /* session에 장바구니 목록 저장 */
		if(list==null){
			list= new ArrayList<Item>(); 
			session.setAttribute("cartlist",list);
		}
		
		int cnt=0;
		int quantity=Integer.parseInt(request.getParameter("quantity")); /* 입력한 수량 만큼 쇼핑리스트에 추가 */
		Item itemQnt = new Item();
		for (int i=0; i< list.size(); i++ ){ /* 반복문으로 list에 있는 Item 정보 가져오기 */
			itemQnt = list.get(i);
			if(itemQnt.getItemCode()==intId){ /* 만약 list에 있는 물품과 파라미터로 받아온 물품의 아이디 값이 같다면 주문 수량 추가 */
				cnt++;
				int orderQuantity = itemQnt.getQuantity()+quantity;
				itemQnt.setQuantity(orderQuantity);
			}
		}
		if(cnt==0){ /* 만약 이전에 없던 상품이 카트에 들어오면 주문 수량만큼 카트에 추가 */
			items.setQuantity(quantity);
			list.add(items);
		}
		
		response.sendRedirect(request.getContextPath()+"/detail.mk?itno="+intId);
		
 		%>
