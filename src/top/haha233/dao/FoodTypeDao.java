package top.haha233.dao;

import top.haha233.entity.FoodType;

import java.util.ArrayList;

public interface FoodTypeDao
{
	ArrayList<FoodType> queryAll();

	FoodType queryById(Integer id);

	Boolean save(FoodType foodType);
}
