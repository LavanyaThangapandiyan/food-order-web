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
	public void insertUserDetails(User user) {
		// TODO Auto-generated method stub
		
		Connection con=ConnectionUtil.init();			
		boolean fname=valid.nameValidation(user.getFirstName());
		boolean lname=valid.nameValidation(user.getLastName());
		boolean uname=valid.nameValidation(user.getUserName());
		boolean email=valid.emailValidation(user.getEmail());
		boolean pwd=valid.passwordValidation(user.getPassword());
		if(fname==true&&lname==true&&uname==true&&email==true&&pwd==true)
		{
			try {
				String insert="insert into members(first_name,last_name,email,user_name,password)values(?,?,?,?,Md5(?))";
				PreparedStatement ps;
				ps = con.prepareStatement(insert);
				ps.setString(1,user.getFirstName());
				ps.setString(2, user.getLastName());
				ps.setString(3, user.getEmail());
				ps.setString(4, user.getUserName());
				ps.setString(5, user.getPassword());
				int executeUpdate = ps.executeUpdate();
				System.out.println(executeUpdate);
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}else
				System.out.println("Invalid ");		
		         
	}

	@Override
	public User getUserDetails(String userName, String password) {
		// TODO Auto-generated method stub
		User user=new User();
		Connection con = null;
				con = ConnectionUtil.init();
		String get="select * from members where user_name=? and password=Md5(?)";
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
