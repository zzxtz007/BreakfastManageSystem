package top.haha233.dao;

import top.haha233.entity.OrderMain;

import java.util.ArrayList;

public interface OrderMainDao
{
	OrderMain queryById(Integer id);
	ArrayList<OrderMain> queryAll();
	Boolean save(OrderMain orderMain);

}
