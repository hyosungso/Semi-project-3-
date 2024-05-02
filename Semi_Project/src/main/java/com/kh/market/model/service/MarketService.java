package com.kh.market.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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

}
