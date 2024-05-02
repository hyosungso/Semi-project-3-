package com.kh.market.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.market.model.vo.Item;

public class MarketDao {

	private Properties prop = new Properties();
	
	public MarketDao() {
		String filePath=MarketDao.class.getResource("/resources/sql/market-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Item> selectItemList(Connection conn) {
		ResultSet rset=null;
		Statement stmt=null;
		ArrayList<Item> list= new ArrayList<>();
		String sql=prop.getProperty("selectItemList") ;
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			while(rset.next()) {
				list.add(new Item(rset.getInt("ITEM_CODE"),
						rset.getString("CATEGORY_NAME"),
						rset.getInt("PRICE"),
						rset.getString("ITEM_NAME")
						));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		
		
		
		return list;
	}

}
