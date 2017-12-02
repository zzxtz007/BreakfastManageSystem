package top.haha233.entity;

import java.sql.Date;

public class OrderMain {
	private int id;
	private StaffInfo staffInfo;
	private Date createDate;
	private int isdelete;

	public OrderMain() {
	}

	public OrderMain(int id, StaffInfo staffInfo, Date createDate, int isdelete) {
		this.id = id;
		this.staffInfo = staffInfo;
		this.createDate = createDate;
		this.isdelete = isdelete;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public StaffInfo getStaffInfo() {
		return staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
}
