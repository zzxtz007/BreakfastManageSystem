package top.haha233.service;

import top.haha233.service.impl.FoodServiceImpl;
import top.haha233.service.impl.FoodTypeServiceImpl;

public class ServiceFactory {
	private static FoodTypeService foodTypeService;
	private static FoodService foodService;

	public static FoodTypeService getFoodTypeServiceImpl() {
		if (foodTypeService == null) {
			foodTypeService = new FoodTypeServiceImpl();
		}
		return foodTypeService;
	}
	public static FoodService getFoodServiceImpl() {
		if (foodService == null) {
			foodService = new FoodServiceImpl();
		}
		return foodService;
	}
}
