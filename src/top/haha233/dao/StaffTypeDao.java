package top.haha233.dao;

import top.haha233.entity.StaffType;

import java.util.ArrayList;

public interface StaffTypeDao
{
	StaffType queryById();
	ArrayList<StaffType> queryAll();
}
