package top.haha233.entity;

public class Food {
	private int id;
	private String name;
	private float price;
	private FoodType foodType;
	private int isdelete;

	public Food() {
	}

	public Food(int id, String name, float price, FoodType foodType, int isdelete) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.foodType = foodType;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public FoodType getFoodType() {
		return foodType;
	}

	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
}
