package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.Condofee;

public interface CondofeeBiz {
	
	public List findCommunityCondoFee(int commNo);
	
	public void saveOrUpdate(Condofee condofee);

}
