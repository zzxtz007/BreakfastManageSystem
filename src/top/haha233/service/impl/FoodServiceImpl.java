package top.haha233.service.impl;

import top.haha233.dao.DaoFactory;
import top.haha233.entity.Food;
import top.haha233.entity.FoodType;
import top.haha233.service.FoodService;
import top.haha233.service.util.SuperInfo;

import java.util.ArrayList;

public class FoodServiceImpl implements FoodService {
	@Override
	public SuperInfo getFoodsByFoodTypeId(String id) {
		SuperInfo si = new SuperInfo();
		if ("".equals(id)){
			si.setRet(1);
		}
		try {
			Integer typeid = Integer.parseInt(id);
			FoodType foodType = new FoodType();
			foodType.setId(typeid);
			ArrayList<Food> foods = DaoFactory.getFoodDaoImpl().queryByType(foodType);
			si.setLists(foods);
		}catch (Exception e){
			e.printStackTrace();
			si.setRet(2);
		}
		return si;
	}
}
