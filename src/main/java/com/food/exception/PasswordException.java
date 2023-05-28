package com.food.exception;

import java.util.logging.Logger;

public class PasswordException extends Exception
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String errorCode="PasswordException";
	
	public PasswordException(String message,String error)
	{
		super(message);	
	}
	public String getErrorCode()
	{
		return errorCode;
	}
}