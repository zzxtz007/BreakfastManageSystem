package top.haha233.dao.impl;

import top.haha233.dao.FoodTypeDao;
import top.haha233.dao.util.MySqlJDBC;
import top.haha233.entity.FoodType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author ICE_DOG
 */
public class FoodTypeDaoImpl implements FoodTypeDao {
	@Override
	public ArrayList<FoodType> queryAll() {
		//language=MySQL
		String sql = "SELECT\n" +
				"  id,\n" +
				"  name,\n" +
				"  isdelete\n" +
				"FROM food_type WHERE isdelete =1";
		Object o = MySqlJDBC.execute(sql,2);
		if (o==null){
			MySqlJDBC.clossConnection();
			return null;
		}
		ArrayList<FoodType> foodTypes = new ArrayList<>();
		ResultSet rs = (ResultSet) o;
		try {
			while (rs.next()){
				FoodType f= new FoodType();
				f.setId(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setIsdelete(rs.getInt(3));
				foodTypes.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		MySqlJDBC.clossConnection();
		return foodTypes;
	}

	@Override
	public FoodType queryById(Integer id) {
		//todo
		return null;
	}

	@Override
	public Boolean save(FoodType foodType) {
		//todo
		return null;
	}
}
