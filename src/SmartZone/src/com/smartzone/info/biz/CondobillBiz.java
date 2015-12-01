package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.User;

public interface CondobillBiz {

	List findCommunityCondoBill(Integer communityno);

	void saveOrUpdate(Condobill condobill);

	List findUserCondoBill(User user);

	Condobill findById(Integer bid);

}