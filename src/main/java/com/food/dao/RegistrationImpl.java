package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.food.model.User;
import com.food.util.ConnectionUtil;
import com.food.validation.Validation;

public class RegistrationImpl  implements RegistrationDao{

	Validation valid=new Validation();
	@Override
	public int insertUserDetails(User user) {
		// TODO Auto-generated method stub
		int status=0;
		Connection con=ConnectionUtil.init();			
		String insert="insert into members(first_name,last_name,email,user_name,password)values(?,?,?,?,?)";
		PreparedStatement ps;
			try {
				ps = con.prepareStatement(insert);
				ps.setString(1,user.getFirstName());
				ps.setString(2, user.getLastName());
				ps.setString(3, user.getEmail());
				ps.setString(4, user.getUserName());
				ps.setString(5, user.getPassword());
			    status = ps.executeUpdate();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		          return status;
	}

	@Override
	public User getUserDetails(String userName, String password) {
		// TODO Auto-generated method stub
		User user=new User();
		Connection con = null;
				con = ConnectionUtil.init();
		String get="select * from members where user_name=? and password=?";
		PreparedStatement ps;
			
				try {
					ps = con.prepareStatement(get);
					ps.setString(1,userName);
					ps.setString(2, password);
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
						user.setId(rs.getInt(1));
						user.setFirstName(rs.getString(2));
						user.setLastName(rs.getString(3));
						user.setEmail(rs.getString(4));
						user.setUserName(rs.getString(5));
						user.setPassword(rs.getString(6));	
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return user;
	}
	
	
}
