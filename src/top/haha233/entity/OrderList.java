package top.haha233.entity;

public class OrderList
{
	private int id;
	private OrderMain orderMain;
	private Food food;
	private int number;
	private int isdelete;

	public OrderList()
	{
	}

	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public OrderMain getOrderMain()
	{
		return orderMain;
	}

	public void setOrderMain(OrderMain orderMain)
	{
		this.orderMain = orderMain;
	}

	public Food getFood()
	{
		return food;
	}

	public void setFood(Food food)
	{
		this.food = food;
	}

	public int getIsdelete()
	{
		return isdelete;
	}

	public void setIsdelete(int isdelete)
	{
		this.isdelete = isdelete;
	}
}
