package com.kh.market.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.market.model.vo.Component;
import com.kh.market.model.vo.Item;
import com.kh.market.model.vo.ItemAttachment;

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
						rset.getInt("DISCOUNT"),
						rset.getString("ITEM_NAME"),
						rset.getString("THUMBNAIL")
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

	public Item selectItem(int itemNo, Connection conn) {
		ResultSet rset= null;
		PreparedStatement pstmt=null;
		Item i=null;
		String sql=prop.getProperty("selectItem");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				i=(new Item(
						rset.getString("CATEGORY_NAME"),
						rset.getInt("PRICE"),
						rset.getInt("discount"),
						rset.getString("ITEM_NAME"),
						rset.getString("STORAGE_METHOD"),
						rset.getInt("ITEM_CODE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return i;
	}

	
		


	public ArrayList<Category> selectCategory(Connection conn) {
		ResultSet rset=null;
		Statement stmt=null;
		ArrayList<Category> cList=new ArrayList<>();
		String sql = prop.getProperty("selectCategory");
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			while(rset.next()) {
				cList.add(
						new Category(
								rset.getInt("CATEGORY_NO")
								,rset.getString("CATEGORY_NAME")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cList;
	}

	public int insertItem(Item i, Connection conn) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("insertItem");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, i.getCategory());
			pstmt.setString(2, i.getItemName());
			pstmt.setInt(3, i.getPrice());
			pstmt.setInt(4, i.getDiscount());
			pstmt.setString(5, i.getStorageMethod());
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertItemAttachment(Connection conn, ArrayList<ItemAttachment> itList) {
		int result=1;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertItemAttachment");
		try {
		
			for(ItemAttachment it : itList) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, it.getOriginName());
				pstmt.setString(2, it.getChangeName());
				pstmt.setString(3, it.getFilePath());
				pstmt.setInt(4, it.getFileLev());
				
				
				result*=pstmt.executeUpdate();
				
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ItemAttachment> selectAttachmentList(Connection conn, int itemNo) {
		ResultSet rset=null; 
		PreparedStatement pstmt=null;
		ArrayList<ItemAttachment> itList = new ArrayList<>();
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				itList.add(new ItemAttachment(rset.getInt("FILE_CODE"),
											  rset.getString("ORIGIN_NAME"),
											  rset.getString("CHANGE_NAME"),
											  rset.getString("FILE_PATH")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return itList;
	}

	public int insertComponent(int category, Connection conn, Component c) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("insertComponent");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setDouble(2, c.getCalorie());
			pstmt.setDouble(3, c.getProtin());
			pstmt.setDouble(4, c.getSalt());
			pstmt.setDouble(5, c.getCarbo());
			pstmt.setDouble(6, c.getFat());
			pstmt.setDouble(7, c.getTransFat());
			pstmt.setDouble(8, c.getSaturatedFat());
			pstmt.setDouble(9, c.getChol());
			pstmt.setDouble(10, c.getSugar());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Component selectComponent(Connection conn, int itemNo) {
		ResultSet rset=null;
		PreparedStatement pstmt =null;
		Component c=null;
		String sql = prop.getProperty("selectComponent");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				c=new Component(
						rset.getInt("ITEM_CODE"),
						rset.getInt("CATEGORY_NO"),
						rset.getDouble("PROTIN"),
						rset.getDouble("CARBO"),
						rset.getDouble("CALORIE"),
						rset.getDouble("SALT"),
						rset.getDouble("FAT"),
						rset.getDouble("CHOL"),
						rset.getDouble("SATURATED_FAT"),
						rset.getDouble("SUGAR"),
						rset.getDouble("TRANS_FAT"));
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return c;
	}

	public int deleteItem(Connection conn, int itno) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("deactivateItem");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, itno);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
