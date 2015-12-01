package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.User;

public interface CarbillBiz {

	Carbill findByCarportAndUser(CarPort carport, User u);

	void newbill(Carbill carbill);

	List getUserUnpayedBill(User u);

	List getUserBill(User u);

	void pay(Carbill carbill);

	List findCommunityBills(Integer communityno);

}