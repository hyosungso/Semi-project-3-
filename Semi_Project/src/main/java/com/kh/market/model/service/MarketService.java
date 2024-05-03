package com.kh.market.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.market.model.dao.MarketDao;
import com.kh.market.model.vo.Item;

public class MarketService {

	public ArrayList<Item> selectItemList() {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<Item> list = new MarketDao().selectItemList(conn);
		
		JDBCTemplate.close(conn);
		
		
		return list;
	}

	public Item selectItem(int itemNo) {
		Connection conn=JDBCTemplate.getConnection();
		Item itme= new MarketDao().selectItem(itemNo, conn);
		
		JDBCTemplate.close(conn);
				
		return itme;
	}

	public int newItemCode() {
		Connection conn=JDBCTemplate.getConnection();
		int itemCode= new MarketDao().newItemCode(conn);
		
		JDBCTemplate.commit(conn);
		return itemCode;
	}

	public ArrayList<Category> selectCategory() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> cLsit=new MarketDao().selectCategory(conn);
		
		JDBCTemplate.close(conn);
		return cLsit;
	}

}
