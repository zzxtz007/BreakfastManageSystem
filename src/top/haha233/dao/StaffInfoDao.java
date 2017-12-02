package top.haha233.dao;

import top.haha233.entity.StaffInfo;

public interface StaffInfoDao
{
	boolean login(StaffInfo staffInfo);
	boolean save(StaffInfo staffInfo);
}
