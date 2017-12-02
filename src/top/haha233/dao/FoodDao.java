package top.haha233.dao;

import top.haha233.entity.Food;
import top.haha233.entity.FoodType;

import java.util.ArrayList;

public interface FoodDao
{
	ArrayList<Food> queryAll();

	ArrayList<Food> queryByType(FoodType foodType);

	Boolean update(Food food);

	Boolean delete(Food food);

	Boolean save(Food food);
}
