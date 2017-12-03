package top.haha233.service.impl;

import top.haha233.dao.DaoFactory;
import top.haha233.entity.FoodType;
import top.haha233.service.FoodTypeService;
import top.haha233.service.util.SuperInfo;

import java.util.ArrayList;

public class FoodTypeServiceImpl implements FoodTypeService {
	@Override
	/**
	 * 此SuperInfo含有ArrayList
	 *  foodTypes
	 */
	public SuperInfo showAllFoodType() {
		SuperInfo si = new SuperInfo();
		ArrayList<FoodType> foodTypes = DaoFactory.getFoodTypeDaoImpl().queryAll();
		if (foodTypes==null){
			si.setRet(1);
		}
		si.setLists(foodTypes);
		return si;
	}
}
