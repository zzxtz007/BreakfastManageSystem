package top.haha233.entity;

public class StaffType {
	private int id;
	private String name;
	private int isdelete;

	public StaffType() {
	}

	public StaffType(int id, String name, int isdelete) {
		this.id = id;
		this.name = name;
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

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	@Override
	public String toString() {
		return "StaffType{" +
				"id=" + id +
				", name='" + name + '\'' +
				", isdelete=" + isdelete +
				'}';
	}
}
