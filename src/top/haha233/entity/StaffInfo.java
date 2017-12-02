package top.haha233.entity;

public class StaffInfo {
	private int id;
	private String name;
	private String username;
	private String password;
	private StaffType staffType;
	private int isdelete;

	public StaffInfo() {
	}

	public StaffInfo(int id, String name, String username, String password, StaffType staffType, int isdelete) {
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.staffType = staffType;
		this.isdelete = isdelete;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public StaffType getStaffType() {
		return staffType;
	}

	public void setStaffType(StaffType staffType) {
		this.staffType = staffType;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
}
