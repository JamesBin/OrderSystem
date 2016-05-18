package com.front.model;
import com.jfinal.plugin.activerecord.Model;

/**
 * User model.
mysql> desc user;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| username | varchar(255) | NO   |     | NULL    |                |
| password | varchar(255) | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+

 */
@SuppressWarnings("serial")
public class User extends Model<User> {
	public static final User user= new User();
	
/*	public Page<Blog> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from blog order by id asc");
	}
	public void save() {
		this.getModel(User.class).save();
	}*/
}
