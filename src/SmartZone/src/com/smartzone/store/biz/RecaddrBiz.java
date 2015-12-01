package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.info.entity.User;
import com.smartzone.store.entity.Recaddr;

public interface RecaddrBiz {

	public void add(Recaddr recaddr);

	public List findByUser(User u);

	public void delete(Recaddr recaddr);

	public boolean isExsits(Recaddr recaddr);

	public Recaddr findById(Integer rid);

	public Recaddr usedByOrder(Integer rid);

}