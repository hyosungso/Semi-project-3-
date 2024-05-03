package com.kh.market;

import java.io.File;

import com.kh.market.model.service.MarketService;
import com.oreilly.servlet.multipart.FileRenamePolicy;


public class MarketFileNamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File origin) {
		
		String originName = origin.getName();
		
		int itemCode=new MarketService().newItemCode();
		
		String ext=originName.substring(originName.lastIndexOf("."));
		
		String changeName=itemCode+ext;
		
		
		
		return new File(origin.getParent(),changeName);
		
	}
}
