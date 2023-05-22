package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.model.User;
import com.food.util.ConnectionUtil;
import com.food.validation.Validation;

public class CustomerImpl implements CustomerDao{
	Validation valid=new Validation();
	public static final String display="select id,first_name,last_name,email,user_name from members where id=? ";
	public static final String show="select id,first_name,last_name,email,user_name from members";
	public static final String update="update members set first_name=?,last_name=? email=?,user_name-?,password=Md5(?);";
public CustomerImpl()
{
	
}
//Update Customer
public boolean updateCustomer(User user) throws SQLException
{
	
	boolean rowUpdated = false;
	boolean fname=valid.nameValidation(user.getFirstName());
	boolean lname=valid.nameValidation(user.getLastName());
	boolean email=valid.emailValidation(user.getEmail());
	boolean uname=valid.emailValidation(user.getUserName());
	boolean password=valid.passwordValidation(user.getPassword());
			if(fname==true&&lname==true&&email==true&&uname==true&&password==true)
			{
	       try { Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(update);
		    ps.setString(1, user.getFirstName());
		    ps.setString(2, user.getLastName());
		    ps.setString(3, user.getEmail());
		    ps.setString(4, user.getUserName());
            ps.setString(5, user.getPassword());
            ps.setInt(1, user.getId());
            rowUpdated=ps.executeUpdate()>0;
	       }catch(SQLException ex)
	       {
	    	 ex.printStackTrace();  
	       }
	}else
		System.out.println("Invalid");
	return rowUpdated;
	
}

/*@Override
public List<User> selectAllCustomer() {
	// TODO Auto-generated method stub
	List<User> user=new ArrayList<>();
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(show);){
		System.out.println(ps);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			int id=rs.getInt("id");
			String fname=rs.getString("fname");
			String lname=rs.getString("lname");
			String email=rs.getString("email");
			String uname=rs.getString("uname");
			user.add(new User(id, fname, lname, email, uname));
		}
	}catch(SQLException e)
	{
		printSQLException(e);
	}
	return user;
}*/
//Select Customer By Id
@Override
public User selectCustomer(int id) {
	// TODO Auto-generated method stub
	User user=null;
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(display);)
	{
		ps.setInt(1, id);
		System.out.println(ps);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			String fname=rs.getString("fname");
			String lname=rs.getString("lname");
			String email=rs.getString("email");
			String uname=rs.getString("uname");
			String password=rs.getString("password");
			user=new User(fname, lname, email, uname, password);			
		}
	}catch(SQLException ex)
	{
	ex.printStackTrace();		
	}
	
	return user;
}
	
private void printSQLException(SQLException ex)
{
	for (Throwable e : ex) {
		if (e instanceof SQLException) {
			e.printStackTrace(System.err);
			System.err.println("SQLState: " + ((SQLException) e).getSQLState());
			System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
			System.err.println("Message: " + e.getMessage());
			Throwable t = ex.getCause();
			while (t != null) {
				System.out.println("Cause: " + t);
				t = t.getCause();
			}
		}
	}
}
@Override
public int findCustomerId(String name) throws SQLException {
	// TODO Auto-generated method stub
	Connection con=ConnectionUtil.init();
	boolean userName=valid.nameValidation(name);
	if(userName==true)
	{
		String findId="select id from members where user_name=?";
		PreparedStatement ps=con.prepareStatement(findId);
		ps.setString(1, name);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			int id=rs.getInt(1);
			return id;
		}
	}else
			System.out.println("Invalid");
	return 0;	
}
}
