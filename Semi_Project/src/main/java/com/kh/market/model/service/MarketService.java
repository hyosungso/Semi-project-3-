package com.kh.market.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.market.model.dao.MarketDao;
import com.kh.market.model.vo.Item;
import com.kh.market.model.vo.ItemAttachment;

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
		
		JDBCTemplate.close(conn);
		return itemCode;
	}

	public ArrayList<Category> selectCategory() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> cLsit=new MarketDao().selectCategory(conn);
		
		JDBCTemplate.close(conn);
		return cLsit;
	}

	public int insertItem(Item i, ArrayList<ItemAttachment> itList) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MarketDao().insertItem(i,conn);
		
		int result2= new MarketDao().insertItemAttachment(conn,itList);
		
		
		
		if(result*result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	public ArrayList<ItemAttachment> selectAttachmentList(int itemNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ItemAttachment> itList=new MarketDao().selectAttachmentList(conn,itemNo);
		
		JDBCTemplate.close(conn);
		
		return itList;
	}

}
