package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Community;

public interface CommunityBiz {
	public List findAll();
	
	public Community findByCommunityNo(int commNo);
}
