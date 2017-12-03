package top.haha233.dao;

import top.haha233.dao.impl.*;

public class DaoFactory {

	public static StaffTypeDao getStaffTypeDaoImpl() {
		return new StaffTypeDaoImpl();
	}

	public static StaffInfoDao getStaffInfoDaoImpl() {
		return new StaffInfoDaoImpl();
	}

	public static FoodTypeDao getFoodTypeDaoImpl() {
		return new FoodTypeDaoImpl();
	}

	public static FoodDao getFoodDaoImpl() {
		return new FoodDaoImpl();
	}

	public static OrderMainDao getOrderMainDaoImpl() {
		return new OrderMainDaoImpl();
	}
}
