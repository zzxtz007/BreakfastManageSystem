package top.haha233.dao.impl;

import top.haha233.dao.FoodDao;
import top.haha233.dao.util.MySqlJDBC;
import top.haha233.entity.Food;
import top.haha233.entity.FoodType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FoodDaoImpl implements FoodDao {
	@Override
	public ArrayList<Food> queryAll() {
		//todo
		return null;
	}

	@Override
	public ArrayList<Food> queryByType(FoodType foodType) {
		//todo
		String sql = "SELECT\n" +
				"  id,\n" +
				"  name,\n" +
				"  price,\n" +
				"  type_id,\n" +
				"  isdelete\n" +
				"FROM food WHERE isdelete=1 AND type_id = ?";
		ArrayList p = new ArrayList();
		p.add(foodType.getId());
		Object o = MySqlJDBC.execute(sql,p,2);
		if (o==null){
			return null;
		}
		ResultSet rs  = (ResultSet) o;
		ArrayList<Food> foods = new ArrayList<>();
		try {
			while (rs.next()) {
				Food f = new Food();
				f.setId(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setPrice(rs.getFloat(3));
				f.setFoodType(new FoodType(rs.getInt(4)));
				f.setIsdelete(rs.getInt(5));
				foods.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MySqlJDBC.clossConnection();
		}
		return foods;
	}

	@Override
	public Boolean update(Food food) {
		//todo
		return null;
	}

	@Override
	public Boolean delete(Food food) {
		//todo
		return null;
	}

	@Override
	public Boolean save(Food food) {
		//todo
		return null;
	}
}
